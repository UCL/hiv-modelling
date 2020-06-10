

* === ABOUT THIS PROGRAM

This is the unified hiv synthesis program for sub saharan africa.

All programs run on legion/myriad for presentations/publications will use this program.

When running to address a specific research question the only parts of the program that may differ from this core program are 
sections ENHANCEMENTS / INTERVENTIONS in 2020 and WHETHER TO KEEP GOING BEYOND 2020.  In addition the section PARAMETER VALUES SAMPLED 
can be replaced by reading an existing set of values for these.  

Proposed approach to new evaluations:  For example, consider the evaluation of 6 potential art strategies.  Suggest we use two approaches for the 
evaluation. 
1. (as currently programmed below as of 29 aug 2019) the reference (comparator) art strategy is option 0, for each run there is a possibility of 
each of the 6 alternatives as option 1.  Several evaluations for different questions can be evaluated simultaneously. A regression model of 
difference between option 1 and 0 (on some outcome such as incidence, DALYS, net DALYs) on the parameters relevant for each evaluation is fitted on 
the outputs to isolate the effects for each evaluation.  (an alterative to this that we could consider is to run 2 random "option 1s" for each run
rather than always run an option 0 (no new intervention)
2. all 6 options are run simultaneously for each model run (options 0 to 5), with no other interventions differing across these 6 options. The 
programming of other interventions means that we are able to consider this comaparison against a background of different future changes in other
interventions but, unlike in approach 1 above, these other interventions would be the same across the 6 options. 
This latter aapproach (2) is the approach we have been using for several years.  Running both approaches 1 and 2 will help us ascertain whether approach 1 
has potential to replace approach 2 in future.



* === ANDREW UPDATES

- consider:  rr_sw_age_1525 = 1.50
- consider: if 15 <= age1 < 18 and life_sex_risk = 2 and e < 0.010 then sw1=1 
			if 18 <= age1 < 20 and life_sex_risk = 2 and e < 0.010 then sw1=1 
			if 20 <= age1 < 30 and life_sex_risk = 2 and e < 0.010 then sw1=1 
			if 30 <= age1 < 50 and life_sex_risk = 2 and e < 0.010 then sw1=1 

			if 15 <= age1 < 18 and life_sex_risk = 3 and e < 0.10 then sw1=1 
			if 18 <= age1 < 20 and life_sex_risk = 3 and e < 0.10 then sw1=1 
			if 20 <= age1 < 30 and life_sex_risk = 3 and e < 0.10 then sw1=1 
			if 30 <= age1 < 50 and life_sex_risk = 3 and e < 0.10 then sw1=1 
  so highest newp in age group 15-25 women as in red_a_15w

- once we are happy with this program I will start to run it using both approaches 1 and 2 above - for approach 2 the first evaluation I will
  focus on is reg_option and art_monitoring strategy (use of measruement of tenofovir levels)

- some changes to testing cose at: if t ge 2 and date_start_testing <= caldate{t} and prep{t-1}=0

- change distribution of an_lin_incr_test and test rate plataeu

- introduction of eff_max_freq_testing and effective rate of other parameters so we can distinguish between values originally set and
values changed to after 2020

- inserted lines on prob_pregnancy_b = prob_pregnancy_base

- added lines: if caldate{t} > 2016 and 10 le age{t-1} lt 15 then prob_circ = (2016-mc_int)*circ_inc_rate etc

- round off some parameter values

- remove the &j from end of several variables created after the main model part as these dont need to be arrays I dont think

- question for loveleen: why is onart_iicu defined later after we have lines if onart&j = 1 or int_clinic_not_aw = 1 then do
  why not define it higher up ? I think code works as is so perhaps best just not to change 

- changed distribution of rate_choose_stop_prep 
- changed distribution of circ_inc_rate as not enough variation in prop circumcised by 2019 
- change so that all variable names with age ranges the age range ends with 4 or a 9 rather than a 5 or a 0

- define s_alive_w s_alive_m numbers of adults age 15+ (including over age 65)
- changed newp_factor to 0.25 * as prevalence outputs too high
- added in new variables to drop statement (&l drop statement) so that we drop these variables over time - was slowing the running down
- changed newp_factor to 0.5 * as prevalence outputs too high
- still dont know why some runs are not running

- changed from 100 to 10000 individuals to run on legion
- removed run2
- changed mulitplier for newp_factor = 1 *(  from 3 * as prevalence distribution was high
- saved base_rate_sw_ in keep statement and output file
- renamed cald_ as cald in output file
- changes made over past 2 days include as below
- some typos in s_ resolved 
- change to code for rred_a dependent on m15r ets
- small changes / additions to keep statement
- renaming of t_ variables so they match with renaming to s_ in proc univariate
- check that age gender balance in newp now seems to be working ok
- checked that prevalence of sw seems reasonable (but we should maybe consider sampling rate of stopping)


* === LOVELEEN UPDATES SINCE LAST SAVED
Updated code for art initiators
Added if statement to resolve error in log file: if s_s_w_newp>0 then cum_ratio_newp_mw = s_s_m_newp / s_s_w_newp
Added 'if xx gt 0' in multiple places to resolve errors in log file
Removed duplicates from proc uni (all prep_infected vars plus a few others)
Add in 'if t ge 2' wherever needed
Added s_hiv1549_ to keep statement
Addition to anc code. Please check 'LBM Aug19';


* === LOVELEEN NOTES TO SELF



* === ANDREW NOTES TO SELF

to do before starting testing in preparation for runs:

- sample rate of leaving sex work 

- vmmc needs to depend on age

- conceive of an additional average annual cost per hiv diagnosed person (without sv = 1) to help to improve all below: 
  incr_adh_2020 decr_hard_reach_2020 decr_prob_loss_at_diag_2020 decr_rate_lost_2020 decr_rate_lost_art_2020
  incr_rate_return_2020 incr_rate_return_2020 incr_rate_restart_2020 incr_rate_init_2020  decr_rate_int_choice_2020  

- consider extra costs testing sw - currently sw_test_6mthly_2020 intervention is assumed to cost only the cost of the extra tests 
- more generally, have included an annual cost for people with diagnosed hiv and sv ne 1 to improve cascade but have not included additional costs beyond
  unit costs for increased switch of increased viral load measure done, prep or circumcision - still no specific costs for lower newp / more condom use


- consider that cascade of care enhancements can be general or in sex workers only 


 







* ==== VALE NOTES TO SELF







* ==== DOCUMENTATION NOTES AND IDEAS


- new outputs:  AIDS death rate by CD4 at start of ART and ahd{t} in first period










* ==== GENERAL NOTES AND CONSIDERATIONS  

- note that the scale factor to scale up to a population of 10 million (say) will differ according to inc_cat
- perhaps need to scale up per run according to t_alive1565 

- abort early based on plausible gender-specific prevalence

- infected_prep applies for starting prep when in primary, but not when starting prep due to test sensitivity 

- take account of fact that in namsal it took longer than 1 year for people with > 1 million VL at baseline to decline to < 50
(but less time to decline to < 1000) - regardless of regimen - not sure that adding this will add anything but keep considering

- could add in possibility of greater rate of initiation of art in hiv+ people who are diagnosed but off art (pop_wide_tld) due to easier access
but will leave out for now to err on side of being conservative about the strategy

- for country calibrations will calibrate to past trend in pop size and hiv prevalence and then current values of the wide range of measures

- add sw modelling to this and run sex worker interventions at same time ? (include fsw interventions so this can show generalisability of sex worker 
modelling done in zim context) - or is it better to stick to country specific models for that ?  

- can use this exact multiple enhancements program in the context of specific country contexts

- when these runs are done can add new intervetnions to evaluate - but need to add only one new intervention at a time and add it to the overall 
number of runs - if try to add more than one change at the time time we lose the independent sampling of parameters

- what about the fact that the enhancements are a mixture of introducing new strategies and somehow enhancing the extent or effectiveness
of interventions already in place - I think OK so long as all sampling of enhancements is independent

- considered that some interventions can be time limited (esp hiv testing increases) - but decided to keep as is because may be problematic 
to assume a derease again in x years 

- conceive of an additional average annual cost per hiv diagnosed person (without sv = 1) to help to improve all below: 
incr_adh_2020 decr_hard_reach_2020 decr_prob_loss_at_diag_2020 decr_rate_lost_2020 decr_rate_lost_art_2020
incr_rate_return_2020 incr_rate_return_2020 incr_rate_restart_2020 incr_rate_init_2020  decr_rate_int_choice_2020  

- consider higher pr_art_init if diagnosed while on prep

- proposed options: (i) no improvements  (ii) improvements (incl cascade of care, prep, circumcision, condoms,  tld in all on art (can sample from each of the 4 
alternatives below), alternative monitoring strategies of tld art initiators, tld for all men (except if tested �ve and np=0, start tld if np goes >= 1) 
sample these)

- is it plausible that so people have very low adherence to prep and dont re-test within the 3 month period before re-starting (assume they will be 
instructed to take PrEP every day and if they have a break of x days they need to test again) ? 
- how will progress if want to do a new project on kzn ?  add back in demographics and c_score code from kzn 
- keep leigh and gesine involved
- at some point model effect of sti testing on sti ?

- for future consideration: how can prep programs for agyw in KZN assess if they are cost effective ?  consider:
a. proportion of (re-)starters testing +ve within 3 months (the higher, the more cost effective)  b. proportion of people on prep > 3 months testing 
+ve per 3 months (the lower, the more cost effective)  vary adherence, propensity to want to take, elig criteria (fsw only, >= 1 newp, >=2 newp, 
>= 3 newp), incidence in 2017 (which varies anyway), efficacy, predict ce from a, b, cost prep/visits (or will they be equal across KZN ?)
(this applies assing rdt for the first test - proportion of (re-)starters testing +ve within 3 months will vary with window period of first test)
explore metrics for how to monitor prep programmes


;



* libname a 'C:\Users\Andrew Phillips\Documents\My SAS Files\outcome model\unified program\';

* proc printto log="C:\Loveleen\Synthesis model\unified_log";
  proc printto ; * log="C:\Users\Andrew Phillips\Documents\My SAS Files\outcome model\unified program\log";
	


options ps=1000 ls=220 cpucount=4;

data cum_l1; 
if eeee=1;
drop eeee;


data z;

run = uniform(0)*1000000000;  run=round(run,1);
										   
dataset_id=trim(left(run));
call symput('dataset_id',dataset_id);

caldate1=1989;
caldate_never_dot=1989;

* these used after 2020 - code is here so value the same for all people;
_u1 = uniform(0); _u2 = uniform(0); _u3 = uniform(0); _u4 = uniform(0); _u5 = uniform(0); _u6 = uniform(0); _u7 = uniform(0); _u8 = uniform(0);
_u9 = uniform(0); _u10 = uniform(0); _u11 = uniform(0); _u12 = uniform(0); _u13 = uniform(0); _u14 = uniform(0); _u15 = uniform(0); _u16 = uniform(0);
_u17 = uniform(0); _u18 = uniform(0); _u19 = uniform(0); _u20 = uniform(0); _u21 = uniform(0); _u22 = uniform(0); _u23 = uniform(0); _u24 = uniform(0);
_u25 = uniform(0); _u26 = uniform(0); _u27 = uniform(0); _u28 = uniform(0); _u29 = uniform(0); _u30 = uniform(0); _u31 = uniform(0); _u32 = uniform(0);
_u33 = uniform(0); _u34 = uniform(0); _u35 = uniform(0); _u36 = uniform(0); _u37 = uniform(0); _u38 = uniform(0); _u39 = uniform(0); _u40 = uniform(0);
_u41 = uniform(0); _u42 = uniform(0); _u43 = uniform(0); _u44 = uniform(0); _u45 = uniform(0); _u46 = uniform(0); _u47 = uniform(0); _u48 = uniform(0);
_u49 = uniform(0); _u50 = uniform(0); _u51 = uniform(0); _u52 = uniform(0); _u53 = uniform(0); _u54 = uniform(0); _u55 = uniform(0); _u56 = uniform(0);
_u57 = uniform(0); _u58 = uniform(0); _u59 = uniform(0); _u60 = uniform(0); _u61 = uniform(0); _u62 = uniform(0); _u63 = uniform(0); _u64 = uniform(0);


* start of epidemic;
startyr = 1989.25;

newp_seed = 7;  


* PARAMETER VALUES - NOTE THESE ALL GET OVER_WRITTEN BELOW IF SAMPLED;

* SEXUAL BEHAVIOUR;

rbm=4;
ch_risk_diag = 9/13; *overwritten;
ch_risk_diag_newp = 5/6; *overwritten;
ych_risk_beh_newp = .99; *overwritten;
ych2_risk_beh_newp = 1.0; *overwritten;
ych_risk_beh_ep = 1.0; *overwritten;
eprate=0.1; *overwritten;
newp_factor= 6.5; *overwritten;
p_rred_p = 0.20; *overwritten;
p_hsb_p = 0.05; *overwritten;
condom_incr_2020 = 0; * mar19;
exp_setting_lower_p_vl1000 = 0; * exposure to hiv in an external setting where p_vl1000 is lower - during short term out migration followed by return;
external_exp_factor = 1;
rate_exp_set_lower_p_vl1000 = 0;
rr_sw_age_1519 = 1.00;
rr_sw_age_2534 = 0.30;
rr_sw_age_3549 = 0.03;
rr_sw_life_sex_risk_3 = 10;
rr_sw_prev_sw = 10;

* PREGNANCY;

can_be_pregnant=0.95;
prob_pregnancy_base=0.08; *overwritten;
fold_preg1524=2;
fold_preg2534=1.9; 
fold_preg4554=0.2;  
fold_preg5564=0.0;

* TRANSMISSION;

fold_tr= 1.0; *overwritten;
tr_rate_primary = 0.16; 
tr_rate_undetec_vl = 0.001;
fold_change_w = 1.5; *overwritten;
fold_change_yw = 2; *overwritten;
fold_change_sti = 3; *overwritten;
fold_tr_newp = 0.3; 
super_infection = 0; *overwritten;
res_trans_factor_nn = 0.60 ; *overwritten - factor determining extent to which some NN transmitted resistance immediately reverts and is effectively lost;
res_trans_factor_ii = 1; *overwritten;
rate_loss_persistence = 0.04; *overwritten - loss of persistence of tdr - at the moment rate same for each mutation, but rate transmission not same for each mutation; 

* AP 19-7-19 ;
rate_loss_nnres_pmtct_maj = 0.75;  rate_loss_nnres_pmtct_min = rate_loss_nnres_pmtct_maj; * apr 2019 - increased from 0.25 due as part of 
reconciling model with higher proportion of men with viral suppression on art than women, when data are the opposite;



* HIV TESTING ;

date_start_testing = 2003.5; 
date_start_testanc=2003.5;
initial_rate_1sttest = 0;
test_rate_who4=0.10;
test_rate_tb  =0.10;
test_rate_who3=0.05;
rate_testanc_inc=0.0040; *overwritten - malawi aug15 - rate_testanc_inc_a2015=an_lin_incr_test;
hivtest_type=3; *Jul2016 - HIV test type and sensitivity of test;
date_pmtct=2004;
pmtct_inc_rate = 0.20;
np_lasttest=0;  
newp_lasttest=0; 
test_targeting = 1; *overwritten - test_targeting;  
max_freq_testing=1; *overwritten - means cant test more than annually;
incr_test_2020 = 0;
sw_test_6mthly=0;

* CIRCUMCISION;

circ_inc_rate = 0.0015; *overwritten;

mc_int=2008;
test_link_circ=1; 
test_link_circ_prob = 0.05;

* NATURAL PROGRESSION;

mean_sqrtcd4_inf=27.5 ; * mean sqrt CD4 at infection;  
fx = 1.0;  *overwritten - factor determining rate of natural cd4 decline; 
gx=1.0;
fold_incr_who3 = 5;
fold_decr_hivdeath=0.25; * degree to which hiv death rate is lower than aids rate;
fold_change_in_risk_base_rate = 1;
incr_death_rate_adc = 10;
incr_death_rate_tb = 10;
fold_change_ac_death_rate = 1;

* LINKAGE, RETENTION, MONITORING, LOSS, RETURN, INTERRUPTION OF ART AND RESTARTING, ART;

prob_loss_at_diag = 0.4; *overwritten;
prob_lossdiag_adctb = 0.05; *overwritten;
prob_lossdiag_who3e = 0.15; *overwritten;
art_monitoring_strategy = 8; 
rate_lost = 0.04; *overwritten;
prob_lost_art = 0.9; *overwritten;
rate_return = 0.05; *overwritten;
rate_restart = 0.4; *overwritten;
pr_art_init = 0.4; *overwritten;
base_res_test=0;
flr=0;  
third_line=0;
art_intro_date = 2004;
fold_change_mut_risk = 1; *overwritten;
v_min_art=1.0;  
sd_v_art=0.5; 
pr_switch_line = 0.05; *overwritten;
adh_pattern = 2; *overwritten;
red_adh_tb_adc = 0.1; *overwritten - reduced adherence in those with TB disease or active WHO4;
red_adh_tox_pop = 0.05; *overwritten - reduced adherence in those with toxicity;
add_eff_adh_nnrti = 0.10; *overwritten - additional "effective" adh of nnrti due to longer half life;
altered_adh_sec_line_pop = 0.05; *overwritten - better adherence on second line (pi);
adh_effect_of_meas_alert = 0.7; *overwritten;
pir_higher_potency=1; 
adh_nnrti_p5_if_ltp5 = 1;
poorer_cd4rise_fail_nn = -6; *overwritten - adjustment to degree of cd4 change for being on nnrti not pi when nactive <= 2 ;
sd_cd4 = 1.2;* sd of cd4 (on sqrt scale);
sd_measured_cd4 = 1.7; * error added to measured cd4 (on sqrt scale); 
rate_int_choice = 0.01; *overwritten;
rate_int_choice_pre15 = rate_int_choice; * this rate halves after tcur >= 8; 
prob_supply_interrupted=0.003; * drug supply; 
prob_supply_resumed=0.8; * per 3 mths - base 0.8; 
rate_loss_acq_nnm_offart = 0.05;  * informed by consideration of data on proportion of people ART experienced re-initiators with nnrti resistance in padr program;  
prob_nnresmaj_sd_nvp=0.35;
prob_nnresmaj_dual_nvp=0.045; *In SA guidelines in 2010: AZT from 14 weeks, sdNVP + AZT 3hrly during labour, TDF + FTC single dose (stat) after delivery,
								Arrive 2007, meta-analysis, prevalence of nnres 4-8 weeks post partum ( single dose nevirapine+additional post-partum) 0.045,
								22% had resistance mutation to  AZT (8% considering prop>20%), 18% to NVP (4% considering prop>5%) ;
fold_change_tams_risk=1; * fold change tams risk; 
fold_change_151_risk=1; * fold change in 151 risk (high enough rate of development of cross-class nuc resistance ?);
add_cd4_loss_nactive_low = 0;  * additional cd4 loss if nactive <= 1;
is_red_activity=0;  * extent to which number of active drugs is under or over-estimated by interpretation systems;
sd_patient_cd4_rise_art= 0.2; * inter-patient variation in rate of CD4 rise - when CD4 is rising;
clinic_not_aw_int_frac=0.6; *overwritten - fraction of people who are visiting clinic who have interrupted art in whom clinic is not aware (and hence wrongly called virologic failure);
prob_cd4_meas_done=0.85; 
prob_vl_meas_done=0.50; *overwritten;
prob_who3_diagnosed=0.50; 
prob_who4_diagnosed=0.80;
incr_rate_int_low_adh = 1; *overwritten;
prob_return_adc = 0.8; *overwritten;
res_test_6m_if_vlg1000=0;
sd_vl_whb=0.50; * whb relates to whole blood for viral load sample - as used in dbs;
decr_sd_vl_whb=0.05;  * whb relates to whole blood for viral load sample - as used in dbs;
vl_whb_offset= 0.0; * whb relates to whole blood for viral load sample - as used in dbs;
sv_secondline = 1;
switch_for_tox = 0; *overwritten;
higher_newp_less_engagement = 0; *overwritten - are people with more newp less likely to be engaged with care; 
* AP 19-7-19 ;
ntd_risk_dol = 0.0022; * todo - update this when tsepamo results updated ;
dol_higher_potency = 1.5;
* AP 19-7-19 ; 
rel_dol_tox = 1; *overwritten;
zero_3tc_activity_m184 = 0; *overwritten;
zero_tdf_activity_k65r = 0; *overwritten;
hard_reach=0;

* PREP;

* PREP assumed introduced in fsw/agyw 2017 - with level of coverage and retention; 
annual_testing_prep=0.25; *frequency of HIV testing for people on PrEP (1=annual, 0.5= every 6 months, 0.25=every 3 months);
hivtest_type=3; *HIV test type (1=RNA VL test, 3=3rd gen, 4=4th gen);
eff_adh_prep=0.95; *PrEP effectiveness with 100% adherence ; 
factor_prep_adh_older=0.5; * factor determining how much higher adh to prep is in people age > 25 than < 25; 
fold_incr_res_primary=2; *Multiplicative factor increase in risk of developing resistance in people who start PrEP while in primary infection 
						(relative to those in chronic infection) (uncertain what value to choose - 2 is likely an under-estimate given the levels of replication in primary infection);
rate_test_onprep=1.00; *Rate of being tested for HIV whilst on PrEP; * may17  ####  was 0.95 - changed to remove effect of this on number on prep (this will need to be considered again) ;
pr_prep_b=0.75; * 11dec17; *Probability of starting PrEP in people (who are eligible and willing to tak prep) tested for HIV according to the base rate of testing;
prob_prep_restart=1.00; * set to 1 given we have rate_test_restartprep; *Probability of restarting PrEP after discontinuation due to not eligible; * may17;
prob_prep_visit_counsel=0; *Probability of PrEP adherence counselling happening at drug pick-up;
tot_yrs_prep=0;
prob_prep_restart_choice=0.10; * probability of restarting PrEP after discontinuation even when newp>1; 
prepuptake_sw=0.50; *Probability of PrEP uptake if eligible for female sex workers;
prepuptake_pop=0.20; **Probability of PrEP uptake if eligible for general population;
pop_wide_tld_prob_egfr=0.5; * probability per 3 months of getting egfr test when pop_wide_tld_prep=1 when indicated (annually);


* ========== PARAMETER VALUES SAMPLED ;  * these represent both uncertainty over likely fixed biological parameters and variability over settings;

***** population growth  ***LBM Jul19;
* inc_cat; r=uniform(0); if r < 0.33 then inc_cat = 1; if 0.33 <= r < 0.66 then inc_cat = 2; if 0.66 <= r then inc_cat=3;

***** Sexual behaviour;
* base_rate_sw; r=uniform(0);  if 0 <= r < 0.25 then base_rate_sw = 0.0020;   if 0.25 <= r < 0.50 then base_rate_sw = 0.0007;   
								 if 0.50 <= r < 0.75 then base_rate_sw = 0.001; if 0.75 <= r then base_rate_sw = 0.0015;   
* base_rate_stop_sexwork;   r=uniform(0); base_rate_stop_sexwork = 0.03; if r < 0.33 then base_rate_stop_sexwork = 0.015;
							 if r > 0.67 then base_rate_stop_sexwork = 0.01;
* sex_beh_trans_matrix_m and sex_beh_trans_matrix_w ;
			e=uniform(0); 
			if e < 1/15 then sex_beh_trans_matrix_m=1;if 1/15 <= e < 2/15 then sex_beh_trans_matrix_m=2;if 2/15 <= e < 3/15 then sex_beh_trans_matrix_m=3; 
			if 3/15 <= e < 4/15 then sex_beh_trans_matrix_m=4;if 4/15 <= e < 5/15 then sex_beh_trans_matrix_m=5;if 5/15 <= e < 6/15 then sex_beh_trans_matrix_m=6; 
			if 6/15 <= e < 7/15 then sex_beh_trans_matrix_m=7;if 7/15 <= e < 8/15 then sex_beh_trans_matrix_m=8;if 8/15 <= e < 9/15 then sex_beh_trans_matrix_m=9; 
			if 9/15 <= e < 10/15 then sex_beh_trans_matrix_m=10; if 10/15 <= e < 11/15 then sex_beh_trans_matrix_m=11;if 11/15 <= e < 12/15 then sex_beh_trans_matrix_m=12;
			if 12/15 <= e < 13/15 then sex_beh_trans_matrix_m=13; if 13/15 <= e < 14/15 then sex_beh_trans_matrix_m=14;if 14/15 <= e < 15/15 then sex_beh_trans_matrix_m=15;
			e=uniform(0); 
			if e < 1/15 then sex_beh_trans_matrix_w=1;if 1/15 <= e < 2/15 then sex_beh_trans_matrix_w=2;if 2/15 <= e < 3/15 then sex_beh_trans_matrix_w=3; 
			if 3/15 <= e < 4/15 then sex_beh_trans_matrix_w=4;if 4/15 <= e < 5/15 then sex_beh_trans_matrix_w=5;if 5/15 <= e < 6/15 then sex_beh_trans_matrix_w=6; 
			if 6/15 <= e < 7/15 then sex_beh_trans_matrix_w=7;if 7/15 <= e < 8/15 then sex_beh_trans_matrix_w=8;if 8/15 <= e < 9/15 then sex_beh_trans_matrix_w=9; 
			if 9/15 <= e < 10/15 then sex_beh_trans_matrix_w=10; if 10/15 <= e < 11/15 then sex_beh_trans_matrix_w=11;if 11/15 <= e < 12/15 then sex_beh_trans_matrix_w=12;
			if 12/15 <= e < 13/15 then sex_beh_trans_matrix_w=13; if 13/15 <= e < 14/15 then sex_beh_trans_matrix_w=14;if 14/15 <= e < 15/15 then sex_beh_trans_matrix_w=15;
* sex_age_mixing_matrix_m;e=uniform(0); if e < 1/6  then sex_age_mixing_matrix_m=1; if 1/6  <= e < 2/6 then sex_age_mixing_matrix_m=2;
										if 2/6 <= e < 3/6  then sex_age_mixing_matrix_m=3; if 3/6 <= e < 4/6  then sex_age_mixing_matrix_m=4;
										if 4/6 <= e < 5/6  then sex_age_mixing_matrix_m=5; if 5/6 <= e        then sex_age_mixing_matrix_m=6;
* sex_age_mixing_matrix_w;e=uniform(0); if e < 1/6  then sex_age_mixing_matrix_w=1; if 1/6  <= e < 2/6 then sex_age_mixing_matrix_w=2;
										if 2/6 <= e < 3/6  then sex_age_mixing_matrix_w=3; if 3/6 <= e < 4/6  then sex_age_mixing_matrix_w=4;
										if 4/6 <= e < 5/6  then sex_age_mixing_matrix_w=5; if 5/6 <= e        then sex_age_mixing_matrix_w=6;* rred_a_p;	r=uniform(0); if r < 0.25 then rred_a_p=1; if 0.25 <= r < 0.50 then rred_a_p=2;  if 0.50 <= r < 0.75 then rred_a_p=3;  if r >= 0.75 then rred_a_p=4; 
* p_rred_p; r=uniform(0); if r < 0.33 then p_rred_p = 0.1; if 0.33 <= r < 0.67 then p_rred_p = 0.3; 
			if 0.67 <= r  then p_rred_p = 0.5;  	
* p_hsb_p; 	r=uniform(0); if r < 0.33 then p_hsb_p = 0.05; if 0.33 <= r < 0.67 then p_hsb_p = 0.1; if 0.67 <= r then p_hsb_p = 0.2;
* newp_factor; newp_factor = 0.01; r=uniform(0); if r < 0.50 then newp_factor = 0.005;
* eprate;	eprate = 0.1* exp(normal(0)*0.25); eprate = round(eprate,0.01);* rate of new long term partners in youngest age group; 
* conc_ep; 	r=normal(0) * 0.6; conc_ep = exp(r); conc_ep = round(conc_ep,0.1);
* ch_risk_diag;  r=uniform(0); if r < 0.25 then ch_risk_diag = 0.7; if 0.25 <= r < 0.5 then ch_risk_diag = 0.8; if 0.5 <= r < 0.75 then ch_risk_diag = 0.9; if 0.8 <= r then ch_risk_diag = 1;
* ch_risk_diag_newp;  r=uniform(0); if r < 0.25 then ch_risk_diag_newp = 0.7; if 0.25 <= r < 0.5 then ch_risk_diag_newp = 0.8; if 0.5 <= r < 0.75 then ch_risk_diag_newp = 0.9; if 0.75 <= r then ch_risk_diag_newp = 1; *mf - aug18;
* ych_risk_beh_newp;  r=uniform(0); if r < 0.25 then ych_risk_beh_newp = 0.95; if 0.25 <= r < 0.50 then ych_risk_beh_newp = 0.90;
			if 0.50 <= r < 0.75 then ych_risk_beh_newp = 0.80; if 0.75 <= r        then ych_risk_beh_newp = 0.70; 
* ych2_risk_beh_newp;  r=uniform(0); if r < 0.05 then ych2_risk_beh_newp = 1/0.96; if 0.05 <= r < 0.1 then ych2_risk_beh_newp = 1/0.99; if 0.1 <= r < 0.9 then ych2_risk_beh_newp = 1.0; if 0.9 <= r < 0.95 then ych2_risk_beh_newp = 0.99; if 0.95 <= r then ych2_risk_beh_newp = 0.96; * dec16 changed from ms4d;
* ych_risk_beh_ep;  r=uniform(0); if r < 0.2 then ych_risk_beh_ep = 1; if 0.2 <= r < 0.4 then ych_risk_beh_ep = 0.99; if 0.4 <= r < 0.6 then ych_risk_beh_ep = 0.95; if 0.6 <= r < 0.8 then ych_risk_beh_ep = 0.90; if 0.8 <= r then ych_risk_beh_ep = 0.85; 
* exp_setting_lower_p_vl1000; exp_setting_lower_p_vl1000 = 0; * exposure to setting with lower p_vl1000 due to migration (and return); 
						r=uniform(0); if r < 0.20 then do; 
						exp_setting_lower_p_vl1000 = 1; * whether in this model run exposure can happen; 
						external_exp_factor = 1 + uniform(0); external_exp_factor = round(external_exp_factor,0.01); * effect of exposure ; 
						rate_exp_set_lower_p_vl1000 = uniform(0) * 0.01 ; rate_exp_set_lower_p_vl1000 = round(rate_exp_set_lower_p_vl1000,0.0001); * rate of exposure;
						end;
***** pregnancy;
* AP 19-7-19 ;
* prob_pregnancy_base;  r=uniform(0); prob_pregnancy_base=0.05 + r*0.09;  
						if inc_cat = 1 then prob_pregnancy_base = prob_pregnancy_base * 1.75 ;if inc_cat = 3 then prob_pregnancy_base = prob_pregnancy_base / 1.75 ;
						prob_pregnancy_base = round(prob_pregnancy_base,0.001);	
***** transmission;

* fold_change_w; r=uniform(0); if r < 0.05 then fold_change_w = 1; if 0.05 <= r < 0.10 then fold_change_w = 1.25; 
					if 0.10 <= r then fold_change_w = 1.5; if 0.70 <= r then fold_change_w = 2; *dec16 changed from ms4d;
* fold_change_yw; fold_change_yw = fold_change_w * 1.333;  fold_change_yw = round(fold_change_yw, 0.01); * so fold_change_yw not sampled but here for convenience;
* fold_change_sti; fold_change_sti=3 * exp(normal(0)*0.3);  fold_change_sti = round(fold_change_sti, 0.1);
* super_infection; u=uniform(0); if u < 0.5 then super_infection=0; if u >= 0.5 then super_infection = 1;

***** testing;

* an_lin_incr_test;   r=uniform(0); if r < 0.25 then an_lin_incr_test = 0.0005 ; if 0.25 <= r < 0.5 then an_lin_incr_test = 0.0100; 
					if 0.5 <= r < 0.75 then an_lin_incr_test = 0.0300 ;  if 0.75  <= r   then an_lin_incr_test = 0.1000;
* date_test_rate_plateau;  r=uniform(0); if r < 0.2  then date_test_rate_plateau = 2011.5; if 0.2  <= r < 0.4  then date_test_rate_plateau = 2013.5; 
			if 0.4  <= r < 0.6  then date_test_rate_plateau = 2015.5; if 0.6  <= r < 0.8 then date_test_rate_plateau = 2017.5; 
 				if 0.8 <= r then date_test_rate_plateau = 2019.5;
* rate_testanc_inc; r=uniform(0); if  r < 0.33 then rate_testanc_inc = 0.030; if 0.33 <= r < 0.66   then rate_testanc_inc = 0.050; if 0.66  <= r then rate_testanc_inc = 0.1; * jul18;
* incr_test_rate_sympt; r=uniform(0); if r < 0.2 then incr_test_rate_sympt = 1.05 ; if 0.2 <= r < 0.4 then incr_test_rate_sympt = 1.10; if 0.4 <= r < 0.6 then incr_test_rate_sympt = 1.15; if 0.6 <= r < 0.8 then incr_test_rate_sympt = 1.20;	if 0.8 <= r then incr_test_rate_sympt = 1.25; 
* max_freq_testing;   r=uniform(0); max_freq_testing =1; if r < 0.20 then max_freq_testing=2; 
* test_targeting;   r=uniform(0); test_targeting =1.25 ; if r < 0.20 then test_targeting = 1.5;

***** natural progression;

* fx;		r=uniform(0);  if r < 0.2 then fx = 0.7; if 0.2 <= r < 0.4 then fx = 0.8; if 0.4 <= r < 0.6 then fx = 0.9; if 0.6 <= r < 0.8 then fx = 1.0;if 0.8 <= r <0.9 then fx = 1.1; if 0.9<= r then fx=1.3; 

***** linkage, retention, monitoring, loss, return, interruption of art and restrating, art;

* adh_pattern; r=uniform(0);  if  r < 0.01 then adh_pattern=98 ;if 0.01 <= r < 0.02 then adh_pattern=105; if 0.02 <= r < 0.05 then adh_pattern=101; 
				if 0.05 <= r < 0.10 then adh_pattern=99; if 0.10 <= r < 0.20 then adh_pattern=1;   if 0.20 <= r < 0.40 then adh_pattern=2;   
				if 0.40 <= r < 0.60 then adh_pattern=3;   if 0.60 <= r < 0.80 then adh_pattern=4; if 0.80 <= r  then adh_pattern=5; 

* AP 19-7-19 - most of these changes to parameters sampled are from trying to get a range of setting scenarios that reflect sub saharan africa;  
* reduced higher values as middle 90 not consistent with phias with those values ; 
* prob_loss_at_diag;  r=uniform(0); if r < 0.25 then prob_loss_at_diag = 0.02; if 0.25 <= r < 0.40 then prob_loss_at_diag = 0.05; 
						if 0.40 <= r < 0.70  then prob_loss_at_diag = 0.15; 	if 0.70 <= r < 0.95  then prob_loss_at_diag = 0.25; 
						if 0.95 <= r   then prob_loss_at_diag = 0.35;   

* AP 19-7-19 ;
* pr_art_init; r=uniform(0); if 0 <= r < 0.25 then pr_art_init = 0.4; if 0.25 <= r < 0.50 then pr_art_init = 0.5; if 0.5 <= r < 0.75 then pr_art_init = 0.6; if 0.75 <= r then pr_art_init = 0.7;	

* rate_lost; r=uniform(0); if r < 0.33 then rate_lost = 0.2; if 0.33 <= r < 0.66 then rate_lost = 0.35; if r >= 0.66 then rate_lost = 0.5;
* prob_lost_art; r=uniform(0); if r < 0.2 then prob_lost_art = 0.5; if 0.2 <= r < 0.4 then prob_lost_art = 0.6; if 0.4 <= r < 0.6 then prob_lost_art = 0.7; if 0.6 <= r < 0.8 then prob_lost_art = 0.8;	if 0.8 <= r then prob_lost_art = 0.9;

* AP 19-7-19 ;
* rate_return;  r=uniform(0); if 0.0 <= r < 0.15 then rate_return = 0.05; if 0.15 <= r < 0.25 then rate_return = 0.10; 
			if 0.25 <= r < 0.5 then rate_return = 0.15; if 0.5 <= r < 0.75 then rate_return = 0.2 ;	if 0.75 <= r then rate_return = 0.5; 

* rate_restart;  r=uniform(0); if r < 0.25 then rate_restart = 0.2; if 0.25 <= r < 0.5 then rate_restart = 0.4; if 0.5 <= r < 0.75 then rate_restart = 0.6; if 0.75 <= r then rate_restart = 0.8;

* AP 19-7-19 ;
* rate_int_choice;  r=uniform(0);  if r < 0.20 then rate_int_choice = 0.001; if 0.20 <= r < 0.30 then rate_int_choice = 0.005; 
			if 0.30 <= r < 0.40 then rate_int_choice = 0.01; if 0.40 <= r < 0.6 then rate_int_choice = 0.015; 
			if 0.6 <= r < 0.8  then rate_int_choice = 0.02;	 if 0.8  <= r        then rate_int_choice = 0.025;

* clinic_not_aw_int_frac;  r=uniform(0); if r < 0.2 then clinic_not_aw_int_frac = 0.1; if 0.2 <= r < 0.4 then clinic_not_aw_int_frac = 0.3; if 0.4 <= r < 0.6 then clinic_not_aw_int_frac = 0.5; if 0.6 <= r < 0.8 then clinic_not_aw_int_frac = 0.7; if 0.8 <= r then clinic_not_aw_int_frac = 0.9;
* res_trans_factor_nn (this is for nnrti only); r=uniform(0); if r < 0.20 then res_trans_factor_nn= 0.50; if 0.20 <= r < 0.40 then res_trans_factor_nn= 0.7;
				if 0.40 <= r < 0.60 then res_trans_factor_nn= 0.8; if 0.60 <= r < 0.80 then res_trans_factor_nn= 0.90;  if 0.80 <= r then res_trans_factor_nn= 1.00;  * may18;
* rate_loss_persistence;  r=uniform(0); if r < 0.1  then rate_loss_persistence= 0.00;if 0.1 <= r < 0.2  then rate_loss_persistence= 0.005; if 0.2  <= r < 0.3  then rate_loss_persistence= 0.01;  if 0.3  <= r < 0.7  then rate_loss_persistence= 0.015; if 0.7  <= r then rate_loss_persistence= 0.020;
* incr_rate_int_low_adh;  r=uniform(0); incr_rate_int_low_adh = 1;  if r < 0.5 then incr_rate_int_low_adh = 2; if r < 0.25 then incr_rate_int_low_adh = 5;
* poorer_cd4rise_fail_nn; * mf - aug18; poorer_cd4rise_fail_nn = -6 + (3 * normal(0)); poorer_cd4rise_fail_nn = round(poorer_cd4rise_fail_nn,1);
* poorer_cd4rise_fail_ii;  r=uniform(0); poorer_cd4rise_fail_ii=0; if r < 0.5 then poorer_cd4rise_fail_ii=1;
* rate_res_ten;  r=uniform(0); rate_res_ten=0.1; if r < 0.9 then rate_res_ten=0.3;  * changed since nih talk - was 0.3 for all runs; 
* fold_change_mut_risk;  r=uniform(0); fold_change_mut_risk = 1; if r < 0.10  then fold_change_mut_risk = 2; if r > 0.90 then fold_change_mut_risk = 0.5; * jan18;
* adh_effect_of_meas_alert; r=uniform(0); adh_effect_of_meas_alert = 0.7; if 0.7 <= r < 0.85 then adh_effect_of_meas_alert = 0.35; if 0.85 <= r then adh_effect_of_meas_alert = 0.9;

* AP 19-7-19 ;
* pr_switch_line;  r=uniform(0);  pr_switch_line = 0.20;  if 0.50 <= r then pr_switch_line = 0.50; * may 2019;

* prob_vl_meas_done; r=uniform(0); prob_vl_meas_done=0.85; if 0.25 <= r < 0.50 then prob_vl_meas_done=0.25; if 0.50 <= r < 0.75 then prob_vl_meas_done=0.10; if 0.75 <= r then prob_vl_meas_done=0.00;

* AP 19-7-19 ;
* cd4_monitoring;	r=uniform(0); cd4_monitoring=0; if prob_vl_meas_done=0.0 and r < 0.5 then cd4_monitoring = 1;

* red_adh_tb_adc; red_adh_tb_adc = 0.1 * exp(normal(0)*0.5); red_adh_tb_adc=round(red_adh_tb_adc,.01);
* red_adh_tox_pop; red_adh_tox_pop = 0.05 * exp(normal(0)*0.5); red_adh_tox_pop=round(red_adh_tox_pop,.01);
* add_eff_adh_nnrti; add_eff_adh_nnrti = 0.10* exp(normal(0)*0.30); add_eff_adh_nnrti=round(add_eff_adh_nnrti,.01);
* altered_adh_sec_line_pop; altered_adh_sec_line_pop = 0.05 +(normal(0)*0.05); altered_adh_sec_line_pop = round(altered_adh_sec_line_pop,.01);

* AP 19-7-19 ;
* prob_return_adc; r=uniform(0); if r < 0.05 then prob_return_adc = 0.2; if 0.05 <= r < 0.2 then prob_return_adc = 0.4; if 0.2 <= r < 0.5  then prob_return_adc = 0.6; if 0.5 <= r then prob_return_adc = 0.8; 

* prob_lossdiag_adctb;  prob_lossdiag_adctb = rand('beta',5,95); prob_lossdiag_adctb = round(prob_lossdiag_adctb,0.01);
* prob_lossdiag_who3e;  prob_lossdiag_who3e = rand('beta',15,85);prob_lossdiag_who3e = round(prob_lossdiag_who3e,0.01);
* higher_newp_less_engagement; r=uniform(0); if r < 0.2 then higher_newp_less_engagement = 1; * are people with more newp less likely to be engaged with care; 
* fold_tr;		fold_tr= 1.0 * exp(normal(0)*0.3); fold_tr = round(fold_tr,0.01);
* switch_for_tox; r=uniform(0); if r < 0.50 then switch_for_tox=0; if r >= 0.50 then switch_for_tox=1;

**** related to dtg;

* dol_higher_potency;   dol_higher_potency = 0.5;  * so 1.5 potency - as for efa - may 2019 in response to advance results;
* rel_dol_tox; r=uniform(0); rel_dol_tox = 1; if r < 0.2  then rel_dol_tox = 2; * = 2 means same rate as efavirenz (although persistence still lower);
* zero_3tc_activity_m184; r=uniform(0); zero_3tc_activity_m184 = 0; if r < 0.2 then zero_3tc_activity_m184 = 1; 
* zero_tdf_activity_k65r; r=uniform(0); zero_tdf_activity_k65r = 0; if r < 0.2 then zero_tdf_activity_k65r = 1; 
* higher_rate_res_dol ;  r=uniform(0); higher_rate_res_dol = 0; if r < 0.2 then higher_rate_res_dol = 1; 
* res_trans_factor_ii ;  r=uniform(0); res_trans_factor_ii = 1; if r < 0.2 then res_trans_factor_ii = 2; 
* add_effect_tox_int; r=uniform(0); add_effect_tox_int = 1; if r < 0.2 then add_effect_tox_int = 5 ;
* rate_birth_with_infected_child; 
		r=uniform(0); if r < 0.05 then rate_birth_with_infected_child = 0.3; 
		if 0.05 <= r < 0.30 then rate_birth_with_infected_child = 0.4 ; if 0.30 <= r < 0.90 then rate_birth_with_infected_child = 0.5 ; 
		if 0.90 <= r        then rate_birth_with_infected_child = 0.6 ; 
* nnrti_res_no_effect; r=uniform(0); nnrti_res_no_effect=0.25;  if 0.95  <= r then nnrti_res_no_effect = 0.5; 
					   if 0.20 <= r < 0.95 then nnrti_res_no_effect = 0  ; 
* double_rate_gas_tox_taz; r=uniform(0); double_rate_gas_tox_taz = 1; if r < 0.5 then double_rate_gas_tox_taz=2;
* tox_weightg_dol ;	r=uniform(0); tox_weightg_dol = 0; if r < 0.5 then tox_weightg_dol = 1;		
* incr_mort_risk_dol_weightg ; r=uniform(0); if 0    <= r < 0.01  then incr_mort_risk_dol_weightg = 1;  
								if 0.01    <= r < 0.17  then incr_mort_risk_dol_weightg = 1.1;
								if 0.17  <= r < 0.34  then incr_mort_risk_dol_weightg = 2  ; if 0.34  <= r < 0.51 then incr_mort_risk_dol_weightg = 2.1;
								if 0.51  <= r < 0.68  then incr_mort_risk_dol_weightg = 2.2; if 0.68  <= r < 0.85 then incr_mort_risk_dol_weightg = 3  ; 
								if 0.85  <= r         then incr_mort_risk_dol_weightg = 4  ; 
* oth_dol_adv_birth_e_risk;    r=uniform(0); if 0.0 <= r < 0.20 then oth_dol_adv_birth_e_risk = 0.0005;
								if 0.20 <= r < 0.60 then oth_dol_adv_birth_e_risk = 0.0015;
								if 0.60 <= r < 0.80 then oth_dol_adv_birth_e_risk = 0.0020; 
								if 0.80 <= r        then oth_dol_adv_birth_e_risk = 0.0030; 
* prop_bmi_ge23;			r=uniform(0);  prop_bmi_ge23 = 0.5;  if r < 0.5 then prop_bmi_ge23 = 0.75;
* rr_int_tox ;				r=uniform(0); if r < 0.4 then rr_int_tox = 2; if r >= 0.4 then rr_int_tox = 10;  

***** prep;

* adh_pattern_prep;  r=uniform(0); if r < 0.25 then adh_pattern_prep = 1; if 0.25 <= r < 0.5 then adh_pattern_prep = 2; if 0.5 <= r < 0.75 then adh_pattern_prep = 3; if 0.75 <= r then adh_pattern_prep = 4;	 
* rate_test_startprep; r=uniform(0); if r < 0.33 then rate_test_startprep = 0.25; if 0.33 <= r < 0.67 then rate_test_startprep = 0.5; if 0.67 <= r  then rate_test_startprep = 0.75;*Additional rate of being tested for HIV before PrEP;	 
* rate_test_restartprep;  r=uniform(0); if r < 0.50 then rate_test_restartprep = 0.50; if 0.50 <= r  then rate_test_restartprep = 0.80;
* rate_choose_stop_prep; r=uniform(0); if r < 0.33 then rate_choose_stop_prep = 0.05;  if 0.33 <= r < 0.67 then rate_choose_stop_prep = 0.15;
						if 0.67 <= r        then rate_choose_stop_prep = 0.30;
* prob_prep_restart_choice;  r=uniform(0); if r < 0.33 then prob_prep_restart_choice=0.05; if 0.33 <= r < 0.67 then prob_prep_restart_choice=0.10;
							if 0.67 <= r then prob_prep_restart_choice=0.20;
* prepuptake_sw;			r=uniform(0); prepuptake_sw=0.5;  if r > 0.8 then prepuptake_sw =0.25; if r < 0.2 then prepuptake_sw = 0.75;
* prepuptake_pop;			r=uniform(0); prepuptake_pop=0.2;  if r > 0.8 then prepuptake_pop =0.10; if r < 0.2 then prepuptake_pop = 0.5 ;


***** circumcision ;  * todo:  check this with loveleen code and check circumcision levels it produces;

* circ_inc_rate; r=uniform(0); if r < 0.20 then circ_inc_rate = 0.001 ; if 0.20 <= r < 0.4  then circ_inc_rate = 0.002; if 0.4 <= r < 0.6 then 
				circ_inc_rate = 0.003;  if 0.60 <= r < 0.8  then circ_inc_rate = 0.01;  if 0.80 <= r        then circ_inc_rate = 0.05 ;
* prob_birth_circ; r=uniform(0); if r < 0.33 then prob_birth_circ = 0.03; if 0.33 <= r < 0.65 then prob_birth_circ = 0.05; 
if 0.65 <= r < 0.98 then prob_birth_circ = 0.1; if r >= 0.98 then prob_birth_circ = 0.5;

***LBM Jul19 check data on circ;


* p_hard_reach_w;  p_hard_reach_w=0.05+(uniform(0)*0.10); p_hard_reach_w = round(p_hard_reach_w, 0.01);
* hard_reach_higher_in_men;  hard_reach_higher_in_men = 0.00 + (uniform(0)*0.10); hard_reach_higher_in_men = round(hard_reach_higher_in_men,0.01);

p_hard_reach_m = p_hard_reach_w + hard_reach_higher_in_men;

* ================ ;

* test type;

*1= PCR (RNA VL) tests - assume window period of 10 days;
*3= 3rd gen (Ab) tests / community-based POC tests / rapid tests - assume window period of 3 months; 
*4= 4th gen (Ag/Ab) tests - assume window period of 1 month;
if hivtest_type=1 then do; sens_primary=0.86; sens_vct=0.98; spec_vct=1;     end;
else if hivtest_type=3 then do; sens_primary=0;    sens_vct=0.98; spec_vct=0.992; end;
else if hivtest_type=4 then do; sens_primary=0.65; sens_vct=0.98; spec_vct=1; test_4thgen=1; * test_4thgen=1 moved here mar19;  end;


* COSTS;

* todo:  ALL COSTS BELOW TO BE REVIEWED ;

* drug costs are perhaps 10% higher due to supply chain but for monitoring comparison this will not differ by option;
*cost of the following drugs updated in July 2014 based on MSF report, without including cost of supply chain;

cost_zdv_a=(0.060/4)*1.2; * global fund aug18 ;  * mf ;
cost_3tc_a=(0.017/4)*1.2; * jul 19 - south africa tender ;
cost_ten_a=(0.028/4)*1.2; * jul 19 - south africa tender ;
cost_taf = (0.018/4)*1.2;
cost_nev_a=(0.027/4)*1.2; * chai 2017 market report - global fund price;   
cost_efa_a=(0.025/4)*1.2; * global fund jul18 ;  * mf ;
cost_lpr_a=(0.152/4)*1.2;                     
cost_taz_a=(0.185/4)*1.2;   * global fund aug18 ; * mf ;
cost_dol_a=(0.020/4)*1.2;   * jul 19 - south africa tender ;
cost_dar_a=(0.200/4)*1.2;	
adc_cost_a=(.200);
who3_cost_a=(.020);
tb_cost_a=(.050);
cot_cost_a=(.005/4);
cd4_cost_a=(.010);
vl_cost_a=(.022);
vl_cost_plasma=0.022;
vl_cost_lab=0.022; 
vl_cost_poc=0.022;
vis_cost_a=(.020); 
cost_cascade_interventions_a=0.010; 
res_cost_a=(0.100);
cost_test_a=0.025; *HCW-testing symptomatic, it applies only to positive people with symptoms ;
cost_test_b=0.025; *HCW-testing general pop, HIV positive;
cost_test_c=0.0037; *HCW-testing general pop, hiv negative - changed 30dec2016 - email from anna osborne chai 8nov2016 - this is for facility based testing, which most testing is;
cost_test_d=0.02521; *HCW-testing positive (community based);
cost_test_e=0.0245; *HCW-testing negative (community based);
adhm_cost_a = 0.020;
cost_t_adh_int = 0.010;  
art_init_cost = 0.010; *Cost of ART initiation - Mar2017;
prep_drug_cost = (0.050 * 1.2) / 4 ; * cost per 3 months; * 1.2 is supply chain cost;
cost_prep_clinic = 0.010; *Clinic/Programme costs relating to PrEP use in HIV-negative individuals; * changed from 0.10 to 0.30 after input from gesine;
cost_prep_clinic_couns = 0.010; *Further clinic costs relating to adherence counselling;
cost_drug_level_test = 0.015; * assume tdf drug level test can be $15 ;

* based on salomom et al lancet 2012;
util_tox = rand('beta',10,2); util_tox = 0.95;
util_who3 = rand('beta',8,2);  util_who3 = 0.78;
util_tb = rand('beta',7,7);  util_tb = 0.60;
util_adc = rand('beta',2,6); util_adc = 0.46;
* util_rec_ntd = 0.8; * removed aug18 - since dont have this for mtct;




* hiv_monitoring_strategy
1  strategy for monitoring HIV positive people naive to ART 1: presence of tb or who4
2  strategy for monitoring HIV positive people naive to ART 2: cd4 6 monthly + presence of tb or who4

* art initiation strategy
1  all with who4
2  all with tb or who4
3  all with hiv diagnosed
4  cd4 < 200 or who4
5  cd4 < 200 or tb or who4
6  cd4 < 350 or who4
7 at diagnosis
;



data r1;set z;
do i=1 to 100000;
	n=1;output; 
end; 
drop i;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* VALUES OF FIXED, PERSON-SPECIFIC PARAMETERS AND VALUES AT CALDATE 1980;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

data r1; set r1;


s=uniform(0);
if s < 0.5 then gender=1; else gender=2;

if gender ne . then do; obs+1; end;


*
cia world factbook 
malawi
Total population (x 1000)	Population aged 0�E4 (%)	Population aged 15�E4 (%)	Population aged 65+ (%)   n population aged 15�E4
1990	9 381	45.9	51.4	2.7		4821000
1995	9 883	44.7	52.2	3.1		5159000
2000	11 229	45.8	51.1	3.1		5738000
2005	12 823	46.1	50.9	3.1		6527000
2010	14 901	45.8	51.1	3.1		7614000



World mortality report

prob survival to age 60 in 15 year olds

			1990-1995	2010-2015

Malawi		0.62		0.62
Zimbabwe  	0.59   		0.63
Zambia		0.40		0.69
Uganda		0.51		0.68
Tanzania	0.60		0.71
S Africa	0.71		0.57
Nigeria		0.61		0.63
Kenya		0.71		0.73

(with current all cause death rates alone it is 0.63 for men, 0.76 for women)

this above information suggests leaving fold_change_ac_death_rate = 1 


Structure of the population (DHS 2010) (Males 55 159, Females 58 414 = 113 574) :

Age Group	Total (%)   % of 15-65 (47.2% are 15-65)
0-4		17,2
5-9		17,1
10-14	14,7
15-19	9,8		20.1%
20-24	7,8		16.5*		36.6% 15-25
25-29	7,3		15.5%
30-34	5,8		12.3%		27.8% 25-35
35-39	4,6		9.7%
40-44	3,1		6.6%		16.3% 35-45
45-49	2,7		5.7%
50-54	2,5		5.3%		11.0% 45-55
55-59	1,9		4.0%
60-64	1,8		3.8%		7.8%  55-65
65-69	1,2
70-74	1,0
75-79	0,8
80+		0,8

;


* Running for 82 years - 1989 - 2071;  * AP 20-7-19 ;
* Using a moderate rate of population growth;

***LBM Jul19;
if inc_cat=1 then do;
inc1=0.1800;
inc2=0.1650;
inc3=0.1440;
inc4=0.1140;
inc5=0.0900;
inc6=0.0800;
inc7=0.0680;
inc8=0.0470;
inc9 =0.036;
inc10=0.027;
inc11=0.021;
inc12=0.016;
inc13=0.012;
end;


if inc_cat=2 then do;
inc1=0.1500; *-65 to -55;
inc2=0.1300; *-55 to -45;
inc3=0.1200; *-45 to -35;
inc4=0.1100; *-35 to -25;
inc5=0.1000; *-25 to -15;
inc6=0.0900; *-15 to -5;
inc7=0.0800; *-5 to 5;
inc8=0.0650; * 5 to 15;
inc9 =0.048; * 15 to 25; 
inc10=0.040; * 25 to 35;
inc11=0.030; * 35 to 45;
inc12=0.021; * 45 to 55;
inc13=0.016; * 55 to 65;
end;

if inc_cat=3 then do;
inc1=0.1280;
inc2=0.1190;
inc3=0.1130;
inc4=0.1040;
inc5=0.0970;
inc6=0.0900;
inc7=0.0810;
inc8=0.0074;
inc9 =0.060;
inc10=0.050;
inc11=0.038;
inc12=0.026;
inc13=0.020;
end;



cum2=inc1+inc2; cum3=cum2+inc3;cum4=cum3+inc4;cum5=cum4+inc5;cum6=cum5+inc6;cum7=cum6+inc7;cum8=cum7+inc8;
cum9=cum8+inc9;cum10=cum9+inc10; cum11=cum10+inc11; cum12=cum11+inc12; 

e=uniform(0);
if 0.0 <= e < inc1    then age1=-67+uniform(0)*12;   * AP 20-7-19;
if inc1 <= e < cum2   then age1=-55+uniform(0)*10;  
if cum2 <= e < cum3   then age1=-45+uniform(0)*10;  
if cum3 <= e < cum4   then age1=-35+uniform(0)*10;  
if cum4 <= e < cum5   then age1=-25+uniform(0)*10;  
if cum5 <= e < cum6   then age1=-15+uniform(0)*10;  
if cum6 <= e < cum7   then age1=-5+uniform(0)*10;  
if cum7 <= e < cum8   then age1=  5+uniform(0)*10;  
if cum8 <= e < cum9   then age1= 15+uniform(0)*10;  
if cum9 <= e < cum10  then age1= 25+uniform(0)*10;  
if cum10 <= e < cum11  then age1= 35+uniform(0)*10;  
if cum11 <= e < cum12  then age1= 45+uniform(0)*10;  
if cum12 <= e          then age1= 55+uniform(0)*10;  


age1=round(age1,.25);

year_start=-67;

if age1 >= year_start;

hiv1=0;

if gender=2 and age1>=15 then do;
	if 15 <= age1 < 25 then do;u=uniform(0);
		if       .   lt u lt 0.72 then cum_children=0;else if 0.72 le u lt 0.93 then cum_children=1;
		else if 0.93 le u lt 0.99 then cum_children=2;else if 0.99 le u le 1     then cum_children=3;
	end;
	else if 25 <= age1 < 35 then do;u=uniform(0);
		if       .   lt u lt 0.25 then cum_children=0;else if 0.25 le u lt 0.55 then cum_children=1;
		else if 0.55 le u lt 0.81 then cum_children=2;else if 0.81 le u lt 0.93 then cum_children=3;
		else if 0.93 le u lt 0.98 then cum_children=4;else if 0.98 le u lt 0.99 then cum_children=5;
		else if 0.99 le u lt 1    then cum_children=6;
	end;
	else if 35 <= age1 < 45 then do;u=uniform(0);
		if       .   lt u lt 0.11 then cum_children=0;else if 0.11 le u lt 0.24 then cum_children=1;
		else if 0.24 le u lt 0.50 then cum_children=2;else if 0.50 le u lt 0.71 then cum_children=3;
		else if 0.71 le u lt 0.85 then cum_children=4;else if 0.85 le u lt 0.92 then cum_children=5;
		else if 0.92 le u lt 0.96 then cum_children=6;else if 0.96 le u lt 0.98 then cum_children=7;
		else if 0.98 le u lt 0.99 then cum_children=8;else if 0.99 le u lt 1    then cum_children=10;

	end;
	else if 45 <= age1      then do;u=uniform(0);
		if       .   lt u lt 0.11 then cum_children=0;else if 0.11 le u lt 0.21 then cum_children=1;
		else if 0.21 le u lt 0.42 then cum_children=2;else if 0.42 le u lt 0.62 then cum_children=3;
		else if 0.62 le u lt 0.76 then cum_children=4;else if 0.76 le u lt 0.86 then cum_children=5;
		else if 0.86 le u lt 0.92 then cum_children=6;else if 0.92 le u lt 0.96 then cum_children=7;
		else if 0.96 le u lt 0.98 then cum_children=8;else if 0.98 le u le 1    then cum_children=10;
	end;
end;


* NUMBER OF PARTNERS / NUMBER OF NEW PARTNERS AT TIME 0;


*-----------------------------------------------------------------------------------------------------------------------------------;

if rbm=4 then do;

r=uniform(0);
if gender=2 then life_sex_risk=2; 
rred_p=1;
if r < p_rred_p then do; life_sex_risk = 1;  rred_p=0.00001; end;
if gender=2 and 1-p_hsb_p < r < 1 then life_sex_risk = 3; 


if rred_a_p=1 then do;
rred_a_15m = 0.30;	rred_a_15w = 1.80;
rred_a_20m = 0.40;	rred_a_20w = 1.80;
rred_a_25m = 0.85;	rred_a_25w = 1.00;
rred_a_30m = 1.00;  rred_a_30w = 0.80;
rred_a_35m = 0.85;	rred_a_35w = 0.50;
rred_a_40m = 0.50;	rred_a_40w = 0.35;
rred_a_45m = 0.40;	rred_a_45w = 0.30;
rred_a_50m = 0.35;	rred_a_50w = 0.10;
rred_a_55m = 0.20;	rred_a_55w = 0.03;
rred_a_60m = 0.15;	rred_a_60w = 0.02;
end;

if rred_a_p=2 then do;
rred_a_15m = 0.65;	rred_a_15w = 1.10;	  
rred_a_20m = 0.65;	rred_a_20w = 1.10;
rred_a_25m = 1.20;	rred_a_25w = 1.00;			  
rred_a_30m = 1.20;	rred_a_30w = 0.85;
rred_a_35m = 0.65;	rred_a_35w = 0.55;
rred_a_40m = 0.50;	rred_a_40w = 0.45;		  
rred_a_45m = 0.45;	rred_a_45w = 0.35;
rred_a_50m = 0.40;	rred_a_50w = 0.25;		  
rred_a_55m = 0.35;	rred_a_55w = 0.20;		  
rred_a_60m = 0.30;	rred_a_60w = 0.20;
end;

if rred_a_p=3 then do;
rred_a_15m = 0.05;	rred_a_15w = 2.50;
rred_a_20m = 0.20;	rred_a_20w = 2.50;
rred_a_25m = 1.00;	rred_a_25w = 1.00;
rred_a_30m = 1.00;	rred_a_30w = 0.85;
rred_a_35m = 0.65;	rred_a_35w = 0.55;
rred_a_40m = 0.50;	rred_a_40w = 0.45;
rred_a_45m = 0.45;	rred_a_45w = 0.35;
rred_a_50m = 0.35;	rred_a_50w = 0.03;
rred_a_55m = 0.25;	rred_a_55w = 0.01;
rred_a_60m = 0.15;	rred_a_60w = 0.01;
end;


if rred_a_p=4 then do;
rred_a_15m = 0.05;	rred_a_15w = 3.00;
rred_a_20m = 0.30;	rred_a_20w = 3.00;
rred_a_25m = 0.80;	rred_a_25w = 1.00;
rred_a_30m = 0.70;	rred_a_30w = 0.85;
rred_a_35m = 0.65;	rred_a_35w = 0.40;
rred_a_40m = 0.50;	rred_a_40w = 0.30;
rred_a_45m = 0.45;	rred_a_45w = 0.15;
rred_a_50m = 0.35;	rred_a_50w = 0.03;
rred_a_55m = 0.25;	rred_a_55w = 0.01;
rred_a_60m = 0.15;	rred_a_60w = 0.01;
end;



if gender=1 then do;

if 15 <= age1 < 20 then rred_a=rred_a_15m; 
if 20 <= age1 < 25 then rred_a=rred_a_20m;
if 25 <= age1 < 30 then rred_a=rred_a_25m;
if 30 <= age1 < 35 then rred_a=rred_a_30m;
if 35 <= age1 < 40 then rred_a=rred_a_35m;
if 40 <= age1 < 45 then rred_a=rred_a_40m;
if 45 <= age1 < 50 then rred_a=rred_a_45m;
if 50 <= age1 < 55 then rred_a=rred_a_50m;
if 55 <= age1 < 60 then rred_a=rred_a_55m;
if 60 <= age1 < 65 then rred_a=rred_a_60m;

rred= newp_factor*(rred_a*rred_p);

* newp=0; s1=0.85; * newp1=1; s2=0.10   ;* newp >= 2; s3=0.05  ; * newp1 10x; s4=0.0030 ;


s2=s2*rred; s3=s3*rred; s4=s4*rred; 
cu1=s1;cu2=cu1+s2;cu3=cu2+s3;cu4=cu3+s4; a=uniform(0);
if            a < cu1/cu4 then do; newp1=0; end; 
if cu1/cu4 <= a < cu2/cu4  then do; e=uniform(0); if e < 0.70 then newp1=1; if 0.70 <= e < 0.90 then newp1=2; 
											if e ge 0.90 then newp1=3; end;
if cu2/cu4 <= a < cu3/cu4 then do; e=uniform(0); if e < 0.22 then newp1=4; if 0.22 <= e < 0.42 then newp1=5; if 0.42 <= e < 0.60 then newp1=6; 
					if 0.60 <= e < 0.76 then newp1=7; if 0.76 <= e < 0.90 then newp1=8; if 0.90 <= e then newp1=9; end;
if cu3/cu4 <= a < cu4/cu4 then do; if e < 0.22 then newp1=10; if 0.22 <= e < 0.42 then newp1=15; if 0.42 <= e < 0.60 then newp1=20; 
					if 0.60 <= e < 0.76 then newp1=25; if 0.76 <= e < 0.90 then newp1=30; if 0.90 <= e then newp1=35; end;

end;


* RISK BEHAVIOUR AT TIME 0 - FEMALES;

if gender=2 then do;

if 15 <= age1 < 20 then rred_a=rred_a_15w; 
if 20 <= age1 < 25 then rred_a=rred_a_20w;
if 25 <= age1 < 30 then rred_a=rred_a_25w;
if 30 <= age1 < 35 then rred_a=rred_a_30w;
if 35 <= age1 < 40 then rred_a=rred_a_35w;
if 40 <= age1 < 45 then rred_a=rred_a_40w;
if 45 <= age1 < 50 then rred_a=rred_a_45w;
if 50 <= age1 < 55 then rred_a=rred_a_50w;
if 55 <= age1 < 60 then rred_a=rred_a_55w;
if 60 <= age1 < 65 then rred_a=rred_a_60w;


rred= newp_factor*(rred_a*rred_p);

* newp=0; s1=0.97;* newp = 1-3; s2=0.03;
s2=s2*rred;
cu1=s1;cu2=cu1+s2; a=uniform(0);
if            a < cu1/cu2 then newp1=0; 
if cu1/cu2 <= a < cu2/cu2 then do; 
	e=uniform(0); if e < 0.85 then newp1 = 1; if 0.85 <= e < 0.95 then newp1 = 2; if e ge 0.95 then newp1 = 3; 
	if 15 <= age1 < 25 then do;
	if e < 0.30 then newp1=1; 		if 0.30 <= e < 0.50 then newp1=2; 	if 0.50 <= e < 0.65 then newp1=3; 
	if 0.65 <= e < 0.77 then newp1=4; 	if 0.77 <= e < 0.86 then newp1=5; 	if 0.86 <= e < 0.92 then newp1=6; 
	if 0.92 <= e < 0.96 then newp1=7; if 0.96 <= e < 0.98 then newp1=8; 	if 0.98 <= e then newp1=9; 
	end;
end;

end;



sw1=0;
e=uniform(0);

if gender =2 then do;

if life_sex_risk = 3 then e = e / 3;

if 15 <= age1 < 18 and life_sex_risk ge 2 and e < 0.020 then sw1=1;
if 18 <= age1 < 20 and life_sex_risk ge 2 and e < 0.060 then sw1=1;
if 20 <= age1 < 25 and life_sex_risk ge 2 and e < 0.030 then sw1=1;
if 25 <= age1 < 40 and life_sex_risk ge 2 and e < 0.020 then sw1=1;
if 40 <= age1 < 50 and life_sex_risk ge 2 and e < 0.002 then sw1=1;

end;


if sw1 = 1 then do;
e=uniform(0);
if e < 0.1 then newp1=0;
if 0.1 <= e < 0.3 then do; q=uniform(0); 
	if q < 1/6 then newp1=1; 
	if 1/6 <= q < 2/6 then newp1=2;  
	if 2/6 <= q < 3/6 then newp1=3;    
	if 3/6 <= q < 4/6 then newp1=4;    
	if 4/6 <= q < 5/6 then newp1=5;    
	if 5/6 <= q       then newp1=6;    
end;
if 0.3 <= e < 0.90 then do; q=uniform(0); 
	newp1 = 6 + (q*34); newp1 = round(newp1,1);  
end;
if 0.90 <= e < 0.99  then do; q=uniform(0); 
	newp1 = 41 + (q*89); newp1 = round(newp1,1);  
end;
if 0.99  <= e       then do; q=uniform(0); 
	newp1 = 131 + (q*50 ); newp1 = round(newp1,1);  
end;
end;


if sw1=1 then ever_sw=1;


if 15 <= age1 < 65 then do; ep1=0; ageg_ep=0; epmono=0; end;
u=uniform(0);
if 15 <= age1 < 25 and u < 0.40 then do; ep1=1; ageg_ep=1; d=uniform(0); if d < 0.33 then lep=1; if .33 <= d < 0.66 then lep=2;  if .66 <= d then lep=3; end;
if 25 <= age1 < 35 and u < 0.50 then do; ep1=1; ageg_ep=2; d=uniform(0); if d < 0.33 then lep=1; if .33 <= d < 0.66 then lep=2;  if .66 <= d then lep=3; end;
if 35 <= age1 < 45 and u < 0.60 then do; ep1=1; ageg_ep=3; d=uniform(0); if d < 0.33 then lep=1; if .33 <= d < 0.66 then lep=2;  if .66 <= d then lep=3; end;
if 45 <= age1 < 55 and u < 0.60 then do; ep1=1; ageg_ep=4; d=uniform(0); if d < 0.33 then lep=1; if .33 <= d < 0.80 then lep=2;  if .80 <= d then lep=3; end;
if 55 <= age1 < 65 and u < 0.60 then do; ep1=1; ageg_ep=5; d=uniform(0); if d < 0.33 then lep=1; if 0.33 <= d then lep=2; end;

np1=ep1+newp1;

end;
*-----------------------------------------------------------------------------------------------------------------------------------;


newp_ever=newp1;
np_ever=np1;

if age1 < 15 then do; ep1=.; np1=.; newp1=.; epmono=.; end;


sti1=0;
s=uniform(0); if s < newp1/20 then sti1=1;

dead1=0;
dcause = . ; * can be who4_=1 / liver=2 / CVD=3 / drug death=4 / other=5 ( or 1=HIV - 2 = non-HIV in simpler version);

* co-infection with hep B and C - currently assume no change over calendar time in proportion co-infected
with B or C and also that no new infections during HIV infection;
d=uniform(0);
hcv=0;
if d < 0.02 then hcv=1;
e=1;
hbv=0;
if d < 0.03 then hbv=1;


u=uniform(0);low_preg_risk=0;
if u>can_be_pregnant then low_preg_risk=1;
prob_pregnancy_b = prob_pregnancy_base;
if low_preg_risk=1 then prob_pregnancy_b=0; 



* define effective max_freq_testing;
eff_max_freq_testing = max_freq_testing;

* define effectve rate of restart;
eff_rate_restart = rate_restart;

* define effective prob_loss_at_diag ;
eff_prob_loss_at_diag = prob_loss_at_diag;

* define effective rate_lost;
eff_rate_lost = rate_lost ;

* define effective prob_lost_art;
eff_prob_lost_art = prob_lost_art;

* define rate_return ;
eff_rate_return = rate_return;

* define effective pr_art_init;
eff_pr_art_init = pr_art_init;

* define effective rate_int_choice;
eff_rate_int_choice = rate_int_choice;

* define effective prob_vl_meas_done;
eff_prob_vl_meas_done = prob_vl_meas_done;

* define effective pr_switch_line;
eff_pr_switch_line = pr_switch_line;

* define effective rate_test_startprep;
eff_rate_test_startprep = rate_test_startprep;

* define effective rate_test_restartprep;
eff_rate_test_restartprep = rate_test_restartprep;

* define effective rate_choose_stop_prep;
eff_rate_choose_stop_prep = rate_choose_stop_prep;

* define effective prob_prep_restart_choice;
eff_prob_prep_restart_choice = prob_prep_restart_choice;

* define effective prepuptake_sw;
eff_prepuptake_sw = prepuptake_sw;

* define effective prepuptake_pop;
eff_prepuptake_pop = prepuptake_pop;

* define effective test_targeting;

eff_test_targeting = test_targeting;


keep_going_1999=.;  keep_going_2004=.; keep_going_2016=.;  keep_going_2020=.;


* na defines a "non-adherent person" - not sure if this is reasonable structure for non adherence;

* ADHERENCE PATTERN;

* remember that there are additional negative effects on adherence of younger age, tox, adc/tb, occasional drops i adh, 2nd line; 

if adh_pattern=100 then do;  

*adherence pattern 100;
e=uniform(0);f=uniform(0);
if         e < 0.01 then do; adhav = 0.10; adhvar=0.20; adhmic=1;end;
if 0.01 <= e < 0.02 then do; adhav = 0.79; adhvar=0.20; adhmic=1;end;
if 0.02 <= e < 0.20 then do; adhav = 0.95; adhvar=0.05; adhmic=1;end;
if 0.20 <= e < 0.42 then do; adhav = 0.95; adhvar=0.02; adhmic=1;end;
if 0.42 <= e < 0.62 then do; adhav = 0.95; adhvar=0.02; adhmic=2;end;
if 0.62 <= e        then do; adhav = 0.95; adhvar=0.02; adhmic=3;end;

if adhav  lt 0 then adhav =0; if adhav  gt 1 then adhav =1;

end;

if adh_pattern=99 then do;

*adherence pattern 99;
e=uniform(0);f=uniform(0);
if         e < 0.03 then do; adhav = 0.10; adhvar=0.20; adhmic=1;end;
if 0.03 <= e < 0.05 then do; adhav = 0.79; adhvar=0.20; adhmic=1;end;
if 0.05 <= e < 0.20 then do; adhav = 0.95; adhvar=0.05; adhmic=1;end;
if 0.20 <= e < 0.42 then do; adhav = 0.95; adhvar=0.02; adhmic=1;end;
if 0.42 <= e < 0.62 then do; adhav = 0.95; adhvar=0.02; adhmic=2;end;
if 0.62 <= e        then do; adhav = 0.95; adhvar=0.02; adhmic=3;end;

if adhav  lt 0 then adhav =0; if adhav  gt 1 then adhav =1;

end;


if adh_pattern=1 then do;

*adherence pattern 1;
e=uniform(0);f=uniform(0);
if         e < 0.03 then do; adhav = 0.10; adhvar=0.20; adhmic=1;end;
if 0.03 <= e < 0.06 then do; adhav = 0.79; adhvar=0.20; adhmic=1;end;
if 0.06 <= e < 0.20 then do; adhav = 0.9 ; adhvar=0.06; adhmic=1;end;
if 0.20 <= e < 0.42 then do; adhav = 0.95; adhvar=0.05; adhmic=1;end;
if 0.42 <= e < 0.62 then do; adhav = 0.95; adhvar=0.05; adhmic=2;end;
if 0.62 <= e        then do; adhav = 0.95; adhvar=0.05; adhmic=3;end;

if adhav  lt 0 then adhav =0; if adhav  gt 1 then adhav =1;

end;


if adh_pattern=105 then do;

*adherence pattern 105;  * means 1.5;
e=uniform(0);f=uniform(0);
if         e < 0.05 then do; adhav = 0.10 ; adhvar=0.20; adhmic=1;end;
if 0.05 <= e < 0.12 then do; adhav = 0.79 ; adhvar=0.20; adhmic=1;end;
if 0.12 <= e < 0.20 then do; adhav = 0.9  ; adhvar=0.06; adhmic=1;end;
if 0.20 <= e < 0.42 then do; adhav = 0.95 ; adhvar=0.05; adhmic=2;end;
if 0.42 <= e < 0.62 then do; adhav = 0.95 ; adhvar=0.05; adhmic=3;end;
if 0.62 <= e        then do; adhav = 0.95 ; adhvar=0.05; adhmic=3;end;

if adhav lt 0 then adhav=0; if adhav gt 1 then adhav=1;

end;


if adh_pattern=98 then do;

*adherence pattern 98;
e=uniform(0);f=uniform(0);
if         e < 0.05 then do; adhav = 0.10 ; adhvar=0.20; adhmic=1;end;
if 0.05 <= e < 0.15 then do; adhav = 0.79 ; adhvar=0.20; adhmic=1;end;
if 0.15 <= e < 0.42 then do; adhav = 0.95 ; adhvar=0.02; adhmic=1;end;
if 0.42 <= e < 0.62 then do; adhav = 0.95 ; adhvar=0.02; adhmic=2;end;
if 0.62 <= e < 0.8  then do; adhav = 0.95 ; adhvar=0.02; adhmic=3;end;
if 0.8  <= e        then do; adhav = 0.95 ; adhvar=0.02; adhmic=3;end;

if adhav  lt 0 then adhav =0; if adhav  gt 1 then adhav =1;

end;


if adh_pattern=101 then do;

*adherence pattern 101;
e=uniform(0);f=uniform(0);
if         e < 0.05 then do; adhav = 0.10 ; adhvar=0.20; adhmic=1;end;
if 0.05 <= e        then do; adhav = 0.90 ; adhvar=0.05; adhmic=2;end;

if adhav  lt 0 then adhav =0; if adhav  gt 1 then adhav =1;

end;


if adh_pattern=2 then do;

*adherence pattern 2;
e=uniform(0);f=uniform(0);
if         e < 0.05 then do; adhav = 0.10 ; adhvar=0.20; adhmic=1;end;
if 0.05 <= e < 0.15 then do; adhav = 0.79 ; adhvar=0.20; adhmic=1;end;
if 0.15 <= e < 0.42 then do; adhav = 0.90 ; adhvar=0.06; adhmic=1;end;
if 0.42 <= e < 0.62 then do; adhav = 0.90 ; adhvar=0.05; adhmic=2;end;
if 0.62 <= e < 0.8  then do; adhav = 0.90 ; adhvar=0.05; adhmic=3;end;
if 0.8  <= e        then do; adhav = 0.95 ; adhvar=0.05; adhmic=3;end;

if adhav lt 0 then adhav=0; if adhav gt 1 then adhav=1;

end;


if adh_pattern=3 then do;

* adherence pattern 3 ;
e=uniform(0);f=uniform(0);
if         e < 0.15 then do; adhav = 0.10 ; adhvar=0.20; adhmic=1;end;
if 0.15 <= e < 0.30 then do; adhav = 0.70 ; adhvar=0.20; adhmic=1;end;
if 0.30 <= e < 0.42 then do; adhav = 0.9 ;  adhvar=0.06; adhmic=1;end;
if 0.42 <= e < 0.62 then do; adhav = 0.9 ; adhvar=0.06;  adhmic=2;end;
if 0.62 <= e < 0.80 then do; adhav = 0.9 ; adhvar=0.06;  adhmic=3;end;
if 0.80 <= e        then do; adhav = 0.95; adhvar=0.05; adhmic=3;end;

if adhav lt 0 then adhav=0; if adhav gt 1 then adhav=1;

end;


if adh_pattern=4 then do;

* adherence pattern 4 ;
e=uniform(0);f=uniform(0);
if         e < 0.20 then do; adhav = 0.10 ; adhvar=0.20; end;
if 0.20 <= e < 0.40 then do; adhav = 0.79 ; adhvar=0.20; end;
if 0.40 <= e < 0.80 then do; adhav = 0.9 ;  adhvar=0.06; end;
if 0.80 <= e        then do; adhav = 0.95;  adhvar=0.05; end;

if adhav lt 0 then adhav=0; if adhav gt 1 then adhav=1;

end;


if adh_pattern=5 then do;

* adherence pattern 5 ;
e=uniform(0);f=uniform(0);
if         e < 0.30 then do; adhav = 0.10 ; adhvar=0.20; adhmic=1;end;
if 0.30 <= e < 0.60 then do; adhav = 0.60 ; adhvar=0.20; adhmic=1;end;
if 0.60 <= e < 0.70 then do; adhav = 0.70;  adhvar=0.06; adhmic=1;end;
if 0.70 <= e        then do; adhav = 0.90; adhvar=0.05; adhmic=3;end;

if adhav lt 0 then adhav=0; if adhav gt 1 then adhav=1;

end;



* EFFECT OF VIRAL LOAD MEASURED HIGH, NO RESISTANCE ON RESISTANCE TEST AND LOW ADHERENCE ON ADHERENCE TEST ON SUBSEQUENT ADHERENCE;

* assume first measure of high vl leads to adh intervention with possible 6m or permanent increase in adherence - no additional effect after the 
first measure of any type ;

h=uniform(0); 

* person level effect of viral load high alert on adherence (and probability of restarting if interrupted art);
a=uniform(0);
v_alert_perm_incr_adh=0;  v_alert_6m_incr_adh=0;
if h <  adh_effect_of_meas_alert then do;
	if a < 0.4 then v_alert_perm_incr_adh = 1; 
	if 0.4 <= a  then v_alert_6m_incr_adh = 1; 
end;


* ALTERED ADHERENCE SECOND LINE;

altered_adh_sec_line = altered_adh_sec_line_pop * exp(normal(0)*1.0);  altered_adh_sec_line = round(altered_adh_sec_line,0.01);

* effect of tox on adherence differs by individual;
red_adh_tox = red_adh_tox_pop * exp(normal(0)*0.3); red_adh_tox=round(red_adh_tox,.01); 


if adh_pattern_prep=1 then adhav_pr = adhav*0.90; 
if adh_pattern_prep=2 then adhav_pr = adhav*1;
if adh_pattern_prep=3 then adhav_pr = adhav*0.50;
if adh_pattern_prep=4 then adhav_pr = adhav*0.70;


* willingness to take prep if offered;
r1=uniform(0); prep_willing_pop = 0; if r1 < eff_prepuptake_pop then prep_willing_pop =1;
if gender=2 then do;
r2=uniform(0); prep_willing_sw = prep_willing_pop; 
if prep_willing_pop=0 and r2 < (eff_prepuptake_sw-eff_prepuptake_pop)/(1-eff_prepuptake_pop) then prep_willing_sw =1;
end;


pcp_p1 = 0;
prep  = 0;


***LBM Mar 2017 - Prev_circ now relates to males aged > 15 at t=1 (1989) - a % of this population is assumed already circumcised;
mcirc1=0;
prev_circ=prob_birth_circ;

if  gender=1 and age1 gt 0.5 then do;
h = uniform(0); 
if h < prev_circ then mcirc1=1;
if mcirc =1 then date_mcirc=0;
end;


p=uniform(0); q=uniform(0);
if (gender=1 and p <= p_hard_reach_m) or (gender=2 and q <= p_hard_reach_w) then hard_reach=1;


option=.;

dataset_id=trim(left(round(uniform(0)*1000000)));
call symput('dataset_id',dataset_id);


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* START OF DEFINING MAIN MACRO;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%macro update_r1(da1=,da2=,e=,f=,g=,h=,a=,b=,i=,k=,l=,x=,j=,s=);

 * options mprint;


array newp{8} newp&g-newp&h;
array np{8} np&g-np&h;
array sw{8} sw&g-sw&h;
array ep{8}  ep&g-ep&h;
array epi{8}  epi&g-epi&h;
array mr_epi{8}  mr_epi&g-mr_epi&h;
array mr_epdiag{8}  mr_epdiag&g-mr_epdiag&h;
array epdiag{8}  epdiag&g-epdiag&h;
array epart{8}  epart&g-epart&h;
array epvls{8}  epvls&g-epvls&h;
array sti{8} sti&g-sti&h;                * current sti y/n ;
array age{8} age&g-age&h;
array nip{8} nip&g-nip&h; * no infected partners;
array hiv{8} hiv&g-hiv&h; * hiv infected yes/no;
array v{8} v&g-v&h;
array onart{8} onart&g-onart&h;
array registd{8} registd&g-registd&h;
array tested{8} tested&g-tested&h;
array adc{8} adc&g-adc&h;  * aids defining condition;
array primary{8} primary&g-primary&h; * currently in primary infection;
array caldate{8} caldate&g-caldate&h; * calendar date 1980.00 , 1980.25, etc;
array adh{8} adh&g-adh&h;
array dead{8} dead&g-dead&h;



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* START OF OVERALL LOOP;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

t=&e;
do until (t=&f);


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* AUTOMATIC UPDATING FROM T-1 to T;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


if t ge 2 then caldate_never_dot = caldate_never_dot + 0.25;

if t ge 2 and caldate{t-1} < 2070.0  and dead{t-1} ne 1 and dead{t-1} ne .  then caldate{t}=caldate{t-1}+0.25;




* PREP introduction in fsw/agyw 2017; 

prep_effectiveness_non_res_v = .;  * we only want this defined for people currently on prep so set to . at start of loop;

if caldate{t} = 2017.25 then do;
prep_strategy=3; sens=0; date_prep_intro=2017.25; annual_testing_prep=0.25; hivtest_type=3; 
end;



prep_tm3=prep_tm2; prep_tm2=prep_tm1; prep_tm1=prep; 


* prep scale-up over 4 years;
prob_prep_b = pr_prep_b;
if caldate{t} < (date_prep_intro + 4) then prob_prep_b = 0.05 +  (  (pr_prep_b-0.05) * ( 1 -    (date_prep_intro + 4 - caldate{t}) / 4  )   );   


* MONITORING AND ART STRATEGIES;

if		caldate{t} < 2005.5 then do; 
	hiv_monitoring_strategy=1; 
	art_initiation_strategy=2;
	art_monitoring_strategy=1; 
end;

if 2005.5 <= caldate{t} then do;
	hiv_monitoring_strategy = 2; 
end;  * few facilities measuring cd4 early on;

if 2008 <= caldate{t} then do;
	art_initiation_strategy=4;
end;

q=uniform(0);
if art_initiation_strategy=4 and 2011.5 <= caldate{t} and q < 0.4 then art_initiation_strategy=9; 

if 2014 <= caldate{t} then art_initiation_strategy=10;

if 2016.5 <= caldate{t} then art_initiation_strategy=3;


if caldate{t} ge 2016.25  then do;  * need to show vl testing started this early so can assess 2 year influence of v alert before baseline;
		art_monitoring_strategy = 150; 
		vm_format=2; ***measuring vl using whole blood dbs;   
		vl_threshold=1000;
end;

if caldate{t} ge 2016.5 and cd4_monitoring=1 then art_monitoring_strategy = 81;  



*
reg_option
 
       new 		currently on 1st line tle	currently on 2nd line zl-pi		failure criteria	tle failure			tld failure 	zld failure
      initiators   																
------------------------------------------------------------------------------------------------------------------------------------------------

	
113	   tld		remain on tle				remain on zl-pi			    	two VL > 1000   	--> zl-pi			zl-pi			na

115	   tld		remain on tle				remain on zl-pi			    	two VL > 1000   	--> zl-pi			zl-pi			na
																			and 80% adh

103    tld		--> tld vl < 1000			remain on zl-pi			     	two VL > 1000		--> zld				--> zl-pi		--> tl-pi 

119    tld		--> tld vl < 1000			remain on zl-pi			     	two VL > 1000		--> zld				--> zl-pi		--> tl-pi 
																			and 80% adh

104    tld		--> tld 					--> tld regardless of vl		two VL > 1000		na					--> zl-pi		na 

118    tld		--> tld 					--> tld regardless of vl		two VL > 1000		na					--> zl-pi		na 
																			and 80% adh
																		
116	   tld		--> zld if vl > 1000		--> zld							two vl > 1000		na					zl-pi			--> tl-pi
				--> tld if vl < 1000 										
					or unknown	

117	   tld		--> zld if vl > 1000		--> zld							two vl > 1000		na					zl-pi			--> tl-pi
				--> tld if vl < 1000 										and 80% adh
					or unknown	
																		
------------------------------------------------------------------------------------------------------------------------------------------------

art_monitoring_strategy for tld and zld before moving to pi

150			
1500

;


if caldate{t} ge 2019.5 then reg_option = 113;


* ==========================================================================================================================================;

* code in this section can differ from unified program to some extent, due to specifying exactly what interventions / changes are running; 

* INTERVENTIONS / CHANGES in 2020;



option = &s;

* AP 20-7_19 ;
if caldate{t} = 2020.5 then do;

	if option = 0 then do;

		option_0_prep_continue_2020 = 1;

		* note for prep 2020;
		if _u46 <= 1.0 then do;  

		option_0_prep_continue_2020 = 0;

		eff_rate_test_startprep = 0 ;
		eff_rate_test_restartprep = 0 ;
		eff_rate_choose_stop_prep = 1 ;
		eff_prob_prep_restart_choice = 0 ;	

		end;

	end;


	if option = 1 then do;

		cascade_care_improvements = 0;
		incr_test_2020 = 0;
		decr_hard_reach_2020 = 0;
		decr_prob_loss_at_diag_2020 = 0;
		decr_rate_lost_2020 = 0;
		decr_rate_lost_art_2020 = 0; 
		incr_rate_return_2020 = 0 ;
		incr_rate_restart_2020 = 0;
		incr_rate_init_2020 = 0 ;
		decr_rate_int_choice_2020 = 0 ;
		incr_prob_vl_meas_done_2020 = 0;  
		art_mon_drug_levels_2020 = 0;
		incr_pr_switch_line_2020 = 0 ;
		incr_test_targeting_2020 = 0;
		incr_max_freq_testing_2020 = 0;
		sw_test_6mthly_2020 = 0;
		reg_option_switch_2020 = 0;
		ten_is_taf_2020 = 0;

		prep_improvements = 0;
		incr_adh_pattern_prep_2020 = 0 ;
		inc_r_test_startprep_2020 = 0 ;
		incr_r_test_restartprep_2020 = 0 ;
		decr_r_choose_stop_prep_2020 = 0 ;
		inc_p_prep_restart_choi_2020 = 0 ;
		incr_prepuptake_sw_2020 = 0 ;
		incr_prepuptake_pop_2020 = 0 ;
		expand_prep_to_all_2020 = 0 ;

		circ_improvements = 0;
		circ_inc_rate_2020 = 0;

		condom_incr_2020 = 0;

		pop_wide_tld = 0;

* cascade of care;

		if _u1 < 0.0 then cascade_care_improvements = 1;
		if cascade_care_improvements = 1 then do;
		
* incr_test_2020; 		incr_test_2020 = 0; if _u43 < 0.90 then do;  
							if _u2 < 0.16 then incr_test_2020 = 1; if 0.16 <= _u2 < 0.33 then incr_test_2020 = 2; 
							if 0.33 <= _u2 < 0.50 then incr_test_2020 = 3;  if 0.50 <= _u2 < 0.66 then incr_test_2020 = 4; 
							if 0.66 <= _u2 < 0.83 then incr_test_2020 = 3; if 0.83 <= _u2  then incr_test_2020 = 6; 
						end;

* incr_test_targeting_2020;	
						incr_test_targeting_2020 = 0; if _u42 < 0.45 then incr_test_targeting_2020=1;
						if 0.45 <= _u42 < 0.9 then incr_test_targeting_2020=2;
						if incr_test_targeting_2020=1 then eff_test_targeting = 2;  
						if incr_test_targeting_2020=2 then eff_test_targeting = 5;  
						
* incr_max_freq_testing_2020;
						incr_max_freq_testing_2020 = 0; if _u44 < 0.90 then incr_max_freq_testing_2020=1;
						if incr_max_freq_testing_2020=1 then do;
							if eff_max_freq_testing = 2 then eff_max_freq_testing = 4; 
							if eff_max_freq_testing = 1 then eff_max_freq_testing = 2;
						end;  

* sw_test_6mthly_2020; sw_test_6mthly_2020 = 0;
						if _u45 < 0.9 then do; 
							sw_test_6mthly_2020 = 1; sw_test_6mthly =1; 
						end;
						
* incr_adh_2020;  		incr_adh_2020 = 0;  if _u3 < 0.90 then do; 
							if adhav < 0.8 then do; 
								if _u4 < 0.5 then incr_adh_2020 = 0.5; if _u4 ge 0.5 then incr_adh_2020 = 0.75; 
								e = uniform(0); if e < incr_adh_2020 then adhav = 0.9; 
							end;
						end;

* decr_hard_reach_2020; decr_hard_reach_2020 = 0;  
						if _u5 < 0.90 then do; 
						decr_hard_reach_2020 = 1; 
						if _u6 < 0.5 then e_decr_hard_reach_2020 = 0.50; if _u6 ge 0.5 then e_decr_hard_reach_2020 = 0.75; 
						if hard_reach=1 then do;
							e = uniform(0); if e < e_decr_hard_reach_2020 then hard_reach = 0; 
						end; 
						end;

* decr_prob_loss_at_diag_2020; 
						decr_prob_loss_at_diag_2020 = 0;  
						if _u7 < 0.90 then do; 
							decr_prob_loss_at_diag_2020 = 1; 
							eff_prob_loss_at_diag = eff_prob_loss_at_diag  * _u8/3; eff_prob_loss_at_diag = round(eff_prob_loss_at_diag,0.001);
						end;

* decr_rate_lost_2020; 	decr_rate_lost_2020 = 0;  
						if _u9 < 0.90 then do; 
							decr_rate_lost_2020 = 1; 
							eff_rate_lost = eff_rate_lost * _u10 / 3; eff_rate_lost=round(eff_rate_lost,0.01); 
						end;

* decr_rate_lost_art_2020; 
						decr_rate_lost_art_2020 = 0;  
						if _u11 < 0.90 then do; 
							decr_rate_lost_art_2020 = 1; 
							eff_prob_lost_art = eff_prob_lost_art + ((0.5 + 0.5*_u12) * (1 - eff_prob_lost_art) ) ; eff_prob_lost_art = round(eff_prob_lost_art, 0.01); 
						end;

* incr_rate_return_2020; 
						incr_rate_return_2020 = 0;  
						if _u13 < 0.90 then do; 
							incr_rate_return_2020 = 1; 
							eff_rate_return = eff_rate_return * (2 + 3*_u14);  eff_rate_return = round(eff_rate_return,0.01);  
						end;

* incr_rate_restart_2020; 
						incr_rate_restart_2020 = 0;  
						if _u17 < 0.90 then do; 
							incr_rate_restart_2020 = 1; 
							eff_rate_restart = eff_rate_restart * (2 + 3*_u18);  eff_rate_restart = round(eff_rate_restart,0.01);  
						end;

* incr_rate_init_2020; 	incr_rate_init_2020 = 0;  
						if _u19 < 0.90 then do; 
							incr_rate_init_2020 = 1; 
							eff_pr_art_init = eff_pr_art_init + ( (0.5 + 0.5*_u20) * (1 - eff_pr_art_init) ); eff_pr_art_init=round(eff_pr_art_init,0.01); 
						end;

* reg_option_switch_2020;	
						reg_option_switch_2020 = 0;
						if _u49 < 0.30 then do; reg_option = 104; reg_option_switch_2020 = 104; end;
						if 0.30 <= _u49 < 0.6 then do; reg_option = 116; reg_option_switch_2020 = 116; end;
						if 0.60 <= _u49 < 0.9 then do; reg_option = 103; reg_option_switch_2020 = 119; end;

* art_mon_drug_levels_2020;
						art_mon_drug_levels_2020 = 0;
						if _u50 < 0.9 then do;
							art_mon_drug_levels_2020 = 1;
							if reg_option = 103 then reg_option = 119;
							if reg_option = 104 then reg_option = 118;
							if reg_option = 113 then reg_option = 115;
							if reg_option = 116 then reg_option = 117; 
						end;

* decr_rate_int_choice_2020; 
						decr_rate_int_choice_2020 = 0;  
						if _u21 < 0.90 then do; 
							decr_rate_int_choice_2020 = 1; 
							eff_rate_int_choice = eff_rate_int_choice * _u22/3; eff_rate_int_choice = round(eff_rate_int_choice,0.001); 
						end;

* incr_prob_vl_meas_done_2020; 
						incr_prob_vl_meas_done_2020 = 0;  
						if _u23 < 0.90 then do; 
							incr_prob_vl_meas_done_2020 = 1; 
							eff_prob_vl_meas_done = 0.85; 
							cd4_monitoring=0; * this needed because cd4_monitoring was = 1 in half of people with no vl; 
						end;

* ten_is_taf_2020;		ten_is_taf_2020 = 0;
						if _u51 < 0.1 then do;
						ten_is_taf_2020 = 1;
						end;

* incr_pr_switch_line_2020; 
						incr_pr_switch_line_2020 = 0;  
						if _u24 < 0.90 then do; 
							incr_pr_switch_line_2020 = 1; 
							eff_pr_switch_line = 0.80; 
						end;
		end;



* prep;			

if _u48 <= 1.0 then prep_improvements = 1;

* pop_wide_tld_2020;	pop_wide_tld_2020 = 0;
						if _u47 < 0.20 then do;  
							pop_wide_tld_2020 = 1; pop_wide_tld = 1; expand_prep_to_all_2020 = 1; prep_strategy = 7;
							prob_prep_pop_wide_tld = 0.05; 
							prep_improvements = 0;  * this is instead of current type of prep program;
						end;

						if prep_improvements = 1 then do;

* incr_adh_pattern_prep_2020;
						incr_adh_pattern_prep_2020 = 0;  
						if _u25 < 0.80 then do; 
							incr_adh_pattern_prep_2020 = 1; 
							adhav_pr = adhav*0.90; 
						end;		

* inc_r_test_startprep_2020;
						inc_r_test_startprep_2020 = 0;  if _u26 <= 1.0 then do; 
							inc_r_test_startprep_2020 = 1; 
							eff_rate_test_startprep = eff_rate_test_startprep + (0.5 + 0.5*_u27) * (1 - eff_rate_test_startprep); 
							eff_rate_test_startprep = round(eff_rate_test_startprep, 0.01);
						end;		

* incr_r_test_restartprep_2020;
						incr_r_test_restartprep_2020 = 0;  
						if _u28 <= 1.00 then do; 
							incr_r_test_restartprep_2020 = 1; 
							eff_rate_test_restartprep = eff_rate_test_restartprep + (0.5 + 0.5*_u29) * (1 - eff_rate_test_restartprep); 
							eff_rate_test_restartprep = round(eff_rate_test_restartprep, 0.01);
						end;		

* decr_r_choose_stop_prep_2020;
						incr_rate_choose_stop_prep_2020 = 0;  
						if _u30 < 0.80 then do; 
							incr_rate_choose_stop_prep_2020 = 1; 
							eff_rate_choose_stop_prep = eff_rate_choose_stop_prep / (1 + _u31) ; 
							eff_rate_choose_stop_prep = round(eff_rate_choose_stop_prep, 0.01);
						end;		

* inc_p_prep_restart_choi_2020;
						inc_p_prep_restart_choi_2020 = 0;  
						if _u32 < 0.80 then do; 
							inc_p_prep_restart_choi_2020 = 1; 
							eff_prob_prep_restart_choice = eff_prob_prep_restart_choice * (1 + _u33) ; 
							eff_prob_prep_restart_choice = round(eff_prob_prep_restart_choice, 0.01);
						end;		

* incr_prepuptake_sw_2020;
						incr_prepuptake_sw_2020 = 0;  
						if _u34 < 0.80 then do; incr_prepuptake_sw_2020 = 1; 
							if _u35 < 0.5 and prep_willing_sw = 0 then prep_willing_sw = 1;
						end;		

* incr_prepuptake_pop_2020;
						incr_prepuptake_pop_2020 = 0;  
						if _u36 < 0.80 then do; 
							incr_prepuptake_pop_2020 = 1; 
							if _u37 < 0.5 and prep_willing_pop = 0 then prep_willing_pop = 1;
						end;	

* expand_prep_to_all_2020;
						expand_prep_to_all_2020 = 0;  
						if _u38 < 0.50 then do;
							expand_prep_to_all_2020 = 1; prep_strategy = 7;
						end;
			end;





* circumcision;			if _u39 < 0.00 then circ_improvements = 1;
						if circ_improvements = 1 then do;
							if _u40 < 0.33 then circ_inc_rate_2020 = 1; if 0.33 <= _u40 < 0.67 then circ_inc_rate_2020 = 2; 
							if 0.67 <= _u40 then circ_inc_rate_2020 = 3;
						end;

* increase condom use - decrease in newp;
						condom_incr_2020 = 0;
						if _u41 < 0.00 then condom_incr_2020 = 1;


	end;
end;

* ==========================================================================================================================================;




if reg_option in (102 103 104 105 106 113 115 116 117 118 119) then flr=2; 
if reg_option in (107) then flr=1;

if initial_pr_switch_line =. then initial_pr_switch_line = eff_pr_switch_line; 
if initial_prob_vl_meas_done = . then initial_prob_vl_meas_done = eff_prob_vl_meas_done;  

if reg_option in (108) then do; eff_pr_switch_line=0.85; eff_prob_vl_meas_done=0.85; end; 
if reg_option in (101 102 103 104 105 106 107 109 110 111 112 113 114 115 116 117 118 119) then do; 
eff_pr_switch_line=initial_pr_switch_line; eff_prob_vl_meas_done=initial_prob_vl_meas_done; end; 

if reg_option in (101 102 103 104 107 110 113 116) then art_monitoring_strategy=150;
if reg_option in (105 106 108 109 111 112 114) then art_monitoring_strategy=153;
if reg_option in (115 117 118 119) then art_monitoring_strategy=1500;


* may 2019 - for pico;
if reg_option in (112 114) and caldate{t}-yrart ge 1 then art_monitoring_strategy=150;




* RATE OF TESTING WHEN HAVE WHO3, WHO4 or TB and for GENERAL POPULATION; 

if date_start_testing lt caldate{t} le 2015  then do;
	test_rate_who4 = min(0.9,test_rate_who4*incr_test_rate_sympt);  
	test_rate_tb  = min(0.8,test_rate_tb*incr_test_rate_sympt);  * 0.8 mar19;
	test_rate_who3 = min(0.7,test_rate_who3*incr_test_rate_sympt); * 0.7 mar19;
end;	


tested_anc=.;

* Jan2017 - modified testing criteria so that prep_tm1 =0 as people previously on prep would only test for prep purposes;
if t ge 2 and date_start_testing <= caldate{t} and prep_tm1 =0 then do; 

		rate_1sttest = initial_rate_1sttest + (min(caldate{t},date_test_rate_plateau)-(date_start_testing+5.5))*an_lin_incr_test;
		rate_reptest = 0.0000 + (min(caldate{t},date_test_rate_plateau)-(date_start_testing+5.5))*an_lin_incr_test;

		if gender=2 then do; rate_1sttest = rate_1sttest * 1.5  ; rate_reptest = rate_reptest * 1.5  ;   end;
end;


if caldate{t} >= 2020.5 and incr_test_2020 = 1 then do; rate_1sttest = rate_1sttest * 2.0; rate_reptest = rate_reptest * 2.0; end;
if caldate{t} >= 2020.5 and incr_test_2020 = 2 then do; rate_1sttest = rate_1sttest * 5.0; rate_reptest = rate_reptest * 5.0; end;
if caldate{t} >= 2020.5 and incr_test_2020 = 3 then do; rate_1sttest = rate_1sttest * 10.0; rate_reptest = rate_reptest * 10.0; end;
if caldate{t} >= 2020.5 and incr_test_2020 = 4 and gender=1 then do; rate_1sttest = rate_1sttest * 2.0; rate_reptest = rate_reptest * 2.0; end;
if caldate{t} >= 2020.5 and incr_test_2020 = 5 and gender=1 then do; rate_1sttest = rate_1sttest * 5.0; rate_reptest = rate_reptest * 5.0; end;
if caldate{t} >= 2020.5 and incr_test_2020 = 6 and gender=1 then do; rate_1sttest = rate_1sttest * 10.0; rate_reptest = rate_reptest * 10.0; end;





* RATE OF ATTENDING AN ANC FOR PREGNANT WOMEN; 

if gender=2 then do;
	if      date_start_testanc le caldate{t} lt 2015    then prob_anc      = max(prob_anc, 0.1)+rate_testanc_inc;
	if                            caldate{t} =  2014.75 then prob_anc_2015 = prob_anc;
	if                      	  caldate{t} ge 2015    then prob_anc      = prob_anc_2015;
	if prob_anc gt 0.975   then prob_anc=0.975;  

* Receiving PMTCT;
	if caldate{t} gt date_pmtct then prob_pmtct = 0 + (caldate{t}-date_pmtct)*pmtct_inc_rate;
	if 							  	 prob_pmtct gt 0.975 then prob_pmtct=0.975;
end;


***LBM Jul19 - check values;
* MALE CIRCUMCISION ;
  
if t ge 2 then do;

if 10 le age{t-1} lt 15 then do;
if mc_int < caldate{t} le 2016 then prob_circ = 0 + (caldate{t}-mc_int)*circ_inc_rate;
end;

if 15 le age{t-1} lt 20 then do;
if mc_int < caldate{t} le 2016 then prob_circ = (0 + (caldate{t}-mc_int)*circ_inc_rate) * 0.5;
end;

if 20 le age{t-1} le 50 then do;
if mc_int < caldate{t} le 2016 then prob_circ = (0 + (caldate{t}-mc_int)*circ_inc_rate) * 0.25;
end;

end;


if caldate{t} > 2016 and 10 le age{t-1} lt 15 then prob_circ = (2016-mc_int)*circ_inc_rate;
if caldate{t} > 2016 and 15 le age{t-1} lt 20 then prob_circ = (2016-mc_int)*circ_inc_rate * 0.5;
if caldate{t} > 2016 and 20 le age{t-1} le 50 then prob_circ = (2016-mc_int)*circ_inc_rate * 0.25;

if caldate{t} = 2020.5 and circ_inc_rate_2020 = 1 then prob_circ = 1.5 * prob_circ;
if caldate{t} = 2020.5 and circ_inc_rate_2020 = 2 then prob_circ = 2.0 * prob_circ;
if caldate{t} = 2020.5 and circ_inc_rate_2020 = 3 then prob_circ = 5.0 * prob_circ;


***Circumcision at birth and for 11-14 years olds;

***DHS 2015 states 2/3 of muslim men circumcised, approx 1% muslim population (CIA);
birth_circ=0;
u=uniform(0);
if t ge 2 and age{t-1}=0.25 and gender=1 then do;	
		if u < prob_birth_circ then do;
			mcirc=1;     
			birth_circ=1;
			date_mcirc=caldate{t};
		end;
end;


* circumcision intervention ;
u_circ=uniform(0);
new_mcirc=0;tested_circ=0;

if  caldate{t} >= mc_int > . and gender=1 and registd{t-1} ne 1  and mcirc ne 1  and hard_reach ne 1 then do; 

	if u_circ lt prob_circ then do;
		if t ge 2 and tested{t-1} ne 1 then do;
			 tested{t}=1;tested_circ=1;dt_last_test=caldate{t};np_lasttest=0;
			 if ever_tested ne 1 then do;date1test=caldate{t}; ever_tested=1; dt_last_test=caldate{t};end;
		end;
		if hiv{t} ne 1 then do;	mcirc=1;new_mcirc=1;end;
	end;

	if test_link_circ=1 and t ge 2 and tested{t-1}=1 and registd{t-1} ne 1 then do;
		uc=uniform(0); if uc < test_link_circ_prob then do; mcirc=1;new_mcirc=1; end;
	end;
	
	if mcirc=1 then date_mcirc=caldate{t};

end;

* treatment / follow-up status stays the same from t-1 to t, unless changed later in program;

if t ge 2 and caldate{t} < 2070.0 and dead{t-1} ne 1 and dead{t-1} ne .  then do;

cost=0;cost_test=0;
hiv{t}=hiv{t-1};
dead{t}=dead{t-1};
registd{t}=registd{t-1};
sw{t}=sw{t-1};
adc{t}=0;

visit_prep=.;
ageg_ep=.;

end;


age2=age1+0.25;


if t ge 2 and gender = 2 and 25 <= age{t-1} < 55 and want_no_more_children ne 1 then do;
u=uniform(0); if u < 0.005 then want_no_more_children = 1;
end;



* PREGNANCY AND CHILDREN;

if t ge 2 and gender=2 then do;
	pregnant=0;anc=0;on_sd_nvp=0;on_dual_nvp=0;
	if cum_children=. and dead{t}=0 then cum_children=0;
	if act_years_sw=. then act_years_sw=0;
	if episodes_sw=.     then episodes_sw=0;
	if years_ep=.		  then years_ep=0;
	
	if      15 <= age{t-1} < 25 then do;prob_pregnancy=prob_pregnancy_b*fold_preg1524; end;
	else if 25 <= age{t-1} < 35 then do;prob_pregnancy=prob_pregnancy_b*fold_preg2534; end;
	else if 35 <= age{t-1} < 45 then do;prob_pregnancy=prob_pregnancy_b; end;
	else if 45 <= age{t-1} < 55 then do;prob_pregnancy=prob_pregnancy_b*fold_preg4554; end;
	else if 55 <= age{t-1} < 65 then do;prob_pregnancy=prob_pregnancy_b*fold_preg5564; end;
	if . lt prob_pregnancy lt 0 then prob_pregnancy=0;

	if want_no_more_children = 1 then prob_pregnancy = prob_pregnancy / 5; * jul18;

	if cum_children ge 10 then prob_pregnancy = 0;

end;



* SEXUAL BEHAVIOUR;

rred_rc=1.0;

if 1995 < caldate{t} <= 2000 then rred_rc = ych_risk_beh_newp**(caldate{t}-1995);
if 2000 < caldate{t} <= 2010 then rred_rc = ych_risk_beh_newp**(2000-1995); 
if 2010 < caldate{t} <= 2015 then rred_rc = (ych_risk_beh_newp**(2000-1995))*(ych2_risk_beh_newp**(caldate{t}-2010));
if 2015 < caldate{t}         then rred_rc = (ych_risk_beh_newp**(2000-1995))*(ych2_risk_beh_newp**(2015-2010));

* mar19;
if caldate{t} = 2020.5 and condom_incr_2020 = 1 then rred_rc = rred_rc * 0.9;

ch_risk_beh_ep=1.0;
if 1995 < caldate{t} <= 2000 then ch_risk_beh_ep = ych_risk_beh_ep**(caldate{t}-1995);
if        caldate{t} >  2000 then ch_risk_beh_ep = ych_risk_beh_ep**(2000-1995);

if t ge 2 then age{t}=age{t-1}+0.25;

if age{t} < 15 then do; hiv{t}=.; goto xx55; end;



* UPDATED RISK BEHAVIOUR ;

if t ge 2 and 15 <= age{t} < 65 and death=. then do; * do loop ends at xx22;

mr_epi{t}=mr_epi{t-1};
mr_epdiag{t}=mr_epdiag{t-1};


* risk of having sti;
sti{t}=0;
if t ge 2 and  sti{t-1}=0 then  do;
	d=uniform(0);  if d < newp{t-1} / 20 then sti{t}=1;
end;
if t ge 2 and sti{t-1}=1 then  do;
	d=uniform(0);  if d < newp{t-1}/5 then sti{t}=1;
end;



if m15r =. then m15r=1;
if m25r =. then m25r=1;
if m35r =. then m35r=1;
if m45r =. then m45r=1;
if m55r =. then m55r=1;
if w15r =. then w15r=1;
if w25r =. then w25r=1;
if w35r =. then w35r=1;
if w45r =. then w45r=1;
if w55r =. then w55r=1;

if 0.90 > m15r or m15r > 1.11 then do; rred_a_15m=rred_a_15m*m15r; end;
if 0.90 > m15r or m15r > 1.11 then do; rred_a_20m=rred_a_20m*m15r; end;
if 0.90 > m25r or m25r > 1.11 then do; rred_a_25m=rred_a_25m*m25r; end;
if 0.90 > m25r or m25r > 1.11 then do; rred_a_30m=rred_a_30m*m25r; end;
if 0.90 > m35r or m35r > 1.11 then do; rred_a_35m=rred_a_35m*m35r; end;
if 0.90 > m35r or m35r > 1.11 then do; rred_a_40m=rred_a_40m*m35r; end;
if 0.90 > m45r or m45r > 1.11 then do; rred_a_45m=rred_a_45m*m45r; end;
if 0.90 > m45r or m45r > 1.11 then do; rred_a_50m=rred_a_50m*m45r; end;
if 0.90 > m55r or m55r > 1.11 then do; rred_a_55m=rred_a_55m*m55r; end;
if 0.90 > m55r or m55r > 1.11 then do; rred_a_60m=rred_a_60m*m55r; end;

if 0.90 > w15r or w15r > 1.11 then do; rred_a_15w=rred_a_15w*w15r; end;
if 0.90 > w15r or w15r > 1.11 then do; rred_a_20w=rred_a_20w*w15r; end;
if 0.90 > w25r or w25r > 1.11 then do; rred_a_25w=rred_a_25w*w25r; end;
if 0.90 > w25r or w25r > 1.11 then do; rred_a_30w=rred_a_30w*w25r; end;
if 0.90 > w35r or w35r > 1.11 then do; rred_a_35w=rred_a_35w*w35r; end;
if 0.90 > w35r or w35r > 1.11 then do; rred_a_40w=rred_a_40w*w35r; end;
if 0.90 > w45r or w45r > 1.11 then do; rred_a_45w=rred_a_45w*w45r; end;
if 0.90 > w45r or w45r > 1.11 then do; rred_a_50w=rred_a_50w*w45r; end;
if 0.90 > w55r or w55r > 1.11 then do; rred_a_55w=rred_a_55w*w55r; end;
if 0.90 > w55r or w55r > 1.11 then do; rred_a_60w=rred_a_60w*w55r; end;


if gender=1 then do;

if 15 <= age{t} < 20 then rred_a=rred_a_15m; 
if 20 <= age{t} < 25 then rred_a=rred_a_20m;
if 25 <= age{t} < 30 then rred_a=rred_a_25m;
if 30 <= age{t} < 35 then rred_a=rred_a_30m;
if 35 <= age{t} < 40 then rred_a=rred_a_35m;
if 40 <= age{t} < 45 then rred_a=rred_a_40m;
if 45 <= age{t} < 50 then rred_a=rred_a_45m;
if 50 <= age{t} < 55 then rred_a=rred_a_50m;
if 55 <= age{t} < 60 then rred_a=rred_a_55m;
if 60 <= age{t} < 65 then rred_a=rred_a_60m;

end;

if gender=2 then do;

if 15 <= age{t} < 20 then rred_a=rred_a_15w; 
if 20 <= age{t} < 25 then rred_a=rred_a_20w;
if 25 <= age{t} < 30 then rred_a=rred_a_25w;
if 30 <= age{t} < 35 then rred_a=rred_a_30w;
if 35 <= age{t} < 40 then rred_a=rred_a_35w;
if 40 <= age{t} < 45 then rred_a=rred_a_40w;
if 45 <= age{t} < 50 then rred_a=rred_a_45w;
if 50 <= age{t} < 55 then rred_a=rred_a_50w;
if 55 <= age{t} < 60 then rred_a=rred_a_55w;
if 60 <= age{t} < 65 then rred_a=rred_a_60w;

end;

*-----------------------------------------------------------------------------------------------------------------------------------------;

if rbm = 4 then do;

* if infected and have adc then reduced risk behaviour;
rred_adc=1.0; if hiv{t-1}=1 and adc{t-1}=1 then rred_adc = 0.2;

* reduction in sexual behaviour following +ve hiv test ;
rred_d=1.0;
if hiv{t-1}=1 then do;
		if   . < date1pos <= caldate{t} <= date1pos+0.5 then rred_d = ch_risk_diag_newp;
		if date1pos ne . and caldate{t} >  date1pos+0.5 then rred_d = sqrt(ch_risk_diag_newp);
end;


rred_balance= 1 ;

if gender=1 then do;
		 if          d_s_newp >= 10000 then rred_balance = 0.20 ;
	else if  3000 <= d_s_newp <  10000 then rred_balance = 0.70 ;
	else if   500 <= d_s_newp <  3000 then rred_balance = 0.70 ;
	else if   400 <= d_s_newp <  500  then rred_balance = 0.75 ;
	else if   300 <= d_s_newp <  400  then rred_balance = 0.80 ;
	else if   200 <= d_s_newp <  300  then rred_balance = 0.90 ;
	else if   100 <= d_s_newp <  200  then rred_balance = 0.97 ;
	else if  -200 <= d_s_newp < -100  then rred_balance = 1.03 ;
	else if  -300 <= d_s_newp < -200  then rred_balance = 1.11 ;
	else if  -400 <= d_s_newp < -300  then rred_balance = 1/.8 ;
	else if  -500 <= d_s_newp < -400  then rred_balance = 1/.75;
	else if -3000 <= d_s_newp < -500  then rred_balance = 1/.7;
	else if -10000 <= d_s_newp < -3000 then rred_balance = 1/.7;
	else if .     <= d_s_newp < -10000 then rred_balance = 5 ;
end;
else if gender=2 then do;
	     if          d_s_newp >= 10000 then rred_balance = 5 ;
	else if  3000 <= d_s_newp <  10000 then rred_balance = 1/.7;      
	else if   500 <= d_s_newp <  3000 then rred_balance = 1/.7 ;    
	else if   400 <= d_s_newp <  500  then rred_balance = 1/.75;
	else if   300 <= d_s_newp <  400  then rred_balance = 1/.8 ;
	else if   200 <= d_s_newp <  300  then rred_balance = 1.11 ;
	else if   100 <= d_s_newp <  200  then rred_balance = 1.03 ;
	else if  -200 <= d_s_newp < -100  then rred_balance = 0.97 ;
	else if  -300 <= d_s_newp < -200  then rred_balance = 0.90 ;
	else if  -400 <= d_s_newp < -300  then rred_balance = 0.8  ;
	else if  -500 <= d_s_newp < -400  then rred_balance = 0.75;
	else if -3000 <= d_s_newp < -500  then rred_balance = 0.7 ;     
	else if -10000 <= d_s_newp < -3000 then rred_balance = .7  ;     
	else if .     <= d_s_newp < -10000 then rred_balance = 0.2 ;
end;

rred_ep = 1 ; if ep{t-1} = 1 and conc_ep ne . then rred_ep = conc_ep ;  * mar16 ;

rred= newp_factor*(rred_a * rred_p * rred_adc * rred_d * rred_rc * rred_balance * rred_ep); 
* rred_ep lower or greater concurrence with ep - to introduce a potential dependence of newp on ep - which could influence
the magnitude of an epidemic generated for a given mean level of condomless sex;



if gender=1 and t ge 2 then do;

if sex_beh_trans_matrix_m=1 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.00005; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.00005; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.00025; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.05; *newp 10x; s4=0.9500; end;
end;
if sex_beh_trans_matrix_m=2 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.00025; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.00025; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.00125; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.20; *newp 10x; s4=0.8000; end;
end;
if sex_beh_trans_matrix_m=3 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.0005 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.0005 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.0025 ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=4 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0001 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.0001 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.0005  ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.04; *newp=1; s2=0.04; *newp >= 2; s3=0.09; *newp 10x; s4=0.8300; end;
end;
if sex_beh_trans_matrix_m=5 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.005  ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.0005 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.0025 ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.025; *newp=1; s2=0.06; *newp >= 2; s3=0.17; *newp 10x; s4=0.7500; end;
end;
if sex_beh_trans_matrix_m=6 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.005  ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.04; *newp=1; s2=0.08; *newp >= 2; s3=0.21; *newp 10x; s4=0.6700; end;
end;
if sex_beh_trans_matrix_m=7 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.000025; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.000025; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.000125; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.05; *newp 10x; s4=0.9500; end;
end;
if sex_beh_trans_matrix_m=8 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.000125; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.000125; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.000625; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.20; *newp 10x; s4=0.8000; end;
end;
if sex_beh_trans_matrix_m=9 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.00125 ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=10 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.0005 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0005 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.0025 ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=11 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.001 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.001 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.005  ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.04; *newp=1; s2=0.08; *newp >= 2; s3=0.21; *newp 10x; s4=0.6700; end;
end;
if sex_beh_trans_matrix_m=12 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.00025 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.00025 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.00125 ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.00; *newp 10x; s4=1.0000; end;
end;
if sex_beh_trans_matrix_m=13 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.0005 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0005 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.90; *newp=1; s2=0.05; *newp >= 2; s3=0.03; *newp 10x; s4=0.02   ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.90; *newp=1; s2=0.05; *newp >= 2; s3=0.03; *newp 10x; s4=0.02  ; end;
end;
if sex_beh_trans_matrix_m=14 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.001 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.01; *newp 10x; s4=0.01   ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.01; *newp 10x; s4=0.0100; end;
end;
if sex_beh_trans_matrix_m=15 then do;
if       newp{t-1}=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.00025 ; end;
if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if 4  <= newp{t-1}<10 then do; *newp=0; s1=0.80; *newp=1; s2=0.10; *newp >= 2; s3=0.05; *newp 10x; s4=0.05    ; end;
if 10 <= newp{t-1}    then do; *newp=0; s1=0.80; *newp=1; s2=0.10; *newp >= 2; s3=0.05; *newp 10x; s4=0.05  ; end;
end;



s2=s2*rred; s3=s3*rred; s4=s4*rred; 
cu1=s1;cu2=cu1+s2;cu3=cu2+s3;cu4=cu3+s4; a=uniform(0);
if            a < cu1/cu4 then do; newp{t}=0; end; 
if cu1/cu4 <= a < cu2/cu4  then do; e=uniform(0); if e < 0.50 then newp{t}=1; if 0.50 <= e < 0.80 then newp{t}=2; 
											if e ge 0.80 then newp{t}=3; end;
if cu2/cu4 <= a < cu3/cu4 then do; e=uniform(0); if e < 0.35 then newp{t}=4; if 0.35 <= e < 0.56 then newp{t}=5; if 0.56 <= e < 0.73 then newp{t}=6; 
					if 0.73 <= e < 0.86 then newp{t}=7; if 0.86 <= e < 0.95 then newp{t}=8; if 0.95 <= e then newp{t}=9; end;
if cu3/cu4 <= a < cu4/cu4 then do; if e < 0.60 then newp{t}=10; if 0.60 <= e < 0.80 then newp{t}=15; if 0.80 <= e < 0.90 then newp{t}=20; 
					if 0.90 <= e < 0.95 then newp{t}=25; if 0.95 <= e < 0.99 then newp{t}=30; if 0.99 <= e then newp{t}=35; end;

end;


if gender=2 and t ge 2 then do;

if sex_beh_trans_matrix_w=1 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=2 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=3 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=4 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=5 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;
if sex_beh_trans_matrix_w=6 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=7 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=8 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=9 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=10 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;
if sex_beh_trans_matrix_w=11 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=12 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=13 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=14 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=15 then do;
	if       newp{t-1}=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp{t-1}<=3  then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;

s2=s2*rred;
cu1=s1;cu2=cu1+s2; a=uniform(0);
if            a < cu1/cu2 then do; newp{t}=0; end; 
if cu1/cu2 <= a < cu2/cu2  then do; 
	e=uniform(0); 
	if age{t} >= 25 then do;
	if e < 0.70 then newp{t} = 1; if 0.70 <= e < 0.85 then newp{t} = 2; if e ge 0.85 then newp{t} = 3; 
	end;	
	if 15 <= age{t} < 25 then do;
	if e < 0.30 then newp{t}=1; 		if 0.30 <= e < 0.50 then newp{t}=2; 	if 0.50 <= e < 0.65 then newp{t}=3; 
	if 0.65 <= e < 0.77 then newp{t}=4; 	if 0.77 <= e < 0.86 then newp{t}=5; 	if 0.86 <= e < 0.92 then newp{t}=6; 
	if 0.92 <= e < 0.96 then newp{t}=7; if 0.96 <= e < 0.98 then newp{t}=8; 	if 0.98 <= e then newp{t}=9; 
	end;	
end;

end;

e=uniform(0);

if t ge 2  then do;
if gender = 2 and sw{t-1} = 0 then do;

	if ever_sw ne 1 then do;
	if 15 <= age{t} < 20 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_1519*rred_rc then sw{t}=1;
	if 20 <= age{t} < 25 and life_sex_risk = 2 and e < base_rate_sw*rred_rc then sw{t}=1;
	if 25 <= age{t} < 35 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_2534*rred_rc then sw{t}=1;
	if 35 <= age{t} < 50 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_3549*rred_rc then sw{t}=1;

	if 15 <= age{t} < 20 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_1519*rr_sw_life_sex_risk_3*rred_rc then sw{t}=1;
	if 20 <= age{t} < 25 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_life_sex_risk_3*rred_rc then sw{t}=1;
	if 25 <= age{t} < 35 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_2534*rr_sw_life_sex_risk_3*rred_rc then sw{t}=1;
	if 35 <= age{t} < 50 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_3549*rr_sw_life_sex_risk_3*rred_rc then sw{t}=1;
	end;

	if ever_sw = 1 then do;
	if 15 <= age{t} < 20 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_1519*rred_rc*rr_sw_prev_sw then sw{t}=1;
	if 20 <= age{t} < 25 and life_sex_risk = 2 and e < base_rate_sw*rred_rc*rr_sw_prev_sw then sw{t}=1;
	if 25 <= age{t} < 35 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_2534*rred_rc*rr_sw_prev_sw then sw{t}=1;
	if 35 <= age{t} < 50 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_3549*rred_rc*rr_sw_prev_sw then sw{t}=1;

	if 15 <= age{t} < 20 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_1519*rr_sw_life_sex_risk_3*rred_rc*rr_sw_prev_sw then sw{t}=1;
	if 20 <= age{t} < 25 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_life_sex_risk_3*rred_rc*rr_sw_prev_sw then sw{t}=1;
	if 25 <= age{t} < 35 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_2534*rr_sw_life_sex_risk_3*rred_rc*rr_sw_prev_sw then sw{t}=1;
	if 35 <= age{t} < 50 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_3549*rr_sw_life_sex_risk_3*rred_rc*rr_sw_prev_sw then sw{t}=1;
	end;

end;
end;


if t ge 2 then do;
	if sw{t-1} ne 1 and sw{t}=1 then do; 
		if ever_sw ne 1 then do; 
			date_start_sw = caldate{t}; age_deb_sw=age{t}; 
		end; 
		if ever_sw=1 then date_restart_sw=caldate{t}; 
	end;
end;

if sw{t}=1 then  ever_sw = 1;

rate_stop_sexwork = base_rate_stop_sexwork; if age{t} >= 40 then rate_stop_sexwork = rate_stop_sexwork * 3;
if t ge 2 then do;
	if sw{t-1}=1 then do;
		d=uniform(0);
		if d < rate_stop_sexwork/rred_rc or age{t} ge 50 then do; sw{t}=0; date_stop_sw=caldate{t};  end;
	end;
end;

if sw{t} = 1 then do;
e=uniform(0);


if t ge 2 and newp{t-1} = 0 then do;
	if e < 0.8 then newp{t}=0;
	if 0.8 <= e < 0.9 then do; q=uniform(0); 
		if q < 0.7 then newp{t}=1; if 0.7 <= q < 0.8 then newp{t}=2; if 0.8 <= q < 0.9 then newp{t}=3; if 0.9 <= q < 0.95 then newp{t}=4;    
		if 0.95 <= q < 0.98 then newp{t}=5; if 0.98 <= q       then newp{t}=6;    
	end;
	if 0.9 <= e < 0.95 then do; q=uniform(0); newp{t} = 6 + (q*34); newp{t} = round(newp{t},1);	 end;
	if 0.95 <= e < 0.99 then do; q=uniform(0); 	newp{t} = 41 + (q*89); newp{t} = round(newp{t},1);  end;
	if 0.99 <= e       then do; q=uniform(0); 	newp{t} = 131 + (q*50 ); newp{t} = round(newp{t},1);  end;
end;

if  t ge 2 and 1 <= newp{t-1} <= 6 then do;
	if e < 0.4 then newp{t}=0;
	if 0.4 <= e < 0.9 then do; q=uniform(0); 
		if q < 0.7 then newp{t}=1; if 0.7 <= q < 0.8 then newp{t}=2; if 0.8 <= q < 0.9 then newp{t}=3; if 0.9 <= q < 0.95 then newp{t}=4;    
		if 0.95 <= q < 0.98 then newp{t}=5; if 0.98 <= q       then newp{t}=6;    
	end;
	if 0.9 <= e < 0.97 then do; q=uniform(0); newp{t} = 6 + (q*34); newp{t} = round(newp{t},1);	 end;
	if 0.97 <= e < 0.99 then do; q=uniform(0); 	newp{t} = 41 + (q*89); newp{t} = round(newp{t},1);  end;
	if 0.99 <= e       then do; q=uniform(0); 	newp{t} = 131 + (q*50 ); newp{t} = round(newp{t},1);  end;
end;

if  t ge 2 and 7 <= newp{t-1} <= 40 then do;
	if e < 0.05 then newp{t}=0;
	if 0.05 <= e < 0.1 then do; q=uniform(0); 
		if q < 0.7 then newp{t}=1; if 0.7 <= q < 0.8 then newp{t}=2; if 0.8 <= q < 0.9 then newp{t}=3; if 0.9 <= q < 0.95 then newp{t}=4;    
		if 0.95 <= q < 0.98 then newp{t}=5; if 0.98 <= q       then newp{t}=6;   
	end;
	if 0.1 <= e < 0.9 then do; q=uniform(0); newp{t} = 6 + (q*34); newp{t} = round(newp{t},1);	 end;
	if 0.9 <= e < 0.98 then do; q=uniform(0); 	newp{t} = 41 + (q*89); newp{t} = round(newp{t},1);  end;
	if 0.98 <= e       then do; q=uniform(0); 	newp{t} = 131 + (q*50 ); newp{t} = round(newp{t},1);  end;
end;

if  t ge 2 and  41 <= newp{t-1} <= 130 then do;
	if e < 0.05 then newp{t}=0;
	if 0.05 <= e < 0.1 then do; q=uniform(0); 
		if q < 0.7 then newp{t}=1; if 0.7 <= q < 0.8 then newp{t}=2; if 0.8 <= q < 0.9 then newp{t}=3; if 0.9 <= q < 0.95 then newp{t}=4;    
		if 0.95 <= q < 0.98 then newp{t}=5; if 0.98 <= q       then newp{t}=6;    
	end;
	if 0.1 <= e < 0.6 then do; q=uniform(0); newp{t} = 6 + (q*34); newp{t} = round(newp{t},1);	 end;
	if 0.6 <= e < 0.98 then do; q=uniform(0); 	newp{t} = 41 + (q*89); newp{t} = round(newp{t},1);  end;
	if 0.98 <= e       then do; q=uniform(0); 	newp{t} = 131 + (q*50 ); newp{t} = round(newp{t},1);  end;
end;

if  t ge 2 and  130 <= newp{t-1} then do;
	if e < 0.05 then newp{t}=0;
	if 0.05 <= e < 0.1 then do; q=uniform(0); 
		if q < 0.7 then newp{t}=1; if 0.7 <= q < 0.8 then newp{t}=2; if 0.8 <= q < 0.9 then newp{t}=3; if 0.9 <= q < 0.95 then newp{t}=4;    
		if 0.95 <= q < 0.98 then newp{t}=5; if 0.98 <= q       then newp{t}=6;  
	end;
	if 0.1 <= e < 0.2 then do; q=uniform(0); newp{t} = 6 + (q*34); newp{t} = round(newp{t},1);	 end;
	if 0.2 <= e < 0.3 then do; q=uniform(0); 	newp{t} = 41 + (q*89); newp{t} = round(newp{t},1);  end;
	if 0.3 <= e       then do; q=uniform(0); 	newp{t} = 131 + (q*50 ); newp{t} = round(newp{t},1);  end;
end;

end;


* depending on rrd_rc (population change in risk behaviour) set some sex workers to consistent condom use (newp = 0);
if sw{t}=1 and newp{t} ge 1 then do;
e=uniform(0);
if 0.95 <= rred_rc < 1.00 then do;if e < 0.02 then newp{t}=0; end;
if 0.90 <= rred_rc < 0.95 then do;if e < 0.04 then newp{t}=0; end;
if 0.80 <= rred_rc < 0.90 then do;if e < 0.06 then newp{t}=0; end;
if 0.70 <= rred_rc < 0.80 then do;if e < 0.08 then newp{t}=0; end;
if 0.00 <= rred_rc < 0.7 then do;if e < 0.10 then newp{t}=0; end;
end;





e=uniform(0);
if gender=1 then do;
	if      15 <= age{t} < 25 then do;
		if 0 < r_s_ep_m15w15 <0.95 then e=e/(3*r_s_ep_m15w15); if 0 < r_s_ep_m15w25 <0.95 then e=e/(3*r_s_ep_m15w25); if 0 < r_s_ep_m15w35 <0.95 then e=e/(3*r_s_ep_m15w35);
		if 0 < r_s_ep_m15w45 <0.95 then e=e/(3*r_s_ep_m15w45); if 0 < r_s_ep_m15w55 <0.95 then e=e/(3*r_s_ep_m15w55); end;
	else if 25 <= age{t} < 35 then do;
		if 0 < r_s_ep_m25w15 <0.95 then e=e/(3*r_s_ep_m25w15); if 0 < r_s_ep_m25w25 <0.95 then e=e/(3*r_s_ep_m25w25); if 0 < r_s_ep_m25w35 <0.95 then e=e/(3*r_s_ep_m25w35);
		if 0 < r_s_ep_m25w45 <0.95 then e=e/(3*r_s_ep_m25w45); if 0 < r_s_ep_m25w55 <0.95 then e=e/(3*r_s_ep_m25w55); end;
	else if 35 <= age{t} < 45 then do;
		if 0 < r_s_ep_m35w15 <0.95 then e=e/(3*r_s_ep_m35w15); if 0 < r_s_ep_m35w25 <0.95 then e=e/(3*r_s_ep_m35w25); if 0 < r_s_ep_m35w35 <0.95 then e=e/(3*r_s_ep_m35w35);
		if 0 < r_s_ep_m35w45 <0.95 then e=e/(3*r_s_ep_m35w45); if 0 < r_s_ep_m35w55 <0.95 then e=e/(3*r_s_ep_m35w55); end;
	else if 45 <= age{t} < 55 then do;
		if 0 < r_s_ep_m45w15 <0.95 then e=e/(3*r_s_ep_m45w15); if 0 < r_s_ep_m45w25 <0.95 then e=e/(3*r_s_ep_m45w25); if 0 < r_s_ep_m45w35 <0.95 then e=e/(3*r_s_ep_m45w35);
		if 0 < r_s_ep_m45w45 <0.95 then e=e/(3*r_s_ep_m45w45); if 0 < r_s_ep_m45w55 <0.95 then e=e/(3*r_s_ep_m45w55); end;
	else if 55 <= age{t} < 65 then do;
		if 0 < r_s_ep_m55w15 <0.95 then e=e/(3*r_s_ep_m55w15); if 0 < r_s_ep_m55w25 <0.95 then e=e/(3*r_s_ep_m55w25); if 0 < r_s_ep_m55w35 <0.95 then e=e/(3*r_s_ep_m55w35);
		if 0 < r_s_ep_m55w45 <0.95 then e=e/(3*r_s_ep_m55w45); if 0 < r_s_ep_m55w55 <0.95 then e=e/(3*r_s_ep_m55w55); end;
end;
else if gender=2 then do;
	if      15 <= age{t} < 25 then do;
		if r_s_ep_m15w15 >1.05 then e=e/(3*r_s_ep_m15w15); if r_s_ep_m25w15 >1.05 then e=e/(3*r_s_ep_m25w15); if r_s_ep_m35w15 >1.05 then e=e/(3*r_s_ep_m35w15); 
		if r_s_ep_m45w15 >1.05 then e=e/(3*r_s_ep_m45w15); if r_s_ep_m55w15 >1.05 then e=e/(3*r_s_ep_m55w15); end;
	else if 25 <= age{t} < 35 then do;
		if r_s_ep_m15w25 >1.05 then e=e/(3*r_s_ep_m15w25); if r_s_ep_m25w25 >1.05 then e=e/(3*r_s_ep_m25w25); if r_s_ep_m35w25 >1.05 then e=e/(3*r_s_ep_m35w25); 
		if r_s_ep_m45w25 >1.05 then e=e/(3*r_s_ep_m45w25); if r_s_ep_m55w25 >1.05 then e=e/(3*r_s_ep_m55w25); end;
	else if 35 <= age{t} < 45 then do;
		if r_s_ep_m15w35 >1.05 then e=e/(3*r_s_ep_m15w35); if r_s_ep_m25w35 >1.05 then e=e/(3*r_s_ep_m25w35); if r_s_ep_m35w35 >1.05 then e=e/(3*r_s_ep_m35w35); 
		if r_s_ep_m45w35 >1.05 then e=e/(3*r_s_ep_m45w35); if r_s_ep_m55w35 >1.05 then e=e/(3*r_s_ep_m55w35); end;
	else if 45 <= age{t} < 55 then do;
		if r_s_ep_m15w45 >1.05 then e=e/(3*r_s_ep_m15w45); if r_s_ep_m25w45 >1.05 then e=e/(3*r_s_ep_m25w45); if r_s_ep_m35w45 >1.05 then e=e/(3*r_s_ep_m35w45); 
		if r_s_ep_m45w45 >1.05 then e=e/(3*r_s_ep_m45w45); if r_s_ep_m55w45 >1.05 then e=e/(3*r_s_ep_m55w45); end;
	else if 55 <= age{t} < 65 then do;
		if r_s_ep_m15w55 >1.05 then e=e/(3*r_s_ep_m15w55); if r_s_ep_m25w55 >1.05 then e=e/(3*r_s_ep_m25w55); if r_s_ep_m35w55 >1.05 then e=e/(3*r_s_ep_m35w55); 
		if r_s_ep_m45w55 >1.05 then e=e/(3*r_s_ep_m45w55); if r_s_ep_m55w55 >1.05 then e=e/(3*r_s_ep_m55w55); end;
end;

* reduction in sexual behaviour following hiv+ test;
if t ge 3 and registd{t-1} ne 1 and epdiag{t-2}=0  and epdiag{t-1} =  1 then e=e/ch_risk_diag; 
if t ge 3 and registd{t-2} ne 1 and registd{t-1}=1 and epdiag{t-1} ne 1 then e=e/ch_risk_diag;


z=1; if caldate{t} ge 1995 then z=1/ch_risk_beh_ep;

* increased chance of longer term unprotected sex partnership ending after hiv diagnosis
in subject or in longer term partner (either due to starting to use condoms, stopping 
sex or partnership ending);
ep{t}=0; 
if  ep{t-1}=1 and lep=1 and e < (1-(0.25*z)) then ep{t}=1; 
if  ep{t-1}=1 and lep=2 and e < (1-(0.05*z)) then ep{t}=1; 
if  ep{t-1}=1 and lep=3 and e < (1-(0.02*z)) then ep{t}=1; 

u=uniform(0);
if       r_ep_mw >  1.2 and gender=2 then u=u/4;
if 1.1 < r_ep_mw <= 1.2 and gender=2 then u=u/2;
if 0.8 <= r_ep_mw < 0.9 and gender=1 then u=u/2;
if .   <  r_ep_mw < 0.8 and gender=1 then u=u/4;

* reduction in sexual behaviour following hiv+ test ;
if registd{t-1}=1 then u=u/ch_risk_diag;


if caldate{t} ge 1995 then u=u/ch_risk_beh_ep;
* less chance of starting longer term unprotected sex partnership after hiv diagnosis
in subject;
if ep{t-1}=0 and 15 <= age{t} < 25 and u < eprate then do; 
	ep{t}=1; d=uniform(0); if d < 0.30 then lep=1; if .30 <= d < 0.60 then lep=2;  if .60 <= d then lep=3; end;
if ep{t-1}=0 and 25 <= age{t} < 35 and u < eprate then do; 
	ep{t}=1; d=uniform(0); if d < 0.30 then lep=1; if .30 <= d < 0.60 then lep=2;  if .60 <= d then lep=3; end;
if ep{t-1}=0 and 35 <= age{t} < 45 and u < eprate/2 then do; 
	ep{t}=1; d=uniform(0); if d < 0.30 then lep=1; if .30 <= d < 0.60 then lep=2;  if .60 <= d then lep=3; end;
if ep{t-1}=0 and 45 <= age{t} < 55 and u < eprate/3 then do; 
	ep{t}=1; d=uniform(0); if d < 0.30 then lep=1; if .30 <= d < 0.80 then lep=2;  if .80 <= d then lep=3; end;
if ep{t-1}=0 and 55 <= age{t} < 65 and u < eprate/5 then do;
	ep{t}=1; d=uniform(0); if d < 0.30 then lep=1; if 0.30 <= d then lep=2;  end;

np{t} = ep{t} + newp{t};

end;

*-----------------------------------------------------------------------------------------------------------------------------------------;

newp_ever = newp_ever + newp{t};
np_ever = np_ever + np{t};
np_lasttest = np_lasttest + np{t};
newp_lasttest = newp_lasttest + newp{t};


* RISK BEHAVIOUR FOR PEOPLE REACHING AGE 15;

if age{t}=15 then do;
sti{t}=0;hiv{t}=0;
np{t}=0; newp{t}=0; ep{t}=0;
newp_ever = 0;
np_ever = 0;
end;


* EXISTING PARTNERS;

ep{t}=0; ep{t}= np{t}-newp{t};

xx22: end;



* episodes of sex work;
if t ge 2 then do;
if sw{t-1} ne 1 and  sw{t}=1 then episodes_sw=episodes_sw+1;
end;

sw_gt1ep=0;if episodes_sw  gt 1 then sw_gt1ep=1;


* OCCURRENCE OF NON-HIV SYMPTOMS THAT LEAD TO TESTING FOR HIV AS PART OF DIAGNOSTIC WORK UP (OR TRIGGERED BY DIAGNOSIS OF TB ETC);

if t ge 2 then do;
s=uniform(0);  rate_non_hiv_symptoms=0.005;
tested_symptoms_not_hiv =0;  if . < date_start_testing <= caldate{t} and s < rate_non_hiv_symptoms and tested{t} ne 1  and registd{t-1} ne 1 then do; 
tested_symptoms_not_hiv =1; tested{t}=1; 
if ever_tested ne 1 then date1test=caldate{t}; ever_tested=1; dt_last_test=caldate{t}; end;
end;

*choice of value for rate_non_hiv_symptoms will be informed by data in proportion of people who are tested for 
HIV to investigate symtpoms, this includes people without HIV who develop TB
I inititially chose 0.001 as this implies around 30,000 tests per year which seems in the right ball-park but 
we will have to modify the value when we have data to compare with; 



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* RISK OF NEW INFECTION ;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

if t ge 2 and 15 <= age{t} < 65 and death=. then do; * do loop ends at xx33;

ageg_ep=0;if ep{t}=1 then do;

		if      15 <= age{t} < 25 then ageg_ep=1;
		else if 25 <= age{t} < 35 then ageg_ep=2;
		else if 35 <= age{t} < 45 then ageg_ep=3;
		else if 45 <= age{t} < 55 then ageg_ep=4;
		else if 55 <= age{t} < 65 then ageg_ep=5;
end;

* EXISTING SEX PARTNERS AND WHETHER INFECTED, DIAGNOSED, ON ART, VIRAL SUPPRESSED;

if ep{t} >= 1 then epi{t}=0;

if t ge 2 and (ep{t}=1 or ep{t}=2) and epi{t-1}=1 then epi{t}=1;

f=uniform(0);if gender=1 and epi{t}=1 and d_hiv_epi_mw > 50 and f < 0.1 then epi{t}=0;

if t ge 2 and ep{t-1}=1 then do;
	mr_epi{t}=epi{t-1};
	if epi{t-1}=1 then mr_epdiag{t}=epdiag{t-1};
end;


* diagnosis, art and suppression status of existing partners;

* existing partner becomes infected;

if ep{t}>=1 and epi{t}=0 then do;

ep_incidence_factor_m=1;ep_incidence_factor_w=1; 

if -75 <= d_hiv_epi_wm < -20 then ep_incidence_factor_m = ep_incidence_factor_m * 2.5; *1.5; 
if -200 <= d_hiv_epi_wm < -75 then ep_incidence_factor_m = ep_incidence_factor_m * 3.5; *2.5 2; 
if -500 <= d_hiv_epi_wm < -200 then ep_incidence_factor_m = ep_incidence_factor_m * (abs(d_hiv_epi_wm)/100); 
if -2000 <= d_hiv_epi_wm < -500 then ep_incidence_factor_m = ep_incidence_factor_m * (abs(d_hiv_epi_wm)/100); 
if -5000 <= d_hiv_epi_wm < -2000 then ep_incidence_factor_m  = ep_incidence_factor_m  * (abs(d_hiv_epi_wm)/50); 
if . < d_hiv_epi_wm < -5000 then ep_incidence_factor_m  = ep_incidence_factor_m  * (abs(d_hiv_epi_wm)/3); 

if -75 <= d_hiv_epi_mw < -20 then ep_incidence_factor_w = ep_incidence_factor_w * 2.5; *1.5; 
if -200 <= d_hiv_epi_mw < -75 then ep_incidence_factor_w = ep_incidence_factor_w * 3.5; *2.5 *2; 
if -500 <= d_hiv_epi_mw < -200 then ep_incidence_factor_w = ep_incidence_factor_w * (abs(d_hiv_epi_mw)/100);  
if -2000 <= d_hiv_epi_mw < -500 then ep_incidence_factor_w = ep_incidence_factor_w * (abs(d_hiv_epi_mw)/100); 
if -5000 <= d_hiv_epi_mw < -2000 then ep_incidence_factor_w  = ep_incidence_factor_w  * (abs(d_hiv_epi_mw)/50); 
if . < d_hiv_epi_mw < -5000 then ep_incidence_factor_w  = ep_incidence_factor_w  * (abs(d_hiv_epi_mw)/3); 

if s_hiv1564 =0 then do; d_hiv_epi_mw=0; d_hiv_epi_wm=0; end;

e=uniform(0);  
* yes, it is this way around below;
if gender=1 and ep_incidence_factor_w gt 0 then e=e/ep_incidence_factor_w; 
if gender=2 and ep_incidence_factor_m gt 0 then e=e/ep_incidence_factor_m;

epmono=.;
s=uniform(0);
if ep{t}=1 then do; epmono=0;
	if (gender=2 and ((ageg_ep=1 and s < prop_mono_m_1524) or (ageg_ep=2 and s < prop_mono_m_2534) or (ageg_ep=3 and s < prop_mono_m_3544) 
	or (ageg_ep=4 and s < prop_mono_m_4554) or (ageg_ep=5 and s < prop_mono_m_5564))) or 
	   (gender=1 and ((ageg_ep=1 and s < prop_mono_w_1524) or (ageg_ep=2 and s < prop_mono_w_2534) or (ageg_ep=3 and s < prop_mono_w_3544) 
	or (ageg_ep=4 and s < prop_mono_w_4554) or (ageg_ep=5 and s < prop_mono_w_5564))) then epmono=1;
	if epmono=1 and epi{t} ne 1 then do;
		if hiv{t}=1 then do;
			if       .  <  v{t-1} < 2.7 then rep = max(0,tr_rate_undetec_vl+(0.000025*normal(0)));
			else if 2.7 <= v{t-1} < 3.7 then rep = max(0,(0.01*fold_tr)+(0.0025*normal(0))); 
			else if 3.7 <= v{t-1} < 4.7 then rep = max(0,(0.03*fold_tr)+(0.0075*normal(0)));
			else if 4.7 <= v{t-1} < 5.7 then rep = max(0,(0.06*fold_tr)+(0.015*normal(0))); 
			else if        v{t-1} >=5.7 then rep = max(0,(0.10*fold_tr)+(0.025*normal(0)));  
			if primary{t-1}=1 		    then rep = max(0,tr_rate_primary+(0.075*normal(0)));
			if gender=1 and ageg_ep gt 1  then rep = rep * fold_change_w;  * higher transmission risk in women;
			if gender=1 and ageg_ep =  1  then rep = rep * fold_change_yw;  * higher transmission risk in women;
			if sti{t}=1                  then rep = rep * fold_change_sti;  * higher transmission risk with sti;
			a=uniform(0); if a < rep then do; epi{t}=1; froms=1; end;
		end;
	end;
	else if epmono=0 and epi{t} ne 1 then do;	
		if gender=1 then do;
			if      ageg_ep=1 and e < incidence1524w_epnewp then do; epi{t}=1; fromo=1; end;
			else if ageg_ep=2 and e < incidence2534w_epnewp then do; epi{t}=1; fromo=1; end;
			else if ageg_ep=3 and e < incidence3544w_epnewp then do; epi{t}=1; fromo=1; end;
			else if ageg_ep=4 and e < incidence4554w_epnewp then do; epi{t}=1; fromo=1; end;
			else if ageg_ep=5 and e < incidence5564w_epnewp then do; epi{t}=1; fromo=1; end;
		end;
		else if gender=2 then do;
			if      ageg_ep=1 and e < incidence1524m_epnewp then do; epi{t}=1; fromo=1; end;
			else if ageg_ep=2 and e < incidence2534m_epnewp then do; epi{t}=1; fromo=1; end;
			else if ageg_ep=3 and e < incidence3544m_epnewp then do; epi{t}=1; fromo=1; end;
			else if ageg_ep=4 and e < incidence4554m_epnewp then do; epi{t}=1; fromo=1; end;
			else if ageg_ep=5 and e < incidence5564m_epnewp then do; epi{t}=1; fromo=1; end;
		end;
	end;
end;


if gender=2 and d_hiv_epi_wm > 0 then epi{t}=0;
if gender=1 and d_hiv_epi_mw > 0 then epi{t}=0;

end;



if hiv{t}=1 and epi{t}=1 then do;
	if gender=2 and     r_hiv_epi_both > 1 then do; g=uniform(0); if g > 1/r_hiv_epi_both > . then do; epi{t}=.; ep{t}=0; epmono=.; ageg_ep=.; end; end;
	if gender=1 and . < r_hiv_epi_both < 1 then do; g=uniform(0); if g >   r_hiv_epi_both > . then do; epi{t}=.; ep{t}=0; epmono=.; ageg_ep=.; end; end;
end;

if epi{t} ne 1 then do; froms=.; fromo=. ; already=.; old=.; end;

if epi{t}=1 then do;
	epdiag{t}=0;
	if epdiag{t-1}=1 then epdiag{t}=1;
	if epdiag{t-1} ne 1 then do;
		epdiag{t}=0; s=uniform(0);

		if gender=1 then do;
			if    0 > d_diag_w     	   then j=0;
 			if 0.05 > d_diag_w >= 0    then j=p_diag_w/5; 
			if 0.1  > d_diag_w >= 0.05 then j=p_diag_w/2;  
			if        d_diag_w >= 0.1  then j=p_diag_w;
		end;
		if gender=2 then do;
			if 0 > d_diag_m      	   then j=0;
			if 0.05 > d_diag_m >= 0    then j=p_diag_m/5; 
			if 0.1  > d_diag_m >= 0.05 then j=p_diag_m/2;  
			if        d_diag_m >= 0.1  then j=p_diag_m;
		end;

		if s < j then epdiag{t}=1;
	end;

	epart{t}=0; if epdiag{t}=1 then do; * remember some infected partners are lost to follow-up;
		if epart{t-1}=1 then do; epart{t}=0; f=uniform(0); if f < 0.98 then epart{t}=1; end;
		if epart{t-1} ne 1 and epdiag{t}=1 then do;
			epart{t}=0; s=uniform(0);

					if 0   >   d_onart then j=0;
					if 0   <=  d_onart < 0.05   then j=p_diag_onart/5;if 0.05   <=  d_onart < 0.1   then j=p_diag_onart/2;if 0.1  <=  d_onart    then j=p_diag_onart;
					if p_diag_onart > 0.95 then j=1;

			if art_intro_date <= caldate{t} and s < j  then epart{t}=1;
		end;
	end;

	* rates of viral suppression;
	epvls{t}=0; if epart{t}=1 then do;
		if epvls{t-1}=1 then do; epvls{t}=1; f=uniform(0); if f < 0.03 then epvls{t}=0; end;
		if epvls{t-1} ne 1 and epart{t}=1 then do;
			if 0   >  d_vls then j=0;
				if 0.05 > d_vls >=  0    then j=p_onart_vls/5; 
				if 0.1 > d_vls >=  0.05  then j=p_onart_vls/2;  
				if d_vls >=  0.1    then j=p_onart_vls;
			epvls{t}=0; s=uniform(0); if s < j  then epvls{t}=1;
		end;
	end;
end;



* OCCURRENCE OF PREGNANCY;

u=uniform(0);
pregnant_ntd=0;
if gender=2 and t ge 4 and ((caldate{t}-dt_lastbirth gt 1.25) or dt_lastbirth=.) then do;
	prob_pregnancy_newp = prob_pregnancy*fold_tr_newp;
	if (ep{t-3}=1   and . lt u lt prob_pregnancy) or      
	   (newp{t-3}=1 and . lt u lt prob_pregnancy_newp) then do;
		pregnant=1;dt_lastbirth=caldate{t};cum_children=cum_children+1; pregnant_ntd=0;
	end;
	if pregnant ne 1 and newp{t-3} gt 1 then do;
		uu=2;do until (uu gt newp{t-3});
			ua=uniform(0);
			if (. lt ua lt prob_pregnancy_newp) then do;
				pregnant=1;dt_lastbirth=caldate{t};cum_children=cum_children+1; pregnant_ntd=0;
			end;
		uu=uu+1;
		end;
	end;
	if pregnant=1 and o_dol_tm3 =1 then do; u = uniform(0); if u < ntd_risk_dol then do; 
			pregnant_ntd=1;prev_pregnant_ntd=1; date_pregnancy_ntd = caldate{t}; 
	end;  end;
	if pregnant=1 and bmi_gt23_start_dol = 1 and o_dol=1 then do; u = uniform(0); if u < oth_dol_adv_birth_e_risk then do; 
			pregnant_oth_dol_adv_birth_e=1; prev_oth_dol_adv_birth_e=1;
	end;  end;
	if pregnant=1 and o_ten=1 and ten_is_taf_2020 = 1 then do;
		u = uniform(0); if u < 0.003 then do; 
		pregnant_oth_dol_adv_birth_e=1; prev_oth_dol_adv_birth_e=1;
		end;
	end;

end;


*HIV Testing in ANC;
a=uniform(0);tested_anc_prevdiag=0;w1549_birthanc=0;w1524_birthanc=0;hiv_w1549_birthanc=0;hiv_w1524_birthanc=0;
if pregnant=1 then do;
	if a < prob_anc then do; * dec15 - remove age effect for malawi to simplify;
		anc=1;
		***LBM Aug19;
		if 15 le age&j lt 50 then do;w1549_birthanc=1;hiv_w1549_birthanc=hiv&j;end;
		if 15 le age&j lt 25 then do;w1524_birthanc=1;hiv_w1524_birthanc=hiv&j;end;
        if registd{t} ne 1 then do; tested{t}=1; dt_last_test=caldate{t};np_lasttest=0; tested_anc=1;end;      
		if ever_tested ne 1 then do; ever_tested=1; date1test=caldate{t}; newp_lasttest_tested_this_per = newp_lasttest; newp_lasttest=0;end;
        *5Nov2016: women who are already diagnosed but who do not disclose get tested;
         u=uniform(0); if registd{t}=1 and tested{t} ne 1 and u<0.7 then do;tested{t}=1;tested_anc_prevdiag=1; end;
    end;
end;

*5Nov2016: additional HIV test 3 months after birth, this is because it is the easiest way to capture teh fact that pregantn women are etsted twice during pregnancy;
if t ge 2 and gender=2 and dt_lastbirth=caldate{t}-0.25 and tested{t-1}=1 then do;
	if registd{t} ne 1 then do;anc=1;tested{t}=1;ever_tested=1; dt_last_test=caldate{t};np_lasttest=0; end;
end;


* PREP ELIGIBILITY (to start and continue on PrEP);

prep_elig=0;  * dec17 - note change to requirement for newp{t} ge 2, and different eligibility for new users than previous users;
if t ge 2 and (registd{t} ne 1) and hard_reach=0 then do;

	if prep_strategy=1 then do;
	if sw{t-1}=1 and newp{t-1} ge 3 then prep_elig=1; if prep_ever=1 and sw{t}=1 and newp{t}=1 then prep_elig=1; 
	end;

	if prep_strategy=2 then do;
	if sw{t-1}=1 and newp{t-1} ge 3 then prep_elig=1; if prep_ever=1 and sw{t}=1 and newp{t} ge 1 then prep_elig=1; 
	if gender=2 and 15<=age{t}<25 and (newp{t-1} ge 2 or (epdiag{t-1}=1 and epart{t-1} ne 1)) then prep_elig=1; 
	if prep_ever=1 and gender=2 and 15<=age{t}<25 and (newp{t} ge 1 or (epdiag{t}=1 and epart{t} ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=3 then do;
	if sw{t-1}=1 and newp{t-1} ge 3 then prep_elig=1; if prep_ever=1 and sw{t}=1 and newp{t} ge 1 then prep_elig=1; 
	if gender=2 and 15<=age{t}<25 and (newp{t-1} ge 1 or (epdiag{t-1}=1 and epart{t-1} ne 1)) then prep_elig=1; 
	if prep_ever=1 and gender=2 and 15<=age{t}<25 and (newp{t} ge 1 or (epdiag{t-1}=1 and epart{t-1} ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=4 then do;
	if sw{t-1}=1 and newp{t-1} ge 3 then prep_elig=1; if prep_ever=1 and sw{t}=1 and newp{t} ge 1 then prep_elig=1; 
	if gender=2 and 15<=age{t}<25 and (newp{t-1} ge 1 or (ep{t-1}=1 and epvls{t-1} ne 1)) then prep_elig=1; 
	if prep_ever=1 and gender=2 and 15<=age{t}<25 and (newp{t} ge 1 or (ep{t}=1 and epvls{t} ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=5 then do;
	if sw{t-1}=1 and newp{t-1} ge 3 then prep_elig=1; if prep_ever=1 and sw{t}=1 and newp{t} ge 1 then prep_elig=1; 
	if gender=2 and (newp{t-1} ge 1 or (epdiag{t-1}=1 and epart{t-1} ne 1)) then prep_elig=1; 
	if prep_ever=1 and gender=2 and (newp{t} ge 1 or (epdiag{t}=1 and epart{t} ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=6 then do;
	if sw{t-1}=1 and newp{t-1} ge 3 then prep_elig=1; if prep_ever=1 and sw{t}=1 and newp{t} ge 1 then prep_elig=1; 
	if 15<=age{t}<25 and (newp{t-1} ge 1 or (epdiag{t-1}=1 and epart{t-1} ne 1)) then prep_elig=1; 
	if 15<=age{t}<25 and prep_ever=1 and (newp{t} ge 1 or (epdiag{t}=1 and epart{t} ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=7 then do;
	if sw{t-1}=1 and newp{t-1} ge 3 then prep_elig=1; if prep_ever=1 and sw{t}=1 and newp{t} ge 1 then prep_elig=1; 
	if (newp{t-1} ge 1 or (epdiag{t-1}=1 and epart{t-1} ne 1)) then prep_elig=1; 
	if prep_ever=1 and (newp{t} ge 1 or (epdiag{t}=1 and epart{t} ne 1)) then prep_elig=1; 
	end;


end;



* HIV TESTING;

tested_as_sw=.;
 
if registd{t} ne 1 and caldate{t} ge (date_start_testing+3.5) and tested{t} ne 1 then do;

	if t ge 2 and sw_test_6mthly=1 and sw{t}=1 and tested{t-1} ne 1 then do; 
		tested{t}=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};
		np_lasttest=0; newp_lasttest_tested_this_per = newp_lasttest; newp_lasttest=0; tested_as_sw=1;
	end;

	if hard_reach=0 then do;
												
		unitest=uniform(0);

 		if . < np_lasttest <= 0 then unitest = unitest * eff_test_targeting;  if no_test_if_np0 = 1 and . < np_lasttest <= 0 then unitest = 1;
		if newp_lasttest ge 1 then unitest=unitest/eff_test_targeting;  * targeting of testing - aug15;

		if      ever_tested ne 1  then do;
			if unitest < rate_1sttest then do;
				newp_lasttest=0;
				if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};
				np_lasttest=0; newp_lasttest_tested_this_per = newp_lasttest; newp_lasttest=0;
			end;

		end;

		if ever_tested  = 1  then do;

			if eff_max_freq_testing=1 then do;
				if t=1 or (t=2 and tested{t-1} ne 1) or (t=3 and tested{t-1} ne 1 and tested{t-2} ne 1) or 
				(t ge 4 and tested{t-1} ne 1 and tested{t-2} ne 1 and tested{t-3} ne 1) and unitest < rate_reptest then do;	
					tested{t}=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};
					np_lasttest=0;newp_lasttest_tested_this_per = newp_lasttest;newp_lasttest=0;
				end;
			end;
			if eff_max_freq_testing=2 then do;*every 6 months;
				if (t ge 2 and tested{t-1} ne 1) and unitest < rate_reptest then do;
					tested{t}=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};
					np_lasttest=0;newp_lasttest_tested_this_per = newp_lasttest; newp_lasttest=0; 
				end;
			end;
			if eff_max_freq_testing=4 then do;*every 3 months;
				if unitest < rate_reptest then do;
					tested{t}=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};    
					np_lasttest=0;newp_lasttest_tested_this_per = newp_lasttest;newp_lasttest=0;
				end;
			end;
		end;
	end;


	
	if t ge 4 and caldate{t} ge date_prep_intro and hard_reach=0 then do;

		*Testing before ever starting PrEP;

		*only people eligible for PrEP have the additional testing rate (otherwise lots of people will get tested additionally
		without receiving PrEP if they are not eligible). This additional testing rate reflects the additional testing that will be
		available with roll-out and interest of PrEP
		 do not differentiate the probabilty of testing whether they have a short-term or long-term partner;

		if  prep_ever ne 1 and tested{t} ne 1 and prep_elig=1 and (prep_willing_pop=1 or  (sw{t}=1 and prep_willing_sw=1 )) then do;
			a=uniform(0); if a < eff_rate_test_startprep then do;	
				tested{t}=1;ever_tested=1;testfor_prep=1;dt_last_test=caldate{t};np_lasttest=0;
			end; 
		end;

		*Routine testing while on PREP;
		else if prep_ever=1 and prep_elig=1 then do;
			if prep_tm1 =1 then do;
				if annual_testing_prep=1 and t ge 4 and (tested{t-1} ne 1 and tested{t-2} ne 1 and tested{t-3} ne 1) then do;
					a=uniform(0); if a < rate_test_onprep then do; tested{t}=1; dt_last_test=caldate{t}; np_lasttest=0; end; 
				end;
				else if annual_testing_prep=0.5 and t ge 2 and tested{t-1} ne 1 then do;
					a=uniform(0); if a < rate_test_onprep then do; tested{t}=1; dt_last_test=caldate{t}; np_lasttest=0; end;
				end;
				else if annual_testing_prep=0.25 then do;
					a=uniform(0); if a < rate_test_onprep then do; tested{t}=1; dt_last_test=caldate{t}; np_lasttest=0; end;
				end;
			end;
			*re-initiation of PrEP;
			else if prep_tm1  ne 1 then do;
				a=uniform(0); if a < eff_rate_test_restartprep and stop_prep_choice ne 1 then do; tested{t}=1; dt_last_test=caldate{t}; np_lasttest=0;end;
			end; * jul17;
		end;

	end;

end;


cost_test=0; 


* short term migration - exp_setting_lower_p_vl1000; * mar19;

exp_set_lower_p_v1000_in_period = 0;
if exp_setting_lower_p_vl1000 = 1 and 20 <= age{t} < 50 then do;
r=uniform(0);
if gender = 1 and r < rate_exp_set_lower_p_vl1000 then exp_set_lower_p_v1000_in_period = 1;
if gender = 2 and r < rate_exp_set_lower_p_vl1000 / 2 then exp_set_lower_p_v1000_in_period = 1;
end;


* PREP INITIATION AND CONTINUATION;

* Note that date of stop of prep (date_prep_e) only given a value for people who stop tl prep or people on tld prep who stop without having
(or without been diagnosed with) hiv;

prep=0; prep_falseneg=0; 



*Jul2016 f_prep;
if t ge 4 and caldate{t} ge date_prep_intro and registd{t} ne 1 and prep_elig=1 then do;

	unisensprep=uniform(0);
	*starting Prep;
	*if prep_ever ne 1 and hiv{t}=0 and tested{t}=1 then do;
	*it was tested{t-1}=1 and hiv{t-1}=0. Now changed to tested{t}=1 and commented out hiv{t-1}=0 because
	we want people who are false negative to also start PrEP, this is the reason why hiv{t}=0 is now commented out;
	if prep_ever ne 1 and tested{t}=1 and (hiv{t}=0 or (hiv{t}=1 and unisensprep > sens_vct)) then do;
		if sw{t} = 1 then do;
			if prep_willing_sw=1 then do; 
				offered_prep=1;
				if 		testfor_prep = 1  then do; prep   =1; prep_ever=1; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};end; 
				else if testfor_prep ne 1 then do;r=uniform(0); if r < prob_prep_b then do; prep   =1; prep_ever=1; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};end; end;
			end;
		end;
		else if sw{t} ne 1 then do; 
			if prep_willing_pop=1 then do; offered_prep=1;
				if 		testfor_prep = 1  then do;prep   =1; prep_ever=1; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};end; 
				else if testfor_prep ne 1 then do;r=uniform(0); if r < prob_prep_b then do; prep   =1; prep_ever=1; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};end; end;
			end;
		end;
	started_prep_hiv_test_sens=0;if prep   =1 and (hiv{t}=1 and unisensprep > sens_vct) then do; started_prep_hiv_test_sens=1;started_prep_hiv_test_sens_e=1;end;
	end;
	* continuing PrEP;
	else if prep_ever=1 and (tested{t} ne 1 or (tested{t}=1 and (hiv{t}=0 or (hiv{t}=1 and unisensprep > sens_vct)))) then do; * may17;
		if prep_tm1 = 1 then do; 
			if annual_testing_prep=1 then do;
				if tested{t}=1 or tested{t-1}=1 or tested{t-2}=1 or tested{t-3}=1 then do;
					r=uniform(0); 
					if r < (1-eff_rate_choose_stop_prep) then do; prep_tm1=1; dt_prep_e=caldate{t}; end;
					else if r >= (1-eff_rate_choose_stop_prep) then stop_prep_choice=1; *variable for people who discontinued despite newp>1; 
				end;
			end;
			else if annual_testing_prep=0.5 then do;
				if tested{t}=1 or tested{t-1}=1 then do;
					r=uniform(0); 
					if r < (1-eff_rate_choose_stop_prep) then do; prep=1; dt_prep_e=caldate{t}; end;
					else if r >= (1-eff_rate_choose_stop_prep) then stop_prep_choice=1; *variable for people who discontinued despite newp>1; 
				end;
			end;
			else if annual_testing_prep=0.25 then do;
				if tested{t}=1 then do;
					r=uniform(0); 
					if r < (1-eff_rate_choose_stop_prep) then do; prep=1; dt_prep_e=caldate{t}; end;
					else if r >= (1-eff_rate_choose_stop_prep) then stop_prep_choice=1; *variable for people who discontinued despite newp>1; 
				end;
			end;
		end;
		else if prep_tm1 ne 1 then do;
			*if people discontinued even if they had newp>1 previously (stop_prep_choice=1), then the probability of restart is
			given by eff_prob_prep_restart_choice. if they discontinued because they were no longer eligible (no partners in a period and also
			stop_prep_choice ne 1) then the probability of restart is given by prob_prep_restart;
			*dt_prep_rs = date of prep restart (to count number of prep re-initiations);
			if tested{t}=1 then do;
				if stop_prep_choice=1 then do;
				r=uniform(0); 
				if r < eff_prob_prep_restart_choice then do; prep   =1; dt_prep_e=caldate{t}; dt_prep_rs=caldate{t}; stop_prep_choice=0; end;
				end; 
				else if stop_prep_choice ne 1 then do;
				r=uniform(0); 
				if r < prob_prep_restart then do; prep   =1; dt_prep_e=caldate{t}; dt_prep_c=caldate{t}; end;  * dt_prep_c is prep continuation in the sense
				that they are now continuing prep again now they have np >= 1; 
				end;
			end;
		end; 
	end;
end;


* tld initiation in person without hiv or with hiv by undiagnosed - note this can be in a person with hiv who has not tested;
if pop_wide_tld = 1 and registd{t} ne 1 then do;  

	if prep_ever ne 1 then do; 
			r=uniform(0); if r < prob_prep_pop_wide_tld then do ;
				prep   =1; pop_wide_tld_prep=1;  prep_ever=1; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};
			end;
	end;*LBM Jul19;

	if prep_ever = 1 then do; 
			if r < (1-eff_rate_choose_stop_prep) then do; prep   =1; pop_wide_tld_prep=1; dt_prep_e=caldate{t}; end;
			if r >= (1-eff_rate_choose_stop_prep) then do; stop_prep_choice=1; pop_wide_tld_prep=0; end; 

			if stop_prep_choice=1 then do;
				r=uniform(0); 
				if r < eff_prob_prep_restart_choice then do;
					prep   =1;pop_wide_tld_prep=1; dt_prep_e=caldate{t}; dt_prep_rs=caldate{t}; stop_prep_choice=0; 
				end;
			end; 
			else if stop_prep_choice ne 1 then do;
				r=uniform(0); 
				if r < prob_prep_restart then do;
					prep   =1; pop_wide_tld_prep=1; dt_prep_e=caldate{t}; dt_prep_c=caldate{t};
				end;  
				* dt_prep_c is prep continuation in the sense that they are now continuing prep again now they have np >= 1; 
			end;
	end;*LBM Jul19;
end;


* prep_falseneg var - Mar2017 f_prep;
* use this var to ensure that these people who incorrectly start PrEP are not diagnosed later in the program;
if hiv{t}=1 and unisensprep > sens_vct then prep_falseneg=1;


*PrEP clinic visits - modified Jan2017 f_prep;
if caldate{t} ge date_prep_intro and registd{t} ne 1 and prep_elig=1 and pop_wide_tld ne 1 then do;
	if prep   =0 then do;
		if prep_ever ne 1 then visit_prep=.;
		else if prep_ever=1 and (prep_tm1 =1) then visit_prep=0;
	end;
	if prep   =1 then do;
		r=uniform(0);
		visit_prep=1; *drug pick-up only;
		if tested{t}=1 then do;
			visit_prep=2; *drug pick-up and HIV test;
			if r < prob_prep_visit_counsel then visit_prep=3; *drug pick-up and counselling;
		end;

		if pop_wide_tld_prep=1 and ((tld_last_egfr=. and caldate{t} - dt_prep_s > 1) or (caldate{t} - tld_last_egfr > 1)) then do;
		r=uniform(0); if r < pop_wide_tld_prob_egfr then visit_prep=2; * note this is for egfr only not an hiv test;
		end;

	end;
end;



*Adherence to PrEP - modified Jan2017 f_prep;
if prep   =1 then do;
	adh{t}=adhav_pr + adhvar*normal(0);  if adh{t} gt 1 then adh{t}=1; * may17;
	if adhav_pr=0 then adh{t}=0;
	*if adh{t} ge 0.75 then adh{t}=0.95; *based on conversation with Sheena McCormack and John Mellors - commented out as prep effectiveness too good otherwise for hets;
	*added age effect - adolescents to be 50% less likely to adhere;
	if age{t} > 25 then do;
		f=uniform(0);
		if f<0.5 then adh{t} = adh{t} + ((1-adh{t}) * factor_prep_adh_older) ;
	end;
end;

* this could be modified so that we account for suboptimal adherence to prep - so we could make prep a continuous variable
between 0 and 1 rather than binary 0 or 1; 
* assume for now that prep is tenofovir/ftc;

prep_all_past_year=.;
if prep   =1 then do; 
tot_yrs_prep = tot_yrs_prep+0.25; 
prep_effectiveness_non_res_v = adh{t}* eff_adh_prep ;
if t ge 4 and prep_tm1 =1 and prep_tm2 =1 and prep_tm3 =1 then prep_all_past_year=1;
end;

* RISK OF NEW INFECTED PARTNER PER NEW PARTNER; 
*  - men ; 
if rbm =4 then do;



age_newp=.;


/*
w15m15 =0.865*s_m_1524_newp; w15m25=0.47*s_m_2534_newp; w15m35=0.30*s_m_3544_newp; w15m45=0.43*s_m_4554_newp; w15m55=0.18*s_m_5564_newp;
w25m15 =0.11 *s_m_1524_newp; w25m25=0.43*s_m_2534_newp; w25m35=0.50*s_m_3544_newp; w25m45=0.30*s_m_4554_newp; w25m55=0.18*s_m_5564_newp;
w35m15 =0.025*s_m_1524_newp; w35m25=0.10*s_m_2534_newp; w35m35=0.20*s_m_3544_newp; w35m45=0.23*s_m_4554_newp; w35m55=0.27*s_m_5564_newp;
w45m15 =0.00 *s_m_1524_newp; w45m25=0.00*s_m_2534_newp; w45m35=0.00*s_m_3544_newp; w45m45=0.03*s_m_4554_newp; w45m55=0.27*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.00*s_m_2534_newp; w55m35=0.00*s_m_3544_newp; w55m45=0.01*s_m_4554_newp; w55m55=0.10*s_m_5564_newp;
*/

if gender=1 and sex_age_mixing_matrix_m=1 then do;
if 15 <= age{t} < 25 then do;e=uniform(0); 
if              e < 0.865  then do; risk_nippnp = s_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.865<= e < 0.975  then do; risk_nippnp = s_prop_newp_i_w_2534; age_newp=2;end;
else if 0.975<= e          then do; risk_nippnp = s_prop_newp_i_w_3544; age_newp=3; end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.47 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.47 <= e < 0.90 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3 ;end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.30 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.30 <= e < 0.80 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.80 <= e < 1.00 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 1.00 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.43 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.43 <= e < 0.73 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.73 <= e < 0.96 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.96 <= e < 0.99 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.99 <= e        then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.18 then do; risk_nippnp = s_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.18 <= e < 0.36 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.36 <= e < 0.63 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.63 <= e < 0.90 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.90 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;

end;

* risk of new infected partner per new partner - women ;

/*
* down columns give breakdown of age of partners for females by age group;
m15w15 =0.43*tnewp15_w; m15w25=0.09*tnewp25_w; m15w35=0.03*tnewp35_w; m15w45=0.00*tnewp45_w; m15w55=0.00*tnewp55_w;
m25w15 =0.34*tnewp15_w; m25w25=0.49*tnewp25_w; m25w35=0.25*tnewp35_w; m25w45=0.00*tnewp45_w; m25w55=0.00*tnewp55_w;
m35w15 =0.12*tnewp15_w; m35w25=0.30*tnewp25_w; m35w35=0.34*tnewp35_w; m35w45=0.05*tnewp45_w; m35w55=0.00*tnewp55_w;
m45w15 =0.10*tnewp15_w; m45w25=0.10*tnewp25_w; m45w35=0.25*tnewp35_w; m45w45=0.25*tnewp45_w; m45w55=0.10*tnewp55_w;
m55w15 =0.01*tnewp15_w; m55w25=0.02*tnewp25_w; m55w35=0.13*tnewp35_w; m55w45=0.70*tnewp45_w; m55w55=0.90*tnewp55_w;
*/


if gender=2 and sex_age_mixing_matrix_w=1 then do;
if      15 <= age{t} < 25 then do;e=uniform(0);
if              e < 0.43 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.43 <= e < 0.77 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.77 <= e < 0.89 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.89 <= e < 0.99 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.99 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.09 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.09 <= e < 0.58 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.58 <= e < 0.88 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.88 <= e < 0.98 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.98 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.28 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.28 <= e < 0.62 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.62 <= e < 0.87 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.87 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;

end;






/*sex_age_mixing_matrix=2;


ptnewp15_w=(0.865*s_m_1524_newp)+(0.47*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.15*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp25_w=(0.11*s_m_1524_newp )+(0.43*s_m_2534_newp)+(0.35*s_m_3544_newp)+(0.23*s_m_4554_newp)+(0.08*s_m_5564_newp);
ptnewp35_w=(0.025*s_m_1524_newp)+(0.10*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.25*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp )+(0.00*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp )+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.07*s_m_4554_newp)+(0.32*s_m_5564_newp);

*/
					   
if gender=1 and sex_age_mixing_matrix_m=2 then do;
if 15 <= age{t} < 25 then do;e=uniform(0); * dec17;
if              e < 0.865 /*(then newp age 15-25)*/ then do; risk_nippnp = s_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.865<= e < 0.975 /*(then newp age 25-35)*/ then do; risk_nippnp = s_prop_newp_i_w_2534; age_newp=2;end;
else if 0.975<= e         /*(then newp age 35-45)*/ then do; risk_nippnp = s_prop_newp_i_w_3544; age_newp=3; end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.47 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.47 <= e < 0.90 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e < 1.00 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3 ;end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.20 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.20 <= e < 0.55 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.55 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.15 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.15 <= e < 0.38 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.38 <= e < 0.63 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.63 <= e < 0.93 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.93 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = s_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.13 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.13 <= e < 0.38 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.38 <= e < 0.68 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.68 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;

end;

* risk of new infected partner per new partner - women ;

/*
* down columns give breakdown of age of partners for females by age group;

ptnewp15_m=(0.43*s_w_1524_newp)+(0.09*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.415*s_w_1524_newp)+(0.50*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.12*s_w_1524_newp)+(0.35*s_w_2534_newp)+(0.34*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.03*s_w_1524_newp)+(0.05*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.005*s_w_1524_newp)+(0.01*s_w_2534_newp)+(0.13*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
*/

if gender=2 and sex_age_mixing_matrix_w=2 then do;
if      15 <= age{t} < 25 then do;e=uniform(0);
if              e < 0.43 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.43 <= e < 0.84 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.84 <= e < 0.96 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.96 <= e < 0.99 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.99 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.09 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.09 <= e < 0.59 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.59 <= e < 0.94 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.94 <= e < 0.99 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.99 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.28 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.28 <= e < 0.62 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.62 <= e < 0.87 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.87 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <=1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <=1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;

end;





/*
* down columns give breakdown of age of partners for males by age group;
w15m15 =0.90 *s_m_1524_newp; w15m25=0.44*s_m_2534_newp; w15m35=0.20*s_m_3544_newp; w15m45=0.15*s_m_4554_newp; w15m55=0.05*s_m_5564_newp;
w25m15 =0.05 *s_m_1524_newp; w25m25=0.43*s_m_2534_newp; w25m35=0.34*s_m_3544_newp; w25m45=0.23*s_m_4554_newp; w25m55=0.08*s_m_5564_newp;
w35m15 =0.02 *s_m_1524_newp; w35m25=0.10*s_m_2534_newp; w35m35=0.40*s_m_3544_newp; w35m45=0.25*s_m_4554_newp; w35m55=0.25*s_m_5564_newp;
w45m15 =0.02 *s_m_1524_newp; w45m25=0.02*s_m_2534_newp; w45m35=0.05*s_m_3544_newp; w45m45=0.30*s_m_4554_newp; w45m55=0.30*s_m_5564_newp;
w55m15 =0.01 *s_m_1524_newp; w55m25=0.01*s_m_2534_newp; w55m35=0.01*s_m_3544_newp; w55m45=0.07*s_m_4554_newp; w55m55=0.32*s_m_5564_newp;
*/

if gender=1 and sex_age_mixing_matrix_m=3 then do;
if 15 <= age{t} < 25 then do;e=uniform(0); 
if              e < 0.90   then do; risk_nippnp = s_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.90 <= e < 0.95   then do; risk_nippnp = s_prop_newp_i_w_2534; age_newp=2;end;
else if 0.95 <= e < 0.97   then do; risk_nippnp = s_prop_newp_i_w_3544; age_newp=3; end; 
else if 0.97 <= e < 0.99   then do; risk_nippnp = s_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.99 <= e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.44 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.44 <= e < 0.87 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.87 <= e < 0.97 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3 ;end; 
else if 0.97 <= e < 0.99   then do; risk_nippnp = s_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.99 <= e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.20 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.20 <= e < 0.54 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.54 <= e < 0.94 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.94 <= e <= 0.99 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.99 <= e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.15 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.15 <= e < 0.38 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.38 <= e < 0.63 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.63 <= e < 0.93 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.93 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = s_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.13 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.13 <= e < 0.38 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.38 <= e < 0.68 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.68 <= e        then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;

end;

* risk of new infected partner per new partner - women ;

/*
* down columns give breakdown of age of partners for females by age group;
m15w15 =0.25* s_w_1524_newp; m15w25=0.09*s_w_2534_newp; m15w35=0.03*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.55 *s_w_1524_newp; m25w25=0.50*s_w_2534_newp; m25w35=0.25*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.15* s_w_1524_newp; m35w25=0.35*s_w_2534_newp; m35w35=0.34*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.03* s_w_1524_newp; m45w25=0.05*s_w_2534_newp; m45w35=0.25*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.02 *s_w_1524_newp; m55w25=0.01*s_w_2534_newp; m55w35=0.13*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
*/

if gender=2 and sex_age_mixing_matrix_w=3 then do;
if      15 <= age{t} < 25 then do;e=uniform(0);
if              e < 0.43 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.43 <= e < 0.77 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.77 <= e < 0.89 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.89 <= e < 0.99 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.99 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.09 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.09 <= e < 0.58 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.58 <= e < 0.88 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.88 <= e < 0.98 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.98 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.28 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.28 <= e < 0.62 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.62 <= e < 0.87 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.87 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;

end;




/*
if sex_age_mixing_matrix_=4 then do;
ptnewp15_w=(0.93 *s_m_1524_newp)+(0.50*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.15*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.40*s_m_2534_newp)+(0.34*s_m_3544_newp)+(0.20*s_m_4554_newp)+(0.08*s_m_5564_newp);
ptnewp35_w=(0.01 *s_m_1524_newp)+(0.08*s_m_2534_newp)+(0.41*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.20*s_m_5564_newp);
ptnewp45_w=(0.01*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.37*s_m_4554_newp)+(0.40*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.03*s_m_4554_newp)+(0.27*s_m_5564_newp);
end;
*/

if gender=1 and sex_age_mixing_matrix_m=4 then do;
if 15 <= age{t} < 25 then do;e=uniform(0); 
if              e < 0.93   then do; risk_nippnp = s_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.93 <= e < 0.98   then do; risk_nippnp = s_prop_newp_i_w_2534; age_newp=2;end;
else if 0.98 <= e < 0.99   then do; risk_nippnp = s_prop_newp_i_w_3544; age_newp=3; end; 
else if 0.99 <= e          then do; risk_nippnp = s_prop_newp_i_w_4554; age_newp=4; end; 
else if 1.00 <  e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.90 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e < 0.98 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3 ;end; 
else if 0.98 <= e < 0.99   then do; risk_nippnp = s_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.99 <= e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.20 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.20 <= e < 0.54 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.54 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e        then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 1.00 <  e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.15 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.15 <= e < 0.35 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.35 <= e < 0.60 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.60 <= e < 0.97 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.97 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = s_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.13 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.13 <= e < 0.33 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.33 <= e < 0.73 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.73 <= e        then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;

end;

* risk of new infected partner per new partner - women ;



/*
m15w15 =0.05* s_w_1524_newp; m15w25=0.03*s_w_2534_newp; m15w35=0.03*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.55* s_w_1524_newp; m25w25=0.52*s_w_2534_newp; m25w35=0.05*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.35* s_w_1524_newp; m35w25=0.40*s_w_2534_newp; m35w35=0.57*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.03* s_w_1524_newp; m45w25=0.03*s_w_2534_newp; m45w35=0.30*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.02 *s_w_1524_newp; m55w25=0.02*s_w_2534_newp; m55w35=0.05*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;
*/


if gender=2 and sex_age_mixing_matrix_w=4 then do;
if      15 <= age{t} < 25 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.60 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.60 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.95 <= e < 0.98 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.98 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.55 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.55 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.95 <= e < 0.98 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.98 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.08 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.08 <= e < 0.65 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.65 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;

end;




/*

if sex_age_mixing_matrix_m=5 then do;
w15m15 =0.94 *s_m_1524_newp; w15m25=0.50*s_m_2534_newp; w15m35=0.40*s_m_3544_newp; w15m45=0.30*s_m_4554_newp; w15m55=0.30*s_m_5564_newp;
w25m15 =0.05 *s_m_1524_newp; w25m25=0.40*s_m_2534_newp; w25m35=0.40*s_m_3544_newp; w25m45=0.30*s_m_4554_newp; w25m55=0.30*s_m_5564_newp;
w35m15 =0.01 *s_m_1524_newp; w35m25=0.08*s_m_2534_newp; w35m35=0.15*s_m_3544_newp; w35m45=0.25*s_m_4554_newp; w35m55=0.30*s_m_5564_newp;
w45m15 =0.00 *s_m_1524_newp; w45m25=0.01*s_m_2534_newp; w45m35=0.04*s_m_3544_newp; w45m45=0.10*s_m_4554_newp; w45m55=0.05*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.01*s_m_2534_newp; w55m35=0.01*s_m_3544_newp; w55m45=0.05*s_m_4554_newp; w55m55=0.05*s_m_5564_newp;
end;

*/

if gender=1 and sex_age_mixing_matrix_m=5 then do;
if 15 <= age{t} < 25 then do;e=uniform(0); 
if              e < 0.94   then do; risk_nippnp = s_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.94 <= e < 0.99   then do; risk_nippnp = s_prop_newp_i_w_2534; age_newp=2;end;
else if 0.99 <= e <= 1.00   then do; risk_nippnp = s_prop_newp_i_w_3544; age_newp=3; end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.90 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e < 0.98 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3 ;end; 
else if 0.98 <= e < 0.99   then do; risk_nippnp = s_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.99 <= e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.40 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.40 <= e < 0.80 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.80 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e < 0.99 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.99 <  e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.30 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.30 <= e < 0.60 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.60 <= e < 0.85 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.85 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.95 <= e         then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.30 then do; risk_nippnp = s_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.30 <= e < 0.60 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.60 <= e < 0.90 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.90 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.95 <= e        then do; risk_nippnp = s_prop_newp_i_w_5564;   age_newp=5;end; 
end;

end;

* risk of new infected partner per new partner - women ;


/*
if sex_age_mixing_matrix_w=5 then do;
m15w15 =0.05* s_w_1524_newp; m15w25=0.01*s_w_2534_newp; m15w35=0.01*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.45* s_w_1524_newp; m25w25=0.40*s_w_2534_newp; m25w35=0.07*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.30* s_w_1524_newp; m35w25=0.39*s_w_2534_newp; m35w35=0.47*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.15* s_w_1524_newp; m45w25=0.15*s_w_2534_newp; m45w35=0.30*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.05 *s_w_1524_newp; m55w25=0.05*s_w_2534_newp; m55w35=0.15*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;
*/

if gender=2 and sex_age_mixing_matrix_w=5 then do;
if      15 <= age{t} < 25 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.50 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.50 <= e < 0.80 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.80 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.01 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.01 <= e < 0.41 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.41 <= e < 0.80 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.80 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.01 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.01 <= e < 0.08 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.08 <= e < 0.55 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.55 <= e < 0.85 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.85 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;

end;



/*
if sex_age_mixing_matrix_m=6 then do;
w15m15 =0.94 *s_m_1524_newp; w15m25=0.50*s_m_2534_newp; w15m35=0.50*s_m_3544_newp; w15m45=0.50*s_m_4554_newp; w15m55=0.50*s_m_5564_newp;
w25m15 =0.05 *s_m_1524_newp; w25m25=0.40*s_m_2534_newp; w25m35=0.35*s_m_3544_newp; w25m45=0.35*s_m_4554_newp; w25m55=0.35*s_m_5564_newp;
w35m15 =0.01 *s_m_1524_newp; w35m25=0.10*s_m_2534_newp; w35m35=0.10*s_m_3544_newp; w35m45=0.10*s_m_4554_newp; w35m55=0.10*s_m_5564_newp;
w45m15 =0.00 *s_m_1524_newp; w45m25=0.00*s_m_2534_newp; w45m35=0.05*s_m_3544_newp; w45m45=0.05*s_m_4554_newp; w45m55=0.05*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.00*s_m_2534_newp; w55m35=0.00*s_m_3544_newp; w55m45=0.00*s_m_4554_newp; w55m55=0.00*s_m_5564_newp;
end;
*/

if gender=1 and sex_age_mixing_matrix_m=6 then do;
if 15 <= age{t} < 25 then do;e=uniform(0); 
if              e < 0.94   then do; risk_nippnp = s_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.94 <= e < 0.99   then do; risk_nippnp = s_prop_newp_i_w_2534; age_newp=2;end;
else if 0.99 <= e <= 1.00   then do; risk_nippnp = s_prop_newp_i_w_3544; age_newp=3; end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.90 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e < 0.90 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3 ;end; 
else if 0.90 <= e < 0.95   then do; risk_nippnp = s_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.95 <= e          then do; risk_nippnp = s_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.85 then do; risk_nippnp = s_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.85 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.85 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.85 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = s_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.85 then do; risk_nippnp = s_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.85 <= e < 0.95 then do; risk_nippnp = s_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_w_4554;   age_newp=4;end; 
end;

end;

* risk of new infected partner per new partner - women ;


/*
if sex_age_mixing_matrix_w=6 then do;
m15w15 =0.20* s_w_1524_newp; m15w25=0.00*s_w_2534_newp; m15w35=0.01*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.20* s_w_1524_newp; m25w25=0.25*s_w_2534_newp; m25w35=0.01*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.20* s_w_1524_newp; m35w25=0.25*s_w_2534_newp; m35w35=0.32*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.20* s_w_1524_newp; m45w25=0.25*s_w_2534_newp; m45w35=0.33*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.20 *s_w_1524_newp; m55w25=0.25*s_w_2534_newp; m55w35=0.33*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;
*/

if gender=2 and sex_age_mixing_matrix_w=6 then do;
if      15 <= age{t} < 25 then do;e=uniform(0);
if              e < 0.20 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.20 <= e < 0.40 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.40 <= e < 0.60 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.60 <= e < 0.80 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.80 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age{t} < 35 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.25 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.25 <= e < 0.50 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.50 <= e < 0.75 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age{t} < 45 then do;e=uniform(0);
if              e < 0.01 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.01 <= e < 0.02 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.02 <= e < 0.34 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.34 <= e < 0.67 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.67 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age{t} < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age{t} < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = s_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = s_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = s_prop_newp_i_m_5564;   age_newp=5;end; 
end;

end;




end;


*--------------------------------------------------------------------------------------------------------------------;

* NUMBER OF NEW INFECTED PARTNERS ;
* risk of infected partner per new partner;
nip{t}=0;
if risk_nippnp*newp{t} > 0 then do;
	nip{t} = min(ranpoi(0,risk_nippnp*newp{t}),newp{t});
end;



* probability of infection from infected new partner;

u1=0; u2=0; u3=0; u4=0; u5=0; u6=0;

if gender=1 and age_newp=1 then do;
u1=s_prop_ageg1_w_vlg1; u2=s_prop_ageg1_w_vlg2; u3=s_prop_ageg1_w_vlg3; u4=s_prop_ageg1_w_vlg4; u5=s_prop_ageg1_w_vlg5; u6=s_prop_ageg1_w_vlg6;
end;
if gender=1 and age_newp=2 then do;
u1=s_prop_ageg2_w_vlg1; u2=s_prop_ageg2_w_vlg2; u3=s_prop_ageg2_w_vlg3; u4=s_prop_ageg2_w_vlg4; u5=s_prop_ageg2_w_vlg5; u6=s_prop_ageg2_w_vlg6;
end;
if gender=1 and age_newp=3 then do;
u1=s_prop_ageg3_w_vlg1; u2=s_prop_ageg3_w_vlg2; u3=s_prop_ageg3_w_vlg3; u4=s_prop_ageg3_w_vlg4; u5=s_prop_ageg3_w_vlg5; u6=s_prop_ageg3_w_vlg6;
end;
if gender=1 and age_newp=4 then do;
u1=s_prop_ageg4_w_vlg1; u2=s_prop_ageg4_w_vlg2; u3=s_prop_ageg4_w_vlg3; u4=s_prop_ageg4_w_vlg4; u5=s_prop_ageg4_w_vlg5; u6=s_prop_ageg4_w_vlg6;
end;
if gender=1 and age_newp=5 then do;
u1=s_prop_ageg5_w_vlg1; u2=s_prop_ageg5_w_vlg2; u3=s_prop_ageg5_w_vlg3; u4=s_prop_ageg5_w_vlg4; u5=s_prop_ageg5_w_vlg5; u6=s_prop_ageg5_w_vlg6;
end;

if gender=2 and age_newp=1 then do;
u1=s_prop_ageg1_m_vlg1; u2=s_prop_ageg1_m_vlg2; u3=s_prop_ageg1_m_vlg3; u4=s_prop_ageg1_m_vlg4; u5=s_prop_ageg1_m_vlg5; u6=s_prop_ageg1_m_vlg6;
end;
if gender=2 and age_newp=2 then do;
u1=s_prop_ageg2_m_vlg1; u2=s_prop_ageg2_m_vlg2; u3=s_prop_ageg2_m_vlg3; u4=s_prop_ageg2_m_vlg4; u5=s_prop_ageg2_m_vlg5; u6=s_prop_ageg2_m_vlg6;
end;
if gender=2 and age_newp=3 then do;
u1=s_prop_ageg3_m_vlg1; u2=s_prop_ageg3_m_vlg2; u3=s_prop_ageg3_m_vlg3; u4=s_prop_ageg3_m_vlg4; u5=s_prop_ageg3_m_vlg5; u6=s_prop_ageg3_m_vlg6;
end;
if gender=2 and age_newp=4 then do;
u1=s_prop_ageg4_m_vlg1; u2=s_prop_ageg4_m_vlg2; u3=s_prop_ageg4_m_vlg3; u4=s_prop_ageg4_m_vlg4; u5=s_prop_ageg4_m_vlg5; u6=s_prop_ageg4_m_vlg6;
end;
if gender=2 and age_newp=5 then do;
u1=s_prop_ageg5_m_vlg1; u2=s_prop_ageg5_m_vlg2; u3=s_prop_ageg5_m_vlg3; u4=s_prop_ageg5_m_vlg4; u5=s_prop_ageg5_m_vlg5; u6=s_prop_ageg5_m_vlg6;
end;


* if no infected people in age and gender group chosen then use non age-specific distribution ;
if u1+u2+u3+u4+u5+u6=0 then do;
if gender=2 then do; u1=s_prop_m_vlg1; u2=s_prop_m_vlg2; u3=s_prop_m_vlg3; u4=s_prop_m_vlg4; u5=s_prop_m_vlg5; u6=s_prop_m_vlg6; end;
if gender=1 then do; u1=s_prop_w_vlg1; u2=s_prop_w_vlg2; u3=s_prop_w_vlg3; u4=s_prop_w_vlg4; u5=s_prop_w_vlg5; u6=s_prop_w_vlg6; end;
end;


* mar19 if exposed elsewhere externaly, partners may be less likely to be suppressed, i.e u1=lower % supressed;
if exp_set_lower_p_v1000_in_period = 1 then do;   
u1 = u1 / external_exp_factor; 
end;


cu_1=.;cu_2=.;cu_3=.;cu_4=.;cu_5=.;cu_6=.;
cu_1=u1;cu_2=cu_1+u2;cu_3=cu_2+u3;cu_4=cu_3+u4;cu_5=cu_4+u5; cu_6=cu_5+u6;

*   vlg1 < 2.7    vlg2  2.7-3.7  vlg3  3.7-4.7   vlg4  4.7-5.7    vlg5  > 5.7    vlg6  primary;


if hiv{t}=1 then s_infection=0;

*NNRTI resistance modelled separately as K103N, Y181C and G190A, rather than c_rtnnm{t};
k103m=.;  y181m=.;  g190m=.;  k65m=.;  m184m=.;  q151m=.; tam=.;  p32m=.; p33m=.; p46m=.; p47m=.;  p50lm=.; p50vm=.; 
p54m=.;   p76m=.;   p82m=.;   p84m=.;  p88m=.;   p90m=.;  inpm=.; insm=.;
k103m_p=.;  y181m_p=.;  g190m_p=.;  k65m_p=.;  m184m_p=.;  q151m_p=.;  tam_p=.;  p32m_p=.;  p33m_p=.;  p46m_p=.;  p47m_p=.; 
p50lm_p=.;  p50vm_p=.;  p54m_p=.;   p76m_p=.;  p82m_p=.;   p84m_p=.;   p88m_p=.; p90m_p=.;  inpm_p=.;  insm_p=.;

*prob infection in 3mths from the infected partner;

if t ge 2 and nip{t} gt 0 then do;
	d=1;do until (d gt nip{t});
		risk_nip=0;
		a=uniform(0);
		if                   a < cu_1/cu_6 then do; risk_nip = max(0,(tr_rate_undetec_vl*fold_tr_newp)+(0.000025*normal(0))); vl_source=1; s_prop_rm=s_prop_vlg1_rm; end; *new for prep;
		else if cu_1/cu_6 <= a < cu_2/cu_6 then do; risk_nip = max(0,(0.01*fold_tr*fold_tr_newp)+(0.0025*normal(0)));       vl_source=2; s_prop_rm=s_prop_vlg2_rm; end; *new for prep;
		else if cu_2/cu_6 <= a < cu_3/cu_6 then do; risk_nip = max(0,(0.03*fold_tr*fold_tr_newp)+(0.0075*normal(0)));       vl_source=3; s_prop_rm=s_prop_vlg3_rm; end; *new for prep;
		else if cu_3/cu_6 <= a < cu_4/cu_6 then do; risk_nip = max(0,(0.06*fold_tr*fold_tr_newp)+(0.015*normal(0)));        vl_source=4; s_prop_rm=s_prop_vlg4_rm; end; *new for prep;
		else if cu_4/cu_6 <= a < cu_5/cu_6 then do; risk_nip = max(0,(0.10*fold_tr*fold_tr_newp)+(0.025*normal(0)));        vl_source=5; s_prop_rm=s_prop_vlg5_rm; end; *new for prep;
		else if cu_5/cu_6 <= a < cu_6/cu_6 then do; risk_nip = max(0,(tr_rate_primary*fold_tr_newp)+(0.075*normal(0)));       vl_source=6; s_prop_rm=s_prop_vlg6_rm; end; *new for prep;

* NOTE: if the partner is in VL_source=6 (ie in primary infection) we should really check whether the partner was on prep (despite being infected) at the time
of transmission.  if so, the tr_rate_primary should be lowered;

		  m184m_p=0; tam_p=0;   k65m_p=0;  q151m_p=0; k103m_p=0;  y181m_p=0;  g190m_p=0;  
		  p32m_p=0;  p33m_p=0;  p46m_p=0;  p47m_p=0;  p50lm_p=0;  p50vm_p=0;  p54m_p=0;  
		  p76m_p=0;  p82m_p=0;  p84m_p=0;  p88m_p=0;  p90m_p=0;   inpm_p=0;   insm_p=0;
		  mut_p=.;

		  e=uniform(0); if e < s_prop_rm  then do;
			*in order to have at least one mutation for all subjects who are supposed to have at least one;

		  f=1;do until ((f=10) or (mut_p ge 1));  

		  * resistance virus in partner - tams;

                * resistance virus in partner - tams;
                s_prop_tam = s_prop_tam1+s_prop_tam2+s_prop_tam3;
                g=uniform(0);
                if g < s_prop_tam  then  do; tam_p=max(1,ranpoi(0,1)); if tam_p ge 6 then tam_p=6;end;

				* resistance virus in partner - 184m;
				g=uniform(0);
				if g < s_prop_m184m  then m184m_p=1;
	
				* resistance virus in partner - k65m;
				g=uniform(0);
				if g < s_prop_k65m  then k65m_p=1;
	
				* resistance virus in partner - q151m;
				g=uniform(0);
				if g < s_prop_q151m  then q151m_p=1;

				* resistance virus in partner - nnrti;
				g=uniform(0);
				if g < s_prop_k103m then k103m_p=1;

				g=uniform(0);
				if g < s_prop_y181m then y181m_p=1;

				g=uniform(0);
				if g < s_prop_g190m then g190m_p=1;

				* resistance virus in partner - pr 32;
				g=uniform(0);
				if g < s_prop_p32m  then p32m_p=1;

				* resistance virus in partner - pr 33;
				g=uniform(0);
				if g < s_prop_p33m  then p33m_p=1;

				* resistance virus in partner - pr 46;
				g=uniform(0);
				if g < s_prop_p46m  then p46m_p=1;

				* resistance virus in partner - pr 47;
				g=uniform(0);
				if g < s_prop_p47m  then p47m_p=1;

				* resistance virus in partner - pr 50l;
				g=uniform(0);
				if g < s_prop_p50lm  then p50lm_p=1;

				* resistance virus in partner - pr 50v;
				g=uniform(0);
				if g < s_prop_p50vm  then p50vm_p=1;

				* resistance virus in partner - pr 54;
				g=uniform(0);
				if g < s_prop_p54m  then p54m_p=1;

				* resistance virus in partner - pr 76;
				g=uniform(0);
				if g < s_prop_p76m  then p76m_p=1;

				* resistance virus in partner - pr 82;
				g=uniform(0);
				if g < s_prop_p82m  then p82m_p=1;

				* resistance virus in partner - pr 84;
				g=uniform(0);
				if g < s_prop_p84m  then p84m_p=1;

				* resistance virus in partner - pr 88;
				g=uniform(0);
				if g < s_prop_p88m  then p88m_p=1;

				* resistance virus in partner - pr 90;
				g=uniform(0);
				if g < s_prop_p90m  then p90m_p=1;

				* resistance virus in partner - Integrase inhibitor primary mut;
				g=uniform(0);
				if g < s_prop_inpm  then inpm_p=1;

				* resistance virus in partner - Integrase inhibitor secondary mut;
				g=uniform(0);
				if g < s_prop_insm  then insm_p=1;

				mut_p = tam_p + m184m_p + k65m_p + q151m_p + k103m_p + y181m_p + g190m_p 
				+ p32m_p + p33m_p + p46m_p + p47m_p + p50lm_p + p50vm_p + p54m_p 
				+ p76m_p + p82m_p + p84m_p + p88m_p + p90m_p  + inpm_p  + insm_p;

				f=f+1;
			end;  
		end;


		if gender=2 and       age{t} >= 20 then risk_nip = risk_nip * fold_change_w;  * higher transmission risk in women;
		if gender=2 and 15 <= age{t} <  20 then risk_nip = risk_nip * fold_change_yw;  * higher transmission risk in women;
		if sti{t}=1                        then risk_nip = risk_nip * fold_change_sti;  * higher transmission risk with sti;
		if gender=1 and mcirc   =1         then risk_nip = risk_nip * 0.4;  * lower transmission risk in men circumcised;
		if prep   =1 then do; 
			if m184m_p ne 1 and k65m_p ne 1 and tam_p<3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p ne 1 and k65m_p ne 1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p=1 and k65m_p ne 1 and tam_p<3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p ne 1 and k65m_p=1 and tam_p<3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p=1 and k65m_p ne 1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p ne 1 and k65m_p=1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p=1 and k65m_p=1  then risk_nip = risk_nip * (1-(adh{t} * 0.50 * eff_adh_prep));
			if m184m_p=1 and k65m_p=1 and (inpm_p ne 1 and pop_wide_tld_prep=1)  then risk_nip = risk_nip * (1-(adh{t} * 0.75 * eff_adh_prep));

		end;


		a=uniform(0); if a < risk_nip then do;
		    if hiv{t}=1 then do;
    		if onart{t} ne 1 then s_infection=1;  * may14 - added need to be off art to get super-infected;
			end;
			if hiv{t}=0 then do;
				vl_source_inf = vl_source;
			    infected_primary=0;infected_vlsupp=0;
			    hiv{t}=1; infected_newp=1; infected_ep=0; infection=caldate{t};* prob infected by person in primary;
				if vl_source_inf=1 then infected_vlsupp=1;
		    	if vl_source_inf=6 then infected_primary=1; 
				age_source_inf=age_newp;
				infected_prep=0; if prep   =1 then do; 
				infected_prep=1; infected_prep_source_prep_r=0; if (tam_p + m184m_p + k65m_p) ge 1 then infected_prep_source_prep_r=1; 
				end;
			end;
			goto xx77;
		end;
	d=d+1;
	end;
end;


* prob of infection from existing infected partner ;

risk_eip=0;  ep_primary=0;

d=uniform(0);
if epi{t}=1 then do;
	if epvls{t}=1    then do; risk_eip = max(0,tr_rate_undetec_vl+(0.000025*normal(0)));          vl_source=1;	s_prop_rm=s_prop_vlg1_rm; end;
	if epvls{t} ne 1 then do;
		if epi{t-1}=0 then do; risk_eip = max(0,tr_rate_primary+(0.075*normal(0))); ep_primary=1; vl_source=6;	s_prop_rm=s_prop_vlg6_rm; end;* infection in primary;
		if epi{t-1}=1 then do; risk_eip = max(0,(0.05*fold_tr)+(0.0125*normal(0)));               vl_source=4;	s_prop_rm=s_prop_vlg4_rm; end;
	end;* ie average risk for those with detectable vl;


		 *The definition of these variables to 0 has been moved before
		 e<t_prop_rm otherwise mut_p could refer to previous partners;

		  m184m_p=0;  tam_p=0;  k65m_p=0;  q151m_p=0; k103m_p=0; y181m_p=0;  g190m_p=0;  
		  p32m_p=0;   p33m_p=0; p46m_p=0;  p47m_p=0;  p50lm_p=0; p50vm_p=0;  p54m_p=0;  
		  p76m_p=0;   p82m_p=0; p84m_p=0;  p88m_p=0;  p90m_p=0;  inpm_p=0;   insm_p=0;
		  mut_p=.;

		  e=uniform(0); if e < s_prop_rm  then do;
			*in order to have at least one mutation for all subjects who are supposed to have at least one;

			f=1;do until ((f=10) or (mut_p ge 1));  

                * resistance virus in partner - tams;
                s_prop_tam = s_prop_tam1+s_prop_tam2+s_prop_tam3;
                g=uniform(0);
                if g < s_prop_tam  then  do; tam_p=max(1,ranpoi(0,1)); if tam_p ge 6 then tam_p=6;end;

				* resistance virus in partner - 184m;
				g=uniform(0);
				if g < s_prop_m184m  then m184m_p=1;
	
				* resistance virus in partner - k65m;
				g=uniform(0);
				if g < s_prop_k65m  then k65m_p=1;

				* resistance virus in partner - q151m;
				g=uniform(0);
				if g < s_prop_q151m  then q151m_p=1;

				* resistance virus in partner - nnrti;
				g=uniform(0);
				if g < s_prop_k103m then k103m_p=1;

				g=uniform(0);
				if g < s_prop_y181m then y181m_p=1;

				g=uniform(0);
				if g < s_prop_g190m then g190m_p=1;

				* resistance virus in partner - pr 32;
				g=uniform(0);
				if g < s_prop_p32m  then p32m_p=1;

				* resistance virus in partner - pr 33;
				g=uniform(0);
				if g < s_prop_p33m  then p33m_p=1;

				* resistance virus in partner - pr 46;
				g=uniform(0);
				if g < s_prop_p46m  then p46m_p=1;

				* resistance virus in partner - pr 47;
				g=uniform(0);
				if g < s_prop_p47m  then p47m_p=1;

				* resistance virus in partner - pr 50l;
				g=uniform(0);
				if g < s_prop_p50lm  then p50lm_p=1;

				* resistance virus in partner - pr 50v;
				g=uniform(0);
				if g < s_prop_p50vm  then p50vm_p=1;

				* resistance virus in partner - pr 54;
				g=uniform(0);
				if g < s_prop_p54m  then p54m_p=1;

				* resistance virus in partner - pr 76;
				g=uniform(0);
				if g < s_prop_p76m  then p76m_p=1;

				* resistance virus in partner - pr 82;
				g=uniform(0);
				if g < s_prop_p82m  then p82m_p=1;

				* resistance virus in partner - pr 84;
				g=uniform(0);
				if g < s_prop_p84m  then p84m_p=1;

				* resistance virus in partner - pr 88;
				g=uniform(0);
				if g < s_prop_p88m  then p88m_p=1;

				* resistance virus in partner - pr 90;
				g=uniform(0);
				if g < s_prop_p90m  then p90m_p=1;

				* resistance virus in partner - Integrase inhibitor primary mut;
				g=uniform(0);
				if g < s_prop_inpm  then inpm_p=1;

				* resistance virus in partner - Integrase inhibitor secondary mut;
				g=uniform(0);
				if g < s_prop_insm  then insm_p=1;

				mut_p = tam_p + m184m_p + k65m_p + q151m_p + k103m_p + y181m_p + g190m_p
				+  p32m_p + p33m_p + p46m_p + p47m_p + p50lm_p + p50vm_p + p54m_p 
				+ p76m_p +  p82m_p + p84m_p + p88m_p + p90m_p +  inpm_p + insm_p;

				f=f+1;
			end;  
		end;

	if gender=2 and age{t} <  20 then risk_eip = risk_eip * fold_change_yw;* higher transmission risk in women;
	if gender=2 and age{t} ge 20 then risk_eip = risk_eip * fold_change_w;  * higher transmission risk in women;
	if sti{t}=1                  then risk_eip = risk_eip * fold_change_sti;  * higher transmission risk with sti;
	if gender=1 and mcirc   =1   then risk_eip = risk_eip* 0.4;  * lower transmission risk in men circumcised;

		if prep   =1 then do; 
			if m184m_p ne 1 and k65m_p ne 1 and tam_p<3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p ne 1 and k65m_p ne 1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p=1 and k65m_p ne 1 and tam_p<3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p ne 1 and k65m_p=1 and tam_p<3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p=1 and k65m_p ne 1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p ne 1 and k65m_p=1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh{t} * eff_adh_prep));
			if m184m_p=1 and k65m_p=1  then risk_nip = risk_nip * (1-(adh{t} * 0.50 * eff_adh_prep));
			if m184m_p=1 and k65m_p=1 and (inpm_p ne 1 and pop_wide_tld=1)  then risk_nip = risk_nip * (1-(adh{t} * 0.75 * eff_adh_prep));

		end;

	b=uniform(0);
	if b < risk_eip then do;

		if hiv{t}=0 then do;
			vl_source_inf = vl_source ;
			hiv{t}=1; infected_ep=1;infected_newp=0; infection=caldate{t};
			infected_primary=0;	if ep_primary=1 then infected_primary=1;
			infected_vlsupp=0;  if vl_source=1 then infected_vlsupp=1;
			age_source_inf=ageg_ep;
			infected_prep=0; if prep   =1 then do; 
			infected_prep=1; infected_prep_source_prep_r=0; if (tam_p + m184m_p + k65m_p) ge 1 then infected_prep_source_prep_r=1; 
			end;
		end;
		if hiv{t}=1 then do;
	    * prob infection in 3 mths;
		    a=uniform(0);b=uniform(0);
    		s_infection=0; if onart{t} ne 1 and b < risk_eip then s_infection=1;  * may14 - added need to be off art to get super-infected;
		end;
	goto xx77;
	end;
end;


* if have new existing partner, are they infected ?;
if gender=1 then do;
	if ageg_ep = 1 then prev=prevalence1524w;
	if ageg_ep = 2 then prev=prevalence2534w;
	if ageg_ep = 3 then prev=prevalence3544w;
	if ageg_ep = 4 then prev=prevalence4554w;
	if ageg_ep = 5 then prev=prevalence5564w;
end;
else if gender=2 then do;
	if ageg_ep = 1 then prev=prevalence1524m;
	if ageg_ep = 2 then prev=prevalence2534m;
	if ageg_ep = 3 then prev=prevalence3544m;
	if ageg_ep = 4 then prev=prevalence4554m;
	if ageg_ep = 5 then prev=prevalence5564m;
end;
if ep{t-1}=0 and ep{t}=1 and epi{t} ne 1 then do;
	s=uniform(0);a=uniform(0);epi{t}=0;
	if s <  0.5 then do; if mr_epi{t}=1 then do; epi{t}=1; old=1 ;end;end;
	if a < prev then do; epi{t}=1; already=1; end;
	if epi{t}=1 then do;
		epdiag{t}=0;
		if epdiag{t-1}=1 then epdiag{t}=1;
		if epdiag{t-1} ne 1 then do;
			epdiag{t}=0; s=uniform(0);

	if gender=1 then do; 
			if 0    > d_diag_w      	then j=0;
 			if 0.05 > d_diag_w >= 0 	then j=p_diag_w/5; 
			if 0.1  > d_diag_w >= 0.05 	then j=p_diag_w/2;  
			if        d_diag_w >= 0.1 	then j=p_diag_w;
		end;
		if gender=2 then do;
			if 0    > d_diag_m         then j=0;
			if 0.05 > d_diag_m >= 0    then j=p_diag_m/5; 
			if 0.1  > d_diag_m >= 0.05 then j=p_diag_m/2;  
			if        d_diag_m >= 0.1  then j=p_diag_m;
		end;

			if s < j then epdiag{t}=1;

			a=uniform(0);if (date_start_testing+3.5) <= caldate{t} then do;
				if s <  0.9 then epdiag{t}=mr_epdiag{t};
				if s >=0.9 and a < j then epdiag{t}=1;
			end;
		end;
		epart{t}=0; if epdiag{t}=1 then do; * remember some infected partners are lost to follow-up;
			if epart{t-1}=1 then do; epart{t}=0; f=uniform(0); if f < 0.98 then epart{t}=1; end;
			if epart{t-1} ne 1 and epdiag{t}=1 then do;
				epart{t}=0; s=uniform(0);
				
					if 0    >  d_onart        then j=0;
					if 0    <= d_onart < 0.05 then j=p_diag_onart/5;
					if 0.05 <= d_onart < 0.1  then j=p_diag_onart/2;
					if 0.1  <= d_onart        then j=p_diag_onart;
					if    p_diag_onart > 0.95 then j=1;

				if art_intro_date <= caldate{t} and s < j  then epart{t}=1;
			end;

		end;
		* rates of viral suppression;
		epvls{t}=0; if epart{t}=1 then do;
			if epvls{t-1}=1 then do; epvls{t}=1; f=uniform(0); if f < 0.03 then epvls{t}=0; end;
			if epvls{t-1} ne 1 and epart{t}=1 then do;
				if 0    > d_vls          then j=0;
				if 0.05 > d_vls >=  0    then j=p_onart_vls/5;  
				if 0.1  > d_vls >=  0.05 then j=p_onart_vls/2;  
				if        d_vls >=  0.1  then j=p_onart_vls;
				epvls{t}=0; s=uniform(0); if s < j  then epvls{t}=1;
			end;
		end;
	end;
end;


* transmitted resistance;
xx77:   
if hiv{t}=1 then do;

		k103m=k103m_p;  y181m=y181m_p;  g190m=g190m_p;  k65m=k65m_p;  m184m=m184m_p;  q151m=q151m_p;  tam=tam_p;
		p32m=p32m_p;    p33m=p33m_p;    p46m=p46m_p;    p47m=p47m_p;  p50lm=p50lm_p;
		p50vm=p50vm_p;  p54m=p54m_p;    p76m=p76m_p;    p82m=p82m_p;  p84m=p84m_p;  p88m=p88m_p;  p90m=p90m_p; 
		inpm=inpm_p;  insm=insm_p;
	* res_trans_factor now only considers nnrti - mar16 - to concentrate on key parameter
	castro, jain and yang papers suggest that rate loss for nnrti mutations is probably lower than we have assumed (rate loss 0.04 per 3 mths) so this should
	be reduced (in mar16). 
	if no changes are made in res_trans_factor then this leads to levels of tdr that are much higher than those observed.  We therefore
	need to consider higher levels of res_trans_factor (i.e sampling from 0.8-2 rather that a fixed value of 0.6 
	and therefore lower prob of mutations being transmitted and surviving) than before to compensate;
	
		if prep    ne 1 then do;
			if tam ge 1 then do; u=uniform(0); if u < 0.5  then tam = 0 ; end; * may17;
			if m184m= 1 then do; u=uniform(0); if u < 0.8  then m184m=0; end;
			if k65m = 1 then do; u=uniform(0); if u < 0.8  then k65m =0; end; 
		end;
        if q151m= 1 then do; u=uniform(0); if u < 0.5 then q151m=0; end; 

		if k103m = 1 then do; u=uniform(0); if u < 0.2*res_trans_factor_nn then k103m=0; end;
		if y181m = 1 then do; u=uniform(0); if u < 0.2*res_trans_factor_nn then y181m=0; end;
		if g190m = 1 then do; u=uniform(0); if u < 0.2*res_trans_factor_nn then g190m=0; end;

		if p32m = 1 then do; u=uniform(0); if u < 0.5 then p32m=0; end;
		if p33m = 1 then do; u=uniform(0); if u < 0.5 then p33m=0; end;
		if p46m = 1 then do; u=uniform(0); if u < 0.5 then p46m=0; end;
		if p47m = 1 then do; u=uniform(0); if u < 0.5 then p47m=0; end;
		if p50lm = 1 then do; u=uniform(0); if u < 0.5 then p50lm=0; end;
		if p50vm = 1 then do; u=uniform(0); if u < 0.5 then p50vm=0; end;
		if p54m = 1 then do; u=uniform(0); if u < 0.5 then p54m=0; end;
		if p76m = 1 then do; u=uniform(0); if u < 0.5 then p76m=0; end;
		if p82m = 1 then do; u=uniform(0); if u < 0.5 then p82m=0; end;
		if p84m = 1 then do; u=uniform(0); if u < 0.5 then p84m=0; end;
		if p88m = 1 then do; u=uniform(0); if u < 0.5 then p88m=0; end;
		if p90m = 1 then do; u=uniform(0); if u < 0.5 then p90m=0; end;

		if inpm = 1 then do; u=uniform(0); if u < 0.2*res_trans_factor_ii then inpm=0; end; * jun18;
		if insm = 1 then do; u=uniform(0); if u < 0.2*res_trans_factor_ii then insm=0; end; * jun18;

end;

xx33: end;

if tested{t}=1 and hiv{t} ne 1 then do;
	cost_test= cost_test_c;
	u=uniform(0); if u lt 0.1365 and com_test ne 1 then com_test=1;
	if com_test=1 then cost_test= cost_test_e;
	*Specificity of VCT: we simply assume that they will have a cost of a positive test, as treated as positive if the result is false positive;
	unispec=uniform(0);
	if unispec gt spec_vct                then cost_test=cost_test_b;
	if unispec gt spec_vct and com_test=1 then cost_test=cost_test_d;
end;

*separate cost for HIV-negative and HIV-positive people;
if tested{t}=1   and hiv{t} ne 1 and cost_test=0 then cost_test= cost_test_c;  



* INTRODUCE HIV INTO POPULATION ;

d=uniform(0);
if (s_hiv1564  <= 0) and caldate{t}=startyr and newp{t} >= newp_seed and d < 0.8   and infection=.  then do; 
		hiv{t}=1; infected_primary=1;infected_diagnosed=0; infected_newp=1; age_source_inf=99;
		infected_ep=0;infection=caldate{t}; primary{t}=1;
		tam=0;   k103m=0; y181m=0; g190m=0; m184m=0; q151m=0; k65m=0;  p32m=0; p33m=0; p46m=0; p47m=0;  p50lm=0; 
		p50vm=0; p54m=0;  p76m=0;  p82m=0;  p84m=0;  p88m=0;  p90m=0;  inpm=0; insm=0;
end;




*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* SET BASELINE VALUES AT TIME OF INFECTION;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


if caldate{t}=infection > . then do;

array vc{8} vc&g-vc&h;  
array c{8} c&g-c&h;

array cc{8} cc&g-cc&h;  
array csqr{8} csqr&g-csqr&h;
array ccsqr{8} ccsqr&g-ccsqr&h;
array vmax{8} vmax&g-vmax&h;
array cmin{8} cmin&g-cmin&h;
array pcp_p{8} pcp_p&g-pcp_p&h;
*array adh{8} adh&g-adh&h;  *NOTE: adh is the adherence between t-1 and t, not from t to t+1;
array adhmin{8} adhmin&g-adhmin&h;
array sw_toxicity{8} sw_toxicity&g-sw_toxicity&h;
array vfail1_{8} vfail1_&g-vfail1_&h;
array visit{8} visit&g-visit&h; * patient visited clinic / under follow-up;
array lost{8} lost&g-lost&h; * patient visited clinic / under follow-up;

array linefail{8} linefail&g-linefail&h; * this is failure however defined, based on monitoring approach;
array tcur{8} tcur&g-tcur&h; * time units on current line of 3/4 ART - starts at 0 on t of start ;
array artline{8} artline&g-artline&h;
array toffart{8} toffart&g-toffart&h; * time units since last stopped ART;

array naive{8} naive&g-naive&h;
array interrupt{8} interrupt&g-interrupt&h;
array interrupt_choice{8} interrupt_choice&g-interrupt_choice&h;
array interrupt_supply{8} interrupt_supply&g-interrupt_supply&h;
array return_{8} return_&g-return_&h;
array restart{8} restart&g-restart&h;
array resumec{8} resumec&g-resumec&h; * indicates if cd4 has reached cmin after interruption and before toffart=4;
array adhm{8} adhm&g-adhm&h;


array nod{8} nod&g-nod&h; * nod = number of drugs on;
array nonuc{8} nonuc&g-nonuc&h;

* tss_ = time since last stopping specific drugs;
* f_ = previous virological failure of drugs;
* o_ = currently on drug;
* p_ = previously taken drug;
* mr_ = for those off ART - drug used in most recent regimen ;
* r_ = level of resistance to each drug - determined by presence of mutations ;

array nactive{8} nactive&g-nactive&h;
array newmut{8} newmut&g-newmut&h; * risk of resistance arising (and dominating);

* c_ = current resistance as majority virus;

array c_totmut{8} c_totmut&g-c_totmut&h;  * total current # mutations;
array e_totmut{8} e_totmut&g-e_totmut&h;  * total ever # mutations;

* e_ = ever had mutation as dominant;
* t_ = previously stopped drug due to toxicity  ;


* current toxicity;
array c_tox{8} c_tox&g-c_tox&h;


* X4 virus present or not;
array x4v{8} x4v&g-x4v&h;
array who3_event{8} who3_event&g-who3_event&h;
array tb{8} tb&g-tb&h;
array who3_{8} who3_&g-who3_&h; * pre-who4 symptoms;
array who4_{8} who4_&g-who4_&h; * ever diagnosed with who4_ y/n;

primary{t}=1;

* birth with infected child;
if gender=2 then do;
birth_with_inf_child=0;
child_with_resistant_hiv=0;
end;


* viral load;
vset = 4.075 + (0.5 * normal(0)) + ((age{t}-35)*0.005) ;
if gender=2 then vset=vset-0.2;
if vset > 6.5 then vset=6.5;

* thought about giving women lower vl but this would affect progression - also do we know whether woman with given vl
is more or less infectious than man with the same vl ?;
v{t} = vset;

vprimary=7.5 + (0.5 * normal(0));
* vprimary exists only for transmission risk - it does not affect progression - vset is used for first v;


* CD4  - square root scale ;
csqr{t} = (mean_sqrtcd4_inf - (1.5 * vset) + 2*normal(0)) - ((age{t}-35)*0.05);
if csqr{t} gt sqrt(1500) then csqr{t}=sqrt(1500); 
if csqr{t} lt 0 then csqr{t}=0;
if csqr{t} < 18 then csqr{t}=18; 
if c{t} < 324 then c{t}=324; c{t}=csqr{t}**2;

cd4_infection=c{t};

* max CD4 count to which can return on ART;
cmax=exp(6.6+normal(0)*0.25);

patient_cd4_rise_art=exp(sd_patient_cd4_rise_art*normal(0));  * inter-patient variation in rate of CD4 rise - when CD4 is rising;

age_infection=age{t};

if 15 <= age_infection < 25 then age_infection_g=1;
if 25 <= age_infection < 35 then age_infection_g=2;
if 35 <= age_infection < 45 then age_infection_g=3;
if 45 <= age_infection < 55 then age_infection_g=4;
if 55 <= age_infection < 65 then age_infection_g=5;

* current use of drugs;
o_zdv = 0;
o_3tc = 0;
o_ten = 0;
o_nev = 0;
o_dar = 0;
o_efa = 0;
o_lpr = 0;
o_taz = 0;
o_dol = 0;


* previous use of drugs;
p_zdv = 0;
p_3tc = 0;
p_ten = 0;
p_nev = 0;
p_dar = 0;
p_efa = 0;
p_lpr = 0;
p_taz = 0;
p_dol = 0;

* time since last stopping specific drugs;
tss_zdv = .;
tss_3tc = .;
tss_ten = .;
tss_nev = .;
tss_dar = .;
tss_efa = .;
tss_lpr = .;
tss_taz = .;
tss_dol = .;


* for those off ART - drug used in most recent regimen ;
mr_zdv = 0;
mr_3tc = 0;
mr_ten = 0;
mr_dar = 0;
mr_efa = 0;
mr_lpr = 0;
mr_taz = 0;
mr_dol = 0;
mr_nev = 0;

* previous virological failure of drugs;

f_zdv = 0;
f_3tc = 0;
f_ten = 0;
f_nev = 0;
f_dar = 0;
f_efa = 0;
f_lpr = 0;
f_taz = 0;
f_dol = 0;


toffart{t}=.;

c_rttams=max(0,tam);
c_rt184m= max(0,m184m);
c_rt151m = max(0,q151m);
c_rt65m = max(0,k65m);
c_pr32m=max(0,p32m);
c_pr33m=max(0,p33m);
c_pr46m=max(0,p46m);
c_pr47m=max(0,p47m);
c_pr50vm=max(0,p50vm);
c_pr50lm=max(0,p50lm);
c_pr54m=max(0,p54m);
c_pr76m=max(0,p76m);
c_pr82m=max(0,p82m);
c_pr84m=max(0,p84m);
c_pr88m=max(0,p88m);
c_pr90m=max(0,p90m);

* NNRTI resistance modelled separately c_rtnnm{t} is not used anymore, instead model K103N, Y181C and G190A;
c_rt103m= max(0,k103m);
c_rt181m= max(0,y181m);
c_rt190m= max(0,g190m);
c_inpm=max(0,inpm);
c_insm=max(0,insm);


c_rttams_inf=c_rttams;
c_rt151m_inf=c_rt151m;
c_rt184m_inf=c_rt184m;
c_rt65m_inf=c_rt65m;
c_pr32m_inf=c_pr32m;
c_pr33m_inf=c_pr33m;
c_pr46m_inf=c_pr46m;
c_pr47m_inf=c_pr47m;
c_pr50vm_inf=c_pr50vm;
c_pr50lm_inf=c_pr50lm;
c_pr54m_inf=c_pr54m;
c_pr76m_inf=c_pr76m;
c_pr82m_inf=c_pr82m;
c_pr84m_inf=c_pr84m;
c_pr88m_inf=c_pr88m;
c_pr90m_inf=c_pr90m;
* NNRTI resistance modelled separately c_rtnnm{t} is not used anymore, instead model K103N, Y181C and G190A;
c_rt103m_inf=c_rt103m;
c_rt181m_inf=c_rt181m;
c_rt190m_inf=c_rt190m;
c_inpm_inf=c_inpm;
c_insm_inf=c_insm;


if c_pr32m=1 or c_pr33m=1 or 
c_pr46m=1 or c_pr47m=1 or 
c_pr50vm=1 or c_pr50lm=1 or c_pr54m=1 or 
c_pr76m=1 or c_pr82m=1 or c_pr84m=1 or c_pr88m=1 or
c_pr90m=1 then c_prm_inf=1; else c_prm_inf=0;

if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 or c_rt65m=1 or c_rt184m=1 or c_rttams >= 1 
or c_prm_inf=1 or c_inpm=1 or c_insm=1 or c_rt151m then c_rm_inf=1 ; else c_rm_inf=0;



e_rttams = c_rttams;
e_rt184m = c_rt184m;
e_rt65m =  c_rt65m  ;
e_rt151m =  c_rt151m  ;
e_pr32m = c_pr32m  ;
e_pr33m = c_pr33m ;
e_pr46m = c_pr46m ;
e_pr47m = c_pr47m ;
e_pr50vm = c_pr50vm  ;
e_pr50lm = c_pr50lm  ;
e_pr54m = c_pr54m ;
e_pr76m = c_pr76m ;
e_pr82m = c_pr82m   ;
e_pr84m = c_pr84m  ;
e_pr88m = c_pr88m  ;
e_pr90m = c_pr90m   ;


e_rt103m = c_rt103m;
e_rt181m = c_rt181m;
e_rt190m = c_rt190m;
e_inpm = c_inpm   ;
e_insm = c_insm   ;



* resistance for the purposes of determining response to current regimen
- ever resistance - except depends on current 3tc ;
r_zdv = 0;
r_3tc = 0;
r_ten = 0;
r_nev = 0;
r_dar = 0;
r_efa = 0;
r_lpr = 0;
r_taz = 0;
r_dol = 0;


* 3tc;
if e_rt65m=1 or e_rt151m=1 then r_3tc=0.25;
if e_rt184m=1                 then r_3tc=0.75;  
if zero_3tc_activity_m184 =1 and (e_rt65m=1 or e_rt151m=1) then r_3tc=1.00 ;

* zdv;
if 1 <= e_rttams < 3 and (o_3tc=0 )                  then do; r_zdv=0.5 ;  end;
if 3 <= e_rttams < 5 and (o_3tc=0 )                  then do; r_zdv=0.75;  end;
if 5 <= e_rttams     and (o_3tc=0 )                  then do; r_zdv=1.00;  end;
if 1 <= e_rttams < 3 and (o_3tc=1) and e_rt184m=1 then do; r_zdv=0.25;  end;
if 3 <= e_rttams < 5 and (o_3tc=1) and e_rt184m=1 then do; r_zdv=0.5 ;  end;
if 5 <= e_rttams     and (o_3tc=1) and e_rt184m=1 then do; r_zdv=0.75;  end;
if 1 <= e_rttams < 3 and (o_3tc=1) and e_rt184m=0 then do; r_zdv=0.5 ;  end;
if 3 <= e_rttams < 5 and (o_3tc=1) and e_rt184m=0 then do; r_zdv=0.75;  end;
if 5 <= e_rttams     and (o_3tc=1) and e_rt184m=0 then do; r_zdv=0.75;  end;
if e_rt151m=1 										   then do; r_zdv=0.75;  end;
if e_rt65m=1 										   then do;                 end;


* ten;
if e_rt65m=0 and 2 <= e_rttams <= 3 and ((o_3tc=0) or  (o_3tc=1   and e_rt184m=0)) then do; r_ten=0.5 ; end;
if e_rt65m=0 and 4 <= e_rttams      and ((o_3tc=0) or ((o_3tc=1 ) and e_rt184m=0)) then do; r_ten=0.75; end;
if e_rt65m=0 and 2 <= e_rttams <= 3 and  (o_3tc=1 )                  and e_rt184m=1   then do; r_ten=0.5 ; end;
if e_rt65m=0 and 4 <= e_rttams      and  (o_3tc=1 )                  and e_rt184m=1   then do; r_ten=0.5 ; end;
if e_rt65m=1  																				  then do; r_ten=0.75 ; end;
if zero_tdf_activity_k65r=1 and e_rt65m=1 then r_ten=1.00 ; 


* AP 19-719;
*NNRTIs;
if e_rt181m=1 then do; 
	r_nev=1.0; r_efa=0.75; 
	if nnrti_res_no_effect = 0.25 then do; 
		r_efa=0.75; r_nev=1.0; 
	end; 
	if nnrti_res_no_effect = 0.5 then do; 
		r_efa=0.5; r_nev=0.5; 
	end; 
	if nnrti_res_no_effect = 0.75 then do; 
		r_efa=0.25; r_nev=0.25; 
	end; 
end; 

if e_rt190m=1 then do; 
	r_nev=1.0; r_efa=0.75; 
	if nnrti_res_no_effect = 0.25 then do; 
		r_efa=0.75; r_nev=1.0; 
	end;
	if nnrti_res_no_effect = 0.5 then do; 
		r_efa=0.5; r_nev=0.5; 
	end;
	if nnrti_res_no_effect = 0.75 then do; 
		r_efa=0.25; r_nev=0.25; 
	end; 
end;

if e_rt103m=1 then do; 
	r_nev=1.0; r_efa=1.0;  
	if nnrti_res_no_effect = 0.25 then do; 
		r_efa=0.75; r_nev=0.75; 
	end; 
	if nnrti_res_no_effect = 0.5 then do; 
		r_efa=0.5; r_nev=0.5; 
	end; 
	if nnrti_res_no_effect = 0.75 then do; 
		r_efa=0.25; r_nev=0.25; 
	end;
end; 

if nnrti_res_no_effect = 0.75 then r_efa = min(0.25,r_efa); 

if nnrti_res_no_effect = 1 then r_efa=0.0;


*PIs;

*lpr;
	if e_pr47m=1 then r_lpr=0.75;
	if e_pr32m+e_pr76m+e_pr82m = 1 and e_pr47m=0 then r_lpr=0.25;

	if 2 <= e_pr46m+e_pr82m+ e_pr84m+e_pr90m < 4 then do;
	r_lpr=max(r_lpr,0.25);
	end;

	if e_pr32m+e_pr76m+e_pr82m = 2 and e_pr47m=0 then r_lpr=0.5;

	if e_pr46m+e_pr82m+ e_pr84m+e_pr90m = 4 then do;
	r_lpr=max(r_lpr,0.50);
	end;

	if e_pr32m+e_pr76m+e_pr82m = 3 and e_pr47m=0 then r_lpr=0.75;
	if e_pr32m+e_pr47m+e_pr76m+e_pr82m = 4 then r_lpr=1.00; 


*taz;  
*added full of resistance confered by 84m(no mentioned before) and incraese from 0.75 to 1 for 88m and 50lm;

	if 1 <= (e_pr32m+e_pr46m+e_pr54m+e_pr82m+e_pr90m) < 4 							 then r_taz=0.5;
	if (e_pr50lm=1 or e_pr84m=1 or e_pr88m=1) 												 then r_taz=1.0;
	if      (e_pr32m+e_pr46m+e_pr54m+e_pr82m+e_pr90m) >= 4 							 then r_taz=1.0;

*dar;  
*July2013: e_pr32m has beeen added into teh following sum;
	if e_pr32m+e_pr47m+e_pr50vm+e_pr54m+e_pr76m+e_pr84m  = 2 then r_dar=0.25;
	if e_pr32m+e_pr47m+e_pr50vm+e_pr54m+e_pr76m+e_pr84m  = 3 then r_dar=0.5;
	if e_pr32m+e_pr47m+e_pr50vm+e_pr54m+e_pr76m+e_pr84m >= 4 then r_dar=0.75;


* dol;
	*July2013:[v5_v6] Integrase inhibitors mutations are now included as two separate primary and secondary mutations;
	if (e_inpm=1 and e_insm=1) then r_dol=1.0;
	if (e_inpm=1 and e_insm=0) then r_dol=0.75;
	if (e_inpm=0 and e_insm=1) then r_dol=0.25;


* prep;
if prep   =1 and pop_wide_tld_prep ne 1 then nactive{t}=2-r_ten-r_3tc; 
if prep   =1 and pop_wide_tld_prep = 1 then nactive{t}=3-r_ten-r_3tc-r_dol; 

*Infected_diagnosed and infected_naive
(the program below only determines whether a person is infected from a person diagnosed or 
naive or not, I would leave this as it is);

if vl_source_inf=1 and c_rm_inf=0 then do; s_prop_diag=s_prop_vlg1_rm0_diag;s_prop_naive=s_prop_vlg1_rm0_naive; end;
if vl_source_inf=1 and c_rm_inf=1 then do; s_prop_diag=s_prop_vlg1_rm1_diag;s_prop_naive=s_prop_vlg1_rm1_naive; end;

if vl_source_inf=2 and c_rm_inf=0 then do; s_prop_diag=s_prop_vlg2_rm0_diag;s_prop_naive=s_prop_vlg2_rm0_naive; end;
if vl_source_inf=2 and c_rm_inf=1 then do; s_prop_diag=s_prop_vlg2_rm1_diag;s_prop_naive=s_prop_vlg2_rm1_naive; end;

if vl_source_inf=3 and c_rm_inf=0 then do; s_prop_diag=s_prop_vlg3_rm0_diag;s_prop_naive=s_prop_vlg3_rm0_naive; end;
if vl_source_inf=3 and c_rm_inf=1 then do; s_prop_diag=s_prop_vlg3_rm1_diag;s_prop_naive=s_prop_vlg3_rm1_naive; end;

if vl_source_inf=4 and c_rm_inf=0 then do; s_prop_diag=s_prop_vlg4_rm0_diag;s_prop_naive=s_prop_vlg4_rm0_naive; end;
if vl_source_inf=4 and c_rm_inf=1 then do; s_prop_diag=s_prop_vlg4_rm1_diag;s_prop_naive=s_prop_vlg4_rm1_naive; end;

if vl_source_inf=5 and c_rm_inf=0 then do; s_prop_diag=s_prop_vlg5_rm0_diag;s_prop_naive=s_prop_vlg5_rm0_naive; end;
if vl_source_inf=5 and c_rm_inf=1 then do; s_prop_diag=s_prop_vlg5_rm1_diag;s_prop_naive=s_prop_vlg5_rm1_naive; end;

if vl_source_inf=6 and c_rm_inf=0 then do; s_prop_diag=s_prop_vlg6_rm0_diag;s_prop_naive=s_prop_vlg6_rm0_naive; end;
if vl_source_inf=6 and c_rm_inf=1 then do; s_prop_diag=s_prop_vlg6_rm1_diag;s_prop_naive=s_prop_vlg6_rm1_naive; end;

if infected_newp=1 then do;	
	infected_diagnosed=0; infected_naive=1;
	g=uniform(0);
    if g < s_prop_diag then infected_diagnosed=1;
	if infected_diagnosed=1 then do; 
		s=uniform(0);
		infected_naive=0; if s < s_prop_naive then infected_naive=1;
	end;
end;

if infected_ep=1 then do;
	infected_diagnosed=0; if epdiag{t-1}=1 then infected_diagnosed=1;  
	infected_naive=1;
	if epart{t-1}=1 then infected_naive=0;
	if epdiag{t-1}=1 and epart{t-1}=0 then do;
		* have to make this approximation below because dont track naive status of ep;
		a=uniform(0); infected_naive=0; if a < s_prop_naive then infected_naive=1;
	end;
end;


* previously stopped drug due to toxicity  ;
t_zdv = 0;

t_3tc = 0;
t_ten = 0;
t_nev = 0;
t_dar = 0;
t_efa = 0;
t_lpr = 0;
t_taz = 0;
t_dol = 0;

line1=0; line2=0;  line3=0;

* current tox;
c_tox{t} = 0;

who3_{t} =0; * ever diagnosed with pre-who4_ symptoms y/n;
who4_{t} =0;* ever diagnosed with who4_ y/n;

visit{t} = .;
registd{t} = 0;

cmin{t} =c{t};
vmax{t} =v{t};

x4v{t}=0;

onart{t}=0;
naive{t}=1;

*allow for diagnosis in primary infection, i.e. caldate{t}=infection;
*If HIV test type=3 (window period=3 months) then dont get diagnosed during primary infection but have raised risk of resistance;
*If HIV test type=4 (window period=1 months) or HIV test type=1 (window period=10 days) then can get diagnosed during 
primary infection and have raised risk of resistance;  * ### this code moved from below (caldate{t} > infection) as it refers to primary{t}=1 ;
if t ge 2 then do; 
	if hivtest_type=3 then risk_incr_res_primary=1*fold_incr_res_primary; 
	if hivtest_type=4 then do;
		u=uniform(0);
		if primary{t}=1 and tested{t}=1 and u lt sens_primary then do;
			registd{t}=1; date1pos=caldate{t}; diagprim=caldate{t};
			visit{t}=1; lost{t}=0; cd4diag=c{t-1}; if pop_wide_tld_prep ne 1 then onart{t}=0;
			if prep   =1 and pop_wide_tld_prep ne 1 then do;
				prep   =0; prep_ever=.; dt_prep_s=.; dt_prep_e=.; o_3tc=0; o_ten=0; tcur{t}=.; nactive{t}=.;
			end;
			if       .  lt u lt 0.5 then risk_incr_res_primary=fold_incr_res_primary/3; 
			else if 0.5 le u lt 1   then risk_incr_res_primary=fold_incr_res_primary/2; 
		end;
		else if primary{t}=1 and tested{t}=1 and u ge sens_primary then do;
			risk_incr_res_primary=1*fold_incr_res_primary; *infection in month 3/3 so do not get diagnosed;
		end;
	end;
	if hivtest_type=1 then do;
		u=uniform(0);
		if primary{t}=1 and tested{t}=1 and u lt sens_primary then do;
			registd{t}=1; date1pos=caldate{t}; diagprim=caldate{t};
			if prep   =1 and pop_wide_tld_prep ne 1 then do;
				prep   =0; prep_ever=.; dt_prep_s=.; dt_prep_e=.; o_3tc=0; o_ten=0; tcur{t}=.; nactive{t}=.;
			end;
			if       .    lt u lt 0.125 then risk_incr_res_primary=3*fold_incr_res_primary; *infection in days 0-10;
			else if 0.125 le u le 0.25  then risk_incr_res_primary=2.75*fold_incr_res_primary; *infection in days 10-20;
			else if 0.25  le u le 0.375 then risk_incr_res_primary=2.5*fold_incr_res_primary; *infection in days 20-30;
			else if 0.375 le u le 0.5   then risk_incr_res_primary=2.25*fold_incr_res_primary; *infection in days 30-40;
			else if 0.5   le u le 0.625 then risk_incr_res_primary=2*fold_incr_res_primary; *infection in days 40-50;
			else if 0.625 le u le 0.75  then risk_incr_res_primary=1.75*fold_incr_res_primary; *infection in days 50-60;
			else if 0.75  le u le 0.875 then risk_incr_res_primary=1.5*fold_incr_res_primary; *infection in days 60-70;
			else if 0.875 le u lt 1     then risk_incr_res_primary=1.25*fold_incr_res_primary; *infection in days 70-80;
		end;
		else if primary{t}=1 and tested{t}=1 and u ge sens_primary then do;
			risk_incr_res_primary=1*fold_incr_res_primary; *infection in days 80-90 so do not get diagnosed;
		end;
	end;
end;


* note these lines only apply in period of infection;

if prep   =1 then do; o_3tc=1; o_ten=1; tcur{t}=0; end;
*I leave this command because I want those infected to be on 3tc and then until they are diagnosed,
but I copy this command above because I want those on prep who do not get infected to be on 3tc and ten;

* AP 21-7-19;  * note that onart=1 but registd  =0 ;
if prep   =1 and pop_wide_tld_prep=1 then do; onart{t}=1; time0=caldate{t}; yrart=time0; 
linefail{t}=0; artline{t}=1; tcur{t}=0;  line1=1;vfail1_{t}=0; naive{t}=0; o_3tc=1; o_ten=1; o_dol=1; tcur{t}=0; 
o_zdv=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0; 
end;


* measured viral load;
vm = .;

* measured cd4 count;
cm = .;




end;



*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* START OF CODE FOR HIV INFECTED;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


if hiv{t}=1 then do;





if t ge 2 and . < infection < caldate{t} < 2070.0 and dead{t-1} ne 1  then do;

sympt_diag=0;
registd{t}=registd{t-1}; lost{t}=lost{t-1};

* VISIT FREQUENCY  ;
	visit{t}=visit{t-1};
	if lost{t-1}=1 then visit{t}=0;

	vfail1_{t}=vfail1_{t-1};

	onart{t}=onart{t-1};    naive{t}=naive{t-1};    artline{t}=artline{t-1};
	if onart{t}=1 then tcur{t}=tcur{t-1}+1;
	if prep   =1 then tcur{t}=tcur{t-1}+1;

	if prep   =0 and caldate{t} ge date_prep_intro and onart{t} ne 1 then tcur{t}=.;
	linefail{t}=linefail{t-1};

	o_zdv_tm1=o_zdv; p_zdv_tm1=p_zdv;f_zdv_tm1=f_zdv; t_zdv_tm1=t_zdv; r_zdv_tm1=r_zdv;
	r_3tc_tm1=r_3tc;o_3tc_tm1=o_3tc; p_3tc_tm1=p_3tc; f_3tc_tm1=f_3tc; t_3tc_tm1=t_3tc;
	r_ten_tm1=r_ten;o_ten_tm1=o_ten; p_ten_tm1=p_ten;f_ten_tm1=f_ten; t_ten_tm1=t_ten;
	o_nev_tm2=o_nev_tm1; o_nev_tm1=o_nev;  p_nev_tm1=p_nev;f_nev_tm1=f_nev; t_nev_tm1=t_nev; r_nev_tm1=r_nev;
	o_efa_tm2=o_efa_tm1;o_efa_tm1=o_efa;  p_efa_tm1=p_efa;f_efa_tm1=f_efa; t_efa_tm1=t_efa;r_dar_tm1=r_dar;
	o_dar_tm1=o_dar; p_dar_tm1=p_dar;f_dar_tm1=f_dar;r_efa_tm1=r_efa;t_efa_tm1=t_efa;
	o_lpr_tm1=o_lpr; p_lpr_tm1=p_lpr; f_lpr_tm1=f_lpr;r_lpr_tm1=r_lpr;t_lpr_tm1=t_lpr;
	o_taz_tm1=o_taz; p_taz_tm1=p_taz; f_taz_tm1=f_taz;r_taz_tm1=r_taz;t_taz_tm1=t_taz;
    o_dol_tm3=o_dol_tm2; o_dol_tm2=o_dol_tm1; o_dol_tm1=o_dol;  p_dol_tm1=p_dol;f_dol_tm1=f_dol; t_dol_tm1=t_dol;r_dol_tm1=r_dol;

	* for a person on ten-3tc prep at the time of adoption of pop wide tld prep;
	if prep   =1 and pop_wide_tld_prep=1 then do;
	onart{t}=1; time0=caldate{t}; yrart=time0; 
	linefail{t}=0; artline{t}=1; tcur{t}=0;  line1=1;vfail1_{t}=0; naive{t}=0; o_3tc=1; o_ten=1; o_dol=1; tcur{t}=0; 
	o_zdv=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0; 
	end;

	mr_zdv_tm1=mr_zdv; 	if tss_zdv ge 0 and o_zdv_tm1=0 then tss_zdv = tss_zdv+1;
	mr_3tc_tm1=mr_3tc; if tss_3tc ge 0 and o_3tc_tm1=0 then tss_3tc = tss_3tc+1;
	mr_ten_tm1=mr_ten; if tss_ten ge 0 and o_ten_tm1=0 then tss_ten = tss_ten+1;
	mr_nev_tm1=mr_nev; if tss_nev ge 0 and o_nev_tm1=0 then tss_nev = tss_nev+1;
	mr_dar_tm1=mr_dar; if tss_dar ge 0 and o_dar_tm1=0 then tss_dar = tss_dar+1;
	mr_efa_tm1=mr_efa; if tss_efa ge 0 and o_efa_tm1=0 then tss_efa = tss_efa+1;
	mr_lpr_tm1=mr_lpr; if tss_lpr ge 0 and o_lpr_tm1=0 then tss_lpr = tss_lpr+1;
	mr_taz_tm1=mr_taz; if tss_taz ge 0 and o_taz_tm1=0 then tss_taz = tss_taz+1;
	mr_dol_tm1=mr_dol; if tss_dol ge 0 and o_dol_tm1=0 then tss_dol = tss_dol+1;

	c_lip_tm1=c_lip ;   c_pen_tm1=c_pen ;   c_ras_tm1=c_ras ;   
	c_cns_tm1=c_cns ;   c_hep_tm1=c_hep ;   c_nau_tm1=c_nau ;   c_otx_tm1=c_otx ;   
	c_head_tm1=c_head ;   c_lac_tm1=c_lac ;   c_ane_tm1=c_ane ;   c_dia_tm1=c_dia ;   
	c_neph_tm1=c_neph ;   

	c_lip = 0;
	c_pen = 0;
	c_ras = 0;
	c_cns = 0;
	c_hep = 0;
	c_nau = 0;
	c_otx = 0;
	c_head =0;
	c_lac =0;
	c_ane =0;
	c_dia =0;
	c_neph = 0;

	if toffart{t-1} ge 0 and onart{t-1}=0 then do;
		toffart{t}=toffart{t-1}+1;
		if prep    ne 1 then do;
			if interrupt_supply{t-1}=1 then interrupt_supply{t}=1;
			if interrupt_choice{t-1}=1 then interrupt_choice{t}=1;
		end;
	end;

	c_totmut{t}=c_totmut{t-1};e_totmut{t}=e_totmut{t-1};

	e_rttams_tm2=e_rttams_tm1; 	e_rttams_tm1=e_rttams; 
	e_rt184m_tm2=e_rt184_tm1;	e_rt184m_tm1=e_rt184m;
	e_rt65m_tm2=e_rt65_tm1;	e_rt65m_tm1=e_rt65m;
	e_rt151m_tm2=e_rt151_tm1;	e_rt151m_tm1=e_rt151m;
	e_rt103m_tm2=e_rt103_tm1;	e_rt103m_tm1=e_rt103m;
	e_rt181m_tm2=e_rt181_tm1;	e_rt181m_tm1=e_rt181m;
	e_rt190m_tm2=e_rt190_tm1;	e_rt190m_tm1=e_rt190m;
	e_pr32m_tm2=e_pr32_tm1;	e_pr32m_tm1=e_pr32m;
	e_pr33m_tm2=e_pr33_tm1;	e_pr33m_tm1=e_pr33m;
	e_pr46m_tm2=e_pr46_tm1;	e_pr46m_tm1=e_pr46m;
	e_pr47m_tm2=e_pr47_tm1;	e_pr47m_tm1=e_pr47m;
	e_pr50vm_tm2=e_pr50v_tm1;	e_pr50vm_tm1=e_pr50vm;
	e_pr50lm_tm2=e_pr50l_tm1;	e_pr50lm_tm1=e_pr50lm;
	e_pr54m_tm2=e_pr54_tm1;	e_pr54m_tm1=e_pr54m;
	e_pr76m_tm2=e_pr76_tm1;	e_pr76m_tm1=e_pr76m;
	e_pr82m_tm2=e_pr82_tm1;	e_pr82m_tm1=e_pr82m;
	e_pr84m_tm2=e_pr84_tm1;	e_pr84m_tm1=e_pr84m;
	e_pr88m_tm2=e_pr88_tm1;	e_pr88m_tm1=e_pr88m;
	e_pr90m_tm2=e_pr90_tm1; 	e_pr90m_tm1=e_pr90m ;
	e_inpm_tm2=e_inp_tm1;		e_inpm_tm1=e_inpm;
	e_insm_tm2=e_ins_tm1;		e_insm_tm1=e_insm;

	c_rttams_tm2=c_rttams_tm1; 	c_rttams_tm1=c_rttams; 
	c_rt184m_tm2=c_rt184_tm1;	c_rt184m_tm1=c_rt184m;
	c_rt65m_tm2=c_rt65_tm1;	c_rt65m_tm1=c_rt65m;
	c_rt151m_tm2=c_rt151_tm1;	c_rt151m_tm1=c_rt151m;
	c_rt103m_tm2=c_rt103_tm1;	c_rt103m_tm1=c_rt103m;
	c_rt181m_tm2=c_rt181_tm1;	c_rt181m_tm1=c_rt181m;
	c_rt190m_tm2=c_rt190_tm1;	c_rt190m_tm1=c_rt190m;
	c_pr32m_tm2=c_pr32_tm1;	c_pr32m_tm1=c_pr32m;
	c_pr33m_tm2=c_pr33_tm1;	c_pr33m_tm1=c_pr33m;
	c_pr46m_tm2=c_pr46_tm1;	c_pr46m_tm1=c_pr46m;
	c_pr47m_tm2=c_pr47_tm1;	c_pr47m_tm1=c_pr47m;
	c_pr50vm_tm2=c_pr50v_tm1;	c_pr50vm_tm1=c_pr50vm;
	c_pr50lm_tm2=c_pr50l_tm1;	c_pr50lm_tm1=c_pr50lm;
	c_pr54m_tm2=c_pr54_tm1;	c_pr54m_tm1=c_pr54m;
	c_pr76m_tm2=c_pr76_tm1;	c_pr76m_tm1=c_pr76m;
	c_pr82m_tm2=c_pr82_tm1;	c_pr82m_tm1=c_pr82m;
	c_pr84m_tm2=c_pr84_tm1;	c_pr84m_tm1=c_pr84m;
	c_pr88m_tm2=c_pr88_tm1;	c_pr88m_tm1=c_pr88m;
	c_pr90m_tm2=c_pr90_tm1; 	c_pr90m_tm1=c_pr90m; 
	c_inpm_tm2=c_inp_tm1;		c_inpm_tm1=c_inpm;
	c_insm_tm2=c_ins_tm1;		c_insm_tm1=c_insm;


	* super-infection;
	*If super-infection is swicthed on only 20% can be re-infected,
	this was due to the fact that super infection seemed to play a big role in our model,
	while this has never been mentioned as a big problem by clinicians;
	sx=uniform(0);
	if super_infection=1 then do;
		if s_infection=1 and sx<0.2 then do;
			c_rt103m=max(k103m,c_rt103m);c_rt181m=max(y181m,c_rt181m);c_rt190m=max(g190m,c_rt190m);
			c_inpm=max(inpm,c_inpm); c_insm=max(insm,c_insm);
			c_rttams= max(c_rttams,tam); c_rt184m= max(m184m,c_rt184m);
			c_rt151m= max(q151m,c_rt151m); c_rt65m= max(k65m ,c_rt65m); 
			c_pr32m=max(p32m,c_pr32m);c_pr33m=max(p33m,c_pr33m);
			c_pr46m=max(p46m,c_pr46m);c_pr47m=max(p47m,c_pr47m);
			c_pr50vm=max(p50vm,c_pr50vm);c_pr50lm=max(p50lm,c_pr50lm);c_pr54m=max(p54m,c_pr54m);
			c_pr76m=max(p76m,c_pr76m);c_pr82m=max(p82m,c_pr82m);c_pr84m=max(p84m,c_pr84m);
			c_pr88m=max(p88m,c_pr88m);c_pr90m=max(p90m,c_pr90m);
			c_inpm=max(inpm,c_inpm);		 c_insm=max(insm,c_insm);

			if tam=1 or k103m=1 or y181m=1 or g190m=1 or m184m=1 or q151m=1 or k65m=1 or p32m=1 or p33m=1 or p46m=1 or 
			p47m=1 or p50lm=1 or p50vm=1 or p54m=1 or p76m=1 or p82m=1 or p84m=1 or p88m=1 or p90m=1 or inpm=1 or insm=1 then  
			super_i_r=1; 
			if k103m=1 or y181m=1 or g190m=1 then super_nnm=1; 
		end;
	end;

	x4v{t}=x4v{t-1};    vmax{t}=vmax{t-1};      cmin{t}=cmin{t-1};
	who4_{t}=who4_{t-1};  who3_{t}=who3_{t-1};
	primary{t}=0; 

end;

if t ge 2 then do; 
	if . < c{t-1} < 0 then c{t-1}=0; csqr{t-1}=sqrt(c{t-1}); 
end;
if . < c{t} < 0 then c{t}=0;
csqr{t}=sqrt(c{t});




*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* START OF CODE FOR HIV INFECTED WITH CALDATE{T} >= INFECTION+0.25;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

if caldate{t} >= infection+0.25 > . then do;


* measured viral load;
vm_tm3 = vm_tm2; vm_tm2 = vm_tm1; vm_tm1 = vm;	vm = .;

* measured cd4 count;
cm_tm3 = cm_tm2; cm_tm2 = cm_tm1; cm_tm1 = cm;  cm =.;             


if t ge 2 and prep   =0 and prep_tm1 =1 and pop_wide_tld ne 1 then do; o_ten=0; o_3tc=0; toffart{t}=0; end;
if t ge 2 and prep   =0 and prep_tm1 =1 and pop_wide_tld = 1 then do; o_ten=0; o_3tc=0; o_dol=0; toffart{t}=0; end; 
* note we assume that if pop_wide_tld = 1 then all use of prep is tld not tl ;

* DIAGNOSIS of HIV ;

*
testing strategy 1: testing patients who present for testing or have symptoms (ie similar to developed countries)
testing strategy 2: testing only those presenting with symptoms (ie who stage 3 or 4 ) (which is programmed below anyway);

* elig_test... variables introduced feb17 to determine why people were getting tested;
elig_test_who4=0;elig_test_who3=0;elig_test_tb=0;elig_test_who4_tested=0;elig_test_tb_tested=0;elig_test_who3_tested=0;
	if t ge 3 and registd{t} ne 1 and tested{t} ne 1 and caldate{t} ge date_start_testing then do;
		if adc{t-1}=1                                     then do; rate_test=test_rate_who4; elig_test_who4=1; end; *rate_test*incr_diag_rate_who4;			
		if adc{t-1}=0 and tb{t-2}=0 and tb{t-1}=1         then do; rate_test=test_rate_tb; elig_test_tb=1; end;*rate_test*incr_diag_rate_tb;
		if who3_event{t-1}=1 and adc{t-1}=0 and tb{t-1}=0 then do; rate_test=test_rate_who3; elig_test_who3=1; end; *rate_test*incr_diag_rate_who3;

		if (adc{t-1}=1 or (tb{t-2}=0 and tb{t-1}=1) or who3_event{t-1}=1) then do;
			unitest=uniform(0);if unitest<rate_test  then do;
				tested{t}=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;sympt_diag=1;
				sympt_diag_ever=1;dt_last_test=caldate{t};np_lasttest=0;
				newp_lasttest_tested_this_per = newp_lasttest;newp_lasttest=0;
				if adc{t-1}=1 then elig_test_who4_tested=1; if adc{t-1}=0 and tb{t-2}=0 and tb{t-1}=1 then elig_test_tb_tested=1;
				if who3_event{t-1}=1 and adc{t-1}=0 and tb{t-1}=0 then elig_test_who3_tested=1;
			end;
		end;
	end;

	*Cost of diagnosing a person is higher 25$, than the cost of a negative result;
	if hiv{t}=1 and tested{t}=1 and registd{t-1} ne 1 and prep_falseneg ne 1 then do;	*V*hiv(t)=1 is valid for everybody;
		unisens=uniform(0);		
		if t ge 3 and unisens lt sens_vct then do; 
			registd{t}=1; date1pos=caldate{t};
			visit{t}=1; lost{t}=0; cd4diag=c{t-1}; 
			if pop_wide_tld_prep ne 1 then onart{t}=0;
			*costing of HIV-positive;
			if (adc{t-1}=1 or (tb{t-2}=0 and tb{t-1}=1) or who3_event{t-1}=1) and unitest<rate_test then cost_test=cost_test_a;
			if cost_test=0 then do;
				if com_test ne 1 then cost_test= cost_test_b;
				if com_test =  1 then cost_test= cost_test_d;
			end;

			* some lost straight after diagnosis (unless already on tld);
			d=uniform(0);  * AP 22-7-19   ;
			if      adc{t-1} ne 1 and who3_event{t-1} ne 1 and tb{t-1} ne 1 and tb{t-2} ne 1 and onart{t-1} ne 1 and pop_wide_tld_prep ne 1 then do;
					if d < eff_prob_loss_at_diag      then do; visit{t}=0; lost{t}=1; end;
					if higher_newp_less_engagement = 1 and t ge 2 and newp{t-1} > 1 then do; 
					if d < eff_prob_loss_at_diag*1.5      then do; visit{t}=0; lost{t}=1; end; * mar19;
					end;
			end;
			if (adc{t-1} = 1 or tb{t-1}=1) and d < prob_lossdiag_adctb then do; visit{t}=0; lost{t}=1; end;
	    	if  who3_event{t-1} = 1        and d < prob_lossdiag_who3e then do; visit{t}=0; lost{t}=1; end;
		end;
		if unisens ge sens_vct then do; 
			if cost_test=0 then cost_test= cost_test_c;
		end;
	end;


* AP 22-7-19;
* in pop_wide_tld prep use in person with hiv is set to zero when a person becomes diagnoded with hiv; 
* note that effect of art is determined by adh{t} when on prep and when diagnosed and so onart, so I think this should be working ok;
if registd{t}=1 and registd{t-1}=0 and onart{t}=1 and pop_wide_tld_prep=1 then do; pop_wide_tld_prep=0; prep   =0;  end;


* AP 21-7-19; * dont stop if have been taking tld prep ;
	if (infected_prep=1 or (hiv&j=1 and prep  =1)) and registd{t}=1 and registd{t-1}=0 and pop_wide_tld ne 1 then do; 
		prep   =0; o_3tc=0; o_ten=0; tss_ten   =0;tss_3tc   =0; 
	end;


* Loss to follow-up while off ART;
	if t ge 2 and onart{t}=0 and lost{t-1}=0 then do;
		e=uniform(0);
		if 0.8 <= adhav       and e < eff_rate_lost     then do;lost{t}=1;visit{t}=0; end;
		if 0.5 <= adhav < 0.8 and e < eff_rate_lost*1.5 then do;lost{t}=1;visit{t}=0; end;
		if        adhav < 0.5 and e < eff_rate_lost*2   then do;lost{t}=1;visit{t}=0; end;
	end;

* Returning to clinic after loss to follow-up ;

	e_rate_return = eff_rate_return;	
	if higher_newp_less_engagement = 1 and t ge 2 and newp{t-1} > 1 then e_rate_return = eff_rate_return / 1.5;

	s=uniform(0);
	if adhav >= 0.8 then do;
		if t ge 2 and lost{t-1}=1 and registd{t-1}=1 and
		((adc{t-1}=1 and s < prob_return_adc) or s < e_rate_return) then do;return_{t}=1;lost{t}=0;visit{t}=1;end;
	end;
	if 0.5 <= adhav < 0.8 then do;
		if t ge 2 and lost{t-1}=1 and registd{t-1}=1 and
		((adc{t-1}=1 and s < prob_return_adc) or s < e_rate_return/2) then do;return_{t}=1;lost{t}=0;visit{t}=1;end;
	end;
	if adhav < 0.5 then do;
		if t ge 2 and lost{t-1}=1 and registd{t-1}=1 and
		((adc{t-1}=1 and s < prob_return_adc) or s < e_rate_return/3) then do;return_{t}=1;lost{t}=0;visit{t}=1;end;
	end;


* pregnancy leads to re-engagement once option b+ implemented; 
	if registd{t}=1 and (pregnant=1 or . < caldate{t} - dt_lastbirth <= 1) and art_initiation_strategy in (3,9,10) then do;
		lost{t}=0;visit{t}=1;end;

* shift to x4 virus being present - depends on viral load;
	if t ge 2 then do;
		pr_x4_shift=(10**v{t-1})*0.0000004; s=uniform(0); if s < pr_x4_shift then do; x4v{t}=1; date_x4=caldate{t};end;
	end;


* viral load changes from t-1 to t, if ART-naive at time t-1;

	if t ge 2 and prep    ne 1 then do;
		if naive{t}=1 or (naive{t-1}=1 and tcur{t}=0) or (toffart{t} ge 2) then do;
			vc{t-1}=(gx*0.02275 + (0.05 * normal(0)))+ ((age{t-1}-35)*0.00075);
			v{t} = v{t-1}+ vc{t-1} ;
			if v{t} gt 6.5 then v{t}=6.5;
		end;
	end;


* CD4 changes from t-1 to t, if ART-naive at time t-1;
	if t ge 3 and prep    ne 1 then do;
		if naive{t}=1 or (naive{t-1}=1 and tcur{t}=0) or (toffart{t} ge 4 and 0 <= c{t-1}-cmin{t-1} < 300) or (toffart{t} ge 1 
		and (resumec{t-1}=1 or resumec{t-2}=1)) then do;
* resumec indicates that cd4 has fallen to cmin since interruption (before toffart=4) and so usual cd4 changes start;


			if v{t-1} < 3 then ccsqr{t-1}=+0.000*fx+(sd_cd4*normal(0));
			if 3 <= v{t-1} < 3.5 then ccsqr{t-1}=-0.022*fx+(sd_cd4*normal(0));
			if 3.5 <= v{t-1} < 4 then ccsqr{t-1}=-0.085*fx+(sd_cd4*normal(0));
			if 4 <= v{t-1} < 4.5 then ccsqr{t-1}=-0.40*fx+(sd_cd4*normal(0));
			if 4.5 <= v{t-1} < 5 then ccsqr{t-1}=-0.40*fx+(sd_cd4*normal(0));
			if 5 <= v{t-1} < 5.5 then ccsqr{t-1}=-0.85*fx+(sd_cd4*normal(0));
			if 5.5 <= v{t-1} < 6 then ccsqr{t-1}=-1.30*fx+(sd_cd4*normal(0));
			if 6.0 <= v{t-1} then ccsqr{t-1}=-1.75*fx+(sd_cd4*normal(0));
			* these values higher than european model because effect of black race;

			if x4v{t-1}=1 then ccsqr{t-1}=ccsqr{t-1}-0.25;

			* if t le 2 then ccsqr{t-1}=0;
			if c{t-1} < 0 then c{t-1}=0;
			csqr{t} = sqrt(c{t-1}) + ccsqr{t-1}; if csqr{t} lt 0 then csqr{t}=0;
			c{t}=csqr{t}**2;  cc{t-1}=c{t}-c{t-1};
		end;
	end;


res_test=.;


* WHETHER CD4 WAS MEASURED - NAIVE PATIENTS;
	w=uniform(0);
	if t ge 2 and  hiv_monitoring_strategy=2
	and naive{t}=1 and visit{t}=1 and cm_tm1 =. and w < prob_cd4_meas_done then do;
		cm   =(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc=1;
		if date_staging=. then do; date_staging = caldate{t}; cd4_staging = cm   ; who4_staging = who4_{t-1}; end;
		if ((art_intro_date             le caldate{t} lt 2010 and . lt cm    le 200) or
      	    (                              caldate{t} ge 2010 and . lt cm    le 350)) or 
			who4_{t-1}=1 then elig_mcd4_=1;		
	end;



* INITIATION OF ART ;


	if t ge 3 and  time0 = . then do;

		u=uniform(0);
		
* hiv monitoring strategy
  1 - strategy for monitoring HIV positive people naive to ART 1: presence of tb or who4
  2 - strategy for monitoring HIV positive people naive to ART 2: cd4 6 monthly + presence of tb or who4;

* art initiation strategy 1: all with who4
  art initiation strategy 2: all with tb or who4
  art initiation strategy 3: all with hiv diagnosed
  art initiation strategy 4: cd4 < 200 or who4
  art initiation strategy 5: cd4 < 200 or tb or who4
  art initiation strategy 6: cd4 < 350 or who4
  art initiation strategy 9: cd4<350 + ART immediately to pregnant women
  art initiation strategy 10: cd4<500 + ART immediately to pregnant women
;

		if art_initiation_strategy=1 then do; 
			if t ge 3 and visit{t}=1 and naive{t-1}=1 and art_intro_date <= caldate{t} and who4_{t-1}=1 then do;
				if (who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then u=u/2;
                if u < eff_pr_art_init then time0=caldate{t};
				if dt_first_elig=. then dt_first_elig=caldate{t};end;
		end;

		if art_initiation_strategy=2 then do;
			if t ge 3 and visit{t}=1 and naive{t-1}=1 and art_intro_date <= caldate{t} and (who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then do; 
				if (who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then u=u/2;
				if u < eff_pr_art_init then time0=caldate{t};
				if dt_first_elig=. then dt_first_elig=caldate{t};end;
		end;	

		if art_initiation_strategy=3 then do;
			if t ge 3 and visit{t}=1 and naive{t-1}=1 and art_intro_date <= caldate{t} then do;
				if (who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then u=u/2;
				if pregnant =1 then u=u/10; * jul18 ;
				if u < eff_pr_art_init then time0=caldate{t};
				if dt_first_elig=. then dt_first_elig=caldate{t};end;
		end;

		if hiv_monitoring_strategy=2 and art_initiation_strategy=4 then do;
			if t ge 4 and visit{t}=1 and naive{t-1}=1 and art_intro_date <= caldate{t} and
			(. < cm    < 200 or . < cm_tm1  < 200 or . < cm_tm2  < 200 or who4_{t-1}=1  or tb{t-1}=1 or tb{t-2}=1) then do;
				if (who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then u=u/2;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				if u < eff_pr_art_init then time0=caldate{t};
			end;
		end;

		if hiv_monitoring_strategy=2 and art_initiation_strategy=5 then do;
			if t ge 4 and visit{t}=1 and naive{t-1}=1 and art_intro_date <= caldate{t} and
			(. < cm    < 200 or . < cm_tm1  < 200 or . < cm_tm2  < 200
			or who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then do;
				if (who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then u=u/2;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				if u < eff_pr_art_init then time0=caldate{t};
			end;
		end;
		
		if hiv_monitoring_strategy=2 and art_initiation_strategy in (6 9) then do;
			if t ge 4 and visit{t}=1 and naive{t-1}=1 and art_intro_date <= caldate{t} and
			(. < cm    < 350 or . < cm_tm1  < 350 or . < cm_tm2  < 350 or who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then do;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				time0=caldate{t};  art_init_bplus_=1;
			end;
		end;

		if art_initiation_strategy in (3, 9, 10) then do;  * pregnancy leads to re-engagement once option b+ implemented;
			if (pregnant=1 or . < caldate{t} - dt_lastbirth <= 1) and visit{t}=1 and naive{t-1}=1 and art_intro_date <= caldate{t} then do;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				time0=caldate{t};  art_init_bplus_=1;
			end;
		end;

		if hiv_monitoring_strategy=2 and art_initiation_strategy = 10 then do;  
			if t ge 4 and visit{t}=1 and naive{t-1}=1 and art_intro_date <= caldate{t}  and
			(. < cm    < 500 or . < cm_tm1  < 500 or . < cm_tm2  < 500 or who4_{t-1}=1 or tb{t-1}=1 or tb{t-2}=1) then do;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				time0=caldate{t}; art_init_cd4l500_=1; 
			end;
		end;


		* AP 19-7-19;

		* USE OF NVP FOR MTCT & HENCE DEVELOPMENT OF NVP RESISTANCE; * revised apr 2019 - because women have high rates of viral suppression (malawi)
		and diffcult to reconcile with these relatively high rates of nnrti resistance from nevirapine for pmtct;

		if gender=2 and caldate{t} gt date_pmtct then do;
			u=uniform(0); uu=uniform(0); 
			if anc=1 and naive{t}=1 and uu < prob_pmtct then do;
				if time0=. then do;
					if caldate{t} le 2010.5 then do;
						on_sd_nvp=1; 
						if u < prob_nnresmaj_sd_nvp then do; c_rt103m=1; nn_res_pmtct=1; e_rt103m=1; end;
					end;
					else if 2010.5 <= caldate{t} < 2012.5 then do;   
						on_dual_nvp=1; 
						if u < prob_nnresmaj_dual_nvp then do; c_rt103m=1; nn_res_pmtct=1; e_rt103m=1; end;
					end;
				end;
			end;
		end;


	end;


	if t ge 4 and caldate{t}=time0 then do; 
		yrart=caldate{t};cd4art=c{t-1};vlart=v{t-1};
		if cm_tm2  ne . then measured_cd4art=cm_tm2 ;
		if cm_tm1  ne . then measured_cd4art=cm_tm1 ;
		if cm    ne . then measured_cd4art=cm;
	end;



* the values of c and v below will be overwritten below if toffart{t} changes back to 0;


* viral load and CD4 changes during ART interruption
- viral load returns to vmax in 3 months and adopts natural history changes thereafter
- CD4 rate of decline returns to natural history changes after three 3 month periods
- cc{t-1} is change from t-1 to t;
	if t ge 4 and toffart{t}=1 then do;
    	 v{t}=vmax{t-1};
     * assume rate cd4 fall depends on current viral load;
     	 if        v{t} >= 5 then cc{t-1}=-200+10*normal(0);
	     if 4.5 <= v{t} < 5 then cc{t-1}=-160+10*normal(0);
	     if        v{t} < 4.5 then cc{t-1}=-120+10*normal(0);
	     z=c{t-1}+cc{t-1};
	     c{t}=max(cmin{t-1},z); if c{t} lt 0 then c{t}=0; if c{t}=cmin{t-1} then resumec{t}=1; 
	end;
	if t ge 4 and toffart{t}=2 and resumec{t-1} ne 1 then do;
	     * assume rate cd4 fall depends on current viral load;
    	 if v{t} >= 5 then cc{t-1}=-100+10*normal(0);
	     if 4.5 <= v{t} < 5 then cc{t-1}=-90+10*normal(0);
    	 if v{t} < 4.5 then cc{t-1}=-80+10*normal(0);
	     z=c{t-1}+cc{t-1};
	     c{t}=max(cmin{t-2},z); if c{t} lt 0 then c{t}=0; if c{t}=cmin{t-2} then resumec{t}=1;
	end;
	if toffart{t}=3 and t ge 4 and (resumec{t-1} ne 1 and resumec{t-2} ne 1) then do;
	     * assume rate cd4 fall depends on current viral load;
    	 if v{t} >= 5 then cc{t-1}=-80+10*normal(0);
	     if 4.5 <= v{t} < 5 then cc{t-1}=-70+10*normal(0);
	     if v{t} < 4.5 then cc{t-1}=-60+10*normal(0);
	     z=c{t-1}+cc{t-1};
	     c{t}=max(cmin{t-3},z); if c{t} lt 0 then c{t}=0; if c{t}=cmin{t-3} then resumec{t}=1;
	end;
	c_200_gt_nad=0;if t ge 3 and toffart{t} ge 1 and c{t-1}-cmin{t-1} > 300 then do;
    	 * assume rate cd4 fall depends on current viral load;
	     c_200_gt_nad=1;
    	 if v{t} >= 5 then cc{t-1}=-200+10*normal(0);
	     if 4.5 <= v{t} < 5 then cc{t-1}=-160+10*normal(0);
	     if v{t} < 4.5 then cc{t-1}=-120+10*normal(0);
	     z=c{t-1}+cc{t-1};
	     c{t}=max(cmin{t-2},z); if c{t} lt 0 then c{t}=0;
	end;
* after this point assume cd4 fall as in natural history;





* INTERRUPTION OF ART  (AND LOSS TO FOLLOW-UP);

	interrupt{t}=0;

* interruption due to "choice";
	if stop_tox    ne 1 then do; 

		if t ge 2 and visit{t}=1 and onart{t-1}=1 then do;
			if  adh{t-1} >= 0.8  then do;
			    if c_tox{t-1}=0 then prointer=eff_rate_int_choice ;
			    if c_tox{t-1}=1 then prointer=rr_int_tox*eff_rate_int_choice; 
			end;
			if 0.5 <= adh{t-1} < 0.8 then do;
			    if c_tox{t-1}=0 then prointer=1.5*incr_rate_int_low_adh*eff_rate_int_choice;
			    if c_tox{t-1}=1 then prointer=rr_int_tox*1.5*incr_rate_int_low_adh*eff_rate_int_choice;
			end;
			if adh{t-1} < 0.5 then do;
			    if c_tox{t-1}=0 then prointer=2*incr_rate_int_low_adh*eff_rate_int_choice;
			    if c_tox{t-1}=1 then prointer=rr_int_tox*2*incr_rate_int_low_adh*eff_rate_int_choice;
			end;


	   if pregnant=1 then prointer = prointer/100; * jul18;
		* reduction in prob interruption after 1 year continuous art - mar16;
		if tcur{t} ge 4 then prointer=prointer/2;
		*The rate of interruption also reduces with time on ART, decreasing after 2 years.  
		Evidence suggests that rates of discontinuation does decrease over time ((Kranzer 2010 Tassie 2010 Wandeler 2012) 
		although the point at which the risk lowers might be somewhat earlier than 2 years;  
		if higher_newp_less_engagement = 1 and t ge 2 and newp{t-1} > 1 then prointer = prointer * 1.5; * mar19;  
		r=uniform(0);if r < prointer then do; 
				interrupt_choice{t}=1; 
				int_clinic_not_aw=0; f=uniform(0); if f < clinic_not_aw_int_frac then int_clinic_not_aw=1;
			end;
		end;
	end;


* interruption due to interruption of drug supply ;

	if visit{t}=1 and onart{t-1}=1  and interrupt_choice{t} ne 1
	and stop_tox ne 1 then do;

		prointer_supply= prob_supply_interrupted  ;
		s=uniform(0); if s < prointer_supply then interrupt_supply{t}=1;

	end;


* interruption of prep before diagnosis;
if t ge 2 and prep_tm1 =1 and prep   =0 and registd{t} ne 1 and onart{t}=1 then interrupt{t}=1;	



	if t ge 2 and (interrupt_choice{t}=1 or interrupt_supply{t}=1 or stop_tox   =1 or (interrupt{t}=1 and prep_tm1 =1 and prep=0))
	and restart{t-1}=0 and visit{t}=1 and onart{t-1}=1 then do; 
		artline{t}=.;onart{t}=0;toffart{t}=0;interrupt{t}=1;date_last_interrupt=caldate{t};

		if o_zdv_tm1=1 then do;  mr_zdv=1; tss_zdv=0; end;
		if o_3tc_tm1=1 then do;  mr_3tc=1;tss_3tc=0; end;
		if o_ten_tm1=1 then do;  mr_ten=1;tss_ten=0; end;
		if o_nev_tm1=1 then do;  mr_nev=1;tss_nev=0; end;
		if o_dar_tm1=1 then do;  mr_dar=1;tss_dar=0; end;
		if o_efa_tm1=1 then do;  mr_efa=1;tss_efa=0; end;
		if o_lpr_tm1=1 then do;  mr_lpr=1;tss_lpr=0; end;
		if o_taz_tm1=1 then do;  mr_taz=1;tss_taz=0; end;
		if o_dol_tm1=1 then do;  mr_dol=1;tss_dol=0; end;
		o_zdv=0; o_3tc=0; o_efa=0; o_dar=0; o_ten=0;
		o_lpr=0; o_taz=0; o_dol=0; o_nev=0;
		v_inter=v{t-1}; tcur_inter=tcur{t};
	end;

	if prep_tm1 =1 and prep=0 then toffart{t}=0;

	if t ge 2 and interrupt{t-1}=1 then tcur{t}=.;

	* people leaving clinic as well as interrupting (if interruption due to choice);
	if t ge 2 and interrupt{t}=1 and (interrupt_choice{t}=1) then do;
		f=uniform(0);
	
		if f < eff_prob_lost_art     and        adhav >= 0.8 then do;lost{t}=1; visit{t}=0; end;
		if f < eff_prob_lost_art*1.5 and 0.5 <= adhav <  0.8 then do;lost{t}=1; visit{t}=0; end;
		if f < eff_prob_lost_art*2   and        adhav <  0.5 then do;lost{t}=1; visit{t}=0; end;
	end;

	
if int_clinic_not_aw=1 and lost{t} = 1 then int_clinic_not_aw=0;
if int_clinic_not_aw=1 and (lost{t} = 1 or death ne .) then int_clinic_not_aw=0;

if interrupt{t}=1 then do; 
	no_interruptions=no_interruptions+1; 
	if date_1st_int=. then date_1st_int=caldate{t}; 
end;


* RE-INITIATION OF THERAPY AFTER INTERRUPTING -  restart = 1 means restart at time t;
	e_rate_restart=eff_rate_restart;
	restart{t}=0;d=uniform(0);
	if t ge 3 and interrupt_choice{t} = 1 and lost{t}=0 and visit{t}=1 and toffart{t-1} gt 0 and onart{t-1}=0 and tcur{t-1}=. and interrupt{t}=0 then do;
	if v_alert_6m_incr_adh = 1 and . < caldate{t}-date_v_alert <= 0.5  and date_v_alert > date_last_interrupt > . then e_rate_restart=e_rate_restart*10;

	if v_alert_perm_incr_adh = 1 and caldate{t} >= date_v_alert > .    and date_v_alert > date_last_interrupt > .  then e_rate_restart=e_rate_restart*10;

		if who3_event{t-1}=1 then e_rate_restart = e_rate_restart*3;
		if adc{t-1}=1 then e_rate_restart = e_rate_restart*5;
		if pregnant=1 then e_rate_restart = e_rate_restart*5; * jul18;
		if return_{t}=1 then e_rate_restart = 1;

		if d < e_rate_restart then do;restart{t}=1; onart{t}=1;tcur{t}=0; end;
		if return_{t}=1 and restart{t}=1 then do; 
			if date_first_art_exp_initiation=. then date_first_art_exp_initiation=caldate{t};  
			date_last_return_restart=caldate{t}; * oct16;
		end;

	end;

	if t ge 3 and interrupt_supply{t}=1 and visit{t}=1 and toffart{t-1} gt 0 and onart{t-1}=0
	and tcur{t-1}=. and interrupt{t}=0 and d < prob_supply_resumed then do;restart{t}=1; onart{t}=1;tcur{t}=0;end;


* initiation of a new regimen in a person who stopped d4t/3tc/efa due to tox when drug_availability=d4t/3tc/efa
  and now drug_availability=zdv/3tc/efa/lpr;
     if visit{t}=1 and stop_tox   =1 and toffart{t-1} gt 0 and onart{t-1}=0 and tcur{t-1}=. and interrupt{t}=0
	 then do; stop_tox   =0;restart{t}=1; onart{t}=1;end;



* RE-INITIATION OF HAART AFTER INTERRUPTION;
* This is re-initiating when line of therapy has been switched to the next line, according to line of failure
  (ie line of therapy is one higher than lines failed, so they just restart the same regimen;

	if t ge 2 and restart{t}=1 then do;
		tcur{t}=0;onart{t}=1;
		o_zdv=mr_zdv_tm1;
		o_3tc=mr_3tc_tm1;
		o_ten=mr_ten_tm1;
		o_nev=mr_nev_tm1;
		o_dar=mr_dar_tm1;
		o_efa=mr_efa_tm1;
		o_lpr=mr_lpr_tm1;
		o_taz=mr_taz_tm1;
		o_dol=mr_dol_tm1;

		* if return_{t}=1 then do; * jan18 - think this should apply when restarting even if return ne 1;

			if reg_option     in (104 105 106 116 117 118) then do; if (o_efa=1 or o_nev=1) and t_dol ne 1 then do;o_efa=0; o_nev=0; o_dol=1; end; end;
			if reg_option     in (104 105 118) then do; if (o_taz=1 or o_lpr=1) and t_dol ne 1 then do;o_taz=0; o_lpr=0; o_dol=1; end; end;
			if reg_option     in (106) then do; if (o_taz=1 or o_lpr=1) and t_dol ne 1 and t_zdv ne 1 then do;o_taz=0; o_lpr=0; o_dol=1; o_ten=0;o_zdv=1; end; end;
			if reg_option     in (104 105 118) then do; if t_ten ne 1 then do;o_ten=1; o_zdv=0; end; end;
	
			if restart_res_test=1 then do;
			res_test=1;
    		if  (c_rt103m=1 or c_rt181m=1 or c_rt190m=1) and (o_efa=1 or o_nev=1) then do; o_ten=1; o_3tc=1; o_dol=1;o_efa=0 ; o_nev=0; end;
    		end;

		* end;

		if line1=1 and line2=0 then artline{t}=1;
		if line2=1 then artline{t}=2;
		if line3=1 then artline{t}=3;
	end;


* INITIATION OF FIRST LINE THERAPY ;

if yrart=caldate{t} and onart{t} ne 1 and  art_intro_date <= yrart then do;
tcur{t}=0;naive{t}=0;artline{t}=1;onart{t}=1;linefail{t}=0;line1=1;vfail1_{t}=0;
o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;

    if caldate{t} < 2010.5 then do; o_zdv=1; o_3tc=1; o_efa=1; end;
    if 2010.5 <= caldate{t} and reg_option < 100 then do; o_ten=1; o_3tc=1; o_efa=1; end; 
    if reg_option in ( 101 108 109 110 111 112 114) then do; o_ten=1; o_3tc=1; o_efa=1; end; 

if reg_option in (102 103 104 105 106 118 119) and (ever_dual_nvp =1 or ever_sd_nvp = 1) then flr=2;
if reg_option in (115) and (ever_dual_nvp =1 or ever_sd_nvp = 1) then flr=1; * 115 is a place holder - this does not apply for any current policy option;

    if flr=1 then do; o_ten=1; o_3tc=1; o_taz=1; o_zdv=0; o_dol=0; end;
    if flr=2 then do; o_ten=1; o_3tc=1; o_dol=1; o_zdv=0; o_taz=0; o_efa=0; end;

    if base_res_test=1 then do;  res_test=1;
    if  (c_rt103m=0 and c_rt181m=0 and c_rt190m=0) then do;  o_ten=1; o_3tc=1; o_efa=1; end;
    if  (c_rt103m=1 or c_rt181m=1 or c_rt190m=1) then do;    o_ten=1; o_3tc=1; o_dol=1;o_efa=0; end;
    end;

end;

	if prep_tm1 =0 and prep=1 then tcur{t}=0;


* jan17 - so can change value of pr switch line and still record original value of this parameter;
e_pr_switch_line = eff_pr_switch_line;
	
if reg_option in (105 106) and o_dol=1 then e_pr_switch_line=0; * effective pr_switch_line;
if reg_option in (105 106) and o_dol=1 and linefail{t-1}=1 and line2=0 and start_line2=1 then start_line2=.; * mar18;

		if t ge 2  and interrupt{t}=0 and linefail{t-1}=1 and line2=0 and (artline{t-1}=1) and visit{t}=1 and reg_option ne 105 and reg_option ne 106  then do;
			q=uniform(0); if q < e_pr_switch_line then do; start_line2=1; date_start_line2=caldate{t}; cd4_start_line2 = cm   ; end;
		end;


* INITIATION OF 2ND LINE HAART - AFTER HAVING INTERRUPTED SINCE FAILING FIRST LINE;

	if t ge 2 and start_line2=1 then do; 
		artline{t}=2; onart{t}=1; tcur{t}=0;date_line2=caldate{t}; line2=1;choose_line2=1;adhav=adhav+altered_adh_sec_line; 
		if adhav gt 1 then adhav=1;
	end;
* increased adh second line;



* WHETHER TO INITIATE 3rd LINE HAART (FOR PEOPLE WHO FAILED second LINE AND STILL ON second LINE);
	if  third_line=1 then do;
		if t ge 2  and interrupt{t}=0 and linefail{t-1}=2 and line3=0 and (artline{t-1}=2)
		and visit{t}=1 then do;
			q=uniform(0); if q < e_pr_switch_line then start_line3=1;
		end;
	end;


	* restart_pi_after_dtg_fail   -  may18;
	if reg_option in (103 104 110 111 114 116 117 118 119) and f_dol=1 and o_dol=1 and o_taz ne 1 and o_lpr ne 1 and (p_taz=1 or p_lpr=1) then do;
		if t ge 2  and interrupt{t}=0 and visit{t}=1 then do;
			q=uniform(0); if q < e_pr_switch_line then restart_pi_after_dtg_fail=1;
		end;
	end;




* INITIATION OF 3rd LINE HAART - AFTER HAVING INTERRUPTED SINCE FAILING second line;

	if third_line=1 then do;

		if t ge 2 and linefail{t-1}=2 and line3=0 and onart{t-1}=0 and restart{t}=1 and visit{t}=1 then do;
			start_line3=1; 
		end;

	end;

	if reg_option in (9999) and linefail{t-1}=2 and (f_dol=1 and f_3tc=1 and f_zdv=1) then do; * use 999 to retain code even though no option 9999;

		if t ge 2 and linefail{t-1}=2 and onart{t-1}=0 and restart{t}=1 and visit{t}=1 then do;
			restart_pi_after_dtg_fail=1; 
		end;

	end;

* AP 20-7-19;

*mar2019-this as in sens analysis s15;
* s15; if reg_option in (104 118) and linefail{t-1}=2 and (f_dol=1 and f_3tc=1 and f_ten=1) then do;

		if t ge 2 and linefail{t-1}=2 and onart{t-1}=0 and restart{t}=1 and visit{t}=1 then do;
			restart_pi_after_dtg_fail=1; 
		end;

	end;



* s15;	if reg_option in (103 104 110 111 114 116 117 118 119) and linefail{t-1}=2 and (f_dol=1) then do;  * mar19 - not sure why above need f_3tc and f_ten =1 to
restart pi so have added on 104 her, along with 111); 

		if t ge 2 and linefail{t-1}=2 and onart{t-1}=0 and restart{t}=1 and visit{t}=1 then do;
			restart_pi_after_dtg_fail=1; 
		end;

	end;


	if t ge 2 and start_line3=1 then do; 
		artline{t}=3; onart{t}=1; tcur{t}=0;date_line3=caldate{t}; line3=1;choose_line3=1;adhav=adhav+altered_adh_sec_line; 
		if adhav gt 1 then adhav=1;
	end;
* increased adh second and third line;


* set date_last_who3 to missing when start or restart art;
	if tcur{t}=0 then do; date_last_who3=.;first_who3_line2=.; end;


* set int_clinic_not_aw=. if on art;
if onart{t}=1 then int_clinic_not_aw=.;



if t ge 4 then do;

no_recent_vm_gt1000=0; if onart{t}=1 and artline{t}=1 and (sv=1 or (vm_tm3  < 3 and vm_tm2  < 3 and vm_tm1  < 3 and vm    < 3)) then no_recent_vm_gt1000=1;
recent_vm_gt1000=0; if onart{t}=1  and artline{t}=1 and (vm_tm1  > 3 or vm > 3) then recent_vm_gt1000=1;

* efa;

	if  interrupt{t}=0 and o_efa_tm1=1 and transition_from_nnrti_done ne 1 and
		( 
		reg_option in (104 105 118) or 
		(reg_option = 106 and sv ne 1) or
		(reg_option in (102 103 106 119) and sv=1) or
		(reg_option in (116 117) and ( sv=1 or (vm_tm3  < 3 and vm_tm2  < 3 and vm_tm1  < 3 and vm    < 3))) or
		(reg_option = 106 and sv ne 1) or 
		(reg_option in (116 117) and  (vm_tm1  > 3 or vm > 3))
		)
	then do;
		tss_efa   =0; o_dol=1;o_efa=0; 
		if (reg_option = 106 and sv ne 1) or (reg_option in (116 117) and  (vm_tm1  > 3 or vm > 3)) then do; tss_ten=0; o_ten=0;o_zdv=1;end;
		transition_from_nnrti_done = 1; date_transition_from_nnrti=caldate{t};
	end;
	
* nev;

	if  interrupt{t}=0 and o_nev_tm1=1 and transition_from_nnrti_done ne 1 and
		( 
		reg_option in (104 105 118) or 
		(reg_option = 106 and sv ne 1) or
		(reg_option in (102 103 106 119) and sv=1) or
		(reg_option in (116 117) and ( sv=1 or (vm_tm3  < 3 and vm_tm2  < 3 and vm_tm1  < 3 and vm    < 3))) or
		(reg_option = 106 and sv ne 1) or 
		(reg_option in (116 117) and  (vm_tm1  > 3 or vm > 3))
		)
	then do;
		tss_nev   =0; o_dol=1;o_nev=0; 
		if (reg_option = 106 and sv ne 1) or (reg_option in (116 117) and  (vm_tm1  > 3 or vm > 3)) then do; tss_ten=0; o_ten=0;o_zdv=1;end;
		transition_from_nnrti_done = 1; date_transition_from_nnrti=caldate{t};
	end;
	

* zdv subsituted by ten after 2010.5;
	if interrupt{t}=0 and o_zdv_tm1=1 and 2010.5 <= caldate{t} < 2012.5 and linefail{t-1} = 0 and artline{t}=1 then do;
		tss_zdv=0; o_ten=1;o_zdv=0; 
	end;
end;





* switching from taz / lpr 2nd line to dolutegravir 2nd line; 

* AP 20-7-19; 

if artline{t}=2 and (o_taz=1 or o_lpr=1) and transition_from_pi_done ne 1 and ( 
reg_option in (104 105 106 111 116 117 118)  or ( reg_option in (103 119) and sv = 1) 
) then do;
* taz;  
	if t ge 2  and interrupt{t}=0 and f_dol ne 1 and o_taz=1 then do; tss_taz   =0; o_dol=1;o_taz=0; 
	transition_from_pi_done = 1; date_transition_from_pi=caldate{t};end;
* lpr;
	if t ge 2  and interrupt{t}=0 and f_dol ne 1 and o_lpr=1 then do;	tss_lpr   =0; o_dol=1;o_lpr=0; 
	transition_from_pi_done = 1; date_transition_from_pi=caldate{t};end;
* ten;
	if reg_option in (104 105 118)  then do;
	if t ge 2  and interrupt{t}=0 and o_zdv=1 and t_ten=0 then do;	tss_zdv=0; o_ten=1; o_zdv=0; end;
	end;
* zdv;
	if reg_option in (106 111 116 117) then do;
	if t ge 2  and interrupt{t}=0 and o_ten=1 and t_zdv=0 then do;	tss_ten   =0; o_zdv=1; o_ten=0; end;
	end;
	
end;




* monitoring strategy 1500 is only for people on dol who have not failed previously;

if caldate{t} ge 2020.5 and art_monitoring_strategy=1500 and (o_dol ne 1 or linefail{t} ge 1) then art_monitoring_strategy=150; 



* SWITCHING OF DRUGS DUE TO TOXICITY;   * for reg18 decided to remove all switching due to toxicity and programmatically unlikely to often happen
- can out back in for sensitivity analysis;

if prep=0 and switch_for_tox = 1 then do;


* efa;
	s=uniform(0); r=uniform(0); if t ge 2  and interrupt{t}=0 and o_efa_tm1=1 and
	((c_cns_tm1=1 and s < 0.02) or (c_ras_tm1=1 and r < 0.05 ))
	then do;
		sw_toxicity{t}=1;
		if t_nev_tm1=0  and o_nev ne 1  then do; t_efa=1;tss_efa   =0; o_nev=1;o_efa=0; goto x1; end;
		if caldate{t} ge 2014 and t_taz_tm1=0  and o_taz ne 1  then do; t_efa=1;tss_efa   =0; o_taz=1;o_efa=0; goto x1; end;
		if t_lpr_tm1=0  and o_lpr ne 1  then do; t_efa=1;tss_efa   =0; o_lpr=1;o_efa=0; goto x1; end;
		t_efa=1;tss_efa   =0;o_efa=0; * if cant switch then just stop nvp;
	x1: end;
	

* nev;
		s=uniform(0); r=uniform(0); if t ge 2  and interrupt{t}=0 and o_nev_tm1=1 and
		((c_hep_tm1=1 and s < 0.10) or (c_ras_tm1=1 and r < 0.15 ))
		then do;
			sw_toxicity{t}=1;
			if t_efa_tm1=0  and o_efa ne 1  then do; t_nev=1;tss_nev   =0; o_efa=1;o_nev=0; goto x7; end;
			if caldate{t} ge 2014 and t_taz_tm1=0  and o_taz ne 1  then do; t_nev=1;tss_nev   =0; o_efa=1;o_nev=0; goto x7; end;
			t_nev=1;tss_nev   =0;o_nev=0; * if cant switch then just stop nvp;
	x7: end;


* zdv;
            s=uniform(0); d=uniform(0); e=uniform(0); if t ge 2  and interrupt{t}=0 and o_zdv_tm1=1 and
            ((c_nau_tm1=1 and s lt 0.08) or (c_head_tm1=1 and d < 0.02) or (c_lip_tm1=1 and e < 0.01)
            or (c_ane_tm1=1 and e < 0.05) or c_lac_tm1=1 )   then do;
                  sw_toxicity{t}=1;
                  if t_3tc_tm1=0  and o_3tc ne 1                   then do; t_zdv=1;tss_zdv   =0; o_3tc=1;o_zdv=0; goto x3; end;
                  if caldate{t} ge 2010.5 and t_ten_tm1=0  and o_ten ne 1 then do; t_zdv=1;tss_zdv   =0; o_ten=1;o_zdv=0; goto x3; end;
                  t_zdv=1;tss_zdv   =0;o_zdv=0;
            x3:end;

* ten;
            s=uniform(0); if t ge 2  and interrupt{t}=0 and o_ten_tm1=1 and (c_neph_tm1=1 and s lt 0.20) then do;
                  sw_toxicity{t}=1;
	              if t_zdv_tm1=0  and o_zdv ne 1 then do; t_ten=1;tss_ten   =0; o_zdv=1;o_ten=0; goto x6; end;
	              t_ten=1;tss_ten   =0;o_ten=0;
            x6:end;

* lpr;
		s=uniform(0); r=uniform(0); if t ge 2  and interrupt{t}=0 and o_lpr_tm1=1 and
		((c_nau_tm1=1 and s < 0.05 ) or (c_dia_tm1=1 and r < 0.05 )) then do; *note nau currently does not occur with lpr;
			sw_toxicity{t}=1;
			if caldate{t} ge 2014 and t_taz_tm1=0  and o_taz ne 1 then do; t_lpr=1;tss_lpr   =0; o_taz=1;o_lpr=0; goto x5; end;
			if t_nev_tm1=0  and o_nev ne 1 then do; t_lpr=1;tss_lpr   =0; o_nev=1;o_lpr=0; goto x5; end;
			t_lpr=1;tss_lpr   =0; o_lpr=0;
		x5:end;


* taz;
		s=uniform(0); r=uniform(0); if t ge 2  and interrupt{t}=0 and o_taz_tm1=1 and 
		((c_nau_tm1=1 and s < 0.05 ) or (c_dia_tm1=1 and r < 0.05 )) then do; *note nau currently does not occur with taz;
			sw_toxicity{t}=1;
			if t_lpr_tm1=0  and o_lpr ne 1 then do; t_taz=1;tss_taz   =0; o_lpr=1;o_taz=0; goto x8; end;
			if t_nev_tm1=0  and o_nev ne 1 then do; t_taz=1;tss_taz   =0; o_nev=1;o_taz=0; goto x8; end;
			t_taz=1;tss_taz   =0;o_taz=0; 
		x8: end;	


* dar - assume no new tox after previous pi;

* dol ;
	s=uniform(0);  if t ge 2  and interrupt{t}=0 and o_dol_tm1=1 and (c_cns_tm1=1 and s < 0.02) then do; 
		sw_toxicity{t}=1;
		if t_taz_tm1=0  and o_taz ne 1  then do; t_dol=1;tss_dol   =0; o_taz=1;o_dol=0; goto x9; end;
	x9: end;
 

	end;



	* CHOICE OF SECOND LINE REGIMEN;

start_line2_this_period=.;
	if choose_line2=1  then do;
		choose_line2=.; start_line2=.; start_line2_this_period=1;


	if art_intro_date <= caldate{t} < 2010.5 and (f_efa=1 or f_nev=1) then do;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if t_lpr=0 then o_lpr=1;
			if t_zdv=0 then do; o_zdv=1; goto vv66; end;
	end;

 	if caldate{t} >= 2010.5 and caldate{t} < 2014 and (f_efa=1 or f_nev=1) then do;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if f_lpr=0 and t_lpr=0 then o_lpr=1;
			if o_lpr=0 and f_nev=0 and t_nev=0 then o_nev=1;  if o_lpr=0 and f_nev=0 and t_nev=1 and t_efa=0 then o_efa=1;
			if t_ten=0 and f_ten=0 then do; o_ten=1; goto vv66; end;
			if (t_ten=1 or f_ten=1) and t_zdv=0  and f_zdv=0 then do; o_zdv=1; goto vv66; end;
	end;

 	if caldate{t} >= 2014 and caldate{t} < 2015 and (f_efa=1 or f_nev=1) then do;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if f_taz=0 and t_taz=0 then o_taz=1;
			if t_lpr=0 and t_taz=1 then o_lpr=1;
			if (o_lpr=0 and o_taz=0) and f_nev=0 and t_nev=0 then o_nev=1;  
			if (o_lpr=0 and o_taz=0) and f_nev=0 and t_nev=1 and t_efa=0 then o_efa=1;
			if t_ten=0 and f_ten=0 then do; o_ten=1; goto vv66; end;
			if (t_ten=1 or f_ten=1) and t_zdv=0  and f_zdv=0 then do; o_zdv=1; goto vv66; end;
	end;

* jun18;

* AP 20-7-19;

	if caldate{t} >= 2015 and (f_efa=1 or f_nev=1) and (caldate{t} < 2018.75 or reg_option in (101 102 107 108 109 112 113 115 ) ) 
	then do; * dec17; * note 100 is for msfm;
	* note if returing to former definition of policy 103 then need to add 103 in here;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if f_taz=0 and t_taz=0 then o_taz=1;
			if t_lpr=0 and t_taz=1 then o_lpr=1;
			if (o_lpr=0 and o_taz=0) and f_nev=0 and t_nev=0 then o_nev=1;  
			if (o_lpr=0 and o_taz=0) and f_nev=0 and t_nev=1 and t_efa=0 then o_efa=1;
			if t_ten=0 and f_ten=0 then do; o_ten=1; goto vv66; end;
			if (t_ten=1 or f_ten=1) and t_zdv=0  and f_zdv=0 then do; o_zdv=1; goto vv66; end;
	end;

	if caldate{t} >= 2015 and (f_efa=1 or f_nev=1)  and reg_option in (103 110 111 114 116 117 119) then do; * aug18;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if f_dol ne 1 then o_dol=1; if f_dol=1 then o_taz=1;
			o_zdv=1; goto vv66; 
	end;

 	if caldate{t} >= 2015 and (f_taz=1 or f_lpr=1) and reg_option in (107 ) then do;  
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if t_taz=0 then o_taz=1;  if t_taz=1 and t_lpr=0 then o_lpr=1;  
			* if t_lpr=1 and t_taz=1 and t_nev=0 then o_nev=1; 
			if t_ten=0 and f_ten=0 then do; o_ten=1; goto vv66; end;
			if (t_ten=1 or f_ten=1) and t_zdv=0 and f_zdv=0 then do; o_zdv=1; goto vv66; end;
	end;

 	if caldate{t} >= 2015 and f_dol=1 and reg_option in (102 103 104 113 115 116 117 118 119) then do;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_taz=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if f_taz=0 and t_taz=0 then o_taz=1;
			if o_taz=0 and (t_nev=0 and f_nev=0) then o_nev=1;
			if o_taz=0 and o_nev=0 and (f_efa=0 and t_efa=0) then o_efa=1;
			if t_ten=0 and f_ten=0 then do; o_ten=1; goto vv66; end;
			if (t_ten=1 or f_ten=1) and t_zdv=0  and f_zdv=0 then do; o_zdv=1; goto vv66; end;
	end;

	if reg_option in (999) and f_dol=1 then do;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			o_dol=1;
			o_zdv=1; goto vv66; 
	end;
	
	if reg_option in (105) and f_dol=1 then do;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			o_dol=1;
			if t_ten=0 then o_ten=1; if t_ten=1 then o_zdv=1; goto vv66; 
	end;
	if reg_option in (106) and f_dol=1 then do;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			o_dol=1;
			if t_zdv=0 then o_zdv=1; if t_zdv=1 then o_ten=1; goto vv66; 
	end;
	
vv66:
	if t ge 2 then do;
			if o_zdv_tm1=1 and o_zdv=0 then do;   tss_zdv=0; end;
			if o_3tc_tm1=1  and o_3tc=0 then do;  tss_3tc=0; end;
			if o_ten_tm1=1  and o_ten=0 then do;  tss_ten=0; end;
			if o_nev_tm1=1  and o_nev=0 then do;  tss_nev=0; end;
			if o_taz_tm1=1  and o_taz=0 then do;  tss_taz=0; end;
			if o_dar_tm1=1  and o_dar=0 then do;  tss_dar=0; end;
			if o_efa_tm1=1  and o_efa=0 then do;  tss_efa=0; end;
			if o_lpr_tm1=1  and o_lpr=0 then do;  tss_lpr=0; end;
			if o_dol_tm1=1  and o_dol=0 then do;  tss_dol=0; end;
	end;
end;



* CHOICE OF THIRD LINE REGIMEN;

if choose_line3=1  then do;
		choose_line3=.; start_line3=.;
	o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_dar=0;o_efa=0;o_dol=0;o_taz=0;
		o_dar=1; o_dol=1;

	if t ge 2 then do;
			if o_zdv_tm1=1 and o_zdv=0 then do;   tss_zdv=0; end;
			if o_3tc_tm1=1  and o_3tc=0 then do;  tss_3tc=0; end;
			if o_ten_tm1=1  and o_ten=0 then do;  tss_ten=0; end;
			if o_nev_tm1=1  and o_nev=0 then do;  tss_nev=0; end;
			if o_dar_tm1=1  and o_dar=0 then do;  tss_dar=0; end;
			if o_taz_tm1=1  and o_taz=0 then do;  tss_taz=0; end;
			if o_efa_tm1=1  and o_efa=0 then do;  tss_efa=0; end;
			if o_lpr_tm1=1  and o_lpr=0 then do;  tss_lpr=0; end;
			if o_dol_tm1=1  and o_dol=0 then do;  tss_dol=0; end;
	end;
end;

* restart_pi_after_dtg_fail -  ;  * dec17;

if restart_pi_after_dtg_fail=1  then do;  

			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if t_taz=0 then o_taz=1;  if t_taz=1 and t_lpr=0 then o_lpr=1;  
			if t_zdv ne 1 then do; o_zdv=1;  end;
			if t_ten=0 and t_zdv=1 then do; o_ten=1; end;
end;


if reg_option in (105 106) then art_monitoring_strategy = 153; * this is so that do not do the extra confirmatory vls, which is not needed since
wont switch anyway;


* current number of drugs on;
	nod{t}=o_zdv+o_3tc+o_ten+o_nev+o_dar+o_lpr+o_taz+o_efa+o_dol;


* current number of nucs on;
	nonuc{t}=o_zdv+o_3tc+o_ten;


	if t ge 2 and onart{t}=1 and restart{t}=0 then toffart{t}=.;
	
	if onart{t}=1 then do;
		mr_zdv=o_zdv;
		mr_3tc=o_3tc;
		mr_ten=o_ten;
		mr_nev=o_nev;
		mr_dar=o_dar;
		mr_efa=o_efa;
		mr_lpr=o_lpr;
		mr_taz=o_taz;
	end;


* if o_drug=1 then p_drug=1 (once p_drug=1 it is updated automatically and never over-written with 0);
	if o_zdv=1 then p_zdv=1;
	if o_3tc=1 then p_3tc=1;
	if o_ten=1 then p_ten=1;
	if o_nev=1 then p_nev=1;
	if o_dar=1 then p_dar=1;
	if o_efa=1 then p_efa=1;
	if o_lpr=1 then p_lpr=1;
	if o_taz=1 then p_taz=1;
	if o_dol=1 then p_dol=1;

	
* adherence between t-1 and t  (adh{t});
	if t ge 2 and onart{t-1}=1 then do;
		adh{t}=adhav + adhvar*normal(0);

* effect on adherence of alerts due to vl > 1000;

	if v_alert_6m_incr_adh = 1 and . < caldate{t}-date_v_alert <= 0.5  then adh{t} = 0.9 + (0.05*normal(0));

	if v_alert_perm_incr_adh = 1 and caldate{t} >= date_v_alert > .   then  adh{t} = 0.9  + (0.05*normal(0));
	* this below means that the adhav effect on reduced risk of interruption is seen also in those who had permanent increased adh due to alert;
	if adhav_increase_due_to_alert=. and v_alert_perm_incr_adh=1 and caldate{t} >= date_v_alert > .  then do;
		adhav=0.9;adhav_increase_due_to_alert=1;
	end;
	

* current tox can affect adherence;
		r=uniform(0); if c_tox{t-1}=1 and r < 0.3 then adh{t}=adh{t}-red_adh_tox;

* poorer "adherence" (lower drug levels) if have "current" tb or adc;
		if t ge 3 and (tb{t-2}=1 or tb{t-1}=1 or adc{t-1}=1) then adh{t}=adh{t}- red_adh_tb_adc ;

* occasional severe drop in adherence / absorption (more likely when on PI) (only way I can think to explain v fail with no mutations on PI);
	f=uniform(0);
	if o_lpr=1 or o_taz=1 or o_dar=1 then  f=f/10;
	if f < 0.010   then adh{t} = adh{t} - 0.6;   * changed from 0.005 to 0.020 - mar16; * changed from 0.020 to 0.010 and f/10 above changed from f/5 
	jun16 as cannot get levels of viral suppression higher than about 86%, even with adh_pattern_ 100 (best profile); * changed since nih talk 
	(for which program was padr_apr16; 

	* dec16 - for malawi_abc_e_jun16.sas - reduced from f < 0.010 to f < 0.001 and f=f/10 increased to f=f/100 (is prob is same for pi); 
	adh{t}=round(adh{t},.001);if adh{t} gt 1 then adh{t}=1;if adh{t} lt 0 then adh{t}=0;
	
	end;

* higher effective adherence if on nnrti; * apr 2019 - remove e_adh and just have adh;
	if o_nev=1 or o_efa=1 then adh{t}=adh{t} + add_eff_adh_nnrti;


* apr 2019  - difference in adherence according to age and gender (at time 0 the adh pattern does not differ by age and gender - this code also moved
	down so applies after tox, tb/adc, pi effects;
e=uniform(0);

* note no effect when using e < 0.0;
if gender=1 and 15 <= age{t} < 20 and adh{t} > 0.8 and e < 0.3 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;
if gender=1 and 20 <= age{t} < 25 and adh{t} > 0.8 and e < 0.2 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;
if gender=1 and 25 <= age{t} < 30 and adh{t} > 0.8 and e < 0.1 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;
if gender=1 and 30 <= age{t} < 35 and adh{t} > 0.8 and e < 0.0 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;
if gender=1 and 35 <= age{t} < 40 and adh{t} > 0.8 and e < 0.0 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;
if gender=1 and 40 <= age{t} < 45 and adh{t} > 0.8 and e < 0.0 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;
if gender=1 and 45 <= age{t} < 50 and adh{t} > 0.8 and e < 0.0 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;
if gender=1 and 50 <= age{t}      and adh{t} > 0.8 and e < 0.0 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;

* _n6_ ;
if gender=2 and 15 <= age{t} < 20 and adh{t} > 0.8 and e < 0.2 then do; r=uniform(0); adh{t}=0.65; if r < 0.33 then adh{t}=0.1; end;
if gender=2 and 20 <= age{t} < 25 and adh{t} < 0.8 and e < 0.1 then adh{t}=0.90;
if gender=2 and 25 <= age{t} < 30 and adh{t} < 0.8 and e < 0.3 then adh{t}=0.90;
if gender=2 and 30 <= age{t} < 35 and adh{t} < 0.8 and e < 0.5 then adh{t}=0.90;
if gender=2 and 35 <= age{t} < 40 and adh{t} < 0.8 and e < 0.8 then adh{t}=0.90;
if gender=2 and 40 <= age{t} < 45 and adh{t} < 0.8 and e < 0.8 then adh{t}=0.90;
if gender=2 and 45 <= age{t} < 50 and adh{t} < 0.8 and e < 0.8 then adh{t}=0.90;
if gender=2 and 50 <= age{t}      and adh{t} < 0.8 and e < 0.9 then adh{t}=0.90;


* high risk of resistance with nnrtis even if v low adherence;
if t ge 2 then adhmin{t}=min(adh{t},adhmin{t-1});


* REDUCED CD4 RISE FOR FASTER CD4 RISERS AFTER LONGER ON ART;

	pt_cd4_rise_art=patient_cd4_rise_art;

	if t ge 2 and 4 < tcur{t-1} <= 12 and patient_cd4_rise_art > 1 then pt_cd4_rise_art = patient_cd4_rise_art / 1.25;
	if t ge 2 and 12 < tcur{t-1} < 20 and patient_cd4_rise_art > 1 then pt_cd4_rise_art = patient_cd4_rise_art / 4;
	if t ge 2 and 20 <= tcur{t-1} and patient_cd4_rise_art > 1 then pt_cd4_rise_art = patient_cd4_rise_art / 12;  


* GREATER RATE OF CD4 LOSS WITH FAILING NNRTI REGIMEN - may want to change at some point from nactive{t-1}<=2 to v{t-1}>=500?;
	cd4_art_adj=0;  
	if ((o_nev=1 or o_efa=1) and 
	    (o_lpr=0 or o_taz=0 or o_dar=0) and nactive{t-1} <= 2) then cd4_art_adj = poorer_cd4rise_fail_nn;
 
	if poorer_cd4rise_fail_ii=1 and ((o_dol=1 ) and 
	    (o_lpr=0 or o_taz=0 or o_dar=0) and nactive{t-1} <= 2) then cd4_art_adj = poorer_cd4rise_fail_nn;


* AGE EFFECT ON CD4 RISE;
age_art_adj=((age{t}-40)*-0.3);

* GREATER CD4 RISE on PI;
pi_art_adj=0;
if (o_lpr=1 or o_dar=1 or o_taz=1) then pi_art_adj=3;

* GREATER CD4 RISE IN WOMEN;
gender_art_adj=0;
if gender=2 then gender_art_adj=2;

cd4_art_adj = cd4_art_adj + age_art_adj + pi_art_adj + gender_art_adj;

if adh{t} gt 1 then adh{t}=1;


* AP 29-7-19;
* for output to calculate death rate and aids death rate in people on art by time from initiation, cd4 at art initiation and adh at start of art;  
if t ge 2 and tcur{t-1}=0 and caldate{t} = yrart+0.25 then adh_in_first_period_onart = adh{t};


* EFFECT OF NACTIVE >= 3 ART - on viral load / CD4 / resistance changes between t-1 and t;

* risk of new mutation(s) depends on latest viral load and effective adh level - * highest risk of res when adh between 0.5-0.8;
* nactive ge 3 - first 3 months ;
	if t ge 2 and nactive{t-1} ge 3 then do;
		if tcur{t-1}=0 then do;
			 if adh{t} >= 0.8 then do;v{t}=vmax{t-1}-3.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			 cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+180); newmut{t-1}= 0.002*((v{t}+v{t-1})/2); end;   * _i20_ ;
			 if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-2.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			 cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut{t-1}=0.15*((v{t}+v{t-1})/2); end;
			 if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			 cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+5 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.15*((v{t}+v{t-1})/2); end;
		end;
* nactive ge 3 - 3-6 months; * ( cd4 change and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;

			if        adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=v_min_art+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut{t-1}= 0.002*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} <  0.8 and adh{t} >= 0.8 then do; v{t}=1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut{t-1}= 0.002*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}= 1.2 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}= 1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut{t-1}= 0.10*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=2.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut{t-1}= 0.10*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-2.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+7.5 ); newmut{t-1}= 0.10*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.1*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.1*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.1*((v{t}+v{t-1})/2); end;
	
		end;
* nactive ge 3 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4) then do;
			if adh{t} >= 0.8 then do; v{t}=v_min_art+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};   * oct 2014;
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+30); newmut{t-1}=  0.002*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=1.2+(sd_v_art*normal(0)); vc{t-1}=v{t}-v{t-1};* ie risk of rebound;
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut{t-1}=0.15*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.5+(sd_v_art*normal(0)); vc{t-1}=v{t}-v{t-1};* ie almost certain rebound;
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.15*((v{t}+v{t-1})/2);  end;
		end;
	end;



* EFFECT OF NACTIVE = 2.75 ART - on viral load / CD4 / resistance changes between t-1 and t;

* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 2.75 - first 3 months ;
	if t ge 2 and nactive{t-1} = 2.75 then do;
		if tcur{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-2.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+80); newmut{t-1}= 0.01*((v{t}+v{t-1})/2); end;    * _i20_ ;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-1.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut{t-1}=0.15*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+4 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.15*((v{t}+v{t-1})/2); end;
		end;
* nactive ge 3 - 3-6 months; * ( cd4 change and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;
	
			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=v_min_art+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+28 ); newmut{t-1}= 0.01*((v{t}+v{t-1})/2); end;
		 	if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}=1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+28 ); newmut{t-1}= 0.01*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}= 1.2 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
    		cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+28 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}= 1.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut{t-1}= 0.15*((v{t}+v{t-1})/2); end;
 			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=2.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut{t-1}= 0.15*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-1.8+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+4.5 ); newmut{t-1}= 0.15*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-14 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.15*((v{t}+v{t-1})/2); end;
 			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-14 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.15*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-14 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.15*((v{t}+v{t-1})/2); end;

		end;
* nactive ge 3 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4) then do;
			if adh{t} >= 0.8 then do; v{t}=v_min_art+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+28); newmut{t-1}= 0.01*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=1.2+(sd_v_art*normal(0)); vc{t-1}=v{t}-v{t-1};* ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut{t-1}=0.18*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.4+(sd_v_art*normal(0)); vc{t-1}=v{t}-v{t-1};* ie almost certain rebound;
			cc{t-1}=cd4_art_adj+(-14 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.18*((v{t}+v{t-1})/2);  end;
		end;
	end;



* EFFECT OF NACTIVE = 2.5 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 2.5 - first 3 months ;
	if t ge 2 and nactive{t-1} = 2.5  then do;
		if tcur{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-2.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+40); newmut{t-1}= 0.03*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+23 ); newmut{t-1}=0.2*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.3+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.2*((v{t}+v{t-1})/2); end;
		end;
* nactive = 2.5 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;
	
			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+25 ); newmut{t-1}= 0.03*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}= 1.2 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+25 ); newmut{t-1}= 0.03*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}= 1.2 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+25 ); newmut{t-1}= 0.03*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=1.8+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=2.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-1.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut{t-1}= 0.2 *((v{t}+v{t-1})/2); end;

 			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.3+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-15 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.2*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.3+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-15 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.2*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.3+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-15 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.2*((v{t}+v{t-1})/2); end;
		end;
* nactive = 2.5 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4)  then do;
			if adh{t} >= 0.8 then do; v{t}= 1.2+(sd_v_art*normal(0));
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+25); newmut{t-1}= 0.03*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}= 1.2 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut{t-1}=0.2*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.3+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie almost certain rebound;
		    cc{t-1}=cd4_art_adj+(-15 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.2*((v{t}+v{t-1})/2); end;
		end;
	end;


* EFFECT OF NACTIVE = 2.25 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 2.25 - first 3 months ;
	if t ge 2 and nactive{t-1} = 2.25  then do;
		if tcur{t-1}=0 then do;
 			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-1.8+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+35); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-1.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+20 ); newmut{t-1}=0.25*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.25+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+2 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.25*((v{t}+v{t-1})/2); end;
		end;
* nactive = 2.25 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;

			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=1.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+23 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}= 1.4 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+23 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}= 1.4 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+23 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=2.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=2.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-1.35+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-2  ); newmut{t-1}= 0.2 *((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.25 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-15.5 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.2*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.25+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-15.5 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.2*((v{t}+v{t-1})/2);  end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.25+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-15.5 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.2*((v{t}+v{t-1})/2);  end;

		end;
* nactive = 2.25 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4)  then do;
			if adh{t} >= 0.8 then do; v{t}= 1.4+(sd_v_art*normal(0));
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+23); newmut{t-1}= 0.08*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}= 1.6 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut{t-1}=0.25*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.25+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie almost certain rebound;
		    cc{t-1}=cd4_art_adj+(-15.5 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.25*((v{t}+v{t-1})/2); end;
		end;
	end;


* EFFECT OF NACTIVE = 2 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 2 - first 3 months ;
	if t ge 2 and nactive{t-1} = 2  then do;
		if tcur{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}= vmax{t-1} - 1.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+30); newmut{t-1}= 0.1*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}= vmax{t-1} - 0.9+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+1 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
		end;
* nactive = 2 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;

 			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=2.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+21 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 2.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+7.5); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 2.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+7.5); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); end;

 			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=2.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+7 ); newmut{t-1}= 0.3 *((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-4.5 ); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-4.5 ); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2);  end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2);  end;

		end;
* nactive = 2 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4) then do;
		 	if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-2.5+(sd_v_art*normal(0));
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+21); newmut{t-1}= 0.1*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(-4.5 ); newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie almost certain rebound;
    		cc{t-1}=cd4_art_adj+(-16 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
		end;
	end;



* EFFECT OF NACTIVE = 1.75 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 1.75 first 3 months ;
	if t ge 2 and nactive{t-1} = 1.75  then do;
		if tcur{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}= vmax{t-1} - 1.25+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+25); newmut{t-1}= 0.15*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}= vmax{t-1} - 0.8+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.15+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-1 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
		end;
* nactive = 1.75 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;

			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=2.7+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+19 ); newmut{t-1}= 0.10*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 1.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+1.5 ); newmut{t-1}= 0.10*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 1.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+1.5 ); newmut{t-1}= 0.10*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-2.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+4); * may17; newmut{t-1}= 0.3 *((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 1.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-6 ); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-1.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-6 ); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.15+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16.5 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2);  end; *may17;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.15+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16.5); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
		 	if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.15+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16.5); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;

		end;
* nactive = 1.75 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4) then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-2.0+(sd_v_art*normal(0));
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+19); newmut{t-1}= 0.15*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-1.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(-7.5 ); newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie almost certain rebound;
		    cc{t-1}=cd4_art_adj+(-16.5 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2);  end;
		end;
	end;




* EFFECT OF NACTIVE = 1.5 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 1.5 - first 3 months ;
	if t ge 2 and nactive{t-1} = 1.5  then do;
		if tcur{t-1}=0 then do;
 			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.9+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+20); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-3 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
		end;
* nactive = 1.5 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;
			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 1.7+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+3  ); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-4.5 ); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 1.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-4.5 ); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
	
			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 1.5 + (sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.8 + (sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-10); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.8 +(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-10); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.10+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-17); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.10+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-17); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.10+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-17); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;

		end;
* nactive = 1.5 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4)  then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-1.4+(sd_v_art*normal(0));
			cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut{t-1}= 0.2*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.7+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(-10); newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie almost certain rebound;
			cc{t-1}=cd4_art_adj+(-17); newmut{t-1}=0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2);  end;
		end;
	end;




* EFFECT OF NACTIVE = 1.25 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 1.25 - first 3 months ;
	if t ge 2 and nactive{t-1} = 1.25  then do;
		if tcur{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.8+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+17); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut{t-1}=0.35*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}+0.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-6 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.3*((v{t}+v{t-1})/2); end;
		end;
* nactive = 1.25 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;
			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 1.15+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-5  ); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 1.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-7  ); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 1.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-7.5); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.9 + (sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-9 ); newmut{t-1}= 0.35*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.65+ (sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-11.5); newmut{t-1}= 0.35*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.65+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-11.5); newmut{t-1}= 0.35*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-17.5); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.35*((v{t}+v{t-1})/2);  end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-17.5 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.35*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-17.5 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.35*((v{t}+v{t-1})/2); end;

		end;
* nactive = 1.25 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4)  then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-1.15+(sd_v_art*normal(0));
		    cc{t-1}=cd4_art_adj+(-5); newmut{t-1}= 0.3*((v{t}+v{t-1})/2); end;
		 	if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(-12 ); newmut{t-1}=0.35*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie almost certain rebound;
		    cc{t-1}=cd4_art_adj+(-17 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.35*((v{t}+v{t-1})/2); end;
		end;
	end;




* EFFECT OF NACTIVE = 1 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 1  - first 3 months ;
	if t ge 2 and nactive{t-1} = 1  then do;
		if tcur{t-1}=0 then do;
		 	if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.7+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+13); newmut{t-1}= 0.4*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+5 ); newmut{t-1}=0.4*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}+0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-10 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.4*((v{t}+v{t-1})/2);  end;
		end;
* nactive = 1 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this includes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;
	
			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 0.9+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-9  ); newmut{t-1}= 0.4 *((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 0.9+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-9  ); newmut{t-1}= 0.4 *((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 0.9+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-9  ); newmut{t-1}= 0.4 *((v{t}+v{t-1})/2); end;
	
			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-0.7+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-11 ); newmut{t-1}= 0.4 *((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}= 0.4 *((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}= 0.4 *((v{t}+v{t-1})/2); end;
	
			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.4*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.4*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.4*((v{t}+v{t-1})/2); end;
		end;
*  nactive = 1 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4)  then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.9+(sd_v_art*normal(0));
		    cc{t-1}=cd4_art_adj+(-9 ); newmut{t-1}= 0.4*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}=0.4*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie almost certain rebound;
			cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.4*((v{t}+v{t-1})/2); end;
		end;
	end;



* EFFECT OF NACTIVE = 0.75 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 0.8  - first 3 months ;
	if t ge 2 and nactive{t-1} = 0.75 then do;
		if tcur{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.55+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut{t-1}= 0.45*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.25+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut{t-1}=0.45*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}+0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-11 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.45*((v{t}+v{t-1})/2); end;
		end;
* nactive = 0.75- 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this includes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;

			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 0.75+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-10.5 ); newmut{t-1}= 0.45*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 0.7+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-11 ); newmut{t-1}= 0.45 *((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}=vmax{t-1} - 0.7+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-11 ); newmut{t-1}= 0.45 *((v{t}+v{t-1})/2); end;
	
			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-0.55+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-12.5 ); newmut{t-1}= 0.45*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.35+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-14.5 ); newmut{t-1}= 0.45*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1}-0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16 ); newmut{t-1}= 0.45*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.45*((v{t}+v{t-1})/2);  end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.45*((v{t}+v{t-1})/2);  end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.45*((v{t}+v{t-1})/2); end;
		end;
*  nactive = 0.75- GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4)  then do;
		 	if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.75+(sd_v_art*normal(0));
		    cc{t-1}=cd4_art_adj+(-10.5); newmut{t-1}= 0.45*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(-14 ); newmut{t-1}=0.45*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1}; * ie almost certain rebound;
		    cc{t-1}=cd4_art_adj+(-17 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.45*((v{t}+v{t-1})/2);  end;
		end;
	end;



* EFFECT OF NACTIVE = 0.5 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 0.5  - first 3 months ;
	if t ge 2 and nactive{t-1} = 0.5 then do;
		if tcur{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+5); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut{t-1}=0.5*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}+0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-12 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2);  end;
		end;
* nactive = 0.5 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this includes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;

			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}= vmax{t-1}- 0.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-12 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}= vmax{t-1}- 0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}= vmax{t-1}- 0.5+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
	
			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-14 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}= vmax{t-1}- 0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2);  end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2);  end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2); end;
		end;
*  nactive = 0.5 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4)  then do;
		 	if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.6+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-12); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.3+(sd_v_art*normal(0)); vc{t-1}=v{t}-v{t-1};* ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(-15 ); newmut{t-1}=0.5*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.1+(sd_v_art*normal(0)); vc{t-1}=v{t}-v{t-1};* ie almost certain rebound;
		    cc{t-1}=cd4_art_adj+(-17 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2);if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2);  end;
		end;
	end;



* EFFECT OF NACTIVE = 0.25 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 0.25  - first 3 months ;
	if t ge 2 and nactive{t-1} = 0.25 then do;
		if tcur{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.3+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
    		cc{t-1}=cd4_art_adj+(-2); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-7 ); newmut{t-1}=0.5*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}+0.1+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-13 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2); end;
		end;
* nactive = 0.25 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this includes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if tcur{t-1}=1 or (tcur{t-1} ge 2 and v{t-1} ge 4) and t ge 2 then do;
	
 			if adh{t-1} >= 0.8 and adh{t} >= 0.8 then do; v{t}= vmax{t-1}- 0.4+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-14 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} >= 0.8 then do; v{t}= vmax{t-1}- 0.35+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-14.5); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if adh{t-1} < 0.5 and adh{t} >= 0.8 then do; v{t}= vmax{t-1}- 0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-16 ); newmut{t-1}= 0.25*((v{t}+v{t-1})/2); end;

			if adh{t-1} >= 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.3+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-15 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2);  end;
			if 0.5 <= adh{t-1} < 0.8 and 0.5 <= adh{t} < 0.8 then do; v{t}= vmax{t-1}- 0.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
 			cc{t-1}=cd4_art_adj+(-17.5 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2);  end;
			if adh{t-1} < 0.5 and 0.5 <= adh{t} < 0.8 then do; v{t}=vmax{t-1} - 0.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-17.5 ); newmut{t-1}= 0.25*((v{t}+v{t-1})/2);  end;

			if adh{t-1} >= 0.8 and  adh{t} < 0.5 then do; v{t}=vmax{t-1}-0.00+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2);end;
			if 0.5 <= adh{t-1} < 0.8 and adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.00+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2);end;
			if adh{t-1} < 0.5 and adh{t} < 0.5 then do; v{t}=vmax{t-1}+0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
		    cc{t-1}=cd4_art_adj+(-18 ); newmut{t-1}= 0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2);end;
		end;
*  nactive = 0.25 - GE 6 months;
		if (tcur{t-1} ge 2 and v{t-1} lt 4)  then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.3+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-12 ); newmut{t-1}= 0.5*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.1+(sd_v_art*normal(0)); vc{t-1}=v{t}-v{t-1};* ie risk of rebound;
		    cc{t-1}=cd4_art_adj+(-15 ); newmut{t-1}=0.5*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.0+(sd_v_art*normal(0)); vc{t-1}=v{t}-v{t-1};* ie almost certain rebound;
		    cc{t-1}=cd4_art_adj+(-17 ); newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then newmut{t-1}=0.5*((v{t}+v{t-1})/2);end;
		end;
	end;



* EFFECT OF NACTIVE = 0 ART - on viral load / CD4 / resistance changes between t-1 and t;

	if t ge 2 and nactive{t-1}=0 then do;
			if adh{t} >= 0.8 then do; v{t}=vmax{t-1}-0.2+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-15); *c{t}=c{t-1}+cc{t-1};newmut{t-1}=0.5*((v{t}+v{t-1})/2); end;
			if 0.5 <= adh{t} < 0.8 then do;v{t}=vmax{t-1}-0.05+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-17 ); *c{t}=c{t-1}+cc{t-1};newmut{t-1}=0.5*((v{t}+v{t-1})/2); end;
			if adh{t} < 0.5 then do;  v{t}=vmax{t-1}-0.0+(sd_v_art*normal(0));vc{t-1}=v{t}-v{t-1};
			cc{t-1}=cd4_art_adj+(-18 ); *c{t}=c{t-1}+cc{t-1};newmut{t-1}=0.05*((v{t}+v{t-1})/2); if (o_nev=1 or o_efa=1) then 
			newmut{t-1}=0.5*((v{t}+v{t-1})/2);end;
	end;



if t ge 2 and nactive{t-1} >= 0 and cc{t-1} > 0 then do;
	if 100 < c{t-1} <= 200 then cc{t-1}=cc{t-1}*0.85;
	else if  c{t-1} >  200 then cc{t-1}=cc{t-1}*0.7;
end;
if t ge 2 then c{t}=c{t-1}+cc{t-1}; 


	if v{t} > 6.5 then v{t}=6.5;

	if . < c{t} lt 0 then c{t}=0;

* add variability to cd4 for those on art;
	if t ge 2 and nactive{t-1} ge 0 then do; c{t}=(sqrt(c{t})+ sd_cd4*normal(0))**2; end;


	if  t ge 2 and tcur{t-1} ge 0 and c{t} gt cmax then c{t}=cmax+(normal(0)*50);
	if . < v{t} lt 0 then v{t}=0;

	if t ge 2 then do;
		newmut{t-1}=newmut{t-1}*fold_change_mut_risk;
		if primary{t}=1 and prep=1 then newmut{t-1}=newmut{t-1}*risk_incr_res_primary; * may17;
		if started_prep_hiv_test_sens and prep=1 then newmut{t-1}=newmut{t-1}*0.33; * due to test at 1 month from start of prep - jul17;
		if newmut{t-1} gt 1 then newmut{t-1}=1;
	end;



* define vmax and cmin;
	if t ge 2 then do;
		vmax{t}=max(vmax{t-1},v{t});
		cmin{t}=min(cmin{t-1},c{t});
	end;


* BIRTH WITH INFECTED CHILD;
* amended jun18 ;
	onart_birth_with_inf_child=0;onart_birth_with_inf_child_res=0;give_birth_with_hiv=0;birth_with_inf_child=0;	
	if pregnant=1 and hiv{t}=1 and t ge 2 then do; 
		give_birth_with_hiv=1;
		u=uniform(0);
		if . < v{t} <= 3 then u=u*1000; 
		if 3 < v{t} <= 4 then u=u*2;
		if 4 < v{t} <= 5 then u=u*1;
		if 5 < v{t} then u=u/2;
		if . < caldate{t}-yrart <= 0.75 and onart{t}=1 then u = u * 10 ; * jul18 - this is due to fact that pregnancy and birth are in same period and in 
		fact art would be started a few months earlier in women with hiv detected in pregnancy; 
		if u < rate_birth_with_infected_child then do; * apr 2019;
			birth_with_inf_child=1; if caldate{t} ge 2018.75 then ever_birth_with_inf_child = 1;
			if c_rt184m_tm1=1 or c_rttams_tm1=1  or c_rt65m_tm1=1 or c_rt103m_tm1=1 or c_rt181m_tm1=1 or c_rt190m_tm1=1
			or c_rt151m_tm1=1  or c_pr32m_tm1=1  or c_pr33m_tm1=1 or c_pr46m_tm1=1  or c_pr47m_tm1=1
			or c_pr50vm_tm1=1  or c_pr50lm_tm1=1 or c_pr54m_tm1=1
			or c_pr76m_tm1=1  or c_pr82m_tm1=1  or c_pr84m_tm1=1   or c_pr88m_tm1=1  or c_pr90m_tm1=1  
			or c_inpm_tm1=1   or c_insm_tm1=1 then child_with_resistant_hiv=1;
			birth_with_inf_child_lt1yrfi=0; if . < caldate{t} - infection <= 1 then birth_with_inf_child_lt1yrfi = 1; 		
		end;
	end;

	if onart&j =1 and birth_with_inf_child=1 then do; onart_birth_with_inf_child=1; ev_birth_with_inf_ch_onart = 1; end;
	if onart_birth_with_inf_child=1 and child_with_resistant_hiv=1 then onart_birth_with_inf_child_res=1;


* NEW RESISTANCE MUTATIONS ARISING (and dominating)
- if resistance appears between t-1 and t it doesnt affect the viral load until t+1;

	d=uniform(0);

	if t ge 2 and d lt newmut{t-1} then do;

* rt184;
		m=uniform(0);if o_3tc_tm1=1 and c_rt184m_tm1=0 and m < 0.8 then c_rt184m=1;

* tams;
		if o_zdv_tm1=1 and o_3tc_tm1=0 then do; 
			m=uniform(0); m= m/fold_change_tams_risk;
			if         m lt 0.20 then c_rttams=c_rttams_tm1+1; 
			if 0.20 <= m <  0.21 then c_rttams = c_rttams_tm1+2; end;
		if o_zdv_tm1=1 and o_3tc_tm1=1 then do; 
			m=uniform(0);  m= m/fold_change_tams_risk;
			if          m lt 0.12 then c_rttams=c_rttams_tm1+1; 
			if  0.12 <= m < 0.13 then c_rttams = c_rttams_tm1+2; end;
		if c_rttams gt 6 then c_rttams=6;
	
* rt151;
		if  o_zdv_tm1=1 and c_rt151m_tm1=0 then do; m=uniform(0);m=m/fold_change_151_risk;
			if m lt 0.02 then c_rt151m=1;end;

* rt65;
		if o_ten_tm1=1 and o_zdv_tm1=1 and c_rt65m_tm1=0 then do;
			m=uniform(0); if m lt 0.02 then c_rt65m=1; end;
		if o_ten_tm1=1 and o_zdv_tm1=0  and c_rt65m_tm1=0 then do; 
			m=uniform(0); if m lt rate_res_ten then c_rt65m=1; end; * mar16; * increase from 0.1 to 0.30 based on teneres paper in lancet id;


* NNRTI mutations; 

* dont use fx here as defined elsewhere;

		if o_nev_tm1=1 then do;
			ax=uniform(0); if ax < 0.2 and c_rt181m=0 and c_rt190m=0 then c_rt103m=1;
			bx=uniform(0); if bx < 0.4 and c_rt103m=0 and c_rt190m=0 then c_rt181m=1;
			cx=uniform(0); if cx < 0.2 and c_rt103m=0 and c_rt181m=0 then c_rt190m=1;
		end;
	
		if o_efa_tm1=1 then do;
			ax=uniform(0); if ax < 0.6 and c_rt181m=0 and c_rt190m=0 then c_rt103m=1;
			bx=uniform(0); if bx < 0.1 and c_rt103m=0 and c_rt190m=0 then c_rt181m=1;
			cx=uniform(0); if cx < 0.1 and c_rt103m=0 and c_rt181m=0 then c_rt190m=1;
		end;


* pr mutations ;

* lpr;
        if o_lpr_tm1=1 then do;
            ax=uniform(0); if ax < 0.01 then c_pr32m=1;
            bx=uniform(0); if bx < 0.02 then c_pr46m=1;
			cx=uniform(0); if cx < 0.01 then c_pr47m=1;
			dx=uniform(0); if dx < 0.02 then c_pr54m=1;
			ex=uniform(0); if ex < 0.02 then c_pr76m=1;
            zx=uniform(0); if zx < 0.02 then c_pr82m=1;
         end;

* dar;
		if o_dar_tm1=1  then do;
			ax=uniform(0); if ax < 0.01 then c_pr50vm=1;
			ax=uniform(0); if ax < 0.01 then c_pr54m=1;
			ax=uniform(0); if ax < 0.01 then c_pr76m=1;
			bx=uniform(0); if bx < 0.01 then c_pr84m=1;
		end;

* taz;
		if o_taz_tm1=1  then do;
			ax=uniform(0); if ax < 0.03 then c_pr50lm=1;
			bx=uniform(0); if bx < 0.03 then c_pr84m=1;
			cx=uniform(0); if cx < 0.03 then c_pr88m=1;
		end;

* dol;
		if o_dol_tm1=1 then do; * rate_res_dol_2fold ;
		pr_res_dol=0.03; if higher_rate_res_dol=1 then pr_res_dol=0.1;
			ax=uniform(0); if ax < pr_res_dol then c_inpm=1;  
			bx=uniform(0); if bx < pr_res_dol then c_insm=1;
		end;

	end;



c_totmut{t}=c_rt184m+c_rttams+c_rt65m+c_rt151m+c_rt103m+c_rt181m+c_rt190m
	+c_pr32m+c_pr33m+c_pr46m+c_pr47m+c_pr50vm+c_pr50lm+c_pr54m+c_pr76m
	+c_pr82m+c_pr84m+c_pr88m+c_pr90m+c_inpm+c_insm;

c_totmut_pi=.;
c_totmut_pi=c_pr32m+c_pr33m+c_pr46m+c_pr47m+c_pr50vm+c_pr50lm+c_pr54m+c_pr76m
	+c_pr82m+c_pr84m+c_pr88m+c_pr90m;




	* NEW RESISTANCE TO NNRTI ARISING AS A RESULT OF ART INTERRUPTION - simultaneously stopping all drugs in a regimen
	containing an NNRTI may result in functional monotherapy because NNRTIs have much longer half-lives ; 
	if interrupt{t}=1 and (o_nev_tm1=1 or o_efa_tm1=1) and (c_rt103m_tm1=0 and c_rt181m_tm1=0 and c_rt190m_tm1=0) then do;
		ax=uniform(0); if ax lt 0.018 then c_rt103m=1; 
		bx=uniform(0); if bx lt 0.006 then c_rt181m=1; 
		cx=uniform(0); if cx lt 0.006 then c_rt190m=1; 
	end;




	* DEFINE VARIABLES INDICATING WHETHER EVER HAD A GIVEN MUTATION (AS DOMINANT);
	*Acquisition of new resistance mutations;
	acq_rt65m=0;  if e_rt65m  ne 1 and c_rt65m=1  then do; acq_rt65m=1; dt_acq_rt65m=caldate{t}; end;
	acq_rt184m=0; if e_rt184m ne 1 and c_rt184m=1 then do; acq_rt184m=1;dt_acq_rt184m=caldate{t}; end;
	acq_rtm=0;    if e_totmut{t} lt 1 and (c_rt184m=1 or c_rttams ge 1 or c_rt65m=1 or c_rt151m=1 or c_rt103m=1 or c_rt181m=1 or c_rt190m=1
	 			or c_pr32m=1 or c_pr33m=1 or c_pr46m=1 or c_pr47m=1 or c_pr50vm=1 or c_pr50lm=1 
				or c_pr54m=1  or c_pr76m=1 or c_pr82m=1 or c_pr84m=1 or c_pr88m=1 or c_pr90m=1 or c_inpm=1 or c_insm=1)  then do; 
				acq_rtm=1; dt_acq_rtm=caldate{t}; end;
	if c_rt184m=1 then e_rt184m=1;
	if t ge 2 and c_rttams >= 1 then e_rttams=max(c_rttams,e_rttams_tm1);
	if c_rt65m=1 then e_rt65m=1 ;
	if c_rt103m=1 then e_rt103m=1 ;
	if c_rt181m=1 then e_rt181m=1 ;
	if c_rt190m=1 then e_rt190m=1 ;
	if c_rt151m=1 then e_rt151m=1 ;
	if c_pr33m=1 then e_pr33m=1 ;
	if c_pr32m=1 then e_pr32m=1 ;
	if c_pr47m=1 then e_pr47m=1 ;
	if c_pr46m=1 then e_pr46m=1 ;
	if c_pr50vm=1 then e_pr50vm=1;
	if c_pr50lm=1 then e_pr50lm=1 ;
	if c_pr54m=1 then e_pr54m=1 ;	
	if c_pr76m=1 then e_pr76m=1 ;
	if c_pr82m=1 then e_pr82m=1 ;
	if c_pr84m=1 then e_pr84m=1 ;
	if c_pr88m=1 then e_pr88m=1 ;
	if c_pr90m=1 then e_pr90m=1 ;
	if c_inpm=1 then e_inpm=1 ;
	if c_insm=1 then e_insm=1 ;
	e_totmut{t}=e_rt184m+e_rttams+e_rt65m+e_rt151m+e_rt103m+e_rt181m+e_rt190m
	+e_pr32m+e_pr33m+e_pr46m+e_pr47m+e_pr50vm+e_pr50lm+e_pr54m+e_pr76m
	+e_pr82m+e_pr84m+e_pr88m+e_pr90m+e_inpm+e_insm;


    e_nnmut=.;
    e_nnmut=e_rt103m+e_rt181m+e_rt190m;

    e_pimut=.;
    e_pimut=e_pr32m+e_pr33m+e_pr46m+e_pr47m+e_pr50vm+e_pr50lm+e_pr54m+e_pr76m
    +e_pr82m+e_pr84m+e_pr88m+e_pr90m;

    e_inmut=.;
    e_inmut=e_inpm+e_insm;



* LOSS OF MUTATIONS AFTER STOPPING (or return to mutations at infection - expect for m184v)
and starting another, non-x-resistant, regimen;


* this all relates to those who have started art - not about persistence of transmitted mutations (see below);
	if caldate{t} > yrart > . then do;

	* nucs;
		a=uniform(0);if c_rt184m=1 and (tss_3tc    ge 1 or p_3tc=0)
		and a < .8 then c_rt184m=0;

		a=uniform(0);if c_rt151m=1 and (tss_zdv    ge 1 or p_zdv=0) and (tss_3tc    ge 1 or p_3tc=0) 
		and a < .6 then c_rt151m=c_rt151m_inf;
	
		a=uniform(0);if c_rt65m=1 and (tss_ten    ge 1 or p_ten=0) and (tss_3tc    ge 1 or p_3tc=0)
		and a < .6 then c_rt65m=c_rt65m_inf;

		a=uniform(0);if c_rttams ge 1 and (tss_zdv    ge 1 or p_zdv=0) and (tss_ten    ge 1 or p_ten=0)
		and a < .4 then c_rttams=c_rttams_inf;

	* nns; 
		a=uniform(0);if c_rt103m=1 and (tss_efa    ge 1 or p_efa=0) and (tss_nev    ge 1 or p_nev=0) 
		and a < rate_loss_acq_nnm_offart then c_rt103m=c_rt103m_inf;

		a=uniform(0);if c_rt181m=1 and (tss_efa    ge 1 or p_efa=0) and (tss_nev    ge 1 or p_nev=0) 
		and a < rate_loss_acq_nnm_offart then c_rt181m=c_rt181m_inf;

		a=uniform(0);if c_rt190m=1 and (tss_efa    ge 1 or p_efa=0) and (tss_nev    ge 1 or p_nev=0) 
		and a < rate_loss_acq_nnm_offart then c_rt190m=c_rt190m_inf;

* pis;

a=uniform(0);if c_pr32m ge 1 and (tss_lpr ge 1 or p_lpr=0) and (tss_dar ge 1 or p_dar=0) and (tss_taz ge 1 or p_taz=0) and a < .2 then c_pr32m=c_pr32m_inf;
a=uniform(0);if c_pr33m ge 1 and (tss_lpr ge 1 or p_lpr=0) and (tss_dar ge 1 or p_dar=0) and (tss_taz ge 1 or p_taz=0) and a < .2 then c_pr33m=c_pr33m_inf;
a=uniform(0);if c_pr46m ge 1 and (tss_lpr ge 1 or p_lpr=0) and (tss_dar ge 1 or p_dar=0) and a < .2 then c_pr46m=c_pr46m_inf;
a=uniform(0);if c_pr47m ge 1 and (tss_lpr ge 1 or p_lpr=0) and (tss_dar ge 1 or p_dar=0) and a < .2 then c_pr47m=c_pr47m_inf;
a=uniform(0);if c_pr50vm ge 1 and (tss_dar ge 1 or p_dar=0)  and (tss_lpr ge 1 or p_lpr=0) and a < .2 then c_pr50vm=c_pr50vm_inf;
a=uniform(0);if c_pr54m ge 1 and (tss_lpr ge 1 or p_lpr=0) and (tss_dar ge 1 or p_dar=0) and (tss_taz ge 1 or p_taz=0) and a < .2 then c_pr54m=c_pr54m_inf;
a=uniform(0);if c_pr76m ge 1 and (tss_dar ge 1 or p_dar=0) and (tss_lpr ge 1 or p_lpr=0) and a < .2 then c_pr76m=c_pr76m_inf;
a=uniform(0);if c_pr82m ge 1 and (tss_lpr ge 1 or p_lpr=0) and (tss_dar ge 1 or p_dar=0) and (tss_taz ge 1 or p_taz=0) and a < .2 then c_pr82m=c_pr82m_inf;
a=uniform(0);if c_pr84m ge 1 and (tss_dar ge 1 or p_dar=0) and (tss_taz ge 1 or p_taz=0) and (tss_lpr ge 1 or p_lpr=0) and a < .2 then c_pr84m=c_pr84m_inf;
a=uniform(0);if c_pr50lm ge 1 and (tss_taz ge 1 or p_taz=0) and a < .2 then c_pr50lm=c_pr50lm_inf;
a=uniform(0);if c_pr88m ge 1 and (tss_taz ge 1 or p_taz=0) and a < .2 then c_pr88m=c_pr88m_inf;
a=uniform(0);if c_pr90m ge 1 and (tss_lpr ge 1 or p_lpr=0) and (tss_dar ge 1 or p_dar=0) and a < .2 then c_pr90m=c_pr90m_inf;

	* integrase inhibitor; 

	a=uniform(0);if c_inpm ge 1 and (tss_dol ge 1 or p_dol=0) and a < .2 then c_inpm=c_inpm_inf;
	a=uniform(0);if c_insm ge 1 and (tss_dol ge 1 or p_dol=0) and a < .2 then c_insm=c_insm_inf;


	end;



* LOSS OF TRANSMITTED RESISTANCE MUTATIONS FROM MAJORITY VIRUS ("LOSS OF PERSISTENCE");

x=uniform(0); if t ge 2 and c_rttams_inf ge 1 and naive{t}=1 and c_rttams ge 1 and x < rate_loss_persistence then c_rttams=c_rttams_tm1-1;  
x=uniform(0); if c_rt184m_inf = 1 and naive{t}=1 and c_rt184m=1 and x < 3 * rate_loss_persistence then c_rt184m=0;
x=uniform(0); if c_rt65m_inf = 1 and naive{t}=1 and c_rt65m=1 and x < rate_loss_persistence then c_rt65m=0;
x=uniform(0); if c_rt151m_inf = 1 and naive{t}=1 and c_rt151m=1 and x < rate_loss_persistence then c_rt151m=0;
x=uniform(0); if c_rt103m_inf = 1 and naive{t}=1 and c_rt103m=1 and x < rate_loss_persistence then c_rt103m=0;
x=uniform(0); if c_rt181m_inf = 1 and naive{t}=1 and c_rt181m=1 and x < rate_loss_persistence then c_rt181m=0;
x=uniform(0); if c_rt190m_inf = 1 and naive{t}=1 and c_rt190m=1 and x < rate_loss_persistence then c_rt190m=0;
x=uniform(0); if c_pr32m_inf = 1 and naive{t}=1 and c_pr32m=1 and x < rate_loss_persistence then c_pr32m=0;
x=uniform(0); if c_pr33m_inf = 1 and naive{t}=1 and c_pr33m=1 and x < rate_loss_persistence then c_pr33m=0;
x=uniform(0); if c_pr46m_inf = 1 and naive{t}=1 and c_pr46m=1 and x < rate_loss_persistence then c_pr46m=0;
x=uniform(0); if c_pr47m_inf = 1 and naive{t}=1 and c_pr47m=1 and x < rate_loss_persistence then c_pr47m=0;
x=uniform(0); if c_pr50lm_inf = 1 and naive{t}=1 and c_pr50lm=1 and x < rate_loss_persistence then c_pr50lm=0;
x=uniform(0); if c_pr50vm_inf = 1 and naive{t}=1 and c_pr50vm=1 and x < rate_loss_persistence then c_pr50vm=0;
x=uniform(0); if c_pr54m_inf = 1 and naive{t}=1 and c_pr54m=1 and x < rate_loss_persistence then c_pr54m=0;
x=uniform(0); if c_pr76m_inf = 1 and naive{t}=1 and c_pr76m=1 and x < rate_loss_persistence then c_pr76m=0;
x=uniform(0); if c_pr82m_inf = 1 and naive{t}=1 and c_pr82m=1 and x < rate_loss_persistence then c_pr82m=0;
x=uniform(0); if c_pr84m_inf = 1 and naive{t}=1 and c_pr84m=1 and x < rate_loss_persistence then c_pr84m=0;
x=uniform(0); if c_pr88m_inf = 1 and naive{t}=1 and c_pr88m=1 and x < rate_loss_persistence then c_pr88m=0;
x=uniform(0); if c_pr90m_inf = 1 and naive{t}=1 and c_pr90m=1 and x < rate_loss_persistence then c_pr90m=0;
x=uniform(0); if c_inpm_inf = 1  and naive{t}=1 and c_inpm=1 and x < rate_loss_persistence then c_inpm=0;
x=uniform(0); if c_insm_inf = 1  and naive{t}=1 and c_insm=1 and x < rate_loss_persistence then c_insm=0;


* LOSS OF MUTATIONS ACQUIRED IN PMTCT FROM MAJORITY and minoririty VIRUS ;
x=uniform(0);if c_rt103m=1 and                   c_rt103m_inf=0 and p_nev ne 1 and p_efa ne 1 and x < rate_loss_nnres_pmtct_maj then c_rt103m=0;
x=uniform(0);if c_rt103m=0 and e_rt103m=1 and c_rt103m_inf=0 and p_nev ne 1 and p_efa ne 1 and x < rate_loss_nnres_pmtct_min then e_rt103m=0;


	* "REGAINING" MUTATIONS AFTER RESTARTING;
	if e_rt184m=1 and o_3tc=1 then c_rt184m=1;
	if e_rt65m=1 and o_ten=1 then c_rt65m=1;
	if e_rt151m=1 and o_zdv=1  then c_rt151m=1;
	if e_rttams >= 1 and o_zdv=1  then c_rttams=e_rttams;
	if e_rt103m=1 and (o_nev=1 or o_efa=1 ) then do; c_rt103m=1; end;
	if e_rt181m=1 and (o_nev=1 or o_efa=1 ) then do; c_rt181m=1; end;
	if e_rt190m=1 and (o_nev=1 or o_efa=1 ) then do; c_rt190m=1; end;
	if e_pr32m=1 and (o_lpr=1  or o_dar=1 or o_taz=1) then c_pr32m=1;
	if e_pr33m=1 and (o_lpr=1  or o_dar=1 or o_taz=1) then c_pr33m=1;
	if e_pr46m=1 and (o_lpr=1  or o_dar=1 or o_taz=1) then c_pr46m=1;
	if e_pr47m=1 and (o_lpr=1  or o_dar=1 ) then c_pr47m=1;
	if e_pr50vm=1 and (o_lpr=1 or o_dar=1) then c_pr50vm=1;
	if e_pr50lm=1 and (o_taz=1) then c_pr50lm=1;
	if e_pr54m=1 and (o_lpr=1  or o_dar=1 or o_taz=1) then c_pr54m=1;
	if e_pr76m=1 and (o_dar=1 or o_lpr=1) then c_pr76m=1;
	if e_pr82m=1 and (o_lpr=1 or o_dar=1 or o_taz=1) then c_pr82m=1;
	if e_pr84m=1 and (o_lpr=1  or o_dar=1 or o_taz=1) then c_pr84m=1;
	if e_pr88m=1 and (o_taz=1) then c_pr88m=1;
	if e_pr90m=1 and (o_lpr=1  or o_dar=1) then c_pr90m=1;
	if e_inpm=1  and (o_dol=1 ) then c_inpm=1;
	if e_insm=1  and (o_dol=1 ) then c_insm=1;


* art_monitoring_strategy

1. Clinical monitoring alone
2. Clinical monitoring with single VL confirmation
3. Clinical monitoring with VL confirmation
7. Clinical monitoring with CD4 confirmation
8. CD4 monitoring (6 mthly) alone
9. CD4 count monitoring (6 mthly) with single VL confirmation
10. CD4 monitoring (6 mthly) with VL confirmation
150. Viral load monitoring (6m, 12m, annual) - WHO
152. As above with 2 yearly viral load monitoring
153. Viral load monitoring (6m, annual) no confirmation;



* underlying virologic failure (this used to compare with data from studies, not used to instigate switch);

u_vfail1_this_period=0;
if t ge 2 and v{t} gt log10(1000) and caldate{t} ge yrart+0.50 and ((onart{t}=1 and tcur{t} ge 2) ) 
and vfail1_{t-1} ne 1 then do; vfail1_{t}=1; date_u_vfail=caldate{t};  u_vfail1_this_period=1;  end;


o_dol_at_risk_uvfail=.;u_vfail1_dol_this_period=.;
if t ge 2 and o_dol=1 and tcur{t} ge 2 and uvfail_dol ne 1 then do;
o_dol_at_risk_uvfail=1;
if v{t} gt log10(1000) then do; uvfail_dol = 1;  u_vfail1_dol_this_period=1; end;
end;


* art_monitoring_strategy = 1. Clinical monitoring alone ;
* all coded below, associated with incidence of WHO 3 / 4;


* art_monitoring_strategy = 2. Clinical monitoring with single VL confirmation ;
* takes account of time delay for DBS or plasma measurement of vl, compared with POC ;
* all coded below, associated with incidence of WHO 3 / 4;


* art_monitoring_strategy = 3. Clinical monitoring with VL confirmation ;

if t ge 2 and visit{t}=1 and art_monitoring_strategy=3 and 0.5 <= caldate{t}-date_last_vlm_g1000 <= 1.0 and (artline{t}=1 or int_clinic_not_aw=1) and linefail{t-1}=0 
and 0.5 <= caldate{t}-date_who3_4_event_switch_eval <= 1.0 then do;
	s=uniform(0); 
	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm    = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm    = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm    = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm    = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
	if vm    gt log10(1000) then do;
		if date_v_alert=. then date_v_alert=caldate{t};
		linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t};d1stlfail=caldate{t}; date_last_vlm_g1000 = caldate{t};
		if o_zdv=1 then f_zdv=1;
		if o_3tc=1 then f_3tc=1;
		if o_ten=1 then f_ten=1;
		if o_nev=1 then f_nev=1;
		if o_efa=1 then f_efa=1;
		if o_lpr=1 then f_lpr=1;
		if o_taz=1 then f_taz=1;						
		if o_dar=1 then f_dar=1;
		if o_dol=1 then f_dol=1;
	end;
end;


* art_monitoring_strategy = 7. Clinical monitoring with CD4 confirmation;
* all coded below, associated with incidence of WHO 3 / 4;


* art_monitoring_strategy = 8. CD4 monitoring (6 mthly) alone;

if t ge 2  and visit{t}=1 and art_monitoring_strategy=8 and (artline{t}=1 or int_clinic_not_aw=1) and linefail{t-1}=0 then do;

		if caldate{t}-yrart ge 3 and (time_since_last_cm >= 0.25 or time_since_last_cm =.) then do; s=uniform(0);  * jan15;
		cd4_cost_inc = 1; if s < prob_cd4_meas_done then cm   =(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2;  end;
		if . < cm     < 200 then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2;  cd4_cost_inc = 2;
			if . < conf_measured_c < 200 then do;
				linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t};d1stlfail=caldate{t}; 
				if o_zdv=1 then f_zdv=1;
				if o_3tc=1 then f_3tc=1;
				if o_ten=1 then f_ten=1;
				if o_nev=1 then f_nev=1;
				if o_efa=1 then f_efa=1;
				if o_lpr=1 then f_lpr=1;
				if o_taz=1 then f_taz=1;
				if o_dar=1 then f_dar=1;
				if o_dol=1 then f_dol=1;
			end;
			conf_measured_c=.;   
		end;

		if 1 <= caldate{t}-yrart < 3 and (time_since_last_cm >= 0.5 or time_since_last_cm =.) then do; s=uniform(0); *jan15;
		if s < prob_cd4_meas_done then cm   =(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 1; end;
		if . < cm     < 100 then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 2;
			if . < conf_measured_c < 100 then do;
				linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t};d1stlfail=caldate{t}; 
				if o_zdv=1 then f_zdv=1;
				if o_3tc=1 then f_3tc=1;
				if o_ten=1 then f_ten=1;
				if o_nev=1 then f_nev=1;
				if o_efa=1 then f_efa=1;
				if o_lpr=1 then f_lpr=1;
				if o_taz=1 then f_taz=1;
				if o_dar=1 then f_dar=1;
				if o_dol=1 then f_dol=1;
			end;
			conf_measured_c=.;
		end;
end;


* art_monitoring_strategy = 9. CD4 count monitoring (6 mthly) with single VL confirmation;
* takes account of time delay for DBS or plasma measurement of vl, compared with POC ;

if t ge 2  and visit{t}=1 and art_monitoring_strategy=9 and (artline{t}=1 or int_clinic_not_aw=1) and linefail{t-1}=0 then do;
	
		if (tcur{t} in (12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,
		102,104,106,108,110,112,114,116,118,120,122,124,126,128,130,132,134,136,138,140,142,144,146,148) 
		or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1 and toffart{t} in (2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,
		44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90))) then do; 
			s=uniform(0); 
			if s < prob_cd4_meas_done then cm   =(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 1; 
		end;
		if . < cm     < 200 then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 2;
			if . < conf_measured_c < 200 then do; 
				s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm    = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm    = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm    = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm    = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
				end;
			end; 
			vl_cost_inc = 1; 
			if 		(		(vm_format in (3,4) and vm    gt log10(1000)) 		or		(. < vm_format <= 2 and vm_tm1  gt log10(1000))		) 		then do;
				if date_v_alert=. then date_v_alert=caldate{t};
				linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t};d1stlfail=caldate{t}; 
				if o_zdv=1 then f_zdv=1;
				if o_3tc=1 then f_3tc=1;
				if o_ten=1 then f_ten=1;
				if o_nev=1 then f_nev=1;
				if o_efa=1 then f_efa=1;
				if o_lpr=1 then f_lpr=1;
				if o_taz=1 then f_taz=1;
				if o_dar=1 then f_dar=1;
				if o_dol=1 then f_dol=1;
			end;
		conf_measured_c=.;
		end;

		if (tcur{t} in (4,6,8,10) or (int_clinic_not_aw=1 and 0 < caldate{t}-yrart < 3 and toffart{t} in (2,4,6,8,10))) then do; 
			s=uniform(0); if s < prob_cd4_meas_done then cm   =(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 1; 
		end;
		if . < cm     < 100 then do;
				s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2;cd4_cost_inc = 2;
				if . < conf_measured_c < 100 then do;
					s=uniform(0);	
					if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm    = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm    = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm    = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm    = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
					end;  
				end;
			vl_cost_inc = 1;
			if 		(		(vm_format in (3,4) and vm gt log10(1000)) 		or		(. < vm_format <= 2 and vm_tm1 gt log10(1000))		)  		then do;
				if date_v_alert=. then date_v_alert=caldate{t};
				linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t};d1stlfail=caldate{t}; 
				if o_zdv=1 then f_zdv=1;
				if o_3tc=1 then f_3tc=1;
				if o_ten=1 then f_ten=1;
				if o_nev=1 then f_nev=1;
				if o_efa=1 then f_efa=1;
				if o_lpr=1 then f_lpr=1;
				if o_taz=1 then f_taz=1;
				if o_dar=1 then f_dar=1;
				if o_dol=1 then f_dol=1;
			end;
			conf_measured_c=.;
		end;

end;


* art_monitoring_strategy = 10. CD4 count monitoring (6 mthly) with VL confirmation;

if t ge 2 and visit{t}=1 and art_monitoring_strategy=10 and (artline{t}=1 or int_clinic_not_aw=1) and linefail{t-1}=0 then do;

		if (tcur{t} in (12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,
		102,104,106,108,110,112,114,116,118,120,122,124,126,128,130,132,134,136,138,140,142,144,146,148) 
		or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1 and toffart{t} in (2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,
		44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90)))  and (date_cd4_switch_eval = . or caldate{t}-date_cd4_switch_eval > 0.5)
		then do; s=uniform(0); if s < prob_cd4_meas_done then cm   =(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2;cd4_cost_inc = 1;  end;
		if . < cm     < 200 then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2;cd4_cost_inc = 2;
			if . < conf_measured_c < 200 then do; s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
			if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
			end;  
			end;
			vl_cost_inc = 1; 
			if vm gt log10(1000) then do;
				date_cd4_switch_eval=caldate{t}; date_last_vlm_g1000 = caldate{t};if date_v_alert=. then date_v_alert=caldate{t};
			end;
			conf_measured_c=.;
		end;
		if (tcur{t} in (4,6,8,10) or (int_clinic_not_aw=1 and 0 < caldate{t}-yrart < 3 and toffart{t} in (2,4,6,8,10)))
		and (date_cd4_switch_eval = . or caldate{t}-date_cd4_switch_eval > 0.5) then do; s=uniform(0); 
		if s < prob_cd4_meas_done then cm   =(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2;cd4_cost_inc = 1; end;
		if . < cm     < 100  then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(c{t})+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 2;
			if . < conf_measured_c < 100 then do; s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
		end;  
		end;
		vl_cost_inc = 1; 
			if vm gt log10(1000) then do;
				date_cd4_switch_eval=caldate{t};date_last_vlm_g1000 = caldate{t};if date_v_alert=. then date_v_alert=caldate{t};
			end;
			conf_measured_c=.;
		end;

		if t ge 3 and (artline{t}=1 or int_clinic_not_aw=1) and linefail{t-1}=0 and 0.5 <= caldate{t}-date_cd4_switch_eval <= 1.0 then do;s=uniform(0);
			if s < eff_prob_vl_meas_done then do; 
			if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
			end;  
			vl_cost_inc = 1;
			if vm gt log10(1000) then do;
				if date_v_alert=. then date_v_alert=caldate{t};
				linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t};d1stlfail=caldate{t}; date_last_vlm_g1000 = caldate{t};
				if o_zdv=1 then f_zdv=1;
				if o_3tc=1 then f_3tc=1;
				if o_ten=1 then f_ten=1;
				if o_nev=1 then f_nev=1;
				if o_efa=1 then f_efa=1;
				if o_lpr=1 then f_lpr=1;
				if o_taz=1 then f_taz=1;
				if o_dar=1 then f_dar=1;
				if o_dol=1 then f_dol=1;
			end;
		end;
end;


* art_monitoring_strategy = 150.  viral load monitoring (6m, 12m, annual) - who ;
* takes account of time delay for DBS or plasma measurement of vl, compared with POC ;

if art_monitoring_strategy=150  and visit{t}=1 and (artline{t}=1 or int_clinic_not_aw=1) and linefail{t-1}=0 
and restart{t} ne 1 and restart{t-1} ne 1  and (caldate{t} - date_transition_from_nnrti >= 0.5 or date_transition_from_nnrti =.) and t ge 2 then do;  
	if (caldate{t}-yrart >= 0.5 and time_since_last_vm=.) or (caldate{t}-yrart = 1.0) or (time_since_last_vm >= 0.75) or  (0.25 <= caldate{t}-date_vl_switch_eval <= 1.00 and 
	(caldate&j - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.)) then do; * jan15;
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
		if 0.25 <= caldate{t}-date_vl_switch_eval <= 1.0 then date_conf_vl_measure_done = caldate{t} ;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; 
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=. then date_v_alert=caldate{t};
		end;
	end;

	if (caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold)) or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and vm_tm1 gt log10(vl_threshold))
	then do;
			linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t}; d1stlfail=caldate{t}; 
			if o_zdv=1 then f_zdv=1;
			if o_3tc=1 then f_3tc=1;
			if o_ten=1 then f_ten=1;
			if o_nev=1 then f_nev=1;
			if o_efa=1 then f_efa=1;
			if o_lpr=1 then f_lpr=1;
			if o_taz=1 then f_taz=1;
			if o_dar=1 then f_dar=1;
			if o_dol=1 then f_dol=1;
	end; 
end;



* art_monitoring_strategy = 1500.  viral load monitoring (6m, 12m, annual) + adh{t} > 0.8 based on tdf level test;
* takes account of time delay for DBS or plasma measurement of vl, compared with POC ;

drug_level_test=0;
if art_monitoring_strategy=1500  and visit{t}=1 and (artline{t}=1 or int_clinic_not_aw=1) and linefail{t-1}=0 
and restart{t} ne 1 and restart{t-1} ne 1 and (caldate{t} - date_transition_from_nnrti >= 0.5 or date_transition_from_nnrti =.) and t ge 2 then do;  
	if (caldate{t}-yrart >= 0.5 and time_since_last_vm=.) or (caldate{t}-yrart = 1.0) or (time_since_last_vm >= 0.75) or  (0.25 <= caldate{t}-date_vl_switch_eval <= 1.00 and 
	(caldate{t} - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.)) then do; * jan15;
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
		if 0.25 <= caldate{t}-date_vl_switch_eval <= 1.0 then do; date_conf_vl_measure_done = caldate{t} ; date_drug_level_test = caldate{t};
		drug_level_test=1; end;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; 
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=. then date_v_alert=caldate{t};
		end;
	end;

	if (
	(caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold) and adh{t} > 0.8) 
	or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and vm_tm1 gt log10(vl_threshold) and adh{t-1} > 0.8)
	) 
	then do;
			linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t}; d1stlfail=caldate{t}; 
			if o_zdv=1 then f_zdv=1;
			if o_3tc=1 then f_3tc=1;
			if o_ten=1 then f_ten=1;
			if o_nev=1 then f_nev=1;
			if o_efa=1 then f_efa=1;
			if o_lpr=1 then f_lpr=1;
			if o_taz=1 then f_taz=1;
			if o_dar=1 then f_dar=1;
			if o_dol=1 then f_dol=1;
	end; 
end;





* art_monitoring_strategy = 152. as 150 with 2 yearly viral load monitoring;

if art_monitoring_strategy=152  and visit{t}=1 and (artline{t}=1 or int_clinic_not_aw=1) 
and restart{t} ne 1 and restart{t-1} ne 1 and linefail{t-1}=0 and (caldate{t} - date_transition_from_nnrti >= 0.5 or date_transition_from_nnrti =.) and t ge 2 then do;  
	if (caldate{t}-yrart >= 0.5 and time_since_last_vm=.) or (time_since_last_vm >= 1.75) or  (0.25 <= caldate{t}-date_vl_switch_eval <= 0.5 and 
	(caldate&j - date_conf_vl_measure_done >= 2 or date_conf_vl_measure_done=.)) then do; * jan15;
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
		if 0.25 <= caldate{t}-date_vl_switch_eval <= 0.5 then date_conf_vl_measure_done = caldate{t} ;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; 
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=. then date_v_alert=caldate{t};
		end;
	end;

	if (caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold)) or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and vm_tm1 gt log10(vl_threshold))
	then do;
			linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t}; d1stlfail=caldate{t}; 
			if o_zdv=1 then f_zdv=1;
			if o_3tc=1 then f_3tc=1;
			if o_ten=1 then f_ten=1;
			if o_nev=1 then f_nev=1;
			if o_efa=1 then f_efa=1;
			if o_lpr=1 then f_lpr=1;
			if o_taz=1 then f_taz=1;
			if o_dar=1 then f_dar=1;
			if o_dol=1 then f_dol=1;
	end; 
end;


* art_monitoring_strategy = 153.  viral load monitoring (6m, annual) no confirmation  ;

if art_monitoring_strategy=153  and visit{t}=1 and (artline{t}=1 or int_clinic_not_aw=1) 
and restart{t} ne 1 and restart{t-1} ne 1 and linefail{t-1}=0 and (caldate{t} - date_transition_from_nnrti >= 0.5 or date_transition_from_nnrti =.) and t ge 2 then do;  
	if (caldate{t}-yrart >= 0.5 and time_since_last_vm=.) or (time_since_last_vm >= 0.75) then do; * jan15;
		s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; 
			date_last_vlm_g1000=caldate{t}; 
			if date_v_alert=. then date_v_alert=caldate{t};
			linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t}; d1stlfail=caldate{t}; 
			if o_zdv=1 then f_zdv=1;
			if o_3tc=1 then f_3tc=1;
			if o_ten=1 then f_ten=1;
			if o_nev=1 then f_nev=1;
			if o_efa=1 then f_efa=1;
			if o_lpr=1 then f_lpr=1;
			if o_taz=1 then f_taz=1;
			if o_dar=1 then f_dar=1;
			if o_dol=1 then f_dol=1;
		end;
	end;
		
end;



if ((reg_option in (103 116)) or (reg_option = 104 and art_monitoring_strategy ne 1500)) and o_dol=1 and p_taz=1 and f_dol_tm1 ne 1 and restart{t} ne 1 and restart{t-1} ne 1 and t ge 2 then do; 
	if (time_since_last_vm >= 0.75) and (caldate&j - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.) 
and (caldate{t} - date_transition_from_pi >= 0.5 or date_transition_from_pi =.)
then do; 
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
		if 0.25 <= caldate{t}-date_vl_switch_eval <= 1.0 then date_conf_vl_measure_done = caldate&j ;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; hhh=1;
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=.  then date_v_alert=caldate{t};
		end;
	end;
	time_since_last_vm_prev=time_since_last_vm;

	if (caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold)) or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and vm_tm1 gt log10(vl_threshold))
	then do;
			linefail{t}=2;r_fail_2=c_totmut{t}; cd4_fail1_2=c{t}; vl_fail_2=v{t}; d2ndlfail=caldate{t}; 
			if o_zdv=1 then f_zdv=1;
			if o_3tc=1 then f_3tc=1;
			if o_ten=1 then f_ten=1;
			if o_nev=1 then f_nev=1;
			if o_efa=1 then f_efa=1;
			if o_lpr=1 then f_lpr=1;
			if o_taz=1 then f_taz=1;
			if o_dar=1 then f_dar=1;
			if o_dol=1 then f_dol=1;
	end; 
end;


if (reg_option = 117 or (reg_option = 104 and art_monitoring_strategy = 1500) or reg_option = 118 or reg_option = 119) and o_dol=1 and p_taz=1 and f_dol_tm1 ne 1 and restart{t} ne 1 and restart{t-1} ne 1 and t ge 2 then do; 
	if (time_since_last_vm >= 0.75) and (caldate&j - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.) 
and (caldate{t} - date_transition_from_pi >= 0.5 or date_transition_from_pi =.)
then do; 
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
		if 0.25 <= caldate{t}-date_vl_switch_eval <= 1.0 then do; date_conf_vl_measure_done = caldate&j ;date_drug_level_test = caldate{t};
		drug_level_test=1;end;  
		end;
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; hhh=1;
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=.  then date_v_alert=caldate{t};
		end;
	end;
	time_since_last_vm_prev=time_since_last_vm;
	if (
	(caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold) and adh{t} > 0.8) 
	or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and vm_tm1 gt log10(vl_threshold) and adh{t-1} > 0.8)
	) 
	then do;
			linefail{t}=2;r_fail_2=c_totmut{t}; cd4_fail1_2=c{t}; vl_fail_2=v{t}; d2ndlfail=caldate{t}; 
			if o_zdv=1 then f_zdv=1;
			if o_3tc=1 then f_3tc=1;
			if o_ten=1 then f_ten=1;
			if o_nev=1 then f_nev=1;
			if o_efa=1 then f_efa=1;
			if o_lpr=1 then f_lpr=1;
			if o_taz=1 then f_taz=1;
			if o_dar=1 then f_dar=1;
			if o_dol=1 then f_dol=1;
	end; 
end;





* measure viral load on second line (in fact, after failing first line) ; 
if reg_option ne 103 and reg_option ne 104  and reg_option ne 116  and reg_option ne 117  and reg_option ne 118 and reg_option ne 119 and f_dol ne 1 then do;   
* if reg_option ne 103 and reg_option ne 104 and f_dol ne 1 then we keep monitoring as coded 
above at art monitoring strategy 150; * may18;
if sv_secondline=1 and visit{t}=1 and linefail{t} ge 1 and restart{t} ne 1 and restart{t-1} ne 1 and t ge 2 then do;  
	if time_since_last_vm >= 0.75 or time_since_last_vm = . then do; 
		s=uniform(0);  if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
		vl_cost_inc=1;
		end;  
		end;
end;
end;



if res_test_6m_if_vlg1000=1 and t ge 2 then do;  * last_vm_gt_1000 only defined while linefail = 0;
	
	if visit{t}=1 and 
	(caldate{t} - yrart = 0.50 and ( onart{t} = 1 or int_clinic_not_aw=1 )) then do;s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1; end;
			if vm gt log10(1000) then do; res_test=1; if date_v_alert=. then date_v_alert=caldate{t};end;
			if ((o_nev=1 or o_efa=1 or (int_clinic_not_aw=1 and (mr_nev=1 or mr_efa=1))) 
			and (c_rt103m=1 or c_rt181m=1 or c_rt190m=1) ) and vm gt log10(1000) then do;
			linefail{t}=1;r_fail=c_totmut{t}; d1stlfail=caldate{t}; 
			if o_zdv=1 then f_zdv=1;
			if o_3tc=1 then f_3tc=1;
			if o_ten=1 then f_ten=1;
			if o_nev=1 then f_nev=1;
			if o_efa=1 then f_efa=1;
			if o_lpr=1 then f_lpr=1;
			if o_taz=1 then f_taz=1;
			if o_dar=1 then f_dar=1;
			if o_dol=1 then f_dol=1;
			end; goto ff13;

ff13: end;


* ------------------------------------------------------------------------------------------------------- ;

if naive{t}=1 then do; artline{t}=.; linefail{t}=.;end;


* MEASURED CD4 AT RESTART;
	if restart{t}=1 and cm    ne . then  measured_cd4_restart=cm   ;


	* DETERMINE LEVEL OF RESISTANCE TO EACH DRUG:

* 3tc;
if e_rt65m=1 or e_rt151m=1 then r_3tc=0.25;
if e_rt184m=1                 then r_3tc=0.75;  
if zero_3tc_activity_m184m=1 and (e_rt65m=1 or e_rt151m=1) then r_3tc=1.00;


* zdv;
if 1 <= e_rttams < 3 and (o_3tc=0 )                  then do; r_zdv=0.5 ;  end;
if 3 <= e_rttams < 5 and (o_3tc=0 )                  then do; r_zdv=0.75;  end;
if 5 <= e_rttams     and (o_3tc=0 )                  then do; r_zdv=1.00;  end;
if 1 <= e_rttams < 3 and (o_3tc=1) and e_rt184m=1 then do; r_zdv=0.25;  end;
if 3 <= e_rttams < 5 and (o_3tc=1) and e_rt184m=1 then do; r_zdv=0.5 ;  end;
if 5 <= e_rttams     and (o_3tc=1) and e_rt184m=1 then do; r_zdv=0.75;  end;
if 1 <= e_rttams < 3 and (o_3tc=1) and e_rt184m=0 then do; r_zdv=0.5 ;  end;
if 3 <= e_rttams < 5 and (o_3tc=1) and e_rt184m=0 then do; r_zdv=0.75;  end;
if 5 <= e_rttams     and (o_3tc=1) and e_rt184m=0 then do; r_zdv=0.75;  end;
if e_rt151m=1 										   then do; r_zdv=0.75;  end;
if e_rt65m=1 										   then do;                 end;


* ten;
if e_rt65m=0 and 2 <= e_rttams <= 3 and ((o_3tc=0) or  (o_3tc=1   and e_rt184m=0)) then do; r_ten=0.5 ; end;
if e_rt65m=0 and 4 <= e_rttams      and ((o_3tc=0) or ((o_3tc=1 ) and e_rt184m=0)) then do; r_ten=0.75; end;
if e_rt65m=0 and 2 <= e_rttams <= 3 and  (o_3tc=1 )                  and e_rt184m=1   then do; r_ten=0.5 ; end;
if e_rt65m=0 and 4 <= e_rttams      and  (o_3tc=1 )                  and e_rt184m=1   then do; r_ten=0.5 ; end;
if e_rt65m=1  																				  then do; r_ten=0.75 ; end;
if zero_tdf_activity_k65r=1 and e_rt65m=1 then r_ten=1.00 ; 


*NNRTIs;
if e_rt181m=1 then do; 
	r_nev=1.0; r_efa=0.75; 
	if nnrti_res_no_effect = 0.25 then do; 
		r_efa=0.75; r_nev=1.0; 
	end; 
	if nnrti_res_no_effect = 0.5 then do; 
		r_efa=0.5; r_nev=0.5; 
	end; 
	if nnrti_res_no_effect = 0.75 then do; 
		r_efa=0.25; r_nev=0.25; 
	end; 
end; 

if e_rt190m=1 then do; 
	r_nev=1.0; r_efa=0.75; 
	if nnrti_res_no_effect = 0.25 then do; 
		r_efa=0.75; r_nev=1.0; 
	end;
	if nnrti_res_no_effect = 0.5 then do; 
		r_efa=0.5; r_nev=0.5; 
	end;
	if nnrti_res_no_effect = 0.75 then do; 
		r_efa=0.25; r_nev=0.25; 
	end; 
end;

if e_rt103m=1 then do; 
	r_nev=1.0; r_efa=1.0;  
	if nnrti_res_no_effect = 0.25 then do; 
		r_efa=0.75; r_nev=0.75; 
	end; 
	if nnrti_res_no_effect = 0.5 then do; 
		r_efa=0.5; r_nev=0.5; 
	end; 
	if nnrti_res_no_effect = 0.75 then do; 
		r_efa=0.25; r_nev=0.25; 
	end;
end; 

if nnrti_res_no_effect = 0.75 then r_efa = min(0.25,r_efa); 

if nnrti_res_no_effect = 1 then r_efa=0.0;


*PIs;

*lpr;
	if e_pr47m=1 then r_lpr=0.75;
	if e_pr32m+e_pr76m+e_pr82m = 1 and e_pr47m=0 then r_lpr=0.25;

	if 2 <= e_pr46m+e_pr82m+ e_pr84m+e_pr90m < 4 then do;
	r_lpr=max(r_lpr,0.25);
	end;

	if e_pr32m+e_pr76m+e_pr82m = 2 and e_pr47m=0 then r_lpr=0.5;

	if e_pr46m+e_pr82m+ e_pr84m+e_pr90m = 4 then do;
	r_lpr=max(r_lpr,0.50);
	end;

	if e_pr32m+e_pr76m+e_pr82m = 3 and e_pr47m=0 then r_lpr=0.75;
	if e_pr32m+e_pr47m+e_pr76m+e_pr82m = 4 then r_lpr=1.00; 


*taz;  
	if 1 <= (e_pr32m+e_pr46m+e_pr54m+e_pr82m+e_pr90m) < 4 							 then r_taz=0.5;
	if (e_pr50lm=1 or e_pr84m=1 or e_pr88m=1) 												 then r_taz=1.0;
	if      (e_pr32m+e_pr46m+e_pr54m+e_pr82m+e_pr90m) >= 4 							 then r_taz=1.0;


*dar;  
      if e_pr32m+e_pr47m+e_pr50vm+e_pr54m+e_pr76m+e_pr84m  = 2 then r_dar=0.25;
      if e_pr32m+e_pr47m+e_pr50vm+e_pr54m+e_pr76m+e_pr84m  = 3 then r_dar=0.5;
      if e_pr32m+e_pr47m+e_pr50vm+e_pr54m+e_pr76m+e_pr84m >= 4 then r_dar=0.75;


* dol;
      if (e_inpm=1 and e_insm=1) then r_dol=1.0;
      if (e_inpm=1 and e_insm=0) then r_dol=0.75;
      if (e_inpm=0 and e_insm=1) then r_dol=0.25;



	* DEFINE NACTIVE - number of active drugs in the regimen ;

	nactive{t}=nod{t}-((o_zdv*r_zdv)+(o_3tc*r_3tc)+(o_ten*r_ten)
	                  +(o_dar*r_dar)+(o_efa*r_efa)+(o_nev*r_nev)+(o_taz*r_taz)+(o_lpr*r_lpr)+(o_dol*r_dol));

	* what if PI/r worth more than 1.0 drugs ?;
	if o_lpr=1 and pir_higher_potency=1 then nactive{t}=nactive{t}+ (1-r_lpr);
	if o_dar=1 and pir_higher_potency=1 then nactive{t}=nactive{t}+ (1-r_dar);
	if o_taz=1 and pir_higher_potency=1 then nactive{t}=nactive{t}+ (1-r_taz);


	* dol_higher_potency;
	if o_dol=1 and dol_higher_potency=1 then nactive{t}=nactive{t}+ (1-r_dol);
	if o_dol=1 and dol_higher_potency=0.5 then nactive{t}=nactive{t}+ (0.5*(1-r_dol));
	if o_dol=1 and dol_higher_potency=0.25 then nactive{t}=nactive{t}+ (0.25*(1-r_dol));

	* added may 2019 in response to advance results - now using potency of 1.5 for both efa and dol;
	if o_efa=1 then nactive{t}=nactive{t}+ (0.5*(1-r_efa)); 

	nactive{t} = round(nactive{t},0.25);


	* what if is over-estimate actual proportionate drug activity ?;
	nactive{t}=nactive{t}-is_red_activity;
	if nactive{t} < 0 then nactive{t}=0;

	if nod{t}=0 then nactive{t}=.;

	* date of first having resistance (intermediate or resistant) to at least one drug;
	if res_drug=. then do;
		if r_zdv >= 0.5 or  r_3tc  >= 0.5 or  r_dar >= 0.5 or   r_efa >= 0.5 or r_nev >= 0.5 or  
		r_ten >= 0.5 or r_lpr ge 0.5  or r_taz ge 0.5 or   r_dol >= 0.5 then res_drug=caldate{t};
	end;


	* resistance to first line drugs at start of line2;

	res_1stline_startline2=.;
	if caldate{t}=date_line2 > . then do;
	res_1stline_startline2=0; if r_zdv >= 0.5 or r_3tc  >= 0.5 or  r_efa >= 0.5 or r_nev >= 0.5 or 
	r_ten >= 0.5 then res_1stline_startline2=1;
	end;



	* nactive at start line2;

	if caldate{t}=date_line2 > . then nactive_line2=nactive{t};
	
	* nactive at start of art;
	if caldate{t}=yrart then nactive_start_art = nactive{t};

		* REGISTERING OF NEW CURRENT TOXICITY AND CONTINUATION OF EXISTING TOXICITY;
	* ? ~~~~~~~~~~~~~~ this should depend on adherence - higher adherence, more toxicity;


	c_nau=0;
	r=uniform(0); if . < caldate{t}-yrart < 1 then r=r/5.0; * increased risk of nausea in first year;
	if t ge 2 and (o_taz=1 or o_dar=1)               then do; if c_nau_tm1=0 
	and r < (0.01 * double_rate_gas_tox_taz) then c_nau=1; if c_nau_tm1=1 and r < 0.5 then c_nau=1;end;
	if t ge 2 and (o_zdv=1 or o_lpr=1) then do; if c_nau_tm1=0 and r < 0.03 then c_nau=1; if c_nau_tm1=1 and r < 0.5 then c_nau=1;end;

	c_dia=0;
	r=uniform(0);if . < caldate{t}-yrart < 1 then r=r/2.5; * increased risk of diarrhoea in first year;
	r=uniform(0); if . < caldate{t}-yrart < 1 then r=r/2.5;

	if t ge 2 and o_lpr=1 then do; if c_dia_tm1=0 and r < 0.02 then c_dia=1; if c_dia_tm1=1 and r < 0.5 then c_dia=1;end;
	r=uniform(0);if . < caldate{t}-yrart < 1 then r=r/2.5;
	if t ge 2 and (o_taz=1  or o_dar=1) then do; 	if c_dia_tm1=0 and r < (0.01 * double_rate_gas_tox_taz) then c_dia=1; 
	if c_dia_tm1=1 and r < 0.5 then c_dia=1;end;

	c_ras=0;
	r=uniform(0);
	if t ge 3 and (o_efa=1 and o_efa_tm2 = 0 and r < 0.03 ) then c_ras=1;
	if t ge 3 and (o_nev=1 and o_nev_tm2 = 0 and r < 0.10 ) then c_ras=1;

	if tox_weightg_dol=1 then do;
	* note  ;
	r=uniform(0);
	if t ge 3 and (o_dol=1 and 0 < (caldate{t} - date_start_dol) <= 1 and r < 0.1 ) then c_weightg=1;
	if o_dol ne 1 or (caldate{t} - date_start_dol) > 1 then c_weightg = 0;
	end;

	* note that increased mortality risk due to weight rise on dol is independent of weightg as a tox (potentially leading to discontinuation)
	the former is about self assessment of body image and how that affects drug persistence - the latter is about people who already have a
	bmi above 23 for whom a rise could lead to increased risk of death (eg resulting fron diabetes) ;

	if incr_mort_risk_dol_weightg_i = . then incr_mort_risk_dol_weightg_i = 1.00 ;	* _i11 ;
	r = uniform(0);
	if caldate{t} = date_start_dol and r < prop_bmi_ge23 then do;  * may 2019  _i4 ;
			bmi_gt23_start_dol=1; * assume 50% of people have bmi > 23 (for whom a weight rise could lead to increased mortality risk) ;
			if incr_mort_risk_dol_weightg = 1 then incr_mort_risk_dol_weightg_i = 1.00 ;  * _i11_ ;
			if incr_mort_risk_dol_weightg = 1.1 then incr_mort_risk_dol_weightg_i = 1.03 ;  
			if incr_mort_risk_dol_weightg = 2 then incr_mort_risk_dol_weightg_i = 1.05 ;  
			if incr_mort_risk_dol_weightg = 2.1 then incr_mort_risk_dol_weightg_i = 1.07 ;
 			if incr_mort_risk_dol_weightg = 2.2 then incr_mort_risk_dol_weightg_i = 1.10 ;  
			if incr_mort_risk_dol_weightg = 3 then incr_mort_risk_dol_weightg_i = 1.15 ;  
			if incr_mort_risk_dol_weightg = 4 then incr_mort_risk_dol_weightg_i = 1.25 ;  
	end;

	bmi_gt23_start_dol_wwc=0;
	if gender=2 and age{t} < 55 and want_no_more_children ne 1 and bmi_gt23_start_dol = 1 then bmi_gt23_start_dol_wwc=1;


	c_cns=0;
	r=uniform(0);
	if t ge 2 and o_efa=1 then do;
		if c_cns_tm1=0 and r < 0.1 and tcur{t} < 4 then c_cns=1;
		if c_cns_tm1=1 and r < 0.8 and tcur{t} < 4 then c_cns=1;
		if c_cns_tm1=1 and tcur{t} >= 4 and r < 0.90 then c_cns=1;
	end;


	rr=uniform(0);
	if t ge 2 and o_dol=1 then do;  * take incidence as half for efa but with same persistence rate; * apr16; * changed since nih talk; 
		if c_cns_tm1=0 and rr < (0.05 * rel_dol_tox) and tcur{t} < 4 then c_cns=1;
		if c_cns_tm1=1 and rr < 0.4 and tcur{t} < 4 then c_cns=1;
		if c_cns_tm1=1 and tcur{t} >= 4 and rr < 0.90 then c_cns=1;
	end;

	* no c_lip=0 because stays once have it even if stop drugs;
	r=uniform(0);
	if o_zdv=1 and r < 0.015 then c_lip=1;
	
	c_hep=0;
	r=uniform(0);
	if  o_nev=1 and tcur{t} <= 2 and r < 0.02 then c_hep=1;
	
	c_otx=0;
	r=uniform(0);
	if . < caldate{t}-yrart < 1 then r=r/1.5; * increased risk of otox in first year;
	if onart{t}=1 and r < 0.03 then c_otx=1;
		
	c_ane=0;
	r=uniform(0); if . < caldate{t}-yrart < 1 then r=r/1.5; * increased risk of ane in first year;
	if t ge 2 and o_zdv and c_ane_tm1 =0 and r < 0.03 then c_ane=1;
	if t ge 2 and o_zdv and c_ane_tm1 =1 and r < 0.2 then c_ane=1;
	
	c_head=0;
	d=uniform(0); if . < caldate{t}-yrart < 1 then d=d/1.5; * increased risk of head in first year;
	if t ge 2 and o_zdv and c_head_tm1 =0 and d < 0.1 then c_head=1;
	if t ge 2 and o_zdv and c_head_tm1 =1 and d < 0.4 then c_head=1;
	
	c_lac=0;
	d=uniform(0); if o_zdv=1 and d < 0.0002 then c_lac=1;

	e=uniform(0);
	c_neph=0;
	if t ge 2 and o_ten=1 and c_neph_tm1=0 and e < 0.0035 then c_neph=1;
	if t ge 2 and o_ten=1 and c_neph_tm1=1 then c_neph=1;
	if t ge 2 and o_ten=0 and c_neph_tm1=1 and e < 0.9 then c_neph=1;

	c_tox{t}=0;
	if c_nau=1 or c_lip = 1 or c_pen = 1 or c_ras = 1 or c_cns = 1 or c_lac=1 or c_ane=1
	or c_hep = 1 or c_dia = 1 or c_otx = 1 or c_neph = 1 or c_weightg=1	then c_tox{t}=1;



	* PCP prophylaxis;

	d=uniform(0);

	if t ge 2 then pcp_p{t}=pcp_p{t-1};

	if hiv_monitoring_strategy=2 then do;
		if visit{t}=1 and . < cm    < 350 and d lt 0.8 and caldate{t}>=1996 then pcp_p{t}=1;
	end;

	r=uniform(0);
	if visit{t}=1 and (who3_event{t}=1 or adc{t}=1) and r lt 0.8 and caldate{t}>=1996 then pcp_p{t}=1;

	if t ge 2 and tcur{t} ge 8 and ((artline{t}=1 and linefail{t}=0) or (artline{t}=2 and linefail{t}=1)) and who3_event{t}=0 
	and who3_event{t-1}=0 and adc{t}=0 and adc{t-1}=0 then pcp_p{t}=0;

	if pcp_p{t-1}=1 and cm    > 350 then pcp_p{t}=0;


	* rates used to assess risk of ARC, AIDS and AIDS death;
	if        c{t} > 650 then base_rate=0.002;
	if 500 <= c{t} < 650 then base_rate=0.01;
	if 450 <= c{t} < 500 then base_rate=0.013;
	if 400 <= c{t} < 450 then base_rate=0.016;
	if 375 <= c{t} < 400 then base_rate=0.02 ;
	if 350 <= c{t} < 375 then base_rate=0.022;
	if 325 <= c{t} < 350 then base_rate=0.025;
	if 300 <= c{t} < 325 then base_rate=0.03;
	if 275 <= c{t} < 300 then base_rate=0.037;
	if 250 <= c{t} < 275 then base_rate=0.045;
	if 225 <= c{t} < 250 then base_rate=0.055;
	if 200 <= c{t} < 225 then base_rate=0.065;
	if 175 <= c{t} < 200 then base_rate=0.08;
	if 150 <= c{t} < 175 then base_rate=0.1 ;
	if 125 <= c{t} < 150 then base_rate=0.13;
	if 100 <= c{t} < 125 then base_rate=0.17;
	if 90  <= c{t} < 100 then base_rate=0.20;
	if 80  <= c{t} < 90 then base_rate=0.23;
	if 70  <= c{t} < 80 then base_rate=0.28;
	if 60  <= c{t} < 70 then base_rate=0.32;
	if 50  <= c{t} < 60 then base_rate=0.40;
	if 40  <= c{t} < 50 then base_rate=0.50;
	if 30  <= c{t} < 40 then base_rate=0.80;
	if 20  <= c{t} < 30 then base_rate=1.10;
	if 10  <= c{t} < 20 then base_rate=1.80;
	if 0   <= c{t} < 10 then base_rate=2.50;


* independent effect of vl;

	if v{t} < 3 then base_rate=base_rate*0.2;
	if 3 <= v{t} < 4 then base_rate=base_rate*0.3;
	if 4 <= v{t} < 4.5 then base_rate=base_rate*0.6;
	if 4.5 <= v{t} < 5 then base_rate=base_rate*0.9;
	if 5 <= v{t} < 5.5 then base_rate=base_rate*1.2;
	if 5.5 <= v{t} then base_rate=base_rate*1.6;
	
	* risk increases with age;
	base_rate = base_rate*((age{t}/38)**1.2);


	* for sensitivity analysis - fold change in base rate;
	base_rate = base_rate * fold_change_in_risk_base_rate;

	* occurrence of who 3 symptoms;
	who3_event{t}=0; tb{t}=0;
	if t ge 2 and dead{t}=0 then do; 
		who3_rate=base_rate*fold_incr_who3;
		* assume higher risk than of who4, but with same predictors;
		if nod{t} ge 3 then who3_rate = 0.6*who3_rate;
		if nod{t} = 2 then who3_rate = 0.85*who3_rate;
		if nod{t} = 1 then who3_rate = 0.9*who3_rate;
		if nod{t} = 0 then who3_rate = 1*who3_rate;
		who3_risk3 = 1 - exp (-0.25*who3_rate);
		x5=uniform(0);
		if x5 le who3_risk3 then do; 
			who3_event{t}=1;


* ------------------------------------------------------------------------------------------------------- ;
f=uniform(0);

		if t ge 3 and art_monitoring_strategy = 1 and f < prob_who3_diagnosed then do;
					if ((artline{t}=1 and tcur{t} ge 4) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and . < caldate{t}-date_last_who3 < 1 
					and linefail{t-1}=0 then do;
						linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t}; d1stlfail=caldate{t}; 
						if o_zdv=1 then f_zdv=1;
						if o_3tc=1 then f_3tc=1;
						if o_ten=1 then f_ten=1;
						if o_nev=1 then f_nev=1;
						if o_efa=1 then f_efa=1;
						if o_lpr=1 then f_lpr=1;
						if o_dar=1 then f_dar=1;
						if o_taz=1 then f_taz=1;
						if o_dol=1 then f_dol=1;
					end;
		end;


		if t ge 3 and art_monitoring_strategy=2  and f < prob_who3_diagnosed then do;
				if ((artline{t}=1 and tcur{t} ge 4) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and . < caldate{t}-date_last_who3 < 1 and linefail{t-1}=0 then do; 
			s=uniform(0);s=s/0.8; * lower probability that vl measure is done if it is triggered by CD4 or clinical disease; if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
	* take account of time delay with dbs or plasma compared with poc;
		if 	((vm_format in (3,4) and vm gt log10(1000)) 	or	(. < vm_format <= 2 and vm_tm1 gt log10(1000))	) 
		then do;
						if date_v_alert=. then date_v_alert=caldate{t};
						linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t}; d1stlfail=caldate{t}; 
						if o_zdv=1 then f_zdv=1;
						if o_3tc=1 then f_3tc=1;
						if o_ten=1 then f_ten=1;
						if o_nev=1 then f_nev=1;
						if o_efa=1 then f_efa=1;
						if o_lpr=1 then f_lpr=1;
						if o_dar=1 then f_dar=1;
						if o_taz=1 then f_taz=1;
						if o_dol=1 then f_dol=1;
					end;
				end;
		end;


		if t ge 3 and art_monitoring_strategy = 3 and f < prob_who3_diagnosed  then do;
				if ((artline{t}=1 and tcur{t} ge 4) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and . < caldate{t}-date_last_who3 < 1 and linefail{t-1}=0 and 
				((caldate{t}-date_who3_4_event_switch_eval > 0.5) or date_who3_4_event_switch_eval=.) then do; 
			s=uniform(0);s=s/0.8; * lower probability that vl measure is done if it is triggered by CD4 or clinical disease; 			if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
					if vm gt log10(1000) then do; 
						if date_v_alert=. then date_v_alert=caldate{t};
						date_last_vlm_g1000 = caldate{t}; date_who3_4_event_switch_eval=caldate{t};
					end;
				end;
		end;


		
		if artline{t}=1 and tcur{t} ge 4 and linefail{t-1}=0 then date_last_who3=caldate{t};
		if artline{t}=2 and tcur{t} ge 4 and linefail{t-1}=1 then first_who3_line2=1;


			who3_{t}=1;who3_date=caldate{t};cd4_who3_=c{t};timewho3_=who3_date-caldate1;
			y=uniform(0); if y < 0.2 then do; tb{t}=1; if tb_date=. then tb_date=caldate{t}; end;

		end;
	end;


	if c{t} < 200 then c_lt200=1;else c_lt200=0;

	* occurrence of who4 diseases;
	adc{t}=0;
	adc_diagnosed=.; adc_naive=.; adc_line1_lf0=.; adc_line1_lf1=.; adc_line2_lf1=.; adc_line2_lf2=.; adc_artexpoff=.;
	if  dead{t}=0 then do;
		rate=base_rate;
		if t ge 2 and (tb{t}=1 or tb{t-1}=1) then rate=base_rate;
	
		if pcp_p{t}=1 then rate=rate*0.8;
		if nod{t} ge 3 then rate = 0.6 *rate;
		if nod{t} = 2 then rate = 0.85*rate;
		if nod{t} =1 then rate = 0.9*rate;
		risk3 = 1 - exp (-0.25*rate);
		x2=uniform(0); if x2 le risk3 then do;
			adc{t}=1;  
			adc_diagnosed=0; if registd{t}=1 then adc_diagnosed=1;  adc_naive=0; if naive{t}=1 then adc_naive=1;
			adc_line1_lf0=0; if artline{t}=1 and linefail{t}=0 then adc_line1_lf0 =1;
			adc_line1_lf1=0; if artline{t}=1 and linefail{t}=1 then adc_line1_lf1 =1; adc_line2_lf1=0; if artline{t}=2 and linefail{t}=1 then adc_line2_lf1 =1;
			adc_line2_lf2=0; if artline{t}=2 and linefail{t}=2 then adc_line2_lf2 =1; adc_artexpoff=0; if naive{t}=0 and onart{t}=0 then adc_artexpoff =1;

* ------------------------------------------------------------------------------------------------------- ;
f=uniform(0);

			if t ge 3 and art_monitoring_strategy = 1  and f < prob_who4_diagnosed  then do;
					if ((artline{t}=1 and tcur{t} ge 4) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and linefail{t-1}=0 then do;
						linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t}; d1stlfail=caldate{t}; 
						if o_zdv=1 then f_zdv=1;
						if o_3tc=1 then f_3tc=1;
						if o_ten=1 then f_ten=1;
						if o_nev=1 then f_nev=1;
						if o_efa=1 then f_efa=1;
						if o_lpr=1 then f_lpr=1;
						if o_dar=1 then f_dar=1;
						if o_taz=1 then f_taz=1;
						if o_dol=1 then f_dol=1;
					end;
			end;
	
			if t ge 3 and art_monitoring_strategy=2  and f < prob_who4_diagnosed then do;
					if ((artline{t}=1 and tcur{t} ge 4) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and linefail{t-1}=0 then do;
					s=uniform(0);s=s/0.8; * lower probability that vl measure is done if it is triggered by CD4 or clinical disease;  	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
		* takes account of time delay with dbs or plasma compared with poc;
		if ((vm_format in (3,4) and vm gt log10(1000)) or (. < vm_format <= 2 and vm_tm1 gt log10(1000))) then do;
							if date_v_alert=. then date_v_alert=caldate{t};
							linefail{t}=1;r_fail=c_totmut{t}; cd4_fail1=c{t}; vl_fail1=v{t}; d1stlfail=caldate{t}; 
							if o_zdv=1 then f_zdv=1;
							if o_3tc=1 then f_3tc=1;
							if o_ten=1 then f_ten=1;
							if o_nev=1 then f_nev=1;
							if o_efa=1 then f_efa=1;
							if o_lpr=1 then f_lpr=1;
							if o_dar=1 then f_dar=1;
							if o_taz=1 then f_taz=1;
							if o_dol=1 then f_dol=1;
						end;
					end;
			end;


		if t ge 3 and art_monitoring_strategy = 3  and f < prob_who4_diagnosed then do;
				if ((artline{t}=1 and tcur{t} ge 4) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and linefail{t-1}=0 
				and ((caldate{t}-date_who3_4_event_switch_eval > 0.5) or date_who3_4_event_switch_eval=.) then do; 
					s=uniform(0);s=s/0.8; * lower probability that vl measure is done if it is triggered by CD4 or clinical disease; 	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,v{t}+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,v{t}+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,v{t}+(normal(0)*0.22)) ; vm = (0.5 * v{t}) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-v{t}))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
					if vm gt log10(1000) then do; 
						if date_v_alert=. then date_v_alert=caldate{t};
						date_last_vlm_g1000 = caldate{t}; 
						date_who3_4_event_switch_eval=caldate{t};
					end;
				end;
			end;


if who4_{t}=0 then do; 
				who4_{t}=1; who4_date=caldate{t};cd4_who4_=c{t};vl_who4_=v{t}; 
				naive_who4_=naive{t};x4v_who4_=x4v{t};artwho4_=onart{t};timewho4_=who4_date-caldate1;
		end;
	end;
end;

	who4_time = who4_date-date1pos;


* latest measured cd4 and vl;
if cm    ne . then do; latest_cm = cm   ; date_latest_cm=caldate{t}; end;
if vm ne . then do; latest_vm = vm; date_latest_vm=caldate{t}; end;



	* DEATH - causes:  who4=1 / non-HIV =2 ;
	
	if dead{t}=0 then do;

	dead_diagnosed=.; dead_naive=.; dead_onart=.; dead_line1_lf0=.; dead_line1_lf1=.; dead_line2_lf1=.; dead_line2_lf2=.; dead_artexpoff=.; dead_nn=.;dead_pir=.;
	dead_adc=.;
	dead_6m_onart=.;dead_12m_onart=.;dead_24m_onart=.;dead_36m_onart=.;

		hiv_death_rate=base_rate*fold_decr_hivdeath;

		incr_death_rate_tb_ = incr_death_rate_tb; incr_death_rate_adc_ = incr_death_rate_adc;
		if visit{t}=1 and (sv ne 1 or (. < adh{t} < 0.8 and onart{t}=1)) then do; * so lower death rate if under care when adc occurs, unless under simplified visits 
		and poorly adherent to art (because in that situation not really visiting clinicians/nurses at most visits) - reason for the poor adh condition
		is that the people who are on simplified visits but non adherent or interrupted are close to being lost;	
			incr_death_rate_tb_ = incr_death_rate_tb / 1.5; incr_death_rate_adc_ = incr_death_rate_adc / 1.5; 
		end;  * note visit is not set to 1 above just because adc has occurred, although registd  is set to 1;    

		if t ge 2 and (tb{t}=1 or tb{t-1}=1) and who4_{t} = 0 then hiv_death_rate = hiv_death_rate*incr_death_rate_tb_;
		if adc{t}=1 then hiv_death_rate = hiv_death_rate*incr_death_rate_adc_;

		if pcp_p{t}=1  then hiv_death_rate = hiv_death_rate*0.8;
		if nod{t} ge 3 then hiv_death_rate = 0.6 * hiv_death_rate;
		if nod{t} = 2 then  hiv_death_rate = 0.85* hiv_death_rate;
		if nod{t} = 1 then  hiv_death_rate = 0.9 * hiv_death_rate;
		if nod{t} = 0 then  hiv_death_rate = 1.0 * hiv_death_rate;
		dwho4_ri3 = 1 - exp(-0.25*hiv_death_rate); x3=uniform(0);
		if x3 le dwho4_ri3 then do;

			rdcause=1;

* some of these deaths are related to CD4 but wont go down as who4_ related (eg other cancers, but not incl liver death)
so a proportion (15%) are classified as non-who4_;
			dead{t}=1; death=caldate{t}; timedead=death-infection; cd4_dead=c{t};agedeath=age{t};

			dead_diagnosed=0; if registd{t}=1 then dead_diagnosed=1;  dead_naive=0; if naive{t}=1 then dead_naive=1;
			dead_onart=0; if onart{t}=1 then dead_onart=1; dead_line1_lf0=0; if artline{t}=1 and linefail{t}=0 then dead_line1_lf0 =1;
			dead_line1=0; if artline{t}=1 then dead_line1 =1;  dead_line2=0; if artline{t}=2 then dead_line2 =1;
			dead_line1_lf1=0; if artline{t}=1 and linefail{t}=1 then dead_line1_lf1 =1; dead_line2_lf1=0; if artline{t}=2 and linefail{t}=1 then dead_line2_lf1 =1;
			dead_line2_lf2=0; if artline{t}=2 and linefail{t}=2 then dead_line2_lf2 =1; dead_artexpoff=0; if naive{t}=0 and onart{t}=0 then dead_artexpoff =1;
			dead_nn=0; if o_nev=1 or o_efa=1 then dead_nn=1; dead_pir=0; if o_lpr=1 or o_dar=1  or o_taz=1 then dead_pir=1; dead_adc=0; if adc{t}=1 then dead_adc=1;
			dead_line1_vlg500=0; if artline{t}=1 and v{t} ge 2.7 then dead_line1_vlg500=1;
			dead_line2_vlg500=0; if artline{t}=2 and v{t} ge 2.7 then dead_line2_vlg500=1;
			dead_artexp=0; if naive{t}=0 then dead_artexp=1;
			
			dead_6m_onart=0; if onart{t}=1 and . lt caldate{t}-yrart le 0.5 then dead_6m_onart=1;
			dead_12m_onart=0;if onart{t}=1 and . lt caldate{t}-yrart le 1   then dead_12m_onart=1;
			dead_24m_onart=0;if onart{t}=1 and . lt caldate{t}-yrart le 2   then dead_24m_onart=1;
			dead_36m_onart=0;if onart{t}=1 and . lt caldate{t}-yrart le 3   then dead_36m_onart=1;


			r=uniform(0);
			if r < 0.85 then do; dcause=1;if who4_{t}=0 then do; who4_{t}=1; who4_date=caldate{t}; cd4_who4_=c{t};end; end;
			if r >= 0.85 then dcause=2;
		end;

		if hbv=1 or hcv=1 then do;
			liverdra = base_rate / 6.0; * so liver death assumed closely CD4 related;
			liverdri3 = 1 - exp(-0.25*liverdra); x3=uniform(0);
		end;
		if x3 le liverdri3 then do;
			dead{t}=1; death=caldate{t}; timedead=death-infection; cd4_dead=c{t}; liver_death=1; dcause=2; rdcause=1; agedeath=age{t};
		end;



* what death rates to use ?;

		if gender=1 then do; * based on SA deeath rates in 1997 (pre most AIDS deaths);
			if 15 <= age{t} < 20 then ac_death_rate = 0.00200;
			if 20 <= age{t} < 25 then ac_death_rate = 0.00320;
			if 25 <= age{t} < 30 then ac_death_rate = 0.00580;
			if 30 <= age{t} < 35 then ac_death_rate = 0.00750;
			if 35 <= age{t} < 40 then ac_death_rate = 0.00800;
			if 40 <= age{t} < 45 then ac_death_rate = 0.01000;
			if 45 <= age{t} < 50 then ac_death_rate = 0.01200;
			if 50 <= age{t} < 55 then ac_death_rate = 0.01900;
			if 55 <= age{t} < 60 then ac_death_rate = 0.02500;
			if 60 <= age{t} < 65 then ac_death_rate = 0.03500;
			if 65 <= age{t} < 70 then ac_death_rate = 0.04500;
			if 70 <= age{t} < 75 then ac_death_rate = 0.05500;
			if 75 <= age{t} < 80 then ac_death_rate = 0.06500;
			if 80 <= age{t} < 85 then ac_death_rate = 0.10000;
			if 85 <= age{t}  then ac_death_rate = 0.4000;
		end;

		if gender=2 then do; * based on SA deeath rates in 1997 (pre most AIDS deaths);
			if 15 <= age{t} < 20 then ac_death_rate = 0.00150;
			if 20 <= age{t} < 25 then ac_death_rate = 0.00280;
			if 25 <= age{t} < 30 then ac_death_rate = 0.00400;
			if 30 <= age{t} < 35 then ac_death_rate = 0.00400;
			if 35 <= age{t} < 40 then ac_death_rate = 0.00420;
			if 40 <= age{t} < 45 then ac_death_rate = 0.00550;
			if 45 <= age{t} < 50 then ac_death_rate = 0.00750;
			if 50 <= age{t} < 55 then ac_death_rate = 0.01100;
			if 55 <= age{t} < 60 then ac_death_rate = 0.01500;	
			if 60 <= age{t} < 65 then ac_death_rate = 0.02100;
			if 65 <= age{t} < 70 then ac_death_rate = 0.03000;
			if 70 <= age{t} < 75 then ac_death_rate = 0.03800;
			if 75 <= age{t} < 80 then ac_death_rate = 0.05000;
			if 80 <= age{t} < 85 then ac_death_rate = 0.07000;
			if 85 <= age{t}  then ac_death_rate = 0.15000;
		end;

		if c_neph=1 then ac_death_rate=ac_death_rate+0.005;
		if c_lac=1 then ac_death_rate=ac_death_rate+0.10;

	ac_death_rate = ac_death_rate * fold_change_ac_death_rate; * apr14 these death rates increased to reflect better pop pyramid;

	if onart{t} ne 1 then ac_death_rate = 2 * ac_death_rate;
	if onart{t} =1 then ac_death_rate = 1.3 * ac_death_rate;

		if o_dol=1 and incr_mort_risk_dol_weightg ge 1 then ac_death_rate = ac_death_rate  * incr_mort_risk_dol_weightg_i; 

		if o_ten=1 and ten_is_taf_2020=1 then ac_death_rate = ac_death_rate  * 1.25; 


		ac_deathri3 = 1 - exp(-0.25*ac_death_rate); x3=uniform(0);
		if x3 le ac_deathri3 then do;
			dead{t}=1; death=caldate{t}; timedead=death-infection; cd4_dead=c{t}; dcause=2; rdcause=2; agedeath=age{t};
		end;
	end;


* time known to have been virally suppressed at last vlm;
	vlt_ = min(1000,vl_threshold);
	if . < vm < log10(vlt_) then do;  * sep14;
		if time_known_v_supp_at_last_vlm = . then time_known_v_supp_at_last_vlm = 0; 
		if time_known_v_supp_at_last_vlm ge 0 then time_known_v_supp_at_last_vlm = time_known_v_supp_at_last_vlm + (caldate{t} - date_last_known_v_suppression); 
		date_last_known_v_suppression = caldate{t}; 
	end;
	if vm >= log10(vlt_) then do; time_known_v_supp_at_last_vlm = .; date_last_known_v_suppression=.; end;

	if vm ne . then time_since_last_vm = 0; * jan15;
	if vm=. then time_since_last_vm = time_since_last_vm + 0.25; 

	if cm    ne . then time_since_last_cm = 0; * jan15;
	if cm   =. then time_since_last_cm = time_since_last_cm + 0.25; 


	sv=0; 

	if sv_secondline ne 1 then do;
	if t ge 4 and (onart{t}=1 or int_clinic_not_aw=1) 
	and . < caldate{t} - date_last_known_v_suppression <= 1.25 and linefail{t}=0 then sv=1; 
	end;

	if sv_secondline = 1 then do;
	if t ge 4 and (onart{t}=1 or int_clinic_not_aw=1) 
	and . < caldate{t} - date_last_known_v_suppression <= 1.25 then sv=1; 
	end;

	if sv_secondline ne 1 then do;
	if t ge 4 and art_monitoring_strategy=152 and (onart{t}=1 or int_clinic_not_aw=1) and . < caldate{t} - date_last_known_v_suppression <= 2.25 
	and linefail{t}=0 then sv=1; 
	end;

	if sv_secondline = 1 then do;
	if t ge 4 and art_monitoring_strategy=152 and (onart{t}=1 or int_clinic_not_aw=1) and . < caldate{t} - date_last_known_v_suppression <= 2.25 
	and linefail{t}=0 then sv=1; 
	end;


	if visit{t}=1 then do; if date_linked_to_care = . then date_linked_to_care = caldate{t}; linked_to_care=1;  end;

	if registd{t}=0 then visit{t}=.;

	if caldate&j=death > . then do;
			dead_diagnosed=0; if registd{t}=1 then dead_diagnosed=1;  dead_naive=0; if naive{t}=1 then dead_naive=1;
			dead_onart=0; if onart{t}=1 then dead_onart=1; dead_line1_lf0=0; if artline{t}=1 and linefail{t}=0 then dead_line1_lf0 =1;
			dead_line1=0; if artline{t}=1 then dead_line1 =1;  dead_line2=0; if artline{t}=2 then dead_line2 =1;
			dead_u_vfail1=0; if death > date_u_vfail > . then dead_u_vfail1=1; 			
			dead_line1_lf1=0; if artline{t}=1 and linefail{t}=1 then dead_line1_lf1 =1; dead_line2_lf1=0; if artline{t}=2 and linefail{t}=1 then dead_line2_lf1 =1;
			dead_line2_lf2=0; if artline{t}=2 and linefail{t}=2 then dead_line2_lf2 =1; dead_artexpoff=0; if naive{t}=0 and onart{t}=0 then dead_artexpoff =1;
			dead_nn=0; if o_nev=1 or o_efa=1 then dead_nn=1; dead_pir=0; if o_lpr=1 or o_dar=1  or o_taz=1 then dead_pir=1; dead_adc=0; if adc{t}=1 then dead_adc=1;
			dead_line1_vlg1000=0; if artline{t}=1 and v{t} ge 3 then dead_line1_vlg1000=1;
			dead_line2_vlg1000=0; if artline{t}=2 and v{t} ge 3 then dead_line2_vlg1000=1;
			dead_artexp=0; if naive{t}=0 then dead_artexp=1;
			dead_6m_onart=0; if onart{t}=1 and . lt caldate{t}-yrart le 0.5 then dead_6m_onart=1;
			dead_12m_onart=0;if onart{t}=1 and . lt caldate{t}-yrart le 1   then dead_12m_onart=1;
			dead_24m_onart=0;if onart{t}=1 and . lt caldate{t}-yrart le 2   then dead_24m_onart=1;
			dead_36m_onart=0;if onart{t}=1 and . lt caldate{t}-yrart le 3   then dead_36m_onart=1;
	end;



end;

* end of code for those with caldate{t} >= infection +0.25;



end;
* END OF THE CODE FOR HIV INFECTED;








* COSTS (MEASURED IN 1000s OF DOLLARS);
* costs at t are costs from t to t+0.25;

* ART costs;

* nucs;
    cost_zdv=0;if o_zdv=1 then cost_zdv=cost_zdv_a;       
    cost_ten=0;	if o_ten=1 then do; cost_ten=cost_ten_a; if ten_is_taf_2020 = 1 then cost_ten = cost_taf ;  end; 
	cost_3tc=0;if o_3tc=1 then cost_3tc=cost_3tc_a;     

* nnrtis;
   cost_nev=0;if o_nev=1 then cost_nev=cost_nev_a;
   cost_efa=0;if o_efa=1 then cost_efa=cost_efa_a;     	

* pis ;
   cost_lpr=0;if o_lpr=1 then cost_lpr=cost_lpr_a;
   cost_taz=0;if o_taz=1 then cost_taz=cost_taz_a;  
   cost_dar=0;if o_dar=1 then cost_dar=cost_dar_a;   			

   	* andrew changes july 2013 ;
	pi_cost=cost_lpr+cost_taz+cost_dar;

 * dol ;
	cost_dol=0; if o_dol=1 then cost_dol=cost_dol_a;

* cost of switching to second line (not cost of the drugs); 

cost_switch_line=0;
if start_line2_this_period=1 then cost_switch_line=0.020;

	art_cost=0;

    art_cost=(o_zdv*cost_zdv) + (o_ten*cost_ten) + (o_3tc*cost_3tc) + (o_nev*cost_nev) +
    (o_lpr*cost_lpr) + (o_dar*cost_dar)+ (o_taz*cost_taz)+ (o_efa*cost_efa)+ (o_dol*cost_dol);

	* ART initiation cost;
	if yrart=caldate{t} then art_cost = art_cost + art_init_cost;

 	art_1_cost=0; if artline{t}=1 then art_1_cost=art_cost; 
	art_2_cost=0; if artline{t}=2 then art_2_cost=art_cost;
	art_3_cost=0; if artline{t}=3 then art_3_cost=art_cost;

	adj_art_cost=art_cost; if t ge 2 and (. < adhm{t} < 0.8 or . < adhm{t-1} < 0.8) then adj_art_cost = art_cost * max(adhm{t-1},adhm{t}); 

 	adj_art_1_cost=0; if artline{t}=1 then adj_art_1_cost=adj_art_cost;adj_art_2_cost=0; if artline{t}=2 then adj_art_2_cost=adj_art_cost;
	

 
* ADC costs;
	adc_cost=0;
	if adc{t}=1 then adc_cost=adc_cost_a;
	
* who3 costs;
	who3_cost=0;
	if who3_event{t}=1 then who3_cost=who3_cost_a;

* tb costs;
	tb_cost=0;
	if t ge 2 and (tb{t}=1 or tb{t-1}=1) then tb_cost=tb_cost_a;

* co-trimoxazole costs;
	cot_cost=0;
	if pcp_p{t}=1 then cot_cost=cot_cost_a;

* adherence measure costs;
	adhm_cost=0; if adhm{t} ne . then adhm_cost=adhm_cost_a;


* targeted adh intervention cost;
cost_t_adh_int=0.010;
t_adh_int_cost=0;  if caldate{t}=date_v_alert then  t_adh_int_cost = cost_t_adh_int;


* visit costs;
full_vis_cost=0; vis_cost=0; 
if visit{t}=1 then do; vis_cost=vis_cost_a; full_vis_cost=vis_cost_a; end;* what is cost of an outpatient visit ? / doctor/nurse/admin time plus other tests;


* possibility of lower clinic cost if have measured VL < 1000 ;  *http://www.sajhivmed.org.za/index.php/sajhivmed/article/view/924/821;
vis_cost_sv=0;full_vis_cost_sv=0;
if sv=1 then do;	vis_cost=vis_cost-0.010; full_vis_cost_sv = full_vis_cost; vis_cost_sv = vis_cost;  end;


* cost per diagnosed person with sv ne 1, to improve cascade;
cost_cascade_interventions = 0;
if cascade_care_improvements = 1 and registd{t}=1 and sv ne 1 then cost_cascade_interventions = cost_cascade_interventions_a;


* lab costs;
	cd4_cost=0; 
	if cd4_cost_inc=1 then cd4_cost=cd4_cost_a;
	if cd4_cost_inc=2 then cd4_cost= 2 * cd4_cost_a;

	cd4_cost_inc=0;

	vl_cost=0; 
	if vl_cost_inc=1 and vm_format in (1,2) then vl_cost=vl_cost_lab; 
	if vl_cost_inc=1 and vm_format in (3,4) then vl_cost=vl_cost_poc;

	v_lab_transport_cost=0; 


	* test cost incurred for proportion of tests not done, result not obtained;
	cost_vl_not_done=0;
	if vm=. and vl_cost_inc=1 then do;
	cost_vl_not_done = vl_cost;
	end;
	
	vl_cost_inc=0;

	res_cost=0; if res_test=1 then res_cost=res_cost_a;


	cost_drug_level_test = 0;

	if caldate{t} = date_drug_level_test then drug_level_test_cost = cost_drug_level_test;

	if t ge 2 and dead{t-1}=1 then dead{t}=.;


* f_prep - Cost of PrEP - tests costed separately - from kzn mar19;
* Note this is cost of tl prep - cost of tld prep drugs is above with arvs ; 
cost_prep=0; cost_prep_visit=0;cost_prep_ac_adh=0;
if prep=1 then do;
	cost_ten=0;	cost_3tc=0;
	cost_prep = (prep_drug_cost * 1.2) / 4;  cost_prep_ac_adh=cost_prep*adh{t}; * 1.2 is supply chain, as for arvs;
	if visit_prep = 1 then cost_prep_visit = cost_prep_clinic / 2; * drug pick-up only - mar18 ; 
	if visit_prep = 2 then cost_prep_visit = cost_prep_clinic; 
	if visit_prep = 3 then cost_prep_visit = cost_prep_clinic+cost_prep_clinic_couns;
	*cost depends on whether they are just picking up the drug or also receiving further clinic time (counselling);
end;

cost_circ=0; if new_mcirc=1 then cost_circ=0.106;*LBM Jan 2019 VMMC trial 51.34+54.29 =106 ;


cost =  max(0,art_cost) +adc_cost+cd4_cost+vl_cost+vis_cost+who3_cost+cot_cost+tb_cost+res_cost+ max(0,adhm_cost)
+max(0,t_adh_int_cost) + cost_test + max (0, cost_circ) + max (0, cost_switch_line) + max(0, cost_prep) + max(0,cost_prep_visit)
+ max(0,cost_cascade_interventions) + max(0,drug_level_test_cost);

cost_test_m=0; if gender=1 then cost_test_m = cost_test;
cost_test_f=0; if gender=2 then cost_test_f = cost_test;

cost_test_m_sympt=0; if gender=1 and (elig_test_who4_tested=1 or elig_test_who3_tested=1 or elig_test_tb_tested=1 or tested_symptoms_not_hiv=1)
then cost_test_m_sympt=cost_test;

cost_test_m_circ=0; if gender=1 and tested_circ=1 then cost_test_m_circ=cost_test;

cost_test_f_anc=0; if gender=2 and tested_anc=1 then cost_test_f_anc=cost_test;

cost_test_f_sympt=0; if gender=2 and (elig_test_who4_tested=1 or elig_test_who3_tested=1 or elig_test_tb_tested=1 or tested_symptoms_not_hiv=1)
and tested_anc ne 1 then cost_test_f_sympt=cost_test;

cost_test_f_sw=0; if gender=2 and tested_as_sw=1 and tested_anc ne 1 and
(elig_test_who4_tested ne 1 and elig_test_who3_tested ne 1 and elig_test_tb_tested ne 1 and tested_symptoms_not_hiv ne 1) then cost_test_f_sw=cost_test;

cost_test_f_non_anc=0; if gender=2 and tested_anc ne 1 then cost_test_f_non_anc=cost_test;

if dead{t}=. then do; cost=0; art_cost=0;adc_cost=0;cd4_cost=0;vl_cost=0;vis_cost=0;who3_cost=0;cot_cost=0;tb_cost=0;
res_cost=0;adhm_cost=0;t_adh_int_cost =0; cost_test=0; cost_prep=0; cost_circ=0;cost_switch_line=0 ;
 cost_prep_visit=0;end;

* this below is cost of care of hiv infected child and should hold even after mothers death - estimate $30 per 3 months for total care incl art;
* low cost partially is to take account of possibility of child dying ;
cost_child_hiv = 0; if ever_birth_with_inf_child=1 then cost_child_hiv = 0.030;  
cost_child_hiv_mo_art = 0; if ev_birth_with_inf_ch_onart=1 then cost_child_hiv_mo_art = 0.030;  






* DEATH IN UNINFECTED ;

if hiv{t} ne 1 and age{t} >= 15 and dead{t}=0 then do;

* no death age under 15 - those with age1 < 15 dont enter model properly until reach 15;
* roughly close to zimbabwe - Lopman et al  Bull of the WHO  2006;
* if this is changed, the distribution of age1 will also have to be changed so that in absence of hiv the age distribution
at time zero is the same as that in later years;

if gender=1 then do; * based on SA death rates in 1997 (pre most AIDS deaths);
		if 15 <= age{t} < 20 then ac_death_rate = 0.00200;
		if 20 <= age{t} < 25 then ac_death_rate = 0.00320;
		if 25 <= age{t} < 30 then ac_death_rate = 0.00580;
		if 30 <= age{t} < 35 then ac_death_rate = 0.00750;
		if 35 <= age{t} < 40 then ac_death_rate = 0.00800;
		if 40 <= age{t} < 45 then ac_death_rate = 0.01000;
		if 45 <= age{t} < 50 then ac_death_rate = 0.01200;
		if 50 <= age{t} < 55 then ac_death_rate = 0.01900;
		if 55 <= age{t} < 60 then ac_death_rate = 0.02500;
		if 60 <= age{t} < 65 then ac_death_rate = 0.03500;
		if 65 <= age{t} < 70 then ac_death_rate = 0.04500;
		if 70 <= age{t} < 75 then ac_death_rate = 0.05500;
		if 75 <= age{t} < 80 then ac_death_rate = 0.06500;
		if 80 <= age{t} < 85 then ac_death_rate = 0.10000;
		if 85 <= age{t}  then ac_death_rate = 0.4000;
	end;

	if gender=2 then do; * based on SA death rates in 1997 (pre most AIDS deaths);
		if 15 <= age{t} < 20 then ac_death_rate = 0.00150;
		if 20 <= age{t} < 25 then ac_death_rate = 0.00280;
		if 25 <= age{t} < 30 then ac_death_rate = 0.00400;
		if 30 <= age{t} < 35 then ac_death_rate = 0.00400;
		if 35 <= age{t} < 40 then ac_death_rate = 0.00420;
		if 40 <= age{t} < 45 then ac_death_rate = 0.00550;
		if 45 <= age{t} < 50 then ac_death_rate = 0.00750;
		if 50 <= age{t} < 55 then ac_death_rate = 0.01100;
		if 55 <= age{t} < 60 then ac_death_rate = 0.01500;
		if 60 <= age{t} < 65 then ac_death_rate = 0.02100;
		if 65 <= age{t} < 70 then ac_death_rate = 0.03000;
		if 70 <= age{t} < 75 then ac_death_rate = 0.03800;
		if 75 <= age{t} < 80 then ac_death_rate = 0.05000;
		if 80 <= age{t} < 85 then ac_death_rate = 0.07000;
		if 85 <= age{t}  then ac_death_rate = 0.15000;
	end;

	ac_death_rate = ac_death_rate * fold_change_ac_death_rate; 

	ac_deathri3 = 1 - exp(-0.25*ac_death_rate); x3=uniform(0);
	if x3 le ac_deathri3 then do;
		dead{t}=1; death=caldate{t}; timedead=death-infection; dcause=2; agedeath=age{t};
	end;
end;


if tested{t}=1 then ever_tested=1;


if dead{t}=. then do;
	hiv{t}=.;newp{t}=.;np{t}=.;epdiag{t}=.;epi{t}=.; epmono=.;
	c{t}=.;cc{t}=.;vc{t}=.;v{t}=.;age{t}=.;adc{t}=.;adh{t}=.;who4_{t}=.;nod{t}=.;tcur{t}=.;who3_{t}=.;
	onart{t}=.;visit{t}=.;nactive{t}=.;registd{t}=.;
	tested{t}=.;
	naive{t}=.;artline{t}=.;linefail{t}=.;
	o_zdv=.;o_3tc=.;o_dar=.;o_ten=.;
	e_totmut{t}=.; who3_event{t}=.;
	o_efa=.;o_lpr=.;o_taz=.;o_dol=.;
	cmin{t}=.;
	p_zdv=.;p_3tc=.;p_dar=.;p_ten=.;
	p_efa=.;p_lpr=.;p_taz=.;p_dol=.;
	f_zdv=.;f_3tc=.;f_dar=.;f_ten=.;
	f_efa=.;f_lpr=.;f_dol=.;
	c_rt184m=.;c_rttams=.;c_rt65m=.;c_rt103m=.;c_rt181m=.;c_rt190m=.;c_rt151m=.;c_pr32m=.;c_pr47m=.;
	c_pr33m=.;c_pr46m=.;c_pr54m=.;c_pr76m=.;c_pr50vm=.;c_pr50lm=.;c_pr82m=.;c_pr84m=.;c_pr88m=.;c_pr90m=.;c_inpm=.;c_insm=.;
	e_rt184m=.;e_rttams=.;e_rt65m=.;e_rt103m=.;e_rt181m=.;e_rt190m=.;e_rt151m=.;e_pr32m=.;e_pr47m=.;
	e_pr33m=.;e_pr46m=.;e_pr54m=.;e_pr76m=.;e_pr50vm=.;e_pr50lm=.;e_pr82m=.;e_pr84m=.;e_pr88m=.;e_pr90m=.;e_inpm=.;e_insm=.;
	r_zdv=.;r_3tc=.;r_dar=.;r_ten=.;
	r_efa=.;r_lpr=.;r_dol=.;
	t_zdv=.;t_3tc=.;t_dar=.;t_taz=.;
	t_efa=.;t_lpr=.;t_dol=.;t_ten=.;
	c_lip=.;c_pen=.;c_ras=.;c_cns=.;c_hep=.;x4v{t}=.;who3_{t}=.;
	c_nau=.;c_otx=.;c_tox{t}=.;c_head=.;c_dia=.;c_ane=.;c_lac=.;
	c_neph = .;
	restart{t}=.;interrupt{t}=.;
	lost{t}=.;toffart{t}=.;
	primary{t}=.;ever_tested=.;date_last_test=.;sympt_diag=.;sympt_diag_ever=.;
	newp_p3m=.;p_ep_py=.;ever_ep=.;ever_newp=.;ever_sw=.;ever_sw1849_=.;act_years_sw=.;years_sw=.;
	acq_rt65m=.;acq_rt184m=.;acq_rtm=.;
	time_acq_rt65m=.;time_acq_rt184m=.;time_acq_rtm=.;time_stop_prep=.;
	prep=.;hr_noprep=.;elig_prep_epdiag=.;elig_prep=.;	primary_prep=.;primary_hr_noprep=.; 
	hiv1_prep=.;infected_prep=.; primary_r_prep=.;ever_i_nor_prep=.;i_r_prep=.;rm_prep=.;years_on_prep=.;
	rt65m_3_prep=.;rt184m_3_prep=.;rtm_3_prep=.;rt65m_6_prep=.;rt184m_6_prep=.;rtm_6_prep=.;rt65m_9_prep=.;rt184m_9_prep=.;rtm_9_prep=.;
	rt65m_12_prep=.;rt184m_12_prep=.;rtm_12_prep=.;rt65m_18_prep=.;rt184m_18_prep=.;rtm_18_prep=.;onprep_3=.;onprep_6=.;onprep_9=.;onprep_12=.;onprep_18=.;
	cum_children=.;pregnant=.;anc=.;on_sd_nvp=.;on_dual_nvp=.;int_clinic_not_aw=.;
	dead_6m_onart=.; dead_12m_onart=.;dead_24m_onart=.;dead_36m_onart=.;
	np_ever=.;newp_ever=.;
	episodes_sw=.;sw_gt1ep=.; age_deb_sw=.; sw{t}=.;
	tested_circ=.;tested_anc_prevdiag=.;
	ever_hiv1_prep=.; visit_prep=.; prepstart=.; ever_stopped_prep_choice=.; preprestart=.; n_test_prevyr_onprep=.;pop_wide_tld_prep=.;
end;


* END OF THE OVERALL LOOP;

xx55:
t=t+1;
end;







* steps below are for conversion of scales before outputting cd4 count converted from square root scale
to absolute scale ;

t=&e;
do until (t=&f);
	vc{t}=round(vc{t},0.001);
	v{t}=round(v{t},.1);
	vm=round(vm,.1);
	if c{t} ne . then c{t}=round(c{t},1);if cm    ne . then cm   =round(cm   ,1);
	cmin{t}=round(cmin{t},1);
	cc{t}=round(cc{t},1);
	cmin{t}=round(cmin{t},.1);
t=t+1;
end;
cd4_who4_=round(cd4_who4_,1);
cd4_dead=round(cd4_dead,1);
cd4diag=round(cd4diag,1);
vset=round(vset,.1);


* --------------------------------------------------------------------------------------;
if rbm = 4 then do;

* down columns give breakdown of age of partners for females by age group;

if sex_age_mixing_matrix_w=1 then do;
m15w15 =0.43*s_w_1524_newp; m15w25=0.09*s_w_2534_newp; m15w35=0.03*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.34*s_w_1524_newp; m25w25=0.49*s_w_2534_newp; m25w35=0.25*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.12*s_w_1524_newp; m35w25=0.30*s_w_2534_newp; m35w35=0.34*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.10*s_w_1524_newp; m45w25=0.10*s_w_2534_newp; m45w35=0.25*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.01*s_w_1524_newp; m55w25=0.02*s_w_2534_newp; m55w35=0.13*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;

if sex_age_mixing_matrix_w=2 then do;
m15w15 =0.43* s_w_1524_newp; m15w25=0.09*s_w_2534_newp; m15w35=0.03*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.415*s_w_1524_newp; m25w25=0.50*s_w_2534_newp; m25w35=0.25*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.12* s_w_1524_newp; m35w25=0.35*s_w_2534_newp; m35w35=0.34*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.03* s_w_1524_newp; m45w25=0.05*s_w_2534_newp; m45w35=0.25*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.005*s_w_1524_newp; m55w25=0.01*s_w_2534_newp; m55w35=0.13*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;

if sex_age_mixing_matrix_w=3 then do;
m15w15 =0.25* s_w_1524_newp; m15w25=0.09*s_w_2534_newp; m15w35=0.03*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.55 *s_w_1524_newp; m25w25=0.50*s_w_2534_newp; m25w35=0.25*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.15* s_w_1524_newp; m35w25=0.35*s_w_2534_newp; m35w35=0.34*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.03* s_w_1524_newp; m45w25=0.05*s_w_2534_newp; m45w35=0.25*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.02 *s_w_1524_newp; m55w25=0.01*s_w_2534_newp; m55w35=0.13*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;

if sex_age_mixing_matrix_w=4 then do;
m15w15 =0.05* s_w_1524_newp; m15w25=0.03*s_w_2534_newp; m15w35=0.03*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.55* s_w_1524_newp; m25w25=0.52*s_w_2534_newp; m25w35=0.05*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.35* s_w_1524_newp; m35w25=0.40*s_w_2534_newp; m35w35=0.57*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.03* s_w_1524_newp; m45w25=0.03*s_w_2534_newp; m45w35=0.30*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.02 *s_w_1524_newp; m55w25=0.02*s_w_2534_newp; m55w35=0.05*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;

if sex_age_mixing_matrix_w=5 then do;
m15w15 =0.05* s_w_1524_newp; m15w25=0.01*s_w_2534_newp; m15w35=0.01*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.45* s_w_1524_newp; m25w25=0.40*s_w_2534_newp; m25w35=0.07*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.30* s_w_1524_newp; m35w25=0.39*s_w_2534_newp; m35w35=0.47*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.15* s_w_1524_newp; m45w25=0.15*s_w_2534_newp; m45w35=0.30*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.05 *s_w_1524_newp; m55w25=0.05*s_w_2534_newp; m55w35=0.15*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;

if sex_age_mixing_matrix_w=6 then do;
m15w15 =0.20* s_w_1524_newp; m15w25=0.00*s_w_2534_newp; m15w35=0.01*s_w_3544_newp; m15w45=0.00*s_w_4554_newp; m15w55=0.00*s_w_5564_newp;
m25w15 =0.20* s_w_1524_newp; m25w25=0.25*s_w_2534_newp; m25w35=0.01*s_w_3544_newp; m25w45=0.00*s_w_4554_newp; m25w55=0.00*s_w_5564_newp;
m35w15 =0.20* s_w_1524_newp; m35w25=0.25*s_w_2534_newp; m35w35=0.32*s_w_3544_newp; m35w45=0.05*s_w_4554_newp; m35w55=0.00*s_w_5564_newp;
m45w15 =0.20* s_w_1524_newp; m45w25=0.25*s_w_2534_newp; m45w35=0.33*s_w_3544_newp; m45w45=0.70*s_w_4554_newp; m45w55=0.10*s_w_5564_newp;
m55w15 =0.20 *s_w_1524_newp; m55w25=0.25*s_w_2534_newp; m55w35=0.33*s_w_3544_newp; m55w45=0.25*s_w_4554_newp; m55w55=0.90*s_w_5564_newp;
end;


ptnewp15_m=m15w15+m15w25+m15w35+m15w45+m15w55; 
ptnewp25_m=m25w15+m25w25+m25w35+m25w45+m25w55; 
ptnewp35_m=m35w15+m35w25+m35w35+m35w45+m35w55; 
ptnewp45_m=m45w15+m45w25+m45w35+m45w45+m45w55; 
ptnewp55_m=m55w15+m55w25+m55w35+m55w45+m55w55; 

ptnewp_m=ptnewp15_m+ptnewp25_m+ptnewp35_m+ptnewp45_m+ptnewp55_m;

* down columns give breakdown of age of partners for males by age group;

if sex_age_mixing_matrix_m=1 then do;
w15m15 =0.865*s_m_1524_newp; w15m25=0.47*s_m_2534_newp; w15m35=0.30*s_m_3544_newp; w15m45=0.43*s_m_4554_newp; w15m55=0.18*s_m_5564_newp;
w25m15 =0.11 *s_m_1524_newp; w25m25=0.43*s_m_2534_newp; w25m35=0.50*s_m_3544_newp; w25m45=0.30*s_m_4554_newp; w25m55=0.18*s_m_5564_newp;
w35m15 =0.025*s_m_1524_newp; w35m25=0.10*s_m_2534_newp; w35m35=0.20*s_m_3544_newp; w35m45=0.23*s_m_4554_newp; w35m55=0.27*s_m_5564_newp;
w45m15 =0.00 *s_m_1524_newp; w45m25=0.00*s_m_2534_newp; w45m35=0.00*s_m_3544_newp; w45m45=0.03*s_m_4554_newp; w45m55=0.27*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.00*s_m_2534_newp; w55m35=0.00*s_m_3544_newp; w55m45=0.01*s_m_4554_newp; w55m55=0.10*s_m_5564_newp;
end;

if sex_age_mixing_matrix_m=2 then do;
w15m15 =0.865*s_m_1524_newp; w15m25=0.47*s_m_2534_newp; w15m35=0.20*s_m_3544_newp; w15m45=0.15*s_m_4554_newp; w15m55=0.05*s_m_5564_newp;
w25m15 =0.11 *s_m_1524_newp; w25m25=0.43*s_m_2534_newp; w25m35=0.35*s_m_3544_newp; w25m45=0.23*s_m_4554_newp; w25m55=0.08*s_m_5564_newp;
w35m15 =0.025*s_m_1524_newp; w35m25=0.10*s_m_2534_newp; w35m35=0.40*s_m_3544_newp; w35m45=0.25*s_m_4554_newp; w35m55=0.25*s_m_5564_newp;
w45m15 =0.00 *s_m_1524_newp; w45m25=0.00*s_m_2534_newp; w45m35=0.05*s_m_3544_newp; w45m45=0.30*s_m_4554_newp; w45m55=0.30*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.00*s_m_2534_newp; w55m35=0.00*s_m_3544_newp; w55m45=0.07*s_m_4554_newp; w55m55=0.32*s_m_5564_newp;
end;

if sex_age_mixing_matrix_m=3 then do;
w15m15 =0.90 *s_m_1524_newp; w15m25=0.44*s_m_2534_newp; w15m35=0.20*s_m_3544_newp; w15m45=0.15*s_m_4554_newp; w15m55=0.05*s_m_5564_newp;
w25m15 =0.05 *s_m_1524_newp; w25m25=0.43*s_m_2534_newp; w25m35=0.34*s_m_3544_newp; w25m45=0.23*s_m_4554_newp; w25m55=0.08*s_m_5564_newp;
w35m15 =0.02 *s_m_1524_newp; w35m25=0.10*s_m_2534_newp; w35m35=0.40*s_m_3544_newp; w35m45=0.25*s_m_4554_newp; w35m55=0.25*s_m_5564_newp;
w45m15 =0.02 *s_m_1524_newp; w45m25=0.02*s_m_2534_newp; w45m35=0.05*s_m_3544_newp; w45m45=0.30*s_m_4554_newp; w45m55=0.30*s_m_5564_newp;
w55m15 =0.01 *s_m_1524_newp; w55m25=0.01*s_m_2534_newp; w55m35=0.01*s_m_3544_newp; w55m45=0.07*s_m_4554_newp; w55m55=0.32*s_m_5564_newp;
end;

if sex_age_mixing_matrix_m=4 then do;
w15m15 =0.93 *s_m_1524_newp; w15m25=0.50*s_m_2534_newp; w15m35=0.20*s_m_3544_newp; w15m45=0.15*s_m_4554_newp; w15m55=0.05*s_m_5564_newp;
w25m15 =0.05 *s_m_1524_newp; w25m25=0.40*s_m_2534_newp; w25m35=0.34*s_m_3544_newp; w25m45=0.20*s_m_4554_newp; w25m55=0.08*s_m_5564_newp;
w35m15 =0.01 *s_m_1524_newp; w35m25=0.08*s_m_2534_newp; w35m35=0.41*s_m_3544_newp; w35m45=0.25*s_m_4554_newp; w35m55=0.20*s_m_5564_newp;
w45m15 =0.01 *s_m_1524_newp; w45m25=0.01*s_m_2534_newp; w45m35=0.05*s_m_3544_newp; w45m45=0.37*s_m_4554_newp; w45m55=0.40*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.01*s_m_2534_newp; w55m35=0.00*s_m_3544_newp; w55m45=0.03*s_m_4554_newp; w55m55=0.27*s_m_5564_newp;
end;

if sex_age_mixing_matrix_m=5 then do;
w15m15 =0.94 *s_m_1524_newp; w15m25=0.50*s_m_2534_newp; w15m35=0.40*s_m_3544_newp; w15m45=0.30*s_m_4554_newp; w15m55=0.30*s_m_5564_newp;
w25m15 =0.05 *s_m_1524_newp; w25m25=0.40*s_m_2534_newp; w25m35=0.40*s_m_3544_newp; w25m45=0.30*s_m_4554_newp; w25m55=0.30*s_m_5564_newp;
w35m15 =0.01 *s_m_1524_newp; w35m25=0.08*s_m_2534_newp; w35m35=0.15*s_m_3544_newp; w35m45=0.25*s_m_4554_newp; w35m55=0.30*s_m_5564_newp;
w45m15 =0.00 *s_m_1524_newp; w45m25=0.01*s_m_2534_newp; w45m35=0.04*s_m_3544_newp; w45m45=0.10*s_m_4554_newp; w45m55=0.05*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.01*s_m_2534_newp; w55m35=0.01*s_m_3544_newp; w55m45=0.05*s_m_4554_newp; w55m55=0.05*s_m_5564_newp;
end;

if sex_age_mixing_matrix_m=6 then do;
w15m15 =0.94 *s_m_1524_newp; w15m25=0.50*s_m_2534_newp; w15m35=0.50*s_m_3544_newp; w15m45=0.50*s_m_4554_newp; w15m55=0.50*s_m_5564_newp;
w25m15 =0.05 *s_m_1524_newp; w25m25=0.40*s_m_2534_newp; w25m35=0.35*s_m_3544_newp; w25m45=0.35*s_m_4554_newp; w25m55=0.35*s_m_5564_newp;
w35m15 =0.01 *s_m_1524_newp; w35m25=0.10*s_m_2534_newp; w35m35=0.10*s_m_3544_newp; w35m45=0.10*s_m_4554_newp; w35m55=0.10*s_m_5564_newp;
w45m15 =0.00 *s_m_1524_newp; w45m25=0.00*s_m_2534_newp; w45m35=0.05*s_m_3544_newp; w45m45=0.05*s_m_4554_newp; w45m55=0.05*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.00*s_m_2534_newp; w55m35=0.00*s_m_3544_newp; w55m45=0.00*s_m_4554_newp; w55m55=0.00*s_m_5564_newp;
end;



ptnewp15_w=w15m15+w15m25+w15m35+w15m45+w15m55; 
ptnewp25_w=w25m15+w25m25+w25m35+w25m45+w25m55; 
ptnewp35_w=w35m15+w35m25+w35m35+w35m45+w35m55; 
ptnewp45_w=w45m15+w45m25+w45m35+w45m45+w45m55; 
ptnewp55_w=w55m15+w55m25+w55m35+w55m45+w55m55; 

ptnewp_w=ptnewp15_w+ptnewp25_w+ptnewp35_w+ptnewp45_w+ptnewp55_w;

end;
* --------------------------------------------------------------------------------------;



if 15 <= age&j < 25 then ageg&j=1;
if 25 <= age&j < 35 then ageg&j=2;
if 35 <= age&j < 45 then ageg&j=3;
if 45 <= age&j < 55 then ageg&j=4;
if 55 <= age&j < 65 then ageg&j=5;

if gender=1 then do;
	if 15 <= age&j < 25 then ageg1m=1;else ageg1m=0;
	if 25 <= age&j < 35 then ageg2m=1;else ageg2m=0;
	if 35 <= age&j < 45 then ageg3m=1;else ageg3m=0;
	if 45 <= age&j < 55 then ageg4m=1;else ageg4m=0;
	if 55 <= age&j < 65 then ageg5m=1;else ageg5m=0;

	if 15 <= age&j < 18 then ageg1517m=1;else ageg1517m=0;
	if 18 <= age&j < 20 then ageg1819m=1;else ageg1819m=0;
	if 15 <= age&j < 20 then ageg1519m=1;else ageg1519m=0;
	if 20 <= age&j < 25 then ageg2024m=1;else ageg2024m=0;
	if 25 <= age&j < 30 then ageg2529m=1;else ageg2529m=0;
	if 30 <= age&j < 35 then ageg3034m=1;else ageg3034m=0;
	if 35 <= age&j < 40 then ageg3539m=1;else ageg3539m=0;
	if 40 <= age&j < 45 then ageg4044m=1;else ageg4044m=0;
	if 45 <= age&j < 50 then ageg4549m=1;else ageg4549m=0;
	if 50 <= age&j < 55 then ageg5054m=1;else ageg5054m=0;
	if 55 <= age&j < 60 then ageg5559m=1;else ageg5559m=0;
	if 60 <= age&j < 65 then ageg6064m=1;else ageg6064m=0;
	if 65 <= age&j < 70 then ageg6569m=1;else ageg6569m=0;
	if 70 <= age&j < 75 then ageg7074m=1;else ageg7074m=0;
	if 75 <= age&j < 80 then ageg7579m=1;else ageg7579m=0;
	if 80 <= age&j < 85 then ageg8084m=1;else ageg8084m=0;

	if 15 <= age&j < 65 then ageg1564m=1;else ageg1564m=0;
	if 15 <= age&j < 50 then ageg1549m=1;else ageg1549m=0;
end;

if gender=2 then do;
	if 15 <= age&j < 25 then ageg1w=1;else ageg1w=0;
	if 25 <= age&j < 35 then ageg2w=1;else ageg2w=0;
	if 35 <= age&j < 45 then ageg3w=1;else ageg3w=0;
	if 45 <= age&j < 55 then ageg4w=1;else ageg4w=0;
	if 55 <= age&j < 65 then ageg5w=1;else ageg5w=0;

	if 15 <= age&j < 18 then ageg1517w=1;else ageg1517w=0;
	if 18 <= age&j < 20 then ageg1819w=1;else ageg1819w=0;
	if 15 <= age&j < 20 then ageg1519w=1;else ageg1519w=0;
	if 20 <= age&j < 25 then ageg2024w=1;else ageg2024w=0;
	if 25 <= age&j < 30 then ageg2529w=1;else ageg2529w=0;
	if 30 <= age&j < 35 then ageg3034w=1;else ageg3034w=0;
	if 35 <= age&j < 40 then ageg3539w=1;else ageg3539w=0;
	if 40 <= age&j < 45 then ageg4044w=1;else ageg4044w=0;
	if 45 <= age&j < 50 then ageg4549w=1;else ageg4549w=0;
	if 50 <= age&j < 55 then ageg5054w=1;else ageg5054w=0;
	if 55 <= age&j < 60 then ageg5559w=1;else ageg5559w=0;
	if 60 <= age&j < 65 then ageg6064w=1;else ageg6064w=0;
	if 65 <= age&j < 70 then ageg6569w=1;else ageg6569w=0;
	if 70 <= age&j < 75 then ageg7074w=1;else ageg7074w=0;
	if 75 <= age&j < 80 then ageg7579w=1;else ageg7579w=0;
	if 80 <= age&j < 85 then ageg8084w=1;else ageg8084w=0;

	if 15 <= age&j < 65 then ageg1564w=1;else ageg1564w=0;
	if 15 <= age&j < 50 then ageg1549w=1;else ageg1549w=0;
end;

alive_m = 0;  if age&j ge 15 and gender=1 then alive_m = 1;
alive_w = 0;  if age&j ge 15 and gender=2 then alive_w = 1;
if 15 <= age&j < 50 then alive1549=1;else alive1549=0;
if 15 <= age&j < 50 and gender=1 then alive1549_m=1;else alive1549_m=0;
if 15 <= age&j < 50 and gender=2 then alive1549_w=1;else alive1549_w=0;
if 15 <= age&j < 65 then alive1564=1;else alive1564=0;
if 15 <= age&j < 65 and gender=1 then alive1564_m=1;else alive1564_m=0;
if 15 <= age&j < 65 and gender=2 then alive1564_w=1;else alive1564_w=0;

age_1849w=0;if 18 <= age&j < 50 and gender=2 then age_1849w=1;
age_1844m=0;if 18 <= age&j < 45 and gender=1 then age_1844m=1;
age_1844w=0;if 18 <= age&j < 45 and gender=2 then age_1844w=1;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*;
CEB_W1524=0;CEB_W2534=0;CEB_W3544=0;CEB_W4549=0;
if gender=2 then do;
	if      15 <= age&j < 25 then CEB_W1524=cum_children;
	else if 25 <= age&j < 35 then CEB_W2534=cum_children;
	else if 35 <= age&j < 45 then CEB_W3544=cum_children;
	else if 45 <= age&j < 50 then CEB_W4549=cum_children;
end;
hiv_pregnant=0; if pregnant=1 and hiv&j=1 then hiv_pregnant=1;
hiv_anc=0;      if anc=1      and hiv&j=1 then hiv_anc=1;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*;

primary1519m=0; if gender=1 and primary&j=1 and 15 <= age&j < 20 then primary1519m=1;
primary2024m=0; if gender=1 and primary&j=1 and 20 <= age&j < 25 then primary2024m=1;
primary2529m=0; if gender=1 and primary&j=1 and 25 <= age&j < 30 then primary2529m=1;
primary3034m=0; if gender=1 and primary&j=1 and 30 <= age&j < 35 then primary3034m=1;
primary3539m=0; if gender=1 and primary&j=1 and 35 <= age&j < 40 then primary3539m=1;
primary4044m=0; if gender=1 and primary&j=1 and 40 <= age&j < 45 then primary4044m=1;
primary4549m=0; if gender=1 and primary&j=1 and 45 <= age&j < 50 then primary4549m=1;
primary5054m=0; if gender=1 and primary&j=1 and 50 <= age&j < 55 then primary5054m=1;
primary5559m=0; if gender=1 and primary&j=1 and 55 <= age&j < 60 then primary5559m=1;
primary6064m=0; if gender=1 and primary&j=1 and 60 <= age&j < 65 then primary6064m=1;

primary1549m=0; if gender=1 and primary&j=1 and 15 <= age&j < 50 then primary1549m=1;

primary1519w=0; if gender=1 and primary&j=1 and 15 <= age&j < 20 then primary1519w=1;
primary2024w=0; if gender=1 and primary&j=1 and 20 <= age&j < 25 then primary2024w=1;
primary2529w=0; if gender=1 and primary&j=1 and 25 <= age&j < 30 then primary2529w=1;
primary3034w=0; if gender=1 and primary&j=1 and 30 <= age&j < 35 then primary3034w=1;
primary3539w=0; if gender=1 and primary&j=1 and 35 <= age&j < 40 then primary3539w=1;
primary4044w=0; if gender=1 and primary&j=1 and 40 <= age&j < 45 then primary4044w=1;
primary4549w=0; if gender=1 and primary&j=1 and 45 <= age&j < 50 then primary4549w=1;
primary5054w=0; if gender=1 and primary&j=1 and 50 <= age&j < 55 then primary5054w=1;
primary5559w=0; if gender=1 and primary&j=1 and 55 <= age&j < 60 then primary5559w=1;
primary6064w=0; if gender=1 and primary&j=1 and 60 <= age&j < 65 then primary6064w=1;

primary1549w=0; if gender=2 and primary&j=1 and 15 <= age&j < 50 then primary1549w=1;

primary1549=0; if primary&j=1 and 15 <= age&j < 50 then primary1549=1;


primary1524m_ep=0; if gender=1 and primary&j=1 and 15 <= age&j < 25 and ep&j=1 then primary1524m_ep=1;
primary2534m_ep=0; if gender=1 and primary&j=1 and 25 <= age&j < 35 and ep&j=1 then primary2534m_ep=1;
primary3544m_ep=0; if gender=1 and primary&j=1 and 35 <= age&j < 45 and ep&j=1 then primary3544m_ep=1;
primary4554m_ep=0; if gender=1 and primary&j=1 and 45 <= age&j < 55 and ep&j=1 then primary4554m_ep=1;
primary5564m_ep=0; if gender=1 and primary&j=1 and 55 <= age&j < 65 and ep&j=1 then primary5564m_ep=1;
primary1524w_ep=0; if gender=2 and primary&j=1 and 15 <= age&j < 25 and ep&j=1 then primary1524w_ep=1;
primary2534w_ep=0; if gender=2 and primary&j=1 and 25 <= age&j < 35 and ep&j=1 then primary2534w_ep=1;
primary3544w_ep=0; if gender=2 and primary&j=1 and 35 <= age&j < 45 and ep&j=1 then primary3544w_ep=1;
primary4554w_ep=0; if gender=2 and primary&j=1 and 45 <= age&j < 55 and ep&j=1 then primary4554w_ep=1;
primary5564w_ep=0; if gender=2 and primary&j=1 and 55 <= age&j < 65 and ep&j=1 then primary5564w_ep=1;

primary1524m_epnewp=0; if gender=1 and primary&j=1 and 15 <= age&j < 25 and ep&j=1 and newp&j ge 1 then primary1524m_epnewp=1;
primary2534m_epnewp=0; if gender=1 and primary&j=1 and 25 <= age&j < 35 and ep&j=1 and newp&j ge 1 then primary2534m_epnewp=1;
primary3544m_epnewp=0; if gender=1 and primary&j=1 and 35 <= age&j < 45 and ep&j=1 and newp&j ge 1 then primary3544m_epnewp=1;
primary4554m_epnewp=0; if gender=1 and primary&j=1 and 45 <= age&j < 55 and ep&j=1 and newp&j ge 1 then primary4554m_epnewp=1;
primary5564m_epnewp=0; if gender=1 and primary&j=1 and 55 <= age&j < 65 and ep&j=1 and newp&j ge 1 then primary5564m_epnewp=1;
primary1524w_epnewp=0; if gender=2 and primary&j=1 and 15 <= age&j < 25 and ep&j=1 and newp&j ge 1 then primary1524w_epnewp=1;
primary2534w_epnewp=0; if gender=2 and primary&j=1 and 25 <= age&j < 35 and ep&j=1 and newp&j ge 1 then primary2534w_epnewp=1;
primary3544w_epnewp=0; if gender=2 and primary&j=1 and 35 <= age&j < 45 and ep&j=1 and newp&j ge 1 then primary3544w_epnewp=1;
primary4554w_epnewp=0; if gender=2 and primary&j=1 and 45 <= age&j < 55 and ep&j=1 and newp&j ge 1 then primary4554w_epnewp=1;
primary5564w_epnewp=0; if gender=2 and primary&j=1 and 55 <= age&j < 65 and ep&j=1 and newp&j ge 1 then primary5564w_epnewp=1;

primary_ep_m=0; if primary&j=1 and ep&j=1 and epi&j=0 and gender=1 then primary_ep_m=1;
primary_ep_w=0; if primary&j=1 and ep&j=1 and epi&j=0 and gender=2 then primary_ep_w=1;

* this is denominator for incidence of hiv in those with ep=1 epi=0
  only uninfected, as these are at risk of infection ;
eph0_m&j=0; if ep&j=1 and hiv&j=0  and epi&j=0 and gender=1 then eph0_m&j=1;
eph0_w&j=0; if ep&j=1 and hiv&j=0  and epi&j=0 and gender=2 then eph0_w&j=1;

i_m_1524_newp=0; if hiv&j=1 and gender=1 and 15 <= age&j < 25 then i_m_1524_newp=newp&j;
i_m_2534_newp=0; if hiv&j=1 and gender=1 and 25 <= age&j < 35 then i_m_2534_newp=newp&j;
i_m_3544_newp=0; if hiv&j=1 and gender=1 and 35 <= age&j < 45 then i_m_3544_newp=newp&j;
i_m_4554_newp=0; if hiv&j=1 and gender=1 and 45 <= age&j < 55 then i_m_4554_newp=newp&j;
i_m_5564_newp=0; if hiv&j=1 and gender=1 and 55 <= age&j < 65 then i_m_5564_newp=newp&j;

m_1524_newp=0;if  gender=1 and 15 <= age&j < 25 then m_1524_newp=newp&j;
m_2534_newp=0;if  gender=1 and 25 <= age&j < 35 then m_2534_newp=newp&j;
m_3544_newp=0;if  gender=1 and 35 <= age&j < 45 then m_3544_newp=newp&j;
m_4554_newp=0;if  gender=1 and 45 <= age&j < 55 then m_4554_newp=newp&j;
m_5564_newp=0;if  gender=1 and 55 <= age&j < 65 then m_5564_newp=newp&j;

i_w_1524_newp=0; if hiv&j=1 and gender=2 and 15 <= age&j < 25 then i_w_1524_newp=newp&j;
i_w_2534_newp=0; if hiv&j=1 and gender=2 and 25 <= age&j < 35 then i_w_2534_newp=newp&j;
i_w_3544_newp=0; if hiv&j=1 and gender=2 and 35 <= age&j < 45 then i_w_3544_newp=newp&j;
i_w_4554_newp=0; if hiv&j=1 and gender=2 and 45 <= age&j < 55 then i_w_4554_newp=newp&j;
i_w_5564_newp=0; if hiv&j=1 and gender=2 and 55 <= age&j < 65 then i_w_5564_newp=newp&j;

w_1524_newp=0;if  gender=2 and 15 <= age&j < 25 then w_1524_newp=newp&j;
w_2534_newp=0;if  gender=2 and 25 <= age&j < 35 then w_2534_newp=newp&j;
w_3544_newp=0;if  gender=2 and 35 <= age&j < 45 then w_3544_newp=newp&j;
w_4554_newp=0;if  gender=2 and 45 <= age&j < 55 then w_4554_newp=newp&j;
w_5564_newp=0;if  gender=2 and 55 <= age&j < 65 then w_5564_newp=newp&j;

m1524_ep1524=0; m1524_ep2534=0;m1524_ep3544=0; m1524_ep4554=0;m1524_ep5564=0;
m2534_ep1524=0; m2534_ep2534=0;m2534_ep3544=0; m2534_ep4554=0;m2534_ep5564=0;
m3544_ep1524=0; m3544_ep2534=0;m3544_ep3544=0; m3544_ep4554=0;m3544_ep5564=0;
m4554_ep1524=0; m4554_ep2534=0;m4554_ep3544=0; m4554_ep4554=0;m4554_ep5564=0;
m5565_ep1524=0; m5565_ep2534=0;m5565_ep3544=0; m5565_ep4554=0;m5565_ep5564=0;

w1524_ep1524=0; w1524_ep2534=0;w1524_ep3544=0; w1524_ep4554=0;w1524_ep5564=0;
w2534_ep1524=0; w2534_ep2534=0;w2534_ep3544=0; w2534_ep4554=0;w2534_ep5564=0;
w3544_ep1524=0; w3544_ep2534=0;w3544_ep3544=0; w3544_ep4554=0;w3544_ep5564=0;
w4554_ep1524=0; w4554_ep2534=0;w4554_ep3544=0; w4554_ep4554=0;w4554_ep5564=0;
w5565_ep1524=0; w5565_ep2534=0;w5565_ep3544=0; w5565_ep4554=0;w5565_ep5564=0;

if gender=1 and ep&j=1 then do;
	if 15 <= age&j < 25 then do;
		m1524_ep1524=1; 
	end;
	else if 25 <= age&j < 35 then do;
		m2534_ep2534=1;
	end;
	else if 35 <= age&j < 45 then do;
		m3544_ep3544=1;
	end;
	else if 45 <= age&j < 55 then do;
		m4554_ep4554=1;
	end;
	else if 55 <= age&j < 65 then do;
		m5564_ep5564=1;
	end;
end;
else if gender=2 and ep&j=1 then do;
	if 15 <= age&j < 25 then do;
		w1524_ep1524=1;
	end;
	else if 25 <= age&j < 35 then do;
		w2534_ep2534=1;
	end;
	else if 35 <= age&j < 45 then do;
		w3544_ep3544=1;
	end;
	else if 45 <= age&j < 55 then do;
		w4554_ep4554=1;
	end;
	else if 55 <= age&j < 65 then do;
		w5564_ep5564=1;
	end;
end;


newp_ge1=0;if newp&j >= 1 then newp_ge1=1; if newp&j=. then newp_ge1=.;
newp_ge5=0;if newp&j >= 5 then newp_ge5=1; if newp&j=. then newp_ge5=.;
newp_ge10=0; if newp&j >= 10  then newp_ge10=1; if newp&j=. then newp_ge10=.;
newp_ge50=0; if newp&j >= 50  then newp_ge50=1; if newp&j=. then newp_ge50=.;

m1524_newp_ge1=0;m2534_newp_ge1=0;m3544_newp_ge1=0;m4554_newp_ge1=0;m5564_newp_ge1=0; 
m1524_newp_ge5=0;m2534_newp_ge5=0;m3544_newp_ge5=0;m4554_newp_ge5=0;m5564_newp_ge5=0; 
w1524_newp_ge1=0;w2534_newp_ge1=0;w3544_newp_ge1=0;w4554_newp_ge1=0;w5564_newp_ge1=0; 
w1524_newp_ge5=0;w2534_newp_ge5=0;w3544_newp_ge5=0;w4554_newp_ge5=0;w5564_newp_ge5=0; 
if gender=1 then do;
	if newp&j >= 5 then do;
		if      15 <= age&j < 25 then m1524_newp_ge5=1; else if 25 <= age&j < 35 then m2534_newp_ge5=1; else if 35 <= age&j < 45 then m3544_newp_ge5=1;
		else if 45 <= age&j < 55 then m4554_newp_ge5=1; else if 55 <= age&j < 65 then m5564_newp_ge5=1; end;
	if newp&j >= 1 then do;
		if      15 <= age&j < 25 then m1524_newp_ge1=1; else if 25 <= age&j < 35 then m2534_newp_ge1=1; else if 35 <= age&j < 45 then m3544_newp_ge1=1;
		else if 45 <= age&j < 55 then m4554_newp_ge1=1; else if 55 <= age&j < 65 then m5564_newp_ge1=1; end;
	else if newp&j=. then do;
		if      15 <= age&j < 25 then m1524_newp_ge1=.; else if 25 <= age&j < 35 then m2534_newp_ge1=.; else if 35 <= age&j < 45 then m3544_newp_ge1=.;
		else if 45 <= age&j < 55 then m4554_newp_ge1=.; else if 55 <= age&j < 65 then m5564_newp_ge1=.; end;
end;
else if gender=2 then do;
	if newp&j >= 5 then do;
		if      15 <= age&j < 25 then w1524_newp_ge5=1; else if 25 <= age&j < 35 then w2534_newp_ge5=1; else if 35 <= age&j < 45 then w3544_newp_ge5=1;
		else if 45 <= age&j < 55 then w4554_newp_ge5=1; else if 55 <= age&j < 65 then w5564_newp_ge5=1; end;
	if newp&j >= 1 then do;
		if      15 <= age&j < 25 then w1524_newp_ge1=1; else if 25 <= age&j < 35 then w2534_newp_ge1=1; else if 35 <= age&j < 45 then w3544_newp_ge1=1;
		else if 45 <= age&j < 55 then w4554_newp_ge1=1; else if 55 <= age&j < 65 then w5564_newp_ge1=1; end;
	else if newp&j=. then do;
		if      15 <= age&j < 25 then w1524_newp_ge1=.; else if 25 <= age&j < 35 then w2534_newp_ge1=.; else if 35 <= age&j < 45 then w3544_newp_ge1=.;
		else if 45 <= age&j < 55 then w4554_newp_ge1=.; else if 55 <= age&j < 65 then w5564_newp_ge1=.; end;
end;

nnewp_ly=0;
nnewp_ly=(newp&j+newp&x+newp&a+newp&b);

conc=0;
if ((ep&j=1 and newp&j ge 1) or newp&j ge 2) or ((ep&x=1 and newp&x ge 1) or newp&x ge 2) or 
   ((ep&a=1 and newp&a ge 1) or newp&a ge 2) or ((ep&b=1 and newp&b ge 1) or newp&b ge 2) then conc=1;
npgt1conc_ly_1524m=0;if gender=1 and 15 <= age&j < 25 then npgt1conc_ly_1524m=conc;
npgt1conc_ly_1524w=0;if gender=2 and 15 <= age&j < 25 then npgt1conc_ly_1524w=conc;
npgt1conc_ly_2549m=0;if gender=1 and 25 <= age&j <=49 then npgt1conc_ly_2549m=conc;
npgt1conc_ly_2549w=0;if gender=2 and 25 <= age&j <=49 then npgt1conc_ly_2549w=conc;
npgt1conc_ly_5064m=0;if gender=1 and 50 <= age&j < 65 then npgt1conc_ly_5064m=conc;
npgt1conc_ly_5064w=0;if gender=2 and 50 <= age&j < 65 then npgt1conc_ly_5064w=conc;

npgt1conc_ly_1519m=0;if gender=1 and 15 <= age&j < 20 then npgt1conc_ly_1519m=conc;
npgt1conc_ly_1519w=0;if gender=2 and 15 <= age&j < 20 then npgt1conc_ly_1519w=conc;


***  Number of new partners in the last year. To update table in supplementary material; 
*1>= np;
npge1_ly_1564m=0;if gender=1 and 15 <= age&j < 65 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_1564m=1;
npge1_ly_1524m=0;if gender=1 and 15 <= age&j < 25 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_1524m=1;
npge1_ly_2534m=0;if gender=1 and 25 <= age&j < 35 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_2534m=1;
npge1_ly_3544m=0;if gender=1 and 35 <= age&j < 45 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_3544m=1;
npge1_ly_4554m=0;if gender=1 and 45 <= age&j < 55 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_4554m=1;
npge1_ly_5564m=0;if gender=1 and 55 <= age&j < 65 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_5564m=1;
npge1_ly_1564w=0;if gender=2 and 15 <= age&j < 65 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_1564w=1;
npge1_ly_1524w=0;if gender=2 and 15 <= age&j < 25 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_1524w=1;
npge1_ly_2534w=0;if gender=2 and 25 <= age&j < 35 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_2534w=1;
npge1_ly_3544w=0;if gender=2 and 35 <= age&j < 45 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_3544w=1;
npge1_ly_4554w=0;if gender=2 and 45 <= age&j < 55 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_4554w=1;
npge1_ly_5564w=0;if gender=2 and 55 <= age&j < 65 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_5564w=1;


*>=2 np;
npge2_ly_1564m=0;if gender=1 and 15 <= age&j < 65 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1564m=1;
npge2_ly_1524m=0;if gender=1 and 15 <= age&j < 25 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1524m=1;
npge2_ly_2534m=0;if gender=1 and 25 <= age&j < 35 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_2534m=1;
npge2_ly_3544m=0;if gender=1 and 35 <= age&j < 45 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_3544m=1;
npge2_ly_4554m=0;if gender=1 and 45 <= age&j < 55 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_4554m=1;
npge2_ly_5564m=0;if gender=1 and 55 <= age&j < 65 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_5564m=1;
npge2_ly_1564w=0;if gender=2 and 15 <= age&j < 65 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1564w=1;
npge2_ly_1524w=0;if gender=2 and 15 <= age&j < 25 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1524w=1;
npge2_ly_2534w=0;if gender=2 and 25 <= age&j < 35 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_2534w=1;
npge2_ly_3544w=0;if gender=2 and 35 <= age&j < 45 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_3544w=1;
npge2_ly_4554w=0;if gender=2 and 45 <= age&j < 55 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_4554w=1;
npge2_ly_5564w=0;if gender=2 and 55 <= age&j < 65 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_5564w=1;


*>=10 np;
npge10_ly_1564m=0;if gender=1 and 15 <= age&j < 65 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_1564m=1;
npge10_ly_1524m=0;if gender=1 and 15 <= age&j < 25 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_1524m=1;
npge10_ly_2534m=0;if gender=1 and 25 <= age&j < 35 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_2534m=1;
npge10_ly_3544m=0;if gender=1 and 35 <= age&j < 45 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_3544m=1;
npge10_ly_4554m=0;if gender=1 and 45 <= age&j < 55 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_4554m=1;
npge10_ly_5564m=0;if gender=1 and 55 <= age&j < 65 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_5564m=1;
npge10_ly_1564w=0;if gender=2 and 15 <= age&j < 65 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_1564w=1;
npge10_ly_1524w=0;if gender=2 and 15 <= age&j < 25 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_1524w=1;
npge10_ly_2534w=0;if gender=2 and 25 <= age&j < 35 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_2534w=1;
npge10_ly_3544w=0;if gender=2 and 35 <= age&j < 45 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_3544w=1;
npge10_ly_4554w=0;if gender=2 and 45 <= age&j < 55 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_4554w=1;
npge10_ly_5564w=0;if gender=2 and 55 <= age&j < 65 and (nnewp_ly ge 10 or (nnewp_ly=9 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge10_ly_5564w=1;


*>=50 np;
npge50_ly_1564m=0;if gender=1 and 15 <= age&j < 65 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_1564m=1;
npge50_ly_1524m=0;if gender=1 and 15 <= age&j < 25 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_1524m=1;
npge50_ly_2534m=0;if gender=1 and 25 <= age&j < 35 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_2534m=1;
npge50_ly_3544m=0;if gender=1 and 35 <= age&j < 45 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_3544m=1;
npge50_ly_4554m=0;if gender=1 and 45 <= age&j < 55 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_4554m=1;
npge50_ly_5564m=0;if gender=1 and 55 <= age&j < 65 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_5564m=1;
npge50_ly_1564w=0;if gender=2 and 15 <= age&j < 65 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_1564w=1;
npge50_ly_1524w=0;if gender=2 and 15 <= age&j < 25 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_1524w=1;
npge50_ly_2534w=0;if gender=2 and 25 <= age&j < 35 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_2534w=1;
npge50_ly_3544w=0;if gender=2 and 35 <= age&j < 45 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_3544w=1;
npge50_ly_4554w=0;if gender=2 and 45 <= age&j < 55 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_4554w=1;
npge50_ly_5564w=0;if gender=2 and 55 <= age&j < 65 and (nnewp_ly ge 50 or (nnewp_ly=49 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge50_ly_5564w=1;

newpge1_ly_1529m=0;if gender=1 and 15 <= age&j < 30 and (newp&j ge 1 or newp&x ge 1 or newp&a ge 1 or newp&b ge 1) then newpge1_ly_1529m=1;
newpge1_ly_1529w=0;if gender=2 and 15 <= age&j < 30 and (newp&j ge 1 or newp&x ge 1 or newp&a ge 1 or newp&b ge 1) then newpge1_ly_1529w=1;

npge2_ly_1844m=0;if gender=1 and 18 <= age&j < 45 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1844m=1;
npge2_ly_1844w=0;if gender=2 and 18 <= age&j < 45 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1844w=1;
npge2_ly_1549m=0;if gender=1 and 18 <= age&j < 50 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1549m=1;
npge2_ly_1549w=0;if gender=2 and 18 <= age&j < 50 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1549w=1;

newpge1_ly_1529m=0;if gender=1 and 15 <= age&j < 30 and (newp&j ge 1 or newp&x ge 1 or newp&a ge 1 or newp&b ge 1) then newpge1_ly_1529m=1;
newpge1_ly_1529w=0;if gender=2 and 15 <= age&j < 30 and (newp&j ge 1 or newp&x ge 1 or newp&a ge 1 or newp&b ge 1) then newpge1_ly_1529w=1;

sw_1549=0;sw_1849=0;sw_1519=0;sw_2024=0;sw_2529=0;sw_3039=0;sw_ov40=0;sw_newp=0;

if gender=2 and sw&j=1 then do;
	if 15 le age&j lt 50 then sw_1549=1;
	if 18 le age&j lt 50 then sw_1849=1;
	if 15 le age&j lt 20 then sw_1519=1;
	if 20 le age&j lt 25 then sw_2024=1;
	if 25 le age&j lt 30 then sw_2529=1;
	if 30 le age&j lt 40 then sw_3039=1;
	if 		 age&j ge 40 then sw_ov40=1;
	if sw&j=1 then sw_newp=newp&j;
end;

sw_newp_cat=.;
if sw&j =1 then do;
if newp&j=0 then sw_newp_cat=1;
if 1 <= newp&j <= 5 then sw_newp_cat=2;
if 6 <= newp&j <= 40  then sw_newp_cat=3;
if 41 <= newp&j <= 130 then sw_newp_cat=4;
if 131 <= newp&j then sw_newp_cat=5;
end;

sw_newp_cat1=0; if sw_newp_cat=1 then sw_newp_cat1=0;
sw_newp_cat2=0; if sw_newp_cat=2 then sw_newp_cat2=0;
sw_newp_cat3=0; if sw_newp_cat=3 then sw_newp_cat3=0;
sw_newp_cat4=0; if sw_newp_cat=4 then sw_newp_cat4=0;
sw_newp_cat5=0; if sw_newp_cat=5 then sw_newp_cat5=0;


*** % of people with at least 1/2 condomless partners by HIV status for Table K in supplementary material;
npge1_ly_1564_hivpos=0;if hiv&j=1 and 15 <= age&j < 65 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_1564_hivpos=1;
npge2_ly_1564_hivpos=0;if hiv&j=1 and 15 <= age&j < 65 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1564_hivpos=1;

npge1_ly_1564_hivdiag=0;if hiv&j=1 and registd&j=1 and 15 <= age&j < 65 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_1564_hivdiag=1;
npge2_ly_1564_hivdiag=0;if hiv&j=1 and registd&j=1 and 15 <= age&j < 65 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1564_hivdiag=1;

npge1_ly_1564_hivneg=0;if hiv&j=0 and 15 <= age&j < 65 and (nnewp_ly ge 1 or (nnewp_ly=0 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge1_ly_1564_hivneg=1;
npge2_ly_1564_hivneg=0;if hiv&j=0 and 15 <= age&j < 65 and (nnewp_ly ge 2 or (nnewp_ly=1 and (ep&j=1 or ep&x=1 or ep&a=1 or ep&b=1))) then npge2_ly_1564_hivneg=1;

***Survival output for supplementary material;
if infection > . then who4_yn=0; survwho4 = min(who4_date,caldate&j,death)-infection; if survwho4=who4_date-infection then who4_yn=1;
if infection > . then dead_yn=0; survdead = min(death,caldate&j)-infection; if survdead=death-infection then dead_yn=1;

***Survival to date first lost and first returned;
if caldate&j ge yrart > . and date_first_lost_art=. and lost&j=1 then date_first_lost_art=caldate&j;
if t ge 2 and lost&x=1 and lost&j=0 and caldate&j ge date_first_lost_art > . and date_return_lost_art=. then date_return_lost_art=caldate&j;

* note using competing risks approach here;
surv_dead_lost = min(death,caldate&j)-date_first_lost_art; dead_lost_yn=0; if surv_dead_lost = death-date_first_lost_art > . and date_return_lost_art=. then dead_lost_yn=1;
surv_return_lost = min(caldate&j,date_return_lost_art)-date_first_lost_art; return_lost_yn=0; if surv_return_lost = date_return_lost_art-date_first_lost_art > . 
then return_lost_yn=1;

* time to cd4 increase from ART;
if c&j-cd4art ge 100 and date_cd4_100=. then date_cd4_100=caldate&j;
if c&j-cd4art ge 200 and date_cd4_200=. then date_cd4_200=caldate&j;

* time to first viral failure;
if date_first_vfail =. and onart_gt6m_vlg500=1 then date_first_vfail = caldate&j; 

* this is v failure using underlying VL (v) but assuming only look at VL every year, so more comparable with Fox and other SA data;
if date_first_vfail_annual = . and onart_gt6m_vlg1000=1 and caldate&j-yrart in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) then 
date_first_vfail_annual = caldate&j;

if date_first_vfail_r_onart =. and r_onart_gt6m_vlg1000=1 then date_first_vfail_r_onart = caldate&j; 
if date_first_vfail_1000 =. and onart_gt6m_vlg1000=1 then date_first_vfail_1000 = caldate&j; 

if date_rm_maj_vf=. and rm_&j=1 and onart_gt6m_vlg1000=1 then date_rm_maj_vf = caldate&j; 

survvfail = min(date_first_vfail,caldate&j,death)-yrart; vfail_yn=0; if survvfail = date_first_vfail-yrart > . then vfail_yn=1;
survvfail_annual = min( date_first_vfail_annual, caldate&j, death)-yrart; vfail_annual_yn=0; if survvfail_annual = date_first_vfail_annual-yrart > . then 
vfail_annual_yn=1;
survvfail_r_onart = min(date_first_vfail_r_onart,caldate&j,death)-yrart; vfail_r_onart_yn=0; if survvfail_r_onart = date_first_vfail_r_onart-yrart > . then vfail_r_onart_yn=1;
survvfail_1000 = min(date_first_vfail_1000,caldate&j,death)-yrart; vfail_1000_yn=0; if survvfail_1000 = date_first_vfail_1000-yrart > . then vfail_1000_yn=1;
surv_rm_maj_vf = min(date_rm_maj_vf,caldate&j,death)-yrart; rm_maj_vf_yn=0; if surv_rm_maj_vf = date_rm_maj_vf-yrart > . then rm_maj_vf_yn=1;
surv_cd4_100 = min(date_cd4_100,caldate&j,death)-yrart; cd4_100_yn=0; if surv_cd4_100 = date_cd4_100-yrart then cd4_100_yn=1;
surv_cd4_200 = min(date_cd4_200,caldate&j,death)-yrart; cd4_200_yn=0; if surv_cd4_200 = date_cd4_200-yrart then cd4_200_yn=1;
survint = min(date_1st_int,caldate&j,death)-yrart; int_yn=0; if survint = date_1st_int-yrart then int_yn=1;
survlost = min(date_first_lost_art,caldate&j,death)-yrart; lost_yn=0; if survlost = date_first_lost_art-yrart then lost_yn=1;

survdead_a=min(death,caldate&j)-yrart; dead_a_yn=0; if survdead_a=death-yrart then dead_a_yn=1;
survdead_uc=min(death,caldate&j,date_first_lost_art)-yrart; dead_yn_uc=0; if survdead_uc=death-yrart then dead_yn_uc=1;


* AP 29-7-19; * for supplemetary material ;  
* death rate and aids death rate by time from start of art and adh in first period on art;
* note cd4art is cd4 in period before start of art;
* note we do not set art_time_adh_bcd4 = . so these below are cumulative over time;
* note to get results for this need to run the proc freq statement above the proc univariate and save the list file;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 1; if caldate&j = death then art_time_adh_bcd4_dead_g =1; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=1; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 2; if caldate&j = death then art_time_adh_bcd4_dead_g =2; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=2; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 3; if caldate&j = death then art_time_adh_bcd4_dead_g =3; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=3; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 4; if caldate&j = death then art_time_adh_bcd4_dead_g =4; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=4; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 5; if caldate&j = death then art_time_adh_bcd4_dead_g =5; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=5; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 6; if caldate&j = death then art_time_adh_bcd4_dead_g =6; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=6; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 7; if caldate&j = death then art_time_adh_bcd4_dead_g =7; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=7; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 8; if caldate&j = death then art_time_adh_bcd4_dead_g =8; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=8; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 9; if caldate&j = death then art_time_adh_bcd4_dead_g =9; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=9; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 10; if caldate&j = death then art_time_adh_bcd4_dead_g =10; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=10; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 11; if caldate&j = death then art_time_adh_bcd4_dead_g =11; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=11; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 12; if caldate&j = death then art_time_adh_bcd4_dead_g =12; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=12; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 13; if caldate&j = death then art_time_adh_bcd4_dead_g =13; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=13; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 14; if caldate&j = death then art_time_adh_bcd4_dead_g =14; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=14; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 15; if caldate&j = death then art_time_adh_bcd4_dead_g =15; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=15; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 16; if caldate&j = death then art_time_adh_bcd4_dead_g =16; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=16; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 17; if caldate&j = death then art_time_adh_bcd4_dead_g =17; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=17; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 18; if caldate&j = death then art_time_adh_bcd4_dead_g =18; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=18; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 19; if caldate&j = death then art_time_adh_bcd4_dead_g =19; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=19; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 20; if caldate&j = death then art_time_adh_bcd4_dead_g =20; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=20; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 21; if caldate&j = death then art_time_adh_bcd4_dead_g =21; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=21; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 22; if caldate&j = death then art_time_adh_bcd4_dead_g =22; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=22; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 23; if caldate&j = death then art_time_adh_bcd4_dead_g =23; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=23; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 24; if caldate&j = death then art_time_adh_bcd4_dead_g =24; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=24; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 25; if caldate&j = death then art_time_adh_bcd4_dead_g =25; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=25; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 26; if caldate&j = death then art_time_adh_bcd4_dead_g =26; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=26; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 27; if caldate&j = death then art_time_adh_bcd4_dead_g =27; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=27; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 28; if caldate&j = death then art_time_adh_bcd4_dead_g =28; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=28; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 29; if caldate&j = death then art_time_adh_bcd4_dead_g =29; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=29; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 30; if caldate&j = death then art_time_adh_bcd4_dead_g =30; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=30; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 31; if caldate&j = death then art_time_adh_bcd4_dead_g =31; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=31; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 32; if caldate&j = death then art_time_adh_bcd4_dead_g =32; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=32; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 33; if caldate&j = death then art_time_adh_bcd4_dead_g =33; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=33; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 34; if caldate&j = death then art_time_adh_bcd4_dead_g =34; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=34; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 35; if caldate&j = death then art_time_adh_bcd4_dead_g =35; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=35; end;


if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 36; if caldate&j = death then art_time_adh_bcd4_dead_g =36; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=36; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 37; if caldate&j = death then art_time_adh_bcd4_dead_g =37; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=37; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 38; if caldate&j = death then art_time_adh_bcd4_dead_g =38; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=38; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 39; if caldate&j = death then art_time_adh_bcd4_dead_g =39; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=39; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 40; if caldate&j = death then art_time_adh_bcd4_dead_g =40; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=40; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 41; if caldate&j = death then art_time_adh_bcd4_dead_g =41; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=41; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 42; if caldate&j = death then art_time_adh_bcd4_dead_g =42; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=42; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 43; if caldate&j = death then art_time_adh_bcd4_dead_g =43; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=43; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 44; if caldate&j = death then art_time_adh_bcd4_dead_g =44; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=44; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 45; if caldate&j = death then art_time_adh_bcd4_dead_g =45; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=45; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 46; if caldate&j = death then art_time_adh_bcd4_dead_g =46; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=46; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 47; if caldate&j = death then art_time_adh_bcd4_dead_g =47; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=47; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 48; if caldate&j = death then art_time_adh_bcd4_dead_g =48; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=48; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 49; if caldate&j = death then art_time_adh_bcd4_dead_g =49; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=49; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 50; if caldate&j = death then art_time_adh_bcd4_dead_g =50; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=50; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 51; if caldate&j = death then art_time_adh_bcd4_dead_g =51; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=51; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 52; if caldate&j = death then art_time_adh_bcd4_dead_g =52; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=52; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 53; if caldate&j = death then art_time_adh_bcd4_dead_g =53; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=53; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 54; if caldate&j = death then art_time_adh_bcd4_dead_g =54; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=54; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 55; if caldate&j = death then art_time_adh_bcd4_dead_g =55; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=55; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 56; if caldate&j = death then art_time_adh_bcd4_dead_g =56; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=56; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 57; if caldate&j = death then art_time_adh_bcd4_dead_g =57; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=57; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 58; if caldate&j = death then art_time_adh_bcd4_dead_g =58; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=58; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 59; if caldate&j = death then art_time_adh_bcd4_dead_g =59; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=59; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 60; if caldate&j = death then art_time_adh_bcd4_dead_g =60; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=60; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 61; if caldate&j = death then art_time_adh_bcd4_dead_g =61; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=61; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 61; if caldate&j = death then art_time_adh_bcd4_dead_g =62; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=62; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 63; if caldate&j = death then art_time_adh_bcd4_dead_g =63; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=63; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 64; if caldate&j = death then art_time_adh_bcd4_dead_g =64; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=64; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 65; if caldate&j = death then art_time_adh_bcd4_dead_g =65; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=65; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 66; if caldate&j = death then art_time_adh_bcd4_dead_g =66; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=66; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 67; if caldate&j = death then art_time_adh_bcd4_dead_g =67; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=67; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 68; if caldate&j = death then art_time_adh_bcd4_dead_g =68; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=68; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 69; if caldate&j = death then art_time_adh_bcd4_dead_g =69; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=69; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 70; if caldate&j = death then art_time_adh_bcd4_dead_g =70; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=70; end;


if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 71; if caldate&j = death then art_time_adh_bcd4_dead_g =71; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=71; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 72; if caldate&j = death then art_time_adh_bcd4_dead_g =72; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=72; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 73; if caldate&j = death then art_time_adh_bcd4_dead_g =73; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=73; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 74; if caldate&j = death then art_time_adh_bcd4_dead_g =74; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=74; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 75; if caldate&j = death then art_time_adh_bcd4_dead_g =75; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=75; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 76; if caldate&j = death then art_time_adh_bcd4_dead_g =76; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=76; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 77; if caldate&j = death then art_time_adh_bcd4_dead_g =77; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=77; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 78; if caldate&j = death then art_time_adh_bcd4_dead_g =78; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=78; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 79; if caldate&j = death then art_time_adh_bcd4_dead_g =79; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=79; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 80; if caldate&j = death then art_time_adh_bcd4_dead_g =80; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=80; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 81; if caldate&j = death then art_time_adh_bcd4_dead_g =81; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=81; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 82; if caldate&j = death then art_time_adh_bcd4_dead_g =82; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=82; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 83; if caldate&j = death then art_time_adh_bcd4_dead_g =83; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=83; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 84; if caldate&j = death then art_time_adh_bcd4_dead_g =84; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=84; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 85; if caldate&j = death then art_time_adh_bcd4_dead_g =85; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=85; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 86; if caldate&j = death then art_time_adh_bcd4_dead_g =86; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=86; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 87; if caldate&j = death then art_time_adh_bcd4_dead_g =87; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=87; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 88; if caldate&j = death then art_time_adh_bcd4_dead_g =88; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=88; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 89; if caldate&j = death then art_time_adh_bcd4_dead_g =89; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=89; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 90; if caldate&j = death then art_time_adh_bcd4_dead_g =90; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=90; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 91; if caldate&j = death then art_time_adh_bcd4_dead_g =91; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=91; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 92; if caldate&j = death then art_time_adh_bcd4_dead_g =92; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=92; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 93; if caldate&j = death then art_time_adh_bcd4_dead_g =93; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=93; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 94; if caldate&j = death then art_time_adh_bcd4_dead_g =94; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=94; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 95; if caldate&j = death then art_time_adh_bcd4_dead_g =95; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=95; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 96; if caldate&j = death then art_time_adh_bcd4_dead_g =96; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=96; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 97; if caldate&j = death then art_time_adh_bcd4_dead_g =97; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=97; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 98; if caldate&j = death then art_time_adh_bcd4_dead_g =98; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=98; end;

if caldate&j - yrart = 0.25 and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 99; if caldate&j = death then art_time_adh_bcd4_dead_g =99; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=99; end;
if caldate&j - yrart = 0.5  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 100; if caldate&j = death then art_time_adh_bcd4_dead_g =100; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=100; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 101; if caldate&j = death then art_time_adh_bcd4_dead_g =101; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=101; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 102; if caldate&j = death then art_time_adh_bcd4_dead_g =102; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=102; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 103; if caldate&j = death then art_time_adh_bcd4_dead_g =103; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=103; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 104; if caldate&j = death then art_time_adh_bcd4_dead_g =104; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=104; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart&j=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 105; if caldate&j = death then art_time_adh_bcd4_dead_g =105; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=105; end;


onart_vlg1 = .;onart_vlg2 = .;onart_vlg3 = .;onart_vlg4 = .;onart_vlg5 = .; 
onart_vlg1_r = .; onart_vlg2_r = .; onart_vlg3_r = .; onart_vlg4_r = .; onart_vlg5_r = .; 
onart_who4_year1=.; onart_who4_year1_vlt1000=.;
onart_who4_year3=.; onart_who4_year3_vlt1000=.;
onart_cd4l200_year1=.; onart_cd4l200_year1_vlt1000=.;
onart_cd4l200_year3=.; onart_cd4l200_year3_vlt1000=.;
onart_res_1stline_linefail0=.; onart_res_1stline =.;
onart_linefail0 = .; onart_linefail0_cl200=.;  onart_cl200=.;  
onart_linefail0_cl50=.;  onart_cl50=.;  
onart_linefail0_vg1000=.; onart_vg1000=.; onart_linefail0_vg1000_r=.; onart_vg1000_r=.; 


if (onart&j=1 or int_clinic_not_aw=1) then do;

	* proportion of time with nactive < 3 for 1st line drugs in which linefail still 0 ;
	if date_res_1stline=. and linefail&j=0 and . < nactive&j < 3 then date_res_1stline=caldate&j;
	onart_res_1stline =0; onart_res_1stline_linefail0=0; if caldate&j ge date_res_1stline > . then do; onart_res_1stline =1; if linefail&j=0 then onart_res_1stline_linefail0=1;  end;
	* proportion with resistance by viral load level;
	onart_vlg1 = 0; onart_vlg1_r = 0; if vlg1&j=1 then do; onart_vlg1 =1; if . < nactive&j < 3 then onart_vlg1_r = 1; ; end;
	onart_vlg2 = 0; onart_vlg2_r = 0; if vlg2&j=1 then do; onart_vlg2 =1; if . < nactive&j < 3 then onart_vlg2_r = 1; ; end;
	onart_vlg3 = 0; onart_vlg3_r = 0; if vlg3&j=1 then do; onart_vlg3 =1; if . < nactive&j < 3 then onart_vlg3_r = 1; ; end;
	onart_vlg4 = 0; onart_vlg4_r = 0; if vlg4&j=1 then do; onart_vlg4 =1; if . < nactive&j < 3 then onart_vlg4_r = 1; ; end;
	onart_vlg5 = 0; onart_vlg5_r = 0; if vlg5&j=1 then do; onart_vlg5 =1; if . < nactive&j < 3 then onart_vlg5_r = 1; ; end;
	* proportion of people with new WHO within 1 year of ART who have VL < 1000, same for 1-3 years, > 3 years;
	onart_who4_year1=0; onart_who4_year1_vlt1000=0; if 0 <= caldate&j - yrart <= 1 and adc&j=1 then do; onart_who4_year1=1; if . < v&j < 3 then onart_who4_year1_vlt1000=1;  end;
	onart_who4_year3=0; onart_who4_year3_vlt1000=0; if 0 <= caldate&j - yrart <= 3 and adc&j=1 then do; onart_who4_year3=1; if . < v&j < 3 then onart_who4_year3_vlt1000=1;  end;
	* proportion of people with CD4 < 200 within 1 year of ART who have VL < 1000, same for 1-3 years, > 3 years;
	onart_cd4l200_year1=0; onart_cd4l200_year1_vlt1000=0; if 0 <= caldate&j - yrart <= 1 and . < c&j < 200 then do; onart_cd4l200_year1=1; if . < v&j < 3 then onart_cd4l200_year1_vlt1000=1;  end;
	onart_cd4l200_year3=0; onart_cd4l200_year3_vlt1000=0; if 0 <= caldate&j - yrart <= 3 and . < c&j < 200 then do; onart_cd4l200_year3=1; if . < v&j < 3 then onart_cd4l200_year3_vlt1000=1;  end;
	* time spent with CD4 < 200 / < 50 (with linefail=0 and overall on art);
	onart_linefail0 = 0; onart_linefail0_cl200=0; if linefail&j=0 then do; onart_linefail0 = 1;  if . < c&j < 200 then onart_linefail0_cl200=1; end;
	onart_cl200=0; if . < c&j < 200 then onart_cl200=1; 
	onart_linefail0 = 0; onart_linefail0_cl50=0; if linefail&j=0 then do; onart_linefail0 = 1;  if . < c&j < 50 then onart_linefail0_cl50=1; end;
	onart_cl50=0; if . < c&j < 50 then onart_cl50=1; 
	* time spent with VL > 1000 (with linefail=0 and overall on art);
	onart_linefail0_vg1000=0; if linefail&j=0 and v&j >= 3 then onart_linefail0_vg1000=1; 
	onart_vg1000=0; if v&j >= 3 then onart_vg1000=1; 
	* time spent with VL > 1000 and resistance (with linefail=0 and overall on art);
	onart_linefail0_vg1000_r=0; if linefail&j=0 and caldate&j ge date_res_1stline > . and v&j >= 3 then onart_linefail0_vg1000_r=1; 
	onart_vg1000_r=0; if v&j >= 3 and caldate&j ge date_res_1stline > . then onart_vg1000_r=1; 
	onart_cl350=0; if cl350 = 1 then onart_cl350 = 1;

end;

*** Attrition;
art_attrit_1yr = 0; art_attrit_1yr_on = 0;  if caldate_never_dot - yrart = 1 then do; art_attrit_1yr = 1; if onart&j=1 or int_clinic_not_aw=1 then art_attrit_1yr_on = 1;  end;
art_attrit_2yr = 0; art_attrit_2yr_on = 0;  if caldate_never_dot - yrart = 2 then do; art_attrit_2yr = 1; if onart&j=1 or int_clinic_not_aw=1 then art_attrit_2yr_on = 1;  end;
art_attrit_3yr = 0; art_attrit_3yr_on = 0;  if caldate_never_dot - yrart = 3 then do; art_attrit_3yr = 1; if onart&j=1 or int_clinic_not_aw=1 then art_attrit_3yr_on = 1;  end;
art_attrit_4yr = 0; art_attrit_4yr_on = 0;  if caldate_never_dot - yrart = 4 then do; art_attrit_4yr = 1; if onart&j=1 or int_clinic_not_aw=1 then art_attrit_4yr_on = 1;  end;
art_attrit_5yr = 0; art_attrit_5yr_on = 0;  if caldate_never_dot - yrart = 5 then do; art_attrit_5yr = 1; if onart&j=1 or int_clinic_not_aw=1 then art_attrit_5yr_on = 1;  end;
art_attrit_6yr = 0; art_attrit_6yr_on = 0;  if caldate_never_dot - yrart = 6 then do; art_attrit_6yr = 1; if onart&j=1 or int_clinic_not_aw=1 then art_attrit_6yr_on = 1;  end;
art_attrit_7yr = 0; art_attrit_7yr_on = 0;  if caldate_never_dot - yrart = 7 then do; art_attrit_7yr = 1; if onart&j=1 or int_clinic_not_aw=1 then art_attrit_7yr_on = 1;  end;
art_attrit_8yr = 0; art_attrit_8yr_on = 0;  if caldate_never_dot - yrart = 8 then do; art_attrit_8yr = 1; if onart&j=1 or int_clinic_not_aw=1 then art_attrit_8yr_on = 1;  end;

linked_to_care_this_period=.; if caldate&j = date_linked_to_care > . then linked_to_care_this_period=1;


*** Dead within 6 months of starting ART;
art_dur_l6m_dead=.;  art_dur_g6m_dead=.;  art_dur_l6m=.;    art_dur_g6m=.;   
art_tdur_l6m_dead=.;  art_tdur_g6m_dead=.;  art_tdur_l6m=.;    art_tdur_g6m=.; 

if (onart&j=1 or int_clinic_not_aw=1) then do;

if caldate&j = death > . and hiv&j=1 and rdcause=1 then do;
if . < caldate&j-yrart <= 0.5 then art_tdur_l6m_dead=1;
if 0.5 < caldate&j-yrart then art_tdur_g6m_dead=1;
end;

if . < caldate&j-yrart <= 0.5 then art_tdur_l6m=1;
if 0.5 < caldate&j-yrart then art_tdur_g6m=1;

if caldate&j = death > . and hiv&j=1  and rdcause=1 then do;
if . < tcur&j <= 2 then art_dur_l6m_dead=1;
if 2 < tcur&j then art_dur_g6m_dead=1;
end;

if . < tcur&j <= 2 then art_dur_l6m=1;
if 2 < tcur&j then art_dur_g6m=1;

if tcur&j=. then do; art_dur_l6m_dead=art_tdur_l6m_dead; art_dur_g6m_dead=art_tdur_g6m_dead; 
art_dur_l6m=art_tdur_l6m; art_dur_g6m=art_tdur_g6m;  end;

end;


*** Total circumcisions and new circumcisions;
mcirc_1519m=0;new_mcirc_1519m=0;if gender=1 and 15 le age&j lt 20 then do; mcirc_1519m=mcirc  ;new_mcirc_1519m=new_mcirc;end;
mcirc_2024m=0;new_mcirc_2024m=0;if gender=1 and 20 le age&j lt 25 then do; mcirc_2024m=mcirc  ;new_mcirc_2024m=new_mcirc;end;
mcirc_2529m=0;new_mcirc_2529m=0;if gender=1 and 25 le age&j lt 30 then do; mcirc_2529m=mcirc  ;new_mcirc_2529m=new_mcirc;end;
mcirc_3039m=0;new_mcirc_3039m=0;if gender=1 and 30 le age&j lt 40 then do; mcirc_3039m=mcirc  ;new_mcirc_3039m=new_mcirc;end;
mcirc_4049m=0;new_mcirc_4049m=0;if gender=1 and 40 le age&j lt 50 then do; mcirc_4049m=mcirc  ;new_mcirc_4049m=new_mcirc;end;
mcirc_50plm=0;new_mcirc_50plm=0;if gender=1 and       age&j ge 50 then do; mcirc_50plm=mcirc  ;new_mcirc_50plm=new_mcirc;end;


new_1519sw=.;new_2024sw=.;new_2529sw=.;new_3039sw=.;new_ge40sw=.;
if 15 le age&j le 65 then do;
	tot_newp = tot_newp + newp&j;
	newp_p3m = tot_newp /((age&j-15)/4);

	years_ep = years_ep + (ep&j/4);
	if ep&j=1 then do;ever_ep=1; p_ep_py = (years_ep)/(age&j-15);end;

	if newp&j ge 1 then ever_newp = 1;

	if t ge 2 and gender=2 and sw&j=1 and sw&x ne 1 then do;
			if 15 le age&j lt 20 then new_1519sw = 1;
			if 20 le age&j lt 25 then new_2024sw = 1;
			if 25 le age&j lt 30 then new_2529sw = 1;
			if 30 le age&j lt 40 then new_3039sw = 1;
			if       age&j ge 40 then new_ge40sw = 1;

		act_years_sw = act_years_sw + 0.25;
	end;
end;

primary_sw=0;   if sw&j=1   and primary&j=1 then primary_sw=1;
sw_vg1000=0;if sw&j=1                 and v&j > 3.0 then sw_vg1000=1;


***People with long term partners;
ep_m&j=0; if gender=1 and ep&j=1 then ep_m&j=1;
ep_w&j=0; if gender=2 and ep&j=1 then ep_w&j=1;

m_1524_ep=0;if  gender=1 and 15 <= age&j < 25 then m_1524_ep=ep&j;
m_2534_ep=0;if  gender=1 and 25 <= age&j < 35 then m_2534_ep=ep&j;
m_3544_ep=0;if  gender=1 and 35 <= age&j < 45 then m_3544_ep=ep&j;
m_4554_ep=0;if  gender=1 and 45 <= age&j < 55 then m_4554_ep=ep&j;
m_5564_ep=0;if  gender=1 and 55 <= age&j < 65 then m_5564_ep=ep&j;

w_1524_ep=0;if  gender=2 and 15 <= age&j < 25 then w_1524_ep=ep&j;
w_2534_ep=0;if  gender=2 and 25 <= age&j < 35 then w_2534_ep=ep&j;
w_3544_ep=0;if  gender=2 and 35 <= age&j < 45 then w_3544_ep=ep&j;
w_4554_ep=0;if  gender=2 and 45 <= age&j < 55 then w_4554_ep=ep&j;
w_5564_ep=0;if  gender=2 and 55 <= age&j < 65 then w_5564_ep=ep&j;


***People with long term partners and newp;
m_1524_epnewp=0;if  gender=1 and 15 <= age&j < 25 and ep&j=1 and newp&j ge 1 then m_1524_epnewp=1;
m_2534_epnewp=0;if  gender=1 and 25 <= age&j < 35 and ep&j=1 and newp&j ge 1 then m_2534_epnewp=1;
m_3544_epnewp=0;if  gender=1 and 35 <= age&j < 45 and ep&j=1 and newp&j ge 1 then m_3544_epnewp=1;
m_4554_epnewp=0;if  gender=1 and 45 <= age&j < 55 and ep&j=1 and newp&j ge 1 then m_4554_epnewp=1;
m_5564_epnewp=0;if  gender=1 and 55 <= age&j < 65 and ep&j=1 and newp&j ge 1 then m_5564_epnewp=1;

w_1524_epnewp=0;if  gender=2 and 15 <= age&j < 25 and ep&j=1 and newp&j ge 1 then w_1524_epnewp=1;
w_2534_epnewp=0;if  gender=2 and 25 <= age&j < 35 and ep&j=1 and newp&j ge 1 then w_2534_epnewp=1;
w_3544_epnewp=0;if  gender=2 and 35 <= age&j < 45 and ep&j=1 and newp&j ge 1 then w_3544_epnewp=1;
w_4554_epnewp=0;if  gender=2 and 45 <= age&j < 55 and ep&j=1 and newp&j ge 1 then w_4554_epnewp=1;
w_5564_epnewp=0;if  gender=2 and 55 <= age&j < 65 and ep&j=1 and newp&j ge 1 then w_5564_epnewp=1;


***For each man, whether they have had 1, 2 or 5 newp in their lifetime
   To try to understand % of men who had FSW partnership;
m_1524_ge1newpever=0;m_2534_ge1newpever=0;m_3544_ge1newpever=0;m_4554_ge1newpever=0;m_5564_ge1newpever=0;
m_1524_ge2newpever=0;m_2534_ge2newpever=0;m_3544_ge2newpever=0;m_4554_ge2newpever=0;m_5564_ge2newpever=0;
m_1524_ge5newpever=0;m_2534_ge5newpever=0;m_3544_ge5newpever=0;m_4554_ge5newpever=0;m_5564_ge5newpever=0;
w_ge1newpever=0;w_ge2newpever=0;w_ge5newpever=0;
if gender=1 then do;
	if 15 <= age&j < 25 and newp_ever ge 1 then m_1524_ge1newpever=1; 
	if 25 <= age&j < 35 and newp_ever ge 1 then m_2534_ge1newpever=1; 
	if 35 <= age&j < 45 and newp_ever ge 1 then m_3544_ge1newpever=1; 
	if 45 <= age&j < 55 and newp_ever ge 1 then m_4554_ge1newpever=1; 
	if 55 <= age&j < 65 and newp_ever ge 1 then m_5564_ge1newpever=1; 

	if 15 <= age&j < 25 and newp_ever ge 2 then m_1524_ge2newpever=1; 
	if 25 <= age&j < 35 and newp_ever ge 2 then m_2534_ge2newpever=1; 
	if 35 <= age&j < 45 and newp_ever ge 2 then m_3544_ge2newpever=1; 
	if 45 <= age&j < 55 and newp_ever ge 2 then m_4554_ge2newpever=1; 
	if 55 <= age&j < 65 and newp_ever ge 2 then m_5564_ge2newpever=1; 

	if 15 <= age&j < 25 and newp_ever ge 5 then m_1524_ge5newpever=1; 
	if 25 <= age&j < 35 and newp_ever ge 5 then m_2534_ge5newpever=1; 
	if 35 <= age&j < 45 and newp_ever ge 5 then m_3544_ge5newpever=1; 
	if 45 <= age&j < 55 and newp_ever ge 5 then m_4554_ge5newpever=1; 
	if 55 <= age&j < 65 and newp_ever ge 5 then m_5564_ge5newpever=1; 
end;
if gender=2 then do;
	if newp_ever ge 1 then w_ge1newpever=1; 
	if newp_ever ge 2 then w_ge2newpever=1; 
	if newp_ever ge 5 then w_ge5newpever=1; 
end;


* People with hiv aged 15-65;
hiv1564=hiv&j; if age&j >= 65 then hiv1564=.;
hiv1549=0; if hiv&j=1 and 15 <= age&j < 50 then hiv1549=1;

hiv1517m=0; if hiv&j=1 and gender=1 and 15 <= age&j < 18 then hiv1517m=1;
hiv1819m=0; if hiv&j=1 and gender=1 and 18 <= age&j < 20 then hiv1819m=1;
hiv1519m=0; if hiv&j=1 and gender=1 and 15 <= age&j < 20 then hiv1519m=1;
hiv2024m=0; if hiv&j=1 and gender=1 and 20 <= age&j < 25 then hiv2024m=1;
hiv2529m=0; if hiv&j=1 and gender=1 and 25 <= age&j < 30 then hiv2529m=1;
hiv3034m=0; if hiv&j=1 and gender=1 and 30 <= age&j < 35 then hiv3034m=1;
hiv3539m=0; if hiv&j=1 and gender=1 and 35 <= age&j < 40 then hiv3539m=1;
hiv4044m=0; if hiv&j=1 and gender=1 and 40 <= age&j < 45 then hiv4044m=1;
hiv4549m=0; if hiv&j=1 and gender=1 and 45 <= age&j < 50 then hiv4549m=1;
hiv5054m=0; if hiv&j=1 and gender=1 and 50 <= age&j < 55 then hiv5054m=1;
hiv5559m=0; if hiv&j=1 and gender=1 and 55 <= age&j < 60 then hiv5559m=1;
hiv6064m=0; if hiv&j=1 and gender=1 and 60 <= age&j < 65 then hiv6064m=1;
hiv6569m=0; if hiv&j=1 and gender=1 and 65 <= age&j < 70 then hiv6569m=1;
hiv7074m=0; if hiv&j=1 and gender=1 and 70 <= age&j < 75 then hiv7074m=1;
hiv7579m=0; if hiv&j=1 and gender=1 and 75 <= age&j < 80 then hiv7579m=1;
hiv8084m=0; if hiv&j=1 and gender=1 and 80 <= age&j < 85 then hiv8084m=1;

hiv1564m=0; if hiv&j=1 and gender=1 and 15 <= age&j < 65 then hiv1564m=1;
hiv1549m=0; if hiv&j=1 and gender=1 and 15 <= age&j < 50 then hiv1549m=1;

hiv1517w=0; if hiv&j=1 and gender=2 and 15 <= age&j < 18 then hiv1517w=1;
hiv1819w=0; if hiv&j=1 and gender=2 and 18 <= age&j < 20 then hiv1819w=1;
hiv1519w=0; if hiv&j=1 and gender=2 and 15 <= age&j < 20 then hiv1519w=1;
hiv2024w=0; if hiv&j=1 and gender=2 and 20 <= age&j < 25 then hiv2024w=1;
hiv2529w=0; if hiv&j=1 and gender=2 and 25 <= age&j < 30 then hiv2529w=1;
hiv3034w=0; if hiv&j=1 and gender=2 and 30 <= age&j < 35 then hiv3034w=1;
hiv3539w=0; if hiv&j=1 and gender=2 and 35 <= age&j < 40 then hiv3539w=1;
hiv4044w=0; if hiv&j=1 and gender=2 and 40 <= age&j < 45 then hiv4044w=1;
hiv4549w=0; if hiv&j=1 and gender=2 and 45 <= age&j < 50 then hiv4549w=1;
hiv5054w=0; if hiv&j=1 and gender=2 and 50 <= age&j < 55 then hiv5054w=1;
hiv5559w=0; if hiv&j=1 and gender=2 and 55 <= age&j < 60 then hiv5559w=1;
hiv6064w=0; if hiv&j=1 and gender=2 and 60 <= age&j < 65 then hiv6064w=1;
hiv6569w=0; if hiv&j=1 and gender=2 and 65 <= age&j < 70 then hiv6569w=1;
hiv7074w=0; if hiv&j=1 and gender=2 and 70 <= age&j < 75 then hiv7074w=1;
hiv7579w=0; if hiv&j=1 and gender=2 and 75 <= age&j < 80 then hiv7579w=1;
hiv8084w=0; if hiv&j=1 and gender=2 and 80 <= age&j < 85 then hiv8084w=1;

hiv1564w=0; if hiv&j=1 and gender=2 and 15 <= age&j < 65 then hiv1564w=1;
hiv1549w=0; if hiv&j=1 and gender=2 and 15 <= age&j < 50 then hiv1549w=1;


***HIV amongst FSW;
hiv_sw=0;hiv_sw1849_=0;hiv_sw1549_=0;hiv_sw1519_=0;hiv_sw2024_=0;hiv_sw2529_=0;hiv_sw3039_=0;hiv_swov40_=0;

if hiv&j=1 and sw&j=1 then do;
	hiv_sw=1;
	if 18 le age&j lt 50 then hiv_sw1849_=1;
	if 15 le age&j lt 50 then hiv_sw1549_=1;
	if 15 le age&j lt 20 then hiv_sw1519_=1;
	if 20 le age&j lt 25 then hiv_sw2024_=1;	
	if 25 le age&j lt 30 then hiv_sw2529_=1;
	if 30 le age&j lt 40 then hiv_sw3039_=1;
	if 		 age&j ge 40 then hiv_swov40_=1;
end;


i_ep=0;diag_ep=0; 
if hiv1564=1 then i_ep=ep&j;
if registd&j=1  then diag_ep=ep&j;

diag_epun=0;if registd&j=1 and ep&j=1 and epdiag&j ne 1 then diag_epun=ep&j;


***HIV specific outputs;
vl50=.; vg50=.; vl200=.; vg200=.; vl1000= .; vg1000=.; vg1000_m=.; vg1000_w=.;
newp_p3m_hiv=.;newp_p3m_diag=.;p_ep_py_hiv=.;p_ep_py_diag=.;
ever_ep_hiv=.;ever_ep_diag=.;ever_newp_hiv=.;ever_newp_diag=.;
ever_sw_hiv=.;ever_sw_diag=.;
dead1564_&j=.;dead_diag=.;

linked_preARTcare_12m=.;linked_preARTcare_6m=.;linked_preARTcare_3m=.;
diag_12m=.;diag_6m=.;diag_3m=.;

if hiv1564=1 then do;

	newp_hiv=newp&j;
	newp_ge1_hiv=0; if newp&j >= 1 then newp_ge1_hiv=1; if newp&j=. then newp_ge1_hiv=.;
	if registd&j=1 then do;
		newp_ge1_hiv_diag=0; if newp&j >= 1 then newp_ge1_hiv_diag=1; if newp&j=. then newp_ge1_hiv_diag=.;
	end;

	newp_p3m_hiv=newp_p3m;
	if registd&j=1 then newp_p3m_diag=newp_p3m;

	p_ep_py_hiv = p_ep_py;
	if registd&j=1 then p_ep_py_diag=p_ep_py;

	ever_ep_hiv = ever_ep;
	if registd&j=1 then ever_ep_diag=ever_ep;

	ever_newp_hiv = ever_newp;
	if registd&j=1 then ever_newp_diag=ever_newp;

	ever_sw_hiv = ever_sw;
	if registd&j=1 then ever_sw_diag=ever_sw;

	if . < v&j < 1.7 then vl50=1; else vl50=0;
	vg50=1-vl50;
	if . < v&j < 2.3 then vl200=1; else vl200=0;
	vg200=1-vl200;
	if . < v&j < 3.0 then vl1000=1; else vl1000=0;
	vg1000=1-vl1000;

	if gender = 1 then do;
	vl1000_m=vl1000;
	vg1000_m=0; if vg1000 = 1 then  vg1000_m = vg1000;
	end;

	if gender = 2 then do;
	vl1000_w=vl1000;
	vg1000_w=0;	if vg1000 = 1 then  vg1000_w = vg1000;
	end;


* two variables indicate vl < 500: vlg1 indexes infectivity and viral load is increased by 0.5 log when
sti present, vl500 takes the v&j as it is;

* increase viral load temporarily if sti;	
	if sti&j=1 then v&j = v&j + 0.5;

	if   . <  v&j < 2.7 and primary&j=0  then vlg1&j=1;else vlg1&j=0;
	if 2.7 <= v&j < 3.7 and primary&j=0  then vlg2&j=1;else vlg2&j=0;
	if 3.7 <= v&j < 4.7 and primary&j=0  then vlg3&j=1;else vlg3&j=0;
	if 4.7 <= v&j < 5.7 and primary&j=0  then vlg4&j=1;else vlg4&j=0;
	if 5.7 <= v&j 		and primary&j=0  then vlg5&j=1;else vlg5&j=0;
	if 						primary&j=1  then vlg6&j=1;else vlg6&j=0;

***Used to calculate the viral load distribution of people during new partnerships (ep+newp);
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_np=np&j; i_v1_ep=ep&j; i_v1_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_np=np&j; i_v2_ep=ep&j; i_v2_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_np=np&j; i_v3_ep=ep&j; i_v3_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_np=np&j; i_v4_ep=ep&j; i_v4_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_np=np&j; i_v5_ep=ep&j; i_v5_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_np=np&j; i_v6_ep=ep&j; i_v6_newp=newp&j; end;

	if  gender = 1 and .  <  v&j < 3 and primary&j=0  then do; i_vl1000_m_np=np&j; i_v11000_m_ep=ep&j; i_vl1000_m_newp=newp&j; end;
	if  gender = 2 and .  <  v&j < 3 and primary&j=0  then do; i_vl1000_w_np=np&j; i_v11000_w_ep=ep&j; i_vl1000_w_newp=newp&j; end;

	if gender=1 and 15 <= age&j < 25 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age1_m_np=np&j; i_v1_age1_m_ep=ep&j; i_v1_age1_m_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age1_m_np=np&j; i_v2_age1_m_ep=ep&j; i_v2_age1_m_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age1_m_np=np&j; i_v3_age1_m_ep=ep&j; i_v3_age1_m_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age1_m_np=np&j; i_v4_age1_m_ep=ep&j; i_v4_age1_m_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age1_m_np=np&j; i_v5_age1_m_ep=ep&j; i_v5_age1_m_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age1_m_np=np&j; i_v6_age1_m_ep=ep&j; i_v6_age1_m_newp=newp&j; end;
	end;
	if gender=1 and 25 <= age&j < 35 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age2_m_np=np&j; i_v1_age2_m_ep=ep&j; i_v1_age2_m_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age2_m_np=np&j; i_v2_age2_m_ep=ep&j; i_v2_age2_m_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age2_m_np=np&j; i_v3_age2_m_ep=ep&j; i_v3_age2_m_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age2_m_np=np&j; i_v4_age2_m_ep=ep&j; i_v4_age2_m_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age2_m_np=np&j; i_v5_age2_m_ep=ep&j; i_v5_age2_m_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age2_m_np=np&j; i_v6_age2_m_ep=ep&j; i_v6_age2_m_newp=newp&j; end;
	end;
	if gender=1 and 35 <= age&j < 45 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age3_m_np=np&j; i_v1_age3_m_ep=ep&j; i_v1_age3_m_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age3_m_np=np&j; i_v2_age3_m_ep=ep&j; i_v2_age3_m_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age3_m_np=np&j; i_v3_age3_m_ep=ep&j; i_v3_age3_m_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age3_m_np=np&j; i_v4_age3_m_ep=ep&j; i_v4_age3_m_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age3_m_np=np&j; i_v5_age3_m_ep=ep&j; i_v5_age3_m_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age3_m_np=np&j; i_v6_age3_m_ep=ep&j; i_v6_age3_m_newp=newp&j; end;
	end;
	if gender=1 and 45 <= age&j < 55 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age4_m_np=np&j; i_v1_age4_m_ep=ep&j; i_v1_age4_m_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age4_m_np=np&j; i_v2_age4_m_ep=ep&j; i_v2_age4_m_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age4_m_np=np&j; i_v3_age4_m_ep=ep&j; i_v3_age4_m_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age4_m_np=np&j; i_v4_age4_m_ep=ep&j; i_v4_age4_m_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age4_m_np=np&j; i_v5_age4_m_ep=ep&j; i_v5_age4_m_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age4_m_np=np&j; i_v6_age4_m_ep=ep&j; i_v6_age4_m_newp=newp&j; end;
	end;
	if gender=1 and 55 <= age&j < 65 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age5_m_np=np&j; i_v1_age5_m_ep=ep&j; i_v1_age5_m_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age5_m_np=np&j; i_v2_age5_m_ep=ep&j; i_v2_age5_m_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age5_m_np=np&j; i_v3_age5_m_ep=ep&j; i_v3_age5_m_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age5_m_np=np&j; i_v4_age5_m_ep=ep&j; i_v4_age5_m_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age5_m_np=np&j; i_v5_age5_m_ep=ep&j; i_v5_age5_m_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age5_m_np=np&j; i_v6_age5_m_ep=ep&j; i_v6_age5_m_newp=newp&j; end;
	end;


	if gender=2 and 15 <= age&j < 25 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age1_w_np=np&j; i_v1_age1_w_ep=ep&j; i_v1_age1_w_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age1_w_np=np&j; i_v2_age1_w_ep=ep&j; i_v2_age1_w_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age1_w_np=np&j; i_v3_age1_w_ep=ep&j; i_v3_age1_w_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age1_w_np=np&j; i_v4_age1_w_ep=ep&j; i_v4_age1_w_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age1_w_np=np&j; i_v5_age1_w_ep=ep&j; i_v5_age1_w_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age1_w_np=np&j; i_v6_age1_w_ep=ep&j; i_v6_age1_w_newp=newp&j; end;
	end;
	if gender=2 and 25 <= age&j < 35 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age2_w_np=np&j; i_v1_age2_w_ep=ep&j; i_v1_age2_w_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age2_w_np=np&j; i_v2_age2_w_ep=ep&j; i_v2_age2_w_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age2_w_np=np&j; i_v3_age2_w_ep=ep&j; i_v3_age2_w_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age2_w_np=np&j; i_v4_age2_w_ep=ep&j; i_v4_age2_w_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age2_w_np=np&j; i_v5_age2_w_ep=ep&j; i_v5_age2_w_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age2_w_np=np&j; i_v6_age2_w_ep=ep&j; i_v6_age2_w_newp=newp&j; end;
	end;
	if gender=2 and 35 <= age&j < 45 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age3_w_np=np&j; i_v1_age3_w_ep=ep&j; i_v1_age3_w_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age3_w_np=np&j; i_v2_age3_w_ep=ep&j; i_v2_age3_w_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age3_w_np=np&j; i_v3_age3_w_ep=ep&j; i_v3_age3_w_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age3_w_np=np&j; i_v4_age3_w_ep=ep&j; i_v4_age3_w_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age3_w_np=np&j; i_v5_age3_w_ep=ep&j; i_v5_age3_w_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age3_w_np=np&j; i_v6_age3_w_ep=ep&j; i_v6_age3_w_newp=newp&j; end;
	end;
	if gender=2 and 45 <= age&j < 55 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age4_w_np=np&j; i_v1_age4_w_ep=ep&j; i_v1_age4_w_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age4_w_np=np&j; i_v2_age4_w_ep=ep&j; i_v2_age4_w_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age4_w_np=np&j; i_v3_age4_w_ep=ep&j; i_v3_age4_w_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age4_w_np=np&j; i_v4_age4_w_ep=ep&j; i_v4_age4_w_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age4_w_np=np&j; i_v5_age4_w_ep=ep&j; i_v5_age4_w_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age4_w_np=np&j; i_v6_age4_w_ep=ep&j; i_v6_age4_w_newp=newp&j; end;
	end;
	if gender=2 and 55 <= age&j < 65 then do;
	if  .  <  v&j < 2.7 and primary&j=0  then do; i_v1_age5_w_np=np&j; i_v1_age5_w_ep=ep&j; i_v1_age5_w_newp=newp&j; end;
	if 2.7 <= v&j < 3.7 and primary&j=0  then do; i_v2_age5_w_np=np&j; i_v2_age5_w_ep=ep&j; i_v2_age5_w_newp=newp&j; end;
	if 3.7 <= v&j < 4.7 and primary&j=0  then do; i_v3_age5_w_np=np&j; i_v3_age5_w_ep=ep&j; i_v3_age5_w_newp=newp&j; end;
	if 4.7 <= v&j < 5.7 and primary&j=0  then do; i_v4_age5_w_np=np&j; i_v4_age5_w_ep=ep&j; i_v4_age5_w_newp=newp&j; end;
	if 5.7 <= v&j		and primary&j=0  then do; i_v5_age5_w_np=np&j; i_v5_age5_w_ep=ep&j; i_v5_age5_w_newp=newp&j; end;
	if 					    primary&j=1  then do; i_v6_age5_w_np=np&j; i_v6_age5_w_ep=ep&j; i_v6_age5_w_newp=newp&j; end;
	end;

	i_age1_m_np=0; if gender=1 and 15 <= age&j < 25 then i_age1_m_np=np&j;
	i_age2_m_np=0; if gender=1 and 25 <= age&j < 35 then i_age2_m_np=np&j;
	i_age3_m_np=0; if gender=1 and 35 <= age&j < 45 then i_age3_m_np=np&j;
	i_age4_m_np=0; if gender=1 and 45 <= age&j < 55 then i_age4_m_np=np&j;
	i_age5_m_np=0; if gender=1 and 55 <= age&j < 65 then i_age5_m_np=np&j;

	i_m_1549_np=0; if gender=1 and 15 <= age&j < 50 then i_m_1549_np=np&j;

	i_age1_w_np=0; if gender=2 and 15 <= age&j < 25 then i_age1_w_np=np&j;
	i_age2_w_np=0; if gender=2 and 25 <= age&j < 35 then i_age2_w_np=np&j;
	i_age3_w_np=0; if gender=2 and 35 <= age&j < 45 then i_age3_w_np=np&j;
	i_age4_w_np=0; if gender=2 and 45 <= age&j < 55 then i_age4_w_np=np&j;
	i_age5_w_np=0; if gender=2 and 55 <= age&j < 65 then i_age5_w_np=np&j;

	i_w_1549_np=0; if gender=2 and 15 <= age&j < 50 then i_w_1549_np=np&j;

	i_age1_m_newp=0; if gender=1 and 15 <= age&j < 25 then i_age1_m_newp=newp&j;
	i_age2_m_newp=0; if gender=1 and 25 <= age&j < 35 then i_age2_m_newp=newp&j;
	i_age3_m_newp=0; if gender=1 and 35 <= age&j < 45 then i_age3_m_newp=newp&j;
	i_age4_m_newp=0; if gender=1 and 45 <= age&j < 55 then i_age4_m_newp=newp&j;
	i_age5_m_newp=0; if gender=1 and 55 <= age&j < 65 then i_age5_m_newp=newp&j;

	i_age1_w_newp=0; if gender=2 and 15 <= age&j < 25 then i_age1_w_newp=newp&j;
	i_age2_w_newp=0; if gender=2 and 25 <= age&j < 35 then i_age2_w_newp=newp&j;
	i_age3_w_newp=0; if gender=2 and 35 <= age&j < 45 then i_age3_w_newp=newp&j;
	i_age4_w_newp=0; if gender=2 and 45 <= age&j < 55 then i_age4_w_newp=newp&j;
	i_age5_w_newp=0; if gender=2 and 55 <= age&j < 65 then i_age5_w_newp=newp&j;


	i_m_d_newp&j=0; if registd&j=1 and gender=1 then i_m_d_newp=newp&j;
	i_w_d_newp&j=0; if registd&j=1 and gender=2 then i_w_d_newp=newp&j;

	i_m_np&j=0; if gender=1 then i_m_np=np&j;
	i_w_np&j=0; if gender=2 then i_w_np=np&j;


	if sw&j=1 then do;
		if  .  <  v&j < 2.7 and primary&j=0  then i_fsw_v1_np=np&j;
		if 2.7 <= v&j < 3.7 and primary&j=0  then i_fsw_v2_np=np&j;
		if 3.7 <= v&j < 4.7 and primary&j=0  then i_fsw_v3_np=np&j;
		if 4.7 <= v&j < 5.7 and primary&j=0  then i_fsw_v4_np=np&j;
		if 5.7 <= v&j		and primary&j=0  then i_fsw_v5_np=np&j;
		if 						primary&j=1  then i_fsw_v6_np=np&j;
	end;


	* decrease again viral load if sti;
	if sti&j=1 then v&j = v&j - 0.5;

	* presence of any mutation;
	rm_&j=0; if hiv1564=1 and (c_rt103m=1 or c_rt181m=1 or c_rt190m=1 or c_rt65m=1 or c_rt184m=1 or c_rt151m=1 or c_rttams >= 1 
	or c_pr32m=1 or c_pr33m=1 or c_pr46m=1 or c_pr47m=1 or c_pr50vm=1 or c_pr50lm=1 or c_pr54m&j=1  or c_pr76m=1 
	or c_pr82m=1 or c_pr84m=1 or c_pr88m=1 or c_pr90m=1 or c_inpm=1 or c_insm=1) then rm_&j=1;
	
	* presence of any mutation;
	rme_&j=0; if hiv1564=1 and (e_rt103m=1 or e_rt181m=1 or e_rt190m=1 or e_rt65m=1  or e_rt184m=1 or e_rt151m=1 or e_rttams >= 1 
	or e_pr32m=1 or e_pr33m=1 or e_pr46m=1 or e_pr47m=1 or e_pr50vm=1 or e_pr50lm=1 or e_pr54m&j=1  or e_pr76m=1 
	or e_pr82m=1 or e_pr84m=1 or e_pr88m=1 or e_pr90m=1 or e_inpm=1 or e_insm=1) then rme_&j=1;

	* presence of any ii mutation;
	iime_&j=0; if hiv1564=1 and (e_inpm=1 or e_insm=1) then iime_&j=1;
	
	* presence of any nn mutation;
	nnme_&j=0; if hiv1564=1 and (e_rt103m=1 or e_rt181m=1 or e_rt190m=1) then nnme_&j=1;
	
	* presence of any nn mutation by gender;  * apr 19;
	nnme_w_=0; if hiv1564=1 and gender=2 and (e_rt103m=1 or e_rt181m=1 or e_rt190m=1) then nnme_w_=1;
	nnme_m_=0; if hiv1564=1 and gender=1 and (e_rt103m=1 or e_rt181m=1 or e_rt190m=1) then nnme_m_=1;

	* presence of any pi mutation;
	pime_&j=0; if hiv1564=1 and (e_pr32m=1 or e_pr33m=1 or e_pr46m=1 or e_pr47m=1 or e_pr50vm=1 or e_pr50lm=1 or e_pr54m&j=1  
	or e_pr76m=1 or e_pr82m=1 or e_pr84m=1 or e_pr88m=1 or e_pr90m=1) then pime_&j=1;
	
	* presence of any nrti mutation;
	nrtime_&j=0; if hiv1564=1 and (e_rt65m=1  or e_rt184m=1 or e_rt151m=1 or e_rttams >= 1) then nrtime_&j=1;

	* presence of any resistance mutation according to viral load;
	i_r_vlg1_np=0; if hiv1564=1 and rm_&j=1 and vlg1&j=1 then i_r_vlg1_np=np&j;
	i_r_vlg2_np=0; if hiv1564=1 and rm_&j=1 and vlg2&j=1 then i_r_vlg2_np=np&j;
	i_r_vlg3_np=0; if hiv1564=1 and rm_&j=1 and vlg3&j=1 then i_r_vlg3_np=np&j;
	i_r_vlg4_np=0; if hiv1564=1 and rm_&j=1 and vlg4&j=1 then i_r_vlg4_np=np&j;
	i_r_vlg5_np=0; if hiv1564=1 and rm_&j=1 and vlg5&j=1 then i_r_vlg5_np=np&j;
	i_r_vlg6_np=0; if hiv1564=1 and rm_&j=1 and primary&j=1 then i_r_vlg6_np=np&j;


	* whether diagnosed, according to viral load and resistance;
	i_diag_vlg1_rm0_np=0; if hiv1564=1 and registd&j=1 and vlg1&j=1 and rm_&j=0 then i_diag_vlg1_rm0_np=np&j;
	i_diag_vlg1_rm1_np=0; if hiv1564=1 and registd&j=1 and vlg1&j=1 and rm_&j=1 then i_diag_vlg1_rm1_np=np&j;
	
	i_diag_vlg2_rm0_np=0; if hiv1564=1 and registd&j=1 and vlg2&j=1 and rm_&j=0 then i_diag_vlg2_rm0_np=np&j;
	i_diag_vlg2_rm1_np=0; if hiv1564=1 and registd&j=1 and vlg2&j=1 and rm_&j=1 then i_diag_vlg2_rm1_np=np&j;

	i_diag_vlg3_rm0_np=0; if hiv1564=1 and registd&j=1 and vlg3&j=1 and rm_&j=0 then i_diag_vlg3_rm0_np=np&j;
	i_diag_vlg3_rm1_np=0; if hiv1564=1 and registd&j=1 and vlg3&j=1 and rm_&j=1 then i_diag_vlg3_rm1_np=np&j;
	
	i_diag_vlg4_rm0_np=0; if hiv1564=1 and registd&j=1 and vlg4&j=1 and rm_&j=0 then i_diag_vlg4_rm0_np=np&j;
	i_diag_vlg4_rm1_np=0; if hiv1564=1 and registd&j=1 and vlg4&j=1 and rm_&j=1 then i_diag_vlg4_rm1_np=np&j;

	i_diag_vlg5_rm0_np=0; if hiv1564=1 and registd&j=1 and vlg5&j=1 and rm_&j=0 then i_diag_vlg5_rm0_np=np&j;
	i_diag_vlg5_rm1_np=0; if hiv1564=1 and registd&j=1 and vlg5&j=1 and rm_&j=1 then i_diag_vlg5_rm1_np=np&j;
	
	i_diag_vlg6_rm0_np=0; if hiv1564=1 and registd&j=1 and vlg6&j=1 and rm_&j=0 then i_diag_vlg6_rm0_np=np&j;
	i_diag_vlg6_rm1_np=0; if hiv1564=1 and registd&j=1 and vlg6&j=1 and rm_&j=1 then i_diag_vlg6_rm1_np=np&j;
	

	* whether art naive, according to viral load and resistance;
	i_naive_vlg1_rm0_np=0; if hiv1564=1 and naive&j=1 and vlg1&j=1 and registd&j=1 and rm_&j=0 then i_naive_vlg1_rm0_np=np&j;
	i_naive_vlg1_rm1_np=0; if hiv1564=1 and naive&j=1 and vlg1&j=1 and registd&j=1 and rm_&j=1 then i_naive_vlg1_rm1_np=np&j;
	
	i_naive_vlg2_rm0_np=0; if hiv1564=1 and naive&j=1 and vlg2&j=1 and registd&j=1 and rm_&j=0 then i_naive_vlg2_rm0_np=np&j;
	i_naive_vlg2_rm1_np=0; if hiv1564=1 and naive&j=1 and vlg2&j=1 and registd&j=1 and rm_&j=1 then i_naive_vlg2_rm1_np=np&j;

	i_naive_vlg3_rm0_np=0; if hiv1564=1 and naive&j=1 and vlg3&j=1 and registd&j=1 and rm_&j=0 then i_naive_vlg3_rm0_np=np&j;
	i_naive_vlg3_rm1_np=0; if hiv1564=1 and naive&j=1 and vlg3&j=1 and registd&j=1 and rm_&j=1 then i_naive_vlg3_rm1_np=np&j;

	i_naive_vlg4_rm0_np=0; if hiv1564=1 and naive&j=1 and vlg4&j=1 and registd&j=1 and rm_&j=0 then i_naive_vlg4_rm0_np=np&j;
	i_naive_vlg4_rm1_np=0; if hiv1564=1 and naive&j=1 and vlg4&j=1 and registd&j=1 and rm_&j=1 then i_naive_vlg4_rm1_np=np&j;
	
	i_naive_vlg5_rm0_np=0; if hiv1564=1 and naive&j=1 and vlg5&j=1 and registd&j=1 and rm_&j=0 then i_naive_vlg5_rm0_np=np&j;
	i_naive_vlg5_rm1_np=0; if hiv1564=1 and naive&j=1 and vlg5&j=1 and registd&j=1 and rm_&j=1 then i_naive_vlg5_rm1_np=np&j;

	i_naive_vlg6_rm0_np=0; if hiv1564=1 and naive&j=1 and vlg6&j=1 and registd&j=1 and rm_&j=0 then i_naive_vlg6_rm0_np=np&j;
	i_naive_vlg6_rm1_np=0; if hiv1564=1 and naive&j=1 and vlg6&j=1 and registd&j=1 and rm_&j=1 then i_naive_vlg6_rm1_np=np&j;


*** Distribution of resistance mutations amongst those with resistance to inform rm in the infectious pool;

	if rm_&j=1 then do;
		tam1_&j=0; if c_rttams=1 then tam1_&j=1;
		tam2_&j=0; if c_rttams=2 then tam2_&j=1;
		tam3_&j=0; if c_rttams >=3 then tam3_&j=1;
		k103m_&j=0;  if c_rt103m=1  then k103m_&j=1;
		y181m_&j=0;  if c_rt181m=1  then y181m_&j=1;
		g190m_&j=0;  if c_rt190m=1  then g190m_&j=1;
		nnm_&j=0;  
		if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 then nnm_&j=1;

		m184m_&j=0;if c_rt184m=1 then m184m_&j=1;
		q151m_&j=0;if c_rt151m=1 then q151m_&j=1;
		k65m_&j=0; if c_rt65m=1  then k65m_&j=1;
		p32m_&j=0; if c_pr32m=1  then p32m_&j=1;
		p33m_&j=0; if c_pr33m=1  then p33m_&j=1;
		p46m_&j=0; if c_pr46m=1  then p46m_&j=1;
		p47m_&j=0; if c_pr47m=1  then p47m_&j=1;
		p50vm_&j=0; if c_pr50vm=1  then p50vm_&j=1;
		p50lm_&j=0; if c_pr50lm=1  then p50lm_&j=1;
		p54m_&j=0; if c_pr54m&j=1  then p54m_&j=1;
		p76m_&j=0; if c_pr76m=1  then p76m_&j=1;
		p82m_&j=0; if c_pr82m=1  then p82m_&j=1;
		p84m_&j=0; if c_pr84m=1  then p84m_&j=1;
		p88m_&j=0; if c_pr88m=1  then p88m_&j=1;
		p90m_&j=0; if c_pr90m=1  then p90m_&j=1;
		pim_&j=0; 
		if p32m_&j=1 or p33m_&j=1 or p46m_&j=1 or
		p47m_&j=1 or p50vm_&j=1 or p50lm_&j=1 or 
		p54m_&j=1 or p76m_&j=1 or p82m_&j=1 or p84m_&j=1  or p88m_&j=1 or
		p90m_&j=1 then pim_&j=1;
		inpm_&j=0;  if c_inpm=1  then inpm_&j=1;
		insm_&j=0;  if c_insm=1  then insm_&j=1;
		inm_&j=0;   if inpm_&j=1 or insm_&j=1 then inm_&j=1;
	end;

	i_tam=0; i_nnm=0; i_im=0; i_184m=0; i_pim=0; i_65m=0;
	if primary&j=1 then do; 
		i_pim=max(0,pim_&j); 
		if c_rttams ge 1 then i_tam = 1;  
		i_184m=c_rt184m;
		i_65m=c_rt65m;
		if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 then i_nnm=1;
		if c_inpm=1 or c_insm=1 then i_im=1;  
		i_rm&j=rm_&j; 
	end;

	if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 or c_rt65m=1 or c_rt184m=1 or c_rttams >= 1 or c_rt151m=1
	or c_pr32m=1  or c_pr33m=1 	or c_pr46m=1  or c_pr47m=1 or c_pr50vm=1 or c_pr50lm=1 or c_pr54m&j=1 
	or c_pr76m=1  or c_pr82m=1  or c_pr84m=1  or c_pr88m=1 or c_pr90m=1  or c_inpm=1   or c_insm=1
	then i_rm&j=1; if primary&j ne 1 then i_rm&j=.;

	if primary&j=1 then do; r_&j=0;
		if r_zdv  >= 0.5 or r_efa  >= 0.5 or r_nev  >= 0.5 or r_ten  >= 0.5 or r_3tc  >= 0.5 
		or r_dar >= 0.5 or r_lpr >= 0.5  or r_taz&j >= 0.5 or r_dol >= 0.5 then r_&j=1;
	end;


	r_vg50=.; 
	if vg50=1 then do;
		r_vg50=0; if rm_&j=1 then  r_vg50=1;
	end;

	r_vg200=.; 
	if vg200=1 then do;
		r_vg200=0; if rm_&j=1 then  r_vg200=1;
	end;

	r_vg1000=.; 
	if vg1000=1 then do;
	r_vg1000=0; if rm_&j=1 then  r_vg1000=1;
	end;


	art_start=0; nnm_art=0; im_art=0; r_art=0; nactive_art_start_lt3 = .;nactive_art_start_lt2 = .;nactive_art_start_lt1p5 = .;nn_res_pmtct_art_notdr=0;
	nnm_art_m=0;art_start_m=0; art_start_w=0; art_start_pregnant=0;  * note that currently art_start_pregnant does not fully capture all starts in
	pregnancy or breastfeeding because pregnant=1 only in the period of birth, not the two previous periods;

	if caldate&j=yrart >. then do;
		art_start=1;
		if gender=1 then art_start_m=1; if gender=2 then art_start_w=1; 
		if gender=2 and (pregnant=1 or . < caldate&j - dt_lastbirth <= 1) then art_start_pregnant=1;

		if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 then nnm_art=1;
		if nnm_art=1 and gender=1 then nnm_art_m=1;if nnm_art=1 and gender=2 then nnm_art_w=1;

		if c_rt103m = 1 and i_nnm ne 1 and nn_res_pmtct=1 then nn_res_pmtct_art_notdr=1;
		pim_art=max(0,pim_&j); 
		if c_rttams ge 1 then tam_art = 1;  
		m184_art=c_rt184m; 
		if c_inpm=1 or c_insm=1 then im_art = 1;
		r_art=0;
		if r_zdv  >= 0.5 or r_efa  >= 0.5 or r_nev  >= 0.5 or r_ten  >= 0.5 or r_3tc  >= 0.5 
		or r_dar >= 0.5 or r_lpr >= 0.5 or r_taz&j >= 0.5 or r_dol >= 0.5 then r_art=1; 
		nactive_art_start_lt3 = 0; if . < nactive_start_art < 3 then nactive_art_start_lt3 = 1;
		nactive_art_start_lt2 = 0; if . < nactive_start_art < 2 then nactive_art_start_lt2 = 1;
		nactive_art_start_lt1p5 = 0; if . < nactive_start_art < 1.5 then nactive_art_start_lt1p5 = 1;
	end; 

	nactive_line2_lt4 =0; if . < nactive_line2 < 4 then nactive_line2_lt4 = 1;
	nactive_line2_lt3 =0; if . < nactive_line2 < 3 then nactive_line2_lt3 = 1;
	nactive_line2_lt2 =0; if . < nactive_line2 < 2 then nactive_line2_lt2 = 1;
	nactive_line2_lt1p5 =0; if . < nactive_line2 < 1.5 then nactive_line2_lt1p5 = 1;

	if hiv1564=1 then dead1564_&j=dead&j; if age&j <15 or age&j >= 65 then dead1564_&j=.;
	if registd&j=1 then dead_diag=dead1564_&j;

	cl50=0;cl100=0;cl200=0;cl350=0;
	if . < c&j < 50 then cl50=1; if c&j=. then cl50=.;
	if . < c&j < 100 then cl100=1; if c&j=. then cl100=.;
	if . < c&j < 200 then cl200=1; if c&j=. then cl200=.;
	if . < c&j < 350 then cl350=1; if c&j=. then cl350=.;
	if . < c&j < 500 then cl500=1; if c&j=. then cl500=.;

	elig_treat200=0; if hiv1564=1 and (naive&j=0 or cl200=1 or who4_&j=1) then elig_treat200=1;
	elig_treat350=0; if hiv1564=1 and (naive&j=0 or cl350=1 or who4_&j=1) then elig_treat350=1;
	elig_treat500=0; if hiv1564=1 and (naive&j=0 or cl500=1 or who4_&j=1) then elig_treat500=1;


	****Stage 1: linkage to care;
	diag_12m = .; if caldate&j-date1pos=1    then diag_12m=1;
	diag_6m  = .; if caldate&j-date1pos=0.5  then diag_6m=1;
	diag_3m  = .; if caldate&j-date1pos=0.25 then diag_3m=1;
	linked_preARTcare_12m = 0; if diag_12m = 1 and (cm   ne . or cm_tm1 ne . or cm_tm2 ne . or cm_tm3 ne .) 
	then linked_preARTcare_12m=1;
	linked_preARTcare_6m = 0;  if diag_6m = 1 and (cm   ne . or cm_tm1 ne . or cm_tm2 ne .) then linked_preARTcare_6m=1;
	linked_preARTcare_3m = 0;  if diag_3m = 1 and (cm   ne . or cm_tm1 ne . )             then linked_preARTcare_3m=1;

	***Stage 2: For those whom were not eligible for treatment at staging, how many were visited in the next year;
	staged_12m=.;
	if ((art_intro_date le date_staging lt 2010 and cd4_staging gt 200) or
	   (2010            le date_staging         and cd4_staging gt 350))
	   and who4_staging ne 1 and caldate&j-date_staging=1 then staged_12m=1;
	Ret_preARTcare_12m = 0; if staged_12m = 1 and (cm ne . or cm_tm1 ne . or cm_tm2 ne . or cm_tm3 ne . ) 
	then Ret_preARTcare_12m=1;

	***Stage 3: Prop initiated to ART of those linked ot care, of those linked ot care eligible; 
	if date_staging ne . and caldate&j-dt_first_elig ge 1 and
		((art_intro_date le caldate&j lt 2010 and elig_treat200&j=1) or 
		( 					caldate&j ge 2010 and elig_treat350&j=1)) then staged_eligm1y=1;
	if staged_eligm1y=1 and naive&j ne 1 then inART_staged_eligm1y=1;

	***Stage 1-2;
	RetPreART_m12mdiag=0;if caldate&j-date1pos ge 1 and naive&j=1 and date_staging ne . and visit&j=1 then RetPreART_m12mdiag=1;
	m12mdiag=0;          if caldate&j-date1pos ge 1 and naive&j=1        							  then m12mdiag=1;


	***Stage 1-3;
	*Proportion initiated on ART at/6 12 months of those eligible at diagnosis;
		eligatdiag_1y=0;       if date_staging = dt_first_elig and date_staging ne . and caldate&j-dt_first_elig = 1 			       then eligatdiag_1y=1;
		inART_eligatdiag_1y=0; if date_staging = dt_first_elig and date_staging ne . and caldate&j-dt_first_elig = 1 and naive&j ne 1 then inART_eligatdiag_1y=1;
		onART_eligatdiag_1y=0; if inART_eligatdiag_1y=1 and onart&j=1 then onART_eligatdiag_1y=1;

	***Stage 2-3;
	Ret_preARTcare_naive=0;if elig_mcd4_=1 and naive&j=1 and visit&j=1 then Ret_preARTcare_naive=1;

***Outputs for specific periods;
	inf_primary=0; inf_vlsupp=0;inf_newp=0;inf_ep=0;inf_diag=0;inf_naive=0;

	if primary&j=1 then do;
		if infected_primary=1 then inf_primary=1;
		if infected_vlsupp=1  then inf_vlsupp=1;
		if infected_newp=1    then inf_newp=1;
		if infected_ep=1      then inf_ep=1;
		if infected_diagnosed=1 then inf_diag=1;
		if infected_naive=1    then inf_naive=1;
		if r_&j=1 then do;
			inf_tdr_prim=0;inf_tdr_diag=0;inf_tdr_naive=0;inf_tdr_vlsupp=0;inf_tdr_newp=0;
			if infected_primary=1   then inf_tdr_prim=1;
			if infected_diagnosed=1 then inf_tdr_diag=1;
			if infected_naive=1     then inf_tdr_naive=1;
			if infected_vlsupp=1    then inf_tdr_vlsupp=1;
			if infected_newp=1      then inf_tdr_newp=1;
		end;
	end;

	backincare=0;if lost&x=1 and visit&j=1 then backincare=1;


end; * this closes loop for hiv + only;

*** Status of concordant/discordant partnerships;
hiv0epi1_w=0; if gender=2 and hiv&j=0 and epi&j=1 then hiv0epi1_w=1; 
hiv1epi0_w=0; if gender=2 and hiv&j=1 and epi&j=0 then hiv1epi0_w=1; 
hiv1epi1_w=0; if gender=2 and hiv&j=1 and epi&j=1 then hiv1epi1_w=1; 
hiv0epi1_m=0; if gender=1 and hiv&j=0 and epi&j=1 then hiv0epi1_m=1; 
hiv1epi0_m=0; if gender=1 and hiv&j=1 and epi&j=0 then hiv1epi0_m=1; 
hiv1epi1_m=0; if gender=1 and hiv&j=1 and epi&j=1 then hiv1epi1_m=1; 
*** Existing partner infected this period;
hiv0epprim=0; if hiv&j=0 and epi&j=1 and epi&x=0 and ep&x=1 then hiv0epprim=1; 

*** Virally supressed on ART;
if prep   ne 1 then do;
	* No time restriction on ART;
	vl1000_art=.;
	if onart&j = 1 then vl1000_art=vl1000;
	* No time restriction on ART, including interruption clinic unaware;
	onart_iicu = .; vl1000_art_iicu = .;
	if (onart&j = 1 or int_clinic_not_aw) = 1 then onart_iicu=1;
	if onart_iicu=1 then vl1000_art_iicu = vl1000;
	* On ART >6m;
	onart_gt6m = .; vl1000_art_gt_6m = .;
	if onart&j = 1 and tcur&j > 2 then onart_gt6m = 1;
	if onart_gt6m=1 then vl1000_art_gt6m= vl1000;
	* On ART >6m, including interruption clinic unaware; ;
	onart_gt6m_iicu=.;vl1000_art_gt6m_iicu = .; 
	if ((onart&j = 1 and tcur&j > 2) or (int_clinic_not_aw = 1 and caldate&j - yrart > 0.5)) then onart_gt6m_iicu =1;
	if onart_gt6m_iicu=1 then vl1000_art_gt6m_iicu = vl1000; 
end;

***As above, stratified by gender;
vl1000_art_m =.;onart_iicu_m=.;vl1000_art_iicu_m=.;onart_gt6m_m=.;vl1000_art_gt_6m_m=.;onart_gt6m_iicu_m=.;vl1000_art_gt6m_iicu_m=.;
vl1000_art_w =.;onart_iicu_w=.;vl1000_art_iicu_w=.;onart_gt6m_w=.;vl1000_art_gt_6m_w=.;onart_gt6m_iicu_w=.;vl1000_art_gt6m_iicu_w=.;

if gender=1 then do;
	vl1000_art_m 		= vl1000_art;

	onart_iicu_m 		= onart_iicu;
	vl1000_art_iicu_m 	= vl1000_art_iicu;

	onart_gt6m_m 		= onart_gt6m;
	vl1000_art_gt_6m_m	= vl1000_art_gt_6m;

	onart_gt6m_iicu_m	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_m = vl1000_art_gt6m_iicu;
end;

if gender=2 then do;
	vl1000_art_w 		= vl1000_art;

	onart_iicu_w 		= onart_iicu;
	vl1000_art_iicu_w 	= vl1000_art_iicu;

	onart_gt6m_w		= onart_gt6m; 
	vl1000_art_gt_6m_w	= vl1000_art_gt_6m;

	onart_gt6m_iicu_w	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_w = vl1000_art_gt6m_iicu;
end;

*** As above, stratified by age;
if 15 <= age&j < 25 then do;
	vl1000_art_1524_ 		= vl1000_art;

	onart_iicu_1524_ 		= onart_iicu;
	vl1000_art_iicu_1524_ 	= vl1000_art_iicu;

	onart_gt6m_1524_		= onart_gt6m; 
	vl1000_art_gt_6m_1524_	= vl1000_art_gt_6m;

	onart_gt6m_iicu_1524_	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_1524_ = vl1000_art_gt6m_iicu;
end;

if 25 <= age&j < 50 then do;
	vl1000_art_2549_ 		= vl1000_art;

	onart_iicu_2549_ 		= onart_iicu;
	vl1000_art_iicu_2549_ 	= vl1000_art_iicu;

	onart_gt6m_2549_		= onart_gt6m; 
	vl1000_art_gt_6m_2549_	= vl1000_art_gt_6m;

	onart_gt6m_iicu_2549_	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_2549_ = vl1000_art_gt6m_iicu;
end;

if 50 <= age&j  then do;
	vl1000_art_50pl_ 		= vl1000_art;

	onart_iicu_50pl_ 		= onart_iicu;
	vl1000_art_iicu_50pl_ 	= vl1000_art_iicu;

	onart_gt6m_50pl_		= onart_gt6m; 
	vl1000_art_gt_6m_50pl_	= vl1000_art_gt_6m;

	onart_gt6m_iicu_50pl_	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_50pl_ = vl1000_art_gt6m_iicu;
end;

vl1000_art_incintcun_sw=.;   if sw&j=1      then vl1000_art_incintcun_sw    = vl1000_art_iicu;


*** On ART, VL >1000;
onart_vlg1000=0; if onart&j=1 and vl1000=0 then onart_vlg1000=1;
*** On ART for >6m, VL (and measured vl) EVER >1000;
if onart&j=1 and vl1000=0 and tcur&j ge 2 then ever_onart_gt6m_vlg1000=1;
if onart&j=1 and vm > log10(1000) and tcur&j ge 2 then ever_onart_gt6m_vl_m_g1000=1;
*** On ART for >6m, current VL >1000;
onart_gt6m_vlg1000=0; if ((onart&j=1 and tcur&j ge 2) or int_clinic_not_aw=1) and v&j >= log10(1000)  and caldate&j ge yrart+0.5 > . then onart_gt6m_vlg1000=1;
*** Really on ART for >6m, current VL >1000;
r_onart_gt6m_vlg1000=0; if (onart&j=1 and tcur&j ge 2) and vl1000=0 and caldate&j ge yrart+0.5  > . then r_onart_gt6m_vlg1000=1;

if epvls&j ne 1 then epvls&j=0;

*** VL at 12m /24m after starting ART;
art_12m=.; art_24m=.; vl1000_art_12m =.; vl1000_art_24m = .; art_12m_onart=.; vl1000_art_12m_onart=.;
lost_12m=.; visit_12m=.; offart_12m=.;
line2_12m=.; vl1000_line2_12m=.; vl1000_line2_12m_onart=.; line2_12m_onart=.;
r_vg1000_art_12m_onart=.;
lost_6m=.;  lost_24m=.; lost_36m=.; visit_6m=.; visit_24m=.;visit_36m=.;visit_60m=.;

if yrart = caldate&j-1 > . then do; 
	art_12m=1; 	vl1000_art_12m = vl1000; 
	if (onart&j=1 or int_clinic_not_aw=1) 			  then do; art_12m_onart=1;vl1000_art_12m_onart=0;end;
	if (onart&j=1 or int_clinic_not_aw=1) and vl1000=1 then vl1000_art_12m_onart=1;
	if (onart&j=1 or int_clinic_not_aw=1) and vg1000=1 then r_vg1000_art_12m_onart=r_vg1000;

	offart_12m=0; if onart&j=0 and int_clinic_not_aw ne 1 then offart_12m=1;
	lost_12m=0;   if lost&j=1 then lost_12m=1;
	visit_12m=0;  if visit&j=1 then visit_12m=1;
end;

if caldate&j = yrart+2 > . then do; art_24m=1; vl1000_art_24m = vl1000; end;

*** VL at 12m on 2nd line;
if caldate&j = date_line2+1 > . then do; 
	line2_12m=1; vl1000_line2_12m = vl1000; 
	if (onart&j=1 or int_clinic_not_aw=1) then line2_12m_onart=1;
	if (onart&j=1 or int_clinic_not_aw=1) and vl1000=1 then vl1000_line2_12m_onart=1;
end;

if yrart = caldate&j-0.5 > . then do; 
	visit_6m=0;  if visit&j=1 then visit_6m=1;
	lost_6m=0;   if lost&j=1  then lost_6m=1;
end;
if yrart = caldate&j-2 > . then do; 
	visit_24m=0;  if visit&j=1 then visit_24m=1;
	lost_24m=0;   if lost&j=1  then lost_24m=1;
end;
if yrart = caldate&j-3 > . then do; 
	visit_36m=0;  if visit&j=1 then visit_36m=1;
	lost_36m=0;   if lost&j=1  then lost_36m=1;
end;
if yrart = caldate&j-5 > . then do;
	visit_60m=0;  if visit&j=1 then visit_60m=1;
end;

*** Underlying virological failure at any point in the past;
u_vfail1=0; if caldate&j ge date_u_vfail > . then u_vfail1=1;
*** Viral load categories at 1st line failure;
line1_fail_this_period=0;
vl_vfail1_g1=0; vl_vfail1_g2=0; vl_vfail1_g3=0; vl_vfail1_g4=0; vl_vfail1_g5=0; vl_vfail1_g6=0; res_vfail1=0;
if linefail&x=0 and linefail&j=1 then do;
	line1_fail_this_period=1;
	if .< vl_fail1 < 3 then vl_vfail1_g1 = 1;
	if 3 <= vl_fail1 < 3.5 then vl_vfail1_g2 = 1;
	if 3.5 <= vl_fail1 < 4 then vl_vfail1_g3 = 1;
	if 4 <= vl_fail1 < 4.5 then vl_vfail1_g4 = 1;
	if 4.5 <= vl_fail1 < 5 then vl_vfail1_g5 = 1;
	if 5 <= vl_fail1  then vl_vfail1_g6 = 1;
	res_vfail1 = 0; if r_fail ge 1 then res_vfail1=1;
end;


if onart&j=1 then do;
	hiv1564_onart&j=hiv1564;
	dead1564_onart&j=dead1564_&j;
end;

*** Diagnosed and on ART by sex and ep;
artexp=0; if naive&j=0 then artexp=1; 
if      gender=1 then do; diag_m=registd&j; epdiag_m=epdiag&j; epi_m=epi&j; onart_m=onart&j; eponart_m=epart&j; end;
else if gender=2 then do; diag_w=registd&j; epdiag_w=epdiag&j; epi_w=epi&j; onart_w=onart&j; eponart_w=epart&j; end;

***VL on 2nd line;
if (onart&j=1 or int_clinic_not_aw=1) and caldate&j >= date_line2 > . then line2_incl_int_clinic_not_aw = 1;
if line2_incl_int_clinic_not_aw = 1 and vl1000=1 then vl1000_line2=1;
if line2_incl_int_clinic_not_aw = 1 and pim_&j=1 then pim_line2=1;

onart_cd4_g500=0;  if (onart&j=1 or int_clinic_not_aw=1) and c&j >= 500 then onart_cd4_g500=1;


*Prep;
elig_prep_epdiag=0;if registd&j ne 1 and hard_reach=0 and epdiag&j=1 then elig_prep_epdiag=1;
elig_prep=0;       if registd&j ne 1 and hard_reach=0 and (epi&j=1 or newp&j ge 2) then elig_prep=1;
hr_noprep=0;       if (epi&j=1 or newp&j ge 2) and prep   ne 1 then hr_noprep=1;

primary_prep=0;     if primary&j=1 and infected_prep=1 then primary_prep=1;
primary_hr_noprep=0;if primary&j=1 and hr_noprep=1     then primary_hr_noprep=1;
hiv1_prep=0; 	   if hiv&j=1 and prep  =1 then hiv1_prep=1;
if infected_prep=1 then do;
	primary_r_prep=r_&j;*new infections with TDR;
	ever_i_nor_prep=0;
	if primary_r_prep=1 then i_r_prep=1;
	if primary_r_prep=0 then ever_i_nor_prep=1;*Subjects ever infected while on PrEP without TDR;
end;

*Subjects ever infected while on PrEP without TDR who acquire resistance;
if ever_i_nor_prep=1 then rm_prep=rm_&j;

years_on_prep=dt_prep_e-dt_prep_s;

*Outcomes relating to PrEP;


*Number of people eligible for PrEP;
elig_prep_epdiag=0;	*if registd&j ne 1 and hard_reach=0 and epdiag&j=1 then elig_prep_epdiag=1;
					if prep_elig=1 and epdiag&j=1 then elig_prep_epdiag=1;
elig_prep=0;       	*if registd&j ne 1 and hard_reach=0 and (epi&j=1 or newp&j ge 2) then elig_prep=1; 
					if prep_elig=1 then elig_prep=1;
* high risk but not on prep;
hr_noprep=0;      		if (epi&j=1 or newp&j ge 2) and registd&j ne 1 and prep   ne 1 then hr_noprep=1;
primary_hr_noprep=0;	if primary&j=1 and hr_noprep=1 then primary_hr_noprep=1;

* number on prep women age 15-24;
prep_w_1524 = 0 ; if prep   =1 and gender =2 and 15 <= age&j < 25 then prep_w_1524 = 1 ;

* number of sex workers on prep;
prep_sw = 0 ; if prep   =1 and sw&j=1 then prep_sw = 1 ;


*At start of PrEP;
prepstart=0; age_prepstart=.; ep_prepstart=.; newp_prepstart=.;
if dt_prep_s=caldate&j then do;
	prepstart=1;
	age_prepstart=age&j;
	ep_prepstart=ep&j;
	newp_prepstart=newp&j;
end;

*People accidentally on PrEP due to window period;  
started_prep_in_primary =0; if hiv&j=1 and dt_prep_s=caldate&j and primary&j = 1 then do; started_prep_in_primary =1;
started_prep_in_primary_e =1; end;

*Resistance related to PreP;
primary_prep=0; 
if infected_prep=1 and primary&j=1 then do;
	primary_prep=1; * infected in this period while having been on prep;     
	primary_r_prep=c_rm_inf; * new infections with TDR; * may17;
	ever_i_nor_prep=0;
	if primary_r_prep=1 then i_r_prep=1;
	if primary_r_prep ne 1 then ever_i_nor_prep=1; *Subjects EVER infected while on PrEP without TDR;
end;


* if infected by a person with prep resistance - infected_prep_source_prep_r;

*Subjects ever infected while on PrEP without TDR who acquire resistance;
if ever_i_nor_prep=1 then rm_prep=rm_&j;

*Whether resistance was transmitted or acquired when infected whilst on prep;
infected_prep_no_r=0; infected_prep_r=0; 
if primary_prep=1 and started_prep_in_primary_e ne 1 then do;
	*Whether the source partner had any mutations at time of infection;
	if mut_p >= 1 then prepinfect_rm_p=1;	
	if m184m_p = 1 then prepinfect_m184m_p=1;
	if k65m_p = 1 then prepinfect_k65m_p=1;
	if tam_p >= 1 then prepinfect_tam_p=1;
	if (m184m_p+k65m_p+tam_p) >= 1 then prepinfect_prep_r_p=1;
	if inpm_p >= 1 then prepinfect_inpm_p=1;
	if insm_p >= 1 then prepinfect_insm_p=1;
	*Whether these resistant virus were passed onto the individual;
	if rm_inf = 1 then prepinfect_rtm=1; * may17;
	if (c_rt184m_inf+c_rt65m_inf+c_rttams_inf) >= 1 then prepinfect_prep_r=1;
	if c_rt65m_inf >= 1 then prepinfect_k65m=1;
	if c_rt184m_inf = 1 then prepinfect_m184m=1;
	if c_inpm_inf = 1 then prepinfect_inpm=1;
	if c_insm_inf = 1 then prepinfect_insm=1;
	if c_rttams_inf >= 1 then prepinfect_tam=1;
	if prepinfect_prep_r ne 1 then do; infected_prep_no_r=1; ev_infected_prep_no_r=1; end;
	if prepinfect_prep_r = 1 then infected_prep_r=1;
end;

***Infected while on prep with drug res virus (e stands for ever);
if infected_prep_r=1 then infected_prep_r_e = 1;
if infected_prep_no_r=1 then infected_prep_no_r_e = 1;

* AP 21-7-19;
cur_res_prep_drug=0; if (e_rttams + e_rt184m + e_rt65m) ge 1  then cur_res_prep_drug=1;
cur_res_prep_drug_tld=0; if (e_rttams + e_rt184m + e_rt65m + e_inpm + e_insm) ge 1  then cur_res_prep_drug_tld=1;
cur_res_3tc=0; if r_3tc > 0  then cur_res_3tc=1;
cur_res_ten=0; if r_ten > 0  then cur_res_ten=1;
cur_res_efa=0; if r_efa > 0  then cur_res_efa=1;
cur_res_dol=0; if r_dol > 0  then cur_res_dol=1;

* number of people infectious with resistance mutations;
cur_res_3tc_vlg1000=0; if c_rt184m=1 and vg1000 = 1 then cur_res_3tc_vlg1000=1;
cur_res_ten_vlg1000=0; if c_rt65m=1 and vg1000 = 1 then cur_res_ten_vlg1000=1;
cur_res_efa_vlg1000=0; if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 then cur_res_efa_vlg1000=1; * may17 h;
cur_res_dol_vlg1000=0; if c_insm=1 or c_inpm=1 then cur_res_dol_vlg1000=1;


*If on PrEP and HIV-positive;
hiv1_prep=0; 	   if hiv&j=1 and prep  =1 then do; hiv1_prep=1;  ever_hiv1_prep=1; end;

if ever_hiv1_prep=1 then do; 
cur_res_efa_ever_hiv1_prep =0 ; if cur_res_efa = 1 then cur_res_efa_ever_hiv1_prep =1;
cur_res_dol_ever_hiv1_prep =0 ; if cur_res_dol = 1 then cur_res_dol_ever_hiv1_prep =1;
cur_res_ten_ever_hiv1_prep =0 ; if cur_res_ten = 1 then cur_res_ten_ever_hiv1_prep =1;
cur_res_3tc_ever_hiv1_prep =0 ; if cur_res_3tc = 1 then cur_res_3tc_ever_hiv1_prep =1;
end;

* proportion of hiv tests on prep which are +ve;
if t ge 4 then do; * jan18 ;
test_3m_on_prep =.; test_3m_on_prep_pos=.; test_gt_3m_on_prep =.; test_gt_3m_on_prep_pos=.;
if prep_tm2 ne 1 and prep_tm1=1 and tested&j=1 then do; test_3m_on_prep =1; test_3m_on_prep_pos=0; if caldate&j = date1pos then test_3m_on_prep_pos=1; end;
if prep_tm2=1 and prep_tm1=1 and prep=1 then do; test_gt_3m_on_prep =1; test_gt_3m_on_prep_pos=0; if caldate&j = date1pos then test_gt_3m_on_prep_pos=1; end;
end;

*Time from first to last use of prep;
years_on_prep=0; 
if prep_ever=1 then years_on_prep=dt_prep_e-dt_prep_s;


*Number of HIV tests in the previous year for people currently on PrEP;
n_test_prevyr_onprep = 0;
if &j > 4 and prep=1 and (. < caldate&j-dt_last_test < 1) then n_test_prevyr_onprep=sum(tested&j,tested&x,tested&a,tested&b);

*Discontinutation (through choice) and re-initiation of PrEP;
ever_stopped_prep_choice=0; preprestart=0; 
if dt_prep_e=caldate&j and stop_prep_choice=1 then ever_stopped_prep_choice=1;
if dt_prep_rs=caldate&j then preprestart=1;
if dt_prep_c=caldate&j then prep_continue_np_ge1=1;


* Time from infection whilst on PrEP and whether they are still on PrEP after 3, 6, 9, 12, 18 months - only applies when pop_wide_tld not in place;
if  infected_prep=1 and pop_wide_tld ne 1 then do;
	time_from_infection=caldate&j-infection;
	time_stop_prep= dt_prep_e+0.25-infection;

	if time_from_infection=0.25 then onprep_3=prep&j;
	if time_from_infection=0.5  then onprep_6=prep&j;
	if time_from_infection=0.75 then onprep_9=prep&j;
	if time_from_infection=1.0  then onprep_12=prep&j;
	if time_from_infection=1.5  then onprep_18=prep&j;
end;

* resistance profile for people infected whilst on PrEP (whether this was acquired or transmitted);
if infected_prep=1 then do;

	if time_from_infection=0.25 then do;
		rt65m_3_prep =c_rt65m; rt184m_3_prep=c_rt184m; rttams_3_prep=c_rttams; if (rt65m_3_prep + rt184m_3_prep + rttams_3_prep) >= 1 
		then prep_r_3m_from_i_on_prep=1;  rtm_3_prep=rm_&j;
	end;
	else if time_from_infection=0.5 then do;
		rt65m_6_prep =c_rt65m; rt184m_6_prep=c_rt184m; rttams_6_prep=c_rttams; if (rt65m_6_prep + rt184m_6_prep + rttams_6_prep) >= 1 
		then prep_r_6m_from_i_on_prep=1; rtm_6_prep=rm_&j;
	end;
	else if time_from_infection=0.75 then do;
		rt65m_9_prep =c_rt65m; rt184m_9_prep=c_rt184m; rttams_9_prep=c_rttams; if (rt65m_9_prep + rt184m_9_prep + rttams_9_prep) >= 1 
		then prep_r_9m_from_i_on_prep=1; rtm_9_prep=rm_&j;
	end;
	else if time_from_infection=1 then do;
		rt65m_12_prep =c_rt65m; rt184m_12_prep=c_rt184m; rttams_12_prep=c_rttams; if (rt65m_12_prep + rt184m_12_prep + rttams_12_prep) >= 1 
		then prep_r_12m_from_i_on_prep=1; rtm_12_prep=rm_&j;
	end;
	else if time_from_infection=1.5 then do;
		rt65m_18_prep =c_rt65m; rt184m_18_prep=c_rt184m; rttams_18_prep=c_rttams; if (rt65m_18_prep + rt184m_18_prep + rttams_18_prep) >= 1 
		then prep_r_18m_from_i_on_prep=1; rtm_18_prep=rm_&j;
	end;

end;

* resistance profile for people infected whilst on PrEP but not with resistant virus;
if infected_prep=1 and i_r_prep ne 1  then do;
	time_acq_rt65m  = caldate&j -infection; if acq_rt65m=1  then time_acq_rt65m = dt_acq_rt65m -infection;
	time_acq_rt184m = caldate&j -infection; if acq_rt184m=1 then time_acq_rt184m= dt_acq_rt184m-infection;
	time_acq_rtm    = caldate&j -infection; if acq_rtm=1     then time_acq_rtm   = dt_acq_rtm   -infection;
	
	if time_from_infection=0.25 then do;
		acq_rt65m_3_prep =c_rt65m; acq_rt184m_3_prep=c_rt184m; acq_rtm_3_prep=rm_&j;
	end;
	else if time_from_infection=0.5 then do;
		acq_rt65m_6_prep =c_rt65m; acq_rt184m_6_prep=c_rt184m; acq_rtm_6_prep=rm_&j;
	end;
	else if time_from_infection=0.75 then do;
		acq_rt65m_9_prep =c_rt65m; acq_rt184m_9_prep=c_rt184m; acq_rtm_9_prep=rm_&j;
	end;
	else if time_from_infection=1 then do;
		acq_rt65m_12_prep =c_rt65m; acq_rt184m_12_prep=c_rt184m; acq_rtm_12_prep=rm_&j;
	end;
	else if time_from_infection=1.5 then do;
		acq_rt65m_18_prep =c_rt65m; acq_rt184m_18_prep=c_rt184m; acq_rtm_18_prep=rm_&j;
	end;

	if time_from_infection=0.25 then onprep_3_i_prep_no_r=prep&j;
	if time_from_infection=0.5  then onprep_6_i_prep_no_r=prep&j;
	if time_from_infection=0.75 then onprep_9_i_prep_no_r=prep&j;
	if time_from_infection=1.0  then onprep_12_i_prep_no_r=prep&j;
	if time_from_infection=1.5  then onprep_18_i_prep_no_r=prep&j;

end;

*Adherence to PrEP at time of infection;
if caldate&j = infection > . then do;
inf_prep_adhg80 =0;	if prep=1 and        adh&j gt 0.8	then inf_prep_adhg80 =primary&j;
inf_prep_adh5080=0;	if prep=1 and 0.5 lt adh&j le 0.8	then inf_prep_adh5080=primary&j;
inf_prep_adhl50 =0;	if prep=1 and  .  lt adh&j le 0.5	then inf_prep_adhl50 =primary&j;
end;
*Adherence to PrEP;
prep_adhg80 =0;	if prep=1 and        adh&j gt 0.8	then prep_adhg80 =1;
prep_adh5080=0;	if prep=1 and 0.5 lt adh&j le 0.8	then prep_adh5080=1;
prep_adhl50 =0;	if prep=1 and  .  lt adh&j le 0.5	then prep_adhl50 =1;

*To calculate proportion of people on PrEP;
onprep_1549=0; onprep_m=0; onprep_w=0; onprep_sw=0; onprep_1524=0; onprep_1524w=0;
if prep=1 then do;
	if (15<=age&j<49) then onprep_1549=1;
	if gender=1 and (15<=age&j<49) then onprep_m=1;
	if gender=2 and (15<=age&j<49) then onprep_w=1;
	if sw&j=1 then onprep_sw=1;
	if (15<=age&j<25) then onprep_1524=1;
	if gender=2 and (15<=age&j<25) then onprep_1524w=1;
end;


if ev_infected_prep_no_r=1 and caldate&j-infection = 0.25 and prep=1 then do;
prep_3m_after_inf_no_r=1; prep_3m_after_inf_no_r_65=0; if c_rt65m = 1 then prep_3m_after_inf_no_r_65=1;
prep_3m_after_inf_no_r=1; prep_3m_after_inf_no_r_184=0; if c_rt184m = 1 then prep_3m_after_inf_no_r_184=1;
end;
if ev_infected_prep_no_r = 1 and caldate&j-infection = 0.50 and prep=1 then do;
prep_6m_after_inf_no_r=1; prep_6m_after_inf_no_r_65=0; if c_rt65m = 1 then prep_6m_after_inf_no_r_65=1;
prep_6m_after_inf_no_r=1; prep_6m_after_inf_no_r_184=0; if c_rt184m = 1 then prep_6m_after_inf_no_r_184=1;
end;
if ev_infected_prep_no_r = 1 and caldate&j-infection = 1.00 and prep=1 then do;
prep_12m_after_inf_no_r=1; prep_12m_after_inf_no_r_65=0; if c_rt65m = 1 then prep_12m_after_inf_no_r_65=1;
prep_12m_after_inf_no_r=1; prep_12m_after_inf_no_r_184=0; if c_rt184m = 1 then prep_12m_after_inf_no_r_184=1;
end;


hiv_prep_reason_1=.;hiv_prep_reason_2=.;hiv_prep_reason_3=.;hiv_prep_reason_4=.;
if hiv1_prep=1 then do;
if started_prep_in_primary_e = 1 then hiv_prep_reason_1=1;
if started_prep_hiv_test_sens_e = 1 then hiv_prep_reason_2=1;
if infected_prep=1 and infected_prep_r_e=1 then hiv_prep_reason_3=1;
if infected_prep=1 and infected_prep_no_r_e=1 then hiv_prep_reason_4=1;
end;


infected_ep_w=0; if gender=2 and infected_ep=1 then infected_ep_w=infected_ep;
infected_ep_m=0; if gender=1 and infected_ep=1 then infected_ep_m=infected_ep;
infected_newp_w=0; if gender=2 and infected_newp=1 then infected_newp_w=infected_newp;
infected_newp_m=0; if gender=1 and infected_newp=1 then infected_newp_m=infected_newp;


*Testing outcomes;

if 15 le age&j lt 50 then tested1549_=tested&j;
if gender=1 and 15 le age&j lt 50 then tested1549m=tested&j;
if gender=2 and 15 le age&j lt 50 then tested1549w=tested&j;


***Access to being  tested given some are hard to reach;
acc_test=0;acc_test_1524_=0;acc_test_2549_=0;acc_test_5064_=0;acc_test_sw=0;
if hard_reach=0 then do;
	acc_test=1;
	if 15 le age&j lt 25 then acc_test_1524_=1;
	if 25 le age&j lt 50 then acc_test_2549_=1;
	if 50 le age&j lt 65 then acc_test_5064_=1;
	if sw&j=1 	     then acc_test_sw=1;
end;


tested_ly_m1549_=0; tested_ly_m1519_=0; tested_ly_m2024_=0; tested_ly_m2529_=0;tested_ly_m3039_=0; tested_ly_m4049_=0; tested_ly_m5064_=0;
tested_ly_w1549_=0; tested_ly_w1519_=0; tested_ly_w2024_=0; tested_ly_w2529_=0;tested_ly_w3039_=0; tested_ly_w4049_=0; tested_ly_w5064_=0; 
tested_ly_sw=0;

if t ge 4 and (tested&j=1 or tested&x=1 or tested&a=1 or tested&b=1) then do;
	if gender=1 then do;
		if 15 le age&j lt 50 then tested_ly_m1549_=1; 
		if 15 le age&j lt 20 then tested_ly_m1519_=1; 
		if 20 le age&j lt 25 then tested_ly_m2024_=1;
		if 25 le age&j lt 30 then tested_ly_m2529_=1;
		if 30 le age&j lt 40 then tested_ly_m3039_=1;
		if 40 le age&j lt 50 then tested_ly_m4049_=1;
		if 50 le age&j lt 65 then tested_ly_m5064_=1;
	end;
	else if gender=2 then do;
		if 15 le age&j lt 50 then tested_ly_w1549_=1;
		if 15 le age&j lt 20 then tested_ly_w1519_=1;
		if 20 le age&j lt 25 then tested_ly_w2024_=1;
		if 25 le age&j lt 30 then tested_ly_w2529_=1;
		if 30 le age&j lt 40 then tested_ly_w3039_=1;
		if 40 le age&j lt 50 then tested_ly_w4049_=1;
		if 50 le age&j lt 65 then tested_ly_w5064_=1;
		if sw&j=1       		 then tested_ly_sw=1;

	end;
end;


ever_tested_m=.;if gender=1 and ever_tested=1 then ever_tested_m=1;
ever_tested_w=.;if gender=2 and ever_tested=1 then ever_tested_w=1;

ever_tested_m1549_=0;ever_tested_m1564_=0;
ever_tested_m1519_=0;ever_tested_m2024_=0;ever_tested_m2529_=0;ever_tested_m3034_=0;ever_tested_m3539_=0;ever_tested_m4044_=0;
ever_tested_m4549_=0;ever_tested_m5054_=0;ever_tested_m5559_=0;ever_tested_m6064_=0;  
ever_tested_w1549_=0;ever_tested_w1564_=0;
ever_tested_w1519_=0;ever_tested_w2024_=0;ever_tested_w2529_=0;ever_tested_w3034_=0;ever_tested_w3539_=0;ever_tested_w4044_=0;
ever_tested_w4549_=0;ever_tested_w5054_=0;ever_tested_w5559_=0;ever_tested_w6064_=0;  
ever_tested_sw=0; 	

diag_m1549_=0;diag_m1564_=0;
diag_m1519_=0;diag_m2024_=0;diag_m2529_=0;diag_m3034_=0;diag_m3539_=0;diag_m4044_=0;diag_m4549_=0;diag_m5054_=0;diag_m5559_=0;diag_m6064_=0;  
diag_w1549_=0;diag_w1564_=0;
diag_w1519_=0;diag_w2024_=0;diag_w2529_=0;diag_w3034_=0;diag_w3539_=0;diag_w4044_=0;diag_w4549_=0;diag_w5054_=0;diag_w5559_=0;diag_w6064_=0;  
diag_sw=0; 	

onart_m1549_=0;onart_m1564_=0;
onart_m1519_=0;onart_m2024_=0;onart_m2529_=0;onart_m3034_=0;onart_m3539_=0;onart_m4044_=0;onart_m4549_=0;onart_m5054_=0;onart_m5559_=0;onart_m6064_=0;  
onart_w1549_=0;onart_w1564_=0;
onart_w1519_=0;onart_w2024_=0;onart_w2529_=0;onart_w3034_=0;onart_w3539_=0;onart_w4044_=0;onart_w4549_=0;onart_w5054_=0;onart_w5559_=0;onart_w6064_=0;  
onart_sw=0; 	

if gender=1 then do;
	if      15 le age&j lt 50 then do; ever_tested_m1549_=ever_tested; diag_m1549_=registd&j;  onart_m1549_=onart&j; end;
	if      15 le age&j lt 65 then do; ever_tested_m1564_=ever_tested; diag_m1564_=registd&j;  onart_m1564_=onart&j; end;
	if      15 le age&j lt 20 then do; ever_tested_m1519_=ever_tested; diag_m1519_=registd&j;  onart_m1519_=onart&j; end;
	else if 20 le age&j lt 25 then do; ever_tested_m2024_=ever_tested; diag_m2024_=registd&j;  onart_m2024_=onart&j; end;
	else if 25 le age&j lt 30 then do; ever_tested_m2529_=ever_tested; diag_m2529_=registd&j;  onart_m2529_=onart&j; end;
	else if 30 le age&j lt 35 then do; ever_tested_m3034_=ever_tested; diag_m3034_=registd&j;  onart_m3034_=onart&j; end;
	else if 35 le age&j lt 40 then do; ever_tested_m3539_=ever_tested; diag_m3539_=registd&j;  onart_m3539_=onart&j; end;
	else if 40 le age&j lt 45 then do; ever_tested_m4044_=ever_tested; diag_m4044_=registd&j;  onart_m4044_=onart&j; end;
	else if 45 le age&j lt 50 then do; ever_tested_m4549_=ever_tested; diag_m4549_=registd&j;  onart_m4549_=onart&j; end;
	else if 50 le age&j lt 55 then do; ever_tested_m5054_=ever_tested; diag_m5054_=registd&j;  onart_m5054_=onart&j; end;
	else if 55 le age&j lt 60 then do; ever_tested_m5559_=ever_tested; diag_m5559_=registd&j;  onart_m5559_=onart&j; end;
	else if 60 le age&j lt 65 then do; ever_tested_m6064_=ever_tested; diag_m6064_=registd&j;  onart_m6064_=onart&j; end;
end;
else if gender=2 then do;
	if      15 le age&j lt 50 then do; ever_tested_w1549_=ever_tested; diag_w1549_=registd&j;  onart_w1549_=onart&j; end;
	if      15 le age&j lt 65 then do; ever_tested_w1564_=ever_tested; diag_w1564_=registd&j;  onart_w1564_=onart&j; end;
	if      15 le age&j lt 20 then do; ever_tested_w1519_=ever_tested; diag_w1519_=registd&j;  onart_w1519_=onart&j; end;
	else if 20 le age&j lt 25 then do; ever_tested_w2024_=ever_tested; diag_w2024_=registd&j;  onart_w2024_=onart&j; end;
	else if 25 le age&j lt 30 then do; ever_tested_w2529_=ever_tested; diag_w2529_=registd&j;  onart_w2529_=onart&j; end;
	else if 30 le age&j lt 35 then do; ever_tested_w3034_=ever_tested; diag_w3034_=registd&j;  onart_w3034_=onart&j; end;
	else if 35 le age&j lt 40 then do; ever_tested_w3539_=ever_tested; diag_w3539_=registd&j;  onart_w3539_=onart&j; end;
	else if 40 le age&j lt 45 then do; ever_tested_w4044_=ever_tested; diag_w4044_=registd&j;  onart_w4044_=onart&j; end;
	else if 45 le age&j lt 50 then do; ever_tested_w4549_=ever_tested; diag_w4549_=registd&j;  onart_w4549_=onart&j; end;
	else if 50 le age&j lt 55 then do; ever_tested_w5054_=ever_tested; diag_w5054_=registd&j;  onart_w5054_=onart&j; end;
	else if 55 le age&j lt 60 then do; ever_tested_w5559_=ever_tested; diag_w5559_=registd&j;  onart_w5559_=onart&j; end;
	else if 60 le age&j lt 65 then do; ever_tested_w6064_=ever_tested; diag_w6064_=registd&j;  onart_w6064_=onart&j; end;
	if sw&j = 1 		   then do;  ever_tested_sw   =ever_tested; diag_sw   =registd&j; onart_sw   =onart&j; end;
	if sw&j ne 1           then      ever_tested_sw=0;
end;


***Pregnancy outcomes;
pregnant_w1549=0;pregnant_w1524=0;pregnant_w1519=0;pregnant_w2024=0;pregnant_w2529=0;pregnant_w3034=0;pregnant_w3539=0;  
pregnant_w4044=0;pregnant_w4549=0;pregnant_w50pl=0;

tested_w1549_anc=0;tested_w1524_anc=0;tested_w1519_anc=0;tested_w2024_anc=0;tested_w2529_anc=0;tested_w3034_anc=0; tested_w3539_anc=0;
tested_w4044_anc=0;tested_w4549_anc=0;tested_w50pl_anc=0;

hiv_w1549_anc=0;hiv_w1524_anc=0;hiv_w1519_anc=0;hiv_w2024_anc=0;hiv_w2529_anc=0;hiv_w3034_anc=0;hiv_w3539_anc=0;hiv_w4044_anc=0;
hiv_w4549_anc=0;hiv_w50pl_anc=0;

w1549_anc=0;	   w1524_anc=0;
hiv_pregn_w1549_=0; hiv_pregn_w1524_=0;
if gender=2 and pregnant=1 then do;
	if 15 le age&j lt 50 then do; pregnant_w1549=1; hiv_pregn_w1549_=1; if anc=1 then do; w1549_anc=1;tested_w1549_anc=tested&j; hiv_w1549_anc=hiv&j;end;end;
	if 15 le age&j lt 25 then do; pregnant_w1524=1; hiv_pregn_w1524_=1; if anc=1 then do; w1524_anc=1;tested_w1524_anc=tested&j; hiv_w1524_anc=hiv&j;end;end;
	if 15 le age&j lt 20 then do; pregnant_w1519=1; 				   if anc=1 then do; 			 tested_w1519_anc=tested&j; hiv_w1519_anc=hiv&j;end;end;
	if 20 le age&j lt 25 then do; pregnant_w2024=1; 				   if anc=1 then do; 			 tested_w2024_anc=tested&j; hiv_w2024_anc=hiv&j;end;end;
	if 25 le age&j lt 30 then do; pregnant_w2529=1; 				   if anc=1 then do; 			 tested_w2529_anc=tested&j; hiv_w2529_anc=hiv&j;end;end;
	if 30 le age&j lt 35 then do; pregnant_w3034=1; 				   if anc=1 then do; 			 tested_w3034_anc=tested&j; hiv_w3034_anc=hiv&j;end;end;
	if 35 le age&j lt 40 then do; pregnant_w3539=1; 				   if anc=1 then do; 			 tested_w3539_anc=tested&j; hiv_w3539_anc=hiv&j;end;end;
	if 40 le age&j lt 45 then do; pregnant_w4044=1; 				   if anc=1 then do; 			 tested_w4044_anc=tested&j; hiv_w4044_anc=hiv&j;end;end;
	if 45 le age&j lt 50 then do; pregnant_w4549=1; 				   if anc=1 then do; 			 tested_w4549_anc=tested&j; hiv_w4549_anc=hiv&j;end;end;
	if 50 le age&j lt 65 then do; pregnant_w50pl=1; 				   if anc=1 then do; 			 tested_w5064_anc=tested&j; hiv_w5064_anc=hiv&j;end;end;
end;

hiv_pregnant=0; if pregnant=1 and hiv&j=1 then hiv_pregnant=1;
hiv_anc=0;      if anc=1      and hiv&j=1 then hiv_anc=1;

pmtct=0;if pregnant=1 and (on_sd_nvp=1 or on_dual_nvp=1 or . lt time0 le caldate&j) then pmtct=1;


***Number of symptomatic people;
symptomatic=0;if adc&x=1 or (tb&a=0 and tb&x=1) or who3_event&x=1 then symptomatic=1;

***Number of undiagnosed symptomatic people;
symptomatic_undiag=0;if registd&x ne 1 and symptomatic=1 then symptomatic_undiag=1;

***Tested due to symptoms;
tested_symp=0;if symptomatic=1 and tested&j=1 then tested_symp=1;
tested_pos_sympt=0;if tested&j=1 and date1pos=caldate&j and hiv_symp=1 then tested_pos_sympt=1;

***Of those with symptoms and undiagnosed in the last period, tested in this period;
tested_symp_undiag=0;if symptomatic_undiag=1 and tested&j=1 then tested_symp_undiag=1;

***Tested due to non-HIV symptoms;
tested_non_hivsymp=0;if non_hiv_symptoms=1 and tested&j=1 then tested_non_hivsymp=1;

***True neg/pos tests;
tested_trueneg=0;  if tested&j=1 and (hiv&j ne 1 or (hiv&j=1 and primary&j=1))  then tested_trueneg=1; 
tested_falseneg=0; if tested&j=1 and hiv&j=1 and primary&j ne 1 and date1pos ne caldate&j then tested_falseneg=1; 
tested_falsepos=0;		if tested&j=1 and hiv&j ne 1 and date1pos=caldate&j then tested_falsepos=1; 
tested_falseneg_prim=0; if tested&j=1 and hiv&j =  1 and date1pos ne caldate&j and primary&j=1 then tested_falseneg_prim=1; 


***Deaths;
if gender=1 then do;
	dead_m&j=dead&j;
	if 15 <= age&j < 20 then dead1519m_all=dead&j;
	if 20 <= age&j < 25 then dead2024m_all=dead&j;
	if 25 <= age&j < 30 then dead2529m_all=dead&j;
	if 30 <= age&j < 35 then dead3034m_all=dead&j;
	if 35 <= age&j < 40 then dead3539m_all=dead&j;
	if 40 <= age&j < 45 then dead4044m_all=dead&j;
	if 45 <= age&j < 50 then dead4549m_all=dead&j;
end;
if gender=2 then do;
	dead_w&j=dead&j;
	if 15 <= age&j < 20 then dead1519w_all=dead&j;
	if 20 <= age&j < 25 then dead2024w_all=dead&j;
	if 25 <= age&j < 30 then dead2529w_all=dead&j;
	if 30 <= age&j < 35 then dead3034w_all=dead&j;
	if 35 <= age&j < 40 then dead3539w_all=dead&j;
	if 40 <= age&j < 45 then dead4044w_all=dead&j;
	if 45 <= age&j < 50 then dead4549w_all=dead&j;
end;

if 15 <= age&j < 65 then dead1564_all=dead&j;
if gender=1 and 15 <= age&j < 65 then dead1564m_all=dead&j;
if gender=2 and 15 <= age&j < 65 then dead1564w_all=dead&j;

death_hivrel=0; if dcause=1 then death_hivrel=dead&j;


***Utilities;
cur_efa_cns_tox=0; if o_efa and c_cns&j=1 then cur_efa_cns_tox=1;
cur_dol_cns_tox=0; if o_dol and c_cns&j=1 then cur_dol_cns_tox=1;

if 15 <= age&j < 65 then do;
util=1; * these in order ;
if c_tox&j=1 then util=util_tox;
if cur_efa_cns_tox=1 then util=min(util,util_cns_efa_tox);
if cur_dol_cns_tox=1 then util=min(util,util_cns_dol_tox); * cant be on both efa and dol;
if who3_event&j=1 and tb&j=0 then util=util_who3;
if t ge 2 and (tb&j=1 or tb&x=1) then util=util_tb;
if adc&j=1 then util=util_adc;
end;


*** VF according to line of ART;
if line2=1 and line3 ne 1 then startedline2=1;

line1_lf0=0; if artline&j=1 and linefail&j=0 then line1_lf0 =1;
line1_lf1=0; if artline&j=1 and linefail&j=1 then line1_lf1 =1; line2_lf1=0; if artline&j=2 and linefail&j=1 then line2_lf1 =1;
line2_lf2=0; if artline&j=2 and linefail&j=2 then line2_lf2 =1; artexpoff=0; if naive&j=0 and onart&j=0 and int_clinic_not_aw ne 1 then artexpoff =1;
line1_vlg1000=0; if artline&j=1 and vl1000=0 then line1_vlg1000=1;line2_vlg1000=0; if artline&j=2 and vl1000=0 then line2_vlg1000=1;

line1_=0; if artline&j=1 then line1_ =1;
line2_=0; if artline&j=2 then line2_ =1;
line3_=0; if artline&j=3 then line3_ =1;

*** On ART with ADC / CD4<200 / resistance;
onart_adc=0; if onart&j=1 and adc&j=1 then onart_adc=1;
onart_cl200=0; if onart&j=1 and cl200=1 then onart_cl200=1;
onart_iicu_res=0; if (onart&j=1  or int_clinic_not_aw=1) and rm_&j=1 then onart_iicu_res=1;
onart_res=0; if onart&j=1 and rm_&j=1 then onart_res=1;

*** On ART for >6m with resistance;
onart_gt6m_nnres_vlg1000=0; if ((onart&j=1 and tcur&j ge 2) or int_clinic_not_aw=1) and vl1000=0 and (c_rt103m=1 or c_rt181m=1 or c_rt190m=1)  and caldate&j ge yrart+0.5 > .
then onart_gt6m_nnres_vlg1000=1;
onart_gt6m_pires_vlg1000=0; if ((onart&j=1 and tcur&j ge 2) or int_clinic_not_aw=1) and vl1000=0 and (c_pr32m=1 or c_pr33m=1 
or c_pr46m=1 or c_pr47m=1 or c_pr50vm=1 or c_pr50lm=1 or c_pr54m&j=1  or c_pr76m=1 or c_pr82m=1 or c_pr84m=1 or c_pr88m=1 
or c_pr90m=1)  and caldate&j ge yrart+0.5 > . then onart_gt6m_pires_vlg1000=1; 
onart_gt6m_res_vlg1000=0; if ((onart&j=1 and tcur&j ge 2) or int_clinic_not_aw=1) and vl1000=0 and rm_&j=1  and caldate&j ge yrart+0.5  > . then onart_gt6m_res_vlg1000=1;

***Adherence;
adh_low=.; adh_med=.; adh_hi=.;
if onart&j=1 or int_clinic_not_aw=1 then do; 
adh_low=0; if adh&j < 0.5 or int_clinic_not_aw=1 then adh_low=1; adh_med=0; if 0.5 <= adh&j < 0.8 then adh_med=1; adh_hi=0; if 0.8 <= adh&j then adh_hi=1;
end;
adhav_low_onart=.;  if . < adhav < 0.5 and onart&j=1 then adhav_low_onart=1;
adhav_hi_onart=.;  if 0.8 <= adhav and onart&j=1 then adhav_hi_onart=1;

* adh level by gender - apr 19 ;
adh_low_w=.; adh_med_w=.; adh_hi_w=.;
if gender=2 and (onart&j=1 or int_clinic_not_aw=1) then do; 
adh_low_w=0; if adh&j < 0.5 or int_clinic_not_aw=1 then adh_low_w=1; 
adh_med_w=0; if 0.5 <= adh&j < 0.8 then adh_med_w=1; 
adh_hi_w=0; if 0.8 <= adh&j then adh_hi_w=1;
end;

* adh level by gender - apr 19 ;
adh_low_m=.; adh_med_m=.; adh_hi_m=.;
if gender=1 and (onart&j=1 or int_clinic_not_aw=1) then do; 
adh_low_m=0; if adh&j < 0.5 or int_clinic_not_aw=1 then adh_low_m=1; 
adh_med_m=0; if 0.5 <= adh&j < 0.8 then adh_med_m=1; 
adh_hi_m=0; if 0.8 <= adh&j then adh_hi_m=1;
end;

* regimen on;

tle=0;  if o_efa=1 and o_ten=1 and o_3tc=1 and nod&j=3 then tle=1;
tld=0;  if o_dol=1 and o_ten=1 and o_3tc=1 and nod&j=3 then tld=1;
zld=0;  if o_dol=1 and o_zdv=1 and o_3tc=1 and nod&j=3 then zld=1;
zla=0;  if o_taz=1 and o_zdv=1 and o_3tc=1 and nod&j=3 then zla=1;
if onart&j=1 then do;
otherreg=0; if tle ne 1 and tld ne 1 and zld ne 1 and zla ne 1 then  otherreg=1;
end;


no_recent_vm_gt1000_dol=0; no_recent_vm_gt1000_efa=0;  
if no_recent_vm_gt1000=1 and o_dol=1 then no_recent_vm_gt1000_dol=1;
if no_recent_vm_gt1000=1 and o_efa=1 then no_recent_vm_gt1000_efa=1;

recent_vm_gt1000_dol=0;recent_vm_gt1000_efa=0; recent_vm_gt1000_zdv=0; 
if recent_vm_gt1000=1 and o_dol=1 then recent_vm_gt1000_dol=1;
if recent_vm_gt1000=1 and o_efa=1 then recent_vm_gt1000_efa=1;
if recent_vm_gt1000=1 and o_zdv=1 then recent_vm_gt1000_zdv=1;


*Discounting from 2019 (120th step); * 3%; * mar19;
d=&j;  discount = (0.9924141173)**(d-120);

_ly=.; _dly=.; _qaly=.; _dqaly=.;_cost_=.; _dcost_=.;
if 15 <= age&j < 65 then do;
_ly = 0.25 ; 
_dly = discount*0.25;
_qaly = 0.25*util ; 
_dqaly = 0.25*discount*util ; 
_cost_ = cost ; 
_dcost_ = cost*discount ; 
end;

dead_daly=.; dead_ddaly=.;live_daly=.;  live_ddaly=.; age_would_be_now =.;
if 15 <= age&j < 65 then do;  live_ddaly = (1 - util)*0.25*discount; live_daly = (1 - util)*0.25; end;
if age&j ge 65 then do; live_daly=0;  live_ddaly=0;  end;
if death >= 1993 then do;
age_would_be_now = (agedeath + (caldate_never_dot - death));
dead_daly=0; dead_ddaly=0;
if . < death < caldate_never_dot and 15 <= age_would_be_now < 65 then do;	dead_ddaly = 0.25*discount; dead_daly = 0.25; end;  * jun14; 
end;


_dart_cost = art_cost*discount ;
_dadc_cost = adc_cost*discount ; 
_dvl_cost = vl_cost*discount ;
_dcd4_cost = cd4_cost*discount ;
_dvis_cost = vis_cost*discount ;
_dfull_vis_cost = full_vis_cost*discount;
_dfull_vis_cost_sv = full_vis_cost_sv*discount;
_vis_cost_sv = vis_cost_sv*discount;
_dwho3_cost = who3_cost*discount ;
_dcot_cost = cot_cost*discount ;
_dtb_cost = tb_cost*discount ;
_dtest_cost = cost_test*discount ;
_dtest_cost_m = cost_test_m*discount ;
_dtest_cost_f = cost_test_f*discount ;
_dcost_test_m_sympt = cost_test_m_sympt*discount ; 
_dcost_test_m_circ = cost_test_m_circ*discount ; 
_dcost_test_f_anc = cost_test_f_anc *discount ;
_dcost_test_f_sympt = cost_test_f_sympt*discount ; 
_dcost_test_f_sw = cost_test_f_sw *discount ;
_dcost_test_f_non_anc = cost_test_f_non_anc*discount ;
_dres_cost = res_cost*discount ; 
_dadhm_cost = adhm_cost*discount;
_d_t_adh_int_cost = t_adh_int_cost *discount;
_dadj_art_dcost = adj_art_cost*discount;
_dpi_cost=pi_cost*discount;
_dcost_circ = cost_circ*discount;
_dcost_switch_line = cost_switch_line*discount;
_dcost_child_hiv = cost_child_hiv*discount;
_dcost_child_hiv_mo_art = cost_child_hiv_mo_art*discount;
_dcost_prep = cost_prep*discount;
_dcost_prep_ac_adh = cost_prep_ac_adh*discount;
_dcost_prep_visit = cost_prep_visit*discount;
_dcost_art_init = cost_art_init*discount;
_dcost_cascade_interventions = cost_cascade_intervention*discount;
_dcost_drug_level_test = drug_level_test_cost*discount;

_dcost_non_aids_pre_death = non_aids_pre_death_cost*discount;

_dadj_art_1_cost = adj_art_1_cost * discount; 
_dadj_art_2_cost = adj_art_2_cost  * discount;   

_dart_1_cost = art_1_cost * discount;    
_dart_2_cost = art_2_cost * discount; 
_dart_3_cost = art_3_cost * discount; 

_dcost_vl_not_done = cost_vl_not_done * discount; 

*** Diagnosed this period;
diag_this_period=.;diag_this_period_m=.;diag_this_period_f=.;diag_this_period_f_anc=.;diag_this_period_f_non_anc=.;
diag_this_period_m_sympt=.;diag_this_period_f_sympt=.;

if date1pos = caldate&j > . then diag_this_period=1;
if gender=1 and diag_this_period=1 then diag_this_period_m=1;
if gender=2 and diag_this_period=1 then diag_this_period_f=1;
if gender=2 and diag_this_period=1 and tested_anc=1 then diag_this_period_f_anc=1;
if gender=2 and diag_this_period=1 and tested_anc ne 1 then diag_this_period_f_non_anc=1;
if gender=1 and diag_this_period=1 and sympt_diag = 1 then diag_this_period_m_sympt=1;
if gender=2 and diag_this_period=1 and sympt_diag = 1 then diag_this_period_f_sympt=1;

***Reason for HIV test;
tested_m=0; if gender=1 and tested&j=1 then tested_m=1;
tested_m_sympt=0; if gender=1 and tested&j=1 and (elig_test_who4_tested=1 or elig_test_who3_tested=1 or elig_test_tb_tested=1 or tested_symptoms_not_hiv=1)
then tested_m_sympt=1;
tested_m_circ=0; if gender=1 and tested&j=1 and tested_circ=1 then tested_m_circ=1;
* allocation of tests in women 1 anc  2 symptoms  3  sw;
tested_f=0; if gender=2 and tested&j=1 then tested_f=1;
tested_f_anc=0; if gender=2 and tested&j=1 and tested_anc = 1 then tested_f_anc=1;
tested_f_sympt=0; if gender=2 and tested&j=1 and (elig_test_who4_tested=1 or elig_test_who3_tested=1 or elig_test_tb_tested=1 or tested_symptoms_not_hiv=1)
and tested_anc ne 1 then tested_f_sympt=1;
tested_f_sw=0; if gender=2 and tested&j=1 and tested_as_sw=1 and tested_anc ne 1 and
(elig_test_who4_tested ne 1 and elig_test_who3_tested ne 1 and elig_test_tb_tested ne 1 and tested_symptoms_not_hiv ne 1) then tested_f_sw=1;
tested_f_non_anc=0; if gender=2 and tested&j=1 and tested_anc ne 1 then tested_f_non_anc=1;

***Changed from max(c_rt103m, c_rt181m, c_rt190m) to max(c_rt103m_inf, c_rt181m_inf, c_rt190m_inf).
   Previously, pregnant women who attend ANC could be diagnosed and develop NVP resistance within the same time period and hence
   would have been included below. Mutations now are at infection to counter this;

nn_tdr_diag=0;if caldate&j = date1pos > . then do; if max(c_rt103m_inf, c_rt181m_inf, c_rt190m_inf)=1 then nn_tdr_diag=1; end;

*** Failed >=1 line;
linefail_ge1=0; if linefail&j ge 1 then linefail_ge1=1;

*** Viral suppression achieved after VL>1000;
if caldate&j = date_v_alert + 0.5 > . and (onart&j=1 or int_clinic_not_aw=1) then do; 
	m6_after_alert=1; m6_after_alert_vl1000=0;
	if . < v&j < 3 then m6_after_alert_vl1000=1;   
end;


*** CD4 at ART start and at diagnosis;
cd4art_started_this_period=0; if yrart=caldate&j then cd4art_started_this_period=cd4art;
cd4diag_diag_this_period=0; if date1pos=caldate&j then cd4diag_diag_this_period=cd4diag;

*** Number of active drugs at start of ART;
if yrart=caldate&j then nactive_art=nactive&j;

pre_art_care=0;
if visit&j=1 and naive&j=1 then pre_art_care=1;


* status / at death

1 undiagnosed (or diagnosed < 3m)
2 diagnosed but never linked to care
3 diagnosed and linked to care but never started art, not in care
4 diagnosed and linked to care but never started art, in care
5 started ART but stopped, not in care
6 started ART but stopped, in care
7 started ART still on, never failed 1st line
8 started ART still on, failed 1st line, still on 1st line
9 started ART still on, on second line
;

* status at hiv-related  death for people with hiv;
status_death_hr_g=.;death_hiv=.;sdg_hr_1=.;sdg_hr_2=.;sdg_hr_3=.;sdg_hr_4=.;sdg_hr_5=.;sdg_hr_6=.;sdg_hr_7=.;sdg_hr_8=.;sdg_hr_9=.;sdg_hr_99=.;
if hiv&j=1 and caldate&j=death and dead1564_&j = 1 and rdcause=1 then do;
death_hiv=1;
status_death_hr_g=99;
if t ge 2 and registd&x ne 1 then status_death_hr_g=1;
if t ge 2 and registd&x=1 and linked_to_care ne 1 then status_death_hr_g=2;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j=1 and visit&j ne 1 then status_death_hr_g=3;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j=1 and visit&j=1 then status_death_hr_g=4;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j ne 1 and visit&j ne 1 then status_death_hr_g=5;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j ne 1 and visit&j=1 then status_death_hr_g=6;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j ne 1 then  status_death_hr_g=7;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j = 1 and line2 ne 1 then  status_death_hr_g=8;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j = 1 and line2 = 1 then  status_death_hr_g=9;

if status_death_hr_g=1 then sdg_hr_1=1;
if status_death_hr_g=2 then sdg_hr_2=1;
if status_death_hr_g=3 then sdg_hr_3=1;
if status_death_hr_g=4 then sdg_hr_4=1;
if status_death_hr_g=5 then sdg_hr_5=1;
if status_death_hr_g=6 then sdg_hr_6=1;
if status_death_hr_g=7 then sdg_hr_7=1;
if status_death_hr_g=8 then sdg_hr_8=1;
if status_death_hr_g=9 then sdg_hr_9=1;
if status_death_hr_g=99 then sdg_hr_99=1;

end;


* status at death - any cause - for people with hiv;
status_death_g=.;sdg_1=.;sdg_2=.;sdg_3=.;sdg_4=.;sdg_5=.;sdg_6=.;sdg_7=.;sdg_8=.;sdg_9=.;sdg_99=.;
if hiv&j=1 and caldate&j=death and dead1564_&j = 1 then do;
status_death_g=99;
if t ge 2 and registd&x ne 1 then status_death_g=1;
if t ge 2 and registd&x=1 and linked_to_care ne 1 then status_death_g=2;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j=1 and visit&j ne 1 then status_death_g=3;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j=1 and visit&j=1 then status_death_g=4;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j ne 1 and visit&j ne 1 then status_death_g=5;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j ne 1 and visit&j=1 then status_death_g=6;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j ne 1 then  status_death_g=7;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j = 1 and line2 ne 1 then  status_death_g=8;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j = 1 and line2 = 1 then  status_death_g=9;

if status_death_g=1 then sdg_1=1;
if status_death_g=2 then sdg_2=1;
if status_death_g=3 then sdg_3=1;
if status_death_g=4 then sdg_4=1;
if status_death_g=5 then sdg_5=1;
if status_death_g=6 then sdg_6=1;
if status_death_g=7 then sdg_7=1;
if status_death_g=8 then sdg_8=1;
if status_death_g=9 then sdg_9=1;
if status_death_g=99 then sdg_99=1;

end;


* status;

status_g=.;sg_1=.;sg_2=.;sg_3=.;sg_4=.;sg_5=.;sg_6=.;sg_7=.;sg_8=.;sg_9=.;sg_99=.;

if hiv&j=1 then do;

status_g=99;
if t ge 2 and registd&x ne 1 then status_g=1;
if t ge 2 and registd&x=1 and linked_to_care ne 1 then status_g=2;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j=1 and visit&j ne 1 then status_g=3;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j=1 and visit&j=1 then status_g=4;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j ne 1 and visit&j ne 1 then status_g=5;
if t ge 2 and registd&x=1 and linked_to_care = 1 and naive&j ne 1 and visit&j=1 then status_g=6;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j ne 1 then  status_g=7;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j = 1 and line2 ne 1 then  status_g=8;
if (onart&j=1 or int_clinic_not_aw=1) and linefail&j = 1 and line2 = 1 then  status_g=9;

if status_g=1 then sg_1=1;
if status_g=2 then sg_2=1;
if status_g=3 then sg_3=1;
if status_g=4 then sg_4=1;
if status_g=5 then sg_5=1;
if status_g=6 then sg_6=1;
if status_g=7 then sg_7=1;
if status_g=8 then sg_8=1;
if status_g=9 then sg_9=1;
if status_g=99 then sg_99=1;

end;


*** ART initiation due to WHO3/4;
who4_art_init=0; if caldate&j = yrart > . and . < timewho4_ <= yrart then who4_art_init=1;
who3_art_init=0; if caldate&j = yrart > . and . < timewho3_ <= yrart then who3_art_init=1;

*** Dead in 3 month period in which ART was started;
dead_art_3m = .; if caldate&j=yrart and yrart=death then dead_art_3m = 1;

*** First test this period;
firsttest=0; if caldate&j=date1test > . then firsttest=1;

*** Naive by gender;
if naive&j=1 and gender=1 then naive_m=1;
if naive&j=1 and gender=2 then naive_w=1;

*** Number of partners >2 / >10;
npge2=0; if np&j ge 2 then npge2=1;
npge10=0; if np&j ge 10 then npge10=1;

*** Prep code;
prep_newpg0 = 0;prep_newpg0 = 0;prep_newpg0 = 0;prep_newpg0 = 0;prep_newpg0 = 0;
if prep=1 then do;
if newpgr=0 then prep_newpg0 = 1;
if newpgr=1 then prep_newpg1 = 1;
if newpgr=2 then prep_newpg2 = 1;
if newpgr=3 then prep_newpg3 = 1;
if newpgr=10 then prep_newpg10 = 1;
if newpgr=100 then prep_newpg100 = 1;
end;

newp_this_per_age1524w_onprep=.; newp_this_per_age1524w=.;prep_ever_w_1524=.;
if gender=2 and 15 <= age&j < 25 and newp&j ge 1 then do;
prep_ever_w_1524=0;
if prep_ever=1 then prep_ever_w_1524=1;
newp_this_per_age1524w=1;
if prep=1 then newp_this_per_age1524w_onprep=1;
if prep ne 1 then newp_this_per_age1524w_onprep=0;
end;

prep_ever_w=.;
if gender=2 then do;
prep_ever_w = 0 ;
if prep_ever = 1 then prep_ever_w = 1;
end;


*added Feb2017;
visit_prep_no=0; if visit_prep=0 then visit_prep_no=1; 	*no visit;
visit_prep_d=0; if visit_prep=1 then visit_prep_d=1;	 	*drug pick up only;
visit_prep_dt=0; if visit_prep=2 then visit_prep_dt=1; 	*drug pick up and HIV test;
visit_prep_dtc=0; if visit_prep=3 then visit_prep_dtc=1;	*drug pick up, HIV test and counselling;

*added Mar2017;
vlg1000_onart=0; vlg1000_184m=0; vlg1000_65m=0; vlg1000_onart_184m=0; vlg1000_onart_65m=0; 
if v&j >= log10(1000) and ((onart&j=1 and tcur&j ge 2) or int_clinic_not_aw=1) then vlg1000_onart=1;
if v&j >= log10(1000) and c_rt184m=1 then vlg1000_184m=1;
if v&j >= log10(1000) and c_rt65m=1 then vlg1000_65m=1;
if v&j >= log10(1000) and ((onart&j=1 and tcur&j ge 2) or int_clinic_not_aw=1) and c_rt184m=1 then vlg1000_onart_184m=1;
if v&j >= log10(1000) and ((onart&j=1 and tcur&j ge 2) or int_clinic_not_aw=1) and c_rt65m=1 then vlg1000_onart_65m=1;




if time_to_65m = . and e_rt65m=1 then time_to_65m=caldate&j-infection; 
if time_to_184m = . and e_rt184m=1 then time_to_184m=caldate&j-infection; 

if hiv&j=1 and prep ne 1 and prep_tm1=1 then hiv_date_stop_prep=caldate&j;


if 15 <= age&j and hiv&j=1 and caldate&j ne . then do;

surv_65m = min(caldate&j-infection, time_to_65m);
m65_yn=0; if surv_65m = time_to_65m then m65_yn=1;

surv_184m = min(caldate&j-infection, time_to_184m);
m184_yn=0; if surv_184m = time_to_184m then m184_yn=1;

survdiag = min(date1pos,caldate&j)-infection;
diag_yn=0; if survdiag=date1pos-infection > . then diag_yn=1;

survarts = min(yrart,caldate&j)-infection;
arts_yn=0; if survarts=yrart-infection > . then arts_yn=1;

survStopPrep = min(yrart,caldate&j)-infection;
stopPrep_yn=0; if survStopPrep=yrart-infection > . then stopPrep_yn=1;

surv_hiv_date_stop_prep = min(hiv_date_stop_prep, caldate&j)-infection;
hiv_stop_prep_yn=0; if surv_hiv_date_stop_prep = hiv_date_stop_prep-infection then hiv_stop_prep_yn=1;

end;

***Newp groups;
newp_g_m_0 = .; newp_g_m_1 = .; newp_g_m_2 = .; newp_g_m_3 = .; newp_g_m_4 = .;newp_g_m_5 = .;newp_g_m_6 = .;
n_newp_g_m_0 = .; n_newp_g_m_1 = .; n_newp_g_m_2 = .; n_newp_g_m_3 = .; n_newp_g_m_4 = .;n_newp_g_m_5 = .;n_newp_g_m_6 = .;

if gender = 1 then do;
if newp&j = 0 then do; newp_g_m_0 = 1; n_newp_g_m_0 = newp&j; end;
if newp&j = 1 then do; newp_g_m_1 = 1; n_newp_g_m_1 = newp&j; end;
if 2 <= newp&j <= 3 then do; newp_g_m_2 = 1; n_newp_g_m_2 = newp&j; end;
if 4 <= newp&j < 10 then do; newp_g_m_3 = 1; n_newp_g_m_3 = newp&j; end;
if 10 <= newp&j <  30 then do; newp_g_m_4 = 1; n_newp_g_m_4 = newp&j; end;
if 30 <= newp&j < 100 then do; newp_g_m_5 = 1; n_newp_g_m_5 = newp&j; end;
if 100 <= newp&j       then do; newp_g_m_6 = 1; n_newp_g_m_6 = newp&j; end;
end;

newp_g_w_0 = .; newp_g_w_1 = .; newp_g_w_2 = .; newp_g_w_3 = .; newp_g_w_4 = .;newp_g_w_5 = .;newp_g_w_6 = .;
n_newp_g_w_0 = .; n_newp_g_w_1 = .; n_newp_g_w_2 = .; n_newp_g_w_3 = .; n_newp_g_w_4 = .;n_newp_g_w_5 = .;n_newp_g_w_6 = .;

if gender = 2 then do;
if newp&j = 0 then do; newp_g_w_0 = 1; n_newp_g_w_0 = newp&j; end;
if newp&j = 1 then do; newp_g_w_1 = 1; n_newp_g_w_1 = newp&j; end;
if 2 <= newp&j <= 3 then do; newp_g_w_2 = 1; n_newp_g_w_2 = newp&j; end;
if 4 <= newp&j < 10 then do; newp_g_w_3 = 1; n_newp_g_w_3 = newp&j; end;
if 10 <= newp&j <  30 then do; newp_g_w_4 = 1; n_newp_g_w_4 = newp&j; end;
if 30 <= newp&j < 100 then do; newp_g_w_5 = 1; n_newp_g_w_5 = newp&j; end;
if 100 <= newp&j       then do; newp_g_w_6 = 1; n_newp_g_w_6 = newp&j; end;
end;


newp_g_yw_0 = .; newp_g_yw_1 = .; newp_g_yw_2 = .; newp_g_yw_3 = .; newp_g_yw_4 = .;newp_g_yw_5 = .;newp_g_yw_6 = .;
n_newp_g_yw_0 = .; n_newp_g_yw_1 = .; n_newp_g_yw_2 = .; n_newp_g_yw_3 = .; n_newp_g_yw_4 = .;n_newp_g_yw_5 = .;n_newp_g_yw_6 = .;


if gender = 2 and 15 <= age&j < 25 then do;
if newp&j = 0 then do; newp_g_yw_0 = 1; n_newp_g_yw_0 = newp&j; end;
if newp&j = 1 then do; newp_g_yw_1 = 1; n_newp_g_yw_1 = newp&j; end;
if 2 <= newp&j <= 3 then do; newp_g_yw_2 = 1; n_newp_g_yw_2 = newp&j; end;
if 4 <= newp&j < 10 then do; newp_g_yw_3 = 1; n_newp_g_yw_3 = newp&j; end;
if 10 <= newp&j <  30 then do; newp_g_yw_4 = 1; n_newp_g_yw_4 = newp&j; end;
if 30 <= newp&j < 100 then do; newp_g_yw_5 = 1; n_newp_g_yw_5 = newp&j; end;
if 100 <= newp&j       then do; newp_g_yw_6 = 1; n_newp_g_yw_6 = newp&j; end;
end;


* number of np had by hiv-ve people (not counting those adherent on prep +/- those circumcised); 

if hiv&j ne 1 then do;
	if gender=1 and 15 <= age&j < 50 and (prep&j ne 1 or adh&j < 0.8) then do;  susc_np_1549_m = newp&j + ep&j;   end;
	if gender=1 and 15 <= age&j < 50 and (prep&j ne 1 or adh&j < 0.8) and mcirc   ne 1 then do;  susc_np_inc_circ_1549_m = newp&j + ep&j;   end;
	if gender=2 and 15 <= age&j < 50 and (prep&j ne 1 or adh&j < 0.8) then do;  susc_np_1549_w = newp&j + ep&j;   end;
end;


if tot_yrs_prep > 5  then tot_yrs_prep_gt_5  = 1;
if tot_yrs_prep > 10 then tot_yrs_prep_gt_10 = 1;
if tot_yrs_prep > 20 then tot_yrs_prep_gt_20 = 1;

if ever_sd_nvp=1 or ever_dual_nvp=1 then ever_nvp_pmtct=1;

*** Status of ART initiators;
*   all art naive excluding prev pmtct - naive_no_pmtct;
*   all art naive initiators excluding prev pmtct - ai_naive_no_pmtct;
_ai_naive_no_pmtct_=0;_ai_naive_no_pmtct_c_r_=.; _ai_naive_no_pmtct_c_nnm_=0; _ai_naive_no_pmtct_c_pim_=.;
_ai_naive_no_pmtct_c_inm_=.;_ai_naive_no_pmtct_c_rt184m_=.;_ai_naive_no_pmtct_c_rt65m_=.;_ai_naive_no_pmtct_c_rttams_=.;
_ai_naive_no_pmtct_e_r_=.; _ai_naive_no_pmtct_e_nnm_=.; 

if yrart=caldate&j > .  and ever_nvp_pmtct ne 1 then do;
    _ai_naive_no_pmtct_=1;
    if rm_&x=1 then _ai_naive_no_pmtct_c_r_=1;
    if nnm_&x=1 then _ai_naive_no_pmtct_c_nnm_=1;
    if pim_&x=1 then _ai_naive_no_pmtct_c_pim_=1;
    if inpm_&x=1 or insm_&j=1 then _ai_naive_no_pmtct_c_inm_=1;
    if c_rt184m_tm2=1 then _ai_naive_no_pmtct_c_rt184m_=1;
    if _rt65m_tm2=1 then _ai_naive_no_pmtct_c_rt65m_=1;
    if _rttams_tm2 ge 1then _ai_naive_no_pmtct_c_rttams_=1;
    if e_totmut&j ge 1 then _ai_naive_no_pmtct_e_r_=1;
    if  e_nnmut ge 1 then _ai_naive_no_pmtct_e_nnm_=1;
    if  e_pimut ge 1 then _ai_naive_no_pmtct_e_pim_=1;
    if e_inmut ge 1 then _ai_naive_no_pmtct_e_inm_=1;
    if e_rt184m=1 then _ai_naive_no_pmtct_e_rt184m_=1;
    if e_rt65m=1 then _ai_naive_no_pmtct_e_rt65m_=1;
    if e_rttams ge 1 then _ai_naive_no_pmtct_e_rttams_=1;
end;



*   all art (re-)initiators  ;
_all_ai_=.;_all_ai_c_r_=.; _all_ai_c_nnm_=.; _all_ai_c_pim_=.;_all_ai_c_inm_=.;_all_ai_c_rt184m_=.;_all_ai_c_rt65m_=.;_all_ai_c_rttams_=.;
_all_ai_e_r_=.; _all_ai_e_nnm_=.; _all_ai_e_pim_=.;_all_ai_e_inm_=.;_all_ai_e_rt184m_=.;_all_ai_e_rt65m_=.;_all_ai_e_rttams_=.;
if (return_&j=1 and restart&j=1) or yrart=caldate&j > . then do;
    _all_ai_=1;
    if rm_&x=1 then _all_ai_c_r_=1;
    if nnm_&x=1 then _all_ai_c_nnm_=1;
    if pim_&x=1 then _all_ai_c_pim_=1;
    if inpm_&x=1 or insm_&j=1 then _all_ai_c_inm_=1;
    if c_rt184m_tm2=1 then _all_ai_c_rt184m_=1;
    if _rt65m_tm2=1 then _all_ai_c_rt65m_=1;
    if _rttams_tm2 ge 1then _all_ai_c_rttams_=1;
    if e_totmut&j ge 1 then _all_ai_e_r_=1;
    if  e_nnmut ge 1 then _all_ai_e_nnm_=1;
    if  e_pimut ge 1 then _all_ai_e_pim_=1;
    if e_inmut ge 1 then _all_ai_e_inm_=1;
    if e_rt184m=1 then _all_ai_e_rt184m_=1;
    if e_rt65m=1 then _all_ai_e_rt65m_=1;
    if e_rttams ge 1 then _all_ai_e_rttams_=1;
end;


*** Off ART with low VL;
offart_vl1000=.;
offart=.; if hiv&j=1 and onart&j ne 1 then offart=1;
if offart=1 and vl1000=1 then offart_vl1000=1;

* variables relating to first line failure - switch cascade;

* of people with initial vl > 1000 in past year (v_alert, date_v_alert), proportion with resistance;
* of people with initial vl > 1000 in past year, proportion with vl < 1000;

v_alert_past_yr = .; v_alert_past_yr_rm =.; v_alert_past_yr_vl1000=.;v_alert_past_yr_adc=.;v_alert_past_yr_dead=.; v_alert_past_yr_rm_c=.;
if naive&j ne 1 then v_alert_past_yr = 0; if 0 <= caldate&j - date_v_alert < 1 then v_alert_past_yr = 1;
if v_alert_past_yr = 1 and onart_iicu=1 then do;
v_alert_past_yr_rm=0; if rme_&j=1 then v_alert_past_yr_rm=1; 
v_alert_past_yr_rm_c=0; if nnm_&j=1 then v_alert_past_yr_rm_c=1; * note this;
v_alert_past_yr_vl1000=0; if vl1000=1 then v_alert_past_yr_vl1000=1; 
v_alert_past_yr_adc=0; if adc&j=1 then v_alert_past_yr_adc=1; 
v_alert_past_yr_dead=0; if caldate&j = death > . then v_alert_past_yr_dead=1; 
end;

* of people with initial vl > 1000 (v_alert) in past 6m, and still on ART , proportion with vl < 1000;
v_alert_6m_ago_onart = .;v_alert_6m_ago_onart_vl1000=.;
if caldate&j - date_v_alert = 0.5 and artline&j=1 then v_alert_6m_ago_onart = 1;
if v_alert_6m_ago_onart = 1 then do;
v_alert_6m_ago_onart_vl1000 = 0; if vl1000 = 1 then v_alert_6m_ago_onart_vl1000 =1;
end;

* of people with initial vl > 1000 (v_alert) in past 3m, and still on ART , proportion with vl < 1000;
v_alert_3m_ago_onart = .;v_alert_3m_ago_onart_vl1000=.;
if caldate&j - date_v_alert = 0.25 and artline&j=1 then v_alert_3m_ago_onart = 1;
if v_alert_3m_ago_onart = 1 then do;
v_alert_3m_ago_onart_vl1000 = 0; if vl1000 = 1 then v_alert_3m_ago_onart_vl1000 =1;
end;

* of people with initial vl > 1000 (v_alert) in past 9m, and still on ART , proportion with vl < 1000;
v_alert_9m_ago_onart = .;v_alert_9m_ago_onart_vl1000=.;
if caldate&j - date_v_alert = 0.75 and artline&j=1 then v_alert_9m_ago_onart = 1;
if v_alert_9m_ago_onart = 1 then do;
v_alert_9m_ago_onart_vl1000 = 0; if vl1000 = 1 then v_alert_9m_ago_onart_vl1000 =1;
end;

* of people with initial vl > 1000 (v_alert) in past 2y, and still on ART , proportion with vl < 1000;
v_alert_2y_ago_onart = .;v_alert_2y_ago_onart_vl1000=.;
if caldate&j - date_v_alert = 2 and artline&j=1 then v_alert_2y_ago_onart = 1;
if v_alert_2y_ago_onart = 1 then do;
v_alert_2y_ago_onart_vl1000 = 0; if vl1000 = 1 then v_alert_2y_ago_onart_vl1000 =1;
end;

if 0 < (date_v_alert - yrart) < 1 then do;  * e_ stands for early;
e_v_alert_6m_ago_onart = 1;  e_v_alert_6m_ago_onart_vl1000 = v_alert_6m_ago_onart_vl1000;
end; 


* of people with current vl > 1000 on first line, proportion identified as linefail = 1; 

online1_vg1000=.; online1_vg1000_lf1 =.; online1_vg1000_cd4l200 =.;
if onart&j=1 and artline&j =1 and vg1000=1 then online1_vg1000=1;
if online1_vg1000=1 then do;
online1_vg1000_lf1=0; if linefail&j ge 1 then online1_vg1000_lf1=1;
online1_vg1000_cd4l200 =0; if . < c&j < 200 then online1_vg1000_cd4l200 =1;
end;

* of those with linefail=1 in past year, proportion who have switched;  

lf1_past_yr=.; lf1_past_yr_line2=.;
if 0 <= caldate&j - d1stlfail < 1 then lf1_past_yr=1;
if lf1_past_yr=1 then do;
lf1_past_yr_line2=0; if line2=1 then lf1_past_yr_line2=1;
end;

if ever_onart_gt6m_vlg1000 = 1 then do;
ev_onart_gt6m_vlg1000_dead=0; ev_onart_gt6m_vlg1000_adead=0; 
if caldate&j = death > . then ev_onart_gt6m_vlg1000_dead=1; 
if ev_onart_gt6m_vlg1000_dead=1 and dcause=1 then ev_onart_gt6m_vlg1000_adead=1; 
end;

* of people with previous or current VL > 1000 who are on art, proportion with viral suppression;   
* note here the denominator (ev_art_g1k) is people people with previous or current VL > 1000 who are on art
while for the aids death rate the denominator is all people people with previous or current VL > 1000 even
if not currently on art;
ev_art_g1k_l1k=.; ev_art_g1k=.;
if ever_onart_gt6m_vlg1000 = 1 and onart&j=1 then do;
ev_art_g1k=1; ev_art_g1k_l1k=0; if vl1000=1 then ev_art_g1k_l1k=1; 
end;

ev_art_g1k_not2l_adead=0; ev_art_g1k_not2l_adc=0;ev_art_g1k_not2l=0;
if ever_onart_gt6m_vlg1000 = 1 and (date_line2 =. or 2018.75 <= date_line2) then do;
ev_art_g1k_not2l=1; 
ev_art_g1k_not2l_adead=0; if caldate&j = death > . and dcause=1 then ev_art_g1k_not2l_adead=1; 
ev_art_g1k_not2l_adc=0; if adc&j=1 then ev_art_g1k_not2l_adc=1; 
end;

* of people with previous or current VL > 1000 (excluding those on second line at baseline in 2018), proportion with viral suppression;   
ev_art_g1k_not2l_l1k=.;
if ev_art_g1k_not2l=1 then do;
ev_art_g1k_not2l_l1k=0; if vl1000=1 then ev_art_g1k_not2l_l1k=1; 
end;


if ever_onart_gt6m_vl_m_g1000 = 1 then do;
ev_onart_gt6m_vl_m_g1000_dead=0; ev_onart_gt6m_vl_m_g1000_adead=0; 
if caldate&j = death > . then ev_onart_gt6m_vl_m_g1000_dead=1; 
if ev_onart_gt6m_vl_m_g1000_dead=1 and dcause=1 then ev_onart_gt6m_vl_m_g1000_adead=1; 
end;

* proportion of people with drug resistance to efavirenz who have been switched to second line ART ;
onart_efa_r = .; onart_efa_r_2l=.;
if onart&j = 1 and r_efa ge 0.75 then onart_efa_r = 1;
if onart_efa_r = 1 then do;
onart_efa_r_2l = 0;
if artline&j ge 2 then onart_efa_r_2l = 1;
end;

* of people defined as failing efavirenz-based first line ART, proportion with NNRTI drug resistance ; 
onefa_linefail1 = .;  onefa_linefail1_r=.;
if o_efa = 1 and linefail&j = 1 then onefa_linefail1 = 1;  
if onefa_linefail1 = 1 then do;
onefa_linefail1_r=0; if r_efa ge 0.75 then onefa_linefail1_r=1; 
end;


* status at defined periods after start 1st line art ;

if (caldate_never_dot - yrart = 1) and yrart ge 2018.5 then do;

status_artl1_1=99;

if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vl1000=1 then status_artl1_1 = 1;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vl1000=1 then status_artl1_1 = 2;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j ne 1 then status_artl1_1 = 3;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j ne 1 then status_artl1_1 = 4;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j = 1 and r_dol gt 0 then status_artl1_1 = 5;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j = 1 and r_dol le 0 then status_artl1_1 = 6;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j = 1 and r_dol gt 0 then status_artl1_1 = 7;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j = 1 and r_dol le 0 then status_artl1_1 = 8;
if (onart&j ne 1 and int_clinic_not_aw ne 1 and line2 ne 1) and visit&j=1 then status_artl1_1 = 9;
if (onart&j ne 1 and int_clinic_not_aw ne 1 and line2 = 1) and visit&j=1 then status_artl1_1 = 10;
if visit&j ne 1  and line2 ne 1 then status_artl1_1 = 11;
if visit&j ne 1  and line2 = 1 then status_artl1_1 = 12;
if dcause=1  and line2 ne 1 then status_artl1_1 = 13;	
if dcause=1  and line2 = 1 then status_artl1_1 = 14;	
if dcause=2  and line2 ne 1 then status_artl1_1 = 15;
if dcause=2  and line2 = 1 then status_artl1_1 = 16;
	
r_dol_artl1_1 = 0; if r_dol > 0  then r_dol_artl1_1 = 1;
r_efa_artl1_1 = 0; if r_efa > 0  then r_efa_artl1_1 = 1;
r_taz_artl1_1 = 0; if r_taz&j > 0  then r_taz_artl1_1 = 1;

end;

status_artl1_1_1=0; if status_artl1_1 =1 then status_artl1_1_1=1;status_artl1_1_2=0; if status_artl1_1 = 2 then status_artl1_1_2=1;
status_artl1_1_3=0; if status_artl1_1 =3 then status_artl1_1_3=1;status_artl1_1_4=0; if status_artl1_1 = 4 then status_artl1_1_4=1;
status_artl1_1_5=0; if status_artl1_1 =5 then status_artl1_1_5=1;status_artl1_1_6=0; if status_artl1_1 = 6 then status_artl1_1_6=1;
status_artl1_1_7=0; if status_artl1_1 =7 then status_artl1_1_7=1;status_artl1_1_8=0; if status_artl1_1 = 8 then status_artl1_1_8=1;
status_artl1_1_9=0; if status_artl1_1 =9 then status_artl1_1_9=1;status_artl1_1_10=0; if status_artl1_1 = 10 then status_artl1_1_10=1;
status_artl1_1_11=0; if status_artl1_1 =11 then status_artl1_1_11=1;status_artl1_1_12=0; if status_artl1_1 = 12 then status_artl1_1_12=1;
status_artl1_1_13=0; if status_artl1_1 =13 then status_artl1_1_13=1;status_artl1_1_14=0; if status_artl1_1 = 14 then status_artl1_1_14=1;
status_artl1_1_15=0; if status_artl1_1 =15 then status_artl1_1_15=1;status_artl1_1_16=0; if status_artl1_1 = 16 then status_artl1_1_16=1;


if (caldate_never_dot - yrart = 3) and yrart ge 2018.5 then do;

status_artl1_3=99;

if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vl1000=1 then status_artl1_3 = 1;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vl1000=1 then status_artl1_3 = 2;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j ne 1 then status_artl1_3 = 3;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j ne 1 then status_artl1_3 = 4;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j = 1 and r_dol gt 0 then status_artl1_3 = 5;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j = 1 and r_dol le 0 then status_artl1_3 = 6;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j = 1 and r_dol gt 0 then status_artl1_3 = 7;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j = 1 and r_dol le 0 then status_artl1_3 = 8;
if (onart&j ne 1 and int_clinic_not_aw ne 1 and line2 ne 1) and visit&j=1 then status_artl1_3 = 9;
if (onart&j ne 1 and int_clinic_not_aw ne 1 and line2 = 1) and visit&j=1 then status_artl1_3 = 10;
if visit&j ne 1  and line2 ne 1 then status_artl1_3 = 11;
if visit&j ne 1  and line2 = 1 then status_artl1_3 = 12;
if dcause=1  and line2 ne 1 then status_artl1_3 = 13;	
if dcause=1  and line2 = 1 then status_artl1_3 = 14;	
if dcause=2  and line2 ne 1 then status_artl1_3 = 15;
if dcause=2  and line2 = 1 then status_artl1_3 = 16;
	
r_dol_artl1_3 = 0; if r_dol > 0  then r_dol_artl1_3 = 1;
r_efa_artl1_3 = 0; if r_efa > 0  then r_efa_artl1_3 = 1;
r_taz_artl1_3 = 0; if r_taz&j > 0  then r_taz_artl1_3 = 1;

end;

status_artl1_3_1=0; if status_artl1_3 =1 then status_artl1_3_1=1;status_artl1_3_2=0; if status_artl1_3 = 2 then status_artl1_3_2=1;
status_artl1_3_3=0; if status_artl1_3 =3 then status_artl1_3_3=1;status_artl1_3_4=0; if status_artl1_3 = 4 then status_artl1_3_4=1;
status_artl1_3_5=0; if status_artl1_3 =5 then status_artl1_3_5=1;status_artl1_3_6=0; if status_artl1_3 = 6 then status_artl1_3_6=1;
status_artl1_3_7=0; if status_artl1_3 =7 then status_artl1_3_7=1;status_artl1_3_8=0; if status_artl1_3 = 8 then status_artl1_3_8=1;
status_artl1_3_9=0; if status_artl1_3 =9 then status_artl1_3_9=1;status_artl1_3_10=0; if status_artl1_3 = 10 then status_artl1_3_10=1;
status_artl1_3_11=0; if status_artl1_3 =11 then status_artl1_3_11=1;status_artl1_3_12=0; if status_artl1_3 = 12 then status_artl1_3_12=1;
status_artl1_3_13=0; if status_artl1_3 =13 then status_artl1_3_13=1;status_artl1_3_14=0; if status_artl1_3 = 14 then status_artl1_3_14=1;
status_artl1_3_15=0; if status_artl1_3 =15 then status_artl1_3_15=1;status_artl1_3_16=0; if status_artl1_3 = 16 then status_artl1_3_16=1;



if (caldate_never_dot - yrart = 5) and yrart ge 2018.5 then do;

status_artl1_5=99;

if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vl1000=1 then status_artl1_5 = 1;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vl1000=1 then status_artl1_5 = 2;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j ne 1 then status_artl1_5 = 3;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j ne 1 then status_artl1_5 = 4;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j = 1 and r_dol gt 0 then status_artl1_5 = 5;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_&j = 1 and r_dol le 0 then status_artl1_5 = 6;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j = 1 and r_dol gt 0 then status_artl1_5 = 7;
if ((onart&j=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_&j = 1 and r_dol le 0 then status_artl1_5 = 8;
if (onart&j ne 1 and int_clinic_not_aw ne 1 and line2 ne 1) and visit&j=1 then status_artl1_5 = 9;
if (onart&j ne 1 and int_clinic_not_aw ne 1 and line2 = 1) and visit&j=1 then status_artl1_5 = 10;
if visit&j ne 1  and line2 ne 1 then status_artl1_5 = 11;
if visit&j ne 1  and line2 = 1 then status_artl1_5 = 12;
if dcause=1  and line2 ne 1 then status_artl1_5 = 13;	
if dcause=1  and line2 = 1 then status_artl1_5 = 14;	
if dcause=2  and line2 ne 1 then status_artl1_5 = 15;
if dcause=2  and line2 = 1 then status_artl1_5 = 16;
	
r_dol_artl1_5 = 0; if r_dol > 0  then r_dol_artl1_5 = 1;
r_efa_artl1_5 = 0; if r_efa > 0  then r_efa_artl1_5 = 1;
r_taz_artl1_5 = 0; if r_taz&j > 0  then r_taz_artl1_5 = 1;

end;

status_artl1_5_1=0; if status_artl1_5 =1 then status_artl1_5_1=1;status_artl1_5_2=0; if status_artl1_5 = 2 then status_artl1_5_2=1;
status_artl1_5_3=0; if status_artl1_5 =3 then status_artl1_5_3=1;status_artl1_5_4=0; if status_artl1_5 = 4 then status_artl1_5_4=1;
status_artl1_5_5=0; if status_artl1_5 =5 then status_artl1_5_5=1;status_artl1_5_6=0; if status_artl1_5 = 6 then status_artl1_5_6=1;
status_artl1_5_7=0; if status_artl1_5 =7 then status_artl1_5_7=1;status_artl1_5_8=0; if status_artl1_5 = 8 then status_artl1_5_8=1;
status_artl1_5_9=0; if status_artl1_5 =9 then status_artl1_5_9=1;status_artl1_5_10=0; if status_artl1_5 = 10 then status_artl1_5_10=1;
status_artl1_5_11=0; if status_artl1_5 =11 then status_artl1_5_11=1;status_artl1_5_12=0; if status_artl1_5 = 12 then status_artl1_5_12=1;
status_artl1_5_13=0; if status_artl1_5 =13 then status_artl1_5_13=1;status_artl1_5_14=0; if status_artl1_5 = 14 then status_artl1_5_14=1;
status_artl1_5_15=0; if status_artl1_5 =15 then status_artl1_5_15=1;status_artl1_5_16=0; if status_artl1_5 = 16 then status_artl1_5_16=1;




* status outcomes at year 1 in people on art at baseline with tenofovir and 3tc resistance and vl > 1000;
 
outc_ten3tc_r_f_1=.;

if caldate&j = 2020.5 and ((e_rt65m= 1 or e_rt151m=1) and e_rt184m=1) and v&j > 3 and onart&j=1 then ten3tc_r_f = 1;

if (caldate_never_dot - 2020.5 = 1) and ten3tc_r_f=1 then do;

outc_ten3tc_r_f_1=99;

if (onart&j=1 or int_clinic_not_aw=1) and vl1000=1 then outc_ten3tc_r_f_1 = 1;
if (onart&j=1 or int_clinic_not_aw=1) and vg1000=1 and rm_&j ne 1 then outc_ten3tc_r_f_1 = 2;
if (onart&j=1 or int_clinic_not_aw=1) and vg1000=1 and rm_&j = 1 and r_dol&j le 0 then outc_ten3tc_r_f_1 = 3;
if (onart&j=1 or int_clinic_not_aw=1) and vg1000=1 and rm_&j = 1 and r_dol&j gt 0 then outc_ten3tc_r_f_1 = 4;
if (onart&j ne 1 and int_clinic_not_aw ne 1) and visit&j=1 then outc_ten3tc_r_f_1 = 5;
if visit&j ne 1  then outc_ten3tc_r_f_1 = 6;
if death ne . then outc_ten3tc_r_f_1 = 7;	

r_dol_ten3tc_r_f_1 = 0; if r_dol&j > 0  then r_dol_ten3tc_r_f_1 = 1;
end;

outc_ten3tc_r_f_1_1=0; if outc_ten3tc_r_f_1 =1 then outc_ten3tc_r_f_1_1=1;outc_ten3tc_r_f_1_2=0; if outc_ten3tc_r_f_1 = 2 then outc_ten3tc_r_f_1_2=1;
outc_ten3tc_r_f_1_3=0; if outc_ten3tc_r_f_1 =3 then outc_ten3tc_r_f_1_3=1;outc_ten3tc_r_f_1_4=0; if outc_ten3tc_r_f_1 = 4 then outc_ten3tc_r_f_1_4=1;
outc_ten3tc_r_f_1_5=0; if outc_ten3tc_r_f_1 =5 then outc_ten3tc_r_f_1_5=1;outc_ten3tc_r_f_1_6=0; if outc_ten3tc_r_f_1 = 6 then outc_ten3tc_r_f_1_6=1;
outc_ten3tc_r_f_1_7=0; if outc_ten3tc_r_f_1 =7 then outc_ten3tc_r_f_1_7=1;






***Pregnancy outcomes;
pregnant_vlg1000 = 0;
if pregnant =1 and v&j > 3 then pregnant_vlg1000 = 1;

pregnant_onart = 0;
if pregnant = 1 and (onart&j=1) then pregnant_onart = 1;

pregnant_onart_vlg1000 = 0;
if pregnant = 1 and (onart&j=1) and v&j > 3 then pregnant_onart_vlg1000 = 1;

pregnant_onart_vl_high = 0;
if pregnant = 1 and (onart&j=1) and 3 <= v&j < 4 then pregnant_onart_vl_high = 1;
pregnant_onart_vl_vhigh = 0;
if pregnant = 1 and (onart&j=1) and 4 <= v&j < 5 then pregnant_onart_vl_vhigh = 1;
pregnant_onart_vl_vvhigh = 0;
if pregnant = 1 and (onart&j=1) and 5 <= v&j  then pregnant_onart_vl_vvhigh = 1;

pregnant_o_dol = 0;
if pregnant =1 and o_dol = 1 then pregnant_o_dol = 1;

pregnant_not_diagnosed_pos=0; if pregnant=1 and registd&j  ne 1 then pregnant_not_diagnosed_pos=1;

dead_ddaly_ntd=0;
if prev_pregnant_ntd=1 then dead_ddaly_ntd = 0.25*discount;

* AP 19-7-19;
dead_ddaly_oth_dol_adv_birth_e=0;
if prev_oth_dol_adv_birth_e=1 then dead_ddaly_oth_dol_adv_birth_e = 0.25*discount;

ddaly_mtct=0;
if ever_birth_with_inf_child=1 then ddaly_mtct = 0.1*0.25*discount;

* AP 19-7-19;
ddaly_non_aids_pre_death=0;
if death = caldate&j and rdcause=2 then ddaly_non_aids_pre_death = 1 * 0.25 * discount;

dead_rdcause2=0;
if death = caldate&j and rdcause=2 then dead_rdcause2=1;
dead_onart_rdcause2=0;
if death = caldate&j and onart&j=1 and rdcause=2 then dead_onart_rdcause2=1;



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ANALYSIS PROCEDURES 
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* this code commented out and only used for supplementary material - to calculate death rate and aids death rate by time from start of art and 
adh in first period on art;

* proc freq; 
* tables art_time_adh_bcd4_g  art_time_adh_bcd4_dead_g  art_time_adh_bcd4_adead_g ; 
* run;


/*

proc freq; tables newp&j ; where gender=1 and 15 <= age&j < 50 ; 
proc freq; tables newp&j ; where gender=2 and 15 <= age&j < 50 ; 
proc freq; tables cald s_m_newp s_w_newp sw1 hiv&j newp_factor ; 
where 15 <= age&j < 50 ;  
run;

*/


/*

proc freq; tables newp&j ; 
where gender=1 and 15 <= age&j < 50 ; 
proc freq; tables cald s_m_newp s_w_newp  sw1 newp&j ; 
where gender=2 and 15 <= age&j < 50 ;  
run;

proc print; var caldate&j gender rred   newp_factor  rred_a  rred_p  rred_adc  rred_d  rred_rc  rred_balance  rred_ep  newp&j 
p_hsb_p  life_sex_risk  rred_a_15m rred_a_15w  ptnewp15_m  ptnewp15_w m15r w15r  m_1524_newp  i_m_1524_newp;
where 15 <= age&j < 65; 
run;


proc print; 
var caldate&j gender age&j newp&j sw&j ep&j mcirc&j prob_birth_circ date_mcirc; 
where gender=1 and 10 <= age&j < 65 ; 
run;



proc freq; tables  mcirc&j ; where gender=1 and 15 <= age&j < 20 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 20 <= age&j < 25 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 25 <= age&j < 30 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 30 <= age&j < 35 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 35 <= age&j < 40 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 40 <= age&j      ; run;


proc freq; tables caldate&j gender newp&j ep&j hiv&j sex_beh_trans_matrix_m sex_age_mixing_matrix rred_balance;  
where gender =1 and 15 <= age&j < 65; run;
proc freq; tables caldate&j gender newp&j ep&j hiv&j sw&j base_rate_sw sex_beh_trans_matrix_w sex_age_mixing_matrix rred_balance; 
where gender =2 and 15 <= age&j < 65; run;
proc freq; tables gender newp&j age&j ; 
where gender =2 and 15 <= age&j < 25; run;
proc freq; tables  prev_ratio_1524  prevalence1524w  prevalence1524m  sex_age_mixing_matrix s_m_newp   s_w_newp  ; run;


proc means; var 
rred_a_15m 
rred_a_20m 
rred_a_25m 
rred_a_30m 
rred_a_35m 
rred_a_40m 
rred_a_45m 
rred_a_50m 
rred_a_55m 
rred_a_60m 
rred_a_15w 
rred_a_20w 
rred_a_25w 
rred_a_30w 
rred_a_35w 
rred_a_40w 
rred_a_45w 
rred_a_50w 
rred_a_55w 
rred_a_60w 

ptnewp15_m  s_m_1524_newp  
ptnewp25_m  s_m_2534_newp  
ptnewp35_m  s_m_3544_newp  
ptnewp45_m  s_m_4554_newp  
ptnewp55_m  s_m_5564_newp  
ptnewp15_w  s_w_1524_newp  
ptnewp25_w  s_w_2534_newp  
ptnewp35_w  s_w_3544_newp  
ptnewp45_w  s_w_4554_newp  
ptnewp55_w  s_w_5564_newp 
caldate&j
m15r  
m25r 
m35r  
m45r   
m55r   
w15r  
w25r   
w35r   
w45r   
w55r  
sex_age_mixing_matrix s_m_newp   s_w_newp  prev_ratio_1524  cum_ratio_newp_mw
;
run;


proc freq; tables  mcirc&j ; where gender=1 and 15 <= age&j < 20 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 20 <= age&j < 25 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 25 <= age&j < 30 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 30 <= age&j < 35 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 35 <= age&j < 40 ; run;
proc freq; tables  mcirc&j ; where gender=1 and 40 <= age&j      ; run;




proc freq; tables  gender  newp&j  hiv&j ep&j  sw&j   rred_rc  ych_risk_beh_newp p_rred_p p_hsb_p ; 
where gender=2 and 15 <= age&j < 65 ;
run;
*/



*********************************************************************************************************;


proc univariate noprint ; var

cd4diag  measured_cd4art
years_on_prep n_test_prevyr_onprep
age_deb_sw act_years_sw

/*general*/
n  caldate&j  run  option  util

/*number alive and with hiv in each age group*/
alive1549	 	alive1549_w	alive1549_m   alive1564	 	alive1564_w	alive1564_m 
ageg1517m		ageg1819m		ageg1519m  	ageg2024m		ageg2529m  	ageg3034m		ageg3539m		ageg4044m	
ageg4549m		ageg5054m 	ageg5559m		ageg6064m		ageg1564m		ageg1549m		age_1844m
ageg1517w		ageg1819w		ageg1519w  	ageg2024w		ageg2529w  	ageg3034w		ageg3539w		ageg4044w	
ageg4549w		ageg5054w 	ageg5559w		ageg6064w		ageg1564w		ageg1549w		age_1844w
ageg1m 	ageg2m	ageg3m	ageg4m 	ageg5m 	ageg1w 	ageg2w	 ageg3w 	ageg4w 	ageg5w 

hiv1564  hiv1549
hiv1517m    hiv1819m	hiv1519m  	hiv2024m	hiv2529m  	hiv3034m	hiv3539m	hiv4044m	
hiv4549m	hiv5054m 	hiv5559m	hiv6064m	hiv1564m	hiv1549m	
hiv1517w	hiv1819w	hiv1519w  	hiv2024w	hiv2529w  	hiv3034w	hiv3539w	hiv4044w	
hiv4549w	hiv5054w 	hiv5559w	hiv6064w	hiv1564w	hiv1549w	
sg_1		sg_2 		sg_3 		sg_4 		sg_5 		sg_6 		sg_7 		sg_8 		sg_9 		sg_99

/*primary infection*/
primary&j 		primary1549   primary1549m  primary1549w  infected_primary  inf_primary
primary1519m	primary2024m	primary2529m	primary3034m	primary3539m	primary4044m	primary4549m
primary5054m	primary5559m	primary6064m
primary1519w	primary2024w	primary2529w	primary3034w	primary3539w	primary4044w	primary4549w
primary5054w	primary5559w	primary6064w

primary_ep_m  primary_ep_w
primary1524m_ep  primary2534m_ep  primary3544m_ep  primary4554m_ep  primary5564m_ep
primary1524w_ep  primary2534w_ep  primary3544w_ep  primary4554w_ep  primary5564w_ep  
primary1524m_epnewp  primary2534m_epnewp  primary3544m_epnewp  primary4554m_epnewp  primary5564m_epnewp
primary1524w_epnewp  primary2534w_epnewp  primary3544w_epnewp  primary4554w_epnewp  primary5564w_epnewp 
primary_sw
inf_vlsupp  inf_newp  inf_ep  inf_diag  inf_naive

/*outputs amongst those infected*/
i_m_d_newp     i_w_d_newp 	i_w_np 	i_m_np  i_ep
i_m_1524_newp  i_m_2534_newp	i_m_3544_newp  i_m_4554_newp  i_m_5564_newp  
i_w_1524_newp  i_w_2534_newp	i_w_3544_newp  i_w_4554_newp  i_w_5564_newp
i_r_vlg1_np  i_r_vlg2_np  i_r_vlg3_np  i_r_vlg4_np  i_r_vlg5_np  i_r_vlg6_np 
i_diag_vlg1_rm0_np  i_diag_vlg2_rm0_np  i_diag_vlg3_rm0_np  i_diag_vlg4_rm0_np  i_diag_vlg5_rm0_np  i_diag_vlg6_rm0_np
i_diag_vlg1_rm1_np  i_diag_vlg2_rm1_np  i_diag_vlg3_rm1_np  i_diag_vlg4_rm1_np  i_diag_vlg5_rm1_np  i_diag_vlg6_rm1_np
i_naive_vlg1_rm0_np  i_naive_vlg2_rm0_np  i_naive_vlg3_rm0_np  i_naive_vlg4_rm0_np  i_naive_vlg5_rm0_np  i_naive_vlg6_rm0_np
i_naive_vlg1_rm1_np  i_naive_vlg2_rm1_np  i_naive_vlg3_rm1_np  i_naive_vlg4_rm1_np  i_naive_vlg5_rm1_np  i_naive_vlg6_rm1_np
i_v1_np  i_v2_np  i_v3_np  i_v4_np  i_v5_np  i_v6_np


/*Number ep and newp*/
rbm  np&j  newp&j  newp_ge1  newp_ge5  newp_ge10  newp_ge50  ep&j   ep_m&j  ep_w&j  npge10  npge2  npge2_ly_1549m  npge2_ly_1549w   
m_1524_ep  	 m_2534_ep	  m_3544_ep	   m_4554_ep 	    m_5564_ep  
w_1524_ep  	 w_2534_ep  	  w_3544_ep      w_4554_ep  	w_5564_ep
m_1524_newp    m_2534_newp 	  m_3544_newp    m_4554_newp 	m_5564_newp 
w_1524_newp 	 w_2534_newp 	  w_3544_newp	   w_4554_newp	w_5564_newp
m_1524_epnewp  m_2534_epnewp  m_3544_epnewp  m_4554_epnewp  m_5564_epnewp  
w_1524_epnewp  w_2534_epnewp  w_3544_epnewp  w_4554_epnewp  w_5564_epnewp
newp_ge1_hiv  
newp_p3m  newp_p3m_hiv  newp_p3m_diag  p_ep_py  p_ep_py_hiv  p_ep_py_diag
ever_ep  ever_newp  
m1524_ep1524  m1524_ep2534  m1524_ep3544  m1524_ep4554  m1524_ep5564  
m2534_ep1524  m2534_ep2534  m2534_ep3544  m2534_ep4554  m2534_ep5564  
m3544_ep1524  m3544_ep2534  m3544_ep3544  m3544_ep4554  m3544_ep5564  
m4554_ep1524  m4554_ep2534  m4554_ep3544  m4554_ep4554  m4554_ep5564  
m5565_ep1524  m5565_ep2534  m5565_ep3544  m5565_ep4554  m5565_ep5564  
w1524_ep1524  w1524_ep2534  w1524_ep3544  w1524_ep4554  w1524_ep5564  
w2534_ep1524  w2534_ep2534  w2534_ep3544  w2534_ep4554  w2534_ep5564  
w3544_ep1524  w3544_ep2534  w3544_ep3544  w3544_ep4554  w3544_ep5564  
w4554_ep1524  w4554_ep2534  w4554_ep3544  w4554_ep4554  w4554_ep5564  
w5565_ep1524  w5565_ep2534  w5565_ep3544  w5565_ep4554  w5565_ep5564

m1524_newp_ge1  m2534_newp_ge1  m3544_newp_ge1  m4554_newp_ge1  m5564_newp_ge1  
m1524_newp_ge5  m2534_newp_ge5  m3544_newp_ge5  m4554_newp_ge5  m5564_newp_ge5  
w1524_newp_ge1  w2534_newp_ge1  w3544_newp_ge1  w4554_newp_ge1  w5564_newp_ge1  
w1524_newp_ge5  w2534_newp_ge5  w3544_newp_ge5  w4554_newp_ge5  w5564_newp_ge5

newp_g_m_0    newp_g_m_1    newp_g_m_2    newp_g_m_3    newp_g_m_4    newp_g_m_5    newp_g_m_6 
n_newp_g_m_0  n_newp_g_m_1  n_newp_g_m_2  n_newp_g_m_3  n_newp_g_m_4  n_newp_g_m_5  n_newp_g_m_6 
newp_g_w_0    newp_g_w_1    newp_g_w_2    newp_g_w_3    newp_g_w_4    newp_g_w_5    newp_g_w_6 
n_newp_g_w_0  n_newp_g_w_1  n_newp_g_w_2  n_newp_g_w_3  n_newp_g_w_4  n_newp_g_w_5  n_newp_g_w_6 
newp_g_yw_0   newp_g_yw_1   newp_g_yw_2   newp_g_yw_3   newp_g_yw_4   newp_g_yw_5   newp_g_yw_6 
n_newp_g_yw_0 n_newp_g_yw_1 n_newp_g_yw_2 n_newp_g_yw_3 n_newp_g_yw_4 n_newp_g_yw_5 n_newp_g_yw_6

npgt1conc_ly_1524m  npgt1conc_ly_1524w  npgt1conc_ly_1519m  npgt1conc_ly_1519w  npgt1conc_ly_2549m 
npgt1conc_ly_2549w  npgt1conc_ly_5064m  npgt1conc_ly_5064w 

susc_np_inc_circ_1549_m  susc_np_1549_m  susc_np_1549_w

/*status of partner*/
eph0_m&j	eph0_w&j  nip&j	 epi&j  
newp_hiv  newp_ge1_hiv_diag   epdiag&j  diag_epun  epart&j  epvls&j
hiv1epi0_w  hiv0epi1_w  hiv1epi0_m  hiv0epi1_m  hiv1epi1_m  hiv1epi1_w  
hiv0epprim
ever_ep_hiv  ever_ep_diag  ever_newp_hiv  ever_newp_diag
infected_newp_m  infected_newp_w  infected_ep_m infected_ep_w 

i_vl1000_m_np i_v11000_m_ep i_vl1000_m_newp
i_vl1000_w_np i_v11000_w_ep i_vl1000_w_newp

i_v1_age1_w_np i_v1_age2_w_np i_v1_age3_w_np i_v1_age4_w_np i_v1_age5_w_np 
i_v1_age1_m_np i_v1_age2_m_np i_v1_age3_m_np i_v1_age4_m_np i_v1_age5_m_np 
i_v1_age1_w_newp i_v1_age2_w_newp i_v1_age3_w_newp i_v1_age4_w_newp i_v1_age5_w_newp 
i_v1_age1_m_newp i_v1_age2_m_newp i_v1_age3_m_newp i_v1_age4_m_newp i_v1_age5_m_newp 
i_v1_age1_w_ep i_v1_age2_w_ep i_v1_age3_w_ep i_v1_age4_w_ep i_v1_age5_w_ep 
i_v1_age1_m_ep i_v1_age2_m_ep i_v1_age3_m_ep i_v1_age4_m_ep i_v1_age5_m_ep 

i_v2_age1_w_np i_v2_age2_w_np i_v2_age3_w_np i_v2_age4_w_np i_v2_age5_w_np 
i_v2_age1_m_np i_v2_age2_m_np i_v2_age3_m_np i_v2_age4_m_np i_v2_age5_m_np 
i_v2_age1_w_newp i_v2_age2_w_newp i_v2_age3_w_newp i_v2_age4_w_newp i_v2_age5_w_newp 
i_v2_age1_m_newp i_v2_age2_m_newp i_v2_age3_m_newp i_v2_age4_m_newp i_v2_age5_m_newp 
i_v2_age1_w_ep i_v2_age2_w_ep i_v2_age3_w_ep i_v2_age4_w_ep i_v2_age5_w_ep 
i_v2_age1_m_ep i_v2_age2_m_ep i_v2_age3_m_ep i_v2_age4_m_ep i_v2_age5_m_ep 

i_v3_age1_w_np i_v3_age2_w_np i_v3_age3_w_np i_v3_age4_w_np i_v3_age5_w_np 
i_v3_age1_m_np i_v3_age2_m_np i_v3_age3_m_np i_v3_age4_m_np i_v3_age5_m_np 
i_v3_age1_w_newp i_v3_age2_w_newp i_v3_age3_w_newp i_v3_age4_w_newp i_v3_age5_w_newp 
i_v3_age1_m_newp i_v3_age2_m_newp i_v3_age3_m_newp i_v3_age4_m_newp i_v3_age5_m_newp 
i_v3_age1_w_ep i_v3_age2_w_ep i_v3_age3_w_ep i_v3_age4_w_ep i_v3_age5_w_ep 
i_v3_age1_m_ep i_v3_age2_m_ep i_v3_age3_m_ep i_v3_age4_m_ep i_v3_age5_m_ep 

i_v4_age1_w_np i_v4_age2_w_np i_v4_age3_w_np i_v4_age4_w_np i_v4_age5_w_np 
i_v4_age1_m_np i_v4_age2_m_np i_v4_age3_m_np i_v4_age4_m_np i_v4_age5_m_np 
i_v4_age1_w_newp i_v4_age2_w_newp i_v4_age3_w_newp i_v4_age4_w_newp i_v4_age5_w_newp 
i_v4_age1_m_newp i_v4_age2_m_newp i_v4_age3_m_newp i_v4_age4_m_newp i_v4_age5_m_newp 
i_v4_age1_w_ep i_v4_age2_w_ep i_v4_age3_w_ep i_v4_age4_w_ep i_v4_age5_w_ep 
i_v4_age1_m_ep i_v4_age2_m_ep i_v4_age3_m_ep i_v4_age4_m_ep i_v4_age5_m_ep 

i_v5_age1_w_np i_v5_age2_w_np i_v5_age3_w_np i_v5_age4_w_np i_v5_age5_w_np 
i_v5_age1_m_np i_v5_age2_m_np i_v5_age3_m_np i_v5_age4_m_np i_v5_age5_m_np 
i_v5_age1_w_newp i_v5_age2_w_newp i_v5_age3_w_newp i_v5_age4_w_newp i_v5_age5_w_newp 
i_v5_age1_m_newp i_v5_age2_m_newp i_v5_age3_m_newp i_v5_age4_m_newp i_v5_age5_m_newp 
i_v5_age1_w_ep i_v5_age2_w_ep i_v5_age3_w_ep i_v5_age4_w_ep i_v5_age5_w_ep 
i_v5_age1_m_ep i_v5_age2_m_ep i_v5_age3_m_ep i_v5_age4_m_ep i_v5_age5_m_ep 

i_v6_age1_w_np i_v6_age2_w_np i_v6_age3_w_np i_v6_age4_w_np i_v6_age5_w_np 
i_v6_age1_m_np i_v6_age2_m_np i_v6_age3_m_np i_v6_age4_m_np i_v6_age5_m_np 
i_v6_age1_w_newp i_v6_age2_w_newp i_v6_age3_w_newp i_v6_age4_w_newp i_v6_age5_w_newp 
i_v6_age1_m_newp i_v6_age2_m_newp i_v6_age3_m_newp i_v6_age4_m_newp i_v6_age5_m_newp 
i_v6_age1_w_ep i_v6_age2_w_ep i_v6_age3_w_ep i_v6_age4_w_ep i_v6_age5_w_ep 
i_v6_age1_m_ep i_v6_age2_m_ep i_v6_age3_m_ep i_v6_age4_m_ep i_v6_age5_m_ep 

i_age1_m_np	i_age2_m_np	i_age3_m_np	i_age4_m_np	i_age5_m_np
i_age1_w_np	i_age2_w_np	i_age3_w_np	i_age4_w_np	i_age5_w_np
i_age1_m_newp i_age2_m_newp	i_age3_m_newp	i_age4_m_newp	i_age5_m_newp
i_age1_w_newp	i_age2_w_newp	i_age3_w_newp	i_age4_w_newp	i_age5_w_newp

i_m_1549_np  i_w_1549_np

/*resistance*/
tam1_&j  tam2_&j  tam3_&j  m184m_&j  k103m_&j  y181m_&j  g190m_&j  nnm_&j  q151m_&j  k65m_&j  
p32m_&j  p33m_&j  p46m_&j  p47m_&j   p50vm_&j  p50lm_&j  p54m_&j   p76m_&j p82m_&j   p84m_&j  p88m_&j  p90m_&j  pim_&j 
inpm_&j  insm_&j  rm_&j    i_nnm 	 i_rm&j    i_pim  	 i_tam 	   i_im	   inm_&j    i_184m	  im_art   pim_art  tam_art  m184_art
r_&j	 r_3tc  r_nev  r_lpr   r_taz&j   r_efa   r_ten   r_zdv r_dol
rme_&j   iime_&j  nnme_&j  pime_&j   nrtime_&j 
res_1stline_startline2  nnm_art  nnm_art_m  nnm_art_w  r_art  acq_rt65m  acq_rt184m  acq_rtm  onart_iicu_res
nactive_art_start_lt2  	nactive_art_start_lt3  nactive_art_start_lt1p5
nactive_line2_lt4 	    nactive_line2_lt3  	   nactive_line2_lt2  		nactive_line2_lt1p5   pim_line2
nn_res_pmtct  nn_res_pmtct_art_notdr  super_i_r  higher_rate_res_dol
onart_efa_r  onart_efa_r_2l  onefa_linefail1_r  nnrti_res_no_effect


/*prep*/
prep&j prep_sw prep_w_1524 elig_prep_epdiag  infected_prep  prep_ever  primary_prep  hiv1_prep  i_r_prep  primary_r_prep  ever_i_nor_prep  
rm_prep  elig_prep      hr_noprep  primary_hr_noprep 
rt65m_3_prep  rt184m_3_prep  rtm_3_prep  rt65m_6_prep  rt184m_6_prep  rtm_6_prep  
rt65m_9_prep  rt184m_9_prep  rtm_9_prep  rt65m_12_prep rt184m_12_prep rtm_12_prep 
rt65m_18_prep rt184m_18_prep rtm_18_prep 
onprep_3  onprep_6  onprep_9  onprep_12  onprep_18  

prepstart  ever_stopped_prep_choice  preprestart
acq_rt65m_3_prep  acq_rt184m_3_prep   acq_rtm_3_prep     acq_rt65m_6_prep   acq_rt184m_6_prep   acq_rtm_6_prep 
acq_rt65m_9_prep  acq_rt184m_9_prep   acq_rtm_9_prep     acq_rt65m_12_prep  acq_rt184m_12_prep  acq_rtm_12_prep  
acq_rt65m_18_prep acq_rt184m_18_prep  acq_rtm_18_prep
inf_prep_adhg80   inf_prep_adh5080    inf_prep_adhl50   prep_adhg80   prep_adh5080   prep_adhl50
onprep_1549  onprep_m  onprep_w  onprep_sw  onprep_1524  onprep_1524w 

infected_prep_source_prep_r  prepinfect_prep_r     prepinfect_prep_r_p   infected_prep_no_r    infected_prep_r  
started_prep_in_primary		 tot_yrs_prep  		   onprep_3_i_prep_no_r  onprep_6_i_prep_no_r  onprep_9_i_prep_no_r 
onprep_12_i_prep_no_r 		 onprep_18_i_prep_no_r prepinfect_rm_p   	 prepinfect_m184m_p    prepinfect_k65m_p 
prepinfect_tam_p 			 prepinfect_rtm  	   prepinfect_k65m		 prepinfect_m184m  	   prepinfect_tam  
prep_willing_pop  			 prep_willing_sw  	   stop_prep_choice      started_prep_hiv_test_sens  
cur_res_prep_drug 			 started_prep_hiv_test_sens_e  				 started_prep_in_primary_e
cur_res_ten					 cur_res_3tc  		   i_65m 				 cur_res_efa 			
cur_res_ten_vlg1000 		 cur_res_3tc_vlg1000 						 cur_res_efa_vlg1000	ever_hiv1_prep 
cur_res_efa_ever_hiv1_prep   cur_res_ten_ever_hiv1_prep   				 cur_res_3tc_ever_hiv1_prep   
prep_effectiveness_non_res_v 
prep_3m_after_inf_no_r 	prep_3m_after_inf_no_r_184 prep_3m_after_inf_no_r_65
prep_6m_after_inf_no_r  prep_6m_after_inf_no_r_184 prep_6m_after_inf_no_r_65 prep_12m_after_inf_no_r  
prep_12m_after_inf_no_r_184  prep_12m_after_inf_no_r_65
hiv_prep_reason_1  hiv_prep_reason_2  hiv_prep_reason_3  hiv_prep_reason_4

prep_newpg0  prep_newpg1  prep_newpg2  prep_newpg3  prep_newpg10  prep_newpg100 
newp_this_per_age1524w_onprep  newp_this_per_age1524w  prep_ever_w_1524  prep_ever_w
test_gt_3m_on_prep  test_gt_3m_on_prep_pos  test_3m_on_prep  test_3m_on_prep_pos  
prepuptake_sw  	prepuptake_pop     prob_prep_restart_choice
prep_all_past_year  tot_yrs_prep_gt_5  tot_yrs_prep_gt_10   tot_yrs_prep_gt_20
pop_wide_tld_prep


/*testing and diagnosis*/
tested&j  tested_m  tested_f  tested_f_non_anc  tested_f_anc  ever_tested_m  ever_tested_w  firsttest
tested1549_		  tested1549m       tested1549w
tested_ly_m1549_  tested_ly_m1519_  tested_ly_m2024_  tested_ly_m2529_  tested_ly_m3039_  tested_ly_m4049_  tested_ly_m5064_
tested_ly_w1549_  tested_ly_w1519_ 	tested_ly_w2024_  tested_ly_w2529_	tested_ly_w3039_  tested_ly_w4049_ 	tested_ly_w5064_ 
tested_ly_sw

ever_tested_m1549_  ever_tested_m1519_  ever_tested_m2024_  ever_tested_m2529_  ever_tested_m3034_  ever_tested_m3539_
ever_tested_m4044_  ever_tested_m4549_  ever_tested_m5054_  ever_tested_m5559_  ever_tested_m6064_ 
ever_tested_w1549_  ever_tested_w1519_  ever_tested_w2024_  ever_tested_w2529_  ever_tested_w3034_  ever_tested_w3539_
ever_tested_w4044_  ever_tested_w4549_  ever_tested_w5054_  ever_tested_w5559_  ever_tested_w6064_
ever_tested_sw

elig_test_who4  elig_test_who3  elig_test_tb  elig_test_who4_tested  elig_test_tb_tested  elig_test_who3_tested 
tested_trueneg	tested_falseneg  tested_falsepos  tested_falseneg_prim  com_test  tested_anc_prevdiag  tested_anc 
non_hiv_symptoms  symptomatic  symptomatic_undiag  tested_symp  tested_pos_sympt  tested_symp_undiag  tested_non_hivsymp 
tested_as_sw  tested_m_sympt  tested_f_sympt  tested_f_sw  tested_m_circ  
rate_1sttest   rate_reptest  newp_lasttest_tested_this_per
acc_test  acc_test_1524_  acc_test_2549_  acc_test_5064_  acc_test_sw

registd&j
diag_m1549_  diag_m1519_  diag_m2024_  diag_m2529_  diag_m3034_  diag_m3539_  diag_m4044_  diag_m4549_ 
diag_m5054_  diag_m5559_  diag_m6064_ 
diag_w1549_  diag_w1519_  diag_w2024_  diag_w2529_  diag_w3034_  diag_w3539_  diag_w4044_  diag_w4549_ 
diag_w5054_  diag_w5559_  diag_w6064_  diag_sw 
nn_tdr_diag

diag_this_period  diag_this_period_m  diag_this_period_f  diag_this_period_f_non_anc  diag_this_period_f_anc 
diag_this_period_m_sympt  diag_this_period_f_sympt  diag_12m 	diag_6m  diag_3m 
sympt_diag  sympt_diag_ever  diag_m  diag_w  epdiag_m  epdiag_w  epi_m  epi_w
diag_ep


/*VL and CD4*/
vlg1&j  vlg2&j  vlg3&j  vlg4&j  vlg5&j  vlg6&j 
line1_vlg1000	line2_vlg1000  res_vfail1
u_vfail1_this_period  u_vfail1  vl_vfail1_g1  vl_vfail1_g2  vl_vfail1_g3  vl_vfail1_g4  vl_vfail1_g5  vl_vfail1_g6
vlg1000_onart  vlg1000_184m  vlg1000_65m  vlg1000_onart_184m  vlg1000_onart_65m  sw_vg1000
vg1000   vg1000_m  vg1000_w  r_vg50  r_vg200  r_vg1000 
vl1000	  vl1000_art	 onart_iicu    vl1000_art_iicu    onart_gt6m    vl1000_art_gt_6m    onart_gt6m_iicu    vl1000_art_gt6m_iicu
vl1000_m  vl1000_art_m   onart_iicu_m  vl1000_art_iicu_m  onart_gt6m_m  vl1000_art_gt_6m_m  onart_gt6m_iicu_m  vl1000_art_gt6m_iicu_m  
vl1000_w  vl1000_art_w   onart_iicu_w  vl1000_art_iicu_w  onart_gt6m_w  vl1000_art_gt_6m_w  onart_gt6m_iicu_w  vl1000_art_gt6m_iicu_w  
vl1000_art_1524_  onart_iicu_1524_  vl1000_art_iicu_1524_  onart_gt6m_1524_  vl1000_art_gt_6m_1524_  onart_gt6m_iicu_1524_  vl1000_art_gt6m_iicu_1524_
vl1000_art_2549_  onart_iicu_2549_  vl1000_art_iicu_2549_  onart_gt6m_2549_  vl1000_art_gt_6m_2549_  onart_gt6m_iicu_2549_  vl1000_art_gt6m_iicu_2549_
vl1000_art_50pl_  onart_iicu_50pl_  vl1000_art_iicu_50pl_  onart_gt6m_50pl_  vl1000_art_gt_6m_50pl_  onart_gt6m_iicu_50pl_  vl1000_art_gt6m_iicu_50pl_
vl1000_art_incintcun_sw

u_vfail1_dol_this_period  o_dol_at_risk_uvfail
elig_treat200  elig_treat350  elig_treat500  cl100  cl50  cl200  cl350  cd4art_started_this_period  cd4diag_diag_this_period


/*ART*/
art_initiation_strategy  art_monitoring_strategy  naive&j  onart&j  int_clinic_not_aw
art_start 	  art_start_m   art_start_w   artexp 	    artexpoff  	  onart_m       onart_w
onart_m1549_  onart_m1564_  onart_m1519_  onart_m2024_  onart_m2529_  onart_m3034_  onart_m3539_  onart_m4044_  
onart_m4549_  onart_m5054_  onart_m5559_  onart_m6064_	
onart_w1549_  onart_w1564_  onart_w1519_  onart_w2024_  onart_w2529_  onart_w3034_  onart_w3539_  onart_w4044_  
onart_w4549_  onart_w5054_  onart_w5559_  onart_w6064_	onart_sw
art_dur_l6m   art_dur_g6m	art_tdur_l6m  art_tdur_g6m 
eponart_m  eponart_w  hiv1564_onart&j  dead1564_onart&j  who3_art_init  who4_art_init  art_start_pregnant 

o_lpr  o_taz  o_3tc  o_nev  o_efa  o_ten  o_zdv  o_dol 
onefa_linefail1  ev_art_g1k_l1k  ev_art_g1k_not2l ev_art_g1k_not2l_l1k  ev_art_g1k  ev_art_g1k_not2l_adc
art_12m  vl1000_art_12m  art_24m  vl1000_art_24m  art_12m_onart  vl1000_art_12m_onart
startedline2  start_line2_this_period  line2_12m  line2_12m_onart  line2_incl_int_clinic_not_aw

onart_vlg1000  ever_onart_gt6m_vlg1000   ever_onart_gt6m_vl_m_g1000  onart_gt6m_vlg1000  r_onart_gt6m_vlg1000 
onart_gt6m_nnres_vlg1000  onart_gt6m_pires_vlg1000  onart_gt6m_res_vlg1000
online1_vg1000   online1_vg1000_lf1  online1_vg1000_cd4l200  offart_vl1000 
vl1000_line2_12m    vl1000_line2_12m_onart  vl1000_line2  

offart  line1_  line2_  line1_lf0  line1_lf1  line2_lf1  line2_lf2  linefail_ge1  line1_fail_this_period
lf1_past_yr  lf1_past_yr_line2
onart_cl200  onart_cd4_g500  onart_res  reg_option 
adh_low  adh_med  adh_hi  adhav_low_onart  adhav_hi_onart  

v_alert_past_yr  v_alert_past_yr_rm  v_alert_past_yr_vl1000  v_alert_past_yr_adc  v_alert_past_yr_dead
v_alert_6m_ago_onart  v_alert_6m_ago_onart_vl1000  v_alert_past_yr_rm_c  e_v_alert_6m_ago_onart  e_v_alert_6m_ago_onart_vl1000
v_alert_3m_ago_onart  v_alert_3m_ago_onart_vl1000  v_alert_9m_ago_onart   v_alert_9m_ago_onart_vl1000   
v_alert_2y_ago_onart   v_alert_2y_ago_onart_vl1000  
m6_after_alert  m6_after_alert_vl1000

c_tox&j  cur_dol_cns_tox  cur_efa_cns_tox  rel_dol_tox  dol_higher_potency  

status_artl1_1_1   status_artl1_1_2   status_artl1_1_3   status_artl1_1_4   status_artl1_1_5   status_artl1_1_6  
status_artl1_1_7   status_artl1_1_8   status_artl1_1_9   status_artl1_1_10  status_artl1_1_11  status_artl1_1_12 
status_artl1_1_13  status_artl1_1_14  status_artl1_1_15  status_artl1_1_16 
status_artl1_3_1   status_artl1_3_2   status_artl1_3_3   status_artl1_3_4   status_artl1_3_5   status_artl1_3_6
status_artl1_3_7   status_artl1_3_8   status_artl1_3_9   status_artl1_3_10  status_artl1_3_11  status_artl1_3_12 
status_artl1_3_13  status_artl1_3_14  status_artl1_3_15  status_artl1_3_16 
status_artl1_5_1   status_artl1_5_2   status_artl1_5_3   status_artl1_5_4   status_artl1_5_5   status_artl1_5_6 
status_artl1_5_7   status_artl1_5_8   status_artl1_5_9   status_artl1_5_10  status_artl1_5_11  status_artl1_5_12
status_artl1_5_13  status_artl1_5_14  status_artl1_5_15  status_artl1_5_16 

rr_int_tox  double_rate_gas_tox_taz  incr_mort_risk_dol_weightg oth_dol_adv_birth_e_risk  prev_oth_dol_adv_birth_e 
pregnant_oth_dol_adv_birth_e   prop_bmi_ge23

_ai_naive_no_pmtct_  _ai_naive_no_pmtct_c_r_  _ai_naive_no_pmtct_c_nnm_  _ai_naive_no_pmtct_c_pim_  
_ai_naive_no_pmtct_c_inm_  _ai_naive_no_pmtct_c_rt184m_  _ai_naive_no_pmtct_c_rt65m_  _ai_naive_no_pmtct_c_rttams_  
_ai_naive_no_pmtct_e_r_  _ai_naive_no_pmtct_e_nnm_   _ai_naive_no_pmtct_e_pim_  _ai_naive_no_pmtct_e_inm_
_ai_naive_no_pmtct_e_rt184m_  _ai_naive_no_pmtct_e_rt65m_  _ai_naive_no_pmtct_e_rttams_

_all_ai_  _all_ai_c_r_  _all_ai_c_nnm_  _all_ai_c_pim_  _all_ai_c_inm_  _all_ai_c_rt184m_  _all_ai_c_rt65m_  _all_ai_c_rttams_  
_all_ai_e_r_  _all_ai_e_nnm_  _all_ai_e_pim_  _all_ai_e_inm_  _all_ai_e_rt184m_  _all_ai_e_rt65m_  _all_ai_e_rttams_


r_dol_ten3tc_r_f_1 outc_ten3tc_r_f_1_1 outc_ten3tc_r_f_1_2  outc_ten3tc_r_f_1_3  outc_ten3tc_r_f_1_4  outc_ten3tc_r_f_1_5  outc_ten3tc_r_f_1_6
outc_ten3tc_r_f_1_7

drug_level_test  tle tld zld zla otherreg

no_recent_vm_gt1000 no_recent_vm_gt1000_dol  no_recent_vm_gt1000_efa
recent_vm_gt1000 recent_vm_gt1000_dol  recent_vm_gt1000_efa recent_vm_gt1000_zdv

/*costs and dalys*/
cost     art_cost    adc_cost   cd4_cost    vl_cost    vis_cost    full_vis_cost    who3_cost   cot_cost
tb_cost    cost_test   res_cost   cost_circ     adhm_cost  t_adh_int_cost adj_art_cost     cost_test_m    cost_test_f   
cost_prep  cost_prep_visit		 cost_prep_ac_adh  			cost_cascade_intervention
cost_test_m_sympt  		   cost_test_f_sympt  		   cost_test_m_circ  			cost_test_f_anc cost_test_f_sw
cost_test_f_non_anc  	   pi_cost  	 cost_switch_line  			cost_child_hiv  cost_child_hiv_mo_art  		   cost_art_init
adj_art_1_cost  		   adj_art_2_cost			   art_1_cost   art_2_cost  	art_3_cost  	cost_vl_not_done 
cost_zdv  	 cost_ten 	   cost_3tc 	 cost_nev  	   cost_lpr  	cost_dar 	 	cost_taz  	  	cost_efa  	   cost_dol   

_ly  _dly  _qaly  _dqaly  _cost_   live_daly  live_ddaly 

_dcost_  	_dart_cost    _dadc_cost  	 _dcd4_cost    _dvl_cost	_dvis_cost    	 _dfull_vis_cost _dwho3_cost    _dcot_cost 
_dtb_cost   _dtest_cost   _dres_cost     _dcost_circ   _dadhm_cost  _d_t_adh_int_cost _dadj_art_dcost _dtest_cost_m  _dtest_cost_f 
_dcost_prep _dcost_prep_visit  			 _dcost_prep_ac_adh 		_dcost_cascade_interventions
_dcost_test_m_sympt  	  _dcost_test_f_sympt  			_dcost_test_m_circ  	  	 _dcost_test_f_anc  _dcost_test_f_sw
_dcost_test_f_non_anc 	  _dpi_cost  	 _dcost_switch_line  		_dcost_child_hiv _dcost_child_hiv_mo_art  		_dcost_art_init
_dadj_art_1_cost  		  _dadj_art_2_cost  			_dart_1_cost _dart_2_cost    _dart_3_cost		_dcost_vl_not_done
_dcost_non_aids_pre_death  ddaly_non_aids_pre_death  dead_ddaly_oth_dol_adv_birth_e  _dcost_drug_level_test


/*visits and linkage*/
visit&j  lost&j  linked_to_care  linked_to_care_this_period
pre_art_care   linked_preartcare_12m  linked_preartcare_6m	 linked_preartcare_3m  staged_12m  ret_preartcare_12m  
staged_eligm1y  inart_staged_eligm1y  retpreart_m12mdiag  m12mdiag  elig_mcd4_  
eligatdiag_1y  inart_eligatdiag_1y  onart_eligatdiag_1y  ret_preartcare_naive
visit_prep_no  visit_prep_d  visit_prep_dt  visit_prep_dtc	
sv   sv_secondline  

/*deaths*/
dead1564_all	  dead1564m_all  dead1564w_all
dead1519m_all  dead2024m_all  dead2529m_all  dead3034m_all  dead3539m_all dead4044m_all  dead4549m_all
dead1519w_all  dead2024w_all  dead2529w_all  dead3034w_all  dead3539w_all dead4044w_all  dead4549w_all
death_hivrel  dead_rdcause2  dead_onart_rdcause2
dead1564_&j  death_hiv  dead_diag  dead_naive  dead_onart  dead_line1_lf0  dead_line1_lf1  dead_line2_lf1  dead_line2_lf2 
dead_artexp  dead_artexpoff  dead_nn  dead_pir  dead_adc  dead_line1  dead_line2  dead_art_3m
dead_u_vfail1  dead_line1_vlg1000  dead_line2_vlg1000  ev_onart_gt6m_vlg1000_dead
sdg_1     sdg_2     sdg_3     sdg_4     sdg_5     sdg_6     sdg_7     sdg_8     sdg_9     sdg_99
sdg_hr_1  sdg_hr_2  sdg_hr_3  sdg_hr_4  sdg_hr_5  sdg_hr_6  sdg_hr_7  sdg_hr_8  sdg_hr_9  sdg_hr_99 
art_dur_l6m_dead  	art_dur_g6m_dead   	art_tdur_l6m_dead  art_tdur_g6m_dead    
ev_onart_gt6m_vlg1000_adead  ev_onart_gt6m_vl_m_g1000_dead  ev_onart_gt6m_vl_m_g1000_adead
ev_art_g1k_not2l_adead

/*sex workers*/
base_rate_sw  sw&j	sw_1549   sw_1849  sw_1519  sw_2024  sw_2529  sw_3039  sw_ov40  
ever_sw  ever_sw1849_ ever_sw_hiv  ever_sw_diag
hiv_sw  hiv_sw1849_  hiv_sw1549_  hiv_sw1519_  hiv_sw2024_  hiv_sw2529_  hiv_sw3039_  hiv_swov40_  
i_fsw_v1_np 	i_fsw_v2_np   i_fsw_v3_np	i_fsw_v4_np  	i_fsw_v5_np	i_fsw_v6_np
i_v1_ep 		i_v2_ep 		i_v3_ep 		i_v4_ep 		i_v5_ep  		i_v6_ep
i_v1_newp 	i_v2_newp 	i_v3_newp 	i_v4_newp 	i_v5_newp  	i_v6_newp
sw_newp   sw_newp_cat1 sw_newp_cat2 sw_newp_cat3 sw_newp_cat4 sw_newp_cat5  
episodes_sw  sw_gt1ep
new_1519sw  new_2024sw  new_2529sw  new_3039sw  new_ge40sw  

/*ADC etc*/
adc&j  who3_event&j  who4_&j   tb&j  adc_diagnosed onart_adc  adc_naive  adc_line1_lf0  adc_line1_lf1  adc_line2_lf1 
adc_line2_lf2  adc_artexpoff 


/*Pregnancy and children*/
pregnant  anc  w1549_birthanc  w1524_birthanc  hiv_w1549_birthanc  hiv_w1524_birthanc 
hiv_pregnant  pregnant_not_diagnosed_pos  hiv_pregn_w1549_  hiv_pregn_w1524_  hiv_anc  pmtct
on_sd_nvp  on_dual_nvp  ever_sd_nvp ever_dual_nvp
pregnant_w1549    pregnant_w1524    pregnant_w1519    pregnant_w2024    pregnant_w2529    pregnant_w3034    pregnant_w3539   
pregnant_w4044    pregnant_w4549    pregnant_w50pl 
tested_w1549_anc  tested_w1524_anc  tested_w1519_anc  tested_w2024_anc  tested_w2529_anc  tested_w3034_anc  tested_w3539_anc 
tested_w4044_anc  tested_w4549_anc  tested_w50pl_anc 
hiv_w1549_anc     hiv_w1524_anc     hiv_w1519_anc     hiv_w2024_anc     hiv_w2529_anc     hiv_w3034_anc     hiv_w3539_anc 
hiv_w4044_anc     hiv_w4549_anc     hiv_w50pl_anc 


CEB_W1524 		  CEB_W2534			CEB_W3544 		  CEB_W4549 
want_no_more_children    pregnant_ntd  pregnant_vlg1000  pregnant_o_dol  pregnant_onart_vlg1000  pregnant_onart  pregnant_onart_vl_high
pregnant_onart_vl_vhigh  pregnant_onart_vl_vvhigh  
birth_with_inf_child     child_with_resistant_hiv  give_birth_with_hiv  onart_birth_with_inf_child_res  
onart_birth_with_inf_child  ntd_risk_dol  rate_birth_with_infected_child

/*circumcision*/
mcirc      mcirc_1519m		mcirc_2024m		 mcirc_2529m	  mcirc_3039m 	   mcirc_4049m		mcirc_50plm
new_mcirc  new_mcirc_1519m	new_mcirc_2024m	 new_mcirc_2529m  new_mcirc_3039m  new_mcirc_4049m  new_mcirc_50plm


/*2020 interventions*/
condom_incr_2020    			cascade_care_improvements    incr_test_2020             decr_hard_reach_2020  incr_adh_2020  
decr_prob_loss_at_diag_2020 	decr_rate_lost_2020		     decr_rate_lost_art_2020    incr_rate_return_2020     
incr_rate_restart_2020          incr_rate_init_2020          decr_rate_int_choice_2020  incr_prob_vl_meas_done_2020 
incr_pr_switch_line_2020    	prep_improvements       	 incr_adh_pattern_prep_2020 
inc_r_test_startprep_2020   incr_r_test_restartprep_2020 decr_r_choose_stop_prep_2020 
inc_p_prep_restart_choi_2020  incr_prepuptake_sw_2020      incr_prepuptake_pop_2020   expand_prep_to_all_2020 
circ_improvements 				circ_inc_rate_2020 		     incr_test_targeting_2020   option_0_prep_continue_2020  	
incr_max_freq_testing_2020  	initial_pr_switch_line   	 initial_prob_vl_meas_done  sw_test_6mthly_2020   reg_option_switch_2020
art_mon_drug_levels_2020		ten_is_taf_2020 		pop_wide_tld_2020

eff_max_freq_testing eff_rate_restart eff_prob_loss_at_diag eff_rate_lost eff_prob_lost_art eff_rate_return eff_pr_art_init eff_rate_int_choice 
eff_prob_vl_meas_done eff_pr_switch_line eff_rate_test_startprep eff_rate_test_restartprep eff_rate_choose_stop_prep eff_prob_prep_restart_choice 
eff_prepuptake_sw eff_prepuptake_pop  e_decr_hard_reach_2020  eff_test_targeting


/*supp mat*/
onart_vlg1     onart_vlg2     onart_vlg3     onart_vlg4     onart_vlg5    onart_vlg1_r      onart_vlg2_r      onart_vlg3_r      onart_vlg4_r      onart_vlg5_r      
onart_who4_year1  onart_who4_year1_vlt1000  onart_who4_year3   onart_who4_year3_vlt1000  onart_cd4l200_year1   
onart_cd4l200_year1_vlt1000  onart_cd4l200_year3  onart_cd4l200_year3_vlt1000  onart_res_1stline_linefail0 
onart_res_1stline  onart_linefail0  onart_linefail0_cl200   onart_linefail0_cl50  onart_cl50  onart_linefail0_vg1000  
onart_vg1000   onart_linefail0_vg1000_r   onart_vg1000_r  onart_cl350

newpge1_ly_1529m	newpge1_ly_1529w

m_1524_ge1newpever  m_2534_ge1newpever  m_3544_ge1newpever  m_4554_ge1newpever  m_5564_ge1newpever
m_1524_ge2newpever  m_2534_ge2newpever  m_3544_ge2newpever  m_4554_ge2newpever  m_5564_ge2newpever
m_1524_ge5newpever  m_2534_ge5newpever  m_3544_ge5newpever  m_4554_ge5newpever  m_5564_ge5newpever
w_ge1newpever		w_ge2newpever		w_ge5newpever

npge1_ly_1564m  npge1_ly_1524m  npge1_ly_2534m  npge1_ly_3544m  npge1_ly_4554m  npge1_ly_5564m  npge1_ly_1564w  npge1_ly_1524w  npge1_ly_2534w  npge1_ly_3544w  npge1_ly_4554w  npge1_ly_5564w
npge2_ly_1564m  npge2_ly_1524m  npge2_ly_2534m  npge2_ly_3544m  npge2_ly_4554m  npge2_ly_5564m  npge2_ly_1564w  npge2_ly_1524w  npge2_ly_2534w  npge2_ly_3544w  npge2_ly_4554w  npge2_ly_5564w
npge10_ly_1564m  npge10_ly_1524m  npge10_ly_2534m  npge10_ly_3544m  npge10_ly_4554m  npge10_ly_5564m  npge10_ly_1564w  npge10_ly_1524w  npge10_ly_2534w  npge10_ly_3544w  npge10_ly_4554w  npge10_ly_5564w
npge50_ly_1564m  npge50_ly_1524m  npge50_ly_2534m  npge50_ly_3544m  npge50_ly_4554m  npge50_ly_5564m  npge50_ly_1564w  npge50_ly_1524w  npge50_ly_2534w  npge50_ly_3544w  npge50_ly_4554w  npge50_ly_5564w
npge1_ly_1564_hivpos  npge2_ly_1564_hivpos  npge1_ly_1564_hivdiag  npge2_ly_1564_hivdiag  npge1_ly_1564_hivneg  npge2_ly_1564_hivneg


/*parameters sampled*/
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w   p_rred_p  p_hsb_p  newp_factor  eprate
conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000
prob_pregnancy_base
fold_change_w  fold_change_yw  fold_change_sti  super_infection
an_lin_incr_test  date_test_rate_plateau  rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx
adh_pattern  prob_loss_at_diag  pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  poorer_cd4rise_fail_ii
rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop
add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  prob_lossdiag_adctb  prob_lossdiag_who3e  higher_newp_less_engagement
fold_tr  switch_for_tox
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep
circ_inc_rate
p_hard_reach_w hard_reach_higher_in_men  p_hard_reach_m  
 inc_cat   sex_age_mixing_matrix_m  sex_age_mixing_matrix_w   cd4_monitoring   base_rate_stop_sexwork   rred_a_p

/* keep_going - only needed to be saved for test runs */

keep_going_1999 keep_going_2004 keep_going_2016 keep_going_2020

;

where 15 <= age&j < 65 ;

output out=x1

median=p50_cd4diag  sum=s_cd4diag  
median=p50_measured_cd4art sum=s_measured_cd4art 
median=p50_years_on_prep sum=s_years_on_prep
median=p50_n_test_prevyr_onprep sum=s_n_test_prevyr_onprep
median=p50_age_deb_sw sum=s_age_deb 
median=p50_act_years_sw sum=s_act_years_sw 

/*general*/
s_n  s_caldate  s_run  s_option  s_util

/*number alive and in each age group*/
s_alive1549 	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m			
s_ageg1517w		s_ageg1819w		s_ageg1519w  	s_ageg2024w		s_ageg2529w  	s_ageg3034w		s_ageg3539w		s_ageg4044w	
s_ageg4549w		s_ageg5054w 	s_ageg5559w		s_ageg6064w		s_ageg1564w		s_ageg1549w		s_age_1844w
s_ageg1m  s_ageg2m  s_ageg3m  s_ageg4m  s_ageg5m  s_ageg1w  s_ageg2w  s_ageg3w  s_ageg4w  s_ageg5w 


/*number and status of those with HIV*/
s_hiv1564 		s_hiv1549 
s_hiv1517m		s_hiv1819m		s_hiv1519m  	s_hiv2024m		s_hiv2529m  	s_hiv3034m		s_hiv3539m		s_hiv4044m	
s_hiv4549m		s_hiv5054m 		s_hiv5559m		s_hiv6064m		s_hiv1564m		s_hiv1549m	
s_hiv1517w		s_hiv1819w		s_hiv1519w  	s_hiv2024w		s_hiv2529w  	s_hiv3034w		s_hiv3539w		s_hiv4044w	
s_hiv4549w		s_hiv5054w 		s_hiv5559w		s_hiv6064w		s_hiv1564w		s_hiv1549w	
s_sg_1 			s_sg_2 			s_sg_3 			s_sg_4			s_sg_5 			s_sg_6 			s_sg_7 			s_sg_8 		s_sg_9	 s_sg_99


/*primary infection*/
s_primary  		s_primary1549   s_primary1549m  s_primary1549w  s_infected_primary 	s_inf_primary
s_primary1519m	s_primary2024m	s_primary2529m	s_primary3034m	s_primary3539m	s_primary4044m	s_primary4549m
s_primary5054m	s_primary5559m	s_primary6064m
s_primary1519w	s_primary2024w	s_primary2529w	s_primary3034w	s_primary3539w	s_primary4044w	s_primary4549w
s_primary5054w	s_primary5559w	s_primary6064w
s_primary_ep_m  s_primary_ep_w  
s_primary1524m_ep  s_primary2534m_ep  s_primary3544m_ep  s_primary4554m_ep  s_primary5564m_ep
s_primary1524w_ep  s_primary2534w_ep  s_primary3544w_ep  s_primary4554w_ep  s_primary5564w_ep
s_primary1524m_epnewp  s_primary2534m_epnewp  s_primary3544m_epnewp  s_primary4554m_epnewp  s_primary5564m_epnewp 
s_primary1524w_epnewp  s_primary2534w_epnewp  s_primary3544w_epnewp  s_primary4554w_epnewp  s_primary5564w_epnewp
s_primary_sw
s_inf_vlsupp  s_inf_newp  s_inf_ep  s_inf_diag  s_inf_naive 

/*outputs amongst those infected*/
s_i_m_d_newp  s_i_w_d_newp   s_i_w_np   s_i_m_np  s_i_ep 

s_i_m_1524_newp  s_i_m_2534_newp  s_i_m_3544_newp  s_i_m_4554_newp  s_i_m_5564_newp
s_i_w_1524_newp  s_i_w_2534_newp  s_i_w_3544_newp  s_i_w_4554_newp  s_i_w_5564_newp 
s_i_r_vlg1_np  s_i_r_vlg2_np  s_i_r_vlg3_np  s_i_r_vlg4_np  s_i_r_vlg5_np  s_i_r_vlg6_np
s_i_diag_vlg1_rm0_np   s_i_diag_vlg2_rm0_np   s_i_diag_vlg3_rm0_np   s_i_diag_vlg4_rm0_np   s_i_diag_vlg5_rm0_np   s_i_diag_vlg6_rm0_np
s_i_diag_vlg1_rm1_np   s_i_diag_vlg2_rm1_np   s_i_diag_vlg3_rm1_np   s_i_diag_vlg4_rm1_np   s_i_diag_vlg5_rm1_np   s_i_diag_vlg6_rm1_np
s_i_naive_vlg1_rm0_np  s_i_naive_vlg2_rm0_np  s_i_naive_vlg3_rm0_np  s_i_naive_vlg4_rm0_np  s_i_naive_vlg5_rm0_np  s_i_naive_vlg6_rm0_np
s_i_naive_vlg1_rm1_np  s_i_naive_vlg2_rm1_np  s_i_naive_vlg3_rm1_np  s_i_naive_vlg4_rm1_np  s_i_naive_vlg5_rm1_np  s_i_naive_vlg6_rm1_np
s_i_v1_np  s_i_v2_np   s_i_v3_np  s_i_v4_np   s_i_v5_np  s_i_v6_np 

/*Number ep and newp*/
s_rbm  s_np  s_newp  s_newp_ge1  s_newp_ge5  s_newp_ge10  s_newp_ge50  s_ep  s_ep_m  s_ep_w  s_npge10  s_npge2  s_npge2_ly_1549m  s_npge2_ly_1549w
s_m_1524_ep  	 s_m_2534_ep 	  s_m_3544_ep 	   s_m_4554_ep 		s_m_5564_ep 	 
s_w_1524_ep		 s_w_2534_ep 	  s_w_3544_ep	   s_w_4554_ep 		s_w_5564_ep 
s_m_1524_newp  	 s_m_2534_newp    s_m_3544_newp    s_m_4554_newp  	s_m_5564_newp
s_w_1524_newp  	 s_w_2534_newp    s_w_3544_newp    s_w_4554_newp    s_w_5564_newp
s_m_1524_epnewp  s_m_2534_epnewp  s_m_3544_epnewp  s_m_4554_epnewp  s_m_5564_epnewp 
s_w_1524_epnewp  s_w_2534_epnewp  s_w_3544_epnewp  s_w_4554_epnewp  s_w_5564_epnewp
s_newp_ge1_hiv 
av_newp_p3m  av_newp_p3m_hiv  av_newp_p3m_diag  av_p_ep_py  av_p_ep_py_hiv  av_p_ep_py_diag
s_ever_ep  s_ever_newp  
s_m1524_ep1524_ s_m1524_ep2534_ s_m1524_ep3544_ s_m1524_ep4554_ s_m1524_ep5564_ 
s_m2534_ep1524_ s_m2534_ep2534_ s_m2534_ep3544_ s_m2534_ep4554_ s_m2534_ep5564_ 
s_m3544_ep1524_ s_m3544_ep2534_ s_m3544_ep3544_ s_m3544_ep4554_ s_m3544_ep5564_
s_m4554_ep1524_ s_m4554_ep2534_ s_m4554_ep3544_ s_m4554_ep4554_ s_m4554_ep5564_ 
s_m5565_ep1524_ s_m5565_ep2534_ s_m5565_ep3544_ s_m5565_ep4554_ s_m5565_ep5564_ 
s_w1524_ep1524_ s_w1524_ep2534_ s_w1524_ep3544_ s_w1524_ep4554_ s_w1524_ep5564_ 
s_w2534_ep1524_ s_w2534_ep2534_ s_w2534_ep3544_ s_w2534_ep4554_ s_w2534_ep5564_ 
s_w3544_ep1524_ s_w3544_ep2534_ s_w3544_ep3544_ s_w3544_ep4554_ s_w3544_ep5564_ 
s_w4554_ep1524_ s_w4554_ep2534_ s_w4554_ep3544_ s_w4554_ep4554_ s_w4554_ep5564_ 
s_w5565_ep1524_ s_w5565_ep2534_ s_w5565_ep3544_ s_w5565_ep4554_ s_w5565_ep5564_ 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 

npgt1conc_ly_1524m  npgt1conc_ly_1524w  npgt1conc_ly_1519m  npgt1conc_ly_1519w  npgt1conc_ly_2549m 
npgt1conc_ly_2549w  npgt1conc_ly_5064m  npgt1conc_ly_5064w 

s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

/*status of partner*/
s_eph0_m  s_eph0_w  s_nip   s_epi
s_newp_hiv  s_newp_ge1_hiv_diag  s_epdiag   s_diag_epun  s_eponart  s_epvls
s_hiv1epi0_w  s_hiv0epi1_w  s_hiv1epi0_m  s_hiv0epi1_m  s_hiv1epi1_m  s_hiv1epi1_w  
s_hiv0epprim
s_ever_ep_hiv  s_ever_ep_diag  s_ever_newp_hiv  s_ever_newp_diag
s_infected_newp_m  s_infected_newp_w  s_infected_ep_m  s_infected_ep_w

s_i_vl1000_m_np s_i_v11000_m_ep s_i_vl1000_m_newp
s_i_vl1000_w_np s_i_v11000_w_ep s_i_vl1000_w_newp


s_i_v1_age1_w_np s_i_v1_age2_w_np s_i_v1_age3_w_np s_i_v1_age4_w_np s_i_v1_age5_w_np 
s_i_v1_age1_m_np s_i_v1_age2_m_np s_i_v1_age3_m_np s_i_v1_age4_m_np s_i_v1_age5_m_np 
s_i_v1_age1_w_newp s_i_v1_age2_w_newp s_i_v1_age3_w_newp s_i_v1_age4_w_newp s_i_v1_age5_w_newp 
s_i_v1_age1_m_newp s_i_v1_age2_m_newp s_i_v1_age3_m_newp s_i_v1_age4_m_newp s_i_v1_age5_m_newp 
s_i_v1_age1_w_ep s_i_v1_age2_w_ep s_i_v1_age3_w_ep s_i_v1_age4_w_ep s_i_v1_age5_w_ep 
s_i_v1_age1_m_ep s_i_v1_age2_m_ep s_i_v1_age3_m_ep s_i_v1_age4_m_ep s_i_v1_age5_m_ep 

s_i_v2_age1_w_np s_i_v2_age2_w_np s_i_v2_age3_w_np s_i_v2_age4_w_np s_i_v2_age5_w_np 
s_i_v2_age1_m_np s_i_v2_age2_m_np s_i_v2_age3_m_np s_i_v2_age4_m_np s_i_v2_age5_m_np 
s_i_v2_age1_w_newp s_i_v2_age2_w_newp s_i_v2_age3_w_newp s_i_v2_age4_w_newp s_i_v2_age5_w_newp 
s_i_v2_age1_m_newp s_i_v2_age2_m_newp s_i_v2_age3_m_newp s_i_v2_age4_m_newp s_i_v2_age5_m_newp 
s_i_v2_age1_w_ep s_i_v2_age2_w_ep s_i_v2_age3_w_ep s_i_v2_age4_w_ep s_i_v2_age5_w_ep 
s_i_v2_age1_m_ep s_i_v2_age2_m_ep s_i_v2_age3_m_ep s_i_v2_age4_m_ep s_i_v2_age5_m_ep 

s_i_v3_age1_w_np s_i_v3_age2_w_np s_i_v3_age3_w_np s_i_v3_age4_w_np s_i_v3_age5_w_np 
s_i_v3_age1_m_np s_i_v3_age2_m_np s_i_v3_age3_m_np s_i_v3_age4_m_np s_i_v3_age5_m_np 
s_i_v3_age1_w_newp s_i_v3_age2_w_newp s_i_v3_age3_w_newp s_i_v3_age4_w_newp s_i_v3_age5_w_newp 
s_i_v3_age1_m_newp s_i_v3_age2_m_newp s_i_v3_age3_m_newp s_i_v3_age4_m_newp s_i_v3_age5_m_newp 
s_i_v3_age1_w_ep s_i_v3_age2_w_ep s_i_v3_age3_w_ep s_i_v3_age4_w_ep s_i_v3_age5_w_ep 
s_i_v3_age1_m_ep s_i_v3_age2_m_ep s_i_v3_age3_m_ep s_i_v3_age4_m_ep s_i_v3_age5_m_ep 

s_i_v4_age1_w_np s_i_v4_age2_w_np s_i_v4_age3_w_np s_i_v4_age4_w_np s_i_v4_age5_w_np 
s_i_v4_age1_m_np s_i_v4_age2_m_np s_i_v4_age3_m_np s_i_v4_age4_m_np s_i_v4_age5_m_np 
s_i_v4_age1_w_newp s_i_v4_age2_w_newp s_i_v4_age3_w_newp s_i_v4_age4_w_newp s_i_v4_age5_w_newp 
s_i_v4_age1_m_newp s_i_v4_age2_m_newp s_i_v4_age3_m_newp s_i_v4_age4_m_newp s_i_v4_age5_m_newp 
s_i_v4_age1_w_ep s_i_v4_age2_w_ep s_i_v4_age3_w_ep s_i_v4_age4_w_ep s_i_v4_age5_w_ep 
s_i_v4_age1_m_ep s_i_v4_age2_m_ep s_i_v4_age3_m_ep s_i_v4_age4_m_ep s_i_v4_age5_m_ep 

s_i_v5_age1_w_np s_i_v5_age2_w_np s_i_v5_age3_w_np s_i_v5_age4_w_np s_i_v5_age5_w_np 
s_i_v5_age1_m_np s_i_v5_age2_m_np s_i_v5_age3_m_np s_i_v5_age4_m_np s_i_v5_age5_m_np 
s_i_v5_age1_w_newp s_i_v5_age2_w_newp s_i_v5_age3_w_newp s_i_v5_age4_w_newp s_i_v5_age5_w_newp 
s_i_v5_age1_m_newp s_i_v5_age2_m_newp s_i_v5_age3_m_newp s_i_v5_age4_m_newp s_i_v5_age5_m_newp 
s_i_v5_age1_w_ep s_i_v5_age2_w_ep s_i_v5_age3_w_ep s_i_v5_age4_w_ep s_i_v5_age5_w_ep 
s_i_v5_age1_m_ep s_i_v5_age2_m_ep s_i_v5_age3_m_ep s_i_v5_age4_m_ep s_i_v5_age5_m_ep 

s_i_v6_age1_w_np s_i_v6_age2_w_np s_i_v6_age3_w_np s_i_v6_age4_w_np s_i_v6_age5_w_np 
s_i_v6_age1_m_np s_i_v6_age2_m_np s_i_v6_age3_m_np s_i_v6_age4_m_np s_i_v6_age5_m_np 
s_i_v6_age1_w_newp s_i_v6_age2_w_newp s_i_v6_age3_w_newp s_i_v6_age4_w_newp s_i_v6_age5_w_newp 
s_i_v6_age1_m_newp s_i_v6_age2_m_newp s_i_v6_age3_m_newp s_i_v6_age4_m_newp s_i_v6_age5_m_newp 
s_i_v6_age1_w_ep s_i_v6_age2_w_ep s_i_v6_age3_w_ep s_i_v6_age4_w_ep s_i_v6_age5_w_ep 
s_i_v6_age1_m_ep s_i_v6_age2_m_ep s_i_v6_age3_m_ep s_i_v6_age4_m_ep s_i_v6_age5_m_ep 

s_i_age1_m_np s_i_age2_m_np	s_i_age3_m_np	s_i_age4_m_np	s_i_age5_m_np
s_i_age1_w_np	s_i_age2_w_np	s_i_age3_w_np	s_i_age4_w_np	s_i_age5_w_np
s_i_age1_m_newp s_i_age2_m_newp	s_i_age3_m_newp	s_i_age4_m_newp	s_i_age5_m_newp
s_i_age1_w_newp	s_i_age2_w_newp	s_i_age3_w_newp	s_i_age4_w_newp	s_i_age5_w_newp

s_i_m_1549_np  s_i_w_1549_np

/*resistance*/
s_tam1_  s_tam2_  s_tam3_  s_m184m_  s_k103m_  s_y181m_  s_g190m_  s_nnm_  s_q151m_  s_k65m_  
s_p32m_  s_p33m_  s_p46m_  s_p47m_   s_p50vm_  s_p50lm_  s_p54m_   s_p76m_ s_p82m_   s_p84m_   s_p88m_	s_p90m_   s_pim_  
s_inpm_  s_insm_  s_rm_    s_i_nnm   s_i_rm    s_i_pim   s_i_tam   s_i_im  s_inm_    s_i_184m  s_im_art s_pim_art s_tam_art s_m184_art
s_r_  	 s_r_3tc  s_r_nev  s_r_lpr   s_r_taz   s_r_efa   s_r_ten   s_r_zdv s_r_dol  
s_rme_   s_iime_  s_nnme_  s_pime_   s_nrtime_
s_res_1stline_startline2  s_nnm_art  s_nnm_art_m  s_nnm_art_w  s_r_art  s_acq_rt65m  s_acq_rt184m  s_acq_rtm  s_onart_iicu_res
s_nactive_art_start_lt2  s_nactive_art_start_lt3  s_nactive_art_start_lt1p5
s_nactive_line2_lt4 	 s_nactive_line2_lt3 	  s_nactive_line2_lt2 		s_nactive_line2_lt1p5  s_pim_line2
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  s_higher_rate_res_dol
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  s_nnrti_res_no_effect


/*prep*/
s_prep s_prep_sw s_prep_w_1524 s_elig_prep_epdiag  s_infected_prep  s_prep_ever  s_primary_prep  s_hiv1_prep  s_i_r_prep  s_primary_r_prep  s_ever_i_nor_prep  
s_rm_prep  s_elig_prep  s_hr_noprep  s_primary_hr_noprep 
s_rt65m_3_prep  s_rt184m_3_prep  s_rtm_3_prep  s_rt65m_6_prep  s_rt184m_6_prep  s_rtm_6_prep 
s_rt65m_9_prep  s_rt184m_9_prep  s_rtm_9_prep  s_rt65m_12_prep  s_rt184m_12_prep  s_rtm_12_prep  
s_rt65m_18_prep s_rt184m_18_prep s_rtm_18_prep  
s_onprep_3  s_onprep_6  s_onprep_9  s_onprep_12  s_onprep_18  

s_prepstart  s_ever_stopped_prep_choice  s_preprestart 
s_acq_rt65m_3_prep  s_acq_rt184m_3_prep   s_acq_rtm_3_prep     s_acq_rt65m_6_prep   s_acq_rt184m_6_prep   s_acq_rtm_6_prep 
s_acq_rt65m_9_prep  s_acq_rt184m_9_prep   s_acq_rtm_9_prep     s_acq_rt65m_12_prep  s_acq_rt184m_12_prep  s_acq_rtm_12_prep  
s_acq_rt65m_18_prep s_acq_rt184m_18_prep  s_acq_rtm_18_prep
s_inf_prep_adhg80   s_inf_prep_adh5080    s_inf_prep_adhl50  s_prep_adhg80  s_prep_adh5080  s_prep_adhl50 
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w

s_infected_prep_source_prep_r  s_prepinfect_prep_r     s_prepinfect_prep_r_p   s_infected_prep_no_r    s_infected_prep_r  
s_started_prep_in_primary	   s_tot_yrs_prep  		   s_onprep_3_i_prep_no_r  s_onprep_6_i_prep_no_r  s_onprep_9_i_prep_no_r 
s_onprep_12_i_prep_no_r 	   s_onprep_18_i_prep_no_r s_prepinfect_rm_p      s_prepinfect_m184m_p    s_prepinfect_k65m_p 
s_prepinfect_tam_p 			   s_prepinfect_rtm  	   s_prepinfect_k65m	   s_prepinfect_m184m  	   s_prepinfect_tam  
s_prep_willing_pop  		   s_prep_willing_sw  	   s_stop_prep_choice      s_started_prep_hiv_test_sens  
s_cur_res_prep_drug 		   s_started_prep_hiv_test_sens_e  				   s_started_prep_in_primary_e
s_cur_res_ten				   s_cur_res_3tc  		   s_i_65m 				   s_cur_res_efa 			
s_cur_res_ten_vlg1000 		   s_cur_res_3tc_vlg1000 						   s_cur_res_efa_vlg1000	s_ever_hiv1_prep 
s_cur_res_efa_ever_hiv1_prep   s_cur_res_ten_ever_hiv1_prep   				   s_cur_res_3tc_ever_hiv1_prep   
s_prep_effectiveness_non_res_v 
s_prep_3m_after_inf_no_r 	s_prep_3m_after_inf_no_r_184  s_prep_3m_after_inf_no_r_65
s_prep_6m_after_inf_no_r  s_prep_6m_after_inf_no_r_184  s_prep_6m_after_inf_no_r_65  s_prep_12m_after_inf_no_r  
s_prep_12m_after_inf_no_r_184  s_prep_12m_after_inf_no_r_65
s_hiv_prep_reason_1  s_hiv_prep_reason_2  s_hiv_prep_reason_3  s_hiv_prep_reason_4

s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg10  s_prep_newpg100 
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_ever_w_1524  s_prep_ever_w
s_test_gt_3m_on_prep  s_test_gt_3m_on_prep_pos  s_test_3m_on_prep  s_test_3m_on_prep_pos  
s_prepuptake_sw 	 s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep


/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_tested1549_		s_tested1549m       s_tested1549w
s_tested_ly_m1549_ 	s_tested_ly_m1519_ 	s_tested_ly_m2024_ s_tested_ly_m2529_  s_tested_ly_m3039_  s_tested_ly_m4049_  s_tested_ly_m5064_
s_tested_ly_w1549_ 	s_tested_ly_w1519_ 	s_tested_ly_w2024_ s_tested_ly_w2529_  s_tested_ly_w3039_  s_tested_ly_w4049_  s_tested_ly_w5064_ 
s_tested_ly_sw		

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_who3_tested  
s_tested_trueneg  s_tested_falseneg  s_tested_falsepos  s_tested_falseneg_prim  s_com_test  s_tested_anc_prevdiag  s_tested_anc
s_non_hiv_symptoms  s_symptomatic  s_tested_symp  s_tested_pos_sympt  s_tested_symp_undiag  s_tested_non_hivsymp  s_symptomatic_undiag 		
s_tested_as_sw  s_tested_m_sympt  s_tested_f_sympt  s_tested_f_sw  s_tested_m_circ  
s_rate_1sttest   s_rate_reptest  s_newp_lasttest_tested_this_per
s_acc_test  s_acc_test_1524_  s_acc_test_2549_  s_acc_test_5064_  s_acc_test_sw  

s_diag
s_diag_m1549_  s_diag_m1519_  s_diag_m2024_  s_diag_m2529_  s_diag_m3034_  s_diag_m3539_  s_diag_m4044_  s_diag_m4549_ 
s_diag_m5054_  s_diag_m5559_  s_diag_m6064_ 
s_diag_w1549_  s_diag_w1519_  s_diag_w2024_  s_diag_w2529_  s_diag_w3034_  s_diag_w3539_  s_diag_w4044_  s_diag_w4549_ 
s_diag_w5054_  s_diag_w5559_  s_diag_w6064_  s_diag_sw 
s_nn_tdr_diag

s_diag_this_period  s_diag_this_period_m  s_diag_this_period_f  s_diag_this_period_f_non_anc  s_diag_this_period_f_anc 
s_diag_this_period_m_sympt  s_diag_this_period_f_sympt  s_diag_12m  s_diag_6m  s_diag_3m 
s_sympt_diag  s_sympt_diag_ever  s_diag_m  s_diag_w  s_epdiag_m  s_epdiag_w	 s_epi_m  s_epi_w
s_diag_ep


/*VL and CD4*/
s_vlg1  s_vlg2  s_vlg3  s_vlg4  s_vlg5  s_vlg6
s_line1_vlg1000 s_line2_vlg1000  s_res_vfail1
s_u_vfail1_this_period  s_u_vfail1  s_vl_vfail1_g1 s_vl_vfail1_g2 s_vl_vfail1_g3 s_vl_vfail1_g4 s_vl_vfail1_g5 s_vl_vfail1_g6 
s_vlg1000_onart  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_184m  s_vlg1000_onart_65m  s_sw_vg1000
s_vg1000  s_vg1000_m  s_vg1000_w  s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt_6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt_6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt_6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt_6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt_6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt_6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw

s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
s_art_initiation_strategy  s_art_monitoring_strategy   s_naive    s_onart  s_int_clinic_not_aw
s_art_start  	s_art_start_m   s_art_start_w   s_artexp  s_artexpoff  s_onart_m  s_onart_w
s_onart_m1549_  s_onart_m1564_  s_onart_m1519_  s_onart_m2024_  s_onart_m2529_  s_onart_m3034_  s_onart_m3539_  
s_onart_m4044_  s_onart_m4549_  s_onart_m5054_  s_onart_m5559_  s_onart_m6064_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	s_onart_sw
s_art_dur_l6m   s_art_dur_g6m   s_art_tdur_l6m  s_art_tdur_g6m
s_eponart_m	 s_eponart_w  s_hiv1564_onart  s_dead1564_onart  s_who3_art_init  s_who4_art_init  s_art_start_pregnant 

s_lpr  s_taz  s_3tc  s_nev  s_efa  s_ten  s_zdv  s_dol
s_onefa_linefail1  s_ev_art_g1k_l1k  s_ev_art_g1k_not2l  s_ev_art_g1k_not2l_l1k  s_ev_art_g1k  s_ev_art_g1k_not2l_adc
s_art_12m  s_vl1000_art_12m  s_art_24m  s_vl1000_art_24m  s_art_12m_onart  s_vl1000_art_12m_onart
s_startedline2  s_start_line2_this_period  s_line2_12m  s_line2_12m_onart  s_line2_incl_int_clinic_not_aw

s_onart_vlg1000  s_ever_onart_gt6m_vlg1000   s_ever_onart_gt6m_vl_m_g1000  s_onart_gt6m_vlg1000  s_r_onart_gt6m_vlg1000
s_onart_gt6m_nnres_vlg1000  s_onart_gt6m_pires_vlg1000  s_onart_gt6m_res_vlg1000
s_online1_vg1000  s_online1_vg1000_lf1  s_online1_vg1000_cd4l200  s_offart_vl1000
s_vl1000_line2_12m   s_vl1000_line2_12m_onart  s_vl1000_line2

s_offart  s_line1_  s_line2_  s_line1_lf0  s_line1_lf1  s_line2_lf1  s_line2_lf2  s_linefail_ge1  s_line1_fail_this_period
s_lf1_past_yr   s_lf1_past_yr_line2 
s_onart_cl200  s_onart_cd4_g500  s_onart_res  s_reg_option

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  s_rel_dol_tox  s_dol_higher_potency

s_status_artl1_1_1   s_status_artl1_1_2   s_status_artl1_1_3   s_status_artl1_1_4   s_status_artl1_1_5   s_status_artl1_1_6  
s_status_artl1_1_7   s_status_artl1_1_8   s_status_artl1_1_9   s_status_artl1_1_10  s_status_artl1_1_11  s_status_artl1_1_12 
s_status_artl1_1_13  s_status_artl1_1_14  s_status_artl1_1_15  s_status_artl1_1_16 
s_status_artl1_3_1   s_status_artl1_3_2   s_status_artl1_3_3   s_status_artl1_3_4   s_status_artl1_3_5   s_status_artl1_3_6
s_status_artl1_3_7   s_status_artl1_3_8   s_status_artl1_3_9   s_status_artl1_3_10  s_status_artl1_3_11  s_status_artl1_3_12 
s_status_artl1_3_13  s_status_artl1_3_14  s_status_artl1_3_15  s_status_artl1_3_16 
s_status_artl1_5_1   s_status_artl1_5_2   s_status_artl1_5_3   s_status_artl1_5_4   s_status_artl1_5_5   s_status_artl1_5_6 
s_status_artl1_5_7   s_status_artl1_5_8   s_status_artl1_5_9   s_status_artl1_5_10  s_status_artl1_5_11  s_status_artl1_5_12
s_status_artl1_5_13  s_status_artl1_5_14  s_status_artl1_5_15  s_status_artl1_5_16

s_rr_int_tox   s_double_rate_gas_tox_taz   s_incr_mort_risk_dol_weightg  s_oth_dol_adv_birth_e_risk  s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e  s_prop_bmi_ge23

s_ai_naive_no_pmtct_  s_ai_naive_no_pmtct_c_r_  s_ai_naive_no_pmtct_c_nnm_  s_ai_naive_no_pmtct_c_pim_  
s_ai_naive_no_pmtct_c_inm_  s_ai_naive_no_pmtct_c_rt184m_  s_ai_naive_no_pmtct_c_rt65m_  s_ai_naive_no_pmtct_c_rttams_  
s_ai_naive_no_pmtct_e_r_  s_ai_naive_no_pmtct_e_nnm_   s_ai_naive_no_pmtct_e_pim_  s_ai_naive_no_pmtct_e_inm_
s_ai_naive_no_pmtct_e_rt184m_  s_ai_naive_no_pmtct_e_rt65m_  s_ai_naive_no_pmtct_e_rttams_
s_all_ai_  s_all_ai_c_r_  s_all_ai_c_nnm_  s_all_ai_c_pim_  s_all_ai_c_inm_  s_all_ai_c_rt184m_  s_all_ai_c_rt65m_  s_all_ai_c_rttams_  
s_all_ai_e_r_  s_all_ai_e_nnm_  s_all_ai_e_pim_  s_all_ai_e_inm_  s_all_ai_e_rt184m_  s_all_ai_e_rt65m_  s_all_ai_e_rttams_

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

s_drug_level_test  s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

/*costs and dalys*/
s_cost       s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ     s_adhm_cost  s_t_adh_int_cost s_adj_art_cost     s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  			  s_cost_cascade_intervention
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
s_adj_art_1_cost  		   	   s_adj_art_2_cost			   	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dwho3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ    s_dadhm_cost   s_d_t_adh_int_cost s_dadj_art_dcost  s_dcost_test_m   s_dcost_test_f
s_dcost_prep   s_dcost_prep_visit  			   s_dcost_prep_ac_adh 			  s_dcost_cascade_interventions
s_dcost_test_m_sympt  	       s_dcost_test_f_sympt  		   s_dcost_test_m_circ  	  	 	s_dcost_test_f_anc s_dcost_test_f_sw
s_dcost_test_f_non_anc 	       s_dpi_cost     s_dcost_switch_line  		  s_dcost_child_hiv s_dcost_child_hiv_mo_art  		   s_dcost_art_init
s_dadj_art_1_cost  		       s_dadj_art_2_cost  			   s_dart_1_cost  s_dart_2_cost     s_dart_3_cost	   s_dcost_vl_not_done 	
s_dcost_non_aids_pre_death   s_ddaly_non_aids_pre_death  s_dead_ddaly_oth_dol_adv_birth_e   s_dcost_drug_level_test

/*visits*/
s_visit  s_lost  s_linked_to_care  s_linked_to_care_this_period
s_pre_art_care  s_linked_preartcare_12m  s_linked_preartcare_6m	 s_linked_preartcare_3m  s_staged_12m  s_ret_preartcare_12m  
s_staged_eligm1y  s_inart_staged_eligm1y  s_retpreart_m12mdiag  s_m12mdiag  s_elig_mcd4_  
s_eligatdiag_1y  s_inart_eligatdiag_1y  s_onart_eligatdiag_1y  s_ret_preartcare_naive
s_visit_prep_no  s_visit_prep_d  s_visit_prep_dt  s_visit_prep_dtc
s_sv  s_sv_secondline   

/*deaths*/
s_dead1564_all	   s_dead1564m_all    s_dead1564w_all
s_deaths1519m_all  s_deaths2024m_all  s_deaths2529m_all  s_deaths3034m_all  s_deaths3539m_all s_deaths4044m_all  s_deaths4549m_all
s_deaths1519w_all  s_deaths2024w_all  s_deaths2529w_all  s_deaths3034w_all  s_deaths3539w_all s_deaths4044w_all  s_deaths4549w_all
s_death_hivrel  s_dead_rdcause2  s_dead_onart_rdcause2
s_deaths  s_death_hiv  s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_3m 
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
s_ev_art_g1k_not2l_adead  


/*sex workers*/
s_base_rate_sw  s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw1849_  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp   s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  

/*ADC etc*/
s_adc  s_who3_event  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 


/*Pregnancy and children*/
s_pregnant 	s_anc  s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant 
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_CEB_W1524_ 		s_CEB_W2534_ 		s_CEB_W3544_ 		s_CEB_W4549_ 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child  s_ntd_risk_dol  s_rate_birth_with_infected_child

/*circumcision*/
s_mcirc      s_mcirc_1519m		s_mcirc_2024m	   s_mcirc_2529m      s_mcirc_3039m		 s_mcirc_4049m	    s_mcirc_50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3039m  s_new_mcirc_4049m  s_new_mcirc_50plm

/*2020 interventions*/
s_condom_incr_2020    			  s_cascade_care_improvements    s_incr_test_2020             s_decr_hard_reach_2020  s_incr_adh_2020
s_decr_prob_loss_at_diag_2020 	  s_decr_rate_lost_2020		     s_decr_rate_lost_art_2020    s_incr_rate_return_2020     
s_incr_rate_restart_2020          s_incr_rate_init_2020          s_decr_rate_int_choice_2020  s_incr_prob_vl_meas_done_2020 
s_incr_pr_switch_line_2020    	  s_prep_improvements       	 s_incr_adh_pattern_prep_2020 
s_inc_r_test_startprep_2020   s_incr_r_test_restartprep_2020 s_decr_r_choose_stop_prep_2020 
s_inc_p_prep_restart_choi_2020  s_incr_prepuptake_sw_2020      s_incr_prepuptake_pop_2020   s_expand_prep_to_all_2020 
s_circ_improvements 			  s_circ_inc_rate_2020 		     s_incr_test_targeting_2020   s_option_0_prep_continue_2020  	  
s_incr_max_freq_testing_2020   	  s_initial_pr_switch_line  	 s_initial_prob_vl_meas_done  s_sw_test_6mthly_2020  s_reg_option_switch_2020
s_art_mon_drug_levels_2020		s_ten_is_taf_2020      			s_pop_wide_tld_2020

s_eff_max_freq_testing s_eff_rate_restart s_eff_prob_loss_at_diag s_eff_rate_lost s_eff_prob_lost_art s_eff_rate_return s_eff_pr_art_init 
s_eff_rate_int_choice s_eff_prob_vl_meas_done s_eff_pr_switch_line s_eff_rate_test_startprep s_eff_rate_test_restartprep s_eff_rate_choose_stop_prep 
s_eff_prob_prep_restart_choice s_eff_prepuptake_sw s_eff_prepuptake_pop s_e_decr_hard_reach_2020  s_eff_test_targeting

/*supp material*/
s_onart_vlg1     s_onart_vlg2     s_onart_vlg3     s_onart_vlg4     s_onart_vlg5    
s_onart_vlg1_r   s_onart_vlg2_r   s_onart_vlg3_r   s_onart_vlg4_r   s_onart_vlg5_r 
s_onart_who4_year1   s_onart_who4_year1_vlt1000  s_onart_who4_year3   s_onart_who4_year3_vlt1000  s_onart_cd4l200_year1  
s_onart_cd4l200_year1_vlt1000  s_onart_cd4l200_year3   s_onart_cd4l200_year3_vlt1000  s_onart_res_1stline_linefail0   
s_onart_res_1stline  s_onart_linefail0  s_onart_linefail0_cl200  s_onart_linefail0_cl50  s_onart_cl50  s_onart_linefail0_vg1000  
s_onart_vg1000   s_onart_linefail0_vg1000_r   s_onart_vg1000_r   s_onart_cl350

s_newpge1_ly_1529m	s_newpge1_ly_1529w

s_m_1524_ge1newpever  s_m_2534_ge1newpever  s_m_3544_ge1newpever  s_m_4554_ge1newpever  s_m_5564_ge1newpever
s_m_1524_ge2newpever  s_m_2534_ge2newpever  s_m_3544_ge2newpever  s_m_4554_ge2newpever  s_m_5564_ge2newpever
s_m_1524_ge5newpever  s_m_2534_ge5newpever  s_m_3544_ge5newpever  s_m_4554_ge5newpever  s_m_5564_ge5newpever
s_w_ge1newpever		  s_w_ge2newpever		s_w_ge5newpever

s_npge1_ly_1564m  s_npge1_ly_1524m  s_npge1_ly_2534m  s_npge1_ly_3544m  s_npge1_ly_4554m  s_npge1_ly_5564m  s_npge1_ly_1564w  s_npge1_ly_1524w  s_npge1_ly_2534w  s_npge1_ly_3544w  s_npge1_ly_4554w  s_npge1_ly_5564w
s_npge2_ly_1564m  s_npge2_ly_1524m  s_npge2_ly_2534m  s_npge2_ly_3544m  s_npge2_ly_4554m  s_npge2_ly_5564m  s_npge2_ly_1564w  s_npge2_ly_1524w  s_npge2_ly_2534w  s_npge2_ly_3544w  s_npge2_ly_4554w  s_npge2_ly_5564w
s_npge10_ly_1564m  s_npge10_ly_1524m  s_npge10_ly_2534m  s_npge10_ly_3544m  s_npge10_ly_4554m  s_npge10_ly_5564m  s_npge10_ly_1564w  s_npge10_ly_1524w  s_npge10_ly_2534w  s_npge10_ly_3544w  s_npge10_ly_4554w  s_npge10_ly_5564w
s_npge50_ly_1564m  s_npge50_ly_1524m  s_npge50_ly_2534m  s_npge50_ly_3544m  s_npge50_ly_4554m  s_npge50_ly_5564m  s_npge50_ly_1564w  s_npge50_ly_1524w  s_npge50_ly_2534w  s_npge50_ly_3544w  s_npge50_ly_4554w  s_npge50_ly_5564w
s_npge1_ly_1564_hivpos  s_npge2_ly_1564_hivpos  s_npge1_ly_1564_hivdiag  s_npge2_ly_1564_hivdiag  s_npge1_ly_1564_hivneg  s_npge2_ly_1564_hivneg



/*parameters sampled*/
s_sex_beh_trans_matrix_m  s_sex_beh_trans_matrix_w  s_p_rred_p  s_p_hsb_p  s_newp_factor  s_eprate
s_conc_ep  s_ch_risk_diag  s_ch_risk_diag_newp  s_ych_risk_beh_newp  s_ych2_risk_beh_newp  s_ych_risk_beh_ep
s_exp_setting_lower_p_vl1000  s_external_exp_factor  s_rate_exp_set_lower_p_vl1000
s_prob_pregnancy_base
s_fold_change_w  s_fold_change_yw  s_fold_change_sti  s_super_infection
s_an_lin_incr_test  s_date_test_rate_plateau  s_rate_testanc_inc  s_incr_test_rate_sympt  s_max_freq_testing  s_test_targeting  s_fx
s_adh_pattern  s_prob_loss_at_diag  s_pr_art_init  s_rate_lost  s_prob_lost_art  s_rate_return  s_rate_restart  s_rate_int_choice  s_clinic_not_aw_int_frac
s_res_trans_factor_nn  s_rate_loss_persistence  s_incr_rate_int_low_adh  s_poorer_cd4rise_fail_nn  s_poorer_cd4rise_fail_ii
s_rate_res_ten  s_fold_change_mut_risk  s_adh_effect_of_meas_alert  s_pr_switch_line  s_prob_vl_meas_done  s_red_adh_tb_adc  s_red_adh_tox_pop
s_add_eff_adh_nnrti  s_altered_adh_sec_line_pop  s_prob_return_adc  s_prob_lossdiag_adctb  s_prob_lossdiag_who3e  s_higher_newp_less_engagement
s_fold_tr  s_switch_for_tox
s_adh_pattern_prep  s_rate_test_startprep  s_rate_test_restartprep  s_rate_choose_stop_prep
s_circ_inc_rate
s_p_hard_reach_w  s_hard_reach_higher_in_men  s_p_hard_reach_m  
s_inc_cat   s_sex_age_mixing_matrix_m  s_sex_age_mixing_matrix_w    s_cd4_monitoring  s_base_rate_stop_sexwork  s_rred_a_p

/* keep_going - only needed to be saved for test runs */

s_keep_going_1999 s_keep_going_2004 s_keep_going_2016 s_keep_going_2020

;


proc univariate data=r&da1  noprint ; var  dead_daly  dead_ddaly
birth_circ

art_attrit_1yr  art_attrit_1yr_on  art_attrit_2yr  art_attrit_2yr_on  art_attrit_3yr  art_attrit_3yr_on  art_attrit_4yr  art_attrit_4yr_on  
art_attrit_5yr  art_attrit_5yr_on  art_attrit_6yr  art_attrit_6yr_on  art_attrit_7yr  art_attrit_7yr_on  art_attrit_8yr  art_attrit_8yr_on naive_m 
naive_w dead_ddaly_ntd cost_child_hiv cost_child_hiv_mo_art ddaly_mtct

ageg6569m		ageg7074m		ageg7579m		ageg8084m		
ageg6569w		ageg7074w		ageg7579w		ageg8084w		
hiv6569m		hiv7074m		hiv7579m		hiv8084m	
hiv6569w		hiv7074w		hiv7579w		hiv8084w	

alive_w   alive_m
;

output out=x2	sum=s_dead_daly  s_dead_ddaly
s_birth_circ

s_art_attrit_1yr  s_art_attrit_1yr_on  s_art_attrit_2yr  s_art_attrit_2yr_on  s_art_attrit_3yr  s_art_attrit_3yr_on  s_art_attrit_4yr  s_art_attrit_4yr_on  
s_art_attrit_5yr  s_art_attrit_5yr_on  s_art_attrit_6yr  s_art_attrit_6yr_on  s_art_attrit_7yr  s_art_attrit_7yr_on  s_art_attrit_8yr  s_art_attrit_8yr_on  
s_naive_m s_naive_w s_dead_ddaly_ntd s_cost_child_hiv s_cost_child_hiv_mo_art s_ddaly_mtct

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m		
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w	

s_alive_w s_alive_m	
;  
run;


data f; merge x1 x2;
*Now one row. To record value of sampled parameters, use the following code
 (it will be the same value for everyone so just need one record);

if s_n gt 0 then do;

	/*general*/
	cald  							= s_caldate / s_n;
	run_ 							= s_run / s_n;
	rbm_ 							= s_rbm / s_n;
	option_							= s_option / s_n;
	art_monitoring_strategy_ = s_art_monitoring_strategy / s_n;

	/*parameters sampled*/
 	sex_beh_trans_matrix_m_ 		= s_sex_beh_trans_matrix_m / s_n;
	sex_beh_trans_matrix_w_ 		= s_sex_beh_trans_matrix_w / s_n;
	sex_age_mixing_matrix_m_		= s_sex_age_mixing_matrix_m / s_n;
	sex_age_mixing_matrix_w_		= s_sex_age_mixing_matrix_w / s_n;
	p_rred_p_  						= s_p_rred_p / s_n; 
	p_hsb_p_ 					 	= s_p_hsb_p / s_n;
	base_rate_sw_					= s_base_rate_sw / s_n;
	newp_factor_ 					= s_newp_factor / s_n; 
	eprate_ 						= s_eprate / s_n;
	conc_ep_ 						= s_conc_ep / s_n;
	ch_risk_diag_   				= s_ch_risk_diag / s_n; 
 	ch_risk_diag_newp_   			= s_ch_risk_diag_newp / s_n; 
	ych_risk_beh_newp_   			= s_ych_risk_beh_newp / s_n; 
 	ych2_risk_beh_newp_   			= s_ych2_risk_beh_newp / s_n; 
 	ych_risk_beh_ep_   				= s_ych_risk_beh_ep / s_n; 
	exp_setting_lower_p_vl1000_ = s_exp_setting_lower_p_vl1000 / s_n;
	external_exp_factor_ 			= s_external_exp_factor / s_n;
	rate_exp_set_lower_p_vl1000_ 	= s_rate_exp_set_lower_p_vl1000 / s_n;
	prob_pregnancy_base_ 			= s_prob_pregnancy_base / s_n;
	fold_change_w_ 					= s_fold_change_w / s_n;
	fold_change_yw_ 				= s_fold_change_yw / s_n;
	fold_change_sti_				= s_fold_change_sti / s_n;
	super_infection_				= s_super_infection / s_n;
	an_lin_incr_test_ 				= s_an_lin_incr_test / s_n; 
	date_test_rate_plateau_ 		= s_date_test_rate_plateau / s_n;
 	rate_testanc_inc_ 				= s_rate_testanc_inc / s_n; 
	incr_test_rate_sympt_ 			=  s_incr_test_rate_sympt / s_n;
	max_freq_testing_				= s_max_freq_testing / s_n;
 	test_targeting_ 				= s_test_targeting / s_n;
	fx_  							= s_fx / s_n;
	adh_pattern_ 					= s_adh_pattern / s_n;
	prob_loss_at_diag_ 				= s_prob_loss_at_diag / s_n; 
 	pr_art_init_  					= s_pr_art_init / s_n; 
 	rate_lost_  					= s_rate_lost / s_n; 
 	prob_lost_art_  				= s_prob_lost_art / s_n; 
 	rate_return_   					= s_rate_return / s_n; 
 	rate_restart_  					= s_rate_restart / s_n; 
  	rate_int_choice_ 				= s_rate_int_choice / s_n;
	clinic_not_aw_int_frac_ 		= s_clinic_not_aw_int_frac / s_n;
	res_trans_factor_nn_ 			= s_res_trans_factor_nn / s_n;
	rate_loss_persistence_ 			= s_rate_loss_persistence / s_n;
	incr_rate_int_low_adh_ 			= s_incr_rate_int_low_adh / s_n;
	poorer_cd4rise_fail_nn_ 		= s_poorer_cd4rise_fail_nn / s_n;
	poorer_cd4rise_fail_ii_ 		= s_poorer_cd4rise_fail_ii / s_n;
	rate_res_ten_ 					= s_rate_res_ten / s_n; 
	fold_change_mut_risk_ 			= s_fold_change_mut_risk / s_n;
	adh_effect_of_meas_alert_ 		= s_adh_effect_of_meas_alert / s_n;
	pr_switch_line_ 				= s_pr_switch_line / s_n;
	initial_pr_switch_line_			= s_initial_pr_switch_line / s_n;
	prob_vl_meas_done_ 				= s_prob_vl_meas_done / s_n;
	initial_prob_vl_meas_done_		= s_initial_prob_vl_meas_done / s_n;
	red_adh_tb_adc_					= s_red_adh_tb_adc / s_n;
	red_adh_tox_pop_				= s_red_adh_tox_pop / s_n;
	add_eff_adh_nnrti_				= s_add_eff_adh_nnrti / s_n;
	altered_adh_sec_line_pop_ 		= s_altered_adh_sec_line_pop / s_n;
	prob_return_adc_ 				= s_prob_return_adc / s_n;
	prob_lossdiag_adctb_			= s_prob_lossdiag_adctb / s_n;
	prob_lossdiag_who3e_			= s_prob_lossdiag_who3e / s_n;
	higher_newp_less_engagement_ 	= s_higher_newp_less_engagement / s_n;
	fold_tr_						= s_fold_tr / s_n;
	switch_for_tox_					= s_switch_for_tox / s_n;
	adh_pattern_prep_ 				= s_adh_pattern_prep / s_n;
	rate_test_startprep_			= s_rate_test_startprep / s_n;
	rate_test_restartprep_ 			= s_rate_test_restartprep / s_n;
	rate_choose_stop_prep_ 			= s_rate_choose_stop_prep / s_n;
	prob_prep_restart_choice_ 		= s_prob_prep_restart_choice / s_n;
	prepuptake_sw_ 					= s_prepuptake_sw / s_n;
	prepuptake_pop_ 				= s_prepuptake_pop / s_n;
	circ_inc_rate_					= s_circ_inc_rate / s_n;
	p_hard_reach_w_					= s_p_hard_reach_w / s_n;
	p_hard_reach_m_					= s_p_hard_reach_m / s_n;
	hard_reach_higher_in_men_ 		= s_hard_reach_higher_in_men / s_n; 
	rr_int_tox_ 					= s_rr_int_tox / s_n;
	rate_birth_with_infected_child_ = s_rate_birth_with_infected_child / s_n;
	nnrti_res_no_effect_ 			= s_nnrti_res_no_effect / s_n;
	double_rate_gas_tox_taz_		= s_double_rate_gas_tox_taz / s_n;
	incr_mort_risk_dol_weightg_		= s_incr_mort_risk_dol_weightg / s_n;
	inc_cat_						= s_inc_cat / s_n;
	reg_option_switch_2020_			= s_reg_option_switch_2020 / s_n;
	reg_option_ 					= s_reg_option / s_n;
	cd4_monitoring_					= s_cd4_monitoring / s_n;
	base_rate_stop_sexwork_			= s_base_rate_stop_sexwork / s_n;
	rred_a_p_						= s_rred_a_p / s_n;

	eff_max_freq_testing_ 			= s_eff_max_freq_testing  / s_n;
	eff_rate_restart_ 				= s_eff_rate_restart  / s_n;
	eff_prob_loss_at_diag_ 			= s_eff_prob_loss_at_diag  / s_n;
	eff_rate_lost_ 					= s_eff_rate_lost  / s_n;
	eff_prob_lost_art_ 				= s_eff_prob_lost_art  / s_n;
	eff_rate_return_ 				= s_eff_rate_return  / s_n;
	eff_pr_art_init_ 				= s_eff_pr_art_init  / s_n;
	eff_rate_int_choice_ 			= s_eff_rate_int_choice  / s_n;
	eff_prob_vl_meas_done_ 			= s_eff_prob_vl_meas_done  / s_n;
	eff_pr_switch_line_ 			= s_eff_pr_switch_line  / s_n;
	eff_rate_test_startprep_ 		= s_eff_rate_test_startprep  / s_n;
	eff_rate_test_restartprep_ 		= s_eff_rate_test_restartprep / s_n; 
	eff_rate_choose_stop_prep_ 		= s_eff_rate_choose_stop_prep / s_n; 
	eff_prob_prep_restart_choice_ 	= s_eff_prob_prep_restart_choice  / s_n;
	eff_prepuptake_sw_  			= s_eff_prepuptake_sw / s_n;
	eff_prepuptake_pop_  			= s_eff_prepuptake_pop / s_n;
	e_decr_hard_reach_2020_			= s_e_decr_hard_reach_2020 / s_n;
	eff_test_targeting_				= s_eff_test_targeting / s_n;

	keep_going_1999_				= s_keep_going_1999 / s_n;			
	keep_going_2004_				= s_keep_going_2004 / s_n;			
	keep_going_2016_				= s_keep_going_2016 / s_n;			
	keep_going_2020_				= s_keep_going_2020 / s_n;			

rate_1sttest_ = s_rate_1sttest / s_n;
rate_reptest_ = s_rate_reptest / s_n;
cascade_care_improvements_ = s_cascade_care_improvements / s_n;
incr_test_2020_ = s_incr_test_2020 / s_n;
decr_hard_reach_2020_ = s_decr_hard_reach_2020 / s_n;
decr_prob_loss_at_diag_2020_ = s_decr_prob_loss_at_diag_2020 / s_n;
decr_rate_lost_2020_ = s_decr_rate_lost_2020 / s_n;
decr_rate_lost_art_2020_ = s_decr_rate_lost_art_2020 / s_n;
incr_rate_return_2020_ = s_incr_rate_return_2020 / s_n;
incr_rate_restart_2020_ = s_incr_rate_restart_2020 / s_n;
incr_rate_init_2020_ = s_incr_rate_init_2020 / s_n;
decr_rate_int_choice_2020_ = s_decr_rate_int_choice_2020 / s_n;
incr_prob_vl_meas_done_2020_ = s_incr_prob_vl_meas_done_2020 / s_n;
incr_pr_switch_line_2020_ = s_incr_pr_switch_line_2020 / s_n;
prep_improvements_ = s_prep_improvements / s_n;
incr_adh_pattern_prep_2020_ = s_incr_adh_pattern_prep_2020 / s_n;
inc_r_test_startprep_2020_ = s_inc_r_test_startprep_2020 / s_n;
incr_r_test_restartprep_2020_ = s_incr_r_test_restartprep_2020 / s_n;
decr_r_choose_stop_prep_2020_ = s_decr_r_choose_stop_prep_2020 / s_n;
inc_p_prep_restart_choi_2020_ = s_inc_p_prep_restart_choi_2020 / s_n;
incr_prepuptake_sw_2020_  		= s_incr_prepuptake_sw_2020 / s_n;
incr_prepuptake_pop_2020_ = s_incr_prepuptake_pop_2020 / s_n;
expand_prep_to_all_2020_ = s_expand_prep_to_all_2020 / s_n;
circ_improvements_ = s_circ_improvements / s_n;
circ_inc_rate_2020_ = s_circ_inc_rate_2020 / s_n;
condom_incr_2020_ = s_condom_incr_2020 / s_n;
incr_adh_2020_ = s_incr_adh_2020 / s_n;
incr_test_targeting_2020_ = s_incr_test_targeting_2020 / s_n;
option_0_prep_continue_2020_ = s_option_0_prep_continue_2020 / s_n;
incr_max_freq_testing_2020_ = s_incr_max_freq_testing_2020 / s_n;
sw_test_6mthly_2020_  = s_sw_test_6mthly_2020 / s_n;
art_mon_drug_levels_2020_ = s_art_mon_drug_levels_2020 / s_n;
ten_is_taf_2020_		=   s_ten_is_taf_2020 / s_n;
pop_wide_tld_2020_			=	s_pop_wide_tld_2020 / s_n;

end;


***Variables created below are used to update the program ;

*Code below used to determine if ep infected in main program;
if s_ageg1m gt 0 then prevalence1524m = (s_hiv1519m + s_hiv2024m) /s_ageg1m;
if s_ageg2m gt 0 then prevalence2534m = (s_hiv2529m + s_hiv3034m) /s_ageg2m; 
if s_ageg3m gt 0 then prevalence3544m = (s_hiv3539m + s_hiv4044m) /s_ageg3m;
if s_ageg4m gt 0 then prevalence4554m = (s_hiv4549m + s_hiv5054m) /s_ageg4m;
if s_ageg5m gt 0 then prevalence5564m = (s_hiv5559m + s_hiv6064m) /s_ageg5m;

if s_ageg1w gt 0 then prevalence1524w = (s_hiv1519w + s_hiv2024w) /s_ageg1w;
if s_ageg2w gt 0 then prevalence2534w = (s_hiv2529w + s_hiv3034w) /s_ageg2w; 
if s_ageg3w gt 0 then prevalence3544w = (s_hiv3539w + s_hiv4044w) /s_ageg3w;
if s_ageg4w gt 0 then prevalence4554w = (s_hiv4549w + s_hiv5054w) /s_ageg4w;
if s_ageg5w gt 0 then prevalence5564w = (s_hiv5559w + s_hiv6064w) /s_ageg5w;

*Incidence among individuals with an ep and at least one newp;
if  s_m_1524_epnewp   > 0 then incidence1524m_epnewp = s_primary1524m_epnewp/s_m_1524_epnewp  ;
if  s_m_2534_epnewp   > 0 then incidence2534m_epnewp = s_primary2534m_epnewp/s_m_2534_epnewp  ;
if  s_m_3544_epnewp   > 0 then incidence3544m_epnewp = s_primary3544m_epnewp/s_m_3544_epnewp  ;
if  s_m_4554_epnewp   > 0 then incidence4554m_epnewp = s_primary4554m_epnewp/s_m_4554_epnewp  ;
if  s_m_5564_epnewp   > 0 then incidence5564m_epnewp = s_primary5564m_epnewp/s_m_5564_epnewp  ;

if  s_w_1524_epnewp   > 0 then incidence1524w_epnewp = s_primary1524w_epnewp/s_w_1524_epnewp  ;
if  s_w_2534_epnewp   > 0 then incidence2534w_epnewp = s_primary2534w_epnewp/s_w_2534_epnewp  ;
if  s_w_3544_epnewp   > 0 then incidence3544w_epnewp = s_primary3544w_epnewp/s_w_3544_epnewp  ;
if  s_w_4554_epnewp   > 0 then incidence4554w_epnewp = s_primary4554w_epnewp/s_w_4554_epnewp  ;
if  s_w_5564_epnewp   > 0 then incidence5564w_epnewp = s_primary5564w_epnewp/s_w_5564_epnewp  ;

*Proportion of subjects with a long-term partner and no new partners;
if s_w_1524_ep gt 0 then prop_mono_w_1524 = (s_w_1524_ep - s_w_1524_epnewp)/s_w_1524_ep;
if s_w_2534_ep gt 0 then prop_mono_w_2534 = (s_w_2534_ep - s_w_2534_epnewp)/s_w_2534_ep;
if s_w_3544_ep gt 0 then prop_mono_w_3544 = (s_w_3544_ep - s_w_3544_epnewp)/s_w_3544_ep;
if s_w_4554_ep gt 0 then prop_mono_w_4554 = (s_w_4554_ep - s_w_4554_epnewp)/s_w_4554_ep;
if s_w_5564_ep gt 0 then prop_mono_w_5564 = (s_w_5564_ep - s_w_5564_epnewp)/s_w_5564_ep;

if s_m_1524_ep gt 0 then prop_mono_m_1524 = (s_m_1524_ep - s_m_1524_epnewp)/s_m_1524_ep;
if s_m_2534_ep gt 0 then prop_mono_m_2534 = (s_m_2534_ep - s_m_2534_epnewp)/s_m_2534_ep;
if s_m_3544_ep gt 0 then prop_mono_m_3544 = (s_m_3544_ep - s_m_3544_epnewp)/s_m_3544_ep;
if s_m_4554_ep gt 0 then prop_mono_m_4554 = (s_m_4554_ep - s_m_4554_epnewp)/s_m_4554_ep;
if s_m_5564_ep gt 0 then prop_mono_m_5564 = (s_m_5564_ep - s_m_5564_epnewp)/s_m_5564_ep;

if  s_w_1524_newp   > 0 then do; s_prop_newp_i_w_1524 = max(0,s_i_w_1524_newp   / s_w_1524_newp)  ; end;
if  s_w_2534_newp   > 0 then do; s_prop_newp_i_w_2534 = max(0,s_i_w_2534_newp   / s_w_2534_newp)   ;end;
if  s_w_3544_newp   > 0 then do; s_prop_newp_i_w_3544 = max(0,s_i_w_3544_newp   / s_w_3544_newp)   ;end;
if  s_w_4554_newp   > 0 then do; s_prop_newp_i_w_4554 = max(0,s_i_w_4554_newp   / s_w_4554_newp)   ;end;
if  s_w_5564_newp   > 0 then do; s_prop_newp_i_w_5564 = max(0,s_i_w_5564_newp   / s_w_5564_newp)   ;end;

if  s_m_1524_newp   > 0 then do; s_prop_newp_i_m_1524 = max(0,s_i_m_1524_newp   / s_m_1524_newp)  ;end;
if  s_m_2534_newp   > 0 then do; s_prop_newp_i_m_2534 = max(0,s_i_m_2534_newp   / s_m_2534_newp)   ;end;
if  s_m_3544_newp   > 0 then do; s_prop_newp_i_m_3544 = max(0,s_i_m_3544_newp   / s_m_3544_newp)   ;end;
if  s_m_4554_newp   > 0 then do; s_prop_newp_i_m_4554 = max(0,s_i_m_4554_newp   / s_m_4554_newp)   ;end;
if  s_m_5564_newp   > 0 then do; s_prop_newp_i_m_5564 = max(0,s_i_m_5564_newp   / s_m_5564_newp)   ;end;


* Used for balance;
s_m_newp = s_m_1524_newp+s_m_2534_newp+s_m_3544_newp+s_m_4554_newp+s_m_5564_newp;
s_w_newp = s_w_1524_newp+s_w_2534_newp+s_w_3544_newp+s_w_4554_newp+s_w_5564_newp;

d_s_newp = s_m_newp - s_w_newp;


* Used to determine probability of infection from ep in main program;
* Men;
s_prop_ageg1_m_vlg1=0; s_prop_ageg1_m_vlg2=0; s_prop_ageg1_m_vlg3=0;  s_prop_ageg1_m_vlg4=0;  s_prop_ageg1_m_vlg5=0;  s_prop_ageg1_m_vlg6=0; 
s_prop_ageg2_m_vlg1=0; s_prop_ageg2_m_vlg2=0; s_prop_ageg2_m_vlg3=0;  s_prop_ageg2_m_vlg4=0;  s_prop_ageg2_m_vlg5=0;  s_prop_ageg2_m_vlg6=0; 
s_prop_ageg3_m_vlg1=0; s_prop_ageg3_m_vlg2=0; s_prop_ageg3_m_vlg3=0;  s_prop_ageg3_m_vlg4=0;  s_prop_ageg3_m_vlg5=0;  s_prop_ageg3_m_vlg6=0; 
s_prop_ageg4_m_vlg1=0; s_prop_ageg4_m_vlg2=0; s_prop_ageg4_m_vlg3=0;  s_prop_ageg4_m_vlg4=0;  s_prop_ageg4_m_vlg5=0;  s_prop_ageg4_m_vlg6=0; 
s_prop_ageg5_m_vlg1=0; s_prop_ageg5_m_vlg2=0; s_prop_ageg5_m_vlg3=0;  s_prop_ageg5_m_vlg4=0;  s_prop_ageg5_m_vlg5=0;  s_prop_ageg5_m_vlg6=0; 

s_prop_ageg1_w_vlg1=0; s_prop_ageg1_w_vlg2=0; s_prop_ageg1_w_vlg3=0;  s_prop_ageg1_w_vlg4=0;  s_prop_ageg1_w_vlg5=0;  s_prop_ageg1_w_vlg6=0; 
s_prop_ageg2_w_vlg1=0; s_prop_ageg2_w_vlg2=0; s_prop_ageg2_w_vlg3=0;  s_prop_ageg2_w_vlg4=0;  s_prop_ageg2_w_vlg5=0;  s_prop_ageg2_w_vlg6=0; 
s_prop_ageg3_w_vlg1=0; s_prop_ageg3_w_vlg2=0; s_prop_ageg3_w_vlg3=0;  s_prop_ageg3_w_vlg4=0;  s_prop_ageg3_w_vlg5=0;  s_prop_ageg3_w_vlg6=0; 
s_prop_ageg4_w_vlg1=0; s_prop_ageg4_w_vlg2=0; s_prop_ageg4_w_vlg3=0;  s_prop_ageg4_w_vlg4=0;  s_prop_ageg4_w_vlg5=0;  s_prop_ageg4_w_vlg6=0; 
s_prop_ageg5_w_vlg1=0; s_prop_ageg5_w_vlg2=0; s_prop_ageg5_w_vlg3=0;  s_prop_ageg5_w_vlg4=0;  s_prop_ageg5_w_vlg5=0;  s_prop_ageg5_w_vlg6=0; 

if s_i_age1_m_newp > 0  then do;
s_prop_ageg1_m_vlg1 = max(0,s_i_v1_age1_m_newp / s_i_age1_m_newp) ; s_prop_ageg1_m_vlg2 = max(0,s_i_v2_age1_m_newp / s_i_age1_m_newp) ;
s_prop_ageg1_m_vlg3 = max(0,s_i_v3_age1_m_newp / s_i_age1_m_newp) ; s_prop_ageg1_m_vlg4 = max(0,s_i_v4_age1_m_newp / s_i_age1_m_newp) ;
s_prop_ageg1_m_vlg5 = max(0,s_i_v5_age1_m_newp / s_i_age1_m_newp) ; s_prop_ageg1_m_vlg6 = max(0,s_i_v6_age1_m_newp / s_i_age1_m_newp) ;
end;

if s_i_age2_m_newp > 0  then do;
s_prop_ageg2_m_vlg1 = max(0,s_i_v1_age2_m_newp / s_i_age2_m_newp) ; s_prop_ageg2_m_vlg2 = max(0,s_i_v2_age2_m_newp / s_i_age2_m_newp) ;
s_prop_ageg2_m_vlg3 = max(0,s_i_v3_age2_m_newp / s_i_age2_m_newp) ; s_prop_ageg2_m_vlg4 = max(0,s_i_v4_age2_m_newp / s_i_age2_m_newp) ;
s_prop_ageg2_m_vlg5 = max(0,s_i_v5_age2_m_newp / s_i_age2_m_newp) ; s_prop_ageg2_m_vlg6 = max(0,s_i_v6_age2_m_newp / s_i_age2_m_newp) ;
end;

if s_i_age3_m_newp > 0  then do;
s_prop_ageg3_m_vlg1 = max(0,s_i_v1_age3_m_newp / s_i_age3_m_newp) ; s_prop_ageg3_m_vlg2 = max(0,s_i_v2_age3_m_newp / s_i_age3_m_newp) ;
s_prop_ageg3_m_vlg3 = max(0,s_i_v3_age3_m_newp / s_i_age3_m_newp) ; s_prop_ageg3_m_vlg4 = max(0,s_i_v4_age3_m_newp / s_i_age3_m_newp) ;
s_prop_ageg3_m_vlg5 = max(0,s_i_v5_age3_m_newp / s_i_age3_m_newp) ; s_prop_ageg3_m_vlg6 = max(0,s_i_v6_age3_m_newp / s_i_age3_m_newp) ;
end;

if s_i_age4_m_newp > 0  then do;
s_prop_ageg4_m_vlg1 = max(0,s_i_v1_age4_m_newp / s_i_age4_m_newp) ; s_prop_ageg4_m_vlg2 = max(0,s_i_v2_age4_m_newp / s_i_age4_m_newp) ;
s_prop_ageg4_m_vlg3 = max(0,s_i_v3_age4_m_newp / s_i_age4_m_newp) ; s_prop_ageg4_m_vlg4 = max(0,s_i_v4_age4_m_newp / s_i_age4_m_newp) ;
s_prop_ageg4_m_vlg5 = max(0,s_i_v5_age4_m_newp / s_i_age4_m_newp) ; s_prop_ageg4_m_vlg6 = max(0,s_i_v6_age4_m_newp / s_i_age4_m_newp) ;
end;

if s_i_age5_m_newp > 0  then do;
s_prop_ageg5_m_vlg1 = max(0,s_i_v1_age5_m_newp / s_i_age5_m_newp) ; s_prop_ageg5_m_vlg2 = max(0,s_i_v2_age5_m_newp / s_i_age5_m_newp) ;
s_prop_ageg5_m_vlg3 = max(0,s_i_v3_age5_m_newp / s_i_age5_m_newp) ; s_prop_ageg5_m_vlg4 = max(0,s_i_v4_age5_m_newp / s_i_age5_m_newp) ;
s_prop_ageg5_m_vlg5 = max(0,s_i_v5_age5_m_newp / s_i_age5_m_newp) ; s_prop_ageg5_m_vlg6 = max(0,s_i_v6_age5_m_newp / s_i_age5_m_newp) ;
end;

* if no infected people in age and gender group chosen then use non age-specific distribution ;
s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_v1_m_newp = s_i_v1_age1_m_newp + s_i_v1_age2_m_newp + s_i_v1_age3_m_newp + s_i_v1_age4_m_newp + s_i_v1_age5_m_newp ;
s_i_v2_m_newp = s_i_v2_age1_m_newp + s_i_v2_age2_m_newp + s_i_v2_age3_m_newp + s_i_v2_age4_m_newp + s_i_v2_age5_m_newp ;
s_i_v3_m_newp = s_i_v3_age1_m_newp + s_i_v3_age2_m_newp + s_i_v3_age3_m_newp + s_i_v3_age4_m_newp + s_i_v3_age5_m_newp ;
s_i_v4_m_newp = s_i_v4_age1_m_newp + s_i_v4_age2_m_newp + s_i_v4_age3_m_newp + s_i_v4_age4_m_newp + s_i_v4_age5_m_newp ;
s_i_v5_m_newp = s_i_v5_age1_m_newp + s_i_v5_age2_m_newp + s_i_v5_age3_m_newp + s_i_v5_age4_m_newp + s_i_v5_age5_m_newp ;
s_i_v6_m_newp = s_i_v6_age1_m_newp + s_i_v6_age2_m_newp + s_i_v6_age3_m_newp + s_i_v6_age4_m_newp + s_i_v6_age5_m_newp ;

if s_i_m_newp > 0  then do;
s_prop_m_vlg1 = max(0,s_i_v1_m_newp / s_i_m_newp) ; s_prop_m_vlg2 = max(0,s_i_v2_m_newp / s_i_m_newp) ;
s_prop_m_vlg3 = max(0,s_i_v3_m_newp / s_i_m_newp) ; s_prop_m_vlg4 = max(0,s_i_v4_m_newp / s_i_m_newp) ;
s_prop_m_vlg5 = max(0,s_i_v5_m_newp / s_i_m_newp) ; s_prop_m_vlg6 = max(0,s_i_v6_m_newp / s_i_m_newp) ;
end;

* Women;
if s_i_age1_w_newp > 0  then do;
s_prop_ageg1_w_vlg1 = max(0,s_i_v1_age1_w_newp / s_i_age1_w_newp) ; s_prop_ageg1_w_vlg2 = max(0,s_i_v2_age1_w_newp / s_i_age1_w_newp) ;
s_prop_ageg1_w_vlg3 = max(0,s_i_v3_age1_w_newp / s_i_age1_w_newp) ; s_prop_ageg1_w_vlg4 = max(0,s_i_v4_age1_w_newp / s_i_age1_w_newp) ;
s_prop_ageg1_w_vlg5 = max(0,s_i_v5_age1_w_newp / s_i_age1_w_newp) ; s_prop_ageg1_w_vlg6 = max(0,s_i_v6_age1_w_newp / s_i_age1_w_newp) ;
end;

if s_i_age2_w_newp > 0  then do;
s_prop_ageg2_w_vlg1 = max(0,s_i_v1_age2_w_newp / s_i_age2_w_newp) ; s_prop_ageg2_w_vlg2 = max(0,s_i_v2_age2_w_newp / s_i_age2_w_newp) ;
s_prop_ageg2_w_vlg3 = max(0,s_i_v3_age2_w_newp / s_i_age2_w_newp) ; s_prop_ageg2_w_vlg4 = max(0,s_i_v4_age2_w_newp / s_i_age2_w_newp) ;
s_prop_ageg2_w_vlg5 = max(0,s_i_v5_age2_w_newp / s_i_age2_w_newp) ; s_prop_ageg2_w_vlg6 = max(0,s_i_v6_age2_w_newp / s_i_age2_w_newp) ;
end;

if s_i_age3_w_newp > 0  then do;
s_prop_ageg3_w_vlg1 = max(0,s_i_v1_age3_w_newp / s_i_age3_w_newp) ; s_prop_ageg3_w_vlg2 = max(0,s_i_v2_age3_w_newp / s_i_age3_w_newp) ;
s_prop_ageg3_w_vlg3 = max(0,s_i_v3_age3_w_newp / s_i_age3_w_newp) ; s_prop_ageg3_w_vlg4 = max(0,s_i_v4_age3_w_newp / s_i_age3_w_newp) ;
s_prop_ageg3_w_vlg5 = max(0,s_i_v5_age3_w_newp / s_i_age3_w_newp) ; s_prop_ageg3_w_vlg6 = max(0,s_i_v6_age3_w_newp / s_i_age3_w_newp) ;
end;

if s_i_age4_w_newp > 0  then do;
s_prop_ageg4_w_vlg1 = max(0,s_i_v1_age4_w_newp / s_i_age4_w_newp) ; s_prop_ageg4_w_vlg2 = max(0,s_i_v2_age4_w_newp / s_i_age4_w_newp) ;
s_prop_ageg4_w_vlg3 = max(0,s_i_v3_age4_w_newp / s_i_age4_w_newp) ; s_prop_ageg4_w_vlg4 = max(0,s_i_v4_age4_w_newp / s_i_age4_w_newp) ;
s_prop_ageg4_w_vlg5 = max(0,s_i_v5_age4_w_newp / s_i_age4_w_newp) ; s_prop_ageg4_w_vlg6 = max(0,s_i_v6_age4_w_newp / s_i_age4_w_newp) ;
end;

if s_i_age5_w_newp > 0  then do;
s_prop_ageg5_w_vlg1 = max(0,s_i_v1_age5_w_newp / s_i_age5_w_newp) ; s_prop_ageg5_w_vlg2 = max(0,s_i_v2_age5_w_newp / s_i_age5_w_newp) ;
s_prop_ageg5_w_vlg3 = max(0,s_i_v3_age5_w_newp / s_i_age5_w_newp) ; s_prop_ageg5_w_vlg4 = max(0,s_i_v4_age5_w_newp / s_i_age5_w_newp) ;
s_prop_ageg5_w_vlg5 = max(0,s_i_v5_age5_w_newp / s_i_age5_w_newp) ; s_prop_ageg5_w_vlg6 = max(0,s_i_v6_age5_w_newp / s_i_age5_w_newp) ;
end;


s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;
s_i_v1_w_newp = s_i_v1_age1_w_newp + s_i_v1_age2_w_newp + s_i_v1_age3_w_newp + s_i_v1_age4_w_newp + s_i_v1_age5_w_newp ;
s_i_v2_w_newp = s_i_v2_age1_w_newp + s_i_v2_age2_w_newp + s_i_v2_age3_w_newp + s_i_v2_age4_w_newp + s_i_v2_age5_w_newp ;
s_i_v3_w_newp = s_i_v3_age1_w_newp + s_i_v3_age2_w_newp + s_i_v3_age3_w_newp + s_i_v3_age4_w_newp + s_i_v3_age5_w_newp ;
s_i_v4_w_newp = s_i_v4_age1_w_newp + s_i_v4_age2_w_newp + s_i_v4_age3_w_newp + s_i_v4_age4_w_newp + s_i_v4_age5_w_newp ;
s_i_v5_w_newp = s_i_v5_age1_w_newp + s_i_v5_age2_w_newp + s_i_v5_age3_w_newp + s_i_v5_age4_w_newp + s_i_v5_age5_w_newp ;
s_i_v6_w_newp = s_i_v6_age1_w_newp + s_i_v6_age2_w_newp + s_i_v6_age3_w_newp + s_i_v6_age4_w_newp + s_i_v6_age5_w_newp ;

if s_i_w_newp > 0  then do;
s_prop_w_vlg1 = max(0,s_i_v1_w_newp / s_i_w_newp) ; s_prop_w_vlg2 = max(0,s_i_v2_w_newp / s_i_w_newp) ;
s_prop_w_vlg3 = max(0,s_i_v3_w_newp / s_i_w_newp) ; s_prop_w_vlg4 = max(0,s_i_v4_w_newp / s_i_w_newp) ;
s_prop_w_vlg5 = max(0,s_i_v5_w_newp / s_i_w_newp) ; s_prop_w_vlg6 = max(0,s_i_v6_w_newp / s_i_w_newp) ;
end;


* if infected by existing partner maybe this should be for np rather than newp;
/*** LBM Aug19; Do lines commented with '*' need to be set to missing if they are set to 0 at start of each line below?;*/
*s_prop_vlg1_rm=.;s_prop_vlg2_rm=.;s_prop_vlg3_rm=.;s_prop_vlg4_rm=.;s_prop_vlg5_rm=.;s_prop_vlg6_rm=.;
*s_prop_vlg1_rm0_diag=.;s_prop_vlg2_rm0_diag=.;s_prop_vlg3_rm0_diag=.;s_prop_vlg4_rm0_diag=.;s_prop_vlg5_rm0_diag=.;s_prop_vlg6_rm0_diag=.;
*s_prop_vlg1_rm1_diag=.;s_prop_vlg2_rm1_diag=.;s_prop_vlg3_rm1_diag=.;s_prop_vlg4_rm1_diag=.;s_prop_vlg5_rm1_diag=.;s_prop_vlg6_rm1_diag=.;
*s_prop_vlg1_rm0_naive=.;s_prop_vlg2_rm0_naive=.;s_prop_vlg3_rm0_naive=.;s_prop_vlg4_rm0_naive=.;s_prop_vlg5_rm0_naive=.;s_prop_vlg6_rm0_naive=.;
*s_prop_vlg1_rm1_naive=.;s_prop_vlg2_rm1_naive=.;s_prop_vlg3_rm1_naive=.;s_prop_vlg4_rm1_naive=.;s_prop_vlg5_rm1_naive=.;s_prop_vlg6_rm1_naive=.;
s_prop_tam1 = .;s_prop_tam2 = .;s_prop_tam3 = .;s_prop_k103m =.;s_prop_y181m =.;s_prop_g190m =.;
s_prop_m184m =.;s_prop_q151m =.;s_prop_k65m =.;
s_prop_p32m =.;s_prop_p33m =.; s_prop_p46m =.;s_prop_p47m =.; ;s_prop_p50vm =.;
s_prop_p50lm =.; s_prop_p54m =.;s_prop_p76m =.; s_prop_p82m =.;s_prop_p84m =.;s_prop_p88m =.; s_prop_p90m =.;s_prop_pim =.;s_prop_inpm =.;s_prop_insm =.;


s_prop_vlg1_rm=0; if s_i_v1_np >0 then do; s_prop_vlg1_rm = max(0,s_i_r_vlg1_np) / s_i_v1_np ; end;
s_prop_vlg2_rm=0; if s_i_v2_np >0 then do; s_prop_vlg2_rm = max(0,s_i_r_vlg2_np) / s_i_v2_np ; end;
s_prop_vlg3_rm=0; if s_i_v3_np >0 then do; s_prop_vlg3_rm = max(0,s_i_r_vlg3_np) / s_i_v3_np ; end;
s_prop_vlg4_rm=0; if s_i_v4_np >0 then do; s_prop_vlg4_rm = max(0,s_i_r_vlg4_np) / s_i_v4_np ; end;
s_prop_vlg5_rm=0; if s_i_v5_np >0 then do; s_prop_vlg5_rm = max(0,s_i_r_vlg5_np) / s_i_v5_np ; end;
s_prop_vlg6_rm=0; if s_i_v6_np >0 then do; s_prop_vlg6_rm = max(0,s_i_r_vlg6_np) / s_i_v6_np ; end;

s_i_r0_vlg1_np = s_i_v1_np - s_i_r_vlg1_np;
s_i_r0_vlg2_np = s_i_v2_np - s_i_r_vlg2_np;
s_i_r0_vlg3_np = s_i_v3_np - s_i_r_vlg3_np;
s_i_r0_vlg4_np = s_i_v4_np - s_i_r_vlg4_np;
s_i_r0_vlg5_np = s_i_v5_np - s_i_r_vlg5_np;
s_i_r0_vlg6_np = s_i_v6_np - s_i_r_vlg6_np;

s_prop_vlg1_rm1_diag=0; if s_i_r_vlg1_np >0 then do; s_prop_vlg1_rm1_diag = max(0,s_i_diag_vlg1_rm1_np) / s_i_r_vlg1_np ; end;
s_prop_vlg2_rm1_diag=0; if s_i_r_vlg2_np >0 then do; s_prop_vlg2_rm1_diag = max(0,s_i_diag_vlg2_rm1_np) / s_i_r_vlg2_np ; end;
s_prop_vlg3_rm1_diag=0; if s_i_r_vlg3_np >0 then do; s_prop_vlg3_rm1_diag = max(0,s_i_diag_vlg3_rm1_np) / s_i_r_vlg3_np ; end;
s_prop_vlg4_rm1_diag=0; if s_i_r_vlg4_np >0 then do; s_prop_vlg4_rm1_diag = max(0,s_i_diag_vlg4_rm1_np) / s_i_r_vlg4_np ; end;
s_prop_vlg5_rm1_diag=0; if s_i_r_vlg5_np >0 then do; s_prop_vlg5_rm1_diag = max(0,s_i_diag_vlg5_rm1_np) / s_i_r_vlg5_np ; end;
s_prop_vlg6_rm1_diag=0; if s_i_r_vlg6_np >0 then do; s_prop_vlg6_rm1_diag = max(0,s_i_diag_vlg6_rm1_np) / s_i_r_vlg6_np ; end;

s_prop_vlg1_rm0_diag=0; if s_i_r0_vlg1_np >0 then do; s_prop_vlg1_rm0_diag = max(0,s_i_diag_vlg1_rm0_np) / s_i_r0_vlg1_np ; end;
s_prop_vlg2_rm0_diag=0; if s_i_r0_vlg2_np >0 then do; s_prop_vlg2_rm0_diag = max(0,s_i_diag_vlg2_rm0_np) / s_i_r0_vlg2_np ; end;
s_prop_vlg3_rm0_diag=0; if s_i_r0_vlg3_np >0 then do; s_prop_vlg3_rm0_diag = max(0,s_i_diag_vlg3_rm0_np) / s_i_r0_vlg3_np ; end;
s_prop_vlg4_rm0_diag=0; if s_i_r0_vlg4_np >0 then do; s_prop_vlg4_rm0_diag = max(0,s_i_diag_vlg4_rm0_np) / s_i_r0_vlg4_np ; end;
s_prop_vlg5_rm0_diag=0; if s_i_r0_vlg5_np >0 then do; s_prop_vlg5_rm0_diag = max(0,s_i_diag_vlg5_rm0_np) / s_i_r0_vlg5_np ; end;
s_prop_vlg6_rm0_diag=0; if s_i_r0_vlg6_np >0 then do; s_prop_vlg6_rm0_diag = max(0,s_i_diag_vlg6_rm0_np) / s_i_r0_vlg6_np ; end;

s_prop_vlg1_rm1_naive=0; if s_i_diag_vlg1_rm1_np >0 then do; s_prop_vlg1_rm1_naive = max(0,s_i_naive_vlg1_rm1_np) / s_i_diag_vlg1_rm1_np ; end;
s_prop_vlg2_rm1_naive=0; if s_i_diag_vlg2_rm1_np >0 then do; s_prop_vlg2_rm1_naive = max(0,s_i_naive_vlg2_rm1_np) / s_i_diag_vlg2_rm1_np ; end;
s_prop_vlg3_rm1_naive=0; if s_i_diag_vlg3_rm1_np >0 then do; s_prop_vlg3_rm1_naive = max(0,s_i_naive_vlg3_rm1_np) / s_i_diag_vlg3_rm1_np ; end;
s_prop_vlg4_rm1_naive=0; if s_i_diag_vlg4_rm1_np >0 then do; s_prop_vlg4_rm1_naive = max(0,s_i_naive_vlg4_rm1_np) / s_i_diag_vlg4_rm1_np ; end;
s_prop_vlg5_rm1_naive=0; if s_i_diag_vlg5_rm1_np >0 then do; s_prop_vlg5_rm1_naive = max(0,s_i_naive_vlg5_rm1_np) / s_i_diag_vlg5_rm1_np ; end;
s_prop_vlg6_rm1_naive=0; if s_i_diag_vlg6_rm1_np >0 then do; s_prop_vlg6_rm1_naive = max(0,s_i_naive_vlg6_rm1_np) / s_i_diag_vlg6_rm1_np ; end;

s_prop_vlg1_rm0_naive=0; if s_i_diag_vlg1_rm0_np >0 then do; s_prop_vlg1_rm0_naive = max(0,s_i_naive_vlg1_rm0_np) / s_i_diag_vlg1_rm0_np ; end;
s_prop_vlg2_rm0_naive=0; if s_i_diag_vlg2_rm0_np >0 then do; s_prop_vlg2_rm0_naive = max(0,s_i_naive_vlg2_rm0_np) / s_i_diag_vlg2_rm0_np ; end;
s_prop_vlg3_rm0_naive=0; if s_i_diag_vlg3_rm0_np >0 then do; s_prop_vlg3_rm0_naive = max(0,s_i_naive_vlg3_rm0_np) / s_i_diag_vlg3_rm0_np ; end;
s_prop_vlg4_rm0_naive=0; if s_i_diag_vlg4_rm0_np >0 then do; s_prop_vlg4_rm0_naive = max(0,s_i_naive_vlg4_rm0_np) / s_i_diag_vlg4_rm0_np ; end;
s_prop_vlg5_rm0_naive=0; if s_i_diag_vlg5_rm0_np >0 then do; s_prop_vlg5_rm0_naive = max(0,s_i_naive_vlg5_rm0_np) / s_i_diag_vlg5_rm0_np ; end;
s_prop_vlg6_rm0_naive=0; if s_i_diag_vlg6_rm0_np >0 then do; s_prop_vlg6_rm0_naive = max(0,s_i_naive_vlg6_rm0_np) / s_i_diag_vlg6_rm0_np ; end;

if s_rm_ > 0 then do;
s_prop_tam1			 = max(0,s_tam1_   / s_rm_);
s_prop_tam2 		 = max(0,s_tam2_   / s_rm_);
s_prop_tam3 		 = max(0,s_tam3_   / s_rm_);
s_prop_k103m 		 = max(0,s_k103m_  / s_rm_);
s_prop_y181m		 = max(0,s_y181m_  / s_rm_);
s_prop_g190m 		 = max(0,s_g190m_  / s_rm_);
s_prop_m184m 		 = max(0,s_m184m_  / s_rm_);
s_prop_q151m 		 = max(0,s_q151m_  / s_rm_);
s_prop_k65m       	 = max(0,s_k65m_   / s_rm_);
s_prop_p32m 		 = max(0,s_p32m_   / s_rm_);
s_prop_p33m			 = max(0,s_p33m_   / s_rm_);
s_prop_p46m 		 = max(0,s_p46m_   / s_rm_);
s_prop_p47m			 = max(0,s_p47m_   / s_rm_);
s_prop_p50vm 		 = max(0,s_p50vm_  / s_rm_);
s_prop_p50lm 		 = max(0,s_p50lm_  / s_rm_);
s_prop_p54m			 = max(0,s_p54m_   / s_rm_);
s_prop_p76m 		 = max(0,s_p76m_   / s_rm_);
s_prop_p82m 		 = max(0,s_p82m_   / s_rm_);
s_prop_p84m 		 = max(0,s_p84m_   / s_rm_);
s_prop_p88m 		 = max(0,s_p88m_   / s_rm_);
s_prop_p90m 		 = max(0,s_p90m_   / s_rm_);
s_prop_pim 			 = max(0,s_pim_    / s_rm_);
s_prop_inpm 		 = max(0,s_inpm_   / s_rm_);
s_prop_insm 		 = max(0,s_insm_   / s_rm_);

end;


* Used to update rates of viral suppression;
if s_onart ge 1 then do; p_onart_vls = s_vl1000_art / s_onart ; end;


* Used to determine diagnosis in ep in main program;
if s_hiv1564 > 0 then p_diag   = s_diag/s_hiv1564;
if s_diag > 0     then p_diag_onart   = s_onart/s_diag;
if s_epdiag > 0   then p_diag_eponart = s_eponart/s_epdiag;
if s_hiv1564m > 0 then p_diag_m   = s_diag_m  /s_hiv1564m;
if s_hiv1564w > 0 then p_diag_w   = s_diag_w  /s_hiv1564w;
if s_epi_m    > 0 then p_epdiag_m = s_epdiag_m/s_epi_m; 
if s_epi_w    > 0 then p_epdiag_w = s_epdiag_w/s_epi_w; 
d_diag_m = p_diag_m - p_epdiag_w;
d_diag_w = p_diag_w - p_epdiag_m;

if s_eponart>0 then do; p_onart_epvls=s_epvls/s_eponart;end;
d_vls=p_onart_vls-p_onart_epvls;

d_onart = p_diag_onart - p_diag_eponart;


* Used to determine incidence in ep;
d_hiv_epi_wm= s_hiv0epi1_w - s_hiv1epi0_m;
d_hiv_epi_mw= s_hiv0epi1_m - s_hiv1epi0_w;

if s_hiv1epi1_m > 0 then r_hiv_epi_both = s_hiv1epi1_w / s_hiv1epi1_m;

if s_ep_w > 0 then r_ep_mw = s_ep_m / s_ep_w;  

if s_w1524_ep1524_ gt 0 then r_s_ep_m15w15 = s_m1524_ep1524_ / s_w1524_ep1524_; 
if s_w2534_ep1524_ gt 0 then r_s_ep_m15w25 = s_m1524_ep2534_ / s_w2534_ep1524_; 
if s_w3544_ep1524_ gt 0 then r_s_ep_m15w35 = s_m1524_ep3544_ / s_w3544_ep1524_;
if s_w4554_ep1524_ gt 0 then r_s_ep_m15w45 = s_m1524_ep4554_ / s_w4554_ep1524_; 
if s_w5564_ep1524_ gt 0 then r_s_ep_m15w55 = s_m1524_ep5564_ / s_w5564_ep1524_;

if s_w1524_ep2534_ gt 0 then r_s_ep_m25w15 = s_m2534_ep1524_ / s_w1524_ep2534_; 
if s_w2534_ep2534_ gt 0 then r_s_ep_m25w25 = s_m2534_ep2534_ / s_w2534_ep2534_; 
if s_w3544_ep2534_ gt 0 then r_s_ep_m25w35 = s_m2534_ep3544_ / s_w3544_ep2534_;
if s_w4554_ep2534_ gt 0 then r_s_ep_m25w45 = s_m2534_ep4554_ / s_w4554_ep2534_; 
if s_w5564_ep2534_ gt 0 then r_s_ep_m25w55 = s_m2534_ep5564_ / s_w5564_ep2534_;

if s_w1524_ep3544_ gt 0 then r_s_ep_m35w15 = s_m3544_ep1524_ / s_w1524_ep3544_; 
if s_w2534_ep3544_ gt 0 then r_s_ep_m35w25 = s_m3544_ep2534_ / s_w2534_ep3544_; 
if s_w3544_ep3544_ gt 0 then r_s_ep_m35w35 = s_m3544_ep3544_ / s_w3544_ep3544_;
if s_w4554_ep3544_ gt 0 then r_s_ep_m35w45 = s_m3544_ep4554_ / s_w4554_ep3544_; 
if s_w5564_ep3544_ gt 0 then r_s_ep_m35w55 = s_m3544_ep5564_ / s_w5564_ep3544_;

if s_w1524_ep4554_ gt 0 then r_s_ep_m45w15 = s_m4554_ep1524_ / s_w1524_ep4554_;
if s_w2534_ep4554_ gt 0 then r_s_ep_m45w25 = s_m4554_ep2534_ / s_w2534_ep4554_;
if s_w3544_ep4554_ gt 0 then r_s_ep_m45w35 = s_m4554_ep3544_ / s_w3544_ep4554_;
if s_w4554_ep4554_ gt 0 then r_s_ep_m45w45 = s_m4554_ep4554_ / s_w4554_ep4554_;
if s_w5565_ep4554_ gt 0 then r_s_ep_m45w55 = s_m4554_ep5564_ / s_w5565_ep4554_;

if s_w1524_ep5564_ gt 0 then r_s_ep_m55w15 = s_m5564_ep1524_ / s_w1524_ep5564_;
if s_w2534_ep5564_ gt 0 then r_s_ep_m55w25 = s_m5564_ep2534_ / s_w2534_ep5564_;
if s_w3544_ep5564_ gt 0 then r_s_ep_m55w35 = s_m5564_ep3544_ / s_w3544_ep5564_;
if s_w4554_ep5564_ gt 0 then r_s_ep_m55w45 = s_m5564_ep4554_ / s_w4554_ep5564_;
if s_w5565_ep5564_ gt 0 then r_s_ep_m55w55 = s_m5564_ep5564_ / s_w5565_ep5564_;


if rbm_ = 4 then do;

if sex_age_mixing_matrix_w_=1 then do;
ptnewp15_m=(0.43*s_w_1524_newp)+(0.09*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.34*s_w_1524_newp)+(0.49*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.12*s_w_1524_newp)+(0.30*s_w_2534_newp)+(0.34*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.10*s_w_1524_newp)+(0.10*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.01*s_w_1524_newp)+(0.02*s_w_2534_newp)+(0.13*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w_=2 then do;
ptnewp15_m=(0.43*s_w_1524_newp)+(0.09*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.415*s_w_1524_newp)+(0.50*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.12*s_w_1524_newp)+(0.35*s_w_2534_newp)+(0.34*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.03*s_w_1524_newp)+(0.05*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.005*s_w_1524_newp)+(0.01*s_w_2534_newp)+(0.13*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w_=3 then do;
ptnewp15_m=(0.25*s_w_1524_newp)+(0.09*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.55 *s_w_1524_newp)+(0.50*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.15*s_w_1524_newp)+(0.35*s_w_2534_newp)+(0.34*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.03*s_w_1524_newp)+(0.05*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.02 *s_w_1524_newp)+(0.01*s_w_2534_newp)+(0.13*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w_=4 then do;
ptnewp15_m=(0.05*s_w_1524_newp)+(0.03*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.55 *s_w_1524_newp)+(0.52*s_w_2534_newp)+(0.05*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.35*s_w_1524_newp)+(0.40*s_w_2534_newp)+(0.57*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.03*s_w_1524_newp)+(0.03*s_w_2534_newp)+(0.30*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.02 *s_w_1524_newp)+(0.02*s_w_2534_newp)+(0.05*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w_=5 then do;
ptnewp15_m=(0.05*s_w_1524_newp)+(0.01*s_w_2534_newp)+(0.01*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.45 *s_w_1524_newp)+(0.40*s_w_2534_newp)+(0.07*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.30*s_w_1524_newp)+(0.39*s_w_2534_newp)+(0.47*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.15*s_w_1524_newp)+(0.15*s_w_2534_newp)+(0.30*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.05 *s_w_1524_newp)+(0.05*s_w_2534_newp)+(0.15*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w_=6 then do;
ptnewp15_m=(0.20*s_w_1524_newp)+(0.00*s_w_2534_newp)+(0.01*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.20 *s_w_1524_newp)+(0.25*s_w_2534_newp)+(0.01*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.20*s_w_1524_newp)+(0.25*s_w_2534_newp)+(0.28*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.20*s_w_1524_newp)+(0.25*s_w_2534_newp)+(0.30*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.20 *s_w_1524_newp)+(0.25*s_w_2534_newp)+(0.30*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;



if sex_age_mixing_matrix_m_=1 then do;
ptnewp15_w=(0.865*s_m_1524_newp)+(0.47*s_m_2534_newp)+(0.30*s_m_3544_newp)+(0.43*s_m_4554_newp)+(0.18*s_m_5564_newp);
ptnewp25_w=(0.11*s_m_1524_newp)+(0.43*s_m_2534_newp)+(0.50*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.18*s_m_5564_newp);
ptnewp35_w=(0.025*s_m_1524_newp)+(0.10*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.23*s_m_4554_newp)+(0.27*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.03*s_m_4554_newp)+(0.27*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.01*s_m_4554_newp)+(0.10*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m_=2 then do;
ptnewp15_w=(0.865*s_m_1524_newp)+(0.47*s_m_2534_newp)+(0.30*s_m_3544_newp)+(0.15*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp25_w=(0.11*s_m_1524_newp)+(0.43*s_m_2534_newp)+(0.35*s_m_3544_newp)+(0.23*s_m_4554_newp)+(0.08*s_m_5564_newp);
ptnewp35_w=(0.025*s_m_1524_newp)+(0.10*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.25*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.07*s_m_4554_newp)+(0.32*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m_=3 then do;
ptnewp15_w=(0.90 *s_m_1524_newp)+(0.44*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.15*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.43*s_m_2534_newp)+(0.34*s_m_3544_newp)+(0.23*s_m_4554_newp)+(0.08*s_m_5564_newp);
ptnewp35_w=(0.02 *s_m_1524_newp)+(0.10*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.25*s_m_5564_newp);
ptnewp45_w=(0.02*s_m_1524_newp)+(0.02*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp55_w=(0.01*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.07*s_m_4554_newp)+(0.32*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m_=4 then do;
ptnewp15_w=(0.93 *s_m_1524_newp)+(0.50*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.15*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.40*s_m_2534_newp)+(0.34*s_m_3544_newp)+(0.20*s_m_4554_newp)+(0.08*s_m_5564_newp);
ptnewp35_w=(0.01 *s_m_1524_newp)+(0.08*s_m_2534_newp)+(0.41*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.20*s_m_5564_newp);
ptnewp45_w=(0.01*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.37*s_m_4554_newp)+(0.40*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.03*s_m_4554_newp)+(0.27*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m_=5 then do;
ptnewp15_w=(0.94 *s_m_1524_newp)+(0.50*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.40*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp35_w=(0.01 *s_m_1524_newp)+(0.08*s_m_2534_newp)+(0.15*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.04*s_m_3544_newp)+(0.10*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.01*s_m_3544_newp)+(0.05*s_m_4554_newp)+(0.05*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m_=6 then do;
ptnewp15_w=(0.94 *s_m_1524_newp)+(0.50*s_m_2534_newp)+(0.50*s_m_3544_newp)+(0.50*s_m_4554_newp)+(0.50*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.40*s_m_2534_newp)+(0.35*s_m_3544_newp)+(0.35*s_m_4554_newp)+(0.35*s_m_5564_newp);
ptnewp35_w=(0.01 *s_m_1524_newp)+(0.10*s_m_2534_newp)+(0.10*s_m_3544_newp)+(0.10*s_m_4554_newp)+(0.10*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.05*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.00*s_m_4554_newp)+(0.00*s_m_5564_newp);
end;


end;

if s_m_1524_newp gt 0 then m15r = ptnewp15_m / s_m_1524_newp;  
if s_m_2534_newp gt 0 then m25r = ptnewp25_m / s_m_2534_newp;  
if s_m_3544_newp gt 0 then m35r = ptnewp35_m / s_m_3544_newp;  
if s_m_4554_newp gt 0 then m45r = ptnewp45_m / s_m_4554_newp;  
if s_m_5564_newp gt 0 then m55r = ptnewp55_m / s_m_5564_newp;  
if s_w_1524_newp gt 0 then w15r = ptnewp15_w / s_w_1524_newp;  
if s_w_2534_newp gt 0 then w25r = ptnewp25_w / s_w_2534_newp;  
if s_w_3544_newp gt 0 then w35r = ptnewp35_w / s_w_3544_newp;  
if s_w_4554_newp gt 0 then w45r = ptnewp45_w / s_w_4554_newp;  
if s_w_5564_newp gt 0 then w55r = ptnewp55_w / s_w_5564_newp;    
 
*Used in abort statements below;
if s_alive1549 gt 0 then prevalence1549 = (s_hiv1549w + s_hiv1549m) / (s_alive1549 );
if prevalence1524m gt 0 then prev_ratio_1524 = prevalence1524w / prevalence1524m ;


data ll; set f;

dummy=99999;


keep

p50_cd4diag  			 s_cd4diag  
p50_measured_cd4art 	 s_measured_cd4art 
p50_years_on_prep   	 s_years_on_prep
p50_n_test_prevyr_onprep s_n_test_prevyr_onprep
p50_act_years_sw 		 s_act_years_sw 
 
/*general*/
run_   s_n  cald  art_monitoring_strategy_  option_
																														 										  
/*number alive and in each age group*/
s_alive1549 	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m			
s_ageg1517w		s_ageg1819w		s_ageg1519w  	s_ageg2024w		s_ageg2529w  	s_ageg3034w		s_ageg3539w		s_ageg4044w	
s_ageg4549w		s_ageg5054w 	s_ageg5559w		s_ageg6064w		s_ageg1564w		s_ageg1549w		s_age_1844w
s_ageg1m  s_ageg2m  s_ageg3m  s_ageg4m  s_ageg5m  s_ageg1w  s_ageg2w  s_ageg3w  s_ageg4w  s_ageg5w  

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m		
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w
s_alive_w s_alive_m
 
/*number and status of those with HIV*/
s_hiv1564 		s_hiv1549 
s_hiv1517m		s_hiv1819m		s_hiv1519m  	s_hiv2024m		s_hiv2529m  	s_hiv3034m		s_hiv3539m		s_hiv4044m	
s_hiv4549m		s_hiv5054m 		s_hiv5559m		s_hiv6064m		s_hiv1564m		s_hiv1549m	
s_hiv1517w		s_hiv1819w		s_hiv1519w  	s_hiv2024w		s_hiv2529w  	s_hiv3034w		s_hiv3539w		s_hiv4044w	
s_hiv4549w		s_hiv5054w 		s_hiv5559w		s_hiv6064w		s_hiv1564w		s_hiv1549w	
s_sg_1 			s_sg_2 			s_sg_3 			s_sg_4			s_sg_5 			s_sg_6 			s_sg_7 			s_sg_8 		s_sg_9	 s_sg_99

/*primary infection*/
s_primary  		s_primary1549   s_primary1549m  s_primary1549w  s_infected_primary 	s_inf_primary
s_primary1519m	s_primary2024m	s_primary2529m	s_primary3034m	s_primary3539m	s_primary4044m	s_primary4549m
s_primary5054m	s_primary5559m	s_primary6064m
s_primary1519w	s_primary2024w	s_primary2529w	s_primary3034w	s_primary3539w	s_primary4044w	s_primary4549w
s_primary5054w	s_primary5559w	s_primary6064w
s_primary_ep_m  s_primary_ep_w  
s_primary1524m_ep  s_primary2534m_ep  s_primary3544m_ep  s_primary4554m_ep  s_primary5564m_ep
s_primary1524w_ep  s_primary2534w_ep  s_primary3544w_ep  s_primary4554w_ep  s_primary5564w_ep
s_primary1524m_epnewp  s_primary2534m_epnewp  s_primary3544m_epnewp  s_primary4554m_epnewp  s_primary5564m_epnewp 
s_primary1524w_epnewp  s_primary2534w_epnewp  s_primary3544w_epnewp  s_primary4554w_epnewp  s_primary5564w_epnewp
s_primary_sw
s_inf_vlsupp  s_inf_newp  s_inf_ep  s_inf_diag  s_inf_naive 

/*outputs amongst those infected*/
s_i_m_d_newp  s_i_w_d_newp   s_i_w_np   s_i_m_np  s_i_ep 

s_i_m_1524_newp  s_i_m_2534_newp  s_i_m_3544_newp  s_i_m_4554_newp  s_i_m_5564_newp
s_i_w_1524_newp  s_i_w_2534_newp  s_i_w_3544_newp  s_i_w_4554_newp  s_i_w_5564_newp 
s_i_r_vlg1_np  s_i_r_vlg2_np  s_i_r_vlg3_np  s_i_r_vlg4_np  s_i_r_vlg5_np  s_i_r_vlg6_np
s_i_diag_vlg1_rm0_np   s_i_diag_vlg2_rm0_np   s_i_diag_vlg3_rm0_np   s_i_diag_vlg4_rm0_np   s_i_diag_vlg5_rm0_np   s_i_diag_vlg6_rm0_np
s_i_diag_vlg1_rm1_np   s_i_diag_vlg2_rm1_np   s_i_diag_vlg3_rm1_np   s_i_diag_vlg4_rm1_np   s_i_diag_vlg5_rm1_np   s_i_diag_vlg6_rm1_np
s_i_naive_vlg1_rm0_np  s_i_naive_vlg2_rm0_np  s_i_naive_vlg3_rm0_np  s_i_naive_vlg4_rm0_np  s_i_naive_vlg5_rm0_np  s_i_naive_vlg6_rm0_np
s_i_naive_vlg1_rm1_np  s_i_naive_vlg2_rm1_np  s_i_naive_vlg3_rm1_np  s_i_naive_vlg4_rm1_np  s_i_naive_vlg5_rm1_np  s_i_naive_vlg6_rm1_np
s_i_v1_np  s_i_v2_np   s_i_v3_np  s_i_v4_np   s_i_v5_np  s_i_v6_np 

/*Number ep and newp*/
s_np  s_newp  s_newp_ge1  s_newp_ge5  s_newp_ge10  s_newp_ge50  s_ep  s_ep_m  s_ep_w  s_npge10  s_npge2  s_npge2_ly_1549m  s_npge2_ly_1549w
s_m_1524_ep  	 s_m_2534_ep 	  s_m_3544_ep 	   s_m_4554_ep 		s_m_5564_ep 	 
s_w_1524_ep		 s_w_2534_ep 	  s_w_3544_ep	   s_w_4554_ep 		s_w_5564_ep 
s_m_1524_newp  	 s_m_2534_newp    s_m_3544_newp    s_m_4554_newp  	s_m_5564_newp
s_w_1524_newp  	 s_w_2534_newp    s_w_3544_newp    s_w_4554_newp    s_w_5564_newp
s_m_1524_epnewp  s_m_2534_epnewp  s_m_3544_epnewp  s_m_4554_epnewp  s_m_5564_epnewp 
s_w_1524_epnewp  s_w_2534_epnewp  s_w_3544_epnewp  s_w_4554_epnewp  s_w_5564_epnewp
s_newp_ge1_hiv 
av_newp_p3m  av_newp_p3m_hiv  av_newp_p3m_diag  av_p_ep_py  av_p_ep_py_hiv  av_p_ep_py_diag
s_ever_ep  s_ever_newp  
s_m1524_ep1524_ s_m1524_ep2534_ s_m1524_ep3544_ s_m1524_ep4554_ s_m1524_ep5564_ 
s_m2534_ep1524_ s_m2534_ep2534_ s_m2534_ep3544_ s_m2534_ep4554_ s_m2534_ep5564_ 
s_m3544_ep1524_ s_m3544_ep2534_ s_m3544_ep3544_ s_m3544_ep4554_ s_m3544_ep5564_
s_m4554_ep1524_ s_m4554_ep2534_ s_m4554_ep3544_ s_m4554_ep4554_ s_m4554_ep5564_ 
s_m5565_ep1524_ s_m5565_ep2534_ s_m5565_ep3544_ s_m5565_ep4554_ s_m5565_ep5564_ 
s_w1524_ep1524_ s_w1524_ep2534_ s_w1524_ep3544_ s_w1524_ep4554_ s_w1524_ep5564_ 
s_w2534_ep1524_ s_w2534_ep2534_ s_w2534_ep3544_ s_w2534_ep4554_ s_w2534_ep5564_ 
s_w3544_ep1524_ s_w3544_ep2534_ s_w3544_ep3544_ s_w3544_ep4554_ s_w3544_ep5564_ 
s_w4554_ep1524_ s_w4554_ep2534_ s_w4554_ep3544_ s_w4554_ep4554_ s_w4554_ep5564_ 
s_w5565_ep1524_ s_w5565_ep2534_ s_w5565_ep3544_ s_w5565_ep4554_ s_w5565_ep5564_ 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 
	
npgt1conc_ly_1524m  npgt1conc_ly_1524w  npgt1conc_ly_1519m  npgt1conc_ly_1519w  npgt1conc_ly_2549m 
npgt1conc_ly_2549w  npgt1conc_ly_5064m  npgt1conc_ly_5064w 

s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

/*status of partner*/
s_eph0_m  s_eph0_w  s_nip   s_epi
s_newp_hiv  s_newp_ge1_hiv_diag  s_epdiag   s_diag_epun  s_eponart  s_epvls
s_hiv1epi0_w  s_hiv0epi1_w  s_hiv1epi0_m  s_hiv0epi1_m  s_hiv1epi1_m  s_hiv1epi1_w  
s_hiv0epprim
s_ever_ep_hiv  s_ever_ep_diag  s_ever_newp_hiv  s_ever_newp_diag
s_infected_newp_m  s_infected_newp_w  s_infected_ep_m  s_infected_ep_w

s_i_vl1000_m_np s_i_v11000_m_ep s_i_vl1000_m_newp
s_i_vl1000_w_np s_i_v11000_w_ep s_i_vl1000_w_newp
	
s_i_v1_age1_w_np s_i_v1_age2_w_np s_i_v1_age3_w_np s_i_v1_age4_w_np s_i_v1_age5_w_np 
s_i_v1_age1_m_np s_i_v1_age2_m_np s_i_v1_age3_m_np s_i_v1_age4_m_np s_i_v1_age5_m_np 
s_i_v1_age1_w_newp s_i_v1_age2_w_newp s_i_v1_age3_w_newp s_i_v1_age4_w_newp s_i_v1_age5_w_newp 
s_i_v1_age1_m_newp s_i_v1_age2_m_newp s_i_v1_age3_m_newp s_i_v1_age4_m_newp s_i_v1_age5_m_newp 
s_i_v1_age1_w_ep s_i_v1_age2_w_ep s_i_v1_age3_w_ep s_i_v1_age4_w_ep s_i_v1_age5_w_ep 
s_i_v1_age1_m_ep s_i_v1_age2_m_ep s_i_v1_age3_m_ep s_i_v1_age4_m_ep s_i_v1_age5_m_ep 

s_i_v2_age1_w_np s_i_v2_age2_w_np s_i_v2_age3_w_np s_i_v2_age4_w_np s_i_v2_age5_w_np 
s_i_v2_age1_m_np s_i_v2_age2_m_np s_i_v2_age3_m_np s_i_v2_age4_m_np s_i_v2_age5_m_np 
s_i_v2_age1_w_newp s_i_v2_age2_w_newp s_i_v2_age3_w_newp s_i_v2_age4_w_newp s_i_v2_age5_w_newp 
s_i_v2_age1_m_newp s_i_v2_age2_m_newp s_i_v2_age3_m_newp s_i_v2_age4_m_newp s_i_v2_age5_m_newp 
s_i_v2_age1_w_ep s_i_v2_age2_w_ep s_i_v2_age3_w_ep s_i_v2_age4_w_ep s_i_v2_age5_w_ep 
s_i_v2_age1_m_ep s_i_v2_age2_m_ep s_i_v2_age3_m_ep s_i_v2_age4_m_ep s_i_v2_age5_m_ep 

s_i_v3_age1_w_np s_i_v3_age2_w_np s_i_v3_age3_w_np s_i_v3_age4_w_np s_i_v3_age5_w_np 
s_i_v3_age1_m_np s_i_v3_age2_m_np s_i_v3_age3_m_np s_i_v3_age4_m_np s_i_v3_age5_m_np 
s_i_v3_age1_w_newp s_i_v3_age2_w_newp s_i_v3_age3_w_newp s_i_v3_age4_w_newp s_i_v3_age5_w_newp 
s_i_v3_age1_m_newp s_i_v3_age2_m_newp s_i_v3_age3_m_newp s_i_v3_age4_m_newp s_i_v3_age5_m_newp 
s_i_v3_age1_w_ep s_i_v3_age2_w_ep s_i_v3_age3_w_ep s_i_v3_age4_w_ep s_i_v3_age5_w_ep 
s_i_v3_age1_m_ep s_i_v3_age2_m_ep s_i_v3_age3_m_ep s_i_v3_age4_m_ep s_i_v3_age5_m_ep 

s_i_v4_age1_w_np s_i_v4_age2_w_np s_i_v4_age3_w_np s_i_v4_age4_w_np s_i_v4_age5_w_np 
s_i_v4_age1_m_np s_i_v4_age2_m_np s_i_v4_age3_m_np s_i_v4_age4_m_np s_i_v4_age5_m_np 
s_i_v4_age1_w_newp s_i_v4_age2_w_newp s_i_v4_age3_w_newp s_i_v4_age4_w_newp s_i_v4_age5_w_newp 
s_i_v4_age1_m_newp s_i_v4_age2_m_newp s_i_v4_age3_m_newp s_i_v4_age4_m_newp s_i_v4_age5_m_newp 
s_i_v4_age1_w_ep s_i_v4_age2_w_ep s_i_v4_age3_w_ep s_i_v4_age4_w_ep s_i_v4_age5_w_ep 
s_i_v4_age1_m_ep s_i_v4_age2_m_ep s_i_v4_age3_m_ep s_i_v4_age4_m_ep s_i_v4_age5_m_ep 

s_i_v5_age1_w_np s_i_v5_age2_w_np s_i_v5_age3_w_np s_i_v5_age4_w_np s_i_v5_age5_w_np 
s_i_v5_age1_m_np s_i_v5_age2_m_np s_i_v5_age3_m_np s_i_v5_age4_m_np s_i_v5_age5_m_np 
s_i_v5_age1_w_newp s_i_v5_age2_w_newp s_i_v5_age3_w_newp s_i_v5_age4_w_newp s_i_v5_age5_w_newp 
s_i_v5_age1_m_newp s_i_v5_age2_m_newp s_i_v5_age3_m_newp s_i_v5_age4_m_newp s_i_v5_age5_m_newp 
s_i_v5_age1_w_ep s_i_v5_age2_w_ep s_i_v5_age3_w_ep s_i_v5_age4_w_ep s_i_v5_age5_w_ep 
s_i_v5_age1_m_ep s_i_v5_age2_m_ep s_i_v5_age3_m_ep s_i_v5_age4_m_ep s_i_v5_age5_m_ep 

s_i_v6_age1_w_np s_i_v6_age2_w_np s_i_v6_age3_w_np s_i_v6_age4_w_np s_i_v6_age5_w_np 
s_i_v6_age1_m_np s_i_v6_age2_m_np s_i_v6_age3_m_np s_i_v6_age4_m_np s_i_v6_age5_m_np 
s_i_v6_age1_w_newp s_i_v6_age2_w_newp s_i_v6_age3_w_newp s_i_v6_age4_w_newp s_i_v6_age5_w_newp 
s_i_v6_age1_m_newp s_i_v6_age2_m_newp s_i_v6_age3_m_newp s_i_v6_age4_m_newp s_i_v6_age5_m_newp 
s_i_v6_age1_w_ep s_i_v6_age2_w_ep s_i_v6_age3_w_ep s_i_v6_age4_w_ep s_i_v6_age5_w_ep 
s_i_v6_age1_m_ep s_i_v6_age2_m_ep s_i_v6_age3_m_ep s_i_v6_age4_m_ep s_i_v6_age5_m_ep 

s_i_age1_m_np s_i_age2_m_np	s_i_age3_m_np	s_i_age4_m_np	s_i_age5_m_np
s_i_age1_w_np	s_i_age2_w_np	s_i_age3_w_np	s_i_age4_w_np	s_i_age5_w_np
s_i_age1_m_newp s_i_age2_m_newp	s_i_age3_m_newp	s_i_age4_m_newp	s_i_age5_m_newp
s_i_age1_w_newp	s_i_age2_w_newp	s_i_age3_w_newp	s_i_age4_w_newp	s_i_age5_w_newp

s_i_m_1549_np  s_i_w_1549_np

/*resistance*/
s_tam1_  s_tam2_  s_tam3_  s_m184m_  s_k103m_  s_y181m_  s_g190m_  s_nnm_  s_q151m_  s_k65m_  
s_p32m_  s_p33m_  s_p46m_  s_p47m_   s_p50vm_  s_p50lm_  s_p54m_   s_p76m_ s_p82m_   s_p84m_   s_p88m_	s_p90m_   s_pim_  
s_inpm_  s_insm_  s_rm_    s_i_nnm   s_i_rm    s_i_pim   s_i_tam   s_i_im  s_inm_    s_i_184m  s_im_art s_pim_art s_tam_art s_m184_art
s_r_  	 s_r_3tc  s_r_nev  s_r_lpr   s_r_taz   s_r_efa   s_r_ten   s_r_zdv s_r_dol  
s_rme_   s_iime_  s_nnme_  s_pime_   s_nrtime_
s_res_1stline_startline2  s_nnm_art  s_nnm_art_m  s_nnm_art_w  s_r_art  s_acq_rt65m  s_acq_rt184m  s_acq_rtm  s_onart_iicu_res
s_nactive_art_start_lt2  s_nactive_art_start_lt3  s_nactive_art_start_lt1p5
s_nactive_line2_lt4 	 s_nactive_line2_lt3 	  s_nactive_line2_lt2 		s_nactive_line2_lt1p5  s_pim_line2
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  s_higher_rate_res_dol
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  s_nnrti_res_no_effect
s_ai_naive_no_pmtct_ s_ai_naive_no_pmtct_c_nnm_

/*prep*/
s_prep  s_prep_sw  s_prep_w_1524 s_elig_prep_epdiag  s_infected_prep  s_prep_ever  s_primary_prep  s_hiv1_prep  s_i_r_prep  s_primary_r_prep  s_ever_i_nor_prep  
s_rm_prep  s_elig_prep  	 s_hr_noprep  s_primary_hr_noprep 
s_rt65m_3_prep  s_rt184m_3_prep  s_rtm_3_prep  s_rt65m_6_prep  s_rt184m_6_prep  s_rtm_6_prep 
s_rt65m_9_prep  s_rt184m_9_prep  s_rtm_9_prep  s_rt65m_12_prep  s_rt184m_12_prep  s_rtm_12_prep  
s_rt65m_18_prep s_rt184m_18_prep s_rtm_18_prep  
s_onprep_3  s_onprep_6  s_onprep_9  s_onprep_12  s_onprep_18  

s_prepstart  s_ever_stopped_prep_choice  s_preprestart 
s_acq_rt65m_3_prep  s_acq_rt184m_3_prep   s_acq_rtm_3_prep     s_acq_rt65m_6_prep   s_acq_rt184m_6_prep   s_acq_rtm_6_prep 
s_acq_rt65m_9_prep  s_acq_rt184m_9_prep   s_acq_rtm_9_prep     s_acq_rt65m_12_prep  s_acq_rt184m_12_prep  s_acq_rtm_12_prep  
s_acq_rt65m_18_prep s_acq_rt184m_18_prep  s_acq_rtm_18_prep
s_inf_prep_adhg80   s_inf_prep_adh5080    s_inf_prep_adhl50  s_prep_adhg80  s_prep_adh5080  s_prep_adhl50 
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w

s_infected_prep_source_prep_r  s_prepinfect_prep_r     s_prepinfect_prep_r_p   s_infected_prep_no_r    s_infected_prep_r  
s_started_prep_in_primary	   s_tot_yrs_prep  		   s_onprep_3_i_prep_no_r  s_onprep_6_i_prep_no_r  s_onprep_9_i_prep_no_r 
s_onprep_12_i_prep_no_r 	   s_onprep_18_i_prep_no_r s_prepinfect_rm_p      s_prepinfect_m184m_p    s_prepinfect_k65m_p 
s_prepinfect_tam_p 			   s_prepinfect_rtm  	   s_prepinfect_k65m	   s_prepinfect_m184m  	   s_prepinfect_tam  
s_prep_willing_pop  		   s_prep_willing_sw  	   s_stop_prep_choice      s_started_prep_hiv_test_sens  
s_cur_res_prep_drug 		   s_started_prep_hiv_test_sens_e  				   s_started_prep_in_primary_e
s_cur_res_ten				   s_cur_res_3tc  		   s_i_65m 				   s_cur_res_efa 			
s_cur_res_ten_vlg1000 		   s_cur_res_3tc_vlg1000 						   s_cur_res_efa_vlg1000	s_ever_hiv1_prep 
s_cur_res_efa_ever_hiv1_prep   s_cur_res_ten_ever_hiv1_prep   				   s_cur_res_3tc_ever_hiv1_prep   
s_prep_effectiveness_non_res_v 
s_prep_3m_after_inf_no_r 	s_prep_3m_after_inf_no_r_184  s_prep_3m_after_inf_no_r_65
s_prep_6m_after_inf_no_r  s_prep_6m_after_inf_no_r_184  s_prep_6m_after_inf_no_r_65  s_prep_12m_after_inf_no_r  
s_prep_12m_after_inf_no_r_184  s_prep_12m_after_inf_no_r_65
s_hiv_prep_reason_1  s_hiv_prep_reason_2  s_hiv_prep_reason_3  s_hiv_prep_reason_4

s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg10  s_prep_newpg100 
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_ever_w_1524  s_prep_ever_w
s_test_gt_3m_on_prep  s_test_gt_3m_on_prep_pos  s_test_3m_on_prep  s_test_3m_on_prep_pos  
s_prepuptake_sw 	 s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep									

/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_tested1549_		s_tested1549m       s_tested1549w
s_tested_ly_m1549_ 	s_tested_ly_m1519_ 	s_tested_ly_m2024_ s_tested_ly_m2529_  s_tested_ly_m3039_  s_tested_ly_m4049_  s_tested_ly_m5064_
s_tested_ly_w1549_ 	s_tested_ly_w1519_ 	s_tested_ly_w2024_ s_tested_ly_w2529_  s_tested_ly_w3039_  s_tested_ly_w4049_  s_tested_ly_w5064_ 
s_tested_ly_sw		

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_who3_tested  
s_tested_trueneg  s_tested_falseneg  s_tested_falsepos  s_tested_falseneg_prim  s_com_test  s_tested_anc_prevdiag  s_tested_anc
s_non_hiv_symptoms  s_symptomatic  s_tested_symp  s_tested_pos_sympt  s_tested_symp_undiag  s_tested_non_hivsymp  s_symptomatic_undiag 		
s_tested_as_sw  s_tested_m_sympt  s_tested_f_sympt  s_tested_f_sw  s_tested_m_circ  
s_rate_1sttest   s_rate_reptest  s_newp_lasttest_tested_this_per
s_acc_test  s_acc_test_1524_  s_acc_test_2549_  s_acc_test_5064_  s_acc_test_sw  

s_diag
s_diag_m1549_  s_diag_m1519_  s_diag_m2024_  s_diag_m2529_  s_diag_m3034_  s_diag_m3539_  s_diag_m4044_  s_diag_m4549_ 
s_diag_m5054_  s_diag_m5559_  s_diag_m6064_ 
s_diag_w1549_  s_diag_w1519_  s_diag_w2024_  s_diag_w2529_  s_diag_w3034_  s_diag_w3539_  s_diag_w4044_  s_diag_w4549_ 
s_diag_w5054_  s_diag_w5559_  s_diag_w6064_  s_diag_sw 
s_nn_tdr_diag

s_diag_this_period  s_diag_this_period_m  s_diag_this_period_f  s_diag_this_period_f_non_anc  s_diag_this_period_f_anc 
s_diag_this_period_m_sympt  s_diag_this_period_f_sympt  s_diag_12m  s_diag_6m  s_diag_3m 
s_sympt_diag  s_sympt_diag_ever  s_diag_m  s_diag_w  s_epdiag_m  s_epdiag_w	 s_epi_m  s_epi_w
s_diag_ep

/*VL and CD4*/
s_vlg1  s_vlg2  s_vlg3  s_vlg4  s_vlg5  s_vlg6
s_line1_vlg1000 s_line2_vlg1000  s_res_vfail1
s_u_vfail1_this_period  s_u_vfail1  s_vl_vfail1_g1 s_vl_vfail1_g2 s_vl_vfail1_g3 s_vl_vfail1_g4 s_vl_vfail1_g5 s_vl_vfail1_g6 
s_vlg1000_onart  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_184m  s_vlg1000_onart_65m  s_sw_vg1000
s_vg1000  s_vg1000_m  s_vg1000_w  s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt_6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt_6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt_6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt_6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt_6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt_6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw 

s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
s_art_initiation_strategy  s_art_monitoring_strategy   s_naive    s_onart  s_int_clinic_not_aw
s_art_start  	s_art_start_m   s_art_start_w   s_artexp  s_artexpoff  s_onart_m  s_onart_w
s_onart_m1549_  s_onart_m1564_  s_onart_m1519_  s_onart_m2024_  s_onart_m2529_  s_onart_m3034_  s_onart_m3539_  
s_onart_m4044_  s_onart_m4549_  s_onart_m5054_  s_onart_m5559_  s_onart_m6064_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	s_onart_sw
s_art_dur_l6m   s_art_dur_g6m   s_art_tdur_l6m  s_art_tdur_g6m
s_eponart_m	 s_eponart_w  s_hiv1564_onart  s_dead1564_onart  s_who3_art_init  s_who4_art_init  s_art_start_pregnant 

s_lpr  s_taz  s_3tc  s_nev  s_efa  s_ten  s_zdv  s_dol
s_onefa_linefail1  s_ev_art_g1k_l1k  s_ev_art_g1k_not2l  s_ev_art_g1k_not2l_l1k  s_ev_art_g1k  s_ev_art_g1k_not2l_adc
s_art_12m  s_vl1000_art_12m  s_art_24m  s_vl1000_art_24m  s_art_12m_onart  s_vl1000_art_12m_onart
s_startedline2  s_start_line2_this_period  s_line2_12m  s_line2_12m_onart  s_line2_incl_int_clinic_not_aw

s_onart_vlg1000  s_ever_onart_gt6m_vlg1000   s_ever_onart_gt6m_vl_m_g1000  s_onart_gt6m_vlg1000  s_r_onart_gt6m_vlg1000
s_onart_gt6m_nnres_vlg1000  s_onart_gt6m_pires_vlg1000  s_onart_gt6m_res_vlg1000
s_online1_vg1000  s_online1_vg1000_lf1  s_online1_vg1000_cd4l200  s_offart_vl1000
s_vl1000_line2_12m  s_vl1000_line2_12m_onart  s_vl1000_line2

s_offart  s_line1_  s_line2_  s_line1_lf0  s_line1_lf1  s_line2_lf1  s_line2_lf2  s_linefail_ge1  s_line1_fail_this_period
s_lf1_past_yr   s_lf1_past_yr_line2 
s_onart_cl200  s_onart_cd4_g500  s_onart_res  s_reg_option

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  s_rel_dol_tox  s_dol_higher_potency

s_status_artl1_1_1   s_status_artl1_1_2   s_status_artl1_1_3   s_status_artl1_1_4   s_status_artl1_1_5   s_status_artl1_1_6  
s_status_artl1_1_7   s_status_artl1_1_8   s_status_artl1_1_9   s_status_artl1_1_10  s_status_artl1_1_11  s_status_artl1_1_12 
s_status_artl1_1_13  s_status_artl1_1_14  s_status_artl1_1_15  s_status_artl1_1_16 
s_status_artl1_3_1   s_status_artl1_3_2   s_status_artl1_3_3   s_status_artl1_3_4   s_status_artl1_3_5   s_status_artl1_3_6
s_status_artl1_3_7   s_status_artl1_3_8   s_status_artl1_3_9   s_status_artl1_3_10  s_status_artl1_3_11  s_status_artl1_3_12 
s_status_artl1_3_13  s_status_artl1_3_14  s_status_artl1_3_15  s_status_artl1_3_16 
s_status_artl1_5_1   s_status_artl1_5_2   s_status_artl1_5_3   s_status_artl1_5_4   s_status_artl1_5_5   s_status_artl1_5_6 
s_status_artl1_5_7   s_status_artl1_5_8   s_status_artl1_5_9   s_status_artl1_5_10  s_status_artl1_5_11  s_status_artl1_5_12
s_status_artl1_5_13  s_status_artl1_5_14  s_status_artl1_5_15  s_status_artl1_5_16

s_rr_int_tox   s_double_rate_gas_tox_taz   s_incr_mort_risk_dol_weightg  s_oth_dol_adv_birth_e_risk  s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e  s_prop_bmi_ge23

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

reg_option_

s_drug_level_test  s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

/*costs and dalys*/
s_cost       s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ     s_adhm_cost  s_t_adh_int_cost s_adj_art_cost     s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  			  s_cost_cascade_intervention
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
s_adj_art_1_cost  		   	   s_adj_art_2_cost			   	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dwho3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ    s_dadhm_cost   s_d_t_adh_int_cost s_dadj_art_dcost  s_dcost_test_m   s_dcost_test_f
s_dcost_prep   s_dcost_prep_visit  			   s_dcost_prep_ac_adh 			  s_dcost_cascade_interventions
s_dcost_test_m_sympt  	       s_dcost_test_f_sympt  		   s_dcost_test_m_circ  	  	 	s_dcost_test_f_anc s_dcost_test_f_sw
s_dcost_test_f_non_anc 	       s_dpi_cost     s_dcost_switch_line  		  s_dcost_child_hiv s_dcost_child_hiv_mo_art  		   s_dcost_art_init
s_dadj_art_1_cost  		       s_dadj_art_2_cost  			   s_dart_1_cost  s_dart_2_cost     s_dart_3_cost	   s_dcost_vl_not_done 	
s_dcost_non_aids_pre_death   s_ddaly_non_aids_pre_death  s_dead_ddaly_oth_dol_adv_birth_e   s_dcost_drug_level_test
s_dead_ddaly_ntd    s_ddaly_mtct    s_dead_daly

/*visits*/
s_visit  s_lost  s_linked_to_care  s_linked_to_care_this_period
s_pre_art_care  s_linked_preartcare_12m  s_linked_preartcare_6m	 s_linked_preartcare_3m  s_staged_12m  s_ret_preartcare_12m  
s_staged_eligm1y  s_inart_staged_eligm1y  s_retpreart_m12mdiag  s_m12mdiag  s_elig_mcd4_  
s_eligatdiag_1y  s_inart_eligatdiag_1y  s_onart_eligatdiag_1y  s_ret_preartcare_naive
s_visit_prep_no  s_visit_prep_d  s_visit_prep_dt  s_visit_prep_dtc
s_sv  s_sv_secondline   

/*deaths*/
s_dead1564_all	   s_dead1564m_all    s_dead1564w_all
s_deaths1519m_all  s_deaths2024m_all  s_deaths2529m_all  s_deaths3034m_all  s_deaths3539m_all s_deaths4044m_all  s_deaths4549m_all
s_deaths1519w_all  s_deaths2024w_all  s_deaths2529w_all  s_deaths3034w_all  s_deaths3539w_all s_deaths4044w_all  s_deaths4549w_all
s_death_hivrel  s_dead_rdcause2  s_dead_onart_rdcause2
s_deaths  s_death_hiv  s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_3m 
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
 s_ev_art_g1k_not2l_adead  

/*sex workers*/
s_base_rate_sw  s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw1849_  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp		s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  

/*ADC etc*/
s_adc  s_who3_event  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 

/*Pregnancy and children*/
s_pregnant 	s_anc  s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant 
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_CEB_W1524_ 		s_CEB_W2534_ 		s_CEB_W3544_ 		s_CEB_W4549_ 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child  s_ntd_risk_dol  s_rate_birth_with_infected_child

/*circumcision*/
s_mcirc      s_mcirc_1519m		s_mcirc_2024m	   s_mcirc_2529m      s_mcirc_3039m		 s_mcirc_4049m	    s_mcirc_50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3039m  s_new_mcirc_4049m  s_new_mcirc_50plm

/*parameters sampled*/
sex_beh_trans_matrix_m_  sex_beh_trans_matrix_w_  sex_age_mixing_matrix_m_ sex_age_mixing_matrix_w_  p_rred_p_  p_hsb_p_  newp_factor_  
eprate_  conc_ep_  ch_risk_diag_  ch_risk_diag_newp_  ych_risk_beh_newp_  ych2_risk_beh_newp_  ych_risk_beh_ep_
exp_setting_lower_p_vl1000_  external_exp_factor_  rate_exp_set_lower_p_vl1000_  prob_pregnancy_base_
fold_change_w_  fold_change_yw_  fold_change_sti_  super_infection_  an_lin_incr_test_  date_test_rate_plateau_  
rate_testanc_inc_  incr_test_rate_sympt_  max_freq_testing_  test_targeting_  fx_  adh_pattern_  prob_loss_at_diag_  
pr_art_init_  rate_lost_  prob_lost_art_  rate_return_  rate_restart_  rate_int_choice_  clinic_not_aw_int_frac_
res_trans_factor_nn_  rate_loss_persistence_  incr_rate_int_low_adh_  poorer_cd4rise_fail_nn_  
poorer_cd4rise_fail_ii_  rate_res_ten_  fold_change_mut_risk_  adh_effect_of_meas_alert_  pr_switch_line_  
prob_vl_meas_done_  red_adh_tb_adc_  red_adh_tox_pop_  add_eff_adh_nnrti_  altered_adh_sec_line_pop_  prob_return_adc_  
prob_lossdiag_adctb_  prob_lossdiag_who3e_  higher_newp_less_engagement_  fold_tr_  switch_for_tox_
adh_pattern_prep_  rate_test_startprep_  rate_test_restartprep_  rate_choose_stop_prep_  circ_inc_rate_
p_hard_reach_w_  hard_reach_higher_in_men_  p_hard_reach_m_ inc_cat_  base_rate_sw_  
prob_prep_restart_choice_ 	prepuptake_sw_ 		prepuptake_pop_   cd4_monitoring_		base_rate_stop_sexwork_		rred_a_p_
rr_int_tox_   rate_birth_with_infected_child_  nnrti_res_no_effect_  double_rate_gas_tox_taz_   incr_mort_risk_dol_weightg_


/*2020 interventions*/
condom_incr_2020_    			  cascade_care_improvements_    incr_test_2020_             decr_hard_reach_2020_   incr_adh_2020_
decr_prob_loss_at_diag_2020_ 	  decr_rate_lost_2020_		    decr_rate_lost_art_2020_    incr_rate_return_2020_     
incr_rate_restart_2020_          incr_rate_init_2020_          decr_rate_int_choice_2020_  incr_prob_vl_meas_done_2020_ 
incr_pr_switch_line_2020_    	 prep_improvements_       	 incr_adh_pattern_prep_2020_     
inc_r_test_startprep_2020_   incr_r_test_restartprep_2020_ decr_r_choose_stop_prep_2020_ 
inc_p_prep_restart_choi_2020_  incr_prepuptake_sw_2020_      incr_prepuptake_pop_2020_   expand_prep_to_all_2020_ 
circ_improvements_ 			  circ_inc_rate_2020_ 		     incr_test_targeting_2020_   option_0_prep_continue_2020_
incr_max_freq_testing_2020_      initial_pr_switch_line_       initial_prob_vl_meas_done_  sw_test_6mthly_2020_  reg_option_switch_2020_
art_mon_drug_levels_2020_  ten_is_taf_2020_		pop_wide_tld_2020_

eff_max_freq_testing_ 		eff_rate_restart_ 		eff_prob_loss_at_diag_ 		eff_rate_lost_ 		eff_prob_lost_art_ 		eff_rate_return_ 			
eff_pr_art_init_ 	eff_rate_int_choice_ 	eff_prob_vl_meas_done_ 		eff_pr_switch_line_ 	eff_rate_test_startprep_ 	eff_rate_test_restartprep_ 	
eff_rate_choose_stop_prep_ 		eff_prob_prep_restart_choice_ 	eff_prepuptake_sw_  eff_prepuptake_pop_	e_decr_hard_reach_2020_	 eff_test_targeting_


/*supp material*/
s_onart_vlg1     s_onart_vlg2     s_onart_vlg3     s_onart_vlg4     s_onart_vlg5    
s_onart_vlg1_r   s_onart_vlg2_r   s_onart_vlg3_r   s_onart_vlg4_r   s_onart_vlg5_r 
s_onart_who4_year1   s_onart_who4_year1_vlt1000  s_onart_who4_year3   s_onart_who4_year3_vlt1000  s_onart_cd4l200_year1  
s_onart_cd4l200_year1_vlt1000  s_onart_cd4l200_year3   s_onart_cd4l200_year3_vlt1000  s_onart_res_1stline_linefail0   
s_onart_res_1stline  s_onart_linefail0  s_onart_linefail0_cl200  s_onart_linefail0_cl50  s_onart_cl50  s_onart_linefail0_vg1000  
s_onart_vg1000   s_onart_linefail0_vg1000_r   s_onart_vg1000_r   s_onart_cl350

s_newpge1_ly_1529m	s_newpge1_ly_1529w

s_m_1524_ge1newpever  s_m_2534_ge1newpever  s_m_3544_ge1newpever  s_m_4554_ge1newpever  s_m_5564_ge1newpever
s_m_1524_ge2newpever  s_m_2534_ge2newpever  s_m_3544_ge2newpever  s_m_4554_ge2newpever  s_m_5564_ge2newpever
s_m_1524_ge5newpever  s_m_2534_ge5newpever  s_m_3544_ge5newpever  s_m_4554_ge5newpever  s_m_5564_ge5newpever
s_w_ge1newpever		  s_w_ge2newpever		s_w_ge5newpever

s_npge1_ly_1564m  s_npge1_ly_1524m  s_npge1_ly_2534m  s_npge1_ly_3544m  s_npge1_ly_4554m  s_npge1_ly_5564m  s_npge1_ly_1564w  s_npge1_ly_1524w  s_npge1_ly_2534w  s_npge1_ly_3544w  s_npge1_ly_4554w  s_npge1_ly_5564w
s_npge2_ly_1564m  s_npge2_ly_1524m  s_npge2_ly_2534m  s_npge2_ly_3544m  s_npge2_ly_4554m  s_npge2_ly_5564m  s_npge2_ly_1564w  s_npge2_ly_1524w  s_npge2_ly_2534w  s_npge2_ly_3544w  s_npge2_ly_4554w  s_npge2_ly_5564w
s_npge10_ly_1564m  s_npge10_ly_1524m  s_npge10_ly_2534m  s_npge10_ly_3544m  s_npge10_ly_4554m  s_npge10_ly_5564m  s_npge10_ly_1564w  s_npge10_ly_1524w  s_npge10_ly_2534w  s_npge10_ly_3544w  s_npge10_ly_4554w  s_npge10_ly_5564w
s_npge50_ly_1564m  s_npge50_ly_1524m  s_npge50_ly_2534m  s_npge50_ly_3544m  s_npge50_ly_4554m  s_npge50_ly_5564m  s_npge50_ly_1564w  s_npge50_ly_1524w  s_npge50_ly_2534w  s_npge50_ly_3544w  s_npge50_ly_4554w  s_npge50_ly_5564w
s_npge1_ly_1564_hivpos  s_npge2_ly_1564_hivpos  s_npge1_ly_1564_hivdiag  s_npge2_ly_1564_hivdiag  s_npge1_ly_1564_hivneg  s_npge2_ly_1564_hivneg

rr_int_tox_   rate_birth_with_infected_child_  nnrti_res_no_effect_  double_rate_gas_tox_taz_   incr_mort_risk_dol_weightg_																		   																											

/* used in abort statements */

prevalence1549  prev_ratio_1524

/* variables created after proc univariate which are used in the body of the program in order to update*/
s_prop_vlg1_rm  s_prop_vlg2_rm  s_prop_vlg3_rm  s_prop_vlg4_rm  s_prop_vlg5_rm  s_prop_vlg6_rm  
s_prop_vlg1_rm0_diag  s_prop_vlg2_rm0_diag  s_prop_vlg3_rm0_diag  s_prop_vlg4_rm0_diag  s_prop_vlg5_rm0_diag  s_prop_vlg6_rm0_diag  
s_prop_vlg1_rm1_diag  s_prop_vlg2_rm1_diag  s_prop_vlg3_rm1_diag  s_prop_vlg4_rm1_diag  s_prop_vlg5_rm1_diag  s_prop_vlg6_rm1_diag  
s_prop_vlg1_rm0_naive  s_prop_vlg2_rm0_naive  s_prop_vlg3_rm0_naive  s_prop_vlg4_rm0_naive  s_prop_vlg5_rm0_naive  s_prop_vlg6_rm0_naive  
s_prop_vlg1_rm1_naive  s_prop_vlg2_rm1_naive  s_prop_vlg3_rm1_naive  s_prop_vlg4_rm1_naive  s_prop_vlg5_rm1_naive  s_prop_vlg6_rm1_naive  
s_prop_tam1   s_prop_tam2   s_prop_tam3  s_prop_k103m  s_prop_y181m  s_prop_g190m   
s_prop_m184m  s_prop_q151m  s_prop_k65m   
s_prop_p32m   s_prop_p33m   s_prop_p46m  s_prop_p47m  s_prop_p50vm   
s_prop_p50lm  s_prop_p54m   s_prop_p76m  s_prop_p82m  s_prop_p84m  s_prop_p88m  s_prop_p90m  s_prop_pim  s_prop_inpm  s_prop_insm   

prevalence1524m  prevalence2534m  prevalence3544m  prevalence4554m  prevalence5564m
prevalence1524w  prevalence2534w  prevalence3544w  prevalence4554w  prevalence5564w
incidence1524m_epnewp  incidence2534m_epnewp  incidence3544m_epnewp  incidence4554m_epnewp  incidence5564m_epnewp
incidence1524w_epnewp  incidence2534w_epnewp  incidence3544w_epnewp  incidence4554w_epnewp  incidence5564w_epnewp

prop_mono_m_1524  prop_mono_m_2534  prop_mono_m_3544  prop_mono_m_4554  prop_mono_m_5564
prop_mono_w_1524  prop_mono_w_2534  prop_mono_w_3544  prop_mono_w_4554  prop_mono_w_5564
s_prop_newp_i_m_1524  s_prop_newp_i_m_2534  s_prop_newp_i_m_3544  s_prop_newp_i_m_4554  s_prop_newp_i_m_5564
s_prop_newp_i_w_1524  s_prop_newp_i_w_2534  s_prop_newp_i_w_3544  s_prop_newp_i_w_4554  s_prop_newp_i_w_5564

d_s_newp

s_prop_ageg1_m_vlg1  s_prop_ageg1_m_vlg2  s_prop_ageg1_m_vlg3   s_prop_ageg1_m_vlg4   s_prop_ageg1_m_vlg5   s_prop_ageg1_m_vlg6  
s_prop_ageg2_m_vlg1  s_prop_ageg2_m_vlg2  s_prop_ageg2_m_vlg3   s_prop_ageg2_m_vlg4   s_prop_ageg2_m_vlg5   s_prop_ageg2_m_vlg6  
s_prop_ageg3_m_vlg1  s_prop_ageg3_m_vlg2  s_prop_ageg3_m_vlg3   s_prop_ageg3_m_vlg4   s_prop_ageg3_m_vlg5   s_prop_ageg3_m_vlg6  
s_prop_ageg4_m_vlg1  s_prop_ageg4_m_vlg2  s_prop_ageg4_m_vlg3   s_prop_ageg4_m_vlg4   s_prop_ageg4_m_vlg5   s_prop_ageg4_m_vlg6  
s_prop_ageg5_m_vlg1  s_prop_ageg5_m_vlg2  s_prop_ageg5_m_vlg3   s_prop_ageg5_m_vlg4   s_prop_ageg5_m_vlg5   s_prop_ageg5_m_vlg6  

s_prop_ageg1_w_vlg1  s_prop_ageg1_w_vlg2  s_prop_ageg1_w_vlg3   s_prop_ageg1_w_vlg4   s_prop_ageg1_w_vlg5   s_prop_ageg1_w_vlg6  
s_prop_ageg2_w_vlg1  s_prop_ageg2_w_vlg2  s_prop_ageg2_w_vlg3   s_prop_ageg2_w_vlg4   s_prop_ageg2_w_vlg5   s_prop_ageg2_w_vlg6  
s_prop_ageg3_w_vlg1  s_prop_ageg3_w_vlg2  s_prop_ageg3_w_vlg3   s_prop_ageg3_w_vlg4   s_prop_ageg3_w_vlg5   s_prop_ageg3_w_vlg6  
s_prop_ageg4_w_vlg1  s_prop_ageg4_w_vlg2  s_prop_ageg4_w_vlg3   s_prop_ageg4_w_vlg4   s_prop_ageg4_w_vlg5   s_prop_ageg4_w_vlg6  
s_prop_ageg5_w_vlg1  s_prop_ageg5_w_vlg2  s_prop_ageg5_w_vlg3   s_prop_ageg5_w_vlg4   s_prop_ageg5_w_vlg5   s_prop_ageg5_w_vlg6  

s_prop_m_vlg1  s_prop_m_vlg2  s_prop_m_vlg3  s_prop_m_vlg4  s_prop_m_vlg5
s_prop_w_vlg1  s_prop_w_vlg2  s_prop_w_vlg3  s_prop_w_vlg4  s_prop_w_vlg5

p_onart_vls  p_onart_epvls  d_vls
p_diag  p_diag_onart  p_diag_eponart  p_diag_m  p_diag_w  p_epdiag_m  p_epdiag_w  d_diag_m  d_diag_w
d_onart

d_hiv_epi_wm  d_hiv_epi_mw  r_hiv_epi_both  r_ep_mw

r_s_ep_m15w15  r_s_ep_m15w25  r_s_ep_m15w35  r_s_ep_m15w45  r_s_ep_m15w55
r_s_ep_m25w15  r_s_ep_m25w25  r_s_ep_m25w35  r_s_ep_m25w45  r_s_ep_m25w55
r_s_ep_m35w15  r_s_ep_m35w25  r_s_ep_m35w35  r_s_ep_m35w45  r_s_ep_m35w55
r_s_ep_m45w15  r_s_ep_m45w25  r_s_ep_m45w35  r_s_ep_m45w45  r_s_ep_m45w55
r_s_ep_m55w15  r_s_ep_m55w25  r_s_ep_m55w35  r_s_ep_m55w45  r_s_ep_m55w55

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r  s_m_newp   s_w_newp
ptnewp15_m  ptnewp25_m  ptnewp35_m  ptnewp45_m  ptnewp55_m
ptnewp15_w  ptnewp25_w  ptnewp35_w  ptnewp45_w  ptnewp55_w

/* keep going - only needed for test runs */

keep_going_1999_  keep_going_2004_  keep_going_2016_  keep_going_2020_  


;



data cum_l&da2; set cum_l&da1 ll;

proc univariate noprint; var s_m_newp s_w_newp ; 
output out=q
sum = s_m_newp s_w_newp  ;

data qq; set q;
if s_w_newp>0 then cum_ratio_newp_mw = s_m_newp / s_w_newp;
run;



/* AP 20-71-19 */

data s;merge f qq;
do i=1 to 100000; 
	n=1; output; 
end; 
drop i;
data r&da2; merge r&da1 s; if age1 >= year_start;


* WHETHER TO KEEP GOING BEYOND 1999;

if &j=40 then do;
incidence1549 = s_primary1549 / (s_alive1549 - s_hiv1549 + s_primary1549);
keep_going_1999=0;
if 0.01 <= prevalence1549 < 0.40 and 0.01 <= incidence1549 and 1/1.2 <= cum_ratio_newp_mw < 1.2 then keep_going_1999=1;
/* if keep_going_1999=0 then do; abort abend; end; */
end;


* WHETHER TO KEEP GOING BEYOND 2004;

if &j=60 then do;
prev_ratio_1524 = prevalence1524w / prevalence1524m ;
incidence1549 = s_primary1549 / (s_alive1549 - s_hiv1549 + s_primary1549);
keep_going_2004=0;
if 0.01 <= prevalence1549 < 0.40 and 0.01 <= incidence1549 and prev_ratio_1524 > 1 and 1/1.2 <= cum_ratio_newp_mw < 1.2 then keep_going_2004=1;
/* if keep_going_2004=0 then do; abort abend; end; */
end;


* WHETHER TO KEEP GOING BEYOND 2016;

if &j=110 then do;
prevalence2024w = s_hiv2024w  / s_ageg2024w ;
prevalence2024m = s_hiv2024m  / s_ageg2024m ;
prevalence2529w = s_hiv2529w  / s_ageg2529w ;
ratio_prev_age2529w_overall = prevalence2529w / prevalence1549 ;  
sex_ratio_prev_age2024 = prevalence2024w / prevalence2024m ;
keep_going_2016=0;
if ratio_prev_age2529w_overall > 0.6 and sex_ratio_prev_age2024 > 1.5 then keep_going_2016=1;
/* if keep_going_2016=0 then do; abort abend; end; */
end;



* WHETHER TO KEEP GOING BEYOND 2020 ;

if &j=122 then do;
incidence1549 = s_primary1549 / (s_alive1549 - s_hiv1549 + s_primary1549);
mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ; p_vl1000 = 1- p_vg1000 ;
if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm_ = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
prop_w_giving_birth_this_per = s_pregnant / s_alive1564_w;
prop_w_1549_sw = s_sw_1549 / s_alive1549_w;

keep_going_2020=0;
if	0.01 	<=	prevalence1549    
and prev_ratio_1524 > 1
and	   	0  	  <	 incidence1549      
and 	0.02  <= mtct_prop < 0.25
and     0.25  <= p_diag 
and     0.68  <= p_diag_onart     
and     0.70  <= p_onart_vl1000 
and     0.35  <= p_vl1000 < 0.82
and  	0.012 <= prop_w_giving_birth_this_per < 0.055
and  0.003 <=  prop_w_1549_sw < 0.03
then keep_going_2020=1;

/*
if keep_going_2020=0 then do; abort abend; end;
*/


end;







if &i ge 2 then do;
drop  sexw&i  onart&i i_rm&i s_infection&i rm_&i primary_ep_w&i primary_ep_m&i np&i nip&i newp_hiv_&i newp&i primary&i v&i
vm&i vc&i c&i cm&i hiv1564_&i cc&i csqr&i ccsqr&i vmax&i cmin&i pcp_p&i adh&i e_adh&i adhmin&i
sw_toxicity&i ch_new_line&i vfail1_&i visit&i lost&i registd&i mcirc&i linefail&i tcur&i artline&i toffart&i stop_tox&i naive&i interrupt&i interrupt_choice&i
interrupt_supply&i  restart&i resumec&i nod&i nonuc&i o_zdv&i   o_3tc&i     o_nevi   o_dar&i   o_efa&i   o_lpr&i  o_taz&i  
o_dol&i   o_ten&i    p_zdv&i   p_3tc&i   p_nev&i   p_dar&i   p_efa&i   p_lpr&i p_taz&i p_dol&i   p_ten&i
tss_zdv&i tss_3tc&i  tss_nev&i  tss_dar&i tss_efa&i tss_lpr&i tss_taz&i tss_dol&i tss_ten&i  f_zdv&i   f_3tc&i   
 f_nev&i   f_dar&i   f_efa&i   f_lpr&i f_taz&i f_dol&i   f_ten&i
mr_zdv&i  mr_3tc&i   mr_nev&i  mr_dar&i  mr_efa&i  mr_lpr&i mr_taz&i mr_dol&i  mr_ten&i   r_zdv&i    r_3tc&i   
r_nev&i   r_dar&i   r_efa&i   r_lpr&i r_taz&i r_dol&i   r_ten&i nactive&i newmut&i 
epvls&i epi&i epart&i ep&i dead1564_&i dead&i ageg&i c_rttams&i c_inpm&i c_insm&i c_rt184m&i c_rt65m&i c_rt151m&i   c_rt103m&i c_rt181m&i c_rt190m&i 
c_pr33m&i c_pr32m&i c_pr47m&i  c_pr46m&i c_pr54m&i c_pr76m&i c_pr50vm&i c_pr50lm&i c_pr82m&i c_pr84m&i c_pr88m&i c_pr90m&i c_totmut&i  e_rttams&i e_inpm&i e_insm&i e_rt184m&i e_rt65m&i 
e_rt151m&i e_rtnucxm&i e_rt103m&i e_rt181m&i e_rt190m&i e_pr33m&i e_pr32m&i e_pr47m&i e_pr46m&i e_pr54m&i e_pr76m&i e_pr50vm&i e_pr50lm&i e_pr82m&i e_pr84m&i e_pr88m&i e_pr90m&i 
e_totmut&i t_zdv&i t_3tc&i t_nev&i t_dar&i t_efa&i t_lpr&i t_taz&i t_dol&i t_ten&i  c_tox&i c_lip&i c_pen&i c_ras&i c_cns&i c_hep&i c_nau&i c_dia&i c_otx&i c_head&i c_ane&i c_lac&i c_neph&i 
x4v&i adc&i   who3_event&i    tb&i  who3_&i who4_&i art_who4_&i            age&i art_who4_&i     artline&i       c_enfm&i 
alive1564&i hiv&i i_m_1524_newp&i i_m_2534_newp&i i_m_3544_newp&i i_m_4554_newp&i i_m_5564_newp&i i_w_1524_newp&i i_w_2534_newp&i i_w_3544_newp&i i_w_4554_newp&i i_w_5564_newp&i 
m_1524_newp&i   m_2534_newp&i   m_3544_newp&i   m_4554_newp&i   m_5564_newp&i   w_1524_newp&i   w_2534_newp&i   w_3544_newp&i   w_4554_newp&i   w_5564_newp&i
vlg1&i    vlg2&i    vlg3&i    vlg4&i    vlg5&i     vlg6&i   tam0_&i tam1_&i tam2_&i tam3_&i m184m_&i 
k103m_&i y181m_&i g190m_&i nnm_&i q151m_&i k65m_&i  p32m_&i p33m_&i p46m_&i p47m_&i 
p50vm_&i p50lm_&i p54m_&i p76m_&i p82m_&i p84m_&i p88m_&i  p90m_&i pim_&i
s_alive1564&i s_i_m_1524_newp&i s_i_m_2534_newp&i s_i_m_3544_newp&i s_i_m_4554_newp&i s_i_m_5564_newp&i  s_i_w_1524_newp&i s_i_w_2534_newp&i s_i_w_3544_newp&i s_i_w_4554_newp&i s_i_w_5564_newp&i 
s_m_1524_newp&i   s_m_2534_newp&i   s_m_3544_newp&i   s_m_4554_newp&i   s_m_5564_newp&i    s_w_1524_newp&i   s_w_2534_newp&i   s_w_3544_newp&i   s_w_4554_newp&i   s_w_5564_newp&i
s_vlg1&i  s_vlg2&i  s_vlg3&i  s_vlg4&i  s_vlg5&i   s_vlg6&i    ep_m&i ep_w&i  ageg1w&i ageg2w&i ageg3w&i ageg4w&i ageg5w&i ageg1m&i ageg2m&i ageg3m&i ageg4m&i ageg5m&i
p_newp_ge1_&i incidence&i prevalence&i death_rate&i death_rate_all&i t_rm&i mean_newp_hiv_&i  p_onart&i p_rm&i  p_vlg1&i      rm_vlg1_&i  
rm_vlg2_&i   rm_vlg3_&i   rm_vlg4_&i       rm_vlg5_&i      rm_vlg6_&i  t_deaths_all&i  t_onart&i  t_primary&i 
newp_ge5_&i   newp_ge1_hiv_diag&i   p_newp_ge1_hiv_diag&i   i_3tcm&i i_pim_&i  newp_ge1_&i  p_r_&i  r_&i  
i_r_vlg1_newp&i  i_r_vlg2_newp&i  i_r_vlg3_newp&i  i_r_vlg4_newp&i  i_r_vlg5_newp&i  i_r_vlg6_newp&i i_m_d_newp&i i_m_newp&i  i_m_p_newp&i  
i_v1_newp&i      i_v2_newp&i      i_v3_newp&i      i_v4_newp&i      i_v5_newp&i      i_v6_newp&i     i_w_d_newp&i i_w_newp&i  i_w_p_newp&i 
 inf_primary&i i_w_np&i i_m_np&i  i_r_vlg1_np&i  i_r_vlg2_np&i  i_r_vlg3_np&i  i_r_vlg4_np&i  i_r_vlg5_np&i  i_r_vlg6_np&i  i_v1_np&i      
i_v2_np&i      i_v3_np&i      i_v4_np&i      i_v5_np&i      i_v6_np&i   
eph0_m&i  eph0_w&i hiv1564_onart&i dead1564_onart&i  i_diag_vlg1_rm0_np&i  i_diag_vlg1_rm1_np&i  
i_diag_vlg2_rm0_np&i  i_diag_vlg2_rm1_np&i  i_diag_vlg3_rm0_np&i  i_diag_vlg3_rm1_np&i  
i_diag_vlg4_rm0_np&i  i_diag_vlg4_rm1_np&i  i_diag_vlg5_rm0_np&i  i_diag_vlg5_rm1_np&i  i_diag_vlg6_rm0_np&i  i_diag_vlg6_rm1_np&i  
i_naive_vlg1_rm0_np&i i_naive_vlg1_rm1_np&i i_naive_vlg2_rm0_np&i i_naive_vlg2_rm1_np&i i_naive_vlg3_rm0_np&i i_naive_vlg3_rm1_np&i 
i_naive_vlg4_rm0_np&i i_naive_vlg4_rm1_np&i i_naive_vlg5_rm0_np&i i_naive_vlg5_rm1_np&i i_naive_vlg6_rm0_np&i i_naive_vlg6_rm1_np&i
i_ep&i diag_ep&i newp_ge1_hiv&i    mr_epi&i mr_epdiag&i 
   elig_treat200&i   elig_treat350&i
hiv1549_&i  newp_ge10_&i  newp_ge50_&i  inf_vlsupp&i   inf_newp&i  inf_ep&i  inf_diag&i inf_naive&i  
ageg1519m&i  ageg2529m&i  ageg3039m&i  ageg4049m&i	ageg1519w&i  ageg2529w&i  ageg3039w&i  ageg4049w&i
hiv1519m_&i 	hiv2529m_&i		hiv3039m_&i		hiv4049m_&i 	hiv1519w_&i 	hiv2529w_&i		hiv3039w_&i		hiv4049w_&i		hiv_sw&i
vm_type&i   return_&i  return_&i  r_dol&i   inf_tdr_vlsupp&i inf_tdr_prim&i
inf_tdr_newp&i  inf_tdr_naive&i   inf_tdr_diag&i   hiv1549m_&i elig_treat500&i     alive1549_m&i
alive1549_w&i  adhm&i  dead5564_all_w&i dead5564_all_m&i dead4554_all_w&i dead4554_all_m&i 
dead3544_all_w&i dead3544_all_m&i dead2534_all_w&i dead2534_all_m&i dead1524_all_w&i dead1524_all_m&i rme_&i
visit_prep&i  sw_&i  ;
end;

if &k ge 2 then do;
drop  sexw&k  onart&k  i_rm&k s_infection&k rm_&k  primary_ep_w&k primary_ep_m&k np&k nip&k newp_hiv_&k newp&k primary&k v&k
vm&k vc&k c&k cm&k hiv1564_&k  cc&k csqr&k ccsqr&k vmax&k cmin&k pcp_p&k adh&k e_adh&k adhmin&k
sw_toxicity&k ch_new_line&k vfail1_&k visit&k lost&k registd&k mcirc&k linefail&k tcur&k artline&k toffart&k stop_tox&k naive&k interrupt&k interrupt_choice&k
interrupt_supply&k  restart&k resumec&k nod&k nonuc&k  o_zdv&k   o_3tc&k    o_nevk   o_dar&k   o_efa&k   o_lpr&k o_taz&k  o_dol&k   
o_ten&k    p_zdv&k   p_3tc&k   p_nev&k   p_dar&k   p_efa&k   p_lpr&k p_taz&k p_dol&k   p_ten&k
tss_zdv&k tss_3tc&k  tss_nev&k  tss_dar&k tss_efa&k tss_lpr&k tss_taz&k tss_dol&k tss_ten&k  f_zdv&k   
f_3tc&k     f_nev&k   f_dar&k   f_efa&k   f_lpr&k f_taz&k f_dol&k   f_ten&k
mr_zdv&k  mr_3tc&k  mr_nev&k  mr_dar&k  mr_efa&k  mr_lpr&k mr_taz&k mr_dol&k  mr_ten&k   r_zdv&k    r_3tc&k   
r_nev&k   r_dar&k   r_efa&k   r_lpr&k r_taz&k r_dol&k   r_ten&k nactive&k newmut&k 
epvls&k epdiag&k epi&k epart&k ep&k dead1564_&k dead&k ageg&k  c_rttams&k c_inpm&k c_insm&k c_rt184m&k  c_rt65m&k c_rt151m&k c_rt103m&k c_rt181m&k c_rt190m&k 
c_pr33m&k c_pr32m&k c_pr47m&k  c_pr46m&k c_pr50vm&k c_pr50lm&k c_pr82m&k
c_pr84m&k c_pr88m&k c_pr90m&k c_totmut&k   e_rttams&k e_inpm&k e_insm&k e_rt184m&k  e_rt65m&k e_rt151m&k 
e_rtnucxm&k e_rt103m&k e_rt181m&k e_rt190m&k  e_pr33m&k e_pr32m&k e_pr47m&k e_pr46m&k  e_pr50vm&k e_pr50lm&k e_pr82m&k e_pr84m&k e_pr88m&k e_pr90m&k 
e_totmut&k t_zdv&k t_3tc&k  t_nev&k t_dar&k t_efa&k t_lpr&k t_taz&k t_dol&k t_ten&k  c_tox&k c_lip&k c_pen&k c_ras&k  c_cns&k c_hep&k 
c_nau&k c_dia&k c_otx&k c_head&k c_ane&k c_lac&k c_neph&k 
x4v&k  adc&k who3_event&k tb&k who3_&k who4_&k art_who4_&k     age&k art_who4_&k artline&k c_enfm&k 
alive1564&k hiv&k i_m_1524_newp&k i_m_2534_newp&k i_m_3544_newp&k i_m_4554_newp&k 
i_m_5564_newp&k i_w_1524_newp&k i_w_2534_newp&k i_w_3544_newp&k i_w_4554_newp&k i_w_5564_newp&k 
m_1524_newp&k   m_2534_newp&k   m_3544_newp&k   m_4554_newp&k   m_5564_newp&k   w_1524_newp&k   w_2534_newp&k   w_3544_newp&k   w_4554_newp&k   w_5564_newp&k
vlg1&k   vlg2&k   vlg3&k   vlg4&k   vlg5&k   vlg6&k  tam0_&k tam1_&k tam2_&k tam3_&k m184m_&k k103m_&k y181m_&k g190m_&k q151m_&k k65m_&k  p32m_&k 
p33m_&k p46m_&k p47m_&k p50vm_&k p50lm_&k p54m_&k p76m_&k p82m_&k p84m_&k p88m_&k p90m_&k pim_&k
s_alive1564&k s_i_m_1524_newp&k  s_i_m_2534_newp&k  s_i_m_3544_newp&k   s_i_m_4554_newp&k  s_i_m_5564_newp&k   s_i_w_1524_newp&k  s_i_w_2534_newp&k  
s_i_w_3544_newp&k  s_i_w_4554_newp&k  s_i_w_5564_newp&k 
s_m_1524_newp&k    s_m_2534_newp&k    s_m_3544_newp&k     s_m_4554_newp&k    s_m_5564_newp&k     
s_w_1524_newp&k    s_w_2534_newp&k    s_w_3544_newp&k    s_w_4554_newp&k    s_w_5564_newp&k
s_vlg1&k s_vlg2&k s_vlg3&k s_vlg4&k s_vlg5&k s_vlg6&k  s_tam0&k s_tam1&k s_tam2&k s_tam3&k s_m184m_&k  s_l151m_&k  s_l65m_&k  s_pim_&k  sti&k 
ep_m&k ep_w&k  ageg1w&k ageg2w&k ageg3w&k ageg4w&k ageg5w&k ageg1m&k ageg2m&k ageg3m&k ageg4m&k ageg5m&k  p_newp_ge1_&k incidence&k 
prevalence&k death_rate&k death_rate_all&k t_rm&k mean_newp_hiv_&k p_onart&k p_rm&k
p_vlg1&k   rm_vlg1_&k rm_vlg2_&k rm_vlg3_&k rm_vlg4_&k rm_vlg5_&k rm_vlg6_&k  t_deaths_all&k  t_onart&k  t_primary&k 
newp_ge5_&k newp_ge1_hiv_diag&k  p_newp_ge1_hiv_diag&k   i_3tcm&k i_pim_&k  newp_ge1_&k  p_r_&k  r_&k  
i_r_vlg1_newp&k  i_r_vlg2_newp&k  i_r_vlg3_newp&k  i_r_vlg4_newp&k  i_r_vlg5_newp&k  i_r_vlg6_newp&k  i_m_d_newp&k  i_m_newp&k  i_m_p_newp&k  
i_v1_newp&k      i_v2_newp&k      i_v3_newp&k      i_v4_newp&k      i_v5_newp&k      i_v6_newp&k      i_w_d_newp&k  i_w_newp&k  i_w_p_newp&k  wealth_created&k
  inf_primary&k  i_w_np&k i_m_np&k  i_r_vlg1_np&k    i_r_vlg2_np&k    i_r_vlg3_np&k    i_r_vlg4_np&k    i_r_vlg5_np&k    i_r_vlg6_np&k    
i_v1_np&k        i_v2_np&k        i_v3_np&k        i_v4_np&k        i_v5_np&k        i_v6_np&k  
eph0_m&k  eph0_w&k hiv1564_onart&k dead1564_onart&k  i_diag_vlg1_rm0_np&k  i_diag_vlg1_rm1_np&k  
i_diag_vlg2_rm0_np&k  i_diag_vlg2_rm1_np&k  i_diag_vlg3_rm0_np&k  i_diag_vlg3_rm1_np&k 
i_diag_vlg4_rm0_np&k  i_diag_vlg4_rm1_np&k  i_diag_vlg5_rm0_np&k  i_diag_vlg5_rm1_np&k  i_diag_vlg6_rm0_np&k  i_diag_vlg6_rm1_np&k  
i_naive_vlg1_rm0_np&k i_naive_vlg1_rm1_np&k i_naive_vlg2_rm0_np&k i_naive_vlg2_rm1_np&k i_naive_vlg3_rm0_np&k i_naive_vlg3_rm1_np&k 
i_naive_vlg4_rm0_np&k i_naive_vlg4_rm1_np&k i_naive_vlg5_rm0_np&k i_naive_vlg5_rm1_np&k i_naive_vlg6_rm0_np&k i_naive_vlg6_rm1_np&k
i_ep&k diag_ep&k newp_ge1_hiv&k prep&k  
m_1524_ep&k m_2534_ep&k m_3544_ep&k m_4554_ep&k m_5564_ep&k
 elig_treat200&k   elig_treat350&k hiv1549_&k  newp_ge10_&k  newp_ge50_&k  inf_vlsupp&k  inf_newp&k   inf_ep&k           inf_diag&k         inf_naive&k 
ageg1519m&k  ageg2529m&k  ageg3039m&k  ageg4049m&k	ageg1519w&k  ageg2529w&k  ageg3039w&k  ageg4049w&k
hiv1519m_&k 	hiv2529m_&k		hiv3039m_&k		hiv4049m_&k 	hiv1519w_&k 	hiv2529w_&k		hiv3039w_&k		hiv4049w_&k		hiv_sw&k
vm_type&k   return_&k  return_&k   r_dol&k  inf_tdr_vlsupp&k inf_tdr_prim&k
inf_tdr_newp&k  inf_tdr_naive&k   inf_tdr_diag&k   hiv1549m_&k elig_treat500&k    alive1549_m&k
alive1549_w&k  adhm&k  dead5564_all_w&k dead5564_all_m&k dead4554_all_w&k dead4554_all_m&k 
 rme_&k
visit_prep&k ;
end;

if &l ge 2 then do;
drop tested&l sexw&l  onart&l  i_rm&l s_infection&l rm_&l  primary_ep_w&l primary_ep_m&l np&l nip&l newp_hiv_&l newp&l primary&l v&l
vm&l vc&l c&l cm&l  hiv1564_&l  cc&l csqr&l ccsqr&l vmax&l cmin&l pcp_p&l adh&l e_adh&l adhmin&l
sw_toxicity&l ch_new_line&l vfail1_&l visit&l lost&l registd&l mcirc&l linefail&l tcur&l artline&l toffart&l stop_tox&l naive&l interrupt&l interrupt_choice&l
interrupt_supply&l restart&l resumec&l nod&l nonuc&l o_zdv&l   o_3tc&l   
o_nevl   o_dar&l   o_efa&l   o_lpr&l o_taz&l  o_dol&l   o_ten&l    p_zdv&l   p_3tc&l   p_nev&l   p_dar&l   p_efa&l   p_lpr&l p_taz&l p_dol&l   p_ten&l
tss_zdv&l tss_3tc&l tss_nev&l tss_dar&l tss_efa&l tss_lpr&l tss_taz&l tss_dol&l tss_ten&l  f_zdv&l   f_3tc&l    f_nev&l  
f_dar&l   f_efa&l   f_lpr&l f_taz&l f_dol&l   f_ten&l
mr_zdv&l  mr_3tc&l  mr_nev&l  mr_dar&l  mr_efa&l  mr_lpr&l mr_taz&l mr_dol&l  mr_ten&l   r_zdv&l   
r_3tc&l  r_nev&l   r_dar&l   r_efa&l   r_lpr&l r_taz&l r_dol&l   r_ten&l nactive&l newmut&l 
epvls&l epdiag&l epi&l epart&l ep&l dead1564_&l dead&l  ageg&l  c_rttams&l c_inpm&l c_insm&l c_rt184m&l  
c_rt65m&l c_rt151m&l   c_rt103m&l c_rt181m&l c_rt190m&l 
c_pr33m&l c_pr32m&l c_pr47m&l  c_pr46m&l c_pr50vm&l c_pr54m&l c_pr50lm&l c_pr76m&l  c_pr82m&l 
c_pr84m&l c_pr88m&l c_pr90m&l c_totmut&l  
e_rttams&l e_inpm&l e_insm&l e_rt184m&l e_rt65m&l e_rt151m&l e_rtnucxm&l e_rt103m&l e_rt181m&l e_rt190m&l e_pr33m&l e_pr32m&l 
e_pr47m&l e_pr46m&l e_pr50vm&l e_pr50lm&l  e_pr54m&l c_pr76m&l e_pr82m&l e_pr84m&l e_pr88m&l e_pr90m&l 
e_totmut&l  t_zdv&l t_3tc&l  t_nev&l t_dar&l t_efa&l t_lpr&l t_taz&l t_dol&l t_ten&l  c_tox&l c_lip&l 
c_pen&l c_ras&l  c_cns&l c_hep&l c_nau&l c_dia&l c_otx&l c_head&l c_ane&l c_lac&l c_neph&l 
x4v&l  adc&l who3_event&l tb&l who3_&l who4_&l art_who4_&l     age&l art_who4_&l artline&l  c_enfm&l  
alive1564&l hiv&l i_m_1524_newp&l i_m_2534_newp&l i_m_3544_newp&l i_m_4554_newp&l i_m_5564_newp&l  
i_w_1524_newp&l i_w_2534_newp&l i_w_3544_newp&l i_w_4554_newp&l i_w_5564_newp&l 
m_1524_newp&l   m_2534_newp&l   m_3544_newp&l   m_4554_newp&l   m_5564_newp&l    w_1524_newp&l   w_2534_newp&l   w_3544_newp&l   w_4554_newp&l   w_5564_newp&l
vlg1&l   vlg2&l   vlg3&l   vlg4&l   vlg5&l   vlg6&l   tam0_&l tam1_&l tam2_&l tam3_&l m184m_&l k103m_&l y181m_&l g190m_&l nnm_&l q151m_&l k65m_&l   p32m_&l p33m_&l p46m_&l 
p47m_&l p50vm_&l p50lm_&l p54m_&l p76m_&l p82m_&l p84m_&l p88m_&l p90m_&l pim_&l  s_alive1564&l 
s_i_m_1524_newp&l s_i_m_2534_newp&l s_i_m_3544_newp&l s_i_m_4554_newp&l s_i_m_5564_newp&l   s_i_w_1524_newp&l s_i_w_2534_newp&l s_i_w_3544_newp&l  s_i_w_4554_newp&l s_i_w_5564_newp&l 
s_m_1524_newp&l   s_m_2534_newp&l   s_m_3544_newp&l   s_m_4554_newp&l   s_m_5564_newp&l     s_w_1524_newp&l   s_w_2534_newp&l   s_w_3544_newp&l    s_w_4554_newp&l   s_w_5564_newp&l
s_vlg1&l s_vlg2&l s_vlg3&l s_vlg4&l s_vlg5&l s_vlg6&l  s_tam0&l s_tam1&l s_tam2&l s_tam3&l s_m184m_&l   s_l65m_&l s_l151m_&l s_pim_&l   sti&l 
ep_m&l ep_w&l ageg1w&l ageg2w&l ageg3w&l ageg4w&l ageg5w&l ageg1m&l ageg2m&l ageg3m&l ageg4m&l ageg5m&l  p_newp_ge1_&l incidence&l prevalence&l death_rate&l death_rate_all&l t_rm&l   mean_newp_hiv_&l p_onart&l p_rm&l
p_vlg1&l   rm_vlg1_&l rm_vlg2_&l rm_vlg3_&l rm_vlg4_&l rm_vlg5_&l rm_vlg6_&l  t_deaths_all&l  t_onart&l  t_primary&l newp_ge5_&l newp_ge1_hiv_diag&l  p_newp_ge1_hiv_diag&l  i_3tcm&l i_pim_&l  newp_ge1_&l  
p_r_&l  r_&l  
i_r_vlg1_newp&l  i_r_vlg2_newp&l  i_r_vlg3_newp&l  i_r_vlg4_newp&l  i_r_vlg5_newp&l  i_r_vlg6_newp&l   i_m_d_newp&l  i_m_newp&l  i_m_p_newp&l  
i_v1_newp&l      i_v2_newp&l      i_v3_newp&l      i_v4_newp&l      i_v5_newp&l      i_v6_newp&l       i_w_d_newp&l  i_w_newp&l  i_w_p_newp&l wealth_created&l
  inf_primary&l  i_w_np&l   i_m_np&l i_r_vlg1_np&l   i_r_vlg2_np&l     i_r_vlg3_np&l    i_r_vlg4_np&l    i_r_vlg5_np&l    i_r_vlg6_np&l     i_v1_np&l  i_v2_np&l  i_v3_np&l  i_v4_np&l  i_v5_np&l  i_v6_np&l  
eph0_m&l  eph0_w&l   hiv1564_onart&l  dead1564_onart&l  i_diag_vlg1_rm0_np&l  i_diag_vlg1_rm1_np&l  i_diag_vlg2_rm0_np&l  i_diag_vlg2_rm1_np&l  i_diag_vlg3_rm0_np&l i_diag_vlg3_rm1_np&l 
i_diag_vlg4_rm0_np&l  i_diag_vlg4_rm1_np&l  i_diag_vlg5_rm0_np&l  i_diag_vlg5_rm1_np&l  i_diag_vlg6_rm0_np&l i_diag_vlg6_rm1_np&l 
i_naive_vlg1_rm0_np&l i_naive_vlg1_rm1_np&l i_naive_vlg2_rm0_np&l i_naive_vlg2_rm1_np&l i_naive_vlg3_rm0_np&l i_naive_vlg3_rm1_np&l 
i_naive_vlg4_rm0_np&l i_naive_vlg4_rm1_np&l i_naive_vlg5_rm0_np&l i_naive_vlg5_rm1_np&l i_naive_vlg6_rm0_np&l i_naive_vlg6_rm1_np&l
i_ep&l diag_ep&l newp_ge1_hiv&l prep&l hiv1564m_&l  hiv1564w_&l      
 elig_treat200&l   elig_treat350&l hiv1549_&l    newp_ge10_&l  newp_ge50_&l  inf_vlsupp&l  inf_newp&l inf_ep&l inf_diag&l inf_naive&l  alive1549&l c_pr50lm&l c_pr76m&l inpm_&l insm_&l e_pr76m&l
ageg1519m&l  ageg2529m&l  ageg3039m&l  ageg4049m&l	ageg1519w&l  ageg2529w&l  ageg3039w&l  ageg4049w&l	
hiv1519m_&l 	hiv2529m_&l		hiv3039m_&l		hiv4049m_&l 	hiv1519w_&l 	hiv2529w_&l		hiv3039w_&l		hiv4049w_&l		hiv_sw&l
vm_type&l   return_&l  return_&l  r_dol&l  inf_tdr_vlsupp&l inf_tdr_prim&l
inf_tdr_newp&l  inf_tdr_naive&l   inf_tdr_diag&l   hiv1549m_&l elig_treat500&l    alive1549_m&l
alive1549_w&l   adhm&l  dead5564_all_w&l dead5564_all_m&l dead4554_all_w&l dead4554_all_m&l 
 rme_&l
visit_prep&l   sw&l  

primary&l 		
primary_ep_m&l  primary_ep_w&l

i_v1_age1_w_np&l i_v1_age2_w_np&l i_v1_age3_w_np&l i_v1_age4_w_np&l i_v1_age5_w_np&l 
i_v1_age1_m_np&l i_v1_age2_m_np&l i_v1_age3_m_np&l i_v1_age4_m_np&l i_v1_age5_m_np&l 
i_v1_age1_w_newp&l i_v1_age2_w_newp&l i_v1_age3_w_newp&l i_v1_age4_w_newp&l i_v1_age5_w_newp&l 
i_v1_age1_m_newp&l i_v1_age2_m_newp&l i_v1_age3_m_newp&l i_v1_age4_m_newp&l i_v1_age5_m_newp&l 
i_v1_age1_w_ep&l i_v1_age2_w_ep&l i_v1_age3_w_ep&l i_v1_age4_w_ep&l i_v1_age5_w_ep&l 
i_v1_age1_m_ep&l i_v1_age2_m_ep&l i_v1_age3_m_ep&l i_v1_age4_m_ep&l i_v1_age5_m_ep&l 

i_v2_age1_w_np&l i_v2_age2_w_np&l i_v2_age3_w_np&l i_v2_age4_w_np&l i_v2_age5_w_np&l 
i_v2_age1_m_np&l i_v2_age2_m_np&l i_v2_age3_m_np&l i_v2_age4_m_np&l i_v2_age5_m_np&l 
i_v2_age1_w_newp&l i_v2_age2_w_newp&l i_v2_age3_w_newp&l i_v2_age4_w_newp&l i_v2_age5_w_newp&l 
i_v2_age1_m_newp&l i_v2_age2_m_newp&l i_v2_age3_m_newp&l i_v2_age4_m_newp&l i_v2_age5_m_newp&l 
i_v2_age1_w_ep&l i_v2_age2_w_ep&l i_v2_age3_w_ep&l i_v2_age4_w_ep&l i_v2_age5_w_ep&l 
i_v2_age1_m_ep&l i_v2_age2_m_ep&l i_v2_age3_m_ep&l i_v2_age4_m_ep&l i_v2_age5_m_ep&l 

i_v3_age1_w_np&l i_v3_age2_w_np&l i_v3_age3_w_np&l i_v3_age4_w_np&l i_v3_age5_w_np&l 
i_v3_age1_m_np&l i_v3_age2_m_np&l i_v3_age3_m_np&l i_v3_age4_m_np&l i_v3_age5_m_np&l 
i_v3_age1_w_newp&l i_v3_age2_w_newp&l i_v3_age3_w_newp&l i_v3_age4_w_newp&l i_v3_age5_w_newp&l 
i_v3_age1_m_newp&l i_v3_age2_m_newp&l i_v3_age3_m_newp&l i_v3_age4_m_newp&l i_v3_age5_m_newp&l 
i_v3_age1_w_ep&l i_v3_age2_w_ep&l i_v3_age3_w_ep&l i_v3_age4_w_ep&l i_v3_age5_w_ep&l 
i_v3_age1_m_ep&l i_v3_age2_m_ep&l i_v3_age3_m_ep&l i_v3_age4_m_ep&l i_v3_age5_m_ep&l 

i_v4_age1_w_np&l i_v4_age2_w_np&l i_v4_age3_w_np&l i_v4_age4_w_np&l i_v4_age5_w_np&l 
i_v4_age1_m_np&l i_v4_age2_m_np&l i_v4_age3_m_np&l i_v4_age4_m_np&l i_v4_age5_m_np&l 
i_v4_age1_w_newp&l i_v4_age2_w_newp&l i_v4_age3_w_newp&l i_v4_age4_w_newp&l i_v4_age5_w_newp&l 
i_v4_age1_m_newp&l i_v4_age2_m_newp&l i_v4_age3_m_newp&l i_v4_age4_m_newp&l i_v4_age5_m_newp&l 
i_v4_age1_w_ep&l i_v4_age2_w_ep&l i_v4_age3_w_ep&l i_v4_age4_w_ep&l i_v4_age5_w_ep&l 
i_v4_age1_m_ep&l i_v4_age2_m_ep&l i_v4_age3_m_ep&l i_v4_age4_m_ep&l i_v4_age5_m_ep&l 

i_v5_age1_w_np&l i_v5_age2_w_np&l i_v5_age3_w_np&l i_v5_age4_w_np&l i_v5_age5_w_np&l 
i_v5_age1_m_np&l i_v5_age2_m_np&l i_v5_age3_m_np&l i_v5_age4_m_np&l i_v5_age5_m_np&l 
i_v5_age1_w_newp&l i_v5_age2_w_newp&l i_v5_age3_w_newp&l i_v5_age4_w_newp&l i_v5_age5_w_newp&l 
i_v5_age1_m_newp&l i_v5_age2_m_newp&l i_v5_age3_m_newp&l i_v5_age4_m_newp&l i_v5_age5_m_newp&l 
i_v5_age1_w_ep&l i_v5_age2_w_ep&l i_v5_age3_w_ep&l i_v5_age4_w_ep&l i_v5_age5_w_ep&l 
i_v5_age1_m_ep&l i_v5_age2_m_ep&l i_v5_age3_m_ep&l i_v5_age4_m_ep&l i_v5_age5_m_ep&l 

i_v6_age1_w_np&l i_v6_age2_w_np&l i_v6_age3_w_np&l i_v6_age4_w_np&l i_v6_age5_w_np&l 
i_v6_age1_m_np&l i_v6_age2_m_np&l i_v6_age3_m_np&l i_v6_age4_m_np&l i_v6_age5_m_np&l 
i_v6_age1_w_newp&l i_v6_age2_w_newp&l i_v6_age3_w_newp&l i_v6_age4_w_newp&l i_v6_age5_w_newp&l 
i_v6_age1_m_newp&l i_v6_age2_m_newp&l i_v6_age3_m_newp&l i_v6_age4_m_newp&l i_v6_age5_m_newp&l 
i_v6_age1_w_ep&l i_v6_age2_w_ep&l i_v6_age3_w_ep&l i_v6_age4_w_ep&l i_v6_age5_w_ep&l 
i_v6_age1_m_ep&l i_v6_age2_m_ep&l i_v6_age3_m_ep&l i_v6_age4_m_ep&l i_v6_age5_m_ep&l 

i_age1_m_np&l	i_age2_m_np&l	i_age3_m_np&l	i_age4_m_np&l	i_age5_m_np&l
i_age1_w_np&l	i_age2_w_np&l	i_age3_w_np&l	i_age4_w_np&l	i_age5_w_np&l
i_age1_m_newp&l i_age2_m_newp&l	i_age3_m_newp&l	i_age4_m_newp&l	i_age5_m_newp&l
i_age1_w_newp&l	i_age2_w_newp&l	i_age3_w_newp&l	i_age4_w_newp&l	i_age5_w_newp&l

i_fsw_v1_np&l 	i_fsw_v2_np&l   i_fsw_v3_np&l	i_fsw_v4_np&l  	i_fsw_v5_np&l	i_fsw_v6_np&l
i_v1_ep&l 		i_v2_ep&l 		i_v3_ep&l 		i_v4_ep&l 		i_v5_ep&l  		i_v6_ep&l
i_v1_newp&l 	i_v2_newp&l 	i_v3_newp&l 	i_v4_newp&l 	i_v5_newp&l  	i_v6_newp&l

dead_w&l 
dead1564_all_&l	  dead1564m_all_&l  dead1564w_all_&l
dead1519m_all_&l  dead2024m_all_&l  dead2529m_all_&l  dead3034m_all_&l  dead3539m_all_&l dead4044m_all_&l  dead4549m_all_&l
dead1519w_all_&l  dead2024w_all_&l  dead2529w_all_&l  dead3034w_all_&l  dead3539w_all_&l dead4044w_all_&l  dead4549w_all_&l

 alive1564_w&l  alive1564_m&l

ageg8084w&l 

alive1549&l	 	alive1549_w&l	alive1549_m&l   alive1564&l	 	alive1564_w&l	alive1564_m&l 
ageg1517m&l		ageg1819m&l		ageg1519m&l  	ageg2024m&l		ageg2529m&l  	ageg3034m&l		ageg3539m&l		ageg4044m&l	
ageg4549m&l		ageg5054m&l 	ageg5559m&l		ageg6064m&l		ageg1564m&l		ageg1549m&l		
ageg1517w&l		ageg1819w&l		ageg1519w&l  	ageg2024w&l		ageg2529w&l  	ageg3034w&l		ageg3539w&l		ageg4044w&l	
ageg4549w&l		ageg5054w&l 	ageg5559w&l		ageg6064w&l		ageg1564w&l		ageg1549w&l		
ageg1m&l 	ageg2m&l	ageg3m&l	ageg4m&l 	ageg5m&l 	ageg1w&l 	ageg2w&l	 ageg3w&l 	ageg4w&l 	ageg5w&l 

mr_epi&l  mr_epdiag&l
	
;  
end;

if &b ge 2 then do;
drop  sexw&b  onart&b  i_rm&b s_infection&b rm_&b  primary_ep_w&b primary_ep_m&b np&b nip&b newp_hiv_&b primary&b v&b
vm&b vc&b c&b cm&b  hiv1564_&b  cc&b csqr&b ccsqr&b vmax&b pcp_p&b adh&b e_adh&b adhmin&b
sw_toxicity&b ch_new_line&b vfail1_&b lost&b registd&b mcirc&b linefail&b tcur&b artline&b toffart&b stop_tox&b naive&b interrupt&b interrupt_choice&b
interrupt_supply&b  restart&b resumec&b nod&b nonuc&b  o_zdv&b   o_3tc&b    o_nevb   o_dar&b   o_efa&b   o_lpr&b o_taz&b  o_dol&b  
o_ten&b    p_zdv&b   p_3tc&b  p_nev&b   p_dar&b   p_efa&b   p_lpr&b p_taz&b p_dol&b   p_ten&b
tss_zdv&b tss_3tc&b tss_nev&b tss_dar&b tss_efa&b tss_lpr&b tss_taz&b tss_dol&b tss_ten&b  f_zdv&b  
f_3tc&b   f_nev&b   f_dar&b   f_efa&b   f_lpr&b f_taz&b f_dol&b   f_ten&b
mr_zdv&b  mr_3tc&b  mr_nev&b  mr_dar&b  mr_efa&b  mr_lpr&b mr_taz&b mr_dol&b  mr_ten&b   r_zdv&b    
r_3tc&b   r_nev&b   r_dar&b   r_efa&b   r_lpr&b r_taz&b r_dol&b   r_ten&b nactive&b newmut&b 
epvls&b epi&b epart&b dead1564_&b dead&b  ageg&b  c_rttams&b c_inpm&b c_insm&b c_rt184m&b  c_rt65m&b c_rt151m&b  c_rt103m&b c_rt181m&b c_rt190m&b 
c_pr33m&b c_pr32m&b c_pr47m&b  c_pr46m&b c_pr50vm&b c_pr50lm&b c_pr82m&b c_pr84m&b c_pr88m&b c_pr90m&b c_totmut&b  
e_rttams&b e_inpm&b e_insm&b e_rt184m&b e_rt65m&b e_rt151m&b e_rtnucxm&b e_rt103m&b e_rt181m&b e_rt190m&b e_pr33m&b e_pr32m&b 
e_pr47m&b e_pr46m&b e_pr50vm&b e_pr50lm&b e_pr82m&b e_pr84m&b e_pr88m&b e_pr90m&b 
e_totmut&b t_zdv&b t_3tc&b  t_nev&b t_dar&b t_efa&b t_lpr&b t_taz&b t_dol&b t_ten&b c_tox&b c_lip&b 
c_pen&b c_ras&b  c_cns&b c_hep&b c_nau&b c_dia&b c_otx&b c_head&b c_ane&b c_lac&b c_neph&b 
x4v&b  adc&b who3_event&b tb&b who3_&b who4_&b art_who4_&b    age&b  art_who4_&b artline&b  
c_enfm&b alive1564&b hiv&b i_m_1524_newp&b i_m_2534_newp&b i_m_3544_newp&b i_m_4554_newp&b 
i_m_5564_newp&b i_w_1524_newp&b i_w_2534_newp&b i_w_3544_newp&b i_w_4554_newp&b i_w_5564_newp&b 
m_1524_newp&b   m_2534_newp&b   m_3544_newp&b   m_4554_newp&b   m_5564_newp&b   w_1524_newp&b   w_2534_newp&b   w_3544_newp&b   w_4554_newp&b   w_5564_newp&b
vlg1&b vlg2&b vlg3&b vlg4&b vlg5&b vlg6&b tam0_&b tam1_&b tam2_&b tam3_&b m184m_&b k103m_&b y181m_&b g190m_&b nnm_&b q151m_&b k65m_&b  
 p32m_&b p33m_&b p46m_&b p47m_&b  p50vm_&b p50lm_&b p54m_&b p76m_&b p82m_&b p84m_&b p88m_&b p90m_&b pim_&b
s_alive1564&b s_i_m_1524_newp&b s_i_m_2534_newp&b s_i_m_3544_newp&b s_i_m_4554_newp&b s_i_m_5564_newp&b  
s_i_w_1524_newp&b s_i_w_2534_newp&b s_i_w_3544_newp&b  s_i_w_4554_newp&b s_i_w_5564_newp&b 
s_m_1524_newp&b   s_m_2534_newp&b   s_m_3544_newp&b   s_m_4554_newp&b  
s_m_5564_newp&b    s_w_1524_newp&b   s_w_2534_newp&b   s_w_3544_newp&b    s_w_4554_newp&b   s_w_5564_newp&b
s_vlg1&b  s_vlg2&b  s_vlg3&b  s_vlg4&b  s_vlg5&b s_vlg6&b s_tam0&b  s_tam1&b  s_tam2&b s_tam3&b s_m184m_&b s_l65m_&b s_l151m_&b  s_pim_&b   sti&b 
ep_m&b ep_w&b ageg1w&b ageg2w&b ageg3w&b ageg4w&b ageg5w&b ageg1m&b ageg2m&b ageg3m&b ageg4m&b ageg5m&b 
p_newp_ge1_&b incidence&b prevalence&b death_rate&b death_rate_all&b t_rm&b  mean_newp_hiv_&b p_onart&b p_rm&b
p_vlg1&b   rm_vlg1_&b rm_vlg2_&b rm_vlg3_&b rm_vlg4_&b rm_vlg5_&b rm_vlg6_&b  t_deaths_all&b  t_onart&b  t_primary&b  newp_ge5_&b newp_ge1_hiv_diag&b p_newp_ge1_hiv_diag&b 
i_3tcm&b i_pim_&b  newp_ge1_&b  p_r_&b  r_&b    
i_r_vlg1_newp&b i_r_vlg2_newp&b i_r_vlg3_newp&b i_r_vlg4_newp&b i_r_vlg5_newp&b i_r_vlg6_newp&b  i_m_d_newp&b i_m_newp&b  i_m_p_newp&b  
i_v1_newp&b     i_v2_newp&b     i_v3_newp&b     i_v4_newp&b     i_v5_newp&b     i_v6_newp&b      i_w_d_newp&b i_w_newp&b  i_w_p_newp&b  wealth_created&b 
   inf_primary&b   i_w_np&b i_m_np&b  i_r_vlg1_np&b   i_r_vlg2_np&b   i_r_vlg3_np&b   i_r_vlg4_np&b   i_r_vlg5_np&b   i_r_vlg6_np&b    
i_v1_np&b       i_v2_np&b       i_v3_np&b       i_v4_np&b       i_v5_np&b       i_v6_np&b  
eph0_m&b  eph0_w&b  hiv1564_onart&b dead1564_onart&b  i_diag_vlg1_rm0_np&b  i_diag_vlg1_rm1_np&b  
i_diag_vlg2_rm0_np&b  i_diag_vlg2_rm1_np&b  i_diag_vlg3_rm0_np&b  i_diag_vlg3_rm1_np&b 
i_diag_vlg4_rm0_np&b  i_diag_vlg4_rm1_np&b  i_diag_vlg5_rm0_np&b  i_diag_vlg5_rm1_np&b  i_diag_vlg6_rm0_np&b  i_diag_vlg6_rm1_np&b 
i_naive_vlg1_rm0_np&b i_naive_vlg1_rm1_np&b i_naive_vlg2_rm0_np&b i_naive_vlg2_rm1_np&b i_naive_vlg3_rm0_np&b i_naive_vlg3_rm1_np&b 
i_naive_vlg4_rm0_np&b i_naive_vlg4_rm1_np&b i_naive_vlg5_rm0_np&b i_naive_vlg5_rm1_np&b i_naive_vlg6_rm0_np&b i_naive_vlg6_rm1_np&b
i_ep&b diag_ep&b newp_ge1_hiv&b   mr_epi&b mr_epdiag&b 
elig_treat200&b   elig_treat350&b
hiv1549_&b  newp_ge10_&b  newp_ge50_&b  inf_vlsupp&b inf_newp&b inf_ep&b inf_diag&b inf_naive&b
ageg1519m&b  ageg2529m&b  ageg3039m&b  ageg4049m&b	ageg1519w&b  ageg2529w&b  ageg3039w&b  ageg4049w&b	
hiv1519m_&b 	hiv2529m_&b		hiv3039m_&b		hiv4049m_&b 	hiv1519w_&b 	hiv2529w_&b		hiv3039w_&b		hiv4049w_&b		hiv_sw&b
vm_type&b   return_&b  return_&b  r_dol&b inf_tdr_vlsupp&b inf_tdr_prim&b
inf_tdr_newp&b  inf_tdr_naive&b   inf_tdr_diag&b   hiv1549m_&b elig_treat500&b   alive1549_m&b
alive1549_w&b  adhm&b  dead5564_all_w&b dead5564_all_m&b dead4554_all_w&b dead4554_all_m&b 
dead3544_all_w&b dead3544_all_m&b dead2534_all_w&b dead2534_all_m&b dead1524_all_w&b dead1524_all_m&b rme_&b


i_v1_age1_w_np&b i_v1_age2_w_np&b i_v1_age3_w_np&b i_v1_age4_w_np&b i_v1_age5_w_np&b 
i_v1_age1_m_np&b i_v1_age2_m_np&b i_v1_age3_m_np&b i_v1_age4_m_np&b i_v1_age5_m_np&b 
i_v1_age1_w_newp&b i_v1_age2_w_newp&b i_v1_age3_w_newp&b i_v1_age4_w_newp&b i_v1_age5_w_newp&b 
i_v1_age1_m_newp&b i_v1_age2_m_newp&b i_v1_age3_m_newp&b i_v1_age4_m_newp&b i_v1_age5_m_newp&b 
i_v1_age1_w_ep&b i_v1_age2_w_ep&b i_v1_age3_w_ep&b i_v1_age4_w_ep&b i_v1_age5_w_ep&b 
i_v1_age1_m_ep&b i_v1_age2_m_ep&b i_v1_age3_m_ep&b i_v1_age4_m_ep&b i_v1_age5_m_ep&b 

i_v2_age1_w_np&b i_v2_age2_w_np&b i_v2_age3_w_np&b i_v2_age4_w_np&b i_v2_age5_w_np&b 
i_v2_age1_m_np&b i_v2_age2_m_np&b i_v2_age3_m_np&b i_v2_age4_m_np&b i_v2_age5_m_np&b 
i_v2_age1_w_newp&b i_v2_age2_w_newp&b i_v2_age3_w_newp&b i_v2_age4_w_newp&b i_v2_age5_w_newp&b 
i_v2_age1_m_newp&b i_v2_age2_m_newp&b i_v2_age3_m_newp&b i_v2_age4_m_newp&b i_v2_age5_m_newp&b 
i_v2_age1_w_ep&b i_v2_age2_w_ep&b i_v2_age3_w_ep&b i_v2_age4_w_ep&b i_v2_age5_w_ep&b 
i_v2_age1_m_ep&b i_v2_age2_m_ep&b i_v2_age3_m_ep&b i_v2_age4_m_ep&b i_v2_age5_m_ep&b 

i_v3_age1_w_np&b i_v3_age2_w_np&b i_v3_age3_w_np&b i_v3_age4_w_np&b i_v3_age5_w_np&b 
i_v3_age1_m_np&b i_v3_age2_m_np&b i_v3_age3_m_np&b i_v3_age4_m_np&b i_v3_age5_m_np&b 
i_v3_age1_w_newp&b i_v3_age2_w_newp&b i_v3_age3_w_newp&b i_v3_age4_w_newp&b i_v3_age5_w_newp&b 
i_v3_age1_m_newp&b i_v3_age2_m_newp&b i_v3_age3_m_newp&b i_v3_age4_m_newp&b i_v3_age5_m_newp&b 
i_v3_age1_w_ep&b i_v3_age2_w_ep&b i_v3_age3_w_ep&b i_v3_age4_w_ep&b i_v3_age5_w_ep&b 
i_v3_age1_m_ep&b i_v3_age2_m_ep&b i_v3_age3_m_ep&b i_v3_age4_m_ep&b i_v3_age5_m_ep&b 

i_v4_age1_w_np&b i_v4_age2_w_np&b i_v4_age3_w_np&b i_v4_age4_w_np&b i_v4_age5_w_np&b 
i_v4_age1_m_np&b i_v4_age2_m_np&b i_v4_age3_m_np&b i_v4_age4_m_np&b i_v4_age5_m_np&b 
i_v4_age1_w_newp&b i_v4_age2_w_newp&b i_v4_age3_w_newp&b i_v4_age4_w_newp&b i_v4_age5_w_newp&b 
i_v4_age1_m_newp&b i_v4_age2_m_newp&b i_v4_age3_m_newp&b i_v4_age4_m_newp&b i_v4_age5_m_newp&b 
i_v4_age1_w_ep&b i_v4_age2_w_ep&b i_v4_age3_w_ep&b i_v4_age4_w_ep&b i_v4_age5_w_ep&b 
i_v4_age1_m_ep&b i_v4_age2_m_ep&b i_v4_age3_m_ep&b i_v4_age4_m_ep&b i_v4_age5_m_ep&b 

i_v5_age1_w_np&b i_v5_age2_w_np&b i_v5_age3_w_np&b i_v5_age4_w_np&b i_v5_age5_w_np&b 
i_v5_age1_m_np&b i_v5_age2_m_np&b i_v5_age3_m_np&b i_v5_age4_m_np&b i_v5_age5_m_np&b 
i_v5_age1_w_newp&b i_v5_age2_w_newp&b i_v5_age3_w_newp&b i_v5_age4_w_newp&b i_v5_age5_w_newp&b 
i_v5_age1_m_newp&b i_v5_age2_m_newp&b i_v5_age3_m_newp&b i_v5_age4_m_newp&b i_v5_age5_m_newp&b 
i_v5_age1_w_ep&b i_v5_age2_w_ep&b i_v5_age3_w_ep&b i_v5_age4_w_ep&b i_v5_age5_w_ep&b 
i_v5_age1_m_ep&b i_v5_age2_m_ep&b i_v5_age3_m_ep&b i_v5_age4_m_ep&b i_v5_age5_m_ep&b 

i_v6_age1_w_np&b i_v6_age2_w_np&b i_v6_age3_w_np&b i_v6_age4_w_np&b i_v6_age5_w_np&b 
i_v6_age1_m_np&b i_v6_age2_m_np&b i_v6_age3_m_np&b i_v6_age4_m_np&b i_v6_age5_m_np&b 
i_v6_age1_w_newp&b i_v6_age2_w_newp&b i_v6_age3_w_newp&b i_v6_age4_w_newp&b i_v6_age5_w_newp&b 
i_v6_age1_m_newp&b i_v6_age2_m_newp&b i_v6_age3_m_newp&b i_v6_age4_m_newp&b i_v6_age5_m_newp&b 
i_v6_age1_w_ep&b i_v6_age2_w_ep&b i_v6_age3_w_ep&b i_v6_age4_w_ep&b i_v6_age5_w_ep&b 
i_v6_age1_m_ep&b i_v6_age2_m_ep&b i_v6_age3_m_ep&b i_v6_age4_m_ep&b i_v6_age5_m_ep&b 

	i_age1_m_np&b i_age2_m_np&b	i_age3_m_np&b	i_age4_m_np&b	i_age5_m_np&b
	i_age1_w_np&b	i_age2_w_np&b	i_age3_w_np&b	i_age4_w_np&b	i_age5_w_np&b
visit_prep&b 
;
end;




if &a ge 2 then do;
drop  sexw&a  onart&a i_rm&a s_infection&a rm_&a  primary_ep_w&a primary_ep_m&a np&a nip&a newp_hiv_&a primary&a v&a
vm&a vc&a c&a  hiv1564_&a  cc&a csqr&a ccsqr&a vmax&a pcp_p&a adh&a e_adh&a adhmin&a sw_toxicity&a ch_new_line&a vfail1_&a  lost&a registd&a   
mcirc&a linefail&a tcur&a artline&a toffart&a stop_tox&a naive&a interrupt&a interrupt_choice&a
interrupt_supply&a  restart&a  nod&a nonuc&a  o_zdv&a   o_3tc&a    o_neva   o_dar&a   o_efa&a   o_lpr&a o_taz&a  o_dol&a  
o_ten&a    p_zdv&a   p_3tc&a   p_nev&a   p_dar&a   p_efa&a   p_lpr&a p_taz&a p_dol&a   p_ten&a
tss_zdv&a tss_3tc&a  tss_nev&a  tss_dar&a tss_efa&a tss_lpr&a tss_taz&a tss_dol&a tss_ten&a 
f_zdv&a   f_3tc&a   f_nev&a   f_dar&a   f_efa&a   f_lpr&a f_taz&a f_dol&a   f_ten&a
mr_zdv&a  mr_3tc&a   mr_nev&a  mr_dar&a  mr_efa&a  mr_lpr&a mr_taz&a mr_dol&a  mr_ten&a   r_zdv&a    r_3tc&a   
r_nev&a   r_dar&a   r_efa&a   r_lpr&a r_taz&a r_dol&a   r_ten&a nactive&a newmut&a 
epvls&a epi&a epart&a dead1564_&a dead&a  ageg&a c_rttams&a c_inpm&a c_insm&a c_rt184m&a  c_rt65m&a c_rt151m&a  c_rt103m&a c_rt181m&a c_rt190m&a 
c_pr33m&a c_pr32m&a c_pr47m&a  c_pr46m&a  c_pr50vm&a c_pr50lm&a c_pr82m&a c_pr84m&a c_pr88m&a c_pr90m&a  c_totmut&a  e_rttams&a
e_inpm&a e_insm&a e_rt184m&a  e_rt65m&a e_rt151m&a e_rtnucxm&a e_rt103m&a e_rt181m&a e_rt190m&a
e_pr33m&a e_pr32m&a e_pr47m&a e_pr46m&a e_pr50vm&a e_pr50lm&a e_pr82m&a e_pr84m&a e_pr88m&a e_pr90m&a 
e_totmut&a t_zdv&a t_3tc&a t_nev&a t_dar&a t_efa&a t_lpr&a t_taz&a t_dol&a t_ten&a  c_tox&a c_lip&a c_pen&a c_ras&a c_cns&a c_hep&a
c_nau&a c_dia&a c_otx&a c_head&a c_ane&a c_lac&a c_neph&a 
x4v&a adc&a who3_event&a      who3_&a who4_&a art_who4_&a  age&a art_who4_&a artline&a c_enfm&a  alive1564&a hiv&a i_m_1524_newp&a i_m_2534_newp&a i_m_3544_newp&a 
i_m_4554_newp&a i_m_5564_newp&a  i_w_1524_newp&a i_w_2534_newp&a i_w_3544_newp&a i_w_4554_newp&a i_w_5564_newp&a 
m_1524_newp&a   m_2534_newp&a   m_3544_newp&a   m_4554_newp&a   m_5564_newp&a    w_1524_newp&a   w_2534_newp&a   w_3544_newp&a   w_4554_newp&a   w_5564_newp&a
vlg1&a vlg2&a vlg3&a vlg4&a vlg5&a vlg6&a tam0_&a tam1_&a tam2_&a tam3_&a m184m_&a 
k103m_&a y181m_&a g190m_&a nnm_&a q151m_&a k65m_&a   p32m_&a p33m_&a p46m_&a p47m_&a 
 p50vm_&a p50lm_&a p54m_&a p76m_&a p82m_&a p84m_&a p88m_&a p90m_&a pim_&a
s_alive1564&a s_i_m_1524_newp&a s_i_m_2534_newp&a s_i_m_3544_newp&a s_i_m_4554_newp&a s_i_m_5564_newp&a   
s_i_w_1524_newp&a s_i_w_2534_newp&a s_i_w_3544_newp&a s_i_w_4554_newp&a s_i_w_5564_newp&a 
s_m_1524_newp&a   s_m_2534_newp&a   s_m_3544_newp&a   s_m_4554_newp&a   s_m_5564_newp&a     s_w_1524_newp&a   s_w_2534_newp&a   s_w_3544_newp&a   s_w_4554_newp&a   s_w_5564_newp&a
s_vlg1&a  s_vlg2&a  s_vlg3&a  s_vlg4&a  s_vlg5&a s_vlg6&a s_tam0&a  s_tam1&a  s_tam2&a s_tam3&a s_m184m_&a k103m_&a y181m_&a g190m_&a  s_l65m_&a s_l151m_&a  s_pim_&a   sti&a 
ep_m&a ep_w&a ageg1w&a ageg2w&a ageg3w&a ageg4w&a ageg5w&a ageg1m&a ageg2m&a ageg3m&a ageg4m&a ageg5m&a  p_newp_ge1_&a incidence&a 
prevalence&a death_rate&a death_rate_all&a t_rm&a   mean_newp_hiv_&a p_onart&a p_rm&a
p_vlg1&a   rm_vlg1_&a rm_vlg2_&a rm_vlg3_&a rm_vlg4_&a rm_vlg5_&a rm_vlg6_&a  t_deaths_all&a  t_onart&a  t_primary&a  newp_ge5_&a newp_ge1_hiv_diag&a p_newp_ge1_hiv_diag&a
i_3tcm&a i_pim_&a  newp_ge1_&a  p_r_&a  r_&a    
i_r_vlg1_newp&a i_r_vlg2_newp&a i_r_vlg3_newp&a i_r_vlg4_newp&a i_r_vlg5_newp&a i_r_vlg6_newp&a   i_m_d_newp&a  i_m_newp&a  i_m_p_newp&a  
i_v1_newp&a     i_v2_newp&a     i_v3_newp&a     i_v4_newp&a     i_v5_newp&a     i_v6_newp&a       i_w_d_newp&a  i_w_newp&a   i_w_p_newp&a  wealth_created&a 
  inf_primary&a  i_w_np&a i_m_np&a i_r_vlg1_np&a  i_r_vlg2_np&a  i_r_vlg3_np&a  i_r_vlg4_np&a  i_r_vlg5_np&a  i_r_vlg6_np&a 
i_v1_np&a i_v2_np&a i_v3_np&a i_v4_np&a i_v5_np&a   i_v6_np&a   
eph0_m&a  eph0_w&a   hiv1564_onart&a dead1564_onart&a  i_diag_vlg1_rm0_np&a  i_diag_vlg1_rm1_np&a  i_diag_vlg2_rm0_np&a  
i_diag_vlg2_rm1_np&a  i_diag_vlg3_rm0_np&a  i_diag_vlg3_rm1_np&a 
i_diag_vlg4_rm0_np&a  i_diag_vlg4_rm1_np&a  i_diag_vlg5_rm0_np&a  i_diag_vlg5_rm1_np&a  i_diag_vlg6_rm0_np&a  i_diag_vlg6_rm1_np&a 
i_naive_vlg1_rm0_np&a i_naive_vlg1_rm1_np&a i_naive_vlg2_rm0_np&a i_naive_vlg2_rm1_np&a i_naive_vlg3_rm0_np&a i_naive_vlg3_rm1_np&a 
i_naive_vlg4_rm0_np&a i_naive_vlg4_rm1_np&a i_naive_vlg5_rm0_np&a i_naive_vlg5_rm1_np&a i_naive_vlg6_rm0_np&a i_naive_vlg6_rm1_np&a
i_ep&a diag_ep&a newp_ge1_hiv&a   mr_epi&a mr_epdiag&a  
 m1524_newp_ge1_&a  m2534_newp_ge1_&a  m3544_newp_ge1_&a  m4554_newp_ge1_&a  m5564_newp_ge1_&a   
 elig_treat200&a   elig_treat350&a
hiv1549_&a  newp_ge10_&a  newp_ge50_&a  inf_vlsupp&a  inf_newp&a inf_ep&a  inf_diag&a inf_naive&a  dead_m&a 
		hiv_sw&a
vm_type&a   return_&a  return_&a  r_dol&a  inf_tdr_vlsupp&a inf_tdr_prim&a
inf_tdr_newp&a  inf_tdr_naive&a   inf_tdr_diag&a   hiv1549m_&a elig_treat500&a   alive1549_m&a
alive1549_w&a   adhm&a  dead5564_all_w&a dead5564_all_m&a dead4554_all_w&a dead4554_all_m&a 
 rme_&a

i_v1_age1_w_np&a i_v1_age2_w_np&a i_v1_age3_w_np&a i_v1_age4_w_np&a i_v1_age5_w_np&a 
i_v1_age1_m_np&a i_v1_age2_m_np&a i_v1_age3_m_np&a i_v1_age4_m_np&a i_v1_age5_m_np&a 
i_v1_age1_w_newp&a i_v1_age2_w_newp&a i_v1_age3_w_newp&a i_v1_age4_w_newp&a i_v1_age5_w_newp&a 
i_v1_age1_m_newp&a i_v1_age2_m_newp&a i_v1_age3_m_newp&a i_v1_age4_m_newp&a i_v1_age5_m_newp&a 
i_v1_age1_w_ep&a i_v1_age2_w_ep&a i_v1_age3_w_ep&a i_v1_age4_w_ep&a i_v1_age5_w_ep&a 
i_v1_age1_m_ep&a i_v1_age2_m_ep&a i_v1_age3_m_ep&a i_v1_age4_m_ep&a i_v1_age5_m_ep&a 

i_v2_age1_w_np&a i_v2_age2_w_np&a i_v2_age3_w_np&a i_v2_age4_w_np&a i_v2_age5_w_np&a 
i_v2_age1_m_np&a i_v2_age2_m_np&a i_v2_age3_m_np&a i_v2_age4_m_np&a i_v2_age5_m_np&a 
i_v2_age1_w_newp&a i_v2_age2_w_newp&a i_v2_age3_w_newp&a i_v2_age4_w_newp&a i_v2_age5_w_newp&a 
i_v2_age1_m_newp&a i_v2_age2_m_newp&a i_v2_age3_m_newp&a i_v2_age4_m_newp&a i_v2_age5_m_newp&a 
i_v2_age1_w_ep&a i_v2_age2_w_ep&a i_v2_age3_w_ep&a i_v2_age4_w_ep&a i_v2_age5_w_ep&a 
i_v2_age1_m_ep&a i_v2_age2_m_ep&a i_v2_age3_m_ep&a i_v2_age4_m_ep&a i_v2_age5_m_ep&a 

i_v3_age1_w_np&a i_v3_age2_w_np&a i_v3_age3_w_np&a i_v3_age4_w_np&a i_v3_age5_w_np&a 
i_v3_age1_m_np&a i_v3_age2_m_np&a i_v3_age3_m_np&a i_v3_age4_m_np&a i_v3_age5_m_np&a 
i_v3_age1_w_newp&a i_v3_age2_w_newp&a i_v3_age3_w_newp&a i_v3_age4_w_newp&a i_v3_age5_w_newp&a 
i_v3_age1_m_newp&a i_v3_age2_m_newp&a i_v3_age3_m_newp&a i_v3_age4_m_newp&a i_v3_age5_m_newp&a 
i_v3_age1_w_ep&a i_v3_age2_w_ep&a i_v3_age3_w_ep&a i_v3_age4_w_ep&a i_v3_age5_w_ep&a 
i_v3_age1_m_ep&a i_v3_age2_m_ep&a i_v3_age3_m_ep&a i_v3_age4_m_ep&a i_v3_age5_m_ep&a 

i_v4_age1_w_np&a i_v4_age2_w_np&a i_v4_age3_w_np&a i_v4_age4_w_np&a i_v4_age5_w_np&a 
i_v4_age1_m_np&a i_v4_age2_m_np&a i_v4_age3_m_np&a i_v4_age4_m_np&a i_v4_age5_m_np&a 
i_v4_age1_w_newp&a i_v4_age2_w_newp&a i_v4_age3_w_newp&a i_v4_age4_w_newp&a i_v4_age5_w_newp&a 
i_v4_age1_m_newp&a i_v4_age2_m_newp&a i_v4_age3_m_newp&a i_v4_age4_m_newp&a i_v4_age5_m_newp&a 
i_v4_age1_w_ep&a i_v4_age2_w_ep&a i_v4_age3_w_ep&a i_v4_age4_w_ep&a i_v4_age5_w_ep&a 
i_v4_age1_m_ep&a i_v4_age2_m_ep&a i_v4_age3_m_ep&a i_v4_age4_m_ep&a i_v4_age5_m_ep&a 

i_v5_age1_w_np&a i_v5_age2_w_np&a i_v5_age3_w_np&a i_v5_age4_w_np&a i_v5_age5_w_np&a 
i_v5_age1_m_np&a i_v5_age2_m_np&a i_v5_age3_m_np&a i_v5_age4_m_np&a i_v5_age5_m_np&a 
i_v5_age1_w_newp&a i_v5_age2_w_newp&a i_v5_age3_w_newp&a i_v5_age4_w_newp&a i_v5_age5_w_newp&a 
i_v5_age1_m_newp&a i_v5_age2_m_newp&a i_v5_age3_m_newp&a i_v5_age4_m_newp&a i_v5_age5_m_newp&a 
i_v5_age1_w_ep&a i_v5_age2_w_ep&a i_v5_age3_w_ep&a i_v5_age4_w_ep&a i_v5_age5_w_ep&a 
i_v5_age1_m_ep&a i_v5_age2_m_ep&a i_v5_age3_m_ep&a i_v5_age4_m_ep&a i_v5_age5_m_ep&a 

i_v6_age1_w_np&a i_v6_age2_w_np&a i_v6_age3_w_np&a i_v6_age4_w_np&a i_v6_age5_w_np&a 
i_v6_age1_m_np&a i_v6_age2_m_np&a i_v6_age3_m_np&a i_v6_age4_m_np&a i_v6_age5_m_np&a 
i_v6_age1_w_newp&a i_v6_age2_w_newp&a i_v6_age3_w_newp&a i_v6_age4_w_newp&a i_v6_age5_w_newp&a 
i_v6_age1_m_newp&a i_v6_age2_m_newp&a i_v6_age3_m_newp&a i_v6_age4_m_newp&a i_v6_age5_m_newp&a 
i_v6_age1_w_ep&a i_v6_age2_w_ep&a i_v6_age3_w_ep&a i_v6_age4_w_ep&a i_v6_age5_w_ep&a 
i_v6_age1_m_ep&a i_v6_age2_m_ep&a i_v6_age3_m_ep&a i_v6_age4_m_ep&a i_v6_age5_m_ep&a 

	i_age1_m_np&a i_age2_m_np&a	i_age3_m_np&a	i_age4_m_np&a	i_age5_m_np&a
	i_age1_w_np&a	i_age2_w_np&a	i_age3_w_np&a	i_age4_w_np&a	i_age5_w_np&a


adc1  adc&a  adh1 adh2 adh&a adhm1 adhm2 adhm&a   adhmin1 adhmin2 adhmin&a    
 alive1549&x alive1549_m&x alive1549_w&x  alive1549_m&a alive1549_w&a art_cost1  artline1 artline&a  c_ane1 c_ane2 c_ane&a c_cns1 c_cns2 c_cns&a c_dia1 c_dia2 c_dia&a c_head1 c_head2 c_head&a 
	c_hep1 c_hep2 c_hep&a c_inpm1 c_inpm2 c_inpm&a c_insm1 c_insm2 c_insm&a c_lac1 c_lac2 c_lac&a c_lip1 c_lip2 c_lip&a   c_nau1 c_nau2 c_nau&a                            
c_neph1 c_neph2 c_neph&a c_otx&a c_pen1 c_pen2 c_pen&a c_pr30m1 c_pr30m2 c_pr30m&a 
c_pr32m1 c_pr32m2 c_pr32m&a c_pr33m1 c_pr33m2 c_pr33m&a c_pr46m1 c_pr46m2 c_pr46m&a c_pr47m1 c_pr47m2 c_pr47m&a c_pr48m1 c_pr48m2 c_pr48m&a 
c_pr50lm1 c_pr50lm2 c_pr50lm&a c_pr50vm1 c_pr50vm2 c_pr50vm&a c_pr54m1 c_pr54m2 c_pr54m&a c_pr76m1 c_pr76m2 c_pr76m&a c_pr82m1 c_pr82m2 c_pr82m&a 
c_pr84m1 c_pr84m2 c_pr84m&a c_pr88m1 c_pr88m2 c_pr88m&a c_pr90m1 c_pr90m2 c_pr90m&a c_ras1 c_ras2 c_ras&a c_rt103m1 c_rt103m2 c_rt103m&a
c_rt151m1 c_rt151m2 c_rt151m&a c_rt181m1 c_rt181m2 c_rt181m&a c_rt184m1 c_rt184m2 c_rt184m&a c_rt190m1 c_rt190m2 c_rt190m&a c_rt65m1 c_rt65m2 
c_rt65m&a  c_rttams1 c_rttams2 c_rttams&a c_totmut1 c_totmut2 c_totmut&a c_tox1 c_tox&a cc1 cc2 cc&a ccsqr1
ccsqr2 ccsqr&a  ch_new_line1 ch_new_line2 ch_new_line&a ch_new_line&x  csqr1 csqr2 csqr&a dead1524_all_m1 dead1524_all_m&a dead1524_all_w1      
dead&a  dead1564_1  dead1564_&a                     
dead1564_onart1 dead1564_onart&a               
dead_m1  dead_m2 dead_m3 dead_m&a diag_ep1 diag_ep&a e_adh1 e_adh2 e_adh&a e_inpm1 e_inpm2 e_inpm&a e_insm1 e_insm2  e_insm&a  e_pr30m1 e_pr30m2                            
	e_pr30m&a e_pr32m1 e_pr32m2  e_pr32m&a  e_pr33m1  e_pr33m2 e_pr33m&a e_pr46m1 e_pr46m2  e_pr46m&a e_pr47m1 e_pr47m2 e_pr47m&a  e_pr48m1 e_pr48m2  e_pr48m&a                           
e_pr50lm1 e_pr50lm2  e_pr50lm&a  e_pr50vm1 e_pr50vm2  e_pr50vm&a  e_pr54m1 e_pr54m2 e_pr54m&a e_pr76m1 e_pr76m2  e_pr76m&a  e_pr82m1 e_pr82m2 e_pr82m&a e_pr84m1                            
e_pr84m2 e_pr84m&a e_pr88m1 e_pr88m2 e_pr88m&a e_pr90m1  e_pr90m2 e_pr90m&a  e_rt103m1 e_rt103m2 e_rt103m&a e_rt151m1 e_rt151m2  e_rt151m&a  e_rt181m1                           
e_rt181m2 e_rt181m&a  e_rt184m1 e_rt184m2 e_rt184m&a e_rt190m2  e_rt190m&a e_rt65m1 e_rt65m2 e_rt65m&a  e_rttams1  e_rttams2                           
e_rttams&a e_totmut1 e_totmut2 e_totmut&a elig_treat2001  elig_treat3501 elig_treat5001 elig_treat200&a  elig_treat350&a elig_treat500&a ep1  ep_m1                               
ep_m&a ep_w1 ep_w&a epart1  epart&a epdiag1  eph0_m1 eph0_m&a  eph0_w1 eph0_w&a  epi1 epi&a   epvls1                              
epvls&a f_3tc1   f_dar1   f_dar&a  f_dol1  f_dol&a f_efa1 f_efa&a f_lpr1 f_lpr&a                             
f_nev1  f_nev&a f_taz1  f_taz&a f_ten1  f_ten&a f_zdv1  f_zdv&a g190m_1 g190m_&a                                 
hiv1564_onart1 hiv1564_onart&a  h
 hiv_sw&a i_age1_m_np1 i_age1_m_np&a i_age1_w_np1 i_age1_w_np&a i_age2_m_np1 i_age2_m_np&a                       
	i_age3_m_np1    i_age3_m_np&a            i_age3_w_np1          i_age3_w_np&a           i_age4_m_np1    i_age4_m_np&a     i_age4_w_np1   i_age4_w_np&a                       
      i_age5_m_np1    i_age5_m_np&a    i_age5_w_np1     i_age5_w_np&a    i_diag_vlg1_rm0_np1    i_diag_vlg1_rm0_np&a    i_diag_vlg1_rm1_np1 
i_diag_vlg1_rm1_np&a       i_diag_vlg2_rm0_np1    i_diag_vlg2_rm0_np&a    i_diag_vlg2_rm1_np1   i_diag_vlg2_rm1_np&a    i_diag_vlg3_rm0_np1  i_diag_vlg3_rm0_np&a                
   i_diag_vlg3_rm1_np1    i_diag_vlg3_rm1_np&a   i_diag_vlg4_rm0_np1     i_diag_vlg4_rm0_np&a     i_diag_vlg4_rm1_np1    i_diag_vlg4_rm1_np&a   i_diag_vlg5_rm0_np1                 
  i_diag_vlg5_rm0_np&a i_diag_vlg5_rm1_np1    i_diag_vlg5_rm1_np&a    i_diag_vlg6_rm0_np1     i_diag_vlg6_rm0_np&a   i_diag_vlg6_rm1_np1   i_diag_vlg6_rm1_np&a                
  i_ep1   i_ep&a     i_m_1524_newp1    i_m_1524_newp&a    i_m_2534_newp1  i_m_2534_newp&a   i_m_3544_newp1    i_m_3544_newp&a     i_m_4554_newp1     i_m_4554_newp&a                     
 i_m_5564_newp1   i_m_5564_newp&a   i_m_d_newp1    i_m_d_newp&a  i_m_np1   i_m_np&a    i_naive_vlg1_rm0_np1    i_naive_vlg1_rm0_np&a  i_naive_vlg1_rm1_np1                
 i_naive_vlg1_rm1_np&a  i_naive_vlg2_rm0_np1    i_naive_vlg2_rm0_np&a    i_naive_vlg2_rm1_np1  i_naive_vlg2_rm1_np&a   i_naive_vlg3_rm0_np1   i_naive_vlg3_rm0_np&a               
   i_naive_vlg3_rm1_np1  i_naive_vlg3_rm1_np&a  i_naive_vlg4_rm0_np1   i_naive_vlg4_rm0_np&a    i_naive_vlg4_rm1_np1    i_naive_vlg4_rm1_np&a 
i_naive_vlg5_rm0_np1      i_naive_vlg5_rm0_np&a    i_naive_vlg5_rm1_np1 i_naive_vlg5_rm1_np&a     i_naive_vlg6_rm0_np1     i_naive_vlg6_rm0_np&a 
i_naive_vlg6_rm1_np1   i_naive_vlg6_rm1_np&a     i_r_vlg1_np1   i_r_vlg1_np&a    i_r_vlg2_np1   i_r_vlg2_np&a  i_r_vlg3_np1   i_r_vlg3_np&a  
i_r_vlg4_np1    i_r_vlg4_np&a     i_r_vlg5_np1   i_r_vlg5_np&a   i_r_vlg6_np1    i_r_vlg6_np&a     i_rm1       i_rm&a     
i_v1_age1_m_ep1   i_v1_age1_m_ep&a   i_v1_age1_m_newp1  i_v1_age1_m_newp&a  i_v1_age1_m_np1     i_v1_age1_m_np&a   i_v1_age1_w_ep1    i_v1_age1_w_ep&a                    
  i_v1_age1_w_newp1  i_v1_age1_w_newp&a i_v1_age1_w_np1  i_v1_age1_w_np&a     i_v1_age2_m_ep1      i_v1_age2_m_ep&a    i_v1_age2_m_newp1   i_v1_age2_m_newp&a                  
 i_v1_age2_m_np1    i_v1_age2_m_np&a   i_v1_age2_w_ep1  i_v1_age2_w_ep&a    i_v1_age2_w_newp1   i_v1_age2_w_newp&a  i_v1_age2_w_np1   i_v1_age2_w_np&a                    
 i_v1_age3_m_ep1   i_v1_age3_m_ep&a    i_v1_age3_m_newp1  i_v1_age3_m_newp&a   i_v1_age3_m_np1   i_v1_age3_m_np&a    i_v1_age3_w_ep1   i_v1_age3_w_ep&a                    
  i_v1_age3_w_newp1    i_v1_age3_w_newp&a   i_v1_age3_w_np1  i_v1_age3_w_np&a    i_v1_age4_m_ep1   i_v1_age4_m_ep&a  i_v1_age4_m_newp1   i_v1_age4_m_newp&a                  
 i_v1_age4_m_np1    i_v1_age4_m_np&a    i_v1_age4_w_ep1  i_v1_age4_w_ep&a  i_v1_age4_w_newp1  i_v1_age4_w_newp&a  i_v1_age4_w_np1    i_v1_age4_w_np&a                    
 i_v1_age5_m_ep1  i_v1_age5_m_ep&a   i_v1_age5_m_newp1  i_v1_age5_m_newp&a  i_v1_age5_m_np1   i_v1_age5_m_np&a    i_v1_age5_w_ep1  i_v1_age5_w_ep&a                    
 i_v1_age5_w_newp1   i_v1_age5_w_newp&a   i_v1_age5_w_np1 i_v1_age5_w_np&a  i_v1_np1   i_v1_np&a i_v2_age1_m_ep1  i_v2_age1_m_ep&a   i_v2_age1_m_newp1                   
 i_v2_age1_m_newp&a i_v2_age1_m_np1  i_v2_age1_m_np&a  i_v2_age1_w_ep1  i_v2_age1_w_ep&a   i_v2_age1_w_newp1  i_v2_age1_w_newp&a   i_v2_age1_w_np1                     
 i_v2_age1_w_np&a  i_v2_age2_m_ep1  i_v2_age2_m_ep&a i_v2_age2_m_newp1  i_v2_age2_m_newp&a  i_v2_age2_m_np1 i_v2_age2_m_np&a   i_v2_age2_w_ep1                     
 i_v2_age2_w_ep&a  i_v2_age2_w_newp1  i_v2_age2_w_newp&a  i_v2_age2_w_np1 i_v2_age2_w_np&a   i_v2_age3_m_ep1   i_v2_age3_m_ep&a    i_v2_age3_m_newp1                   
  i_v2_age3_m_newp&a   i_v2_age3_m_np1   i_v2_age3_m_np&a   i_v2_age3_w_ep1    i_v2_age3_w_ep&a    i_v2_age3_w_newp1  i_v2_age3_w_newp&a   i_v2_age3_w_np1                     
 i_v2_age3_w_np&a    i_v2_age4_m_ep1   i_v2_age4_m_ep&a   i_v2_age4_m_newp1    i_v2_age4_m_newp&a   i_v2_age4_m_np1   i_v2_age4_m_np&a  i_v2_age4_w_ep1                     
 i_v2_age4_w_ep&a   i_v2_age4_w_newp1   i_v2_age4_w_newp&a  i_v2_age4_w_np1 i_v2_age4_w_np&a  i_v2_age5_m_ep1  i_v2_age5_m_ep&a   i_v2_age5_m_newp1                   
 i_v2_age5_m_newp&a    i_v2_age5_m_np1   i_v2_age5_m_np&a i_v2_age5_w_ep1   i_v2_age5_w_ep&a    i_v2_age5_w_newp1   i_v2_age5_w_newp&a   i_v2_age5_w_np1                     
 i_v2_age5_w_np&a  i_v2_np1   i_v2_np&a   i_v3_age1_m_ep1  i_v3_age1_m_ep&a   i_v3_age1_m_newp1   i_v3_age1_m_newp&a  i_v3_age1_m_np1  i_v3_age1_m_np&a                    
 i_v3_age1_w_ep1 i_v3_age1_w_ep&a  i_v3_age1_w_newp1  i_v3_age1_w_newp&a   i_v3_age1_w_np1 i_v3_age1_w_np&a    i_v3_age2_m_ep1    i_v3_age2_m_ep&a                    
i_v3_age2_m_newp1     i_v3_age2_m_newp&a   i_v3_age2_m_np1    i_v3_age2_m_np&a  i_v3_age2_w_ep1   i_v3_age2_w_ep&a  i_v3_age2_w_newp1   i_v3_age2_w_newp&a                  
 i_v3_age2_w_np1   i_v3_age2_w_np&a   i_v3_age3_m_ep1  i_v3_age3_m_ep&a  i_v3_age3_m_newp1     i_v3_age3_m_newp&a   i_v3_age3_m_np1    i_v3_age3_m_np&a                    
i_v3_age3_w_ep1    i_v3_age3_w_ep&a   i_v3_age3_w_newp1  i_v3_age3_w_newp&a   i_v3_age3_w_np1    i_v3_age3_w_np&a    i_v3_age4_m_ep1   i_v3_age4_m_ep&a                    
    i_v3_age4_m_newp1    i_v3_age4_m_newp&a   i_v3_age4_m_np1   i_v3_age4_m_np&a   i_v3_age4_w_ep1   i_v3_age4_w_ep&a     i_v3_age4_w_newp1                   
 i_v3_age4_w_newp&a    i_v3_age4_w_np1   i_v3_age4_w_np&a    i_v3_age5_m_ep1    i_v3_age5_m_ep&a   i_v3_age5_m_newp1    i_v3_age5_m_newp&a   i_v3_age5_m_np1                     
  i_v3_age5_m_np&a    i_v3_age5_w_ep1   i_v3_age5_w_ep&a   i_v3_age5_w_newp1    i_v3_age5_w_newp&a     i_v3_age5_w_np1     i_v3_age5_w_np&a    i_v3_np1                            
 i_v3_np&a   i_v4_age1_m_ep1   i_v4_age1_m_ep&a  i_v4_age1_m_newp1  i_v4_age1_m_newp&a     i_v4_age1_m_np1  i_v4_age1_m_np&a   i_v4_age1_w_ep1                     
i_v4_age1_w_ep&a      i_v4_age1_w_newp1   i_v4_age1_w_newp&a  i_v4_age1_w_np1  i_v4_age1_w_np&a    i_v4_age2_m_ep1   i_v4_age2_m_ep&a                    
 i_v4_age2_m_newp1   i_v4_age2_m_newp&a  i_v4_age2_m_np1  i_v4_age2_m_np&a    i_v4_age2_w_ep1   i_v4_age2_w_ep&a  i_v4_age2_w_newp1   i_v4_age2_w_newp&a                  
  i_v4_age2_w_np1    i_v4_age2_w_np&a  i_v4_age3_m_ep1 i_v4_age3_m_ep&a   i_v4_age3_m_newp1   i_v4_age3_m_newp&a    i_v4_age3_m_np1   i_v4_age3_m_np&a                    
  i_v4_age3_w_ep1    i_v4_age3_w_ep&a   i_v4_age3_w_newp1  i_v4_age3_w_newp&a    i_v4_age3_w_np1   i_v4_age3_w_np&a     i_v4_age4_m_ep1     i_v4_age4_m_ep&a                    
  i_v4_age4_m_newp1       i_v4_age4_m_newp&a    i_v4_age4_m_np1  i_v4_age4_m_np&a       i_v4_age4_w_ep1         i_v4_age4_w_ep&a  i_v4_age4_w_newp1                   
  i_v4_age4_w_newp&a   i_v4_age4_w_np1    i_v4_age4_w_np&a  i_v4_age5_m_ep1    i_v4_age5_m_ep&a     i_v4_age5_m_newp1  i_v4_age5_m_newp&a  i_v4_age5_m_np1                     
 i_v4_age5_m_np&a   i_v4_age5_w_ep1 i_v4_age5_w_ep&a i_v4_age5_w_newp1   i_v4_age5_w_newp&a  i_v4_age5_w_np1   i_v4_age5_w_np&a  i_v4_np1                            
 i_v4_np&a  i_v5_age1_m_ep1    i_v5_age1_m_ep&a  i_v5_age1_m_newp1  i_v5_age1_m_newp&a   i_v5_age1_m_np1    i_v5_age1_m_np&a   i_v5_age1_w_ep1                     
 i_v5_age1_w_ep&a   i_v5_age1_w_newp1   i_v5_age1_w_newp&a    i_v5_age1_w_np1    i_v5_age1_w_np&a    i_v5_age2_m_ep1  i_v5_age2_m_ep&a                    
 i_v5_age2_m_newp1   i_v5_age2_m_np1   i_v5_age2_m_np&a   i_v5_age2_w_ep1   i_v5_age2_w_ep&a     i_v5_age2_w_newp1   i_v5_age2_w_newp&a   i_v5_age2_w_np1                     
 i_v5_age2_w_np&a   i_v5_age3_m_ep1   i_v5_age3_m_ep&a  i_v5_age3_m_newp1  i_v5_age3_m_newp&a  i_v5_age3_m_np1     i_v5_age3_m_np&a    i_v5_age3_w_ep1                     
 i_v5_age3_w_ep&a   i_v5_age3_w_newp1   i_v5_age3_w_newp&a   i_v5_age3_w_np1    i_v5_age3_w_np&a i_v5_age4_m_ep1   i_v5_age4_m_ep&a  i_v5_age4_m_newp1                   
 i_v5_age4_m_newp&a    i_v5_age4_m_np1  i_v5_age4_m_np&a   i_v5_age4_w_ep1    i_v5_age4_w_ep&a    i_v5_age4_w_newp1     i_v5_age4_w_newp&a   i_v5_age4_w_np1                     
 i_v5_age4_w_np&a       i_v5_age5_m_ep1    i_v5_age5_m_ep&a i_v5_age5_m_newp1  i_v5_age5_m_newp&a   i_v5_age5_m_np1    i_v5_age5_m_np&a  i_v5_age5_w_ep1                     
 i_v5_age5_w_ep&a      i_v5_age5_w_newp1  i_v5_age5_w_newp&a i_v5_age5_w_np1   i_v5_age5_w_np&a    i_v5_np1  i_v5_np&a   i_v6_age1_m_ep1                     
 i_v6_age1_m_ep&a    i_v6_age1_m_newp1 i_v6_age1_m_newp&a  i_v6_age1_m_np1   i_v6_age1_m_np&a    i_v6_age1_w_ep1     i_v6_age1_w_ep&a    i_v6_age1_w_newp1                   
  i_v6_age1_w_newp&a   i_v6_age1_w_np1   i_v6_age1_w_np&a i_v6_age2_m_ep1  i_v6_age2_m_ep&a    i_v6_age2_m_newp1    i_v6_age2_m_newp&a  i_v6_age2_m_np1                     
 i_v6_age2_m_np&a   i_v6_age2_w_ep1   i_v6_age2_w_ep&a  i_v6_age2_w_newp1    i_v6_age2_w_newp&a  i_v6_age2_w_np1 i_v6_age2_w_np&a   i_v6_age3_m_ep1                     
 i_v6_age3_m_ep&a  i_v6_age3_m_newp1  i_v6_age3_m_newp&a  i_v6_age3_m_np1   i_v6_age3_m_np&a   i_v6_age3_w_ep1  i_v6_age3_w_ep&a   i_v6_age3_w_newp1                   
 i_v6_age3_w_newp&a  i_v6_age3_w_np1   i_v6_age3_w_np&a     i_v6_age4_m_ep1  i_v6_age4_m_ep&a    i_v6_age4_m_newp1   i_v6_age4_m_newp&a   i_v6_age4_m_np1                     
  i_v6_age4_m_np&a   i_v6_age4_w_ep1  i_v6_age4_w_ep&a   i_v6_age4_w_newp1 i_v6_age4_w_newp&a    i_v6_age4_w_np1   i_v6_age4_w_np&a    i_v6_age5_m_ep1                     
 i_v6_age5_m_ep&a  i_v6_age5_m_newp1 i_v6_age5_m_newp&a  i_v6_age5_m_np1  i_v6_age5_m_np&a  i_v6_age5_w_ep1    i_v6_age5_w_ep&a   i_v6_age5_w_newp1                   
i_v6_age5_w_newp&a  i_v6_age5_w_np1  i_v6_age5_w_np&a  i_v6_np1   i_v6_np&a   i_w_1524_newp1   i_w_1524_newp&a     i_w_2534_newp1  i_w_2534_newp&a                     
  i_w_3544_newp1   i_w_3544_newp&a  i_w_4554_newp1  i_w_4554_newp&a   i_w_5564_newp1 i_w_5564_newp&a  i_w_d_newp1  i_w_d_newp&a  i_w_np1  i_w_np&a                            
 inf_diag1  inf_diag&a   inf_ep1   inf_ep&a  inf_naive1   inf_naive&a   inf_newp1  inf_newp&a  inf_primary1   inf_primary&a  inf_tdr_diag1  inf_tdr_diag&a                      
inf_tdr_naive1 inf_tdr_naive&a   inf_tdr_newp1  inf_tdr_newp&a   inf_tdr_prim1 inf_tdr_prim&a    inf_tdr_vlsupp1   inf_tdr_vlsupp&a  inf_vlsupp1                         
inf_vlsupp&a  inpm_1    inpm_&a    insm_1   insm_&a   interrupt1  interrupt2 interrupt&a    interrupt_choice1  interrupt_choice2   interrupt_choice&a                  
interrupt_supply1  interrupt_supply2    interrupt_supply&a   k103m_1    k103m_&a   k65m_1   k65m_&a       linefail1                               
linefail&a    lost1    lost&a   m184m_1   m184m_&a   m2534_newp_ge1_1                    
 m2534_newp_ge1_&a   m2534_newp_ge5_1  m2534_newp_ge5_&a  m3544_newp_ge1_1   m3544_newp_ge1_&a   m3544_newp_ge5_1   m3544_newp_ge5_&a   m4554_newp_ge1_1                    
 m4554_newp_ge1_&a   m4554_newp_ge5_1  m4554_newp_ge5_&a  m5564_newp_ge1_1  m5564_newp_ge1_&a   m5564_newp_ge5_1   m5564_newp_ge5_&a                     
 mcirc1    mcirc&a    mr_3tc1  mr_3tc2    mr_3tc&a     mr_dar1   mr_dar2   mr_dar&a                              
   mr_dol1   mr_dol2  mr_dol&a   mr_efa1 mr_efa2   mr_efa&a    mr_epdiag1   mr_epdiag2   mr_epdiag&a  mr_epi1    mr_epi2  mr_epi&a                            
 mr_lpr1   mr_lpr2   mr_lpr&a   mr_nev1   mr_nev2  mr_nev&a   mr_taz1    mr_taz2  mr_taz&a  mr_ten1    mr_ten2   mr_ten&a   mr_zdv1  mr_zdv2   mr_zdv&a                            
  nactive1    nactive2   nactive&a naive1  naive&a   newmut1   newmut2   newmut&a   newp_ge10_1   newp_ge10_&a                        
 newp_ge1_1    newp_ge1_&a  newp_ge1_hiv1   newp_ge1_hiv&a  newp_ge1_hiv_diag1  newp_ge1_hiv_diag&a  newp_ge50_1    newp_ge50_&a  newp_ge5_1 newp_ge5_&a                         
newp_hiv_1    newp_hiv_&a   nip1   nip&a    nnm_1   nnm_&a     nod1     nod2    nod&a     nonuc1      nonuc2    nonuc&a    np1    np&a                                
 o_3tc1   o_3tc&a  o_dar1      o_dar&a        o_dol1   o_dol&a   o_efa1                              
   o_lpr1    o_lpr&a   o_nev1    o_taz1     o_taz&a    o_ten1   o_ten&a   o_zdv1                          
o_zdv&a onart1    onart&a  p30m_1 p30m_&a    p32m_1    p32m_&a   p33m_1  p33m_&a  p46m_1  p46m_&a  p47m_1  p47m_&a    p48m_1    p48m_&a                             
 p50lm_1  p50lm_&a   p50vm_1 p50vm_&a  p54m_1 p54m_&a   p76m_1 p76m_&a   p82m_1  p82m_&a  p84m_1  p84m_&a  p88m_1   p88m_&a  p90m_1  p90m_&a p_3tc1                              
 p_3tc2    p_dar1   p_dar2    p_dar&a    p_dol1 p_dol2  p_dol&a   p_efa1  p_efa2  p_efa&a                             
 p_lpr1  p_lpr2  p_lpr&a  p_nev1 p_nev2 p_nev&a  p_taz1  p_taz2  p_taz&a  p_ten1  p_ten2  p_ten&a  p_zdv1  p_zdv2   p_zdv&a   pcp_p1 pcp_p2  pcp_p&a                             
pim_1  pim_&a  prep1  primary1 primary&a   primary_ep_m1  primary_ep_m&a  primary_ep_w1                       
primary_ep_w&a  q151m_1  q151m_&a r_3tc1    r_3tc&a   r_dar1    r_dar&a    r_dol1                              
 r_efa1    r_efa&a  r_lpr1  r_lpr&a   r_nev1    r_nev&a   r_taz1     r_taz&a   r_ten1   r_ten&a                             
r_zdv1   r_zdv&a  registd1   registd&a     restart1  restart2                            
restart&a  resumec1   resumec2   return_1 return_2  return_&a  rm_1 rm_&a    sti2 sti&a  stop_tox1  stop_tox2  stop_tox&a  t_3tc1  t_3tc2                              
 t_3tc&a  t_dar1  t_dar&a   t_dol1    t_dol&a   t_efa1     t_efa&a  t_lpr1                             
t_lpr&a t_nev1   t_nev&a  t_taz1  t_taz&a  t_ten1  t_ten&a    t_zdv1  t_zdv&a  tam1_1  tam1_&a  tam2_1   tam2_&a  tam3_1                              
tam3_&a   tb1   tested1   toffart1 toffart2 toffart&a   tss_3tc1  tss_3tc2  tss_3tc&a                           
 tss_dar1  tss_dar2  tss_dar&a  tss_dol1  tss_dol2  tss_dol&a   tss_efa1 tss_efa2  tss_efa&a tss_lpr1                            
tss_lpr2  tss_lpr&a   tss_nev1  tss_nev2  tss_nev&a tss_taz1 tss_taz2  tss_taz&a  tss_ten1  tss_ten2  tss_ten&a   tss_zdv1  tss_zdv2   tss_zdv&a v&a                                 
vc1  vc2   vc&a  vfail1_1   vfail1_2  vfail1_&a    visit1   visit&a  vlg1&a                              
 vlg2&a vlg3&a  vlg4&a  vlg5&a   vlg6&a vm_type1  vm_type2   vm_type&a   vmax1  vmax2  vmax&a   w1524_newp_ge1_1  w1524_newp_ge1_&a                   
  w1524_newp_ge5_1   w1524_newp_ge5_&a  w2534_newp_ge1_1  w2534_newp_ge1_&a  w2534_newp_ge5_1  w2534_newp_ge5_&a   w3544_newp_ge1_1  w3544_newp_ge1_&a                   
  w3544_newp_ge5_1 w3544_newp_ge5_&a   w4554_newp_ge1_1 w4554_newp_ge1_&a  w4554_newp_ge5_1  w4554_newp_ge5_&a    w5564_newp_ge1_1  w5564_newp_ge1_&a                   
 w5564_newp_ge5_1   w5564_newp_ge5_&a  w_1524_ep1   w_1524_ep&a w_1524_epnewp1   w_1524_epnewp&a   w_1524_newp1    w_1524_newp&a    w_2534_ep1                          
  w_2534_ep&a  w_2534_epnewp1    w_2534_epnewp&a w_2534_newp1  w_2534_newp&a  w_3544_ep1    w_3544_ep&a  w_3544_epnewp1    w_3544_epnewp&a  w_3544_newp1                        
 w_3544_newp&a   w_4554_ep1  w_4554_ep&a   w_4554_epnewp1    w_4554_epnewp&a  w_4554_newp1    w_4554_newp&a w_5564_ep1   w_5564_ep&a   w_5564_epnewp1                      
w_5564_epnewp&a   w_5564_newp1 w_5564_newp&a  who3_1   who3_&a   who3_event1   who3_event&a                        
who4_1   who4_&a   x4v1   x4v2  x4v&a   y181m_1   y181m_&a  i_age1_m_newp&a i_age1_w_newp&a i_age2_m_newp&a i_age2_w_newp&a
 i_age3_m_newp&a i_age3_w_newp&a   i_age4_m_newp&a i_age4_w_newp&a   i_age5_m_newp&a i_age5_w_newp&a  iime_&a inm_&a nnme_&a   nrtime_&a  pime_&a
visit_prep&a 
;                           
                       
end;





%mend update_r1;


%update_r1(da1=1,da2=2,e=1,f=2,g=1,h=8,a=0,b=0,i=0,k=0,l=0,x=0,j=1,s=0);
%update_r1(da1=2,da2=1,e=2,f=3,g=1,h=8,a=0,b=0,i=0,k=0,l=0,x=1,j=2,s=0);
%update_r1(da1=1,da2=2,e=3,f=4,g=1,h=8,a=0,b=0,i=0,k=0,l=0,x=2,j=3,s=0);
%update_r1(da1=2,da2=1,e=4,f=5,g=1,h=8,a=0,b=0,i=0,k=0,l=0,x=3,j=4,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=1,h=8,a=0,b=0,i=0,k=0,l=0,x=4,j=5,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=1,h=8,a=4,b=3,i=2,k=0,l=0,x=5,j=6,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=1,h=8,a=5,b=4,i=3,k=0,l=0,x=6,j=7,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=1,h=8,a=6,b=5,i=4,k=0,l=0,x=7,j=8,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=5,h=12,a=7,b=6,i=5,k=4,l=3,x=8,j=9,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=5,h=12,a=8,b=7,i=6,k=5,l=4,x=9,j=10,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=5,h=12,a=9,b=8,i=7,k=6,l=5,x=10,j=11,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=5,h=12,a=10,b=9,i=8,k=7,l=6,x=11,j=12,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=9,h=16,a=11,b=10,i=9,k=8,l=7,x=12,j=13,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=9,h=16,a=12,b=11,i=10,k=9,l=8,x=13,j=14,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=9,h=16,a=13,b=12,i=11,k=10,l=9,x=14,j=15,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=9,h=16,a=14,b=13,i=12,k=11,l=10,x=15,j=16,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=13,h=20,a=15,b=14,i=13,k=12,l=11,x=16,j=17,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=13,h=20,a=16,b=15,i=14,k=13,l=12,x=17,j=18,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=13,h=20,a=17,b=16,i=15,k=14,l=13,x=18,j=19,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=13,h=20,a=18,b=17,i=16,k=15,l=14,x=19,j=20,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=17,h=24,a=19,b=18,i=17,k=16,l=15,x=20,j=21,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=17,h=24,a=20,b=19,i=18,k=17,l=16,x=21,j=22,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=17,h=24,a=21,b=20,i=19,k=18,l=17,x=22,j=23,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=17,h=24,a=22,b=21,i=20,k=19,l=18,x=23,j=24,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=21,h=28,a=23,b=22,i=21,k=20,l=19,x=24,j=25,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=21,h=28,a=24,b=23,i=22,k=21,l=20,x=25,j=26,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=21,h=28,a=25,b=24,i=23,k=22,l=21,x=26,j=27,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=21,h=28,a=26,b=25,i=24,k=23,l=22,x=27,j=28,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=25,h=32,a=27,b=26,i=25,k=24,l=23,x=28,j=29,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=25,h=32,a=28,b=27,i=26,k=25,l=24,x=29,j=30,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=25,h=32,a=29,b=28,i=27,k=26,l=25,x=30,j=31,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=25,h=32,a=30,b=29,i=28,k=27,l=26,x=31,j=32,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=29,h=36,a=31,b=30,i=29,k=28,l=27,x=32,j=33,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=29,h=36,a=32,b=31,i=30,k=29,l=28,x=33,j=34,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=29,h=36,a=33,b=32,i=31,k=30,l=29,x=34,j=35,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=29,h=36,a=34,b=33,i=32,k=31,l=30,x=35,j=36,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=33,h=40,a=35,b=34,i=33,k=32,l=31,x=36,j=37,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=33,h=40,a=36,b=35,i=34,k=33,l=32,x=37,j=38,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=33,h=40,a=37,b=36,i=35,k=34,l=33,x=38,j=39,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=33,h=40,a=38,b=37,i=36,k=35,l=34,x=39,j=40,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=37,h=44,a=39,b=38,i=37,k=36,l=35,x=40,j=41,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=37,h=44,a=40,b=39,i=38,k=37,l=36,x=41,j=42,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=37,h=44,a=41,b=40,i=39,k=38,l=37,x=42,j=43,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=37,h=44,a=42,b=41,i=40,k=39,l=38,x=43,j=44,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=41,h=48,a=43,b=42,i=41,k=40,l=39,x=44,j=45,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=41,h=48,a=44,b=43,i=42,k=41,l=40,x=45,j=46,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=41,h=48,a=45,b=44,i=43,k=42,l=41,x=46,j=47,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=41,h=48,a=46,b=45,i=44,k=43,l=42,x=47,j=48,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=45,h=52,a=47,b=46,i=45,k=44,l=43,x=48,j=49,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=45,h=52,a=48,b=47,i=46,k=45,l=44,x=49,j=50,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=45,h=52,a=49,b=48,i=47,k=46,l=45,x=50,j=51,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=45,h=52,a=50,b=49,i=48,k=47,l=46,x=51,j=52,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=49,h=56,a=51,b=50,i=49,k=48,l=47,x=52,j=53,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=49,h=56,a=52,b=51,i=50,k=49,l=48,x=53,j=54,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=49,h=56,a=53,b=52,i=51,k=50,l=49,x=54,j=55,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=49,h=56,a=54,b=53,i=52,k=51,l=50,x=55,j=56,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=53,h=60,a=55,b=54,i=53,k=52,l=51,x=56,j=57,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=53,h=60,a=56,b=55,i=54,k=53,l=52,x=57,j=58,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=53,h=60,a=57,b=56,i=55,k=54,l=53,x=58,j=59,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=53,h=60,a=58,b=57,i=56,k=55,l=54,x=59,j=60,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=57,h=64,a=59,b=58,i=57,k=56,l=55,x=60,j=61,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=57,h=64,a=60,b=59,i=58,k=57,l=56,x=61,j=62,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=57,h=64,a=61,b=60,i=59,k=58,l=57,x=62,j=63,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=57,h=64,a=62,b=61,i=60,k=59,l=58,x=63,j=64,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=61,h=68,a=63,b=62,i=61,k=60,l=59,x=64,j=65,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=61,h=68,a=64,b=63,i=62,k=61,l=60,x=65,j=66,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=61,h=68,a=65,b=64,i=63,k=62,l=61,x=66,j=67,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=61,h=68,a=66,b=65,i=64,k=63,l=62,x=67,j=68,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=65,h=72,a=67,b=66,i=65,k=64,l=63,x=68,j=69,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=65,h=72,a=68,b=67,i=66,k=65,l=64,x=69,j=70,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=65,h=72,a=69,b=68,i=67,k=66,l=65,x=70,j=71,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=65,h=72,a=70,b=69,i=68,k=67,l=66,x=71,j=72,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=69,h=76,a=71,b=70,i=69,k=68,l=67,x=72,j=73,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=69,h=76,a=72,b=71,i=70,k=69,l=68,x=73,j=74,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=69,h=76,a=73,b=72,i=71,k=70,l=69,x=74,j=75,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=69,h=76,a=74,b=73,i=72,k=71,l=70,x=75,j=76,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=73,h=80,a=75,b=74,i=73,k=72,l=71,x=76,j=77,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=73,h=80,a=76,b=75,i=74,k=73,l=72,x=77,j=78,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=73,h=80,a=77,b=76,i=75,k=74,l=73,x=78,j=79,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=73,h=80,a=78,b=77,i=76,k=75,l=74,x=79,j=80,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=77,h=84,a=79,b=78,i=77,k=76,l=75,x=80,j=81,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=77,h=84,a=80,b=79,i=78,k=77,l=76,x=81,j=82,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=77,h=84,a=81,b=80,i=79,k=78,l=77,x=82,j=83,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=77,h=84,a=82,b=81,i=80,k=79,l=78,x=83,j=84,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=81,h=88,a=83,b=82,i=81,k=80,l=79,x=84,j=85,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=81,h=88,a=84,b=83,i=82,k=81,l=80,x=85,j=86,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=81,h=88,a=85,b=84,i=83,k=82,l=81,x=86,j=87,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=81,h=88,a=86,b=85,i=84,k=83,l=82,x=87,j=88,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=85,h=92,a=87,b=86,i=85,k=84,l=83,x=88,j=89,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=85,h=92,a=88,b=87,i=86,k=85,l=84,x=89,j=90,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=85,h=92,a=89,b=88,i=87,k=86,l=85,x=90,j=91,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=85,h=92,a=90,b=89,i=88,k=87,l=86,x=91,j=92,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=89,h=96,a=91,b=90,i=89,k=88,l=87,x=92,j=93,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=89,h=96,a=92,b=91,i=90,k=89,l=88,x=93,j=94,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=89,h=96,a=93,b=92,i=91,k=90,l=89,x=94,j=95,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=89,h=96,a=94,b=93,i=92,k=91,l=90,x=95,j=96,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=93,h=100,a=95,b=94,i=93,k=92,l=91,x=96,j=97,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=93,h=100,a=96,b=95,i=94,k=93,l=92,x=97,j=98,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=93,h=100,a=97,b=96,i=95,k=94,l=93,x=98,j=99,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=93,h=100,a=98,b=97,i=96,k=95,l=94,x=99,j=100,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=97,h=104,a=99,b=98,i=97,k=96,l=95,x=100,j=101,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=97,h=104,a=100,b=99,i=98,k=97,l=96,x=101,j=102,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=97,h=104,a=101,b=100,i=99,k=98,l=97,x=102,j=103,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=97,h=104,a=102,b=101,i=100,k=99,l=98,x=103,j=104,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=101,h=108,a=103,b=102,i=101,k=100,l=99,x=104,j=105,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=101,h=108,a=104,b=103,i=102,k=101,l=100,x=105,j=106,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=101,h=108,a=105,b=104,i=103,k=102,l=101,x=106,j=107,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=101,h=108,a=106,b=105,i=104,k=103,l=102,x=107,j=108,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=105,h=112,a=107,b=106,i=105,k=104,l=103,x=108,j=109,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=105,h=112,a=108,b=107,i=106,k=105,l=104,x=109,j=110,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=105,h=112,a=109,b=108,i=107,k=106,l=105,x=110,j=111,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=105,h=112,a=110,b=109,i=108,k=107,l=106,x=111,j=112,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=109,h=116,a=111,b=110,i=109,k=108,l=107,x=112,j=113,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=109,h=116,a=112,b=111,i=110,k=109,l=108,x=113,j=114,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=109,h=116,a=113,b=112,i=111,k=110,l=109,x=114,j=115,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=109,h=116,a=114,b=113,i=112,k=111,l=110,x=115,j=116,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=113,h=120,a=115,b=114,i=113,k=112,l=111,x=116,j=117,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=113,h=120,a=116,b=115,i=114,k=113,l=112,x=117,j=118,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=113,h=120,a=117,b=116,i=115,k=114,l=113,x=118,j=119,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=113,h=120,a=118,b=117,i=116,k=115,l=114,x=119,j=120,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=117,h=124,a=119,b=118,i=117,k=116,l=115,x=120,j=121,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=117,h=124,a=120,b=119,i=118,k=117,l=116,x=121,j=122,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=117,h=124,a=121,b=120,i=119,k=118,l=117,x=122,j=123,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=117,h=124,a=122,b=121,i=120,k=119,l=118,x=123,j=124,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=121,h=128,a=123,b=122,i=121,k=120,l=119,x=124,j=125,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=121,h=128,a=124,b=123,i=122,k=121,l=120,x=125,j=126,s=0);

data a; set r1; 

data r1; set a;

%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,a=125,b=124,i=123,k=122,l=121,x=126,j=127,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=121,h=128,a=126,b=125,i=124,k=123,l=122,x=127,j=128,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=125,h=132,a=127,b=126,i=125,k=124,l=123,x=128,j=129,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=125,h=132,a=128,b=127,i=126,k=125,l=124,x=129,j=130,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=125,h=132,a=129,b=128,i=127,k=126,l=125,x=130,j=131,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=125,h=132,a=130,b=129,i=128,k=127,l=126,x=131,j=132,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=129,h=136,a=131,b=130,i=129,k=128,l=127,x=132,j=133,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=129,h=136,a=132,b=131,i=130,k=129,l=128,x=133,j=134,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=129,h=136,a=133,b=132,i=131,k=130,l=129,x=134,j=135,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=129,h=136,a=134,b=133,i=132,k=131,l=130,x=135,j=136,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=133,h=140,a=135,b=134,i=133,k=132,l=131,x=136,j=137,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=133,h=140,a=136,b=135,i=134,k=133,l=132,x=137,j=138,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=133,h=140,a=137,b=136,i=135,k=134,l=133,x=138,j=139,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=133,h=140,a=138,b=137,i=136,k=135,l=134,x=139,j=140,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=137,h=144,a=139,b=138,i=137,k=136,l=135,x=140,j=141,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=137,h=144,a=140,b=139,i=138,k=137,l=136,x=141,j=142,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=137,h=144,a=141,b=140,i=139,k=138,l=137,x=142,j=143,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=137,h=144,a=142,b=141,i=140,k=139,l=138,x=143,j=144,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=141,h=148,a=143,b=142,i=141,k=140,l=139,x=144,j=145,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=141,h=148,a=144,b=143,i=142,k=141,l=140,x=145,j=146,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=141,h=148,a=145,b=144,i=143,k=142,l=141,x=146,j=147,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=141,h=148,a=146,b=145,i=144,k=143,l=142,x=147,j=148,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=145,h=152,a=147,b=146,i=145,k=144,l=143,x=148,j=149,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=145,h=152,a=148,b=147,i=146,k=145,l=144,x=149,j=150,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=145,h=152,a=149,b=148,i=147,k=146,l=145,x=150,j=151,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=145,h=152,a=150,b=149,i=148,k=147,l=146,x=151,j=152,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=149,h=156,a=151,b=150,i=149,k=148,l=147,x=152,j=153,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=149,h=156,a=152,b=151,i=150,k=149,l=148,x=153,j=154,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=149,h=156,a=153,b=152,i=151,k=150,l=149,x=154,j=155,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=149,h=156,a=154,b=153,i=152,k=151,l=150,x=155,j=156,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=153,h=160,a=155,b=154,i=153,k=152,l=151,x=156,j=157,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=153,h=160,a=156,b=155,i=154,k=153,l=152,x=157,j=158,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=153,h=160,a=157,b=156,i=155,k=154,l=153,x=158,j=159,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=153,h=160,a=158,b=157,i=156,k=155,l=154,x=159,j=160,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=157,h=164,a=159,b=158,i=157,k=156,l=155,x=160,j=161,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=157,h=164,a=160,b=159,i=158,k=157,l=156,x=161,j=162,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=157,h=164,a=161,b=160,i=159,k=158,l=157,x=162,j=163,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=157,h=164,a=162,b=161,i=160,k=159,l=158,x=163,j=164,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=161,h=168,a=163,b=162,i=161,k=160,l=159,x=164,j=165,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=161,h=168,a=164,b=163,i=162,k=161,l=160,x=165,j=166,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=161,h=168,a=165,b=164,i=163,k=162,l=161,x=166,j=167,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=161,h=168,a=166,b=165,i=164,k=163,l=162,x=167,j=168,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=165,h=172,a=167,b=166,i=165,k=164,l=163,x=168,j=169,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=165,h=172,a=168,b=167,i=166,k=165,l=164,x=169,j=170,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=165,h=172,a=169,b=168,i=167,k=166,l=165,x=170,j=171,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=165,h=172,a=170,b=169,i=168,k=167,l=166,x=171,j=172,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=169,h=176,a=171,b=170,i=169,k=168,l=167,x=172,j=173,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=169,h=176,a=172,b=171,i=170,k=169,l=168,x=173,j=174,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=169,h=176,a=173,b=172,i=171,k=170,l=169,x=174,j=175,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=169,h=176,a=174,b=173,i=172,k=171,l=170,x=175,j=176,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=173,h=180,a=175,b=174,i=173,k=172,l=171,x=176,j=177,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=173,h=180,a=176,b=175,i=174,k=173,l=172,x=177,j=178,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=173,h=180,a=177,b=176,i=175,k=174,l=173,x=178,j=179,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=173,h=180,a=178,b=177,i=176,k=175,l=174,x=179,j=180,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=177,h=184,a=179,b=178,i=177,k=176,l=175,x=180,j=181,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=177,h=184,a=180,b=179,i=178,k=177,l=176,x=181,j=182,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=177,h=184,a=181,b=180,i=179,k=178,l=177,x=182,j=183,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=177,h=184,a=182,b=181,i=180,k=179,l=178,x=183,j=184,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=181,h=188,a=183,b=182,i=181,k=180,l=179,x=184,j=185,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=181,h=188,a=184,b=183,i=182,k=181,l=180,x=185,j=186,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=181,h=188,a=185,b=184,i=183,k=182,l=181,x=186,j=187,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=181,h=188,a=186,b=185,i=184,k=183,l=182,x=187,j=188,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=185,h=192,a=187,b=186,i=185,k=184,l=183,x=188,j=189,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=185,h=192,a=188,b=187,i=186,k=185,l=184,x=189,j=190,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=185,h=192,a=189,b=188,i=187,k=186,l=185,x=190,j=191,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=185,h=192,a=190,b=189,i=188,k=187,l=186,x=191,j=192,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=189,h=196,a=191,b=190,i=189,k=188,l=187,x=192,j=193,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=189,h=196,a=192,b=191,i=190,k=189,l=188,x=193,j=194,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=189,h=196,a=193,b=192,i=191,k=190,l=189,x=194,j=195,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=189,h=196,a=194,b=193,i=192,k=191,l=190,x=195,j=196,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=193,h=200,a=195,b=194,i=193,k=192,l=191,x=196,j=197,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=193,h=200,a=196,b=195,i=194,k=193,l=192,x=197,j=198,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=193,h=200,a=197,b=196,i=195,k=194,l=193,x=198,j=199,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=193,h=200,a=198,b=197,i=196,k=195,l=194,x=199,j=200,s=0);   
%update_r1(da1=1,da2=2,e=5,f=6,g=197,h=204,a=199,b=198,i=197,k=196,l=195,x=200,j=201,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=197,h=204,a=200,b=199,i=198,k=197,l=196,x=201,j=202,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=197,h=204,a=201,b=200,i=199,k=198,l=197,x=202,j=203,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=197,h=204,a=202,b=201,i=200,k=199,l=198,x=203,j=204,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=201,h=208,a=203,b=202,i=201,k=200,l=199,x=204,j=205,s=0);

%update_r1(da1=2,da2=1,e=6,f=7,g=201,h=208,a=204,b=203,i=202,k=201,l=200,x=205,j=206,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=201,h=208,a=205,b=204,i=203,k=202,l=201,x=206,j=207,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=201,h=208,a=206,b=205,i=204,k=203,l=202,x=207,j=208,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=205,h=212,a=207,b=206,i=205,k=204,l=203,x=208,j=209,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=205,h=212,a=208,b=207,i=206,k=205,l=204,x=209,j=210,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=205,h=212,a=209,b=208,i=207,k=206,l=205,x=210,j=211,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=205,h=212,a=210,b=209,i=208,k=207,l=206,x=211,j=212,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=209,h=216,a=211,b=210,i=209,k=208,l=207,x=212,j=213,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=209,h=216,a=212,b=211,i=210,k=209,l=208,x=213,j=214,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=209,h=216,a=213,b=212,i=211,k=210,l=209,x=214,j=215,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=209,h=216,a=214,b=213,i=212,k=211,l=210,x=215,j=216,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=213,h=220,a=215,b=214,i=213,k=212,l=211,x=216,j=217,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=213,h=220,a=216,b=215,i=214,k=213,l=212,x=217,j=218,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=213,h=220,a=217,b=216,i=215,k=214,l=213,x=218,j=219,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=213,h=220,a=218,b=217,i=216,k=215,l=214,x=219,j=220,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=217,h=224,a=219,b=218,i=217,k=216,l=215,x=220,j=221,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=217,h=224,a=220,b=219,i=218,k=217,l=216,x=221,j=222,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=217,h=224,a=221,b=220,i=219,k=218,l=217,x=222,j=223,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=217,h=224,a=222,b=221,i=220,k=219,l=218,x=223,j=224,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=221,h=228,a=223,b=222,i=221,k=220,l=219,x=224,j=225,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=221,h=228,a=224,b=223,i=222,k=221,l=220,x=225,j=226,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=221,h=228,a=225,b=224,i=223,k=222,l=221,x=226,j=227,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=221,h=228,a=226,b=225,i=224,k=223,l=222,x=227,j=228,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=225,h=232,a=227,b=226,i=225,k=224,l=223,x=228,j=229,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=225,h=232,a=228,b=227,i=226,k=225,l=224,x=229,j=230,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=225,h=232,a=229,b=228,i=227,k=226,l=225,x=230,j=231,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=225,h=232,a=230,b=229,i=228,k=227,l=226,x=231,j=232,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=229,h=236,a=231,b=230,i=229,k=228,l=227,x=232,j=233,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=229,h=236,a=232,b=231,i=230,k=229,l=228,x=233,j=234,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=229,h=236,a=233,b=232,i=231,k=230,l=229,x=234,j=235,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=229,h=236,a=234,b=233,i=232,k=231,l=230,x=235,j=236,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=233,h=240,a=235,b=234,i=233,k=232,l=231,x=236,j=237,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=233,h=240,a=236,b=235,i=234,k=233,l=232,x=237,j=238,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=233,h=240,a=237,b=236,i=235,k=234,l=233,x=238,j=239,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=233,h=240,a=238,b=237,i=236,k=235,l=234,x=239,j=240,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=237,h=244,a=239,b=238,i=237,k=236,l=235,x=240,j=241,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=237,h=244,a=240,b=239,i=238,k=237,l=236,x=241,j=242,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=237,h=244,a=241,b=240,i=239,k=238,l=237,x=242,j=243,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=237,h=244,a=242,b=241,i=240,k=239,l=238,x=243,j=244,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=241,h=248,a=243,b=242,i=241,k=240,l=239,x=244,j=245,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=241,h=248,a=244,b=243,i=242,k=241,l=240,x=245,j=246,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=241,h=248,a=245,b=244,i=243,k=242,l=241,x=246,j=247,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=241,h=248,a=246,b=245,i=244,k=243,l=242,x=247,j=248,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=245,h=252,a=247,b=246,i=245,k=244,l=243,x=248,j=249,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=245,h=252,a=248,b=247,i=246,k=245,l=244,x=249,j=250,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=245,h=252,a=249,b=248,i=247,k=246,l=245,x=250,j=251,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=245,h=252,a=250,b=249,i=248,k=247,l=246,x=251,j=252,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=249,h=256,a=251,b=250,i=249,k=248,l=247,x=252,j=253,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=249,h=256,a=252,b=251,i=250,k=249,l=248,x=253,j=254,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=249,h=256,a=253,b=252,i=251,k=250,l=249,x=254,j=255,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=249,h=256,a=254,b=253,i=252,k=251,l=250,x=255,j=256,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=253,h=260,a=255,b=254,i=253,k=252,l=251,x=256,j=257,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=253,h=260,a=256,b=255,i=254,k=253,l=252,x=257,j=258,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=253,h=260,a=257,b=256,i=255,k=254,l=253,x=258,j=259,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=253,h=260,a=258,b=257,i=256,k=255,l=254,x=259,j=260,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=257,h=264,a=259,b=258,i=257,k=256,l=255,x=260,j=261,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=257,h=264,a=260,b=259,i=258,k=257,l=256,x=261,j=262,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=257,h=264,a=261,b=260,i=259,k=258,l=257,x=262,j=263,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=257,h=264,a=262,b=261,i=260,k=259,l=258,x=263,j=264,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=261,h=268,a=263,b=262,i=261,k=260,l=259,x=264,j=265,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=261,h=268,a=264,b=263,i=262,k=261,l=260,x=265,j=266,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=261,h=268,a=265,b=264,i=263,k=262,l=261,x=266,j=267,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=261,h=268,a=266,b=265,i=264,k=263,l=262,x=267,j=268,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=265,h=272,a=267,b=266,i=265,k=264,l=263,x=268,j=269,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=265,h=272,a=268,b=267,i=266,k=265,l=264,x=269,j=270,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=265,h=272,a=269,b=268,i=267,k=266,l=265,x=270,j=271,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=265,h=272,a=270,b=269,i=268,k=267,l=266,x=271,j=272,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=269,h=276,a=271,b=270,i=269,k=268,l=267,x=272,j=273,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=269,h=276,a=272,b=271,i=270,k=269,l=268,x=273,j=274,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=269,h=276,a=273,b=272,i=271,k=270,l=269,x=274,j=275,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=269,h=276,a=274,b=273,i=272,k=271,l=270,x=275,j=276,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=273,h=280,a=275,b=274,i=273,k=272,l=271,x=276,j=277,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=273,h=280,a=276,b=275,i=274,k=273,l=272,x=277,j=278,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=273,h=280,a=277,b=276,i=275,k=274,l=273,x=278,j=279,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=273,h=280,a=278,b=277,i=276,k=275,l=274,x=279,j=280,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=277,h=284,a=279,b=278,i=277,k=276,l=275,x=280,j=281,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=277,h=284,a=280,b=279,i=278,k=277,l=276,x=281,j=282,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=277,h=284,a=281,b=280,i=279,k=278,l=277,x=282,j=283,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=277,h=284,a=282,b=281,i=280,k=279,l=278,x=283,j=284,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=281,h=288,a=283,b=282,i=281,k=280,l=279,x=284,j=285,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=281,h=288,a=284,b=283,i=282,k=281,l=280,x=285,j=286,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=281,h=288,a=285,b=284,i=283,k=282,l=281,x=286,j=287,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=281,h=288,a=286,b=285,i=284,k=283,l=282,x=287,j=288,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=285,h=292,a=287,b=286,i=285,k=284,l=283,x=288,j=289,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=285,h=292,a=288,b=287,i=286,k=285,l=284,x=289,j=290,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=285,h=292,a=289,b=288,i=287,k=286,l=285,x=290,j=291,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=285,h=292,a=290,b=289,i=288,k=287,l=286,x=291,j=292,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=289,h=296,a=291,b=290,i=289,k=288,l=287,x=292,j=293,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=289,h=296,a=292,b=291,i=290,k=289,l=288,x=293,j=294,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=289,h=296,a=293,b=292,i=291,k=290,l=289,x=294,j=295,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=289,h=296,a=294,b=293,i=292,k=291,l=290,x=295,j=296,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=293,h=300,a=295,b=294,i=293,k=292,l=291,x=296,j=297,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=293,h=300,a=296,b=295,i=294,k=293,l=292,x=297,j=298,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=293,h=300,a=297,b=296,i=295,k=294,l=293,x=298,j=299,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=293,h=300,a=298,b=297,i=296,k=295,l=294,x=299,j=300,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=297,h=304,a=299,b=298,i=297,k=296,l=295,x=300,j=301,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=297,h=304,a=300,b=299,i=298,k=297,l=296,x=301,j=302,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=297,h=304,a=301,b=300,i=299,k=298,l=297,x=302,j=303,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=297,h=304,a=302,b=301,i=300,k=299,l=298,x=303,j=304,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=301,h=308,a=303,b=302,i=301,k=300,l=199,x=304,j=305,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=301,h=308,a=304,b=303,i=302,k=301,l=300,x=305,j=306,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=301,h=308,a=305,b=304,i=303,k=302,l=301,x=306,j=307,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=301,h=308,a=306,b=305,i=304,k=303,l=302,x=307,j=308,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=305,h=312,a=307,b=306,i=305,k=304,l=303,x=308,j=309,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=305,h=312,a=308,b=307,i=306,k=305,l=304,x=309,j=310,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=305,h=312,a=309,b=308,i=307,k=306,l=305,x=310,j=311,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=305,h=312,a=310,b=309,i=308,k=307,l=306,x=311,j=312,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=309,h=316,a=311,b=310,i=309,k=308,l=307,x=312,j=313,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=309,h=316,a=312,b=311,i=310,k=309,l=308,x=313,j=314,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=309,h=316,a=313,b=312,i=311,k=310,l=309,x=314,j=315,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=309,h=316,a=314,b=313,i=312,k=311,l=310,x=315,j=316,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=313,h=320,a=315,b=314,i=313,k=312,l=311,x=316,j=317,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=313,h=320,a=316,b=315,i=314,k=313,l=312,x=317,j=318,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=313,h=320,a=317,b=316,i=315,k=314,l=313,x=318,j=319,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=313,h=320,a=318,b=317,i=316,k=315,l=314,x=319,j=320,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=317,h=324,a=319,b=318,i=317,k=316,l=315,x=320,j=321,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=317,h=324,a=320,b=319,i=318,k=317,l=316,x=321,j=322,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=317,h=324,a=321,b=320,i=319,k=318,l=317,x=322,j=323,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=317,h=324,a=322,b=321,i=320,k=319,l=318,x=323,j=324,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=321,h=328,a=323,b=322,i=321,k=320,l=319,x=324,j=325,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=321,h=328,a=324,b=323,i=322,k=321,l=320,x=325,j=326,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=321,h=328,a=325,b=324,i=323,k=322,l=321,x=326,j=327,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=321,h=328,a=326,b=325,i=324,k=323,l=322,x=327,j=328,s=0);


data r1; set a;

%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,a=125,b=124,i=123,k=122,l=121,x=126,j=127,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=121,h=128,a=124,b=123,i=122,k=121,l=120,x=125,j=126,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,a=125,b=124,i=123,k=122,l=121,x=126,j=127,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=121,h=128,a=126,b=125,i=124,k=123,l=122,x=127,j=128,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=125,h=132,a=127,b=126,i=125,k=124,l=123,x=128,j=129,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=125,h=132,a=128,b=127,i=126,k=125,l=124,x=129,j=130,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=125,h=132,a=129,b=128,i=127,k=126,l=125,x=130,j=131,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=125,h=132,a=130,b=129,i=128,k=127,l=126,x=131,j=132,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=129,h=136,a=131,b=130,i=129,k=128,l=127,x=132,j=133,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=129,h=136,a=132,b=131,i=130,k=129,l=128,x=133,j=134,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=129,h=136,a=133,b=132,i=131,k=130,l=129,x=134,j=135,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=129,h=136,a=134,b=133,i=132,k=131,l=130,x=135,j=136,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=133,h=140,a=135,b=134,i=133,k=132,l=131,x=136,j=137,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=133,h=140,a=136,b=135,i=134,k=133,l=132,x=137,j=138,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=133,h=140,a=137,b=136,i=135,k=134,l=133,x=138,j=139,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=133,h=140,a=138,b=137,i=136,k=135,l=134,x=139,j=140,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=137,h=144,a=139,b=138,i=137,k=136,l=135,x=140,j=141,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=137,h=144,a=140,b=139,i=138,k=137,l=136,x=141,j=142,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=137,h=144,a=141,b=140,i=139,k=138,l=137,x=142,j=143,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=137,h=144,a=142,b=141,i=140,k=139,l=138,x=143,j=144,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=141,h=148,a=143,b=142,i=141,k=140,l=139,x=144,j=145,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=141,h=148,a=144,b=143,i=142,k=141,l=140,x=145,j=146,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=141,h=148,a=145,b=144,i=143,k=142,l=141,x=146,j=147,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=141,h=148,a=146,b=145,i=144,k=143,l=142,x=147,j=148,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=145,h=152,a=147,b=146,i=145,k=144,l=143,x=148,j=149,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=145,h=152,a=148,b=147,i=146,k=145,l=144,x=149,j=150,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=145,h=152,a=149,b=148,i=147,k=146,l=145,x=150,j=151,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=145,h=152,a=150,b=149,i=148,k=147,l=146,x=151,j=152,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=149,h=156,a=151,b=150,i=149,k=148,l=147,x=152,j=153,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=149,h=156,a=152,b=151,i=150,k=149,l=148,x=153,j=154,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=149,h=156,a=153,b=152,i=151,k=150,l=149,x=154,j=155,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=149,h=156,a=154,b=153,i=152,k=151,l=150,x=155,j=156,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=153,h=160,a=155,b=154,i=153,k=152,l=151,x=156,j=157,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=153,h=160,a=156,b=155,i=154,k=153,l=152,x=157,j=158,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=153,h=160,a=157,b=156,i=155,k=154,l=153,x=158,j=159,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=153,h=160,a=158,b=157,i=156,k=155,l=154,x=159,j=160,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=157,h=164,a=159,b=158,i=157,k=156,l=155,x=160,j=161,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=157,h=164,a=160,b=159,i=158,k=157,l=156,x=161,j=162,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=157,h=164,a=161,b=160,i=159,k=158,l=157,x=162,j=163,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=157,h=164,a=162,b=161,i=160,k=159,l=158,x=163,j=164,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=161,h=168,a=163,b=162,i=161,k=160,l=159,x=164,j=165,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=161,h=168,a=164,b=163,i=162,k=161,l=160,x=165,j=166,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=161,h=168,a=165,b=164,i=163,k=162,l=161,x=166,j=167,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=161,h=168,a=166,b=165,i=164,k=163,l=162,x=167,j=168,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=165,h=172,a=167,b=166,i=165,k=164,l=163,x=168,j=169,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=165,h=172,a=168,b=167,i=166,k=165,l=164,x=169,j=170,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=165,h=172,a=169,b=168,i=167,k=166,l=165,x=170,j=171,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=165,h=172,a=170,b=169,i=168,k=167,l=166,x=171,j=172,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=169,h=176,a=171,b=170,i=169,k=168,l=167,x=172,j=173,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=169,h=176,a=172,b=171,i=170,k=169,l=168,x=173,j=174,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=169,h=176,a=173,b=172,i=171,k=170,l=169,x=174,j=175,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=169,h=176,a=174,b=173,i=172,k=171,l=170,x=175,j=176,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=173,h=180,a=175,b=174,i=173,k=172,l=171,x=176,j=177,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=173,h=180,a=176,b=175,i=174,k=173,l=172,x=177,j=178,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=173,h=180,a=177,b=176,i=175,k=174,l=173,x=178,j=179,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=173,h=180,a=178,b=177,i=176,k=175,l=174,x=179,j=180,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=177,h=184,a=179,b=178,i=177,k=176,l=175,x=180,j=181,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=177,h=184,a=180,b=179,i=178,k=177,l=176,x=181,j=182,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=177,h=184,a=181,b=180,i=179,k=178,l=177,x=182,j=183,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=177,h=184,a=182,b=181,i=180,k=179,l=178,x=183,j=184,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=181,h=188,a=183,b=182,i=181,k=180,l=179,x=184,j=185,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=181,h=188,a=184,b=183,i=182,k=181,l=180,x=185,j=186,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=181,h=188,a=185,b=184,i=183,k=182,l=181,x=186,j=187,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=181,h=188,a=186,b=185,i=184,k=183,l=182,x=187,j=188,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=185,h=192,a=187,b=186,i=185,k=184,l=183,x=188,j=189,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=185,h=192,a=188,b=187,i=186,k=185,l=184,x=189,j=190,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=185,h=192,a=189,b=188,i=187,k=186,l=185,x=190,j=191,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=185,h=192,a=190,b=189,i=188,k=187,l=186,x=191,j=192,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=189,h=196,a=191,b=190,i=189,k=188,l=187,x=192,j=193,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=189,h=196,a=192,b=191,i=190,k=189,l=188,x=193,j=194,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=189,h=196,a=193,b=192,i=191,k=190,l=189,x=194,j=195,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=189,h=196,a=194,b=193,i=192,k=191,l=190,x=195,j=196,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=193,h=200,a=195,b=194,i=193,k=192,l=191,x=196,j=197,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=193,h=200,a=196,b=195,i=194,k=193,l=192,x=197,j=198,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=193,h=200,a=197,b=196,i=195,k=194,l=193,x=198,j=199,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=193,h=200,a=198,b=197,i=196,k=195,l=194,x=199,j=200,s=1);   
%update_r1(da1=1,da2=2,e=5,f=6,g=197,h=204,a=199,b=198,i=197,k=196,l=195,x=200,j=201,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=197,h=204,a=200,b=199,i=198,k=197,l=196,x=201,j=202,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=197,h=204,a=201,b=200,i=199,k=198,l=197,x=202,j=203,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=197,h=204,a=202,b=201,i=200,k=199,l=198,x=203,j=204,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=201,h=208,a=203,b=202,i=201,k=200,l=199,x=204,j=205,s=1);

%update_r1(da1=2,da2=1,e=8,f=9,g=197,h=204,a=202,b=201,i=200,k=199,l=198,x=203,j=204,s=1);  
%update_r1(da1=1,da2=2,e=5,f=6,g=201,h=208,a=203,b=202,i=201,k=200,l=199,x=204,j=205,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=201,h=208,a=204,b=203,i=202,k=201,l=200,x=205,j=206,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=201,h=208,a=205,b=204,i=203,k=202,l=201,x=206,j=207,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=201,h=208,a=206,b=205,i=204,k=203,l=202,x=207,j=208,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=205,h=212,a=207,b=206,i=205,k=204,l=203,x=208,j=209,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=205,h=212,a=208,b=207,i=206,k=205,l=204,x=209,j=210,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=205,h=212,a=209,b=208,i=207,k=206,l=205,x=210,j=211,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=205,h=212,a=210,b=209,i=208,k=207,l=206,x=211,j=212,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=209,h=216,a=211,b=210,i=209,k=208,l=207,x=212,j=213,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=209,h=216,a=212,b=211,i=210,k=209,l=208,x=213,j=214,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=209,h=216,a=213,b=212,i=211,k=210,l=209,x=214,j=215,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=209,h=216,a=214,b=213,i=212,k=211,l=210,x=215,j=216,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=213,h=220,a=215,b=214,i=213,k=212,l=211,x=216,j=217,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=213,h=220,a=216,b=215,i=214,k=213,l=212,x=217,j=218,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=213,h=220,a=217,b=216,i=215,k=214,l=213,x=218,j=219,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=213,h=220,a=218,b=217,i=216,k=215,l=214,x=219,j=220,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=217,h=224,a=219,b=218,i=217,k=216,l=215,x=220,j=221,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=217,h=224,a=220,b=219,i=218,k=217,l=216,x=221,j=222,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=217,h=224,a=221,b=220,i=219,k=218,l=217,x=222,j=223,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=217,h=224,a=222,b=221,i=220,k=219,l=218,x=223,j=224,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=221,h=228,a=223,b=222,i=221,k=220,l=219,x=224,j=225,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=221,h=228,a=224,b=223,i=222,k=221,l=220,x=225,j=226,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=221,h=228,a=225,b=224,i=223,k=222,l=221,x=226,j=227,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=221,h=228,a=226,b=225,i=224,k=223,l=222,x=227,j=228,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=225,h=232,a=227,b=226,i=225,k=224,l=223,x=228,j=229,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=225,h=232,a=228,b=227,i=226,k=225,l=224,x=229,j=230,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=225,h=232,a=229,b=228,i=227,k=226,l=225,x=230,j=231,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=225,h=232,a=230,b=229,i=228,k=227,l=226,x=231,j=232,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=229,h=236,a=231,b=230,i=229,k=228,l=227,x=232,j=233,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=229,h=236,a=232,b=231,i=230,k=229,l=228,x=233,j=234,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=229,h=236,a=233,b=232,i=231,k=230,l=229,x=234,j=235,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=229,h=236,a=234,b=233,i=232,k=231,l=230,x=235,j=236,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=233,h=240,a=235,b=234,i=233,k=232,l=231,x=236,j=237,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=233,h=240,a=236,b=235,i=234,k=233,l=232,x=237,j=238,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=233,h=240,a=237,b=236,i=235,k=234,l=233,x=238,j=239,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=233,h=240,a=238,b=237,i=236,k=235,l=234,x=239,j=240,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=237,h=244,a=239,b=238,i=237,k=236,l=235,x=240,j=241,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=237,h=244,a=240,b=239,i=238,k=237,l=236,x=241,j=242,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=237,h=244,a=241,b=240,i=239,k=238,l=237,x=242,j=243,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=237,h=244,a=242,b=241,i=240,k=239,l=238,x=243,j=244,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=241,h=248,a=243,b=242,i=241,k=240,l=239,x=244,j=245,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=241,h=248,a=244,b=243,i=242,k=241,l=240,x=245,j=246,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=241,h=248,a=245,b=244,i=243,k=242,l=241,x=246,j=247,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=241,h=248,a=246,b=245,i=244,k=243,l=242,x=247,j=248,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=245,h=252,a=247,b=246,i=245,k=244,l=243,x=248,j=249,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=245,h=252,a=248,b=247,i=246,k=245,l=244,x=249,j=250,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=245,h=252,a=249,b=248,i=247,k=246,l=245,x=250,j=251,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=245,h=252,a=250,b=249,i=248,k=247,l=246,x=251,j=252,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=249,h=256,a=251,b=250,i=249,k=248,l=247,x=252,j=253,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=249,h=256,a=252,b=251,i=250,k=249,l=248,x=253,j=254,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=249,h=256,a=253,b=252,i=251,k=250,l=249,x=254,j=255,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=249,h=256,a=254,b=253,i=252,k=251,l=250,x=255,j=256,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=253,h=260,a=255,b=254,i=253,k=252,l=251,x=256,j=257,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=253,h=260,a=256,b=255,i=254,k=253,l=252,x=257,j=258,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=253,h=260,a=257,b=256,i=255,k=254,l=253,x=258,j=259,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=253,h=260,a=258,b=257,i=256,k=255,l=254,x=259,j=260,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=257,h=264,a=259,b=258,i=257,k=256,l=255,x=260,j=261,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=257,h=264,a=260,b=259,i=258,k=257,l=256,x=261,j=262,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=257,h=264,a=261,b=260,i=259,k=258,l=257,x=262,j=263,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=257,h=264,a=262,b=261,i=260,k=259,l=258,x=263,j=264,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=261,h=268,a=263,b=262,i=261,k=260,l=259,x=264,j=265,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=261,h=268,a=264,b=263,i=262,k=261,l=260,x=265,j=266,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=261,h=268,a=265,b=264,i=263,k=262,l=261,x=266,j=267,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=261,h=268,a=266,b=265,i=264,k=263,l=262,x=267,j=268,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=265,h=272,a=267,b=266,i=265,k=264,l=263,x=268,j=269,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=265,h=272,a=268,b=267,i=266,k=265,l=264,x=269,j=270,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=265,h=272,a=269,b=268,i=267,k=266,l=265,x=270,j=271,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=265,h=272,a=270,b=269,i=268,k=267,l=266,x=271,j=272,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=269,h=276,a=271,b=270,i=269,k=268,l=267,x=272,j=273,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=269,h=276,a=272,b=271,i=270,k=269,l=268,x=273,j=274,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=269,h=276,a=273,b=272,i=271,k=270,l=269,x=274,j=275,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=269,h=276,a=274,b=273,i=272,k=271,l=270,x=275,j=276,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=273,h=280,a=275,b=274,i=273,k=272,l=271,x=276,j=277,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=273,h=280,a=276,b=275,i=274,k=273,l=272,x=277,j=278,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=273,h=280,a=277,b=276,i=275,k=274,l=273,x=278,j=279,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=273,h=280,a=278,b=277,i=276,k=275,l=274,x=279,j=280,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=277,h=284,a=279,b=278,i=277,k=276,l=275,x=280,j=281,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=277,h=284,a=280,b=279,i=278,k=277,l=276,x=281,j=282,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=277,h=284,a=281,b=280,i=279,k=278,l=277,x=282,j=283,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=277,h=284,a=282,b=281,i=280,k=279,l=278,x=283,j=284,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=281,h=288,a=283,b=282,i=281,k=280,l=279,x=284,j=285,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=281,h=288,a=284,b=283,i=282,k=281,l=280,x=285,j=286,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=281,h=288,a=285,b=284,i=283,k=282,l=281,x=286,j=287,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=281,h=288,a=286,b=285,i=284,k=283,l=282,x=287,j=288,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=285,h=292,a=287,b=286,i=285,k=284,l=283,x=288,j=289,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=285,h=292,a=288,b=287,i=286,k=285,l=284,x=289,j=290,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=285,h=292,a=289,b=288,i=287,k=286,l=285,x=290,j=291,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=285,h=292,a=290,b=289,i=288,k=287,l=286,x=291,j=292,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=289,h=296,a=291,b=290,i=289,k=288,l=287,x=292,j=293,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=289,h=296,a=292,b=291,i=290,k=289,l=288,x=293,j=294,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=289,h=296,a=293,b=292,i=291,k=290,l=289,x=294,j=295,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=289,h=296,a=294,b=293,i=292,k=291,l=290,x=295,j=296,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=293,h=300,a=295,b=294,i=293,k=292,l=291,x=296,j=297,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=293,h=300,a=296,b=295,i=294,k=293,l=292,x=297,j=298,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=293,h=300,a=297,b=296,i=295,k=294,l=293,x=298,j=299,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=293,h=300,a=298,b=297,i=296,k=295,l=294,x=299,j=300,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=297,h=304,a=299,b=298,i=297,k=296,l=295,x=300,j=301,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=297,h=304,a=300,b=299,i=298,k=297,l=296,x=301,j=302,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=297,h=304,a=301,b=300,i=299,k=298,l=297,x=302,j=303,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=297,h=304,a=302,b=301,i=300,k=299,l=298,x=303,j=304,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=301,h=308,a=303,b=302,i=301,k=300,l=199,x=304,j=305,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=301,h=308,a=304,b=303,i=302,k=301,l=300,x=305,j=306,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=301,h=308,a=305,b=304,i=303,k=302,l=301,x=306,j=307,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=301,h=308,a=306,b=305,i=304,k=303,l=302,x=307,j=308,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=305,h=312,a=307,b=306,i=305,k=304,l=303,x=308,j=309,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=305,h=312,a=308,b=307,i=306,k=305,l=304,x=309,j=310,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=305,h=312,a=309,b=308,i=307,k=306,l=305,x=310,j=311,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=305,h=312,a=310,b=309,i=308,k=307,l=306,x=311,j=312,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=309,h=316,a=311,b=310,i=309,k=308,l=307,x=312,j=313,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=309,h=316,a=312,b=311,i=310,k=309,l=308,x=313,j=314,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=309,h=316,a=313,b=312,i=311,k=310,l=309,x=314,j=315,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=309,h=316,a=314,b=313,i=312,k=311,l=310,x=315,j=316,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=313,h=320,a=315,b=314,i=313,k=312,l=311,x=316,j=317,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=313,h=320,a=316,b=315,i=314,k=313,l=312,x=317,j=318,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=313,h=320,a=317,b=316,i=315,k=314,l=313,x=318,j=319,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=313,h=320,a=318,b=317,i=316,k=315,l=314,x=319,j=320,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=317,h=324,a=319,b=318,i=317,k=316,l=315,x=320,j=321,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=317,h=324,a=320,b=319,i=318,k=317,l=316,x=321,j=322,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=317,h=324,a=321,b=320,i=319,k=318,l=317,x=322,j=323,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=317,h=324,a=322,b=321,i=320,k=319,l=318,x=323,j=324,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=321,h=328,a=323,b=322,i=321,k=320,l=319,x=324,j=325,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=321,h=328,a=324,b=323,i=322,k=321,l=320,x=325,j=326,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=321,h=328,a=325,b=324,i=323,k=322,l=321,x=326,j=327,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=321,h=328,a=326,b=325,i=324,k=323,l=322,x=327,j=328,s=1);


/*

data r1; set a;

%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,a=125,b=124,i=123,k=122,l=121,x=126,j=127,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=117,h=124,a=122,b=121,i=120,k=119,l=118,x=123,j=124,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=121,h=128,a=123,b=122,i=121,k=120,l=119,x=124,j=125,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=121,h=128,a=124,b=123,i=122,k=121,l=120,x=125,j=126,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,a=125,b=124,i=123,k=122,l=121,x=126,j=127,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=121,h=128,a=126,b=125,i=124,k=123,l=122,x=127,j=128,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=125,h=132,a=127,b=126,i=125,k=124,l=123,x=128,j=129,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=125,h=132,a=128,b=127,i=126,k=125,l=124,x=129,j=130,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=125,h=132,a=129,b=128,i=127,k=126,l=125,x=130,j=131,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=125,h=132,a=130,b=129,i=128,k=127,l=126,x=131,j=132,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=129,h=136,a=131,b=130,i=129,k=128,l=127,x=132,j=133,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=129,h=136,a=132,b=131,i=130,k=129,l=128,x=133,j=134,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=129,h=136,a=133,b=132,i=131,k=130,l=129,x=134,j=135,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=129,h=136,a=134,b=133,i=132,k=131,l=130,x=135,j=136,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=133,h=140,a=135,b=134,i=133,k=132,l=131,x=136,j=137,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=133,h=140,a=136,b=135,i=134,k=133,l=132,x=137,j=138,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=133,h=140,a=137,b=136,i=135,k=134,l=133,x=138,j=139,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=133,h=140,a=138,b=137,i=136,k=135,l=134,x=139,j=140,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=137,h=144,a=139,b=138,i=137,k=136,l=135,x=140,j=141,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=137,h=144,a=140,b=139,i=138,k=137,l=136,x=141,j=142,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=137,h=144,a=141,b=140,i=139,k=138,l=137,x=142,j=143,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=137,h=144,a=142,b=141,i=140,k=139,l=138,x=143,j=144,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=141,h=148,a=143,b=142,i=141,k=140,l=139,x=144,j=145,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=141,h=148,a=144,b=143,i=142,k=141,l=140,x=145,j=146,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=141,h=148,a=145,b=144,i=143,k=142,l=141,x=146,j=147,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=141,h=148,a=146,b=145,i=144,k=143,l=142,x=147,j=148,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=145,h=152,a=147,b=146,i=145,k=144,l=143,x=148,j=149,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=145,h=152,a=148,b=147,i=146,k=145,l=144,x=149,j=150,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=145,h=152,a=149,b=148,i=147,k=146,l=145,x=150,j=151,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=145,h=152,a=150,b=149,i=148,k=147,l=146,x=151,j=152,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=149,h=156,a=151,b=150,i=149,k=148,l=147,x=152,j=153,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=149,h=156,a=152,b=151,i=150,k=149,l=148,x=153,j=154,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=149,h=156,a=153,b=152,i=151,k=150,l=149,x=154,j=155,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=149,h=156,a=154,b=153,i=152,k=151,l=150,x=155,j=156,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=153,h=160,a=155,b=154,i=153,k=152,l=151,x=156,j=157,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=153,h=160,a=156,b=155,i=154,k=153,l=152,x=157,j=158,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=153,h=160,a=157,b=156,i=155,k=154,l=153,x=158,j=159,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=153,h=160,a=158,b=157,i=156,k=155,l=154,x=159,j=160,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=157,h=164,a=159,b=158,i=157,k=156,l=155,x=160,j=161,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=157,h=164,a=160,b=159,i=158,k=157,l=156,x=161,j=162,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=157,h=164,a=161,b=160,i=159,k=158,l=157,x=162,j=163,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=157,h=164,a=162,b=161,i=160,k=159,l=158,x=163,j=164,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=161,h=168,a=163,b=162,i=161,k=160,l=159,x=164,j=165,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=161,h=168,a=164,b=163,i=162,k=161,l=160,x=165,j=166,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=161,h=168,a=165,b=164,i=163,k=162,l=161,x=166,j=167,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=161,h=168,a=166,b=165,i=164,k=163,l=162,x=167,j=168,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=165,h=172,a=167,b=166,i=165,k=164,l=163,x=168,j=169,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=165,h=172,a=168,b=167,i=166,k=165,l=164,x=169,j=170,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=165,h=172,a=169,b=168,i=167,k=166,l=165,x=170,j=171,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=165,h=172,a=170,b=169,i=168,k=167,l=166,x=171,j=172,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=169,h=176,a=171,b=170,i=169,k=168,l=167,x=172,j=173,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=169,h=176,a=172,b=171,i=170,k=169,l=168,x=173,j=174,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=169,h=176,a=173,b=172,i=171,k=170,l=169,x=174,j=175,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=169,h=176,a=174,b=173,i=172,k=171,l=170,x=175,j=176,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=173,h=180,a=175,b=174,i=173,k=172,l=171,x=176,j=177,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=173,h=180,a=176,b=175,i=174,k=173,l=172,x=177,j=178,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=173,h=180,a=177,b=176,i=175,k=174,l=173,x=178,j=179,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=173,h=180,a=178,b=177,i=176,k=175,l=174,x=179,j=180,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=177,h=184,a=179,b=178,i=177,k=176,l=175,x=180,j=181,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=177,h=184,a=180,b=179,i=178,k=177,l=176,x=181,j=182,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=177,h=184,a=181,b=180,i=179,k=178,l=177,x=182,j=183,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=177,h=184,a=182,b=181,i=180,k=179,l=178,x=183,j=184,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=181,h=188,a=183,b=182,i=181,k=180,l=179,x=184,j=185,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=181,h=188,a=184,b=183,i=182,k=181,l=180,x=185,j=186,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=181,h=188,a=185,b=184,i=183,k=182,l=181,x=186,j=187,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=181,h=188,a=186,b=185,i=184,k=183,l=182,x=187,j=188,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=185,h=192,a=187,b=186,i=185,k=184,l=183,x=188,j=189,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=185,h=192,a=188,b=187,i=186,k=185,l=184,x=189,j=190,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=185,h=192,a=189,b=188,i=187,k=186,l=185,x=190,j=191,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=185,h=192,a=190,b=189,i=188,k=187,l=186,x=191,j=192,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=189,h=196,a=191,b=190,i=189,k=188,l=187,x=192,j=193,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=189,h=196,a=192,b=191,i=190,k=189,l=188,x=193,j=194,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=189,h=196,a=193,b=192,i=191,k=190,l=189,x=194,j=195,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=189,h=196,a=194,b=193,i=192,k=191,l=190,x=195,j=196,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=193,h=200,a=195,b=194,i=193,k=192,l=191,x=196,j=197,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=193,h=200,a=196,b=195,i=194,k=193,l=192,x=197,j=198,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=193,h=200,a=197,b=196,i=195,k=194,l=193,x=198,j=199,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=193,h=200,a=198,b=197,i=196,k=195,l=194,x=199,j=200,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=197,h=204,a=199,b=198,i=197,k=196,l=195,x=200,j=201,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=197,h=204,a=200,b=199,i=198,k=197,l=196,x=201,j=202,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=197,h=204,a=201,b=200,i=199,k=198,l=197,x=202,j=203,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=197,h=204,a=202,b=201,i=200,k=199,l=198,x=203,j=204,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=201,h=208,a=203,b=202,i=201,k=200,l=199,x=204,j=205,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=201,h=208,a=204,b=203,i=202,k=201,l=200,x=205,j=206,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=201,h=208,a=205,b=204,i=203,k=202,l=201,x=206,j=207,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=201,h=208,a=206,b=205,i=204,k=203,l=202,x=207,j=208,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=205,h=212,a=207,b=206,i=205,k=204,l=203,x=208,j=209,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=205,h=212,a=208,b=207,i=206,k=205,l=204,x=209,j=210,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=205,h=212,a=209,b=208,i=207,k=206,l=205,x=210,j=211,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=205,h=212,a=210,b=209,i=208,k=207,l=206,x=211,j=212,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=209,h=216,a=211,b=210,i=209,k=208,l=207,x=212,j=213,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=209,h=216,a=212,b=211,i=210,k=209,l=208,x=213,j=214,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=209,h=216,a=213,b=212,i=211,k=210,l=209,x=214,j=215,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=209,h=216,a=214,b=213,i=212,k=211,l=210,x=215,j=216,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=213,h=220,a=215,b=214,i=213,k=212,l=211,x=216,j=217,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=213,h=220,a=216,b=215,i=214,k=213,l=212,x=217,j=218,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=213,h=220,a=217,b=216,i=215,k=214,l=213,x=218,j=219,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=213,h=220,a=218,b=217,i=216,k=215,l=214,x=219,j=220,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=217,h=224,a=219,b=218,i=217,k=216,l=215,x=220,j=221,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=217,h=224,a=220,b=219,i=218,k=217,l=216,x=221,j=222,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=217,h=224,a=221,b=220,i=219,k=218,l=217,x=222,j=223,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=217,h=224,a=222,b=221,i=220,k=219,l=218,x=223,j=224,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=221,h=228,a=223,b=222,i=221,k=220,l=219,x=224,j=225,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=221,h=228,a=224,b=223,i=222,k=221,l=220,x=225,j=226,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=221,h=228,a=225,b=224,i=223,k=222,l=221,x=226,j=227,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=221,h=228,a=226,b=225,i=224,k=223,l=222,x=227,j=228,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=225,h=232,a=227,b=226,i=225,k=224,l=223,x=228,j=229,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=225,h=232,a=228,b=227,i=226,k=225,l=224,x=229,j=230,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=225,h=232,a=229,b=228,i=227,k=226,l=225,x=230,j=231,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=225,h=232,a=230,b=229,i=228,k=227,l=226,x=231,j=232,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=229,h=236,a=231,b=230,i=229,k=228,l=227,x=232,j=233,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=229,h=236,a=232,b=231,i=230,k=229,l=228,x=233,j=234,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=229,h=236,a=233,b=232,i=231,k=230,l=229,x=234,j=235,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=229,h=236,a=234,b=233,i=232,k=231,l=230,x=235,j=236,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=233,h=240,a=235,b=234,i=233,k=232,l=231,x=236,j=237,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=233,h=240,a=236,b=235,i=234,k=233,l=232,x=237,j=238,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=233,h=240,a=237,b=236,i=235,k=234,l=233,x=238,j=239,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=233,h=240,a=238,b=237,i=236,k=235,l=234,x=239,j=240,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=237,h=244,a=239,b=238,i=237,k=236,l=235,x=240,j=241,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=237,h=244,a=240,b=239,i=238,k=237,l=236,x=241,j=242,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=237,h=244,a=241,b=240,i=239,k=238,l=237,x=242,j=243,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=237,h=244,a=242,b=241,i=240,k=239,l=238,x=243,j=244,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=241,h=248,a=243,b=242,i=241,k=240,l=239,x=244,j=245,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=241,h=248,a=244,b=243,i=242,k=241,l=240,x=245,j=246,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=241,h=248,a=245,b=244,i=243,k=242,l=241,x=246,j=247,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=241,h=248,a=246,b=245,i=244,k=243,l=242,x=247,j=248,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=245,h=252,a=247,b=246,i=245,k=244,l=243,x=248,j=249,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=245,h=252,a=248,b=247,i=246,k=245,l=244,x=249,j=250,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=245,h=252,a=249,b=248,i=247,k=246,l=245,x=250,j=251,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=245,h=252,a=250,b=249,i=248,k=247,l=246,x=251,j=252,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=249,h=256,a=251,b=250,i=249,k=248,l=247,x=252,j=253,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=249,h=256,a=252,b=251,i=250,k=249,l=248,x=253,j=254,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=249,h=256,a=253,b=252,i=251,k=250,l=249,x=254,j=255,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=249,h=256,a=254,b=253,i=252,k=251,l=250,x=255,j=256,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=253,h=260,a=255,b=254,i=253,k=252,l=251,x=256,j=257,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=253,h=260,a=256,b=255,i=254,k=253,l=252,x=257,j=258,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=253,h=260,a=257,b=256,i=255,k=254,l=253,x=258,j=259,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=253,h=260,a=258,b=257,i=256,k=255,l=254,x=259,j=260,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=257,h=264,a=259,b=258,i=257,k=256,l=255,x=260,j=261,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=257,h=264,a=260,b=259,i=258,k=257,l=256,x=261,j=262,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=257,h=264,a=261,b=260,i=259,k=258,l=257,x=262,j=263,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=257,h=264,a=262,b=261,i=260,k=259,l=258,x=263,j=264,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=261,h=268,a=263,b=262,i=261,k=260,l=259,x=264,j=265,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=261,h=268,a=264,b=263,i=262,k=261,l=260,x=265,j=266,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=261,h=268,a=265,b=264,i=263,k=262,l=261,x=266,j=267,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=261,h=268,a=266,b=265,i=264,k=263,l=262,x=267,j=268,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=265,h=272,a=267,b=266,i=265,k=264,l=263,x=268,j=269,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=265,h=272,a=268,b=267,i=266,k=265,l=264,x=269,j=270,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=265,h=272,a=269,b=268,i=267,k=266,l=265,x=270,j=271,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=265,h=272,a=270,b=269,i=268,k=267,l=266,x=271,j=272,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=269,h=276,a=271,b=270,i=269,k=268,l=267,x=272,j=273,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=269,h=276,a=272,b=271,i=270,k=269,l=268,x=273,j=274,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=269,h=276,a=273,b=272,i=271,k=270,l=269,x=274,j=275,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=269,h=276,a=274,b=273,i=272,k=271,l=270,x=275,j=276,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=273,h=280,a=275,b=274,i=273,k=272,l=271,x=276,j=277,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=273,h=280,a=276,b=275,i=274,k=273,l=272,x=277,j=278,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=273,h=280,a=277,b=276,i=275,k=274,l=273,x=278,j=279,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=273,h=280,a=278,b=277,i=276,k=275,l=274,x=279,j=280,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=277,h=284,a=279,b=278,i=277,k=276,l=275,x=280,j=281,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=277,h=284,a=280,b=279,i=278,k=277,l=276,x=281,j=282,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=277,h=284,a=281,b=280,i=279,k=278,l=277,x=282,j=283,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=277,h=284,a=282,b=281,i=280,k=279,l=278,x=283,j=284,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=281,h=288,a=283,b=282,i=281,k=280,l=279,x=284,j=285,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=281,h=288,a=284,b=283,i=282,k=281,l=280,x=285,j=286,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=281,h=288,a=285,b=284,i=283,k=282,l=281,x=286,j=287,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=281,h=288,a=286,b=285,i=284,k=283,l=282,x=287,j=288,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=285,h=292,a=287,b=286,i=285,k=284,l=283,x=288,j=289,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=285,h=292,a=288,b=287,i=286,k=285,l=284,x=289,j=290,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=285,h=292,a=289,b=288,i=287,k=286,l=285,x=290,j=291,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=285,h=292,a=290,b=289,i=288,k=287,l=286,x=291,j=292,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=289,h=296,a=291,b=290,i=289,k=288,l=287,x=292,j=293,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=289,h=296,a=292,b=291,i=290,k=289,l=288,x=293,j=294,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=289,h=296,a=293,b=292,i=291,k=290,l=289,x=294,j=295,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=289,h=296,a=294,b=293,i=292,k=291,l=290,x=295,j=296,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=293,h=300,a=295,b=294,i=293,k=292,l=291,x=296,j=297,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=293,h=300,a=296,b=295,i=294,k=293,l=292,x=297,j=298,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=293,h=300,a=297,b=296,i=295,k=294,l=293,x=298,j=299,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=293,h=300,a=298,b=297,i=296,k=295,l=294,x=299,j=300,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=297,h=304,a=299,b=298,i=297,k=296,l=295,x=300,j=301,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=297,h=304,a=300,b=299,i=298,k=297,l=296,x=301,j=302,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=297,h=304,a=301,b=300,i=299,k=298,l=297,x=302,j=303,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=297,h=304,a=302,b=301,i=300,k=299,l=298,x=303,j=304,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=301,h=308,a=303,b=302,i=301,k=300,l=199,x=304,j=305,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=301,h=308,a=304,b=303,i=302,k=301,l=300,x=305,j=306,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=301,h=308,a=305,b=304,i=303,k=302,l=301,x=306,j=307,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=301,h=308,a=306,b=305,i=304,k=303,l=302,x=307,j=308,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=305,h=312,a=307,b=306,i=305,k=304,l=303,x=308,j=309,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=305,h=312,a=308,b=307,i=306,k=305,l=304,x=309,j=310,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=305,h=312,a=309,b=308,i=307,k=306,l=305,x=310,j=311,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=305,h=312,a=310,b=309,i=308,k=307,l=306,x=311,j=312,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=309,h=316,a=311,b=310,i=309,k=308,l=307,x=312,j=313,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=309,h=316,a=312,b=311,i=310,k=309,l=308,x=313,j=314,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=309,h=316,a=313,b=312,i=311,k=310,l=309,x=314,j=315,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=309,h=316,a=314,b=313,i=312,k=311,l=310,x=315,j=316,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=313,h=320,a=315,b=314,i=313,k=312,l=311,x=316,j=317,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=313,h=320,a=316,b=315,i=314,k=313,l=312,x=317,j=318,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=313,h=320,a=317,b=316,i=315,k=314,l=313,x=318,j=319,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=313,h=320,a=318,b=317,i=316,k=315,l=314,x=319,j=320,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=317,h=324,a=319,b=318,i=317,k=316,l=315,x=320,j=321,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=317,h=324,a=320,b=319,i=318,k=317,l=316,x=321,j=322,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=317,h=324,a=321,b=320,i=319,k=318,l=317,x=322,j=323,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=317,h=324,a=322,b=321,i=320,k=319,l=318,x=323,j=324,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=321,h=328,a=323,b=322,i=321,k=320,l=319,x=324,j=325,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=321,h=328,a=324,b=323,i=322,k=321,l=320,x=325,j=326,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=321,h=328,a=325,b=324,i=323,k=322,l=321,x=326,j=327,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=321,h=328,a=326,b=325,i=324,k=323,l=322,x=327,j=328,s=0);



data r1; set a;

%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,a=125,b=124,i=123,k=122,l=121,x=126,j=127,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=121,h=128,a=126,b=125,i=124,k=123,l=122,x=127,j=128,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=125,h=132,a=127,b=126,i=125,k=124,l=123,x=128,j=129,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=125,h=132,a=128,b=127,i=126,k=125,l=124,x=129,j=130,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=125,h=132,a=129,b=128,i=127,k=126,l=125,x=130,j=131,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=125,h=132,a=130,b=129,i=128,k=127,l=126,x=131,j=132,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=129,h=136,a=131,b=130,i=129,k=128,l=127,x=132,j=133,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=129,h=136,a=132,b=131,i=130,k=129,l=128,x=133,j=134,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=129,h=136,a=133,b=132,i=131,k=130,l=129,x=134,j=135,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=129,h=136,a=134,b=133,i=132,k=131,l=130,x=135,j=136,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=133,h=140,a=135,b=134,i=133,k=132,l=131,x=136,j=137,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=133,h=140,a=136,b=135,i=134,k=133,l=132,x=137,j=138,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=133,h=140,a=137,b=136,i=135,k=134,l=133,x=138,j=139,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=133,h=140,a=138,b=137,i=136,k=135,l=134,x=139,j=140,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=137,h=144,a=139,b=138,i=137,k=136,l=135,x=140,j=141,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=137,h=144,a=140,b=139,i=138,k=137,l=136,x=141,j=142,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=137,h=144,a=141,b=140,i=139,k=138,l=137,x=142,j=143,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=137,h=144,a=142,b=141,i=140,k=139,l=138,x=143,j=144,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=141,h=148,a=143,b=142,i=141,k=140,l=139,x=144,j=145,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=141,h=148,a=144,b=143,i=142,k=141,l=140,x=145,j=146,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=141,h=148,a=145,b=144,i=143,k=142,l=141,x=146,j=147,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=141,h=148,a=146,b=145,i=144,k=143,l=142,x=147,j=148,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=145,h=152,a=147,b=146,i=145,k=144,l=143,x=148,j=149,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=145,h=152,a=148,b=147,i=146,k=145,l=144,x=149,j=150,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=145,h=152,a=149,b=148,i=147,k=146,l=145,x=150,j=151,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=145,h=152,a=150,b=149,i=148,k=147,l=146,x=151,j=152,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=149,h=156,a=151,b=150,i=149,k=148,l=147,x=152,j=153,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=149,h=156,a=152,b=151,i=150,k=149,l=148,x=153,j=154,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=149,h=156,a=153,b=152,i=151,k=150,l=149,x=154,j=155,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=149,h=156,a=154,b=153,i=152,k=151,l=150,x=155,j=156,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=153,h=160,a=155,b=154,i=153,k=152,l=151,x=156,j=157,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=153,h=160,a=156,b=155,i=154,k=153,l=152,x=157,j=158,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=153,h=160,a=157,b=156,i=155,k=154,l=153,x=158,j=159,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=153,h=160,a=158,b=157,i=156,k=155,l=154,x=159,j=160,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=157,h=164,a=159,b=158,i=157,k=156,l=155,x=160,j=161,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=157,h=164,a=160,b=159,i=158,k=157,l=156,x=161,j=162,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=157,h=164,a=161,b=160,i=159,k=158,l=157,x=162,j=163,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=157,h=164,a=162,b=161,i=160,k=159,l=158,x=163,j=164,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=161,h=168,a=163,b=162,i=161,k=160,l=159,x=164,j=165,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=161,h=168,a=164,b=163,i=162,k=161,l=160,x=165,j=166,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=161,h=168,a=165,b=164,i=163,k=162,l=161,x=166,j=167,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=161,h=168,a=166,b=165,i=164,k=163,l=162,x=167,j=168,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=165,h=172,a=167,b=166,i=165,k=164,l=163,x=168,j=169,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=165,h=172,a=168,b=167,i=166,k=165,l=164,x=169,j=170,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=165,h=172,a=169,b=168,i=167,k=166,l=165,x=170,j=171,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=165,h=172,a=170,b=169,i=168,k=167,l=166,x=171,j=172,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=169,h=176,a=171,b=170,i=169,k=168,l=167,x=172,j=173,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=169,h=176,a=172,b=171,i=170,k=169,l=168,x=173,j=174,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=169,h=176,a=173,b=172,i=171,k=170,l=169,x=174,j=175,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=169,h=176,a=174,b=173,i=172,k=171,l=170,x=175,j=176,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=173,h=180,a=175,b=174,i=173,k=172,l=171,x=176,j=177,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=173,h=180,a=176,b=175,i=174,k=173,l=172,x=177,j=178,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=173,h=180,a=177,b=176,i=175,k=174,l=173,x=178,j=179,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=173,h=180,a=178,b=177,i=176,k=175,l=174,x=179,j=180,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=177,h=184,a=179,b=178,i=177,k=176,l=175,x=180,j=181,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=177,h=184,a=180,b=179,i=178,k=177,l=176,x=181,j=182,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=177,h=184,a=181,b=180,i=179,k=178,l=177,x=182,j=183,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=177,h=184,a=182,b=181,i=180,k=179,l=178,x=183,j=184,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=181,h=188,a=183,b=182,i=181,k=180,l=179,x=184,j=185,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=181,h=188,a=184,b=183,i=182,k=181,l=180,x=185,j=186,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=181,h=188,a=185,b=184,i=183,k=182,l=181,x=186,j=187,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=181,h=188,a=186,b=185,i=184,k=183,l=182,x=187,j=188,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=185,h=192,a=187,b=186,i=185,k=184,l=183,x=188,j=189,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=185,h=192,a=188,b=187,i=186,k=185,l=184,x=189,j=190,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=185,h=192,a=189,b=188,i=187,k=186,l=185,x=190,j=191,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=185,h=192,a=190,b=189,i=188,k=187,l=186,x=191,j=192,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=189,h=196,a=191,b=190,i=189,k=188,l=187,x=192,j=193,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=189,h=196,a=192,b=191,i=190,k=189,l=188,x=193,j=194,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=189,h=196,a=193,b=192,i=191,k=190,l=189,x=194,j=195,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=189,h=196,a=194,b=193,i=192,k=191,l=190,x=195,j=196,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=193,h=200,a=195,b=194,i=193,k=192,l=191,x=196,j=197,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=193,h=200,a=196,b=195,i=194,k=193,l=192,x=197,j=198,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=193,h=200,a=197,b=196,i=195,k=194,l=193,x=198,j=199,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=193,h=200,a=198,b=197,i=196,k=195,l=194,x=199,j=200,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=197,h=204,a=199,b=198,i=197,k=196,l=195,x=200,j=201,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=197,h=204,a=200,b=199,i=198,k=197,l=196,x=201,j=202,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=197,h=204,a=201,b=200,i=199,k=198,l=197,x=202,j=203,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=197,h=204,a=202,b=201,i=200,k=199,l=198,x=203,j=204,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=201,h=208,a=203,b=202,i=201,k=200,l=199,x=204,j=205,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=201,h=208,a=204,b=203,i=202,k=201,l=200,x=205,j=206,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=201,h=208,a=205,b=204,i=203,k=202,l=201,x=206,j=207,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=201,h=208,a=206,b=205,i=204,k=203,l=202,x=207,j=208,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=205,h=212,a=207,b=206,i=205,k=204,l=203,x=208,j=209,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=205,h=212,a=208,b=207,i=206,k=205,l=204,x=209,j=210,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=205,h=212,a=209,b=208,i=207,k=206,l=205,x=210,j=211,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=205,h=212,a=210,b=209,i=208,k=207,l=206,x=211,j=212,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=209,h=216,a=211,b=210,i=209,k=208,l=207,x=212,j=213,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=209,h=216,a=212,b=211,i=210,k=209,l=208,x=213,j=214,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=209,h=216,a=213,b=212,i=211,k=210,l=209,x=214,j=215,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=209,h=216,a=214,b=213,i=212,k=211,l=210,x=215,j=216,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=213,h=220,a=215,b=214,i=213,k=212,l=211,x=216,j=217,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=213,h=220,a=216,b=215,i=214,k=213,l=212,x=217,j=218,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=213,h=220,a=217,b=216,i=215,k=214,l=213,x=218,j=219,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=213,h=220,a=218,b=217,i=216,k=215,l=214,x=219,j=220,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=217,h=224,a=219,b=218,i=217,k=216,l=215,x=220,j=221,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=217,h=224,a=220,b=219,i=218,k=217,l=216,x=221,j=222,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=217,h=224,a=221,b=220,i=219,k=218,l=217,x=222,j=223,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=217,h=224,a=222,b=221,i=220,k=219,l=218,x=223,j=224,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=221,h=228,a=223,b=222,i=221,k=220,l=219,x=224,j=225,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=221,h=228,a=224,b=223,i=222,k=221,l=220,x=225,j=226,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=221,h=228,a=225,b=224,i=223,k=222,l=221,x=226,j=227,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=221,h=228,a=226,b=225,i=224,k=223,l=222,x=227,j=228,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=225,h=232,a=227,b=226,i=225,k=224,l=223,x=228,j=229,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=225,h=232,a=228,b=227,i=226,k=225,l=224,x=229,j=230,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=225,h=232,a=229,b=228,i=227,k=226,l=225,x=230,j=231,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=225,h=232,a=230,b=229,i=228,k=227,l=226,x=231,j=232,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=229,h=236,a=231,b=230,i=229,k=228,l=227,x=232,j=233,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=229,h=236,a=232,b=231,i=230,k=229,l=228,x=233,j=234,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=229,h=236,a=233,b=232,i=231,k=230,l=229,x=234,j=235,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=229,h=236,a=234,b=233,i=232,k=231,l=230,x=235,j=236,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=233,h=240,a=235,b=234,i=233,k=232,l=231,x=236,j=237,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=233,h=240,a=236,b=235,i=234,k=233,l=232,x=237,j=238,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=233,h=240,a=237,b=236,i=235,k=234,l=233,x=238,j=239,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=233,h=240,a=238,b=237,i=236,k=235,l=234,x=239,j=240,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=237,h=244,a=239,b=238,i=237,k=236,l=235,x=240,j=241,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=237,h=244,a=240,b=239,i=238,k=237,l=236,x=241,j=242,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=237,h=244,a=241,b=240,i=239,k=238,l=237,x=242,j=243,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=237,h=244,a=242,b=241,i=240,k=239,l=238,x=243,j=244,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=241,h=248,a=243,b=242,i=241,k=240,l=239,x=244,j=245,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=241,h=248,a=244,b=243,i=242,k=241,l=240,x=245,j=246,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=241,h=248,a=245,b=244,i=243,k=242,l=241,x=246,j=247,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=241,h=248,a=246,b=245,i=244,k=243,l=242,x=247,j=248,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=245,h=252,a=247,b=246,i=245,k=244,l=243,x=248,j=249,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=245,h=252,a=248,b=247,i=246,k=245,l=244,x=249,j=250,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=245,h=252,a=249,b=248,i=247,k=246,l=245,x=250,j=251,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=245,h=252,a=250,b=249,i=248,k=247,l=246,x=251,j=252,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=249,h=256,a=251,b=250,i=249,k=248,l=247,x=252,j=253,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=249,h=256,a=252,b=251,i=250,k=249,l=248,x=253,j=254,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=249,h=256,a=253,b=252,i=251,k=250,l=249,x=254,j=255,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=249,h=256,a=254,b=253,i=252,k=251,l=250,x=255,j=256,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=253,h=260,a=255,b=254,i=253,k=252,l=251,x=256,j=257,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=253,h=260,a=256,b=255,i=254,k=253,l=252,x=257,j=258,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=253,h=260,a=257,b=256,i=255,k=254,l=253,x=258,j=259,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=253,h=260,a=258,b=257,i=256,k=255,l=254,x=259,j=260,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=257,h=264,a=259,b=258,i=257,k=256,l=255,x=260,j=261,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=257,h=264,a=260,b=259,i=258,k=257,l=256,x=261,j=262,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=257,h=264,a=261,b=260,i=259,k=258,l=257,x=262,j=263,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=257,h=264,a=262,b=261,i=260,k=259,l=258,x=263,j=264,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=261,h=268,a=263,b=262,i=261,k=260,l=259,x=264,j=265,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=261,h=268,a=264,b=263,i=262,k=261,l=260,x=265,j=266,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=261,h=268,a=265,b=264,i=263,k=262,l=261,x=266,j=267,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=261,h=268,a=266,b=265,i=264,k=263,l=262,x=267,j=268,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=265,h=272,a=267,b=266,i=265,k=264,l=263,x=268,j=269,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=265,h=272,a=268,b=267,i=266,k=265,l=264,x=269,j=270,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=265,h=272,a=269,b=268,i=267,k=266,l=265,x=270,j=271,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=265,h=272,a=270,b=269,i=268,k=267,l=266,x=271,j=272,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=269,h=276,a=271,b=270,i=269,k=268,l=267,x=272,j=273,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=269,h=276,a=272,b=271,i=270,k=269,l=268,x=273,j=274,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=269,h=276,a=273,b=272,i=271,k=270,l=269,x=274,j=275,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=269,h=276,a=274,b=273,i=272,k=271,l=270,x=275,j=276,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=273,h=280,a=275,b=274,i=273,k=272,l=271,x=276,j=277,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=273,h=280,a=276,b=275,i=274,k=273,l=272,x=277,j=278,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=273,h=280,a=277,b=276,i=275,k=274,l=273,x=278,j=279,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=273,h=280,a=278,b=277,i=276,k=275,l=274,x=279,j=280,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=277,h=284,a=279,b=278,i=277,k=276,l=275,x=280,j=281,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=277,h=284,a=280,b=279,i=278,k=277,l=276,x=281,j=282,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=277,h=284,a=281,b=280,i=279,k=278,l=277,x=282,j=283,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=277,h=284,a=282,b=281,i=280,k=279,l=278,x=283,j=284,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=281,h=288,a=283,b=282,i=281,k=280,l=279,x=284,j=285,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=281,h=288,a=284,b=283,i=282,k=281,l=280,x=285,j=286,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=281,h=288,a=285,b=284,i=283,k=282,l=281,x=286,j=287,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=281,h=288,a=286,b=285,i=284,k=283,l=282,x=287,j=288,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=285,h=292,a=287,b=286,i=285,k=284,l=283,x=288,j=289,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=285,h=292,a=288,b=287,i=286,k=285,l=284,x=289,j=290,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=285,h=292,a=289,b=288,i=287,k=286,l=285,x=290,j=291,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=285,h=292,a=290,b=289,i=288,k=287,l=286,x=291,j=292,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=289,h=296,a=291,b=290,i=289,k=288,l=287,x=292,j=293,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=289,h=296,a=292,b=291,i=290,k=289,l=288,x=293,j=294,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=289,h=296,a=293,b=292,i=291,k=290,l=289,x=294,j=295,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=289,h=296,a=294,b=293,i=292,k=291,l=290,x=295,j=296,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=293,h=300,a=295,b=294,i=293,k=292,l=291,x=296,j=297,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=293,h=300,a=296,b=295,i=294,k=293,l=292,x=297,j=298,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=293,h=300,a=297,b=296,i=295,k=294,l=293,x=298,j=299,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=293,h=300,a=298,b=297,i=296,k=295,l=294,x=299,j=300,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=297,h=304,a=299,b=298,i=297,k=296,l=295,x=300,j=301,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=297,h=304,a=300,b=299,i=298,k=297,l=296,x=301,j=302,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=297,h=304,a=301,b=300,i=299,k=298,l=297,x=302,j=303,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=297,h=304,a=302,b=301,i=300,k=299,l=298,x=303,j=304,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=301,h=308,a=303,b=302,i=301,k=300,l=199,x=304,j=305,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=301,h=308,a=304,b=303,i=302,k=301,l=300,x=305,j=306,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=301,h=308,a=305,b=304,i=303,k=302,l=301,x=306,j=307,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=301,h=308,a=306,b=305,i=304,k=303,l=302,x=307,j=308,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=305,h=312,a=307,b=306,i=305,k=304,l=303,x=308,j=309,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=305,h=312,a=308,b=307,i=306,k=305,l=304,x=309,j=310,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=305,h=312,a=309,b=308,i=307,k=306,l=305,x=310,j=311,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=305,h=312,a=310,b=309,i=308,k=307,l=306,x=311,j=312,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=309,h=316,a=311,b=310,i=309,k=308,l=307,x=312,j=313,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=309,h=316,a=312,b=311,i=310,k=309,l=308,x=313,j=314,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=309,h=316,a=313,b=312,i=311,k=310,l=309,x=314,j=315,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=309,h=316,a=314,b=313,i=312,k=311,l=310,x=315,j=316,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=313,h=320,a=315,b=314,i=313,k=312,l=311,x=316,j=317,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=313,h=320,a=316,b=315,i=314,k=313,l=312,x=317,j=318,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=313,h=320,a=317,b=316,i=315,k=314,l=313,x=318,j=319,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=313,h=320,a=318,b=317,i=316,k=315,l=314,x=319,j=320,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=317,h=324,a=319,b=318,i=317,k=316,l=315,x=320,j=321,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=317,h=324,a=320,b=319,i=318,k=317,l=316,x=321,j=322,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=317,h=324,a=321,b=320,i=319,k=318,l=317,x=322,j=323,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=317,h=324,a=322,b=321,i=320,k=319,l=318,x=323,j=324,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=321,h=328,a=323,b=322,i=321,k=320,l=319,x=324,j=325,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=321,h=328,a=324,b=323,i=322,k=321,l=320,x=325,j=326,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=321,h=328,a=325,b=324,i=323,k=322,l=321,x=326,j=327,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=321,h=328,a=326,b=325,i=324,k=323,l=322,x=327,j=328,s=1);



data r1; set a;

%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,a=125,b=124,i=123,k=122,l=121,x=126,j=127,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=121,h=128,a=126,b=125,i=124,k=123,l=122,x=127,j=128,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=125,h=132,a=127,b=126,i=125,k=124,l=123,x=128,j=129,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=125,h=132,a=128,b=127,i=126,k=125,l=124,x=129,j=130,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=125,h=132,a=129,b=128,i=127,k=126,l=125,x=130,j=131,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=125,h=132,a=130,b=129,i=128,k=127,l=126,x=131,j=132,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=129,h=136,a=131,b=130,i=129,k=128,l=127,x=132,j=133,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=129,h=136,a=132,b=131,i=130,k=129,l=128,x=133,j=134,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=129,h=136,a=133,b=132,i=131,k=130,l=129,x=134,j=135,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=129,h=136,a=134,b=133,i=132,k=131,l=130,x=135,j=136,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=133,h=140,a=135,b=134,i=133,k=132,l=131,x=136,j=137,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=133,h=140,a=136,b=135,i=134,k=133,l=132,x=137,j=138,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=133,h=140,a=137,b=136,i=135,k=134,l=133,x=138,j=139,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=133,h=140,a=138,b=137,i=136,k=135,l=134,x=139,j=140,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=137,h=144,a=139,b=138,i=137,k=136,l=135,x=140,j=141,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=137,h=144,a=140,b=139,i=138,k=137,l=136,x=141,j=142,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=137,h=144,a=141,b=140,i=139,k=138,l=137,x=142,j=143,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=137,h=144,a=142,b=141,i=140,k=139,l=138,x=143,j=144,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=141,h=148,a=143,b=142,i=141,k=140,l=139,x=144,j=145,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=141,h=148,a=144,b=143,i=142,k=141,l=140,x=145,j=146,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=141,h=148,a=145,b=144,i=143,k=142,l=141,x=146,j=147,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=141,h=148,a=146,b=145,i=144,k=143,l=142,x=147,j=148,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=145,h=152,a=147,b=146,i=145,k=144,l=143,x=148,j=149,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=145,h=152,a=148,b=147,i=146,k=145,l=144,x=149,j=150,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=145,h=152,a=149,b=148,i=147,k=146,l=145,x=150,j=151,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=145,h=152,a=150,b=149,i=148,k=147,l=146,x=151,j=152,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=149,h=156,a=151,b=150,i=149,k=148,l=147,x=152,j=153,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=149,h=156,a=152,b=151,i=150,k=149,l=148,x=153,j=154,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=149,h=156,a=153,b=152,i=151,k=150,l=149,x=154,j=155,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=149,h=156,a=154,b=153,i=152,k=151,l=150,x=155,j=156,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=153,h=160,a=155,b=154,i=153,k=152,l=151,x=156,j=157,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=153,h=160,a=156,b=155,i=154,k=153,l=152,x=157,j=158,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=153,h=160,a=157,b=156,i=155,k=154,l=153,x=158,j=159,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=153,h=160,a=158,b=157,i=156,k=155,l=154,x=159,j=160,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=157,h=164,a=159,b=158,i=157,k=156,l=155,x=160,j=161,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=157,h=164,a=160,b=159,i=158,k=157,l=156,x=161,j=162,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=157,h=164,a=161,b=160,i=159,k=158,l=157,x=162,j=163,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=157,h=164,a=162,b=161,i=160,k=159,l=158,x=163,j=164,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=161,h=168,a=163,b=162,i=161,k=160,l=159,x=164,j=165,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=161,h=168,a=164,b=163,i=162,k=161,l=160,x=165,j=166,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=161,h=168,a=165,b=164,i=163,k=162,l=161,x=166,j=167,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=161,h=168,a=166,b=165,i=164,k=163,l=162,x=167,j=168,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=165,h=172,a=167,b=166,i=165,k=164,l=163,x=168,j=169,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=165,h=172,a=168,b=167,i=166,k=165,l=164,x=169,j=170,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=165,h=172,a=169,b=168,i=167,k=166,l=165,x=170,j=171,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=165,h=172,a=170,b=169,i=168,k=167,l=166,x=171,j=172,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=169,h=176,a=171,b=170,i=169,k=168,l=167,x=172,j=173,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=169,h=176,a=172,b=171,i=170,k=169,l=168,x=173,j=174,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=169,h=176,a=173,b=172,i=171,k=170,l=169,x=174,j=175,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=169,h=176,a=174,b=173,i=172,k=171,l=170,x=175,j=176,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=173,h=180,a=175,b=174,i=173,k=172,l=171,x=176,j=177,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=173,h=180,a=176,b=175,i=174,k=173,l=172,x=177,j=178,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=173,h=180,a=177,b=176,i=175,k=174,l=173,x=178,j=179,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=173,h=180,a=178,b=177,i=176,k=175,l=174,x=179,j=180,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=177,h=184,a=179,b=178,i=177,k=176,l=175,x=180,j=181,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=177,h=184,a=180,b=179,i=178,k=177,l=176,x=181,j=182,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=177,h=184,a=181,b=180,i=179,k=178,l=177,x=182,j=183,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=177,h=184,a=182,b=181,i=180,k=179,l=178,x=183,j=184,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=181,h=188,a=183,b=182,i=181,k=180,l=179,x=184,j=185,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=181,h=188,a=184,b=183,i=182,k=181,l=180,x=185,j=186,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=181,h=188,a=185,b=184,i=183,k=182,l=181,x=186,j=187,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=181,h=188,a=186,b=185,i=184,k=183,l=182,x=187,j=188,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=185,h=192,a=187,b=186,i=185,k=184,l=183,x=188,j=189,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=185,h=192,a=188,b=187,i=186,k=185,l=184,x=189,j=190,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=185,h=192,a=189,b=188,i=187,k=186,l=185,x=190,j=191,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=185,h=192,a=190,b=189,i=188,k=187,l=186,x=191,j=192,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=189,h=196,a=191,b=190,i=189,k=188,l=187,x=192,j=193,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=189,h=196,a=192,b=191,i=190,k=189,l=188,x=193,j=194,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=189,h=196,a=193,b=192,i=191,k=190,l=189,x=194,j=195,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=189,h=196,a=194,b=193,i=192,k=191,l=190,x=195,j=196,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=193,h=200,a=195,b=194,i=193,k=192,l=191,x=196,j=197,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=193,h=200,a=196,b=195,i=194,k=193,l=192,x=197,j=198,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=193,h=200,a=197,b=196,i=195,k=194,l=193,x=198,j=199,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=193,h=200,a=198,b=197,i=196,k=195,l=194,x=199,j=200,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=197,h=204,a=199,b=198,i=197,k=196,l=195,x=200,j=201,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=197,h=204,a=200,b=199,i=198,k=197,l=196,x=201,j=202,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=197,h=204,a=201,b=200,i=199,k=198,l=197,x=202,j=203,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=197,h=204,a=202,b=201,i=200,k=199,l=198,x=203,j=204,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=201,h=208,a=203,b=202,i=201,k=200,l=199,x=204,j=205,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=201,h=208,a=204,b=203,i=202,k=201,l=200,x=205,j=206,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=201,h=208,a=205,b=204,i=203,k=202,l=201,x=206,j=207,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=201,h=208,a=206,b=205,i=204,k=203,l=202,x=207,j=208,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=205,h=212,a=207,b=206,i=205,k=204,l=203,x=208,j=209,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=205,h=212,a=208,b=207,i=206,k=205,l=204,x=209,j=210,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=205,h=212,a=209,b=208,i=207,k=206,l=205,x=210,j=211,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=205,h=212,a=210,b=209,i=208,k=207,l=206,x=211,j=212,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=209,h=216,a=211,b=210,i=209,k=208,l=207,x=212,j=213,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=209,h=216,a=212,b=211,i=210,k=209,l=208,x=213,j=214,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=209,h=216,a=213,b=212,i=211,k=210,l=209,x=214,j=215,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=209,h=216,a=214,b=213,i=212,k=211,l=210,x=215,j=216,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=213,h=220,a=215,b=214,i=213,k=212,l=211,x=216,j=217,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=213,h=220,a=216,b=215,i=214,k=213,l=212,x=217,j=218,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=213,h=220,a=217,b=216,i=215,k=214,l=213,x=218,j=219,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=213,h=220,a=218,b=217,i=216,k=215,l=214,x=219,j=220,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=217,h=224,a=219,b=218,i=217,k=216,l=215,x=220,j=221,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=217,h=224,a=220,b=219,i=218,k=217,l=216,x=221,j=222,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=217,h=224,a=221,b=220,i=219,k=218,l=217,x=222,j=223,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=217,h=224,a=222,b=221,i=220,k=219,l=218,x=223,j=224,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=221,h=228,a=223,b=222,i=221,k=220,l=219,x=224,j=225,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=221,h=228,a=224,b=223,i=222,k=221,l=220,x=225,j=226,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=221,h=228,a=225,b=224,i=223,k=222,l=221,x=226,j=227,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=221,h=228,a=226,b=225,i=224,k=223,l=222,x=227,j=228,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=225,h=232,a=227,b=226,i=225,k=224,l=223,x=228,j=229,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=225,h=232,a=228,b=227,i=226,k=225,l=224,x=229,j=230,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=225,h=232,a=229,b=228,i=227,k=226,l=225,x=230,j=231,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=225,h=232,a=230,b=229,i=228,k=227,l=226,x=231,j=232,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=229,h=236,a=231,b=230,i=229,k=228,l=227,x=232,j=233,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=229,h=236,a=232,b=231,i=230,k=229,l=228,x=233,j=234,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=229,h=236,a=233,b=232,i=231,k=230,l=229,x=234,j=235,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=229,h=236,a=234,b=233,i=232,k=231,l=230,x=235,j=236,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=233,h=240,a=235,b=234,i=233,k=232,l=231,x=236,j=237,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=233,h=240,a=236,b=235,i=234,k=233,l=232,x=237,j=238,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=233,h=240,a=237,b=236,i=235,k=234,l=233,x=238,j=239,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=233,h=240,a=238,b=237,i=236,k=235,l=234,x=239,j=240,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=237,h=244,a=239,b=238,i=237,k=236,l=235,x=240,j=241,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=237,h=244,a=240,b=239,i=238,k=237,l=236,x=241,j=242,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=237,h=244,a=241,b=240,i=239,k=238,l=237,x=242,j=243,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=237,h=244,a=242,b=241,i=240,k=239,l=238,x=243,j=244,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=241,h=248,a=243,b=242,i=241,k=240,l=239,x=244,j=245,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=241,h=248,a=244,b=243,i=242,k=241,l=240,x=245,j=246,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=241,h=248,a=245,b=244,i=243,k=242,l=241,x=246,j=247,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=241,h=248,a=246,b=245,i=244,k=243,l=242,x=247,j=248,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=245,h=252,a=247,b=246,i=245,k=244,l=243,x=248,j=249,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=245,h=252,a=248,b=247,i=246,k=245,l=244,x=249,j=250,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=245,h=252,a=249,b=248,i=247,k=246,l=245,x=250,j=251,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=245,h=252,a=250,b=249,i=248,k=247,l=246,x=251,j=252,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=249,h=256,a=251,b=250,i=249,k=248,l=247,x=252,j=253,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=249,h=256,a=252,b=251,i=250,k=249,l=248,x=253,j=254,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=249,h=256,a=253,b=252,i=251,k=250,l=249,x=254,j=255,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=249,h=256,a=254,b=253,i=252,k=251,l=250,x=255,j=256,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=253,h=260,a=255,b=254,i=253,k=252,l=251,x=256,j=257,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=253,h=260,a=256,b=255,i=254,k=253,l=252,x=257,j=258,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=253,h=260,a=257,b=256,i=255,k=254,l=253,x=258,j=259,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=253,h=260,a=258,b=257,i=256,k=255,l=254,x=259,j=260,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=257,h=264,a=259,b=258,i=257,k=256,l=255,x=260,j=261,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=257,h=264,a=260,b=259,i=258,k=257,l=256,x=261,j=262,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=257,h=264,a=261,b=260,i=259,k=258,l=257,x=262,j=263,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=257,h=264,a=262,b=261,i=260,k=259,l=258,x=263,j=264,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=261,h=268,a=263,b=262,i=261,k=260,l=259,x=264,j=265,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=261,h=268,a=264,b=263,i=262,k=261,l=260,x=265,j=266,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=261,h=268,a=265,b=264,i=263,k=262,l=261,x=266,j=267,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=261,h=268,a=266,b=265,i=264,k=263,l=262,x=267,j=268,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=265,h=272,a=267,b=266,i=265,k=264,l=263,x=268,j=269,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=265,h=272,a=268,b=267,i=266,k=265,l=264,x=269,j=270,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=265,h=272,a=269,b=268,i=267,k=266,l=265,x=270,j=271,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=265,h=272,a=270,b=269,i=268,k=267,l=266,x=271,j=272,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=269,h=276,a=271,b=270,i=269,k=268,l=267,x=272,j=273,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=269,h=276,a=272,b=271,i=270,k=269,l=268,x=273,j=274,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=269,h=276,a=273,b=272,i=271,k=270,l=269,x=274,j=275,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=269,h=276,a=274,b=273,i=272,k=271,l=270,x=275,j=276,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=273,h=280,a=275,b=274,i=273,k=272,l=271,x=276,j=277,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=273,h=280,a=276,b=275,i=274,k=273,l=272,x=277,j=278,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=273,h=280,a=277,b=276,i=275,k=274,l=273,x=278,j=279,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=273,h=280,a=278,b=277,i=276,k=275,l=274,x=279,j=280,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=277,h=284,a=279,b=278,i=277,k=276,l=275,x=280,j=281,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=277,h=284,a=280,b=279,i=278,k=277,l=276,x=281,j=282,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=277,h=284,a=281,b=280,i=279,k=278,l=277,x=282,j=283,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=277,h=284,a=282,b=281,i=280,k=279,l=278,x=283,j=284,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=281,h=288,a=283,b=282,i=281,k=280,l=279,x=284,j=285,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=281,h=288,a=284,b=283,i=282,k=281,l=280,x=285,j=286,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=281,h=288,a=285,b=284,i=283,k=282,l=281,x=286,j=287,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=281,h=288,a=286,b=285,i=284,k=283,l=282,x=287,j=288,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=285,h=292,a=287,b=286,i=285,k=284,l=283,x=288,j=289,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=285,h=292,a=288,b=287,i=286,k=285,l=284,x=289,j=290,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=285,h=292,a=289,b=288,i=287,k=286,l=285,x=290,j=291,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=285,h=292,a=290,b=289,i=288,k=287,l=286,x=291,j=292,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=289,h=296,a=291,b=290,i=289,k=288,l=287,x=292,j=293,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=289,h=296,a=292,b=291,i=290,k=289,l=288,x=293,j=294,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=289,h=296,a=293,b=292,i=291,k=290,l=289,x=294,j=295,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=289,h=296,a=294,b=293,i=292,k=291,l=290,x=295,j=296,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=293,h=300,a=295,b=294,i=293,k=292,l=291,x=296,j=297,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=293,h=300,a=296,b=295,i=294,k=293,l=292,x=297,j=298,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=293,h=300,a=297,b=296,i=295,k=294,l=293,x=298,j=299,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=293,h=300,a=298,b=297,i=296,k=295,l=294,x=299,j=300,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=297,h=304,a=299,b=298,i=297,k=296,l=295,x=300,j=301,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=297,h=304,a=300,b=299,i=298,k=297,l=296,x=301,j=302,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=297,h=304,a=301,b=300,i=299,k=298,l=297,x=302,j=303,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=297,h=304,a=302,b=301,i=300,k=299,l=298,x=303,j=304,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=301,h=308,a=303,b=302,i=301,k=300,l=199,x=304,j=305,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=301,h=308,a=304,b=303,i=302,k=301,l=300,x=305,j=306,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=301,h=308,a=305,b=304,i=303,k=302,l=301,x=306,j=307,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=301,h=308,a=306,b=305,i=304,k=303,l=302,x=307,j=308,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=305,h=312,a=307,b=306,i=305,k=304,l=303,x=308,j=309,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=305,h=312,a=308,b=307,i=306,k=305,l=304,x=309,j=310,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=305,h=312,a=309,b=308,i=307,k=306,l=305,x=310,j=311,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=305,h=312,a=310,b=309,i=308,k=307,l=306,x=311,j=312,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=309,h=316,a=311,b=310,i=309,k=308,l=307,x=312,j=313,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=309,h=316,a=312,b=311,i=310,k=309,l=308,x=313,j=314,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=309,h=316,a=313,b=312,i=311,k=310,l=309,x=314,j=315,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=309,h=316,a=314,b=313,i=312,k=311,l=310,x=315,j=316,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=313,h=320,a=315,b=314,i=313,k=312,l=311,x=316,j=317,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=313,h=320,a=316,b=315,i=314,k=313,l=312,x=317,j=318,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=313,h=320,a=317,b=316,i=315,k=314,l=313,x=318,j=319,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=313,h=320,a=318,b=317,i=316,k=315,l=314,x=319,j=320,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=317,h=324,a=319,b=318,i=317,k=316,l=315,x=320,j=321,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=317,h=324,a=320,b=319,i=318,k=317,l=316,x=321,j=322,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=317,h=324,a=321,b=320,i=319,k=318,l=317,x=322,j=323,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=317,h=324,a=322,b=321,i=320,k=319,l=318,x=323,j=324,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=321,h=328,a=323,b=322,i=321,k=320,l=319,x=324,j=325,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=321,h=328,a=324,b=323,i=322,k=321,l=320,x=325,j=326,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=321,h=328,a=325,b=324,i=323,k=322,l=321,x=326,j=327,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=321,h=328,a=326,b=325,i=324,k=323,l=322,x=327,j=328,s=0);



data r1; set a;

%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,a=125,b=124,i=123,k=122,l=121,x=126,j=127,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=121,h=128,a=126,b=125,i=124,k=123,l=122,x=127,j=128,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=125,h=132,a=127,b=126,i=125,k=124,l=123,x=128,j=129,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=125,h=132,a=128,b=127,i=126,k=125,l=124,x=129,j=130,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=125,h=132,a=129,b=128,i=127,k=126,l=125,x=130,j=131,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=125,h=132,a=130,b=129,i=128,k=127,l=126,x=131,j=132,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=129,h=136,a=131,b=130,i=129,k=128,l=127,x=132,j=133,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=129,h=136,a=132,b=131,i=130,k=129,l=128,x=133,j=134,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=129,h=136,a=133,b=132,i=131,k=130,l=129,x=134,j=135,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=129,h=136,a=134,b=133,i=132,k=131,l=130,x=135,j=136,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=133,h=140,a=135,b=134,i=133,k=132,l=131,x=136,j=137,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=133,h=140,a=136,b=135,i=134,k=133,l=132,x=137,j=138,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=133,h=140,a=137,b=136,i=135,k=134,l=133,x=138,j=139,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=133,h=140,a=138,b=137,i=136,k=135,l=134,x=139,j=140,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=137,h=144,a=139,b=138,i=137,k=136,l=135,x=140,j=141,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=137,h=144,a=140,b=139,i=138,k=137,l=136,x=141,j=142,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=137,h=144,a=141,b=140,i=139,k=138,l=137,x=142,j=143,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=137,h=144,a=142,b=141,i=140,k=139,l=138,x=143,j=144,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=141,h=148,a=143,b=142,i=141,k=140,l=139,x=144,j=145,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=141,h=148,a=144,b=143,i=142,k=141,l=140,x=145,j=146,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=141,h=148,a=145,b=144,i=143,k=142,l=141,x=146,j=147,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=141,h=148,a=146,b=145,i=144,k=143,l=142,x=147,j=148,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=145,h=152,a=147,b=146,i=145,k=144,l=143,x=148,j=149,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=145,h=152,a=148,b=147,i=146,k=145,l=144,x=149,j=150,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=145,h=152,a=149,b=148,i=147,k=146,l=145,x=150,j=151,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=145,h=152,a=150,b=149,i=148,k=147,l=146,x=151,j=152,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=149,h=156,a=151,b=150,i=149,k=148,l=147,x=152,j=153,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=149,h=156,a=152,b=151,i=150,k=149,l=148,x=153,j=154,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=149,h=156,a=153,b=152,i=151,k=150,l=149,x=154,j=155,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=149,h=156,a=154,b=153,i=152,k=151,l=150,x=155,j=156,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=153,h=160,a=155,b=154,i=153,k=152,l=151,x=156,j=157,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=153,h=160,a=156,b=155,i=154,k=153,l=152,x=157,j=158,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=153,h=160,a=157,b=156,i=155,k=154,l=153,x=158,j=159,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=153,h=160,a=158,b=157,i=156,k=155,l=154,x=159,j=160,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=157,h=164,a=159,b=158,i=157,k=156,l=155,x=160,j=161,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=157,h=164,a=160,b=159,i=158,k=157,l=156,x=161,j=162,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=157,h=164,a=161,b=160,i=159,k=158,l=157,x=162,j=163,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=157,h=164,a=162,b=161,i=160,k=159,l=158,x=163,j=164,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=161,h=168,a=163,b=162,i=161,k=160,l=159,x=164,j=165,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=161,h=168,a=164,b=163,i=162,k=161,l=160,x=165,j=166,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=161,h=168,a=165,b=164,i=163,k=162,l=161,x=166,j=167,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=161,h=168,a=166,b=165,i=164,k=163,l=162,x=167,j=168,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=165,h=172,a=167,b=166,i=165,k=164,l=163,x=168,j=169,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=165,h=172,a=168,b=167,i=166,k=165,l=164,x=169,j=170,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=165,h=172,a=169,b=168,i=167,k=166,l=165,x=170,j=171,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=165,h=172,a=170,b=169,i=168,k=167,l=166,x=171,j=172,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=169,h=176,a=171,b=170,i=169,k=168,l=167,x=172,j=173,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=169,h=176,a=172,b=171,i=170,k=169,l=168,x=173,j=174,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=169,h=176,a=173,b=172,i=171,k=170,l=169,x=174,j=175,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=169,h=176,a=174,b=173,i=172,k=171,l=170,x=175,j=176,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=173,h=180,a=175,b=174,i=173,k=172,l=171,x=176,j=177,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=173,h=180,a=176,b=175,i=174,k=173,l=172,x=177,j=178,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=173,h=180,a=177,b=176,i=175,k=174,l=173,x=178,j=179,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=173,h=180,a=178,b=177,i=176,k=175,l=174,x=179,j=180,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=177,h=184,a=179,b=178,i=177,k=176,l=175,x=180,j=181,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=177,h=184,a=180,b=179,i=178,k=177,l=176,x=181,j=182,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=177,h=184,a=181,b=180,i=179,k=178,l=177,x=182,j=183,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=177,h=184,a=182,b=181,i=180,k=179,l=178,x=183,j=184,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=181,h=188,a=183,b=182,i=181,k=180,l=179,x=184,j=185,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=181,h=188,a=184,b=183,i=182,k=181,l=180,x=185,j=186,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=181,h=188,a=185,b=184,i=183,k=182,l=181,x=186,j=187,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=181,h=188,a=186,b=185,i=184,k=183,l=182,x=187,j=188,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=185,h=192,a=187,b=186,i=185,k=184,l=183,x=188,j=189,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=185,h=192,a=188,b=187,i=186,k=185,l=184,x=189,j=190,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=185,h=192,a=189,b=188,i=187,k=186,l=185,x=190,j=191,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=185,h=192,a=190,b=189,i=188,k=187,l=186,x=191,j=192,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=189,h=196,a=191,b=190,i=189,k=188,l=187,x=192,j=193,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=189,h=196,a=192,b=191,i=190,k=189,l=188,x=193,j=194,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=189,h=196,a=193,b=192,i=191,k=190,l=189,x=194,j=195,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=189,h=196,a=194,b=193,i=192,k=191,l=190,x=195,j=196,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=193,h=200,a=195,b=194,i=193,k=192,l=191,x=196,j=197,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=193,h=200,a=196,b=195,i=194,k=193,l=192,x=197,j=198,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=193,h=200,a=197,b=196,i=195,k=194,l=193,x=198,j=199,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=193,h=200,a=198,b=197,i=196,k=195,l=194,x=199,j=200,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=197,h=204,a=199,b=198,i=197,k=196,l=195,x=200,j=201,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=197,h=204,a=200,b=199,i=198,k=197,l=196,x=201,j=202,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=197,h=204,a=201,b=200,i=199,k=198,l=197,x=202,j=203,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=197,h=204,a=202,b=201,i=200,k=199,l=198,x=203,j=204,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=201,h=208,a=203,b=202,i=201,k=200,l=199,x=204,j=205,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=201,h=208,a=204,b=203,i=202,k=201,l=200,x=205,j=206,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=201,h=208,a=205,b=204,i=203,k=202,l=201,x=206,j=207,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=201,h=208,a=206,b=205,i=204,k=203,l=202,x=207,j=208,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=205,h=212,a=207,b=206,i=205,k=204,l=203,x=208,j=209,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=205,h=212,a=208,b=207,i=206,k=205,l=204,x=209,j=210,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=205,h=212,a=209,b=208,i=207,k=206,l=205,x=210,j=211,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=205,h=212,a=210,b=209,i=208,k=207,l=206,x=211,j=212,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=209,h=216,a=211,b=210,i=209,k=208,l=207,x=212,j=213,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=209,h=216,a=212,b=211,i=210,k=209,l=208,x=213,j=214,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=209,h=216,a=213,b=212,i=211,k=210,l=209,x=214,j=215,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=209,h=216,a=214,b=213,i=212,k=211,l=210,x=215,j=216,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=213,h=220,a=215,b=214,i=213,k=212,l=211,x=216,j=217,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=213,h=220,a=216,b=215,i=214,k=213,l=212,x=217,j=218,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=213,h=220,a=217,b=216,i=215,k=214,l=213,x=218,j=219,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=213,h=220,a=218,b=217,i=216,k=215,l=214,x=219,j=220,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=217,h=224,a=219,b=218,i=217,k=216,l=215,x=220,j=221,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=217,h=224,a=220,b=219,i=218,k=217,l=216,x=221,j=222,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=217,h=224,a=221,b=220,i=219,k=218,l=217,x=222,j=223,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=217,h=224,a=222,b=221,i=220,k=219,l=218,x=223,j=224,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=221,h=228,a=223,b=222,i=221,k=220,l=219,x=224,j=225,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=221,h=228,a=224,b=223,i=222,k=221,l=220,x=225,j=226,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=221,h=228,a=225,b=224,i=223,k=222,l=221,x=226,j=227,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=221,h=228,a=226,b=225,i=224,k=223,l=222,x=227,j=228,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=225,h=232,a=227,b=226,i=225,k=224,l=223,x=228,j=229,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=225,h=232,a=228,b=227,i=226,k=225,l=224,x=229,j=230,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=225,h=232,a=229,b=228,i=227,k=226,l=225,x=230,j=231,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=225,h=232,a=230,b=229,i=228,k=227,l=226,x=231,j=232,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=229,h=236,a=231,b=230,i=229,k=228,l=227,x=232,j=233,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=229,h=236,a=232,b=231,i=230,k=229,l=228,x=233,j=234,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=229,h=236,a=233,b=232,i=231,k=230,l=229,x=234,j=235,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=229,h=236,a=234,b=233,i=232,k=231,l=230,x=235,j=236,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=233,h=240,a=235,b=234,i=233,k=232,l=231,x=236,j=237,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=233,h=240,a=236,b=235,i=234,k=233,l=232,x=237,j=238,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=233,h=240,a=237,b=236,i=235,k=234,l=233,x=238,j=239,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=233,h=240,a=238,b=237,i=236,k=235,l=234,x=239,j=240,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=237,h=244,a=239,b=238,i=237,k=236,l=235,x=240,j=241,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=237,h=244,a=240,b=239,i=238,k=237,l=236,x=241,j=242,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=237,h=244,a=241,b=240,i=239,k=238,l=237,x=242,j=243,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=237,h=244,a=242,b=241,i=240,k=239,l=238,x=243,j=244,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=241,h=248,a=243,b=242,i=241,k=240,l=239,x=244,j=245,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=241,h=248,a=244,b=243,i=242,k=241,l=240,x=245,j=246,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=241,h=248,a=245,b=244,i=243,k=242,l=241,x=246,j=247,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=241,h=248,a=246,b=245,i=244,k=243,l=242,x=247,j=248,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=245,h=252,a=247,b=246,i=245,k=244,l=243,x=248,j=249,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=245,h=252,a=248,b=247,i=246,k=245,l=244,x=249,j=250,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=245,h=252,a=249,b=248,i=247,k=246,l=245,x=250,j=251,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=245,h=252,a=250,b=249,i=248,k=247,l=246,x=251,j=252,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=249,h=256,a=251,b=250,i=249,k=248,l=247,x=252,j=253,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=249,h=256,a=252,b=251,i=250,k=249,l=248,x=253,j=254,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=249,h=256,a=253,b=252,i=251,k=250,l=249,x=254,j=255,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=249,h=256,a=254,b=253,i=252,k=251,l=250,x=255,j=256,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=253,h=260,a=255,b=254,i=253,k=252,l=251,x=256,j=257,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=253,h=260,a=256,b=255,i=254,k=253,l=252,x=257,j=258,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=253,h=260,a=257,b=256,i=255,k=254,l=253,x=258,j=259,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=253,h=260,a=258,b=257,i=256,k=255,l=254,x=259,j=260,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=257,h=264,a=259,b=258,i=257,k=256,l=255,x=260,j=261,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=257,h=264,a=260,b=259,i=258,k=257,l=256,x=261,j=262,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=257,h=264,a=261,b=260,i=259,k=258,l=257,x=262,j=263,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=257,h=264,a=262,b=261,i=260,k=259,l=258,x=263,j=264,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=261,h=268,a=263,b=262,i=261,k=260,l=259,x=264,j=265,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=261,h=268,a=264,b=263,i=262,k=261,l=260,x=265,j=266,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=261,h=268,a=265,b=264,i=263,k=262,l=261,x=266,j=267,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=261,h=268,a=266,b=265,i=264,k=263,l=262,x=267,j=268,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=265,h=272,a=267,b=266,i=265,k=264,l=263,x=268,j=269,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=265,h=272,a=268,b=267,i=266,k=265,l=264,x=269,j=270,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=265,h=272,a=269,b=268,i=267,k=266,l=265,x=270,j=271,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=265,h=272,a=270,b=269,i=268,k=267,l=266,x=271,j=272,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=269,h=276,a=271,b=270,i=269,k=268,l=267,x=272,j=273,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=269,h=276,a=272,b=271,i=270,k=269,l=268,x=273,j=274,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=269,h=276,a=273,b=272,i=271,k=270,l=269,x=274,j=275,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=269,h=276,a=274,b=273,i=272,k=271,l=270,x=275,j=276,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=273,h=280,a=275,b=274,i=273,k=272,l=271,x=276,j=277,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=273,h=280,a=276,b=275,i=274,k=273,l=272,x=277,j=278,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=273,h=280,a=277,b=276,i=275,k=274,l=273,x=278,j=279,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=273,h=280,a=278,b=277,i=276,k=275,l=274,x=279,j=280,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=277,h=284,a=279,b=278,i=277,k=276,l=275,x=280,j=281,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=277,h=284,a=280,b=279,i=278,k=277,l=276,x=281,j=282,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=277,h=284,a=281,b=280,i=279,k=278,l=277,x=282,j=283,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=277,h=284,a=282,b=281,i=280,k=279,l=278,x=283,j=284,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=281,h=288,a=283,b=282,i=281,k=280,l=279,x=284,j=285,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=281,h=288,a=284,b=283,i=282,k=281,l=280,x=285,j=286,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=281,h=288,a=285,b=284,i=283,k=282,l=281,x=286,j=287,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=281,h=288,a=286,b=285,i=284,k=283,l=282,x=287,j=288,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=285,h=292,a=287,b=286,i=285,k=284,l=283,x=288,j=289,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=285,h=292,a=288,b=287,i=286,k=285,l=284,x=289,j=290,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=285,h=292,a=289,b=288,i=287,k=286,l=285,x=290,j=291,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=285,h=292,a=290,b=289,i=288,k=287,l=286,x=291,j=292,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=289,h=296,a=291,b=290,i=289,k=288,l=287,x=292,j=293,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=289,h=296,a=292,b=291,i=290,k=289,l=288,x=293,j=294,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=289,h=296,a=293,b=292,i=291,k=290,l=289,x=294,j=295,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=289,h=296,a=294,b=293,i=292,k=291,l=290,x=295,j=296,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=293,h=300,a=295,b=294,i=293,k=292,l=291,x=296,j=297,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=293,h=300,a=296,b=295,i=294,k=293,l=292,x=297,j=298,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=293,h=300,a=297,b=296,i=295,k=294,l=293,x=298,j=299,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=293,h=300,a=298,b=297,i=296,k=295,l=294,x=299,j=300,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=297,h=304,a=299,b=298,i=297,k=296,l=295,x=300,j=301,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=297,h=304,a=300,b=299,i=298,k=297,l=296,x=301,j=302,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=297,h=304,a=301,b=300,i=299,k=298,l=297,x=302,j=303,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=297,h=304,a=302,b=301,i=300,k=299,l=298,x=303,j=304,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=301,h=308,a=303,b=302,i=301,k=300,l=199,x=304,j=305,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=301,h=308,a=304,b=303,i=302,k=301,l=300,x=305,j=306,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=301,h=308,a=305,b=304,i=303,k=302,l=301,x=306,j=307,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=301,h=308,a=306,b=305,i=304,k=303,l=302,x=307,j=308,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=305,h=312,a=307,b=306,i=305,k=304,l=303,x=308,j=309,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=305,h=312,a=308,b=307,i=306,k=305,l=304,x=309,j=310,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=305,h=312,a=309,b=308,i=307,k=306,l=305,x=310,j=311,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=305,h=312,a=310,b=309,i=308,k=307,l=306,x=311,j=312,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=309,h=316,a=311,b=310,i=309,k=308,l=307,x=312,j=313,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=309,h=316,a=312,b=311,i=310,k=309,l=308,x=313,j=314,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=309,h=316,a=313,b=312,i=311,k=310,l=309,x=314,j=315,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=309,h=316,a=314,b=313,i=312,k=311,l=310,x=315,j=316,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=313,h=320,a=315,b=314,i=313,k=312,l=311,x=316,j=317,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=313,h=320,a=316,b=315,i=314,k=313,l=312,x=317,j=318,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=313,h=320,a=317,b=316,i=315,k=314,l=313,x=318,j=319,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=313,h=320,a=318,b=317,i=316,k=315,l=314,x=319,j=320,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=317,h=324,a=319,b=318,i=317,k=316,l=315,x=320,j=321,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=317,h=324,a=320,b=319,i=318,k=317,l=316,x=321,j=322,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=317,h=324,a=321,b=320,i=319,k=318,l=317,x=322,j=323,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=317,h=324,a=322,b=321,i=320,k=319,l=318,x=323,j=324,s=1);
%update_r1(da1=1,da2=2,e=5,f=6,g=321,h=328,a=323,b=322,i=321,k=320,l=319,x=324,j=325,s=1);
%update_r1(da1=2,da2=1,e=6,f=7,g=321,h=328,a=324,b=323,i=322,k=321,l=320,x=325,j=326,s=1);
%update_r1(da1=1,da2=2,e=7,f=8,g=321,h=328,a=325,b=324,i=323,k=322,l=321,x=326,j=327,s=1);
%update_r1(da1=2,da2=1,e=8,f=9,g=321,h=328,a=326,b=325,i=324,k=323,l=322,x=327,j=328,s=1);

*/

data x; set cum_l1;
* file "C:\Loveleen\Synthesis model\Multiple enhancements\multiple_enhancements_&dataset_id";  
  file "/home/rmjlaph/Scratch/_output_16_9_19_prep_11am_&dataset_id";  
put   

p50_cd4diag  			 s_cd4diag  
p50_measured_cd4art 	 s_measured_cd4art 
p50_years_on_prep   	 s_years_on_prep
p50_n_test_prevyr_onprep s_n_test_prevyr_onprep
p50_act_years_sw 		 s_act_years_sw 

/*general*/
run_    cald  art_monitoring_strategy_  option_

/*number alive and in each age group*/
s_alive1549	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m			
s_ageg1517w		s_ageg1819w		s_ageg1519w  	s_ageg2024w		s_ageg2529w  	s_ageg3034w		s_ageg3539w		s_ageg4044w	
s_ageg4549w		s_ageg5054w 	s_ageg5559w		s_ageg6064w		s_ageg1564w		s_ageg1549w		s_age_1844w
s_ageg1m  s_ageg2m  s_ageg3m  s_ageg4m  s_ageg5m  s_ageg1w  s_ageg2w  s_ageg3w  s_ageg4w  s_ageg5w  

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m		
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w
s_alive_w s_alive_m

/*number and status of those with HIV*/
s_hiv1564		s_hiv1549
s_hiv1517m		s_hiv1819m		s_hiv1519m  	s_hiv2024m		s_hiv2529m  	s_hiv3034m		s_hiv3539m		s_hiv4044m	
s_hiv4549m		s_hiv5054m 		s_hiv5559m		s_hiv6064m		s_hiv1564m		s_hiv1549m	
s_hiv1517w		s_hiv1819w		s_hiv1519w  	s_hiv2024w		s_hiv2529w  	s_hiv3034w		s_hiv3539w		s_hiv4044w	
s_hiv4549w		s_hiv5054w 		s_hiv5559w		s_hiv6064w		s_hiv1564w		s_hiv1549w	
s_sg_1 			s_sg_2 			s_sg_3 			s_sg_4			s_sg_5 			s_sg_6 			s_sg_7 			s_sg_8 		s_sg_9	 s_sg_99

/*primary infection*/
s_primary  		s_primary1549   s_primary1549m  s_primary1549w  s_infected_primary 	s_inf_primary
s_primary1519m	s_primary2024m	s_primary2529m	s_primary3034m	s_primary3539m	s_primary4044m	s_primary4549m
s_primary5054m	s_primary5559m	s_primary6064m
s_primary1519w	s_primary2024w	s_primary2529w	s_primary3034w	s_primary3539w	s_primary4044w	s_primary4549w
s_primary5054w	s_primary5559w	s_primary6064w
s_primary_ep_m  s_primary_ep_w  
s_primary1524m_ep  s_primary2534m_ep  s_primary3544m_ep  s_primary4554m_ep  s_primary5564m_ep
s_primary1524w_ep  s_primary2534w_ep  s_primary3544w_ep  s_primary4554w_ep  s_primary5564w_ep
s_primary1524m_epnewp  s_primary2534m_epnewp  s_primary3544m_epnewp  s_primary4554m_epnewp  s_primary5564m_epnewp 
s_primary1524w_epnewp  s_primary2534w_epnewp  s_primary3544w_epnewp  s_primary4554w_epnewp  s_primary5564w_epnewp
s_primary_sw
s_inf_vlsupp  s_inf_newp  s_inf_ep  s_inf_diag  s_inf_naive 

/*outputs amongst those infected*/
s_i_m_d_newp  s_i_w_d_newp   s_i_w_np   s_i_m_np  s_i_ep 

s_i_m_1524_newp  s_i_m_2534_newp  s_i_m_3544_newp  s_i_m_4554_newp  s_i_m_5564_newp
s_i_w_1524_newp  s_i_w_2534_newp  s_i_w_3544_newp  s_i_w_4554_newp  s_i_w_5564_newp 
s_i_r_vlg1_np  s_i_r_vlg2_np  s_i_r_vlg3_np  s_i_r_vlg4_np  s_i_r_vlg5_np  s_i_r_vlg6_np
s_i_diag_vlg1_rm0_np   s_i_diag_vlg2_rm0_np   s_i_diag_vlg3_rm0_np   s_i_diag_vlg4_rm0_np   s_i_diag_vlg5_rm0_np   s_i_diag_vlg6_rm0_np
s_i_diag_vlg1_rm1_np   s_i_diag_vlg2_rm1_np   s_i_diag_vlg3_rm1_np   s_i_diag_vlg4_rm1_np   s_i_diag_vlg5_rm1_np   s_i_diag_vlg6_rm1_np
s_i_naive_vlg1_rm0_np  s_i_naive_vlg2_rm0_np  s_i_naive_vlg3_rm0_np  s_i_naive_vlg4_rm0_np  s_i_naive_vlg5_rm0_np  s_i_naive_vlg6_rm0_np
s_i_naive_vlg1_rm1_np  s_i_naive_vlg2_rm1_np  s_i_naive_vlg3_rm1_np  s_i_naive_vlg4_rm1_np  s_i_naive_vlg5_rm1_np  s_i_naive_vlg6_rm1_np
s_i_v1_np  s_i_v2_np   s_i_v3_np  s_i_v4_np   s_i_v5_np  s_i_v6_np 

/*Number ep and newp*/
s_np  s_newp  s_newp_ge1  s_newp_ge5  s_newp_ge10  s_newp_ge50  s_ep  s_ep_m  s_ep_w  s_npge10  s_npge2  s_npge2_ly_1549m  s_npge2_ly_1549w
s_m_1524_ep  	 s_m_2534_ep 	  s_m_3544_ep 	   s_m_4554_ep 		s_m_5564_ep 	 
s_w_1524_ep		 s_w_2534_ep 	  s_w_3544_ep	   s_w_4554_ep 		s_w_5564_ep 
s_m_1524_newp  	 s_m_2534_newp    s_m_3544_newp    s_m_4554_newp  	s_m_5564_newp
s_w_1524_newp  	 s_w_2534_newp    s_w_3544_newp    s_w_4554_newp    s_w_5564_newp
s_m_1524_epnewp  s_m_2534_epnewp  s_m_3544_epnewp  s_m_4554_epnewp  s_m_5564_epnewp 
s_w_1524_epnewp  s_w_2534_epnewp  s_w_3544_epnewp  s_w_4554_epnewp  s_w_5564_epnewp
s_newp_ge1_hiv 
av_newp_p3m  av_newp_p3m_hiv  av_newp_p3m_diag  av_p_ep_py  av_p_ep_py_hiv  av_p_ep_py_diag
s_ever_ep  s_ever_newp  
s_m1524_ep1524_ s_m1524_ep2534_ s_m1524_ep3544_ s_m1524_ep4554_ s_m1524_ep5564_ 
s_m2534_ep1524_ s_m2534_ep2534_ s_m2534_ep3544_ s_m2534_ep4554_ s_m2534_ep5564_ 
s_m3544_ep1524_ s_m3544_ep2534_ s_m3544_ep3544_ s_m3544_ep4554_ s_m3544_ep5564_
s_m4554_ep1524_ s_m4554_ep2534_ s_m4554_ep3544_ s_m4554_ep4554_ s_m4554_ep5564_ 
s_m5564_ep1524_ s_m5564_ep2534_ s_m5564_ep3544_ s_m5564_ep4554_ s_m5564_ep5564_ 
s_w1524_ep1524_ s_w1524_ep2534_ s_w1524_ep3544_ s_w1524_ep4554_ s_w1524_ep5564_ 
s_w2534_ep1524_ s_w2534_ep2534_ s_w2534_ep3544_ s_w2534_ep4554_ s_w2534_ep5564_ 
s_w3544_ep1524_ s_w3544_ep2534_ s_w3544_ep3544_ s_w3544_ep4554_ s_w3544_ep5564_ 
s_w4554_ep1524_ s_w4554_ep2534_ s_w4554_ep3544_ s_w4554_ep4554_ s_w4554_ep5564_ 
s_w5564_ep1524_ s_w5564_ep2534_ s_w5564_ep3544_ s_w5564_ep4554_ s_w5564_ep5564_ 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 

npgt1conc_ly_1524m  npgt1conc_ly_1524w  npgt1conc_ly_1519m  npgt1conc_ly_1519w  npgt1conc_ly_2549m 
npgt1conc_ly_2549w  npgt1conc_ly_5064m  npgt1conc_ly_5064w 

s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

/*status of partner*/
s_eph0_m  s_eph0_w  s_nip   s_epi
s_newp_hiv  s_newp_ge1_hiv_diag  s_epdiag   s_diag_epun  s_eponart  s_epvls
s_hiv1epi0_w  s_hiv0epi1_w  s_hiv1epi0_m  s_hiv0epi1_m  s_hiv1epi1_m  s_hiv1epi1_w  
s_hiv0epprim
s_ever_ep_hiv  s_ever_ep_diag  s_ever_newp_hiv  s_ever_newp_diag
s_infected_newp_m  s_infected_newp_w  s_infected_ep_m  s_infected_ep_w

s_i_vl1000_m_np s_i_v11000_m_ep s_i_vl1000_m_newp
s_i_vl1000_w_np s_i_v11000_w_ep s_i_vl1000_w_newp

s_i_v1_age1_w_np s_i_v1_age2_w_np s_i_v1_age3_w_np s_i_v1_age4_w_np s_i_v1_age5_w_np 
s_i_v1_age1_m_np s_i_v1_age2_m_np s_i_v1_age3_m_np s_i_v1_age4_m_np s_i_v1_age5_m_np 
s_i_v1_age1_w_newp s_i_v1_age2_w_newp s_i_v1_age3_w_newp s_i_v1_age4_w_newp s_i_v1_age5_w_newp 
s_i_v1_age1_m_newp s_i_v1_age2_m_newp s_i_v1_age3_m_newp s_i_v1_age4_m_newp s_i_v1_age5_m_newp 
s_i_v1_age1_w_ep s_i_v1_age2_w_ep s_i_v1_age3_w_ep s_i_v1_age4_w_ep s_i_v1_age5_w_ep 
s_i_v1_age1_m_ep s_i_v1_age2_m_ep s_i_v1_age3_m_ep s_i_v1_age4_m_ep s_i_v1_age5_m_ep 

s_i_v2_age1_w_np s_i_v2_age2_w_np s_i_v2_age3_w_np s_i_v2_age4_w_np s_i_v2_age5_w_np 
s_i_v2_age1_m_np s_i_v2_age2_m_np s_i_v2_age3_m_np s_i_v2_age4_m_np s_i_v2_age5_m_np 
s_i_v2_age1_w_newp s_i_v2_age2_w_newp s_i_v2_age3_w_newp s_i_v2_age4_w_newp s_i_v2_age5_w_newp 
s_i_v2_age1_m_newp s_i_v2_age2_m_newp s_i_v2_age3_m_newp s_i_v2_age4_m_newp s_i_v2_age5_m_newp 
s_i_v2_age1_w_ep s_i_v2_age2_w_ep s_i_v2_age3_w_ep s_i_v2_age4_w_ep s_i_v2_age5_w_ep 
s_i_v2_age1_m_ep s_i_v2_age2_m_ep s_i_v2_age3_m_ep s_i_v2_age4_m_ep s_i_v2_age5_m_ep 

s_i_v3_age1_w_np s_i_v3_age2_w_np s_i_v3_age3_w_np s_i_v3_age4_w_np s_i_v3_age5_w_np 
s_i_v3_age1_m_np s_i_v3_age2_m_np s_i_v3_age3_m_np s_i_v3_age4_m_np s_i_v3_age5_m_np 
s_i_v3_age1_w_newp s_i_v3_age2_w_newp s_i_v3_age3_w_newp s_i_v3_age4_w_newp s_i_v3_age5_w_newp 
s_i_v3_age1_m_newp s_i_v3_age2_m_newp s_i_v3_age3_m_newp s_i_v3_age4_m_newp s_i_v3_age5_m_newp 
s_i_v3_age1_w_ep s_i_v3_age2_w_ep s_i_v3_age3_w_ep s_i_v3_age4_w_ep s_i_v3_age5_w_ep 
s_i_v3_age1_m_ep s_i_v3_age2_m_ep s_i_v3_age3_m_ep s_i_v3_age4_m_ep s_i_v3_age5_m_ep 

s_i_v4_age1_w_np s_i_v4_age2_w_np s_i_v4_age3_w_np s_i_v4_age4_w_np s_i_v4_age5_w_np 
s_i_v4_age1_m_np s_i_v4_age2_m_np s_i_v4_age3_m_np s_i_v4_age4_m_np s_i_v4_age5_m_np 
s_i_v4_age1_w_newp s_i_v4_age2_w_newp s_i_v4_age3_w_newp s_i_v4_age4_w_newp s_i_v4_age5_w_newp 
s_i_v4_age1_m_newp s_i_v4_age2_m_newp s_i_v4_age3_m_newp s_i_v4_age4_m_newp s_i_v4_age5_m_newp 
s_i_v4_age1_w_ep s_i_v4_age2_w_ep s_i_v4_age3_w_ep s_i_v4_age4_w_ep s_i_v4_age5_w_ep 
s_i_v4_age1_m_ep s_i_v4_age2_m_ep s_i_v4_age3_m_ep s_i_v4_age4_m_ep s_i_v4_age5_m_ep 

s_i_v5_age1_w_np s_i_v5_age2_w_np s_i_v5_age3_w_np s_i_v5_age4_w_np s_i_v5_age5_w_np 
s_i_v5_age1_m_np s_i_v5_age2_m_np s_i_v5_age3_m_np s_i_v5_age4_m_np s_i_v5_age5_m_np 
s_i_v5_age1_w_newp s_i_v5_age2_w_newp s_i_v5_age3_w_newp s_i_v5_age4_w_newp s_i_v5_age5_w_newp 
s_i_v5_age1_m_newp s_i_v5_age2_m_newp s_i_v5_age3_m_newp s_i_v5_age4_m_newp s_i_v5_age5_m_newp 
s_i_v5_age1_w_ep s_i_v5_age2_w_ep s_i_v5_age3_w_ep s_i_v5_age4_w_ep s_i_v5_age5_w_ep 
s_i_v5_age1_m_ep s_i_v5_age2_m_ep s_i_v5_age3_m_ep s_i_v5_age4_m_ep s_i_v5_age5_m_ep 

s_i_v6_age1_w_np s_i_v6_age2_w_np s_i_v6_age3_w_np s_i_v6_age4_w_np s_i_v6_age5_w_np 
s_i_v6_age1_m_np s_i_v6_age2_m_np s_i_v6_age3_m_np s_i_v6_age4_m_np s_i_v6_age5_m_np 
s_i_v6_age1_w_newp s_i_v6_age2_w_newp s_i_v6_age3_w_newp s_i_v6_age4_w_newp s_i_v6_age5_w_newp 
s_i_v6_age1_m_newp s_i_v6_age2_m_newp s_i_v6_age3_m_newp s_i_v6_age4_m_newp s_i_v6_age5_m_newp 
s_i_v6_age1_w_ep s_i_v6_age2_w_ep s_i_v6_age3_w_ep s_i_v6_age4_w_ep s_i_v6_age5_w_ep 
s_i_v6_age1_m_ep s_i_v6_age2_m_ep s_i_v6_age3_m_ep s_i_v6_age4_m_ep s_i_v6_age5_m_ep 

s_i_age1_m_np s_i_age2_m_np	s_i_age3_m_np	s_i_age4_m_np	s_i_age5_m_np
s_i_age1_w_np	s_i_age2_w_np	s_i_age3_w_np	s_i_age4_w_np	s_i_age5_w_np
s_i_age1_m_newp s_i_age2_m_newp	s_i_age3_m_newp	s_i_age4_m_newp	s_i_age5_m_newp
s_i_age1_w_newp	s_i_age2_w_newp	s_i_age3_w_newp	s_i_age4_w_newp	s_i_age5_w_newp

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r 

cum_ratio_newp_mw

s_i_m_1549_np  s_i_w_1549_np
 
/*resistance*/
s_tam1_  s_tam2_  s_tam3_  s_m184m_  s_k103m_  s_y181m_  s_g190m_  s_nnm_  s_q151m_  s_k65m_  
s_p32m_  s_p33m_  s_p46m_  s_p47m_   s_p50vm_  s_p50lm_  s_p54m_   s_p76m_ s_p82m_   s_p84m_   s_p88m_	s_p90m_   s_pim_  
s_inpm_  s_insm_  s_rm_    s_i_nnm   s_i_rm    s_i_pim   s_i_tam   s_i_im  s_inm_    s_i_184m  s_im_art s_pim_art s_tam_art s_m184_art
s_r_  	 s_r_3tc  s_r_nev  s_r_lpr   s_r_taz   s_r_efa   s_r_ten   s_r_zdv s_r_dol  
s_rme_   s_iime_  s_nnme_  s_pime_   s_nrtime_
s_res_1stline_startline2  s_nnm_art  s_nnm_art_m  s_nnm_art_w  s_r_art  s_acq_rt65m  s_acq_rt184m  s_acq_rtm  s_onart_iicu_res
s_nactive_art_start_lt2  s_nactive_art_start_lt3  s_nactive_art_start_lt1p5
s_nactive_line2_lt4 	 s_nactive_line2_lt3 	  s_nactive_line2_lt2 		s_nactive_line2_lt1p5  s_pim_line2
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  s_higher_rate_res_dol
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  s_nnrti_res_no_effect
s_ai_naive_no_pmtct_   s_ai_naive_no_pmtct_c_nnm_

/*prep*/
s_prep s_prep_sw s_prep_w_1524 s_elig_prep_epdiag  s_infected_prep  s_prep_ever  s_primary_prep  s_hiv1_prep  s_i_r_prep  s_primary_r_prep  s_ever_i_nor_prep  
s_rm_prep   s_elig_prep  	 s_hr_noprep  s_primary_hr_noprep 
s_rt65m_3_prep  s_rt184m_3_prep  s_rtm_3_prep  s_rt65m_6_prep  s_rt184m_6_prep  s_rtm_6_prep 
s_rt65m_9_prep  s_rt184m_9_prep  s_rtm_9_prep  s_rt65m_12_prep  s_rt184m_12_prep  s_rtm_12_prep  
s_rt65m_18_prep s_rt184m_18_prep s_rtm_18_prep  
s_onprep_3  s_onprep_6  s_onprep_9  s_onprep_12  s_onprep_18  

s_prepstart  s_ever_stopped_prep_choice  s_preprestart 
s_acq_rt65m_3_prep  s_acq_rt184m_3_prep   s_acq_rtm_3_prep     s_acq_rt65m_6_prep   s_acq_rt184m_6_prep   s_acq_rtm_6_prep 
s_acq_rt65m_9_prep  s_acq_rt184m_9_prep   s_acq_rtm_9_prep     s_acq_rt65m_12_prep  s_acq_rt184m_12_prep  s_acq_rtm_12_prep  
s_acq_rt65m_18_prep s_acq_rt184m_18_prep  s_acq_rtm_18_prep
s_inf_prep_adhg80   s_inf_prep_adh5080    s_inf_prep_adhl50  s_prep_adhg80  s_prep_adh5080  s_prep_adhl50 
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w

s_infected_prep_source_prep_r  s_prepinfect_prep_r     s_prepinfect_prep_r_p   s_infected_prep_no_r    s_infected_prep_r  
s_started_prep_in_primary	   s_tot_yrs_prep  		   s_onprep_3_i_prep_no_r  s_onprep_6_i_prep_no_r  s_onprep_9_i_prep_no_r 
s_onprep_12_i_prep_no_r 	   s_onprep_18_i_prep_no_r s_prepinfect_rm_p      s_prepinfect_m184m_p    s_prepinfect_k65m_p 
s_prepinfect_tam_p 			   s_prepinfect_rtm  	   s_prepinfect_k65m	   s_prepinfect_m184m  	   s_prepinfect_tam  
s_prep_willing_pop  		   s_prep_willing_sw  	   s_stop_prep_choice      s_started_prep_hiv_test_sens  
s_cur_res_prep_drug 		   s_started_prep_hiv_test_sens_e  				   s_started_prep_in_primary_e
s_cur_res_ten				   s_cur_res_3tc  		   s_i_65m 				   s_cur_res_efa 			
s_cur_res_ten_vlg1000 		   s_cur_res_3tc_vlg1000 						   s_cur_res_efa_vlg1000	s_ever_hiv1_prep 
s_cur_res_efa_ever_hiv1_prep   s_cur_res_ten_ever_hiv1_prep   				   s_cur_res_3tc_ever_hiv1_prep   
s_prep_effectiveness_non_res_v 
s_prep_3m_after_inf_no_r 	s_prep_3m_after_inf_no_r_184  s_prep_3m_after_inf_no_r_65
s_prep_6m_after_inf_no_r  s_prep_6m_after_inf_no_r_184  s_prep_6m_after_inf_no_r_65  s_prep_12m_after_inf_no_r  
s_prep_12m_after_inf_no_r_184  s_prep_12m_after_inf_no_r_65
s_hiv_prep_reason_1  s_hiv_prep_reason_2  s_hiv_prep_reason_3  s_hiv_prep_reason_4

s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg10  s_prep_newpg100 
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_ever_w_1524  s_prep_ever_w
s_test_gt_3m_on_prep  s_test_gt_3m_on_prep_pos  s_test_3m_on_prep  s_test_3m_on_prep_pos  
s_prepuptake_sw 	 s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep
										

/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_tested1549_		s_tested1549m       s_tested1549w
s_tested_ly_m1549_ 	s_tested_ly_m1519_ 	s_tested_ly_m2024_ s_tested_ly_m2529_  s_tested_ly_m3039_  s_tested_ly_m4049_  s_tested_ly_m5064_
s_tested_ly_w1549_ 	s_tested_ly_w1519_ 	s_tested_ly_w2024_ s_tested_ly_w2529_  s_tested_ly_w3039_  s_tested_ly_w4049_  s_tested_ly_w5064_ 
s_tested_ly_sw		

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_who3_tested  
s_tested_trueneg  s_tested_falseneg  s_tested_falsepos  s_tested_falseneg_prim  s_com_test  s_tested_anc_prevdiag  s_tested_anc
s_non_hiv_symptoms  s_symptomatic  s_tested_symp  s_tested_pos_sympt  s_tested_symp_undiag  s_tested_non_hivsymp  s_symptomatic_undiag 		
s_tested_as_sw  s_tested_m_sympt  s_tested_f_sympt  s_tested_f_sw  s_tested_m_circ  
s_rate_1sttest   s_rate_reptest  s_newp_lasttest_tested_this_per
s_acc_test  s_acc_test_1524_  s_acc_test_2549_  s_acc_test_5064_  s_acc_test_sw  

s_diag
s_diag_m1549_  s_diag_m1519_  s_diag_m2024_  s_diag_m2529_  s_diag_m3034_  s_diag_m3539_  s_diag_m4044_  s_diag_m4549_ 
s_diag_m5054_  s_diag_m5559_  s_diag_m6064_ 
s_diag_w1549_  s_diag_w1519_  s_diag_w2024_  s_diag_w2529_  s_diag_w3034_  s_diag_w3539_  s_diag_w4044_  s_diag_w4549_ 
s_diag_w5054_  s_diag_w5559_  s_diag_w6064_  s_diag_sw 
s_nn_tdr_diag

s_diag_this_period  s_diag_this_period_m  s_diag_this_period_f  s_diag_this_period_f_non_anc  s_diag_this_period_f_anc 
s_diag_this_period_m_sympt  s_diag_this_period_f_sympt  s_diag_12m  s_diag_6m  s_diag_3m 
s_sympt_diag  s_sympt_diag_ever  s_diag_m  s_diag_w  s_epdiag_m  s_epdiag_w	 s_epi_m  s_epi_w
s_diag_ep

/*VL and CD4*/
s_vlg1  s_vlg2  s_vlg3  s_vlg4  s_vlg5  s_vlg6
s_line1_vlg1000 s_line2_vlg1000  s_res_vfail1
s_u_vfail1_this_period  s_u_vfail1  s_vl_vfail1_g1 s_vl_vfail1_g2 s_vl_vfail1_g3 s_vl_vfail1_g4 s_vl_vfail1_g5 s_vl_vfail1_g6 
s_vlg1000_onart  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_184m  s_vlg1000_onart_65m  s_sw_vg1000
s_vg1000  s_vg1000_m  s_vg1000_w  s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt_6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt_6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt_6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt_6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt_6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt_6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw

s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
s_art_initiation_strategy  s_art_monitoring_strategy   s_naive    s_onart  s_int_clinic_not_aw
s_art_start  	s_art_start_m   s_art_start_w   s_artexp  s_artexpoff  s_onart_m  s_onart_w
s_onart_m1549_  s_onart_m1564_  s_onart_m1519_  s_onart_m2024_  s_onart_m2529_  s_onart_m3034_  s_onart_m3539_  
s_onart_m4044_  s_onart_m4549_  s_onart_m5054_  s_onart_m5559_  s_onart_m6064_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	s_onart_sw
s_art_dur_l6m   s_art_dur_g6m   s_art_tdur_l6m  s_art_tdur_g6m
s_eponart_m	 s_eponart_w  s_hiv1564_onart  s_dead1564_onart  s_who3_art_init  s_who4_art_init  s_art_start_pregnant 

s_lpr  s_taz  s_3tc  s_nev  s_efa  s_ten  s_zdv  s_dol
s_onefa_linefail1  s_ev_art_g1k_l1k  s_ev_art_g1k_not2l  s_ev_art_g1k_not2l_l1k  s_ev_art_g1k  s_ev_art_g1k_not2l_adc
s_art_12m  s_vl1000_art_12m  s_art_24m  s_vl1000_art_24m  s_art_12m_onart  s_vl1000_art_12m_onart
s_startedline2  s_start_line2_this_period  s_line2_12m  s_line2_12m_onart  s_line2_incl_int_clinic_not_aw

s_onart_vlg1000  s_ever_onart_gt6m_vlg1000   s_ever_onart_gt6m_vl_m_g1000  s_onart_gt6m_vlg1000  s_r_onart_gt6m_vlg1000
s_onart_gt6m_nnres_vlg1000  s_onart_gt6m_pires_vlg1000  s_onart_gt6m_res_vlg1000
s_online1_vg1000  s_online1_vg1000_lf1  s_online1_vg1000_cd4l200  s_offart_vl1000
s_vl1000_line2_12m  t  s_vl1000_line2_12m_onart  s_vl1000_line2

s_offart  s_line1_  s_line2_  s_line1_lf0  s_line1_lf1  s_line2_lf1  s_line2_lf2  s_linefail_ge1  s_line1_fail_this_period
s_lf1_past_yr   s_lf1_past_yr_line2 
s_onart_cl200  s_onart_cd4_g500  s_onart_res  s_reg_option

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  s_rel_dol_tox  s_dol_higher_potency

s_status_artl1_1_1   s_status_artl1_1_2   s_status_artl1_1_3   s_status_artl1_1_4   s_status_artl1_1_5   s_status_artl1_1_6  
s_status_artl1_1_7   s_status_artl1_1_8   s_status_artl1_1_9   s_status_artl1_1_10  s_status_artl1_1_11  s_status_artl1_1_12 
s_status_artl1_1_13  s_status_artl1_1_14  s_status_artl1_1_15  s_status_artl1_1_16 
s_status_artl1_3_1   s_status_artl1_3_2   s_status_artl1_3_3   s_status_artl1_3_4   s_status_artl1_3_5   s_status_artl1_3_6
s_status_artl1_3_7   s_status_artl1_3_8   s_status_artl1_3_9   s_status_artl1_3_10  s_status_artl1_3_11  s_status_artl1_3_12 
s_status_artl1_3_13  s_status_artl1_3_14  s_status_artl1_3_15  s_status_artl1_3_16 
s_status_artl1_5_1   s_status_artl1_5_2   s_status_artl1_5_3   s_status_artl1_5_4   s_status_artl1_5_5   s_status_artl1_5_6 
s_status_artl1_5_7   s_status_artl1_5_8   s_status_artl1_5_9   s_status_artl1_5_10  s_status_artl1_5_11  s_status_artl1_5_12
s_status_artl1_5_13  s_status_artl1_5_14  s_status_artl1_5_15  s_status_artl1_5_16

s_rr_int_tox   s_double_rate_gas_tox_taz   s_incr_mort_risk_dol_weightg  s_oth_dol_adv_birth_e_risk  s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e  s_prop_bmi_ge23

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

reg_option_

s_drug_level_test   s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

/*costs and dalys*/
s_cost       s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ     s_adhm_cost  s_t_adh_int_cost s_adj_art_cost     s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  			  s_cost_cascade_intervention
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
s_adj_art_1_cost  		   	   s_adj_art_2_cost			   	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dwho3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ    s_dadhm_cost   s_d_t_adh_int_cost s_dadj_art_dcost  s_dcost_test_m   s_dcost_test_f
s_dcost_prep   s_dcost_prep_visit  			   s_dcost_prep_ac_adh 			  s_dcost_cascade_interventions
s_dcost_test_m_sympt  	       s_dcost_test_f_sympt  		   s_dcost_test_m_circ  	  	 	s_dcost_test_f_anc s_dcost_test_f_sw
s_dcost_test_f_non_anc 	       s_dpi_cost     s_dcost_switch_line  		  s_dcost_child_hiv s_dcost_child_hiv_mo_art  		   s_dcost_art_init
s_dadj_art_1_cost  		       s_dadj_art_2_cost  			   s_dart_1_cost  s_dart_2_cost     s_dart_3_cost	   s_dcost_vl_not_done 	
s_dcost_non_aids_pre_death   s_ddaly_non_aids_pre_death  s_dead_ddaly_oth_dol_adv_birth_e   s_dcost_drug_level_test
s_dead_ddaly_ntd    s_ddaly_mtct   s_dead_daly


/*visits*/
s_visit  s_lost  s_linked_to_care  s_linked_to_care_this_period
s_pre_art_care  s_linked_preartcare_12m  s_linked_preartcare_6m	 s_linked_preartcare_3m  s_staged_12m  s_ret_preartcare_12m  
s_staged_eligm1y  s_inart_staged_eligm1y  s_retpreart_m12mdiag  s_m12mdiag  s_elig_mcd4_  
s_eligatdiag_1y  s_inart_eligatdiag_1y  s_onart_eligatdiag_1y  s_ret_preartcare_naive
s_visit_prep_no  s_visit_prep_d  s_visit_prep_dt  s_visit_prep_dtc
s_sv  s_sv_secondline   

/*deaths*/
s_dead1564_all	   s_dead1564m_all    s_dead1564w_all
s_deaths1519m_all  s_deaths2024m_all  s_deaths2529m_all  s_deaths3034m_all  s_deaths3539m_all s_deaths4044m_all  s_deaths4549m_all
s_deaths1519w_all  s_deaths2024w_all  s_deaths2529w_all  s_deaths3034w_all  s_deaths3539w_all s_deaths4044w_all  s_deaths4549w_all
s_death_hivrel  s_dead_rdcause2  s_dead_onart_rdcause2
s_deaths  s_death_hiv  s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_3m 
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
s_ev_art_g1k_not2l_adead  

/*sex workers*/
s_base_rate_sw  s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw1849_  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp		s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  

/*ADC etc*/
s_adc  s_who3_event  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 

/*Pregnancy and children*/
s_pregnant 	s_anc  s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant 
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_CEB_W1524_ 		s_CEB_W2534_ 		s_CEB_W3544_ 		s_CEB_W4549_ 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child  s_ntd_risk_dol  s_rate_birth_with_infected_child

/*circumcision*/
s_mcirc      s_mcirc_1519m		s_mcirc_2024m	   s_mcirc_2529m      s_mcirc_3039m		 s_mcirc_4049m	    s_mcirc_50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3039m  s_new_mcirc_4049m  s_new_mcirc_50plm

/*parameters sampled*/
sex_beh_trans_matrix_m_  sex_beh_trans_matrix_w_  sex_age_mixing_matrix_m_ sex_age_mixing_matrix_w_   p_rred_p_  p_hsb_p_  newp_factor_  
eprate_  conc_ep_  ch_risk_diag_  ch_risk_diag_newp_  ych_risk_beh_newp_  ych2_risk_beh_newp_  ych_risk_beh_ep_
exp_setting_lower_p_vl1000_  external_exp_factor_  rate_exp_set_lower_p_vl1000_  prob_pregnancy_base_
fold_change_w_  fold_change_yw_  fold_change_sti_  super_infection_  an_lin_incr_test_  date_test_rate_plateau_  
rate_testanc_inc_  incr_test_rate_sympt_  max_freq_testing_  test_targeting_  fx_  adh_pattern_  prob_loss_at_diag_  
pr_art_init_  rate_lost_  prob_lost_art_  rate_return_  rate_restart_  rate_int_choice_  clinic_not_aw_int_frac_
res_trans_factor_nn_  rate_loss_persistence_  incr_rate_int_low_adh_  poorer_cd4rise_fail_nn_  
poorer_cd4rise_fail_ii_  rate_res_ten_  fold_change_mut_risk_  adh_effect_of_meas_alert_  pr_switch_line_  
prob_vl_meas_done_  red_adh_tb_adc_  red_adh_tox_pop_  add_eff_adh_nnrti_  altered_adh_sec_line_pop_  prob_return_adc_  
prob_lossdiag_adctb_  prob_lossdiag_who3e_  higher_newp_less_engagement_  fold_tr_  switch_for_tox_
adh_pattern_prep_  rate_test_startprep_  rate_test_restartprep_  rate_choose_stop_prep_  circ_inc_rate_
p_hard_reach_w_  hard_reach_higher_in_men_  p_hard_reach_m_  inc_cat_   base_rate_sw_
prob_prep_restart_choice_ 	prepuptake_sw_ 		prepuptake_pop_   cd4_monitoring_   base_rate_stop_sexwork_    rred_a_p_

rr_int_tox_   rate_birth_with_infected_child_  nnrti_res_no_effect_  double_rate_gas_tox_taz_   incr_mort_risk_dol_weightg_


/*2020 interventions*/
condom_incr_2020_    			  cascade_care_improvements_    incr_test_2020_             decr_hard_reach_2020_  incr_adh_2020_
decr_prob_loss_at_diag_2020_ 	  decr_rate_lost_2020_		    decr_rate_lost_art_2020_    incr_rate_return_2020_     
incr_rate_restart_2020_          incr_rate_init_2020_          decr_rate_int_choice_2020_  incr_prob_vl_meas_done_2020_ 
incr_pr_switch_line_2020_    	 prep_improvements_       	 incr_adh_pattern_prep_2020_ 
inc_r_test_startprep_2020_   incr_r_test_restartprep_2020_ decr_r_choose_stop_prep_2020_ 
inc_p_prep_restart_choi_2020_  incr_prepuptake_sw_2020_      incr_prepuptake_pop_2020_   expand_prep_to_all_2020_ 
circ_improvements_ 			  circ_inc_rate_2020_ 		     incr_test_targeting_2020_   option_0_prep_continue_2020_
incr_max_freq_testing_2020_      initial_pr_switch_line_       initial_prob_vl_meas_done_  sw_test_6mthly_2020_   reg_option_switch_2020_
art_mon_drug_levels_2020_   ten_is_taf_2020_	pop_wide_tld_2020_

eff_max_freq_testing_ 		eff_rate_restart_ 		eff_prob_loss_at_diag_ 		eff_rate_lost_ 		eff_prob_lost_art_ 		eff_rate_return_ 			
eff_pr_art_init_ 	eff_rate_int_choice_ 	eff_prob_vl_meas_done_ 		eff_pr_switch_line_ 	eff_rate_test_startprep_ 	eff_rate_test_restartprep_ 	
eff_rate_choose_stop_prep_ 		eff_prob_prep_restart_choice_ 	eff_prepuptake_sw_  eff_prepuptake_pop_ e_decr_hard_reach_2020_  eff_test_targeting_

/*supp material*/
s_onart_vlg1     s_onart_vlg2     s_onart_vlg3     s_onart_vlg4     s_onart_vlg5    
s_onart_vlg1_r   s_onart_vlg2_r   s_onart_vlg3_r   s_onart_vlg4_r   s_onart_vlg5_r 
s_onart_who4_year1   s_onart_who4_year1_vlt1000  s_onart_who4_year3   s_onart_who4_year3_vlt1000  s_onart_cd4l200_year1  
s_onart_cd4l200_year1_vlt1000  s_onart_cd4l200_year3   s_onart_cd4l200_year3_vlt1000  s_onart_res_1stline_linefail0   
s_onart_res_1stline  s_onart_linefail0  s_onart_linefail0_cl200  s_onart_linefail0_cl50  s_onart_cl50  s_onart_linefail0_vg1000  
s_onart_vg1000   s_onart_linefail0_vg1000_r   s_onart_vg1000_r   s_onart_cl350

s_newpge1_ly_1529m	s_newpge1_ly_1529w

s_m_1524_ge1newpever  s_m_2534_ge1newpever  s_m_3544_ge1newpever  s_m_4554_ge1newpever  s_m_5564_ge1newpever
s_m_1524_ge2newpever  s_m_2534_ge2newpever  s_m_3544_ge2newpever  s_m_4554_ge2newpever  s_m_5564_ge2newpever
s_m_1524_ge5newpever  s_m_2534_ge5newpever  s_m_3544_ge5newpever  s_m_4554_ge5newpever  s_m_5564_ge5newpever
s_w_ge1newpever		  s_w_ge2newpever		s_w_ge5newpever

s_npge1_ly_1564m  s_npge1_ly_1524m  s_npge1_ly_2534m  s_npge1_ly_3544m  s_npge1_ly_4554m  s_npge1_ly_5564m  s_npge1_ly_1564w  s_npge1_ly_1524w  s_npge1_ly_2534w  s_npge1_ly_3544w  s_npge1_ly_4554w  s_npge1_ly_5564w
s_npge2_ly_1564m  s_npge2_ly_1524m  s_npge2_ly_2534m  s_npge2_ly_3544m  s_npge2_ly_4554m  s_npge2_ly_5564m  s_npge2_ly_1564w  s_npge2_ly_1524w  s_npge2_ly_2534w  s_npge2_ly_3544w  s_npge2_ly_4554w  s_npge2_ly_5564w
s_npge10_ly_1564m  s_npge10_ly_1524m  s_npge10_ly_2534m  s_npge10_ly_3544m  s_npge10_ly_4554m  s_npge10_ly_5564m  s_npge10_ly_1564w  s_npge10_ly_1524w  s_npge10_ly_2534w  s_npge10_ly_3544w  s_npge10_ly_4554w  s_npge10_ly_5564w
s_npge50_ly_1564m  s_npge50_ly_1524m  s_npge50_ly_2534m  s_npge50_ly_3544m  s_npge50_ly_4554m  s_npge50_ly_5564m  s_npge50_ly_1564w  s_npge50_ly_1524w  s_npge50_ly_2534w  s_npge50_ly_3544w  s_npge50_ly_4554w  s_npge50_ly_5564w
s_npge1_ly_1564_hivpos  s_npge2_ly_1564_hivpos  s_npge1_ly_1564_hivdiag  s_npge2_ly_1564_hivdiag  s_npge1_ly_1564_hivneg  s_npge2_ly_1564_hivneg

/* used in abort statements */

prevalence1549  prev_ratio_1524

/* variables created after proc univariate which are used in the body of the program in order to update*/
s_prop_vlg1_rm  s_prop_vlg2_rm  s_prop_vlg3_rm  s_prop_vlg4_rm  s_prop_vlg5_rm  s_prop_vlg6_rm  
s_prop_vlg1_rm0_diag  s_prop_vlg2_rm0_diag  s_prop_vlg3_rm0_diag  s_prop_vlg4_rm0_diag  s_prop_vlg5_rm0_diag  s_prop_vlg6_rm0_diag  
s_prop_vlg1_rm1_diag  s_prop_vlg2_rm1_diag  s_prop_vlg3_rm1_diag  s_prop_vlg4_rm1_diag  s_prop_vlg5_rm1_diag  s_prop_vlg6_rm1_diag  
s_prop_vlg1_rm0_naive  s_prop_vlg2_rm0_naive  s_prop_vlg3_rm0_naive  s_prop_vlg4_rm0_naive  s_prop_vlg5_rm0_naive  s_prop_vlg6_rm0_naive  
s_prop_vlg1_rm1_naive  s_prop_vlg2_rm1_naive  s_prop_vlg3_rm1_naive  s_prop_vlg4_rm1_naive  s_prop_vlg5_rm1_naive  s_prop_vlg6_rm1_naive  
s_prop_tam1   s_prop_tam2   s_prop_tam3  s_prop_k103m  s_prop_y181m  s_prop_g190m   
s_prop_m184m  s_prop_q151m  s_prop_k65m   
s_prop_p32m   s_prop_p33m   s_prop_p46m  s_prop_p47m  s_prop_p50vm   
s_prop_p50lm  s_prop_p54m   s_prop_p76m  s_prop_p82m  s_prop_p84m  s_prop_p88m  s_prop_p90m  s_prop_pim  s_prop_inpm  s_prop_insm   

prevalence1524m  prevalence2534m  prevalence3544m  prevalence4554m  prevalence5564m
prevalence1524w  prevalence2534w  prevalence3544w  prevalence4554w  prevalence5564w
incidence1524m_epnewp  incidence2534m_epnewp  incidence3544m_epnewp  incidence4554m_epnewp  incidence5564m_epnewp
incidence1524w_epnewp  incidence2534w_epnewp  incidence3544w_epnewp  incidence4554w_epnewp  incidence5564w_epnewp

prop_mono_m_1524  prop_mono_m_2534  prop_mono_m_3544  prop_mono_m_4554  prop_mono_m_5564
prop_mono_w_1524  prop_mono_w_2534  prop_mono_w_3544  prop_mono_w_4554  prop_mono_w_5564
s_prop_newp_i_m_1524  s_prop_newp_i_m_2534  s_prop_newp_i_m_3544  s_prop_newp_i_m_4554  s_prop_newp_i_m_5564
s_prop_newp_i_w_1524  s_prop_newp_i_w_2534  s_prop_newp_i_w_3544  s_prop_newp_i_w_4554  s_prop_newp_i_w_5564

d_s_newp

s_prop_ageg1_m_vlg1  s_prop_ageg1_m_vlg2  s_prop_ageg1_m_vlg3   s_prop_ageg1_m_vlg4   s_prop_ageg1_m_vlg5   s_prop_ageg1_m_vlg6  
s_prop_ageg2_m_vlg1  s_prop_ageg2_m_vlg2  s_prop_ageg2_m_vlg3   s_prop_ageg2_m_vlg4   s_prop_ageg2_m_vlg5   s_prop_ageg2_m_vlg6  
s_prop_ageg3_m_vlg1  s_prop_ageg3_m_vlg2  s_prop_ageg3_m_vlg3   s_prop_ageg3_m_vlg4   s_prop_ageg3_m_vlg5   s_prop_ageg3_m_vlg6  
s_prop_ageg4_m_vlg1  s_prop_ageg4_m_vlg2  s_prop_ageg4_m_vlg3   s_prop_ageg4_m_vlg4   s_prop_ageg4_m_vlg5   s_prop_ageg4_m_vlg6  
s_prop_ageg5_m_vlg1  s_prop_ageg5_m_vlg2  s_prop_ageg5_m_vlg3   s_prop_ageg5_m_vlg4   s_prop_ageg5_m_vlg5   s_prop_ageg5_m_vlg6  

s_prop_ageg1_w_vlg1  s_prop_ageg1_w_vlg2  s_prop_ageg1_w_vlg3   s_prop_ageg1_w_vlg4   s_prop_ageg1_w_vlg5   s_prop_ageg1_w_vlg6  
s_prop_ageg2_w_vlg1  s_prop_ageg2_w_vlg2  s_prop_ageg2_w_vlg3   s_prop_ageg2_w_vlg4   s_prop_ageg2_w_vlg5   s_prop_ageg2_w_vlg6  
s_prop_ageg3_w_vlg1  s_prop_ageg3_w_vlg2  s_prop_ageg3_w_vlg3   s_prop_ageg3_w_vlg4   s_prop_ageg3_w_vlg5   s_prop_ageg3_w_vlg6  
s_prop_ageg4_w_vlg1  s_prop_ageg4_w_vlg2  s_prop_ageg4_w_vlg3   s_prop_ageg4_w_vlg4   s_prop_ageg4_w_vlg5   s_prop_ageg4_w_vlg6  
s_prop_ageg5_w_vlg1  s_prop_ageg5_w_vlg2  s_prop_ageg5_w_vlg3   s_prop_ageg5_w_vlg4   s_prop_ageg5_w_vlg5   s_prop_ageg5_w_vlg6  

s_prop_m_vlg1  s_prop_m_vlg2  s_prop_m_vlg3  s_prop_m_vlg4  s_prop_m_vlg5
s_prop_w_vlg1  s_prop_w_vlg2  s_prop_w_vlg3  s_prop_w_vlg4  s_prop_w_vlg5

p_onart_vls  p_onart_epvls  d_vls
p_diag  p_diag_onart  p_diag_eponart  p_diag_m  p_diag_w  p_epdiag_m  p_epdiag_w  d_diag_m  d_diag_w
d_onart

d_hiv_epi_wm  d_hiv_epi_mw  r_hiv_epi_both  r_ep_mw

r_s_ep_m15w15  r_s_ep_m15w25  r_s_ep_m15w35  r_s_ep_m15w45  r_s_ep_m15w55
r_s_ep_m25w15  r_s_ep_m25w25  r_s_ep_m25w35  r_s_ep_m25w45  r_s_ep_m25w55
r_s_ep_m35w15  r_s_ep_m35w25  r_s_ep_m35w35  r_s_ep_m35w45  r_s_ep_m35w55
r_s_ep_m45w15  r_s_ep_m45w25  r_s_ep_m45w35  r_s_ep_m45w45  r_s_ep_m45w55
r_s_ep_m55w15  r_s_ep_m55w25  r_s_ep_m55w35  r_s_ep_m55w45  r_s_ep_m55w55

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r  s_m_newp   s_w_newp
ptnewp15_m  ptnewp25_m  ptnewp35_m  ptnewp45_m  ptnewp55_m
ptnewp15_w  ptnewp25_w  ptnewp35_w  ptnewp45_w  ptnewp55_w

/* keep going - only needed in test runs */

keep_going_1999_  keep_going_2004_  keep_going_2016_  keep_going_2020_ 

s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 

; 

* note need to keep one s_n ! ;

run;
