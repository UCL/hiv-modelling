

* === ABOUT THIS PROGRAM  === *

--
 
This is the unified hiv synthesis  program for sub saharan africa.

All programs run on legion/myriad for presentations/publications will use this program.

When running to address a specific research question the only parts of the program that may differ from this core program are 
the "options code" section and the the "update code" and the file name specified in the output file at the end of the program.  

In addition the section parameter values sampled can be replaced by reading an existing set of values for these parameters.  

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


NOTES / CONSIDERATIONS / ISSUES


- prep:  is > 80% adh enough for max efficacy ?

- check that suppressed viral load levels are low enough - % with vl < 1000 looks fine but check % with vl < 50 / 500 also looks ok

- no change in efficacy with m184v in partner ?
  lower rate transmission m184v (and/or lower persistence) ?

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

- review gender differences in HIV prevalence and proportion diagnosed - larger differences seen in PHIA data


* === LOVELEEN NOTES 



* === ANDREW NOTES 

to do before starting testing in preparation for runs:

- consider effect of sw_program_visit on prob of starting and continuing on prep in sw

- add in exposure at birth (mother infected), mother vl, child prophylaxis, infection at birth based on mtct rate and at least risk of aids death, 
	resistance, diagnosed, onart, up to age 15 (would need to create a variable for each pregnancy for hiv+ women as to whether has transmitted to
    the child, which can happen up to end of breastfeeding) - this would be based on woman-specific probabilities while the risk of babies being
    infected would depend on the distribution of uch probabilities across all pregnant women in the period. probably will have to stick with having 
    pregnant = 1 only in one period for the period of childbirth (and not counting still births or miscarriages) but can include probabilities
	of infection during breastfeeding based on dn of breastfeeding and viral load during the breastfeeding period.

- model ipt ?

- make parameters like rare_int_choice so that they vary between individuals ?

- todo: add in the variables to take medians of (cd4diag  measured_cd4art  years_since_start_prep n_test_prev_4p_onprep age_deb_sw act_years_sw  tot_dur_sw)

- consider effects on transmission of increases in gx

- consider again early mismatch in newp by gender, and also growing newp_ge1 / newp_ge5 in first years to 1995: considered acceptable so long as resolved 
  by around 1995.   We could have a  burn in period for newp before hiv introduced in 1989 but wonder if it is worth the disruption when everything seems 
  generally OK  	

- re-visit costs (particularly of testing)

- sample rate of leaving sex work 

- vmmc needs to depend on age

- conceive of an additional average annual cost per hiv diagnosed person (without sv = 1) to help to improve all below: 
  incr_adh_2020 decr_hard_reach_2020 decr_prob_loss_at_diag_2020 decr_rate_lost_2020 decr_rate_lost_art_2020
  incr_rate_return_2020 incr_rate_return_2020 incr_rate_restart_2020 incr_rate_init_2020  decr_rate_int_choice_2020  

- consider extra costs testing sw - currently sw_test_6mthly_2020 intervention is assumed to cost only the cost of the extra tests 
- more generally, have included an annual cost for people with diagnosed hiv and sv ne 1 to improve cascade but have not included additional costs beyond
  unit costs for increased switch of increased viral load measure done, prep or circumcision - still no specific costs for lower newp / more condom use

- consider that cascade of care enhancements can be general or in sex workers only 

* ==== VALE NOTES 




* ==== DOCUMENTATION NOTES AND IDEAS


- new outputs:  AIDS death rate by CD4 at start of ART and ahd{t} in first period

***testing merge;



* ==== GENERAL NOTES AND CONSIDERATIONS  

;



* libname a 'C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\';
* libname a '/home/cceapsc/Scratch/';
%let outputdir = %scan(&sysparm,1," ");
libname a "&outputdir/";
%let tmpfilename = %scan(&sysparm,2," ");

* proc printto log="C:\Loveleen\Synthesis model\unified_log";
  proc printto ; *   log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log";
	
%let population = 1000; 

options ps=1000 ls=220 cpucount=4 spool fullstimer ;

* creating a file cum_l1 that will be used to save outputs at the end of running each loop of the model , i.e. every 3 months  ;
data cum_l1; 


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 1

One  row of data defined, containing  parameter values that remain fixed for the whole run 

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


data z;

run = rand('uniform')*1000000000;  run=round(run,1);
										   
dataset_id=trim(left(run));
call symput('dataset_id',dataset_id);

caldate1=1989;
caldate_never_dot=1989;

* these used after 2020 - code is here so value the same for all people;
_u1 = uniform(0); _u2 = uniform(0); _u3 = uniform(0); _u4 = uniform(0); _u5 = uniform(0);  _u6 = uniform(0); _u7 = uniform(0); _u8 = uniform(0);
_u9 = uniform(0); _u10 = uniform(0); _u11 = uniform(0); _u12 = uniform(0); _u13 = uniform(0); _u14 = uniform(0); _u15 = uniform(0); _u16 = uniform(0);
_u17 = uniform(0); _u18 = uniform(0); _u19 = uniform(0); _u20 = uniform(0); _u21 = uniform(0); _u22 = uniform(0); _u23 = uniform(0); _u24 = uniform(0);
_u25 = uniform(0); _u26 = uniform(0); _u27 = uniform(0); _u28 = uniform(0); _u29 = uniform(0); _u30 = uniform(0); _u31 = uniform(0); _u32 = uniform(0);
_u33 = uniform(0); _u34 = uniform(0); _u35 = uniform(0); _u36 = uniform(0); _u37 = uniform(0); _u38 = uniform(0); _u39 = uniform(0); _u40 = uniform(0);
_u41 = uniform(0); _u42 = uniform(0); _u43 = uniform(0); _u44 = uniform(0); _u45 = uniform(0); _u46 = uniform(0); _u47 = uniform(0); _u48 = uniform(0);
_u49 = uniform(0); _u50 = uniform(0); _u51 = uniform(0); _u52 = uniform(0); _u53 = uniform(0); _u54 = uniform(0); _u55 = uniform(0); _u56 = uniform(0);
_u57 = uniform(0); _u58 = uniform(0); _u59 = uniform(0); _u60 = uniform(0); _u61 = uniform(0); _u62 = uniform(0); _u63 = uniform(0); _u64 = uniform(0);


* start of epidemic;
startyr = 1989 + 0.25;
* ts1m;
/*
startyr = 1989 + 1/12;
*/


newp_seed = 7;  



* PARAMETER VALUES - NOTE THESE ALL GET OVER_WRITTEN BELOW IF SAMPLED;

* SEXUAL BEHAVIOUR;

ch_risk_diag = 9/13; *overwritten; 
ch_risk_diag_newp = 5/6; *overwritten;
ych_risk_beh_newp = .99; *overwritten;
ych2_risk_beh_newp = 1.0; *overwritten;
ych_risk_beh_ep = 1.0; *overwritten;
eprate=0.1; *overwritten; * dependent_on_time_step_length ;
newp_factor= 6.5; *overwritten;
p_rred_p = 0.20; *overwritten;
p_hsb_p = 0.05; *overwritten;
condom_incr_2020 = 0; * mar19;
exp_setting_lower_p_vl1000 = 0; * exposure to hiv in an external setting where p_vl1000 is lower - during short term out migration followed by return;
external_exp_factor = 1;
rate_exp_set_lower_p_vl1000 = 0; * dependent_on_time_step_length ;
rr_sw_age_1519 = 1.00;
rr_sw_age_2534 = 0.30;
rr_sw_age_3549 = 0.03;
rr_sw_life_sex_risk_3 = 10;
rr_sw_prev_sw = 10;

* PREGNANCY;

can_be_pregnant=0.95;
prob_pregnancy_base=0.08; *overwritten;  * dependent_on_time_step_length ;  
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
* dependent_on_time_step_length ;

* AP 19-7-19 ;
rate_loss_nnres_pmtct_maj = 0.75;  rate_loss_nnres_pmtct_min = rate_loss_nnres_pmtct_maj; * apr 2019 - increased from 0.25 due as part of 
reconciling model with higher proportion of men with viral suppression on art than women, when data are the opposite;
* dependent_on_time_step_length ;

* HIV TESTING ;

date_start_testing = 2003.5; 
date_start_testanc=2003.5;
initial_rate_1sttest = 0; * dependent_on_time_step_length ;
test_rate_who4=0.10;  * dependent_on_time_step_length ;
test_rate_tb  =0.10;  * dependent_on_time_step_length ;
test_rate_who3=0.05; * dependent_on_time_step_length ;
rate_testanc_inc=0.0040; *overwritten - malawi aug15 - rate_testanc_inc_a2015=an_lin_incr_test;

hivtest_type=3; *Jul2016 - HIV test type and sensitivity of test;
date_pmtct=2004;
pmtct_inc_rate = 0.20; * rate_per_year ; 
np_lasttest=0;  
newp_lasttest=0; 
test_targeting = 1; *overwritten - test_targeting;  
max_freq_testing=1; *overwritten - means cant test more than annually;
incr_test_2020 = 0;
sw_test_6mthly=0;

* CIRCUMCISION;

circ_inc_rate = 0.003;  *overwritten; * dependent_on_time_step_length ;

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
rate_lost = 0.04; *overwritten; * dependent_on_time_step_length ;
prob_lost_art = 0.9; *overwritten;
rate_return = 0.05; *overwritten; * dependent_on_time_step_length ;
rate_restart = 0.4; *overwritten; * dependent_on_time_step_length ;
pr_art_init = 0.4; *overwritten; * dependent_on_time_step_length ;
base_res_test=0;
flr=0;  
third_line=1; * this means third line with dar unavailable but it is possible to have 1st line efa, 2nd line dol, 3rd line taz or lpr;
art_intro_date = 2004;
fold_change_mut_risk = 1; *overwritten;
v_min_art=1.0;  
sd_v_art=0.5; 
pr_switch_line = 0.05; *overwritten; * dependent_on_time_step_length ;  
adh_pattern = 2; *overwritten;
red_adh_tb_adc = 0.1; *overwritten - reduced adherence in those with TB disease or active WHO4;
red_adh_tox_pop = 0.05; *overwritten - reduced adherence in those with toxicity;
add_eff_adh_nnrti = 0.10; *overwritten - additional "effective" adh of nnrti due to longer half life;
altered_adh_sec_line_pop = 0.05; *overwritten - better adherence on second line (pi);
adh_effect_of_meas_alert = 0.7; *overwritten;
pir_higher_potency=1; 
adh_nnrti_p5_if_ltp5 = 1;
poorer_cd4rise_fail_nn = -6; *overwritten - adjustment to degree of cd4 change for being on nnrti not pi when nactive <= 2 ;
* dependent_on_time_step_length ;

sd_cd4 = 1.2;* sd of cd4 (on sqrt scale);
sd_measured_cd4 = 1.7; * error added to measured cd4 (on sqrt scale); 
rate_int_choice = 0.01; *overwritten; * dependent_on_time_step_length ;  
prob_supply_interrupted=0.003; * drug supply; * dependent_on_time_step_length ;
prob_supply_resumed=0.8; * per 3 mths - base 0.8; * dependent_on_time_step_length ;
rate_loss_acq_nnm_offart = 0.05;  * informed by consideration of data on proportion of people ART experienced re-initiators with nnrti resistance in padr program;  
* dependent_on_time_step_length ;

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
prob_cd4_meas_done=0.85; * consider whether effectively * dependent_on_time_step_length ;
prob_vl_meas_done=0.50; *overwritten; * consider whether effectively * dependent_on_time_step_length ;
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
hard_reach=0; * this is effectively reluctance to test - with effects on testing for prep and vmmc also - assumed will test if symptomatic or in anc;

* PREP;

* PREP assumed introduced in fsw/agyw 2017 - with level of coverage and retention; 
annual_testing_prep=0.25; *frequency of HIV testing for people on PrEP (1=annual, 0.5= every 6 months, 0.25=every 3 months);
hivtest_type=3; *HIV test type (1=RNA VL test, 3=3rd gen, 4=4th gen);
eff_adh_prep=0.95; *PrEP effectiveness with 100% adherence ; 
factor_prep_adh_older=0.5; * factor determining how much higher adh to prep is in people age > 25 than < 25; 
rate_test_onprep=1.00; *Rate of being tested for HIV whilst on PrEP; * may17  ####  was 0.95 - changed to remove effect of this on number on prep (this will need to be considered again) ;
* dependent_on_time_step_length ;
pr_prep_b=0.75; * 11dec17; *Probability of starting PrEP in people (who are eligible and willing to tak prep) tested for HIV according to the base rate of testing;

prob_prep_restart=1.00; * set to 1 given we have rate_test_restartprep; *Probability of restarting PrEP after discontinuation due to not eligible; * may17;
* dependent_on_time_step_length ;

prob_prep_visit_counsel=0; *Probability of PrEP adherence counselling happening at drug pick-up;
tot_yrs_prep=0;
prob_prep_restart_choice=0.10; * probability of restarting PrEP after discontinuation even when newp>1;
* dependent_on_time_step_length ; 
prepuptake_sw=0.50; *Probability of PrEP uptake if eligible for female sex workers;
prepuptake_pop=0.20; **Probability of PrEP uptake if eligible for general population;
pop_wide_tld_prob_egfr=0.5; * probability per 3 months of getting egfr test when pop_wide_tld_prep=1 when indicated (annually);
* dependent_on_time_step_length ;


* EXTRA RATE PARAMETERS FOR WHICH VALUES WERE PREVIOUSLY HARD CODED BELOW - 26_11_19; 

* rate of change in art initiation strategy in 2011;
rate_ch_art_init_str_2011 = 0.4;
* rate of women wanting no more children;
rate_want_no_more_children = 0.005;
* rate of sti and persistence, function of newp;
rate_sti = 1 / 20 ;
rate_persist_sti = 1 / 5 ;

* dependent on rred_rc, rate of sex workers moving to one category lower;
rate_sw_rred_rc = 0.02; 
* rate of development of non-hiv symptoms, regardless of hiv status;
rate_non_hiv_symptoms=0.005;
r_swi_efa_cns = 0.02;
r_swi_efa_ras = 0.05;
r_swi_nev_hep = 0.10;
r_swi_nev_ras = 0.15;
r_swi_zdv_nau = 0.08;
r_swi_zdv_head = 0.02;
r_swi_zdv_lip = 0.01;
r_swi_zdv_ane = 0.05;
r_swi_zdv_lac = 1;
r_swi_ten_neph = 0.20;
r_swi_lpr_nau = 0.05;
r_swi_lpr_dia = 0.05;
r_swi_taz_nau = 0.05;
r_swi_taz_dia = 0.05;
r_swi_dol_cns = 0.02;
rate_loss_acq_pim_offart = 0.2;
rate_loss_acq_iim_offart = 0.2;

r_nau_start_zdv_lpr = 0.03 ;
p_nau_stops_zdv_lpr = 0.5 ;
r_dia_start_lpr = 0.02;
p_dia_stops_lpr = 0.5 ;
r_dia_start_taz_dar = 0.01;
p_dia_stops_taz_dar = 0.5 ;
r_ras_start_efa = 0.03;
r_res_start_nev = 0.10;
r_weightg_start_dol = 0.01;
r_cns_start_efa = 0.1;
p_cns_stops_efa = 0.2;
r_cns_start_dol = 0.05;
p_cns_stops_dol = 0.6;
r_lip_start_zdv = 0.015;
r_hep_start_nev = 0.02;
r_otx_start = 0.03;
r_ane_start_zdv = 0.03; 
p_ane_stops_zdv = 0.8;
r_head_start_zdv = 0.1;  
p_head_stops_zdv = 0.6 ;
r_lac_start_zdv = 0.0002;
r_neph_start_ten = 0.0035;
p_neph_stops_ten = 0 ;
p_neph_stops_after_ten = 0.1;


* ========== PARAMETER VALUES SAMPLED ;  * these represent both uncertainty over likely fixed biological parameters and variability over settings;

***** population growth  ***LBM Jul19;
* inc_cat; r=uniform(0); if r < 0.33 then inc_cat = 1; if 0.33 <= r < 0.66 then inc_cat = 2; if 0.66 <= r then inc_cat=3;

***** Sexual behaviour;
* base_rate_sw; r=uniform(0);  if  r < 0.20 then base_rate_sw = 0.0015;  if 0.20 <= r < 0.8 then base_rate_sw = 0.002 ; 
								if 0.80 <= r then base_rate_sw = 0.0025 ;  


* dependent_on_time_step_length ;

* base_rate_stop_sexwork;   r=uniform(0); base_rate_stop_sexwork = 0.03; if r < 0.33 then base_rate_stop_sexwork = 0.015;
							 if r > 0.67 then base_rate_stop_sexwork = 0.01;
* dependent_on_time_step_length ;

* sw_trans_matrix;   r=uniform(0);  if r < 0.125 			then sw_trans_matrix = 1;  if 0.125 <= r < 0.250 then sw_trans_matrix = 2;  
									if 0.250 <= r < 0.375 	then sw_trans_matrix = 3;  if 0.375 <= r < 0.500 then sw_trans_matrix = 4;  
									if 0.500 <= r < 0.625 	then sw_trans_matrix = 5;  if 0.625 <= r < 0.750 then sw_trans_matrix = 6;  
									if 0.750 <= r < 0.875 	then sw_trans_matrix = 7;  if 0.875 <= r         then sw_trans_matrix = 8;  

* sw_init_newp;    r=uniform(0);  if r < 0.50 then sw_init_newp = 1;   if 0.50 <= r        then sw_init_newp = 2;  
								if 1.00 <= r then sw_init_newp = 3; *nobody in this category for now;
* rate_sw_rred_rc;	 r=uniform(0); if r < 0.33 then rate_sw_rred_rc=0.01;   if 0.33 <= r < 0.67 then rate_sw_rred_rc = 0.03;  
								if 0.67 <= r then rate_sw_rred_rc = 0.10; * dependent on rred_rc, rate of sex workers moving to one category lower;

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
										if 4/6 <= e < 5/6  then sex_age_mixing_matrix_w=5; if 5/6 <= e        then sex_age_mixing_matrix_w=6;

* rred_a_p;	r=uniform(0); if r < 0.15 then rred_a_p=1; if 0.15 <= r < 0.30 then rred_a_p=2;  if 0.30 <= r < 0.65 then rred_a_p=3;  if r >= 0.65 then rred_a_p=4; 
* p_rred_p; r=uniform(0); if r < 0.33 then p_rred_p = 0.3; if 0.33 <= r < 0.67 then p_rred_p = 0.5; 
			if 0.67 <= r  then p_rred_p = 0.7;  	

* p_hsb_p; 	r=uniform(0); if r < 0.33 then p_hsb_p = 0.05; if 0.33 <= r < 0.67 then p_hsb_p = 0.08; if 0.67 <= r then p_hsb_p = 0.15;
* newp_factor;  newp_factor = 1 ; * 15_1_20 4pm ;
			 r=uniform(0); if r < 0.33 then newp_factor = 0.5 ; if r > 0.67 then newp_factor = 2   ; 

* eprate;	eprate = 0.1* exp(normal(0)*0.25); eprate = round(eprate,0.01);* rate of new long term partners in youngest age group; 
* dependent_on_time_step_length ;

* conc_ep; 	r=uniform(0); conc_ep = 1    ; if r < 0.33 then conc_ep = 0.333; if r > 0.67 then conc_ep=3;
* ch_risk_diag;  r=uniform(0); if r < 0.25 then ch_risk_diag = 0.7; if 0.25 <= r < 0.5 then ch_risk_diag = 0.8; if 0.5 <= r < 0.75 then ch_risk_diag = 0.9; if 0.8 <= r then ch_risk_diag = 1;
* ch_risk_diag_newp;  r=uniform(0); if r < 0.25 then ch_risk_diag_newp = 0.7; if 0.25 <= r < 0.5 then ch_risk_diag_newp = 0.8; if 0.5 <= r < 0.75 then ch_risk_diag_newp = 0.9; if 0.75 <= r then ch_risk_diag_newp = 1; *mf - aug18;

* ych_risk_beh_newp;  r=uniform(0); ych_risk_beh_newp = 0.70;  if r < 0.20 then ych_risk_beh_newp = 0.80;	if 0.80 <= r then ych_risk_beh_newp = 0.60;

* ych2_risk_beh_newp;  r=uniform(0); if r < 0.05 then ych2_risk_beh_newp = 1/0.95; if 0.05 <= r < 0.1 then ych2_risk_beh_newp = 1/0.99; if 0.1 <= r < 0.9 then ych2_risk_beh_newp = 1.0; if 0.9 <= r < 0.95 then ych2_risk_beh_newp = 0.99; if 0.95 <= r then ych2_risk_beh_newp = 0.95; 
* ych_risk_beh_ep;  r=uniform(0); ych_risk_beh_ep = 1.00;  if  0.25 <= r < 0.5 then ych_risk_beh_ep = 0.95; if 0.5 <= r < 0.75 then ych_risk_beh_ep = 0.90; if 0.75 <= r then ych_risk_beh_ep = 0.80; 

* exp_setting_lower_p_vl1000; exp_setting_lower_p_vl1000 = 0; * exposure to setting with lower p_vl1000 due to migration (and return); 
						r=uniform(0); if r < 0.20 then do; 
						exp_setting_lower_p_vl1000 = 1; * whether in this model run exposure can happen; 
						external_exp_factor = 1 + uniform(0); external_exp_factor = round(external_exp_factor,0.01); * effect of exposure ; 
						rate_exp_set_lower_p_vl1000 = uniform(0) * 0.01 ; rate_exp_set_lower_p_vl1000 = round(rate_exp_set_lower_p_vl1000,0.0001); 
						* rate of exposure;  * rate_exp_set_lower_p_vl1000 * dependent_on_time_step_length ;
						end;
* higher_newp_with_lower_adhav;
				r=uniform(0); higher_newp_with_lower_adhav = 0; if r < 0.2 then higher_newp_with_lower_adhav = 1;

***** pregnancy;
* prob_pregnancy_base;  r=uniform(0); prob_pregnancy_base=0.03 + r*0.08;  
						if inc_cat = 1 then prob_pregnancy_base = prob_pregnancy_base * 1.75 ;if inc_cat = 3 then prob_pregnancy_base = prob_pregnancy_base / 1.75 ;
						prob_pregnancy_base = round(prob_pregnancy_base,0.001);	* dependent_on_time_step_length ;
***** transmission;

* fold_change_w; r=uniform(0); if r < 0.05 then fold_change_w = 1; if 0.05 <= r < 0.30 then fold_change_w = 1.5; 
					 if 0.30 <= r then fold_change_w = 2; 

* fold_change_yw; fold_change_yw = fold_change_w * 3    ;  r=uniform(0); if r < 0.33 then fold_change_yw = fold_change_w * 1    ;
					if r > 0.67 then fold_change_yw = fold_change_w * 5    ;

* fold_change_sti; fold_change_sti=3 ;  r=uniform(0); if r < 0.333 then fold_change_sti=2 ;  if r > 0.67 then fold_change_sti=5 ;

* fold_tr_newp;		fold_tr_newp = 0.3; r=uniform(0); if r < 0.33 then fold_tr_newp = 0.5; if r > 0.67 then fold_tr_newp = 0.7;

* super_infection; u=uniform(0); if u < 0.5 then super_infection=0; if u >= 0.5 then super_infection = 1;

***** testing;

* an_lin_incr_test;   r=uniform(0); if r < 0.1   then an_lin_incr_test = 0.0005 ; if 0.1   <= r < 0.3 then an_lin_incr_test = 0.0030; 
					  if 0.3 <= r < 0.5   then an_lin_incr_test = 0.0100 ;  if 0.5    <= r < 0.7  then an_lin_incr_test = 0.0200;
					  if 0.7    <= r < 0.9  then an_lin_incr_test = 0.0400;
					  if 0.9    <= r        then an_lin_incr_test = 0.1000;

* date_test_rate_plateau;  r=uniform(0); if r < 0.1  then date_test_rate_plateau = 2011.5; if 0.1  <= r < 0.2  then date_test_rate_plateau = 2013.5; 
			if 0.2  <= r < 0.4  then date_test_rate_plateau = 2015.5; if 0.4  <= r < 0.7 then date_test_rate_plateau = 2017.5; 
 				if 0.7 <= r then date_test_rate_plateau = 2019.5;
* rate_testanc_inc; r=uniform(0); if  r < 0.33 then rate_testanc_inc = 0.030; if 0.33 <= r < 0.66   then rate_testanc_inc = 0.050; if 0.66  <= r then rate_testanc_inc = 0.1; * jul18;
* dependent_on_time_step_length ;

* incr_test_rate_sympt; r=uniform(0); if r < 0.2 then incr_test_rate_sympt = 1.05 ; if 0.2 <= r < 0.4 then incr_test_rate_sympt = 1.10; if 0.4 <= r < 0.6 then incr_test_rate_sympt = 1.15; if 0.6 <= r < 0.8 then incr_test_rate_sympt = 1.20;	if 0.8 <= r then incr_test_rate_sympt = 1.25; 
* dependent_on_time_step_length ;

* max_freq_testing;   r=uniform(0); max_freq_testing =1; if r < 0.20 then max_freq_testing=2; 
* test_targeting;   r=uniform(0); test_targeting =1.25 ; if r < 0.20 then test_targeting = 1.5;

***** natural progression;

* fx;		r=uniform(0);  if r < 0.2 then fx = 0.7; if 0.2 <= r < 0.4 then fx = 0.85; if 0.4 <= r < 0.6 then fx = 1.0; if 0.6 <= r < 0.8 then fx = 1/0.85 ; if 0.8 <= r then fx=1/0.7; 
* gx;		r=uniform(0);  if r < 0.33 then gx = 1.0; if 0.33 <= r < 0.67 then gx = 1.5;  if 0.67 <= r  then gx = 2.0;  

***** art: linkage, retention, monitoring, loss, return, interruption of art and restarting;

* adh_pattern; r=uniform(0);  
				if 0.00 <= r < 0.05 then adh_pattern=100 ; if 0.05 <= r < 0.70 then adh_pattern=1;   if 0.70 <= r < 0.80 then adh_pattern=2;   
				if 0.80 <= r < 0.90 then adh_pattern=3;   if 0.90 <= r < 0.95 then adh_pattern=4; if 0.95 <= r  then adh_pattern=5; 

* AP 19-7-19 - most of these changes to parameters sampled are from trying to get a range of setting scenarios that reflect sub saharan africa;  
* reduced higher values as middle 90 not consistent with phias with those values ; 
* prob_loss_at_diag;  r=uniform(0); if r < 0.20 then prob_loss_at_diag = 0.02; if 0.20 <= r < 0.40 then prob_loss_at_diag = 0.05; 
						if 0.40 <= r < 0.60  then prob_loss_at_diag = 0.20; if 0.60 <= r < 0.80  then prob_loss_at_diag = 0.35; 
						if 0.80 <= r < 0.90  then prob_loss_at_diag = 0.50; if 0.90 <= r   then prob_loss_at_diag = 0.80;   

* AP 19-7-19 ;
* pr_art_init; r=uniform(0); if 0 <= r < 0.25 then pr_art_init = 0.4; if 0.25 <= r < 0.50 then pr_art_init = 0.5; if 0.5 <= r < 0.75 then pr_art_init = 0.6; if 0.75 <= r then pr_art_init = 0.7;	


* dependent_on_time_step_length ;

* rate_lost; r=uniform(0); if r < 0.33 then rate_lost = 0.2; if 0.33 <= r < 0.66 then rate_lost = 0.35; if r >= 0.66 then rate_lost = 0.5;
* dependent_on_time_step_length ;
* prob_lost_art; r=uniform(0); if r < 0.2 then prob_lost_art = 0.5; if 0.2 <= r < 0.4 then prob_lost_art = 0.6; if 0.4 <= r < 0.6 then prob_lost_art = 0.7; if 0.6 <= r < 0.8 then prob_lost_art = 0.8;	if 0.8 <= r then prob_lost_art = 0.9;
* dependent_on_time_step_length ;

* AP 19-7-19 ;
* rate_return;  r=uniform(0); if  r < 0.10 then rate_return = 0.01; if  0.10 <= r < 0.25 then rate_return = 0.10; 
			if 0.25 <= r < 0.5 then rate_return = 0.10; if 0.5 <= r < 0.75 then rate_return = 0.50 ;	if 0.75 <= r then rate_return = 0.8; 

* rate_restart;  r=uniform(0); if r < 0.25 then rate_restart = 0.8; if 0.25 <= r < 0.5 then rate_restart = 0.85; if 0.5 <= r < 0.75 then rate_restart = 0.9; if 0.75 <= r then rate_restart = 0.95;
* dependent_on_time_step_length ;

* AP 19-7-19 ;
* rate_int_choice;  r=uniform(0);  if r < 0.25 then rate_int_choice = 0.0005; if 0.25 <= r < 0.50 then rate_int_choice = 0.002; 
			if 0.50 <= r < 0.75 then rate_int_choice = 0.004; if 0.75 <= r then rate_int_choice = 0.008 ;
 
* clinic_not_aw_int_frac;  r=uniform(0); if r < 0.2 then clinic_not_aw_int_frac = 0.1; if 0.2 <= r < 0.4 then clinic_not_aw_int_frac = 0.3; if 0.4 <= r < 0.6 then clinic_not_aw_int_frac = 0.5; if 0.6 <= r < 0.8 then clinic_not_aw_int_frac = 0.7; if 0.8 <= r then clinic_not_aw_int_frac = 0.9;
* res_trans_factor_nn (this is for nnrti only); r=uniform(0); if r < 0.20 then res_trans_factor_nn= 0.50; if 0.20 <= r < 0.40 then res_trans_factor_nn= 0.7;
				if 0.40 <= r < 0.60 then res_trans_factor_nn= 0.8; if 0.60 <= r < 0.80 then res_trans_factor_nn= 0.90;  if 0.80 <= r then res_trans_factor_nn= 1.00;  * may18;
* rate_loss_persistence;  r=uniform(0); if r < 0.1  then rate_loss_persistence= 0.00;if 0.1 <= r < 0.2  then rate_loss_persistence= 0.005; if 0.2  <= r < 0.3  then rate_loss_persistence= 0.01;  if 0.3  <= r < 0.7  then rate_loss_persistence= 0.015; if 0.7  <= r then rate_loss_persistence= 0.020;
* incr_rate_int_low_adh;  r=uniform(0); incr_rate_int_low_adh = 1;  if r < 0.5 then incr_rate_int_low_adh = 2; if r < 0.25 then incr_rate_int_low_adh = 5;
* poorer_cd4rise_fail_nn;  poorer_cd4rise_fail_nn = -6 + (3 * normal(0)); poorer_cd4rise_fail_nn = round(poorer_cd4rise_fail_nn,1);
* poorer_cd4rise_fail_ii;  r=uniform(0); poorer_cd4rise_fail_ii=0; if r < 0.5 then poorer_cd4rise_fail_ii=1;
* rate_res_ten;  r=uniform(0); rate_res_ten=0.2; if r < 0.33 then rate_res_ten=0.1;  if r >= 0.67 then rate_res_ten=0.3;  
* fold_change_mut_risk;  r=uniform(0); fold_change_mut_risk = 1; if r < 0.10  then fold_change_mut_risk = 2; if r > 0.90 then fold_change_mut_risk = 0.5; * jan18;
* adh_effect_of_meas_alert; r=uniform(0); adh_effect_of_meas_alert = 0.7; if 0.7 <= r < 0.85 then adh_effect_of_meas_alert = 0.35; if 0.85 <= r then adh_effect_of_meas_alert = 0.9;
* pr_switch_line;  r=uniform(0);  pr_switch_line = 0.20;  if 0.75 <= r then pr_switch_line = 0.50; 
* prob_vl_meas_done; r=uniform(0); prob_vl_meas_done=0.7 ; if 0.40 <= r < 0.70 then prob_vl_meas_done=0.1 ; if 0.70 <= r < 0.95 then prob_vl_meas_done=1.00; if 0.95 <= r then prob_vl_meas_done=0.00;
* cd4_monitoring;	r=uniform(0); cd4_monitoring=0; if prob_vl_meas_done=0.0 and r < 0.5 then cd4_monitoring = 1;
* red_adh_tb_adc; red_adh_tb_adc = 0.1 * exp(normal(0)*0.5); red_adh_tb_adc=round(red_adh_tb_adc,.01);
* red_adh_tox_pop; r=uniform(0); red_adh_tox_pop_v = 0.05; if r < 0.5 then red_adh_tox_pop_v = 0.10; 
									red_adh_tox_pop = red_adh_tox_pop_v * exp(normal(0)*0.5); red_adh_tox_pop=round(red_adh_tox_pop,.01);
* red_adh_multi_pill_pop; r=uniform(0); red_adh_multi_pill_pop_v = 0.05; if r < 0.33 then red_adh_multi_pill_pop_v = 0.10; 
										if r > 0.67 then red_adh_multi_pill_pop_v = 0.15; 
									red_adh_multi_pill_pop = red_adh_multi_pill_pop_v * exp(normal(0)*0.5); 
									red_adh_multi_pill_pop=round(red_adh_multi_pill_pop,.01);
* greater_disability_tox;  r=uniform(0); greater_disability_tox = 0; if r < 0.5 then greater_disability_tox = 1;
* greater_tox_zdv;		r = uniform(0); greater_tox_zdv = 0; if 0.33 <= r < 0.67 then greater_tox_zdv = 1;if 0.67 <= r then greater_tox_zdv = 2;
						if greater_tox_zdv = 1 then do; r_nau_start_zdv_lpr = r_nau_start_zdv_lpr * 2 ; r_lip_start_zdv = r_lip_start_zdv* 2  ;
						r_ane_start_zdv = r_ane_start_zdv* 2 ; r_head_start_zdv = r_head_start_zdv * 2 ; r_lac_start_zdv = r_lac_start_zdv* 2 ; end;
						if greater_tox_zdv = 2 then do; r_nau_start_zdv_lpr = r_nau_start_zdv_lpr * 4 ; r_lip_start_zdv = r_lip_start_zdv* 4  ;
						r_ane_start_zdv = r_ane_start_zdv* 4 ; r_head_start_zdv = r_head_start_zdv * 4 ; r_lac_start_zdv = r_lac_start_zdv* 4 ; end;
* add_eff_adh_nnrti; add_eff_adh_nnrti = 0.10* exp(normal(0)*0.30); add_eff_adh_nnrti=round(add_eff_adh_nnrti,.01);
* altered_adh_sec_line_pop; altered_adh_sec_line_pop = 0.05 +(normal(0)*0.05); altered_adh_sec_line_pop = round(altered_adh_sec_line_pop,.01);
* prob_return_adc; r=uniform(0);  if  r < 0.2 then prob_return_adc = 0.7; if 0.2 <= r < 0.5  then prob_return_adc = 0.8; if 0.5 <= r then prob_return_adc = 0.9; 

* prob_lossdiag_adctb;  prob_lossdiag_adctb = rand('beta',5,95); prob_lossdiag_adctb = round(prob_lossdiag_adctb,0.01);
* prob_lossdiag_who3e;  prob_lossdiag_who3e = rand('beta',15,85);prob_lossdiag_who3e = round(prob_lossdiag_who3e,0.01);

* lower_future_art_cov; r=uniform(0); if 0 <= r < 0.97 then lower_future_art_cov=0;if 0.97 <= r  then lower_future_art_cov=1;
* higher_future_prep_cov;r=uniform(0); if 0 <= r < 0.80 then higher_future_prep_cov=0;if 0.80 <= r  then higher_future_prep_cov=1;


* higher_newp_less_engagement; r=uniform(0);higher_newp_less_engagement = 0; if r < 0.2 then higher_newp_less_engagement = 1; * are people with more newp less likely to be engaged with care; 
* fold_tr;					fold_tr= 1.0 ; r=uniform(0); if r < 0.33 then fold_tr = 0.67; if r > 0.67 then fold_tr = 1.5;

* switch_for_tox; r=uniform(0); if r < 0.80 then switch_for_tox=0; if r >= 0.80 then switch_for_tox=1;

* dol_higher_potency;   dol_higher_potency = 0.5;  * so 1.5 potency - as for efa - may 2019 in response to advance results;
* zdv_potency_p75;	r=uniform(0);  zdv_potency_p75 = 0; if r < 0.5 then zdv_potency_p75 = 1; 
* rel_dol_tox; r=uniform(0); rel_dol_tox = 1; if r < 0.2  then rel_dol_tox = 2; * = 2 means same rate as efavirenz (although persistence still lower);
* zero_3tc_activity_m184; r=uniform(0); zero_3tc_activity_m184 = 0; if r < 0.2 then zero_3tc_activity_m184 = 1; 
* zero_tdf_activity_k65r; r=uniform(0); zero_tdf_activity_k65r = 0; if r < 0.2 then zero_tdf_activity_k65r = 1; 
* higher_rate_res_dol ;  r=uniform(0); higher_rate_res_dol = 0; if r < 0.2 then higher_rate_res_dol = 1; 
* res_trans_factor_ii ;  r=uniform(0); res_trans_factor_ii = 1; if r < 0.2 then res_trans_factor_ii = 2; 
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
* rr_int_tox ;				r=uniform(0); if r < 0.33 then rr_int_tox = 2; if 0.33 <= r < 0.67 then rr_int_tox = 10;  
							if 0.67 <= r then rr_int_tox = 30; 

*sw_art_disadv;				r=uniform(0); if r < 0.50 then sw_art_disadv = 1; if 0.50 <= r  then sw_art_disadv = 2;  

				 			if sw_art_disadv=1 then do; sw_higher_int = 1; prob_sw_lower_adh = 0; sw_higher_prob_loss_at_diag = 1; end;
							if sw_art_disadv=2 then do; sw_higher_int = 2; prob_sw_lower_adh = 0.3; sw_higher_prob_loss_at_diag = 1.5; end;

* sw_program;				r=uniform(0); sw_program=0;  
							if r < 0.20 then sw_program=1; 

							if sw_program = 1 then do; e=uniform(0); sw_program_effect = 1; if e < 0.5 then sw_program_effect = 2; 
														rate_engage_sw_program =0.10; rate_disengage_sw_program = 0.025;  end;

* effect_weak_sw_prog_newp;	r=uniform(0); 	if r < 0.33 then do; effect_weak_sw_prog_newp = 0.90; effect_strong_sw_prog_newp = 0.60; end;
* effect_strong_sw_prog_newp;				if 0.33 <= r < 0.67 then do; effect_weak_sw_prog_newp = 0.80; effect_strong_sw_prog_newp = 0.50; end; 
											if 0.67 <= r        then do; effect_weak_sw_prog_newp = 0.70; effect_strong_sw_prog_newp = 0.30; end; 


***** prep;

* adh_pattern_prep;  r=uniform(0); if r < 0.30 then adh_pattern_prep = 1; if 0.30 <= r < 0.6 then adh_pattern_prep = 2; if 0.6 <= r < 0.9  then adh_pattern_prep = 3; if 0.9  <= r then adh_pattern_prep = 4;	 
* rate_test_startprep; r=uniform(0); if r < 0.33 then rate_test_startprep = 0.25; if 0.33 <= r < 0.67 then rate_test_startprep = 0.5; if 0.67 <= r  then rate_test_startprep = 0.75;*Additional rate of being tested for HIV before PrEP;	 
* dependent_on_time_step_length ;

* rate_test_restartprep;  r=uniform(0); if r < 0.50 then rate_test_restartprep = 0.50; if 0.50 <= r  then rate_test_restartprep = 0.80;
* dependent_on_time_step_length ;

* rate_choose_stop_prep; r=uniform(0); if r < 0.33 then rate_choose_stop_prep = 0.05;  if 0.33 <= r < 0.67 then rate_choose_stop_prep = 0.15;
						if 0.67 <= r        then rate_choose_stop_prep = 0.30;
* dependent_on_time_step_length ;

* prob_prep_restart_choice;  r=uniform(0); if r < 0.33 then prob_prep_restart_choice=0.05; if 0.33 <= r < 0.67 then prob_prep_restart_choice=0.10;
							if 0.67 <= r then prob_prep_restart_choice=0.20;
* dependent_on_time_step_length ;

* prepuptake_sw;			r=uniform(0); prepuptake_sw=0.5;  if r > 0.8 then prepuptake_sw =0.10; if r < 0.2 then prepuptake_sw = 0.50;
* prepuptake_pop;			r=uniform(0); prepuptake_pop=0.2;  if r > 0.8 then prepuptake_pop =0.10; if r < 0.2 then prepuptake_pop = 0.5 ;

* note there are three parameters that affect use of prep besides the prep_strategy - prob_prep_b is prob of starting if prep_elig=1 and tested=1
and prep_willing = 1 - a person cannot be prep_elig=1 if hard_reach=1 - a person prep_elig=1 will only actually have a chance of starting prep
if prep_willing=1;

***** circumcision ;  

* circ_inc_rate; r=uniform(0); if r < 0.10 then circ_inc_rate = 0.0001; if 0.10 <= r < 0.20 then circ_inc_rate = 0.001 ;
if 0.20 <= r < 0.8  then circ_inc_rate = 0.003; if 0.8 <= r < 0.9 then circ_inc_rate = 0.01;  if 0.90 <= r  then circ_inc_rate = 0.10;

*circ_inc_15_19;r=uniform(0); if r < 0.33 then circ_inc_15_19 = 1.5; if 0.33 <= r < 0.66 then circ_inc_15_19 =2.0 ;
if 0.66 <= r  then circ_inc_15_19=3.0; 

*circ_red_20_30;r=uniform(0); if r < 0.33 then circ_red_20_30 = 0.30; if 0.33 <= r < 0.66 then circ_red_20_30 = 0.40;
if 0.66 <= r  then circ_red_20_30=0.50; 
*circ_red_30_50;r=uniform(0); if r < 0.33 then circ_red_30_50 = 0.15; if 0.33 <= r < 0.66 then circ_red_30_50 = 0.25;
if 0.66 <= r  then circ_red_30_50=0.35; 

* rel_incr_circ_post_2013;r=uniform(0); if r < 0.10 then rel_incr_circ_post_2013 = 0.8; if 0.10 <= r < 0.35 then rel_incr_circ_post_2013 = 1;  
if 0.35 <= r < 0.60 then rel_incr_circ_post_2013 = 3;  if 0.60 <= r  then rel_incr_circ_post_2013 = 7 ;

if circ_inc_rate=0.1 then rel_incr_circ_post_2013=min(rel_incr_circ_post_2013, 1);

* not * dependent_on_time_step_length ;

* prob_birth_circ; r=uniform(0); if r < 0.33 then prob_birth_circ = 0.03; if 0.33 <= r < 0.65 then prob_birth_circ = 0.05; 
if 0.65 <= r < 0.98 then prob_birth_circ = 0.1; if r >= 0.98 then prob_birth_circ = 0.5;

***LBM Jul19 check data on circ;


* p_hard_reach_w;  p_hard_reach_w=0.05+(uniform(0)*0.10); p_hard_reach_w = round(p_hard_reach_w, 0.01);
* hard_reach_higher_in_men;  hard_reach_higher_in_men = 0.00 + (uniform(0)*0.10); hard_reach_higher_in_men = round(hard_reach_higher_in_men,0.01);

p_hard_reach_m = p_hard_reach_w + hard_reach_higher_in_men;

****** covid death risk ;
r=uniform(0); if r < 0.40 then cov_death_risk_mult = 1; if 0.4 <= r < 0.80 then cov_death_risk_mult = 2; if 0.8 <= r then cov_death_risk_mult = 3;

* ================ ;

* determining newp base categories for new sw;
if sw_init_newp=1 then do; p_sw_init_newp_g1=0.2; p_sw_init_newp_g2=0.6; p_sw_init_newp_g3= 0.10; p_sw_init_newp_g4=0.08; p_sw_init_newp_g5=0.02; end;
if sw_init_newp=2 then do; p_sw_init_newp_g1=0.4; p_sw_init_newp_g2=0.37; p_sw_init_newp_g3= 0.10; p_sw_init_newp_g4=0.08; p_sw_init_newp_g5=0.05; end;
if sw_init_newp=3 then do; p_sw_init_newp_g1=0.8; p_sw_init_newp_g2=0.02; p_sw_init_newp_g3= 0.02; p_sw_init_newp_g4=0.08; p_sw_init_newp_g5=0.08; end;

* transition probabilities between sex worker newp levels;
* sw newp levels are   1 	newp = 0   2   newp 1-6   3   newp 7-20   4   newp 21-50   5   newp 51-150  ;
if sw_trans_matrix=1 then do;
sw_newp_lev_1_1 = 0.80 ; sw_newp_lev_1_2 = 0.17 ; sw_newp_lev_1_3 = 0.015  ; sw_newp_lev_1_4 = 0.010 ; sw_newp_lev_1_5 = 0.005 ; 
sw_newp_lev_2_1 = 0.15 ; sw_newp_lev_2_2 = 0.80 ; sw_newp_lev_2_3 = 0.030  ; sw_newp_lev_2_4 = 0.015 ; sw_newp_lev_2_5 = 0.005 ; 
sw_newp_lev_3_1 = 0.05 ; sw_newp_lev_3_2 = 0.10 ; sw_newp_lev_3_3 = 0.80  ; sw_newp_lev_3_4 = 0.045 ; sw_newp_lev_3_5 = 0.005 ; 
sw_newp_lev_4_1 = 0.025 ; sw_newp_lev_4_2 = 0.025 ; sw_newp_lev_4_3 = 0.10  ; sw_newp_lev_4_4 = 0.80 ; sw_newp_lev_4_5 = 0.05 ; 
sw_newp_lev_5_1 = 0.025 ; sw_newp_lev_5_2 = 0.025 ; sw_newp_lev_5_3 = 0.05  ; sw_newp_lev_5_4 = 0.10 ; sw_newp_lev_5_5 = 0.80 ; 
end;
if sw_trans_matrix=2 then do;
sw_newp_lev_1_1 = 0.90 ; sw_newp_lev_1_2 = 0.10 ; sw_newp_lev_1_3 = 0.000  ; sw_newp_lev_1_4 = 0.000 ; sw_newp_lev_1_5 = 0.000 ; 
sw_newp_lev_2_1 = 0.10 ; sw_newp_lev_2_2 = 0.80 ; sw_newp_lev_2_3 = 0.100  ; sw_newp_lev_2_4 = 0.000 ; sw_newp_lev_2_5 = 0.000 ; 
sw_newp_lev_3_1 = 0.00 ; sw_newp_lev_3_2 = 0.10 ; sw_newp_lev_3_3 = 0.80  ; sw_newp_lev_3_4 = 0.100 ; sw_newp_lev_3_5 = 0.000 ; 
sw_newp_lev_4_1 = 0.000 ; sw_newp_lev_4_2 = 0.000 ; sw_newp_lev_4_3 = 0.100 ; sw_newp_lev_4_4 = 0.80 ; sw_newp_lev_4_5 = 0.100; 
sw_newp_lev_5_1 = 0.000 ; sw_newp_lev_5_2 = 0.000 ; sw_newp_lev_5_3 = 0.000  ; sw_newp_lev_5_4 = 0.10 ; sw_newp_lev_5_5 = 0.90 ; 
end;
if sw_trans_matrix=3 then do;
sw_newp_lev_1_1 = 0.80 ; sw_newp_lev_1_2 = 0.05 ; sw_newp_lev_1_3 = 0.05   ; sw_newp_lev_1_4 = 0.050 ; sw_newp_lev_1_5 = 0.050 ; 
sw_newp_lev_2_1 = 0.05 ; sw_newp_lev_2_2 = 0.80 ; sw_newp_lev_2_3 = 0.050  ; sw_newp_lev_2_4 = 0.050 ; sw_newp_lev_2_5 = 0.050 ; 
sw_newp_lev_3_1 = 0.05 ; sw_newp_lev_3_2 = 0.05 ; sw_newp_lev_3_3 = 0.80  ; sw_newp_lev_3_4 = 0.050 ; sw_newp_lev_3_5 = 0.050 ; 
sw_newp_lev_4_1 = 0.050 ; sw_newp_lev_4_2 = 0.050 ; sw_newp_lev_4_3 = 0.050 ; sw_newp_lev_4_4 = 0.80 ; sw_newp_lev_4_5 = 0.050; 
sw_newp_lev_5_1 = 0.050 ; sw_newp_lev_5_2 = 0.050 ; sw_newp_lev_5_3 = 0.050  ; sw_newp_lev_5_4 = 0.05 ; sw_newp_lev_5_5 = 0.80 ;
end;
if sw_trans_matrix=4 then do;
sw_newp_lev_1_1 = 0.99 ; sw_newp_lev_1_2 = 0.01 ; sw_newp_lev_1_3 = 0.000  ; sw_newp_lev_1_4 = 0.000 ; sw_newp_lev_1_5 = 0.000 ; 
sw_newp_lev_2_1 = 0.01 ; sw_newp_lev_2_2 = 0.98 ; sw_newp_lev_2_3 = 0.010  ; sw_newp_lev_2_4 = 0.000 ; sw_newp_lev_2_5 = 0.000 ; 
sw_newp_lev_3_1 = 0.00 ; sw_newp_lev_3_2 = 0.01 ; sw_newp_lev_3_3 = 0.98  ; sw_newp_lev_3_4 = 0.010 ; sw_newp_lev_3_5 = 0.000 ; 
sw_newp_lev_4_1 = 0.000 ; sw_newp_lev_4_2 = 0.000 ; sw_newp_lev_4_3 = 0.010 ; sw_newp_lev_4_4 = 0.98 ; sw_newp_lev_4_5 = 0.010; 
sw_newp_lev_5_1 = 0.000 ; sw_newp_lev_5_2 = 0.000 ; sw_newp_lev_5_3 = 0.000  ; sw_newp_lev_5_4 = 0.01 ; sw_newp_lev_5_5 = 0.99 ; 
end;
if sw_trans_matrix=5  then do; 
sw_newp_lev_1_1 = 0.96 ; sw_newp_lev_1_2 = 0.01 ; sw_newp_lev_1_3 = 0.01 ; sw_newp_lev_1_4 = 0.01 ; sw_newp_lev_1_5 = 0.01 ; 
sw_newp_lev_2_1 = 0.01 ; sw_newp_lev_2_2 = 0.96 ; sw_newp_lev_2_3 = 0.01 ; sw_newp_lev_2_4 = 0.01 ; sw_newp_lev_2_5 = 0.01 ; 
sw_newp_lev_3_1 = 0.01 ; sw_newp_lev_3_2 = 0.01 ; sw_newp_lev_3_3 = 0.96 ; sw_newp_lev_3_4 = 0.01 ; sw_newp_lev_3_5 = 0.01 ; 
sw_newp_lev_4_1 = 0.01 ; sw_newp_lev_4_2 = 0.01 ; sw_newp_lev_4_3 = 0.01 ; sw_newp_lev_4_4 = 0.96 ; sw_newp_lev_4_5 = 0.01; 
sw_newp_lev_5_1 = 0.01 ; sw_newp_lev_5_2 = 0.01 ; sw_newp_lev_5_3 = 0.01 ; sw_newp_lev_5_4 = 0.01 ; sw_newp_lev_5_5 = 0.96 ; 
end; 
if sw_trans_matrix=6 then do;
sw_newp_lev_1_1 = 0.60 ; sw_newp_lev_1_2 = 0.10 ; sw_newp_lev_1_3 = 0.10   ; sw_newp_lev_1_4 = 0.100 ; sw_newp_lev_1_5 = 0.100 ; 
sw_newp_lev_2_1 = 0.10 ; sw_newp_lev_2_2 = 0.60 ; sw_newp_lev_2_3 = 0.100  ; sw_newp_lev_2_4 = 0.100 ; sw_newp_lev_2_5 = 0.100 ; 
sw_newp_lev_3_1 = 0.10 ; sw_newp_lev_3_2 = 0.10 ; sw_newp_lev_3_3 = 0.60  ; sw_newp_lev_3_4 = 0.100 ; sw_newp_lev_3_5 = 0.100 ; 
sw_newp_lev_4_1 = 0.100 ; sw_newp_lev_4_2 = 0.100 ; sw_newp_lev_4_3 = 0.100 ; sw_newp_lev_4_4 = 0.60 ; sw_newp_lev_4_5 = 0.100; 
sw_newp_lev_5_1 = 0.100 ; sw_newp_lev_5_2 = 0.100 ; sw_newp_lev_5_3 = 0.100  ; sw_newp_lev_5_4 = 0.10 ; sw_newp_lev_5_5 = 0.60 ;
end;
if sw_trans_matrix=7 then do;
sw_newp_lev_1_1 = 0.40 ; sw_newp_lev_1_2 = 0.15 ; sw_newp_lev_1_3 = 0.15   ; sw_newp_lev_1_4 = 0.150 ; sw_newp_lev_1_5 = 0.150 ; 
sw_newp_lev_2_1 = 0.15 ; sw_newp_lev_2_2 = 0.40 ; sw_newp_lev_2_3 = 0.150  ; sw_newp_lev_2_4 = 0.150 ; sw_newp_lev_2_5 = 0.150 ; 
sw_newp_lev_3_1 = 0.15 ; sw_newp_lev_3_2 = 0.15 ; sw_newp_lev_3_3 = 0.40  ; sw_newp_lev_3_4 = 0.150 ; sw_newp_lev_3_5 = 0.150 ; 
sw_newp_lev_4_1 = 0.150 ; sw_newp_lev_4_2 = 0.150 ; sw_newp_lev_4_3 = 0.150 ; sw_newp_lev_4_4 = 0.40 ; sw_newp_lev_4_5 = 0.150; 
sw_newp_lev_5_1 = 0.150 ; sw_newp_lev_5_2 = 0.150 ; sw_newp_lev_5_3 = 0.150  ; sw_newp_lev_5_4 = 0.15 ; sw_newp_lev_5_5 = 0.40 ;
end;
if sw_trans_matrix=8 then do;
sw_newp_lev_1_1 = 0.20 ; sw_newp_lev_1_2 = 0.30 ; sw_newp_lev_1_3 = 0.25   ; sw_newp_lev_1_4 = 0.150 ; sw_newp_lev_1_5 = 0.100 ; 
sw_newp_lev_2_1 = 0.20 ; sw_newp_lev_2_2 = 0.30 ; sw_newp_lev_2_3 = 0.250  ; sw_newp_lev_2_4 = 0.150 ; sw_newp_lev_2_5 = 0.100 ; 
sw_newp_lev_3_1 = 0.20 ; sw_newp_lev_3_2 = 0.30 ; sw_newp_lev_3_3 = 0.25  ; sw_newp_lev_3_4 = 0.150 ; sw_newp_lev_3_5 = 0.100 ; 
sw_newp_lev_4_1 = 0.20  ; sw_newp_lev_4_2 = 0.30 ; sw_newp_lev_4_3 = 0.250 ; sw_newp_lev_4_4 = 0.15 ; sw_newp_lev_4_5 = 0.100; 
sw_newp_lev_5_1 = 0.20  ; sw_newp_lev_5_2 = 0.30 ; sw_newp_lev_5_3 = 0.250  ; sw_newp_lev_5_4 = 0.15 ; sw_newp_lev_5_5 = 0.10 ;
end;


* test type;

*1= PCR (RNA VL) tests - assume window period of 10 days; * (sens_primary_ts1m = 0.67 as 10 days is 0.33 of 1 month);
*3= 3rd gen (Ab) tests / community-based POC tests / rapid tests - assume window period of 3 months; 
*4= 4th gen (Ag/Ab) tests - assume window period of 1 month;
if hivtest_type=1 then do; sens_primary=0.86; sens_primary_ts1m = 0.67  ; sens_vct=0.98; spec_vct=1;     end; 
else if hivtest_type=3 then do; sens_primary=0; sens_primary_ts1m = 0 ;  sens_vct=0.98; spec_vct=0.992; end;
else if hivtest_type=4 then do; sens_primary=0.65; sens_primary_ts1m = 0 ; sens_vct=0.98; spec_vct=1; test_4thgen=1; * test_4thgen=1 moved here mar19;  end;


* COSTS;

* todo:  ALL COSTS BELOW TO BE REVIEWED ;

* drug costs are perhaps 10% higher due to supply chain but for monitoring comparison this will not differ by option;
*cost of the following drugs updated in July 2014 based on MSF report, without including cost of supply chain;

* all * dependent_on_time_step_length ;
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
tb_cost_a=(.050);
cot_cost_a=(.005/4);
vis_cost_a=(.020); 
redn_in_vis_cost_vlm_supp = 0.010 ;
cost_child_hiv_a = 0.030; 
cost_child_hiv_mo_art_a = 0.030; 
prep_drug_cost = (0.050 * 1.2) / 4 ; * cost per 3 months; * 1.2 is supply chain cost;
prep_drug_cost_tld = (0.065 * 1.2) / 4 ; * cost per 3 months; * 1.2 is supply chain cost;
cost_prep_clinic = 0.010; *Clinic/Programme costs relating to PrEP use in HIV-negative individuals; * changed from 0.10 to 0.30 after input from gesine;
cost_prep_clinic_couns = 0.010; *Further clinic costs relating to adherence counselling;

* not * dependent_on_time_step_length ;
adc_cost_a=(.200);
who3_cost_a=(.020);
cd4_cost_a=(.010);
vl_cost_a=(.022);
vl_cost_plasma=0.022;
vl_cost_lab=0.022; 
vl_cost_poc=0.022;
res_cost_a=(0.100);
cost_test_a=0.025; *HCW-testing symptomatic, it applies only to positive people with symptoms ;
cost_test_b=0.025; *HCW-testing general pop, HIV positive;
cost_test_c=0.0037; *HCW-testing general pop, hiv negative - changed 30dec2016 - email from anna osborne chai 8nov2016 - this is for facility based testing, which most testing is;
cost_test_d=0.02521; *HCW-testing positive (community based);
cost_test_e=0.0245; *HCW-testing negative (community based);
cost_t_adh_int = 0.010;  
art_init_cost = 0.010; *Cost of ART initiation - Mar2017;
cost_switch_line_a = 0.020 ;
cost_drug_level_test = 0.015; * assume tdf drug level test can be $15 ;
circ_cost_a = 0.106;  *LBM Jan 2019 VMMC trial 51.34+54.29 =106 ;
condom_dn_cost = 0.001  ; * average cost per adult aged 15-64 in population ;
sw_program_cost = 0.010 ; * placeholder;

* based on salomom et al lancet 2012;
util_tox = rand('beta',10,2); util_tox = 0.95;
if greater_disability_tox = 1 then util_tox = 0.75 ;
util_who3 = rand('beta',8,2);  util_who3 = 0.78;
util_tb = rand('beta',7,7);  util_tb = 0.60;
util_adc = rand('beta',2,6); util_adc = 0.46;
* util_rec_ntd = 0.8; * removed aug18 - since dont have this for mtct;



/*
* ts1m: running with monthly time steps - transformation of rate parameters  ;

rate_ch_art_init_str_2011 = 1 - (1 - rate_ch_art_init_str_2011)**(1/3) ;
rate_want_no_more_children = 1 - (1 - rate_want_no_more_children )**(1/3) ;
rate_sti = 1 - (1 - rate_sti )**(1/3) ;
rate_persist_sti = 1 - (1 - rate_persist_sti )**(1/3) ;
sw_newp_lev_1_1 = 1 - (1 - sw_newp_lev_1_1 )**(1/3) ;  
sw_newp_lev_1_2 = 1 - (1 - sw_newp_lev_1_2 )**(1/3) ;
sw_newp_lev_1_3 = 1 - (1 - sw_newp_lev_1_3 )**(1/3) ;
sw_newp_lev_1_4 = 1 - (1 - sw_newp_lev_1_4 )**(1/3) ;
sw_newp_lev_1_5 = 1 - (1 - sw_newp_lev_1_5 )**(1/3) ;
sw_newp_lev_2_1 = 1 - (1 - sw_newp_lev_2_1 )**(1/3) ; 
sw_newp_lev_2_2 = 1 - (1 - sw_newp_lev_2_2 )**(1/3) ; 
sw_newp_lev_2_3 = 1 - (1 - sw_newp_lev_2_3 )**(1/3) ; 
sw_newp_lev_2_4 = 1 - (1 - sw_newp_lev_2_4  )**(1/3) ; 
sw_newp_lev_2_5 = 1 - (1 - sw_newp_lev_2_5 )**(1/3) ;
sw_newp_lev_3_1 = 1 - (1 - sw_newp_lev_3_1 )**(1/3) ; 
sw_newp_lev_3_2 = 1 - (1 - sw_newp_lev_3_2 )**(1/3) ;
sw_newp_lev_3_3 = 1 - (1 - sw_newp_lev_3_2 )**(1/3) ;
sw_newp_lev_3_4 = 1 - (1 - sw_newp_lev_3_4 )**(1/3) ; 
sw_newp_lev_3_5 = 1 - (1 - sw_newp_lev_3_5 )**(1/3) ; 
sw_newp_lev_4_1 = 1 - (1 - sw_newp_lev_4_1 )**(1/3) ;  
sw_newp_lev_4_2 = 1 - (1 - sw_newp_lev_4_2 )**(1/3) ; 
sw_newp_lev_4_3 = 1 - (1 - sw_newp_lev_4_3 )**(1/3) ; 
sw_newp_lev_4_4 = 1 - (1 - sw_newp_lev_4_4 )**(1/3) ; 
sw_newp_lev_4_5 = 1 - (1 - sw_newp_lev_4_5 )**(1/3) ; 
sw_newp_lev_5_1 = 1 - (1 - sw_newp_lev_5_1 )**(1/3) ; 
sw_newp_lev_5_2 = 1 - (1 - sw_newp_lev_5_2 )**(1/3) ; 
sw_newp_lev_5_3 = 1 - (1 - sw_newp_lev_5_3 )**(1/3) ; 
sw_newp_lev_5_4 = 1 - (1 - sw_newp_lev_5_4 )**(1/3) ; 
sw_newp_lev_5_5 = 1 - (1 - sw_newp_lev_5_5 )**(1/3) ;
rate_newp0_rred_rc = 1 - (1 - rate_newp0_rred_rc )**(1/3) ;
rate_non_hiv_symptoms = 1 - (1 - rate_non_hiv_symptoms )**(1/3) ;
r_swi_efa_cns = 1 - (1 - r_swi_efa_cns )**(1/3) ;
r_swi_efa_ras = 1 - (1 - r_swi_efa_ras )**(1/3) ;
r_swi_nev_hep = 1 - (1 - r_swi_nev_hep )**(1/3) ;
r_swi_nev_ras = 1 - (1 - r_swi_nev_ras )**(1/3) ;
r_swi_zdv_nau = 1 - (1 - r_swi_zdv_nau )**(1/3) ;
r_swi_zdv_head = 1 - (1 - r_swi_zdv_head )**(1/3) ;
r_swi_zdv_lip= 1 - (1 - r_swi_zdv_lip  )**(1/3) ;
r_swi_zdv_ane = 1 - (1 - r_swi_zdv_ane )**(1/3) ;
r_swi_zdv_lac = 1 - (1 - r_swi_zdv_lac )**(1/3) ;
r_swi_ten_neph = 1 - (1 - r_swi_ten_neph  )**(1/3) ;
r_swi_lpr_nau = 1 - (1 - r_swi_lpr_nau )**(1/3) ;
r_swi_lpr_dia = 1 - (1 - r_swi_lpr_dia )**(1/3) ;
r_swi_taz_nau = 1 - (1 - r_swi_taz_nau )**(1/3) ;
r_swi_taz_dia = 1 - (1 - r_swi_taz_dia )**(1/3) ;
r_swi_dol_cns = 1 - (1 - r_swi_dol_cns )**(1/3) ;
rate_loss_acq_pim_offart = 1 - (1 - rate_loss_acq_pim_offart )**(1/3) ; 
rate_loss_acq_iim_offart = 1 - (1 - rate_loss_acq_iim_offart  )**(1/3) ; 
r_nau_start_zdv_lpr = 1 - (1 - r_nau_start_zdv_lpr )**(1/3) ;
p_nau_stops_zdv_lpr = 1 - (1 - p_nau_stops_zdv_lpr )**(1/3) ;
r_dia_start_lpr = 1 - (1 - r_dia_start_lpr )**(1/3) ;
p_dia_stops_lpr = 1 - (1 - p_dia_stops_lpr )**(1/3) ;
r_dia_start_taz_dar = 1 - (1 - r_dia_start_taz_dar )**(1/3) ;
p_dia_stops_taz_dar = 1 - (1 - p_dia_stops_taz_dar  )**(1/3) ;
r_ras_start_efa = 1 - (1 - r_ras_start_efa  )**(1/3) ;
r_res_start_nev = 1 - (1 - r_res_start_nev )**(1/3) ;
r_weightg_start_dol = 1 - (1 - r_weightg_start_dol )**(1/3) ;
r_cns_start_efa = 1 - (1 - r_cns_start_efa )**(1/3) ;
p_cns_stops_efa = 1 - (1 - p_cns_stops_efa  )**(1/3) ;
r_cns_start_dol = 1 - (1 - r_cns_start_dol )**(1/3) ;
p_cns_stops_dol = 1 - (1 - p_cns_stops_dol  )**(1/3) ;
r_lip_start_zdv = 1 - (1 - r_lip_start_zdv  )**(1/3) ;
r_hep_start_nev = 1 - (1 - r_hep_start_nev  )**(1/3) ;
r_otx_start = 1 - (1 - r_otx_start )**(1/3) ;
r_ane_start_zdv = 1 - (1 - r_ane_start_zdv )**(1/3) ;
p_ane_stops_zdv = 1 - (1 - p_ane_stops_zdv   )**(1/3) ;
r_head_start_zdv = 1 - (1 - r_head_start_zdv )**(1/3) ;
p_head_stops_zdv = 1 - (1 - p_head_stops_zdv  )**(1/3) ;
r_lac_start_zdv = 1 - (1 - r_lac_start_zdv  )**(1/3) ;
r_neph_start_ten = 1 - (1 - r_neph_start_ten )**(1/3) ;
p_neph_stops_ten = 1 - (1 - p_neph_stops_ten )**(1/3) ;
p_neph_stops_after_ten = 1 - (1 - p_neph_stops_after_ten  )**(1/3) ; 
eprate   = 1 - (1 - eprate  )**(1/3) ; 
rate_exp_set_lower_p_vl1000  = 1 - (1 - rate_exp_set_lower_p_vl1000   )**(1/3) ; 
prob_pregnancy_base   = 1 - (1 - prob_pregnancy_base  )**(1/3) ;
rate_loss_persistence   = 1 - (1 - rate_loss_persistence  )**(1/3) ;
rate_loss_nnres_pmtct_maj = 1 - (1 - rate_loss_nnres_pmtct_maj  )**(1/3) ;
initial_rate_1sttest  = 1 - (1 - initial_rate_1sttest )**(1/3) ;
test_rate_who4   = 1 - (1 - test_rate_who4  )**(1/3) ;
test_rate_tb  = 1 - (1 - test_rate_tb  )**(1/3) ;
test_rate_who3   = 1 - (1 - test_rate_who3  )**(1/3) ;
rate_lost   = 1 - (1 - rate_lost  )**(1/3) ;
rate_return   = 1 - (1 - rate_return )**(1/3) ;
rate_restart   = 1 - (1 - rate_restart   )**(1/3) ;
pr_art_init  = 1 - (1 - pr_art_init  )**(1/3) ;
pr_switch_line   = 1 - (1 - pr_switch_line   )**(1/3) ;
prob_supply_interrupted    = 1 - (1 - prob_supply_interrupted  )**(1/3) ;
prob_supply_resumed = 1 - (1 - prob_supply_resumed  )**(1/3) ;
poorer_cd4rise_fail_nn     = 1 - (1 - poorer_cd4rise_fail_nn  )**(1/3) ;
rate_int_choice   = 1 - (1 - rate_int_choice  )**(1/3) ;
rate_loss_acq_nnm_offart  = 1 - (1 - rate_loss_acq_nnm_offart   )**(1/3) ;
rate_test_onprep     = 1 - (1 - rate_test_onprep   )**(1/3) ;
prob_prep_restart   = 1 - (1 - prob_prep_restart  )**(1/3) ;
prob_prep_restart_choice   = 1 - (1 - prob_prep_restart_choice  )**(1/3) ;
pop_wide_tld_prob_egfr = 1 - (1 - pop_wide_tld_prob_egfr  )**(1/3) ;
base_rate_sw   = 1 - (1 - base_rate_sw   )**(1/3) ;
base_rate_stop_sexwork   = 1 - (1 - base_rate_stop_sexwork   )**(1/3) ;
rate_testanc_inc  = 1 - (1 - rate_testanc_inc  )**(1/3) ;
incr_test_rate_sympt   = 1 - (1 - incr_test_rate_sympt   )**(1/3) ;
prob_lost_art   = 1 - (1 - prob_lost_art   )**(1/3) ;
rate_res_ten     = 1 - (1 - rate_res_ten  )**(1/3) ;
rate_test_startprep   = 1 - (1 - rate_test_startprep  )**(1/3) ;
rate_test_restartprep   = 1 - (1 - rate_test_restartprep  )**(1/3) ;
rate_choose_stop_prep  = 1 - (1 - rate_choose_stop_prep  )**(1/3) ;
poorer_cd4rise_fail_nn = poorer_cd4rise_fail_nn / 3;
poorer_cd4rise_fail_ii = poorer_cd4rise_fail_ii / 3;
cost_zdv_a  = cost_zdv_a  / 3;
cost_3tc_a  = cost_3tc_a   / 3;
cost_ten_a  = cost_ten_a    / 3;
cost_taf   =  cost_taf  / 3;
cost_nev_a  =  cost_nev_a / 3;
cost_efa_a  =  cost_efa_a   / 3;
cost_lpr_a   = cost_lpr_a   / 3;
cost_taz_a  =  cost_taz_a  / 3;
cost_dol_a  =  cost_dol_a / 3;
cost_dar_a  =  cost_dar_a  / 3;
tb_cost_a =  tb_cost_a / 3;
cot_cost_a =  cot_cost_a  / 3;
vis_cost_a   = vis_cost_a    / 3;
prep_drug_cost  =  prep_drug_cost  / 3;
cost_prep_clinic  = cost_prep_clinic   / 3;
cost_prep_clinic_couns =  cost_prep_clinic_couns  / 3;

*/




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 2

Create the 100000 people who will be alive and aged 15+ at some point between 1989 and 2070 (50 year time horizon from 2020)

Define fixed or initial values for each person individually

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;



data r1;set z;
do i=1 to &population;
	n=1;
	serial_no + 1;
	output; 
end; 
drop i;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* VALUES OF FIXED, PERSON-SPECIFIC PARAMETERS AND VALUES AT CALDATE 1989;
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
inc8=0.074;
inc9 =0.060;
inc10=0.050;
inc11=0.038;
inc12=0.026;
inc13=0.020;
end;



cum2=inc1+inc2; cum3=cum2+inc3;cum4=cum3+inc4;cum5=cum4+inc5;cum6=cum5+inc6;cum7=cum6+inc7;cum8=cum7+inc8;
cum9=cum8+inc9;cum10=cum9+inc10; cum11=cum10+inc11; cum12=cum11+inc12; 

e=uniform(0);
if 0.0 <= e < inc1    then age=-67+uniform(0)*12;   * AP 20-7-19;
if inc1 <= e < cum2   then age=-55+uniform(0)*10;  
if cum2 <= e < cum3   then age=-45+uniform(0)*10;  
if cum3 <= e < cum4   then age=-35+uniform(0)*10;  
if cum4 <= e < cum5   then age=-25+uniform(0)*10;  
if cum5 <= e < cum6   then age=-15+uniform(0)*10;  
if cum6 <= e < cum7   then age=-5+uniform(0)*10;  
if cum7 <= e < cum8   then age=  5+uniform(0)*10;  
if cum8 <= e < cum9   then age= 15+uniform(0)*10;  
if cum9 <= e < cum10  then age= 25+uniform(0)*10;  
if cum10 <= e < cum11  then age= 35+uniform(0)*10;  
if cum11 <= e < cum12  then age= 45+uniform(0)*10;  
if cum12 <= e          then age= 55+uniform(0)*10;  


age =round(age ,.25);

year_start=-67;

if age  >= year_start;

hiv =0;

if gender=2 and age >=15 then do;
	if 15 <= age  < 25 then do;u=uniform(0);
		if       .   lt u lt 0.72 then cum_children=0;else if 0.72 le u lt 0.93 then cum_children=1;
		else if 0.93 le u lt 0.99 then cum_children=2;else if 0.99 le u le 1     then cum_children=3;
	end;
	else if 25 <= age  < 35 then do;u=uniform(0);
		if       .   lt u lt 0.25 then cum_children=0;else if 0.25 le u lt 0.55 then cum_children=1;
		else if 0.55 le u lt 0.81 then cum_children=2;else if 0.81 le u lt 0.93 then cum_children=3;
		else if 0.93 le u lt 0.98 then cum_children=4;else if 0.98 le u lt 0.99 then cum_children=5;
		else if 0.99 le u lt 1    then cum_children=6;
	end;
	else if 35 <= age  < 45 then do;u=uniform(0);
		if       .   lt u lt 0.11 then cum_children=0;else if 0.11 le u lt 0.24 then cum_children=1;
		else if 0.24 le u lt 0.50 then cum_children=2;else if 0.50 le u lt 0.71 then cum_children=3;
		else if 0.71 le u lt 0.85 then cum_children=4;else if 0.85 le u lt 0.92 then cum_children=5;
		else if 0.92 le u lt 0.96 then cum_children=6;else if 0.96 le u lt 0.98 then cum_children=7;
		else if 0.98 le u lt 0.99 then cum_children=8;else if 0.99 le u lt 1    then cum_children=10;

	end;
	else if 45 <= age       then do;u=uniform(0);
		if       .   lt u lt 0.11 then cum_children=0;else if 0.11 le u lt 0.21 then cum_children=1;
		else if 0.21 le u lt 0.42 then cum_children=2;else if 0.42 le u lt 0.62 then cum_children=3;
		else if 0.62 le u lt 0.76 then cum_children=4;else if 0.76 le u lt 0.86 then cum_children=5;
		else if 0.86 le u lt 0.92 then cum_children=6;else if 0.92 le u lt 0.96 then cum_children=7;
		else if 0.96 le u lt 0.98 then cum_children=8;else if 0.98 le u le 1    then cum_children=10;
	end;
end;


* NUMBER OF PARTNERS / NUMBER OF NEW PARTNERS AT TIME 0;


*-----------------------------------------------------------------------------------------------------------------------------------;



r=uniform(0);
if gender=2 then life_sex_risk=2; 
rred_p=1;
if r < p_rred_p then do; life_sex_risk = 1;  rred_p=0.00001; end;
if gender=2 and 1-p_hsb_p < r < 1 then life_sex_risk = 3; 

ever_newp=0;

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

if 15 <= age < 20 then rred_a=rred_a_15m; 
if 20 <= age < 25 then rred_a=rred_a_20m;
if 25 <= age < 30 then rred_a=rred_a_25m;
if 30 <= age < 35 then rred_a=rred_a_30m;
if 35 <= age < 40 then rred_a=rred_a_35m;
if 40 <= age < 45 then rred_a=rred_a_40m;
if 45 <= age < 50 then rred_a=rred_a_45m;
if 50 <= age < 55 then rred_a=rred_a_50m;
if 55 <= age < 60 then rred_a=rred_a_55m;
if 60 <= age < 65 then rred_a=rred_a_60m;

rred= newp_factor * rred_a*rred_p;

* newp=0; s1=0.85; * newp1=1; s2=0.10   ;* newp >= 2; s3=0.05  ; * newp1 10x; s4=0.0030 ;


s2=s2*rred; s3=s3*rred; s4=s4*rred; 
cu1=s1;cu2=cu1+s2;cu3=cu2+s3;cu4=cu3+s4; a=uniform(0);
if            a < cu1/cu4 then do; newp=0; end; 
if cu1/cu4 <= a < cu2/cu4  then do; e=uniform(0); if e < 0.70 then newp=1; if 0.70 <= e < 0.90 then newp=2; 
											if e ge 0.90 then newp=3; end;
if cu2/cu4 <= a < cu3/cu4 then do; e=uniform(0); if e < 0.22 then newp=4; if 0.22 <= e < 0.42 then newp=5; if 0.42 <= e < 0.60 then newp=6; 
					if 0.60 <= e < 0.76 then newp=7; if 0.76 <= e < 0.90 then newp=8; if 0.90 <= e then newp=9; end;
if cu3/cu4 <= a < cu4/cu4 then do; if e < 0.22 then newp=10; if 0.22 <= e < 0.42 then newp=15; if 0.42 <= e < 0.60 then newp=20; 
					if 0.60 <= e < 0.76 then newp=25; if 0.76 <= e < 0.90 then newp=30; if 0.90 <= e then newp=35; end;

end;


* RISK BEHAVIOUR AT TIME 0 - FEMALES;

if gender=2 then do;

if 15 <= age < 20 then rred_a=rred_a_15w; 
if 20 <= age < 25 then rred_a=rred_a_20w;
if 25 <= age < 30 then rred_a=rred_a_25w;
if 30 <= age < 35 then rred_a=rred_a_30w;
if 35 <= age < 40 then rred_a=rred_a_35w;
if 40 <= age < 45 then rred_a=rred_a_40w;
if 45 <= age < 50 then rred_a=rred_a_45w;
if 50 <= age < 55 then rred_a=rred_a_50w;
if 55 <= age < 60 then rred_a=rred_a_55w;
if 60 <= age < 65 then rred_a=rred_a_60w;


rred= newp_factor * rred_a*rred_p;

* newp=0; s1=0.97;* newp = 1-3; s2=0.03;
s2=s2*rred;
cu1=s1;cu2=cu1+s2; a=uniform(0);
if            a < cu1/cu2 then newp=0; 
if cu1/cu2 <= a < cu2/cu2 then do; 
	e=uniform(0); if e < 0.85 then newp = 1; if 0.85 <= e < 0.95 then newp = 2; if e ge 0.95 then newp = 3; 
	if 15 <= age < 25 then do;
	if e < 0.30 then newp=1; 		if 0.30 <= e < 0.50 then newp=2; 	if 0.50 <= e < 0.65 then newp=3; 
	if 0.65 <= e < 0.77 then newp=4; 	if 0.77 <= e < 0.86 then newp=5; 	if 0.86 <= e < 0.92 then newp=6; 
	if 0.92 <= e < 0.96 then newp=7; if 0.96 <= e < 0.98 then newp=8; 	if 0.98 <= e then newp=9; 
	end;
end;

end;



sw =0; 
e=uniform(0);

if gender =2 then do;

if life_sex_risk = 3 then e = e / 3;													  
														
if 15 <= age < 18 and life_sex_risk ge 2 and e < 0.040 then sw=1;
if 18 <= age < 20 and life_sex_risk ge 2 and e < 0.040 then sw=1;
if 20 <= age < 25 and life_sex_risk ge 2 and e < 0.020 then sw=1;
if 25 <= age < 40 and life_sex_risk ge 2 and e < 0.010 then sw=1;
if 40 <= age < 50 and life_sex_risk ge 2 and e < 0.002 then sw=1;

end;

if sw=1 then do;

age_deb_sw=.;
u=uniform(0);
date_start_sw = 1984+(uniform(0)*5);date_start_sw=round(date_start_sw, 0.25);
age_deb_sw= age - (1989-date_start_sw);age_deb_sw_nm= age - (1989-date_start_sw);

end;

***LBM 27Apr2020 - crude estimate of episodes of sw in 1989 added here. Refine by basing on duration of sw;
if sw = 1 then do;
a=uniform(0);if a<0.95 then episodes_sw=0;if 0.95 <= a <0.98 then episodes_sw=1;if a>=0.98 then episodes_sw=2;
episodes_sw=episodes_sw+1;

e=uniform(0); 
if e < 0.1 then newp=0;
if 0.1 <= e < 0.5 then do; q=uniform(0); 
	if q < 1/6 then newp=1; 
	if 1/6 <= q < 2/6 then newp=2;  
	if 2/6 <= q < 3/6 then newp=3;    
	if 3/6 <= q < 4/6 then newp=4;    
	if 4/6 <= q < 5/6 then newp=5;    
	if 5/6 <= q       then newp=6;    
end;
if 0.5 <= e < 0.95 then do; q=uniform(0); 
	newp = 6 + (q*14); newp = round(newp,1);  
end;
if 0.95 <= e < 0.99  then do; q=uniform(0); 
	newp = 21 + (q*29); newp = round(newp,1);  
end;
if 0.99  <= e       then do; q=uniform(0); 
	newp = 51 + (q*100 ); newp = round(newp,1);  
end;
if age > 30 then newp = min(30,newp);
end;


* ts1m;
* newp = newp/3;  
* newp=round(newp,1);


if sw=1 then ever_sw=1;
if 18 le age lt 49 and sw=1 then ever_sw1849_=1;

if 15 <= age < 65 then do; ep =0; ageg_ep=0; epmono=0; end;
u=uniform(0);
if 15 <= age < 25 and u < 0.40 then do; ep=1; ageg_ep=1; d=uniform(0); if d < 0.33 then lep=1; if .33 <= d < 0.66 then lep=2;  if .66 <= d then lep=3; end;
if 25 <= age < 35 and u < 0.50 then do; ep=1; ageg_ep=2; d=uniform(0); if d < 0.33 then lep=1; if .33 <= d < 0.66 then lep=2;  if .66 <= d then lep=3; end;
if 35 <= age < 45 and u < 0.60 then do; ep=1; ageg_ep=3; d=uniform(0); if d < 0.33 then lep=1; if .33 <= d < 0.66 then lep=2;  if .66 <= d then lep=3; end;
if 45 <= age < 55 and u < 0.60 then do; ep=1; ageg_ep=4; d=uniform(0); if d < 0.33 then lep=1; if .33 <= d < 0.80 then lep=2;  if .80 <= d then lep=3; end;
if 55 <= age < 65 and u < 0.60 then do; ep=1; ageg_ep=5; d=uniform(0); if d < 0.33 then lep=1; if 0.33 <= d then lep=2; end;

if newp ge 1 then ever_newp=1;
if ep=1 then ever_ep=1;

np=ep+newp;


*-----------------------------------------------------------------------------------------------------------------------------------;


newp_ever=newp;
np_ever=np ;


if age < 15 then do; ep=.; epi=.; np=.; newp=.; epmono=.; end;

epi=.;

sti =0;
s=uniform(0); if s < newp/20 then sti=1;

dead=0;
dcause = . ; * can be who4_=1 / liver=2 / CVD=3 / drug death=4 / other=5 ( or 1=HIV - 2 = non-HIV in simpler version);


* set initial values for these defined in main part of program ;

ccsqr = . ;  e_rt184_tm1 = . ;  e_rt65_tm1 = . ;  e_rt151_tm1 = . ; 
e_rt103_tm1 = . ;  e_rt181_tm1 = . ;  e_rt190_tm1 = . ;  e_pr32_tm1 = . ;  e_pr33_tm1 = . ;  e_pr46_tm1 = . ;  e_pr47_tm1 = . ;  e_pr50v_tm1 = . ; 
e_pr50l_tm1 = . ;  e_pr54_tm1 = . ;  e_pr76_tm1 = . ;  e_pr82_tm1 = . ;  e_pr84_tm1 = . ;  e_pr88_tm1 = . ;  e_pr90_tm1 = . ;  c_rt184_tm1 = . ; 
c_rt65_tm1 = . ;  c_rt151_tm1 = . ;  c_rt103_tm1 = . ;  c_rt181_tm1 = . ;  c_rt190_tm1 = . ;  c_pr32_tm1 = . ;  c_pr33_tm1 = . ;  c_pr46_tm1 = . ; 
c_pr47_tm1 = . ;  c_pr50v_tm1 = . ;  c_pr50l_tm1 = . ;  c_pr54_tm1 = . ;  c_pr76_tm1 = . ;  c_pr82_tm1 = . ;  c_pr84_tm1 = . ;  c_pr88_tm1 = . ; 
c_pr90_tm1 = . ;  restart_res_test = . ;  ever_dual_nvp = . ;  ever_sd_nvp = . ;  zero_3tc_activity_m184m = . ;  r_nau_start_taz_dar = . ; 
p_nau_stops_taz_dar = . ;  onart_gt6m_vlg500 = . ;  rm_inf = . ;  util_cns_efa_tox = . ;  util_cns_dol_tox = . ;  cost_art_init = . ; 
newpgr = . ;  c_rt65m_tm2 = . ;  c_rttams_tm2 = . ;  npgt1conc_l4p_2449m = . ;  npgt1conc_l4p_2449w = . ;
d_s_newp = .; r_s_ep_m15w15 = . ; r_s_ep_m25w25 = . ; r_s_ep_m35w35 = . ; r_s_ep_m45w45 = . ; r_s_ep_m55w55 = . ;  r_ep_mw = . ;  prop_mono_m_1524 = . ; 
prop_mono_m_2534 = . ;  prop_mono_m_3544 = . ;  prop_mono_m_4554 = . ;  prop_mono_m_5564 = . ;  prop_mono_w_1524 = . ;  prop_mono_w_2534 = . ; 
prop_mono_w_3544 = . ;  prop_mono_w_4554 = . ;  prop_mono_w_5564 = . ;  incidence1524w_epnewp = . ;  incidence2534w_epnewp = . ; 
incidence3544w_epnewp = . ;  incidence4554w_epnewp = . ;  incidence5564w_epnewp = . ;  incidence1524m_epnewp = . ;  incidence2534m_epnewp = . ; 
incidence3544m_epnewp = . ;  incidence4554m_epnewp = . ;  incidence5564m_epnewp = . ;  r_hiv_epi_both = . ;  d_diag_w = . ;  p_diag_w = . ; 
d_diag_m = . ;  p_diag_m = . ;  d_onart = . ;  p_diag_onart = . ;  d_vls = . ;  p_onart_vls = . ;  no_test_if_np0 = . ;  tld_last_egfr = . ; 
prevalence2534w = . ;  prevalence3544w = . ;  prevalence4554w = . ;  prevalence5564w = . ;  prevalence1524m = . ;  prevalence2534m = . ; 
prevalence3544m = . ;  prevalence4554m = . ;  prevalence5564m = . ;   prevalence1524w = . ; 



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

*** 'eff' variables are defined for specific parameters which may change as a result of the code. Values of the original
	parameters are stored and only 'eff_' variables are used throughout the code;

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

* define effective prob_lossdiag_who3e;
eff_prob_lossdiag_who3e = prob_lossdiag_who3e ;

* define eff_prob_lossdiag_adctb ;
eff_prob_lossdiag_adctb = prob_lossdiag_adctb ;

* define eff_prob_return_adc;
eff_prob_return_adc = prob_return_adc ;

* define effective test_targeting;

eff_test_targeting = test_targeting;

keep_going_1999=.;  keep_going_2004=.; keep_going_2016=.;  keep_going_2020=.;

* eff sex worker program variables;
eff_sw_program=0;
eff_sw_higher_int = sw_higher_int;
eff_prob_sw_lower_adh = prob_sw_lower_adh;
eff_sw_higher_prob_loss_at_diag = sw_higher_prob_loss_at_diag;
sw_program_visit=0;

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

* effect of multi_pill on adherence differs by individual;
red_adh_multi_pill = red_adh_multi_pill_pop * exp(normal(0)*0.3); red_adh_multi_pill=round(red_adh_multi_pill,.01); 


if adh_pattern_prep=1 then adhav_pr = adhav*1.00; 
if adh_pattern_prep=2 then adhav_pr = adhav*0.90;
if adh_pattern_prep=3 then adhav_pr = adhav*0.70;
if adh_pattern_prep=4 then adhav_pr = adhav*0.50;


* willingness to take prep if offered;
r1=uniform(0); prep_willing_pop = 0; if r1 < prepuptake_pop then prep_willing_pop =1;
if gender=2 then do;
r2=uniform(0); prep_willing_sw = prep_willing_pop; 
if prep_willing_pop=0 and r2 < (prepuptake_sw-prepuptake_pop)/(1-prepuptake_pop) then prep_willing_sw =1;
end;

hiv=0;
nip=0;
pcp_p  = 0;
prep  = 0;
tcur=.;
dead_tm1=0;





***LBM Mar 2017 - Prev_circ now relates to males aged > 15 at t=1 (1989) - a % of this population is assumed already circumcised;
mcirc =0;birth_circ=0;
prev_circ=prob_birth_circ;

if  gender=1 and age gt 0.5 then do;
h = uniform(0); 
if h < prev_circ then do;mcirc =1;birth_circ=1;end;
if mcirc =1 then date_mcirc=0;
end;


p=uniform(0); q=uniform(0);
if (gender=1 and p <= p_hard_reach_m) or (gender=2 and q <= p_hard_reach_w) then hard_reach=1;

* if disruption due to covid, but in less than 100%, who does it affect ?;

covid_disrup_extent = 1.0 ;

covid_disrup_affected = 0;
if covid_disrup_extent = 0.2 then do; w=uniform(0); if w < 0.2 then covid_disrup_affected = 1; end;
if covid_disrup_extent = 0.5 then do; w=uniform(0); if w < 0.5 then covid_disrup_affected = 1; end;
if covid_disrup_extent = 1   then do; w=uniform(0); if w <= 1.0 then covid_disrup_affected = 1; end;

option=.;

dataset_id=trim(left(round(uniform(0)*1000000)));
call symput('dataset_id',dataset_id);






* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 3

  Define the updated values of variables for each person for this current 3 month period. This uses previous values of variables for each 
  individual and also the summary variables derived from the previous 3 month period in steps 4-7 below.   
  This part is the core of the model itself.

  This part of the code from now on is a macro which is called by the "update_r1" statements close to the end - the data set being read in 
  at the start of this macro flips between r1 and r2 

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;





* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* START OF DEFINING MACRO update_r1;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* UPDATING VARIABLES THAT EXIST FOR ALL ADULTS, REGARDLESS OF HIV STATUS ;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


%macro update_r1(da1=,da2=,e=,f=,g=,h=,a=,b=,i=,k=,l=,x=,j=,s=);

* options mprint;



* primary - currently in primary infection;
array caldate{8} caldate&g-caldate&h; * calendar date 1980.00 , 1980.25, etc;
* adh is the adherence between t-1 and t, not from t to t+1;



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* START OF OVERALL LOOP;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

t=&e;
do until (t=&f);


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* AUTOMATIC UPDATING FROM T-1 to T;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
 

caldate_never_dot = caldate_never_dot + 0.25; * dependent_on_time_step_length ;
* ts1m ; * change this line to: 
caldate_never_dot = caldate_never_dot + (1/12);


 * note that age variable continues to increase after death so need to be aware of death status - dont try to change this without
careful checking of whether serial_no = obs ; 

* Variables tracked at previous time steps;
tested_tm3=tested_tm2; 
ep_tm3=ep_tm2;
newp_tm3=newp_tm2;
np_tm3=np_tm2;

tested_tm2=tested_tm1; 
ep_tm2=ep_tm1;
newp_tm2=newp_tm1;
np_tm2=np_tm1;
registd_tm2 = registd_tm1;
onart_tm2=onart_tm1;
sw_tm2=sw_tm1; 

tested_tm1=tested; tested=0;
ep_tm1=ep;
newp_tm1=newp; newp = .;
np_tm1=np; np = .;
registd_tm1 = registd; 
onart_tm1=onart;
dead_tm1=dead;
adhmin_tm1=adhmin;
adh_tm1 = adh; adh = .;
primary_tm1 = primary; primary = .; 
sw_tm1=sw;
hiv_tm1 = hiv; 
age_tm1=age;


if t ge 2 and caldate{t-1} < 2071.0  and death=. then caldate{t}=caldate{t-1}+0.25; * dependent_on_time_step_length ;
* ts1m ; * change this line to: 
if t ge 2 and caldate{t-1} < 2071.0  and dead_tm1 ne 1 and dead_tm1 ne .  then caldate{t}=caldate{t-1} + (1/12);
;



* PREP introduction in fsw/agyw 2017; 

prep_effectiveness_non_res_v = .;  * we only want this defined for people currently on prep so set to . at start of loop;

if caldate{t} = 2017.25 then do;
prep_strategy=3; sens=0; date_prep_intro=2017.25; annual_testing_prep=0.25; hivtest_type=3; 
end;

prep_tm3=prep_tm2; prep_tm2=prep_tm1; prep_tm1=prep;    
tcur_tm1=tcur;
* dependent_on_time_step_length ; * can keep this but will need to use caldate to assess past prep ;

* ts1m :;
/*
newp_tm12 = max(0,newp_tm11); newp_tm11 = max(0,newp_tm10); newp_tm10 = max(0,newp_tm9);  newp_tm9 = max(0,newp_tm8); newp_tm8 = max(0,newp_tm7); 
newp_tm7 = max(0,newp_tm6); newp_tm6 = max(0,newp_tm5); newp_tm5 = max(0,newp_tm4); newp_tm4 = max(0,newp_tm3); newp_tm3 = max(0,newp_tm2); 
newp_tm2 = max(0,newp_tm1); if t ge 2 then newp_tm1 = max(0,newp_tm1);  
*/


* prep scale-up over 4 years;
prob_prep_b = pr_prep_b;
if caldate{t} < (date_prep_intro + 4) then prob_prep_b = 0.05 +  (  (pr_prep_b-0.05) * ( 1 -    (date_prep_intro + 4 - caldate{t}) / 4  )   );   

* MONITORING AND ART STRATEGIES;

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
if art_initiation_strategy=4 and 2011.5 <= caldate{t} and q < rate_ch_art_init_str_2011 then art_initiation_strategy=9;  
* dependent_on_time_step_length ; 

if 2014 <= caldate{t} then art_initiation_strategy=10;

* SW programs starts in 2015;
if caldate{t} = 2015 then eff_sw_program=sw_program;

* Attendance at SW program (if it exists);

if eff_sw_program=1 and sw=1 then do;
if sw_program_visit=0 then do; e=uniform(0); if e < rate_engage_sw_program then sw_program_visit=1 ; end; 
if sw_program_visit=1 then do; e=uniform(0); if e < rate_disengage_sw_program then sw_program_visit=0 ; end; 
end;

* effect of sex work program ;
sw_test_6mthly = 0;
if eff_sw_program=1 then do;

	if sw_program_visit = 1 then do;

		if sw_program_effect=1 then do; 
		e=uniform(0); if e < 0.5 then sw_test_6mthly=1; 
		eff_sw_higher_int = sw_higher_int * 0.75 ; 
		eff_prob_sw_lower_adh = prob_sw_lower_adh / 2 ; 
		eff_sw_higher_prob_loss_at_diag = sw_higher_prob_loss_at_diag * 1.25/1.5; 
		prepuptake_sw=0.70;
		s= uniform(0); if s < 0.70 and prep_willing_sw = 0 then prep_willing_sw = 1;
		end;

		if sw_program_effect=2 then do; 
		sw_test_6mthly=1; 
		eff_sw_higher_int = sw_higher_int * 0.5 ; 
		eff_prob_sw_lower_adh = 0 ; 
		eff_sw_higher_prob_loss_at_diag = sw_higher_prob_loss_at_diag * 1.00/1.5; 
		prepuptake_sw=0.95;
		s= uniform(0); if s < 0.95 and prep_willing_sw = 0 then prep_willing_sw = 1;
		end;
	end;
end;

if swprog_disrup_covid = 1 and covid_disrup_affected = 1 then do;
	eff_sw_program = 0 ; 
	sw_test_6mthly = 0; 
	eff_sw_higher_int = sw_higher_int ; 
	eff_prob_sw_lower_adh = prob_sw_lower_adh ; 
	eff_sw_higher_prob_loss_at_diag = sw_higher_prob_loss_at_diag; 
end; 

if 2016.5 <= caldate{t} then art_initiation_strategy=3;


if caldate{t} ge 2016.25  then do;  * need to show vl testing started this early so can assess 2 year influence of v alert before baseline;
		art_monitoring_strategy = 150; 
		vm_format=2; ***measuring vl using whole blood dbs;   
		vl_threshold=1000;
		time_of_first_vm = 0.5;
		min_time_repeat_vm = 0.25;	
end;

if caldate{t} ge 2016.5 and cd4_monitoring=1 then art_monitoring_strategy = 81;  




***Changes in ART coverage (~20% lower in 3% of runs) and PrEP coverage after option start date;
if caldate{t} = 2020.5 then do;

*lower future ART coverage;
if lower_future_art_cov=1 then do;							
	eff_rate_int_choice = eff_rate_int_choice * 1.25;
	eff_prob_loss_at_diag = eff_prob_loss_at_diag * 1.25;
	eff_prob_lossdiag_who3e = eff_prob_lossdiag_who3e * 1.25;
	eff_prob_lossdiag_adctb = eff_prob_lossdiag_adctb * 1.25;
	eff_prob_lost_art = eff_prob_lost_art * 1.25;
	eff_rate_lost = eff_rate_lost * 1.25;

	eff_rate_restart = eff_rate_restart * 0.8;
	eff_rate_return = eff_rate_return   * 0.8;
	eff_pr_art_init =  eff_pr_art_init  * 0.8;  
	eff_prob_return_adc = eff_prob_return_adc  * 0.8;
end;

*higher future prep coverage;
if	higher_future_prep_cov=1 then do;

* incr_adh_pattern_prep_2020;
						incr_adh_pattern_prep_2020 = 0;  
						if _u25 < 0.95 then do; 
							incr_adh_pattern_prep_2020 = 1; 
							adhav_pr = adhav*1.00; 
						end;		

* inc_r_test_startprep_2020;
						inc_r_test_startprep_2020 = 0;  if _u26 <= 0.95 then do; 
							inc_r_test_startprep_2020 = 1; 
							eff_rate_test_startprep = 0.9; 
							eff_rate_test_startprep = round(eff_rate_test_startprep, 0.01);
						end;		

* incr_r_test_restartprep_2020;
						incr_r_test_restartprep_2020 = 0;  
						if _u28 <= 0.95 then do; 
							incr_r_test_restartprep_2020 = 1; 
							eff_rate_test_restartprep = 0.9; 
							eff_rate_test_restartprep = round(eff_rate_test_restartprep, 0.01);
						end;		

* decr_r_choose_stop_prep_2020;
						decr_r_choose_stop_prep_2020 = 0;  
						if _u30 < 0.95 then do; 
							decr_r_choose_stop_prep_2020 = 1; 
							eff_rate_choose_stop_prep = 0.03 ; 
							eff_rate_choose_stop_prep = round(eff_rate_choose_stop_prep, 0.01);
						end;		

* inc_p_prep_restart_choi_2020;
						inc_p_prep_restart_choi_2020 = 0;  
						if _u32 < 0.95 then do; 
							inc_p_prep_restart_choi_2020 = 1; 
							eff_prob_prep_restart_choice = 0.8 ; 
							eff_prob_prep_restart_choice = round(eff_prob_prep_restart_choice, 0.01);
						end;		

* incr_prepuptake_sw_2020;
						incr_prepuptake_sw_2020 = 0;  
						if _u34 < 0.95 then do; incr_prepuptake_sw_2020 = 1; 
							r= uniform(0); if r < 0.95 and prep_willing_sw = 0 then prep_willing_sw = 1;
						end;		

* incr_prepuptake_pop_2020;
						incr_prepuptake_pop_2020 = 0;  
						if _u36 < 0.95 then do; 
							incr_prepuptake_pop_2020 = 1; 
							r= uniform(0); if r < 0.8 and prep_willing_pop = 0 then prep_willing_pop = 1;
						end;	

* prep_strategy;
						prep_strategy = 9;

end;

*Other potential changes after 2020.5 which can be turned on in the Options code;
*(impact of changes are coded below the options code);

*increase in testing;
incr_test_2020 = 0; *  1= 2-fold increase in testing for everyone, 2= 2-fold increase in testing for men only;

*decrease in the proportion of people hard to reach;
decr_hard_reach_2020 = 0;

*decrease in probability of being lost at diagnosis; 
decr_prob_loss_at_diag_2020 = 0;

*decrease in the rate of being lost;
decr_rate_lost_2020 = 0;

*decrease in the rate of being lost whilst on ART;
decr_rate_lost_art_2020 = 0; 

*increase in the rate of return;
incr_rate_return_2020 = 0 ;

*increase in the rate of restarting ART;
incr_rate_restart_2020 = 0;

*increase in the rate of ART initiation;
incr_rate_init_2020 = 0 ;

*increase in adherence;
incr_adh_2020 = 0;

*decrease in the rate of interruption by choice;
decr_rate_int_choice_2020 = 0 ;

*increase in the the probability of a VL measure being done;
incr_prob_vl_meas_done_2020 = 0;  

*ART monitoring drug levels;
art_mon_drug_levels_2020 = 0;

*increase in the probabilty of switching lines;
incr_pr_switch_line_2020 = 0 ;

*increase in test targeting;
incr_test_targeting_2020 = 0;

*increase in the maximum frequency of testing;
incr_max_freq_testing_2020 = 0;

*testing SW every 6 months;
sw_test_6mthly_2020 = 0;

*switching regimens;
reg_option_switch_2020 = 0;

*tenofovir is taf, rather than tdf as it is by default;
ten_is_taf_2020 = 0; *coded within core (not below options code);

*increase in rates of circumcision;
circ_inc_rate_2020 = 0; *variations coded in circumcision section;

*increase in condom use;
condom_incr_2020 = 0; *coded within core (not below options code);

*population wide tld;
pop_wide_tld = 0;

*covid disruption variables;
vmmc_disrup_covid = 0 ; 
condom_disrup_covid = 0; 
prep_disrup_covid = 0; 
testing_disrup_covid = 0; 
art_init_disrup_covid = 0; 
vl_adh_switch_disrup_covid = 0; 
cotrim_disrup_covid = 0; 
inc_death_rate_aids_disrup_covid = 0; 
no_art_disrup_covid = 0; 
art_low_adh_disrup_covid = 0; 


end;

		




*
reg_option
 
       new 		currently on 1st line tle	currently on 2nd line zl-pi		failure criteria	tle failure			tld failure 	zld failure
      initiators   																
------------------------------------------------------------------------------------------------------------------------------------------------

101    	tle		remain on tle				remain on zl-pi.  				two VL > 1000		--> zl-pi			na				na	

107     tl-pi	remain on tle				remain on zl-pi					two VL > 1000		--> zl-pi			na				na

112	   	tle		remain on tle				remain on zl-pi  				s VL > 1000 6m		--> zl-pi			na				na	 

110	   	tle		remain on tle				remain on zl-pi  				two VL > 1000		--> zld				na				--> tl-pi	 

114	   	tld		remain on tle				remain on zl-pi.  				s VL > 1000 6m		--> zld				na				--> tl-pi	

	
113	   tld		remain on tle				remain on zl-pi			    	two VL > 1000   	--> zl-pi			zl-pi			na

120    tld      remain on tle				remain on zl-pi					two VL > 1000		--> zld			    zl-pi			tl_pi

121    tld      remain on tle				remain on zl-pi					single VL > 1000	--> zld			    zl-pi			tl_pi

115	   tld		remain on tle				remain on zl-pi			    	two VL > 1000   	--> zl-pi			zl-pi			na
																			and 80% adh

103    tld		--> tld vl < 1000			remain on zl-pi			     	two VL > 1000		--> zld				--> zl-pi		--> tl-pi 

119    tld		--> tld vl < 1000			remain on zl-pi			     	two VL > 1000		--> zld				--> zl-pi		--> tl-pi 
																			and 80% adh

104    tld		--> tld 					--> tld regardless of vl		two VL > 1000		na					--> zl-pi		na 

118    tld		--> tld 					--> tld regardless of vl		two VL > 1000		na					--> zl-pi		na 
																			and 80% adh
																		
116	   tld		--> zld if linefail = 1		-> zld							two vl > 1000		na					zl-pi			--> tl-pi
				--> tld if linefail = 0								
					

117	   tld		--> zld if linefail = 1		--> zld							two vl > 1000		na					zl-pi			--> tl-pi
				--> tld if linefail = 0										and 80% adh
																		
------------------------------------------------------------------------------------------------------------------------------------------------

art_monitoring_strategy for tld and zld before moving to pi

150			
1500

;

*

vmmc stopped (vmmc_disrup_covid)
condom availability stopped resulting in increase in newp (condom_disrup_covid)
prep stopped (prep_disrup_covid)
sex worker program stopped (swprog_disrup_covid)
all hiv testing stopped (testing_disrup_covid) 
all art use switched to tld (art_tld_disrup_covid)
every other day tld (art_tld_eod_disrup_covid)
all art initiations stopped (art_init_disrup_covid)
viral load  testing, enhanced adherence counselling and switches stopped (vl_adh_switch_disrup_covid)
all co-trimoxazole stopped (cotrim_disrup_covid)
all art stopped (no_art_disrup_covid)
	
;

if caldate{t} ge 2019.5 then reg_option = 120;



* ==========================================================================================================================================;

* SECTION 3 - OPTIONS ;

* code in this section can differ from unified program to some extent, due to specifying exactly what interventions / changes are running; 
* I suggest that we just leave this shell in the core program as we are not running beyond 2020.50 ;

* INTERVENTIONS / CHANGES in 2020;

option = &s;


if caldate_never_dot = 2020.50 then do;
* we need to use caldate_never_dot so that the parameter value is given to everyone in the data set - we use the value for serial_no = 100000
who may be dead and hence have caldate{t} missing;

* can add in potential changes in policy after 2020.5 here -  set specific '2020' variables to '1' and specify proportion of
  runs for which the option should take place;
	/*E.g. u=uniform(0); if u<0.90 then incr_test_2020=1;*/


	if option = 0 then do;  

	end; 

	if option = 1 then do;

	end;
end;

* ==========================================================================================================================================;

***Impact of potential changes in policy after 2020;

* decr_hard_reach_2020; 
if decr_hard_reach_2020 = 1 then do;
	if _u6 < 0.5 then e_decr_hard_reach_2020 = 0.50; if _u6 ge 0.5 then e_decr_hard_reach_2020 = 0.75; 
	if hard_reach=1 then do;
		e = uniform(0); if e < e_decr_hard_reach_2020 then hard_reach = 0; 
	end; 
end;

* decr_prob_loss_at_diag_2020; 
if	decr_prob_loss_at_diag_2020 = 1 then do;
	eff_prob_loss_at_diag = eff_prob_loss_at_diag  * _u8/3; eff_prob_loss_at_diag = round(eff_prob_loss_at_diag,0.001);
end;

* decr_rate_lost_2020; 	
if decr_rate_lost_2020 = 1 then do;
	eff_rate_lost = eff_rate_lost * _u10 / 3; eff_rate_lost=round(eff_rate_lost,0.01); 
end;

* decr_rate_lost_art_2020; 
if decr_rate_lost_art_2020 = 1 then do;
	eff_prob_lost_art = eff_prob_lost_art + ((0.5 + 0.5*_u12) * (1 - eff_prob_lost_art) ) ; eff_prob_lost_art = round(eff_prob_lost_art, 0.01); 
end;

* incr_rate_return_2020; 
if incr_rate_return_2020 = 1 then do;
	eff_rate_return = eff_rate_return * (2 + 3*_u14);  eff_rate_return = round(eff_rate_return,0.01);  
end;

* incr_rate_restart_2020; 
if incr_rate_restart_2020 = 1 then do;
	eff_rate_restart = eff_rate_restart * (2 + 3*_u18);  eff_rate_restart = round(eff_rate_restart,0.01);  
end;

* incr_rate_init_2020; 	
if incr_rate_init_2020 = 1 then do;
	eff_pr_art_init = eff_pr_art_init + ( (0.5 + 0.5*_u20) * (1 - eff_pr_art_init) ); eff_pr_art_init=round(eff_pr_art_init,0.01); 
end;

* incr_adh_2020;  		
if incr_adh_2020 = 1 then do;
	if adhav < 0.8 then do; 
		if _u4 < 0.5 then e_incr_adh_2020 = 0.5; if _u4 ge 0.5 then e_incr_adh_2020 = 0.75; 
		e = uniform(0); if e < e_incr_adh_2020 then adhav = 0.9; 
	end;
end;

* decr_rate_int_choice_2020; 
if	decr_rate_int_choice_2020 = 1 then do;
	eff_rate_int_choice = eff_rate_int_choice * _u22/3; eff_rate_int_choice = round(eff_rate_int_choice,0.001); 
end;

* incr_prob_vl_meas_done_2020; 
if	incr_prob_vl_meas_done_2020 = 1 then do;
	eff_prob_vl_meas_done = 0.85; 
	cd4_monitoring=0; * this needed because cd4_monitoring was = 1 in half of people with no vl; 
end;

* art_mon_drug_levels_2020;
if art_mon_drug_levels_2020 = 1 then do;
	if reg_option = 103 then reg_option = 119;
	if reg_option = 104 then reg_option = 118;
	if reg_option = 113 then reg_option = 115;
	if reg_option = 116 then reg_option = 117; 
end;

* incr_pr_switch_line_2020; 
if incr_pr_switch_line_2020 = 1 then do;
	eff_pr_switch_line = 0.80; 
end;

* incr_test_targeting_2020;	
if incr_test_targeting_2020 = 1 then do;
	if _u42 < 0.45 then eff_test_targeting = 2;
	if 0.45 <= _u42 < 0.9 then eff_test_targeting = 5;
end;						

* incr_max_freq_testing_2020;
if incr_max_freq_testing_2020=1 then do;
	if eff_max_freq_testing = 2 then eff_max_freq_testing = 4; 
	if eff_max_freq_testing = 1 then eff_max_freq_testing = 2;
end;  

* sw_test_6mthly_2020; 
if sw_test_6mthly_2020 = 1 then sw_test_6mthly =1; 

* reg_option_switch_2020;	
if reg_option_switch_2020 = 1 then do;
	if _u49 < 0.30 then reg_option = 104; 
	if 0.30 <= _u49 < 0.6 then  reg_option = 116;
	if 0.60 <= _u49 < 0.9 then  reg_option = 119;
end;


* pop_wide_tld_2020;	
if pop_wide_tld_2020 = 1 then do;
	pop_wide_tld = 1; prep_strategy = 9;prob_prep_pop_wide_tld = 0.10; 
	higher_future_prep_cov = 0;  * this is instead of current type of prep program;
end;


	

if covid_disrup_affected = 1 and (art_tld_disrup_covid = 1 or art_tld_eod_disrup_covid = 1 or art_low_adh_disrup_covid = 1) then reg_option = 104 ;


if reg_option in (102 103 104 105 106 113 115 116 117 118 119 120 121) then flr=2; 
if reg_option in (107) then flr=1;

if initial_pr_switch_line =. then initial_pr_switch_line = eff_pr_switch_line; 
if initial_prob_vl_meas_done = . then initial_prob_vl_meas_done = eff_prob_vl_meas_done;  

if reg_option in (108) then do; eff_pr_switch_line=0.85; eff_prob_vl_meas_done=0.85; end; 
if reg_option in (101 102 103 104 105 106 107 109 110 111 112 113 114 115 116 117 118 119 120 121) then do; 
eff_pr_switch_line=initial_pr_switch_line; eff_prob_vl_meas_done=initial_prob_vl_meas_done; end; 

if vl_adh_switch_disrup_covid = 1 and covid_disrup_affected = 1 then do; eff_prob_vl_meas_done=0; eff_pr_switch_line=0; end; 

if reg_option in (101 102 103 104 107 110 113 116 120 121) then art_monitoring_strategy=150;
if reg_option in (105 106 108 109 111 112 114) then art_monitoring_strategy=153;
if reg_option in (115 117 118 119) then art_monitoring_strategy=1500;

if single_vl_switch_efa_2020 = 1 then do;
art_monitoring_strategy=150;
if (o_efa=1 or (int_clinic_not_aw=1 and mr_efa=1) or o_nev=1 or (int_clinic_not_aw=1 and mr_nev=1)) and linefail=0 then art_monitoring_strategy=153; 
end;


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
if caldate{t} >= 2020.5 and incr_test_2020 = 2 and gender=1 then do; rate_1sttest = rate_1sttest * 2.0; rate_reptest = rate_reptest * 2.0; end;

if testing_disrup_covid =1 and covid_disrup_affected = 1 then do; rate_1sttest = 0 ; rate_reptest = 0; end;


* ts1m;
* rate_1sttest = 1 - (1 - rate_1sttest )**(1/3) ;
* rate_reptest = 1 - (1 - rate_reptest )**(1/3) ;


* RATE OF ATTENDING AN ANC FOR PREGNANT WOMEN; 

if gender=2 then do;
	if      date_start_testanc le caldate{t} lt 2015    then prob_anc      = max(prob_anc, 0.1)+rate_testanc_inc; * dependent_on_time_step_length ;
	if                            caldate{t} =  2014.75 then prob_anc_2015 = prob_anc;
	if                      	  caldate{t} ge 2015    then prob_anc      = prob_anc_2015;
	if prob_anc gt 0.975   then prob_anc=0.975;  


* Receiving PMTCT;
	if caldate{t} gt date_pmtct then prob_pmtct = 0 + (caldate{t}-date_pmtct)*pmtct_inc_rate; * not * dependent_on_time_step_length ;
	if 							  	 prob_pmtct gt 0.975 then prob_pmtct=0.975;
end;





* MALE CIRCUMCISION ;
  
if t ge 2 then do;

* not * dependent_on_time_step_length ;

if 10 le age_tm1 lt 20 then do;
if mc_int < caldate{t} le 2013 then prob_circ = 0 + (caldate{t}-mc_int)*circ_inc_rate;
end;

if 20 le age_tm1 lt 30 then do;
if mc_int < caldate{t} le 2013 then prob_circ = 0 + (caldate{t}-mc_int)*circ_inc_rate *circ_red_20_30;
end;


if 30 le age_tm1 le 50 then do;
if mc_int < caldate{t} le 2013 then prob_circ = (0 + (caldate{t}-mc_int)*circ_inc_rate) * circ_red_30_50;
end;


if 10 le age_tm1 lt 20 then do;
if 2013 < caldate{t} le 2019 then prob_circ =  ((2013-mc_int)*circ_inc_rate) + ((caldate{t}-2013)*circ_inc_rate*rel_incr_circ_post_2013);
end;

if 20 le age_tm1 lt 30 then do;
if 2013 < caldate{t} le 2019 then prob_circ =  (((2013-mc_int)*circ_inc_rate)*circ_red_20_30) + ((caldate{t}-2013)*circ_inc_rate*rel_incr_circ_post_2013)*circ_red_20_30;
end;

if 30 le age_tm1 le 50 then do;
if 2013 < caldate{t} le 2019 then prob_circ = (((2013-mc_int)*circ_inc_rate) * circ_red_30_50) + ((caldate{t}-2013)*circ_inc_rate*rel_incr_circ_post_2013) * circ_red_30_50;
end;

end;

* this is the default if note circ_inc_rate_2020 = .  - no change in circ policy ;
if t ge 2 and 2019 < caldate{t} and circ_inc_rate_2020=0         then do;
if  10 le age_tm1 lt 20 then prob_circ = (((2013-mc_int)*circ_inc_rate)) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013);
if  20 le age_tm1 le 30 then prob_circ = (((2013-mc_int)*circ_inc_rate) * circ_red_20_30) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013) * circ_red_20_30;
if  30 le age_tm1 le 50 then prob_circ = (((2013-mc_int)*circ_inc_rate) * circ_red_30_50) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013) * circ_red_30_50;
end;

* note circ_inc_rate_2020 = 1 means circ stops in 10-15 year olds;
if t ge 2 and 2020.5 <= caldate{t} and circ_inc_rate_2020 = 1 then do;*option=1 - no circ in under 15s and increased rate in 15-19 year olds;
if  age_tm1 lt 15 then prob_circ =0;
if  15 le age_tm1 lt 20 then prob_circ = (((2013-mc_int)*circ_inc_rate)) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013)*circ_inc_15_19;
if  20 le age_tm1 le 30 then prob_circ = (((2013-mc_int)*circ_inc_rate) * circ_red_20_30) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013) * circ_red_20_30;
if  30 le age_tm1 le 50 then prob_circ = (((2013-mc_int)*circ_inc_rate) * circ_red_30_50) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013) * circ_red_30_50;
end;

if t ge 2 and 2020.5 <= caldate{t} and circ_inc_rate_2020 = 2 then do; *option=2 - no further circ;
prob_circ = 0;test_link_circ_prob=0;
end;

if t ge 2 and 2020.5 <= caldate{t} and circ_inc_rate_2020 = 3 then do; *option=3- no circ in under 15s and NO increased rate in 15-19 year olds;
if age_tm1 lt 15 then prob_circ =0;
if 15 le age_tm1 lt 20 then prob_circ = (((2013-mc_int)*circ_inc_rate)) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013);
if 20 le age_tm1 le 30 then prob_circ = (((2013-mc_int)*circ_inc_rate) * circ_red_20_30) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013) * circ_red_20_30;
if 30 le age_tm1 le 50 then prob_circ = (((2013-mc_int)*circ_inc_rate) * circ_red_30_50) + ((2019-2013)*circ_inc_rate*rel_incr_circ_post_2013) * circ_red_30_50;
end;

if vmmc_disrup_covid =1 and covid_disrup_affected = 1 then prob_circ = 0;

if prob_circ ne . then prob_circ = min(prob_circ,1);


***Circumcision at birth;

***DHS 2015 states 2/3 of muslim men circumcised, approx 1% muslim population (CIA);

***LBM Nov2019 - above staement is for Zim only, other SSA countries likely to differ. I think code is okay
   as prob_birth_circ is being sampled;

new_mcirc=0; 
u=uniform(0);
if t ge 2 and age_tm1 = 0.25 and gender=1 then do;
		if vmmc_disrup_covid =1 and covid_disrup_affected = 1 then prob_birth_circ = 0;	
		if u < prob_birth_circ then do;
			mcirc=1;     
			birth_circ=1;
			new_mcirc=1; age_circ=age_tm1;
			date_mcirc=caldate{t};
		end;
end;


* circumcision intervention ;
u_circ=uniform(0);
tested_circ=0;

if t ge 2 and caldate{t} >= mc_int > . and gender=1 and registd_tm1  ne 1  and mcirc ne 1  and hard_reach ne 1
and age < 50 then do; 

	if u_circ lt prob_circ then do;
		if t ge 2 and tested_tm1 ne 1 then do;
			 tested=1;tested_circ=1;dt_last_test=caldate{t};np_lasttest=0;
			 if ever_tested ne 1 then do;date1test=caldate{t}; ever_tested=1; dt_last_test=caldate{t};end;
		end;
		if hiv    ne 1 and vmmc_disrup_covid ne 1 then do;	mcirc=1;new_mcirc=1;age_circ=age_tm1;end;
	end;

	if test_link_circ=1 and t ge 2 and tested_tm1=1 and registd_tm1  ne 1 then do;
		uc=uniform(0); if uc < test_link_circ_prob  and vmmc_disrup_covid ne 1 then do; mcirc=1;new_mcirc=1; end;
	end;
	
	if mcirc=1 then date_mcirc=caldate{t};

end;

vmmc=0;if mcirc=1 and birth_circ ne 1 then vmmc=1;
new_vmmc=0;if new_mcirc=1 and birth_circ ne 1 then new_vmmc=1;

if gender = 1 then do;
hivneg_uncirc_1014 =0; if 10 <= age < 15 and mcirc ne 1 and hiv ne 1 then hivneg_uncirc_1014 = 1;
hivneg_uncirc_1519 =0; if 15 <= age < 20 and mcirc ne 1 and hiv ne 1 then hivneg_uncirc_1519 = 1;
hivneg_uncirc_2024 =0; if 20 <= age < 25 and mcirc ne 1 and hiv ne 1 then hivneg_uncirc_2024 = 1;
hivneg_uncirc_2529 =0; if 25 <= age < 30 and mcirc ne 1 and hiv ne 1 then hivneg_uncirc_2529 = 1;
hivneg_uncirc_3034 =0; if 30 <= age < 35 and mcirc ne 1 and hiv ne 1 then hivneg_uncirc_3034 = 1;
hivneg_uncirc_3539 =0; if 35 <= age < 40 and mcirc ne 1 and hiv ne 1 then hivneg_uncirc_3539 = 1;
hivneg_uncirc_4044 =0; if 40 <= age < 45 and mcirc ne 1 and hiv ne 1 then hivneg_uncirc_4044 = 1;
hivneg_uncirc_4549 =0; if 45 <= age < 50 and mcirc ne 1 and hiv ne 1 then hivneg_uncirc_4549 = 1;
end;


* treatment / follow-up status stays the same from t-1 to t, unless changed later in program;

if t ge 2 and caldate{t} < 2071.0 and death =.  then do;

cost=0;cost_test=0;

adc_tm1=adc; adc=0;

visit_prep=.;
ageg_ep=.;

end;


age =age +0.25;  * dependent_on_time_step_length ;
* ts1m ; * change this line to: 
age =age  + (1/12);
;



if t ge 2 and gender = 2 and 25 <= age_tm1  < 55 and want_no_more_children ne 1 then do;
u=uniform(0); if u < rate_want_no_more_children  then want_no_more_children = 1; * dependent_on_time_step_length ;
end;



* PREGNANCY AND CHILDREN;

if t ge 2 and gender=2 then do;
	pregnant=0;anc=0;on_sd_nvp=0;on_dual_nvp=0;
	if cum_children=. and dead=0 then cum_children=0;
	if act_years_sw=. then act_years_sw=0;
	if episodes_sw=.     then episodes_sw=0;
	if years_ep=.		  then years_ep=0;
	
	* dependent_on_time_step_length ;
	if      15 <= age_tm1 < 25 then do;prob_pregnancy=prob_pregnancy_b*fold_preg1524; end;
	else if 25 <= age_tm1 < 35 then do;prob_pregnancy=prob_pregnancy_b*fold_preg2534; end;
	else if 35 <= age_tm1 < 45 then do;prob_pregnancy=prob_pregnancy_b; end;
	else if 45 <= age_tm1 < 55 then do;prob_pregnancy=prob_pregnancy_b*fold_preg4554; end;
	else if 55 <= age_tm1 < 65 then do;prob_pregnancy=prob_pregnancy_b*fold_preg5564; end;
	if . lt prob_pregnancy lt 0 then prob_pregnancy=0;

	if want_no_more_children = 1 then prob_pregnancy = prob_pregnancy / 5; * jul18;

	if cum_children ge 10 then prob_pregnancy = 0;

end;



* SEXUAL BEHAVIOUR;

rred_rc=1.0;

* not * dependent_on_time_step_length ;
if 1995 < caldate{t} <= 2000 then rred_rc = ych_risk_beh_newp**(caldate{t}-1995);
if 2000 < caldate{t} <= 2010 then rred_rc = ych_risk_beh_newp**(2000-1995); 
if 2010 < caldate{t} <= 2015 then rred_rc = (ych_risk_beh_newp**(2000-1995))*(ych2_risk_beh_newp**(caldate{t}-2010));
if 2015 < caldate{t}         then rred_rc = (ych_risk_beh_newp**(2000-1995))*(ych2_risk_beh_newp**(2015-2010));



if sw=1 and sw_program_visit=1 then do;
if sw_program_effect = 1 then rred_rc = rred_rc * effect_weak_sw_prog_newp ;
if sw_program_effect = 2 then rred_rc = rred_rc * effect_strong_sw_prog_newp ;
end;


if condom_disrup_covid = 1 and covid_disrup_affected = 1 then rred_rc = rred_rc * 1.5;


* not * dependent_on_time_step_length ;
ch_risk_beh_ep=1.0;
if 1995 < caldate{t} <= 2000 then ch_risk_beh_ep = ych_risk_beh_ep**(caldate{t}-1995);
if        caldate{t} >  2000 then ch_risk_beh_ep = ych_risk_beh_ep**(2000-1995);



if age    < 15 then do; hiv=.; goto xx55; end;


* UPDATED RISK BEHAVIOUR ;

if t ge 2 and 15 <= age < 65 and death=. then do; * do loop ends at xx22;

mr_epi_tm1=mr_epi;
epi_tm1=epi; epi=.; 
mr_epdiag_tm1=mr_epdiag; 
epdiag_tm2=epdiag_tm1; epdiag_tm1=epdiag;
epart_tm1=epart;
epvls_tm1=epvls;

* risk of having sti;
sti_tm1=sti; sti=0;
if t ge 2 and  sti_tm1=0 then  do; * dependent_on_time_step_length ;
	d=uniform(0);  if d < (newp_tm1 * rate_sti) then sti=1;
end;
if t ge 2 and sti_tm1=1 then  do;
	d=uniform(0);  if d < (newp_tm1 * rate_persist_sti) then sti=1;
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

if 15 <= age < 20 then rred_a=rred_a_15m; 
if 20 <= age < 25 then rred_a=rred_a_20m;
if 25 <= age < 30 then rred_a=rred_a_25m;
if 30 <= age < 35 then rred_a=rred_a_30m;
if 35 <= age < 40 then rred_a=rred_a_35m;
if 40 <= age < 45 then rred_a=rred_a_40m;
if 45 <= age < 50 then rred_a=rred_a_45m;
if 50 <= age < 55 then rred_a=rred_a_50m;
if 55 <= age < 60 then rred_a=rred_a_55m;
if 60 <= age < 65 then rred_a=rred_a_60m;

end;

if gender=2 then do;

if 15 <= age < 20 then rred_a=rred_a_15w; 
if 20 <= age < 25 then rred_a=rred_a_20w;
if 25 <= age < 30 then rred_a=rred_a_25w;
if 30 <= age < 35 then rred_a=rred_a_30w;
if 35 <= age < 40 then rred_a=rred_a_35w;
if 40 <= age < 45 then rred_a=rred_a_40w;
if 45 <= age < 50 then rred_a=rred_a_45w;
if 50 <= age < 55 then rred_a=rred_a_50w;
if 55 <= age < 60 then rred_a=rred_a_55w;
if 60 <= age < 65 then rred_a=rred_a_60w;

end;

*-----------------------------------------------------------------------------------------------------------------------------------------;



* if infected and have adc then reduced risk behaviour;
rred_adc=1.0; if hiv_tm1=1 and adc_tm1=1 then rred_adc = 0.2;

rred_adhav=1; 
if higher_newp_with_lower_adhav=1 and adhav < 0.8 then rred_adhav=2.0;

* reduction in sexual behaviour following +ve hiv test ;
rred_d=1.0;
if hiv_tm1=1 then do;
		if   . < date1pos <= caldate{t} <= date1pos+0.5 then rred_d = ch_risk_diag_newp;
		if date1pos ne . and caldate{t} >  date1pos+0.5 then rred_d = sqrt(ch_risk_diag_newp);
end;


rred_balance= 1 ;

if gender=1 then do;
		 if          d_s_newp >= 10000 then rred_balance = 0.10 ;
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
	else if .     <= d_s_newp < -10000 then rred_balance = 10 ;
end;
else if gender=2 then do;
	     if          d_s_newp >= 10000 then rred_balance = 10;
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
	else if .     <= d_s_newp < -10000 then rred_balance = 0.10;
end;

rred_ep = 1 ; if ep_tm1  = 1 and conc_ep ne . then rred_ep = conc_ep ;  * mar16 ;

rred= newp_factor*(rred_a * rred_p * rred_adc * rred_d * rred_rc * rred_balance * rred_ep * rred_adhav); 
* rred_ep lower or greater concurrence with ep - to introduce a potential dependence of newp on ep - which could influence
the magnitude of an epidemic generated for a given mean level of condomless sex;



if gender=1 and t ge 2 then do;

if sex_beh_trans_matrix_m=1 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.00005; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.00005; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.00025; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.05; *newp 10x; s4=0.9500; end;
end;
if sex_beh_trans_matrix_m=2 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.00025; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.00025; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.00125; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.20; *newp 10x; s4=0.8000; end;
end;
if sex_beh_trans_matrix_m=3 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.0005 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.0005 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.0025 ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=4 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0001 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.0001 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.0005  ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.04; *newp=1; s2=0.04; *newp >= 2; s3=0.09; *newp 10x; s4=0.8300; end;
end;
if sex_beh_trans_matrix_m=5 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.005  ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.0005 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.0025 ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.025; *newp=1; s2=0.06; *newp >= 2; s3=0.17; *newp 10x; s4=0.7500; end;
end;
if sex_beh_trans_matrix_m=6 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.005  ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.04; *newp=1; s2=0.08; *newp >= 2; s3=0.21; *newp 10x; s4=0.6700; end;
end;
if sex_beh_trans_matrix_m=7 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.000025; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.000025; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.000125; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.05; *newp 10x; s4=0.9500; end;
end;
if sex_beh_trans_matrix_m=8 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.000125; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.000125; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.000625; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.20; *newp 10x; s4=0.8000; end;
end;
if sex_beh_trans_matrix_m=9 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.00125 ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=10 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.0005 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0005 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.0025 ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=11 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.001 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.001 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.005  ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.04; *newp=1; s2=0.08; *newp >= 2; s3=0.21; *newp 10x; s4=0.6700; end;
end;
if sex_beh_trans_matrix_m=12 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.00025 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.00025 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.00125 ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.00; *newp 10x; s4=1.0000; end;
end;
if sex_beh_trans_matrix_m=13 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.0005 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0005 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.90; *newp=1; s2=0.05; *newp >= 2; s3=0.03; *newp 10x; s4=0.02   ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.90; *newp=1; s2=0.05; *newp >= 2; s3=0.03; *newp 10x; s4=0.02  ; end;
end;
if sex_beh_trans_matrix_m=14 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.001 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.99; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.01; *newp 10x; s4=0.01   ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.01; *newp 10x; s4=0.0100; end;
end;
if sex_beh_trans_matrix_m=15 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.00025 ; end;
if 1  <= newp_tm1<=3  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if 4  <= newp_tm1<10 then do; *newp=0; s1=0.80; *newp=1; s2=0.10; *newp >= 2; s3=0.05; *newp 10x; s4=0.05    ; end;
if 10 <= newp_tm1    then do; *newp=0; s1=0.80; *newp=1; s2=0.10; *newp >= 2; s3=0.05; *newp 10x; s4=0.05  ; end;
end;

s2=s2*rred; s3=s3*rred; s4=s4*rred; 
cu1=s1;cu2=cu1+s2;cu3=cu2+s3;cu4=cu3+s4; a=uniform(0);
if            a < cu1/cu4 then do; newp=0; end; 
if cu1/cu4 <= a < cu2/cu4  then do; e=uniform(0); if e < 0.50 then newp=1; if 0.50 <= e < 0.80 then newp=2; 
											if e ge 0.80 then newp=3; end;
if cu2/cu4 <= a < cu3/cu4 then do; e=uniform(0); if e < 0.35 then newp=4; if 0.35 <= e < 0.56 then newp=5; if 0.56 <= e < 0.73 then newp=6; 
					if 0.73 <= e < 0.86 then newp=7; if 0.86 <= e < 0.95 then newp=8; if 0.95 <= e then newp=9; end;
if cu3/cu4 <= a < cu4/cu4 then do; if e < 0.60 then newp=10; if 0.60 <= e < 0.80 then newp=15; if 0.80 <= e < 0.90 then newp=20; 
					if 0.90 <= e < 0.95 then newp=25; if 0.95 <= e < 0.99 then newp=30; if 0.99 <= e then newp=35; end;

end;

/*
* ts1m:  replace code above with this;

if gender=1 and t ge 2 then do;

if sex_beh_trans_matrix_m=1 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.00005; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.00005; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.00025; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.05; *newp 10x; s4=0.9500; end;
end;
if sex_beh_trans_matrix_m=2 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.00025; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.00025; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.00125; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.20; *newp 10x; s4=0.8000; end;
end;
if sex_beh_trans_matrix_m=3 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.0005 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.0005 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.0025 ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=4 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0001 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.0001 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.0005  ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.04; *newp=1; s2=0.04; *newp >= 2; s3=0.09; *newp 10x; s4=0.8300; end;
end;
if sex_beh_trans_matrix_m=5 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.005  ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.0005 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.0025 ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.025; *newp=1; s2=0.06; *newp >= 2; s3=0.17; *newp 10x; s4=0.7500; end;
end;
if sex_beh_trans_matrix_m=6 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.005  ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.04; *newp=1; s2=0.08; *newp >= 2; s3=0.21; *newp 10x; s4=0.6700; end;
end;
if sex_beh_trans_matrix_m=7 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.995; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.000025; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.000025; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.03; *newp=1; s2=0.07; *newp >= 2; s3=0.90; *newp 10x; s4=0.000125; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.05; *newp 10x; s4=0.9500; end;
end;
if sex_beh_trans_matrix_m=8 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.98; *newp=1; s2=0.01 ; *newp >= 2; s3=0.01 ; *newp 10x; s4=0.000125; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.98; *newp=1; s2=0.01; *newp >= 2; s3=0.01; *newp 10x; s4=0.000125; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.05; *newp=1; s2=0.15; *newp >= 2; s3=0.80; *newp 10x; s4=0.000625; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.20; *newp 10x; s4=0.8000; end;
end;
if sex_beh_trans_matrix_m=9 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.00125 ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=10 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.0005 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0005 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.0025 ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.40; *newp 10x; s4=0.6000; end;
end;
if sex_beh_trans_matrix_m=11 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.001 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.001 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.005  ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.04; *newp=1; s2=0.08; *newp >= 2; s3=0.21; *newp 10x; s4=0.6700; end;
end;
if sex_beh_trans_matrix_m=12 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.90; *newp=1; s2=0.06; *newp >= 2; s3=0.04; *newp 10x; s4=0.00025 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.00025 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.20; *newp=1; s2=0.20; *newp >= 2; s3=0.60; *newp 10x; s4=0.00125 ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.00; *newp=1; s2=0.00; *newp >= 2; s3=0.00; *newp 10x; s4=1.0000; end;
end;
if sex_beh_trans_matrix_m=13 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.0005 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.99; *newp=1; s2=0.005; *newp >= 2; s3=0.005; *newp 10x; s4=0.0005 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.90; *newp=1; s2=0.05; *newp >= 2; s3=0.03; *newp 10x; s4=0.02   ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.90; *newp=1; s2=0.05; *newp >= 2; s3=0.03; *newp 10x; s4=0.02  ; end;
end;
if sex_beh_trans_matrix_m=14 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.001 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.99; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.001 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.01; *newp 10x; s4=0.01   ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.95; *newp=1; s2=0.03; *newp >= 2; s3=0.01; *newp 10x; s4=0.0100; end;
end;
if sex_beh_trans_matrix_m=15 then do;
if       newp_tm1=0  then do; *newp=0; s1=0.75; *newp=1; s2=0.15; *newp >= 2; s3=0.10; *newp 10x; s4=0.00025 ; end;
if newp_tm1 = 1  then do; *newp=0; s1=0.93; *newp=1; s2=0.05; *newp >= 2; s3=0.02; *newp 10x; s4=0.00025 ; end;
if 2  <= newp_tm1<4 then do; *newp=0; s1=0.80; *newp=1; s2=0.10; *newp >= 2; s3=0.05; *newp 10x; s4=0.05    ; end;
if 4 <= newp_tm1    then do; *newp=0; s1=0.80; *newp=1; s2=0.10; *newp >= 2; s3=0.05; *newp 10x; s4=0.05  ; end;
end;

* ts1m;
s2 = s2 / 3; 
s3 = s3 / 3;
s4 = s4 / 3;
s1 = 1 - (s2 + s3 +s4) ;

* ts1m - below changed ;


s2=s2*rred; s3=s3*rred; s4=s4*rred; 
cu1=s1;cu2=cu1+s2;cu3=cu2+s3;cu4=cu3+s4; a=uniform(0);
if            a < cu1/cu4 then do; newp=0; end; 
if cu1/cu4 <= a < cu2/cu4  then do; e=uniform(0); newp=1; end;
											
if cu2/cu4 <= a < cu3/cu4 then do; e=uniform(0); if e < 0.35 then newp=2; if 0.35 <= e < 0.56 then newp=2; if 0.56 <= e < 0.73 then newp=2; 
					if 0.73 <= e < 0.86 then newp=2; if 0.86 <= e < 0.95 then newp=3; if 0.95 <= e then newp=3; end;
if cu3/cu4 <= a < cu4/cu4 then do; if e < 0.60 then newp=3 ; if 0.60 <= e < 0.80 then newp= 5; if 0.80 <= e < 0.90 then newp=7 ; 
					if 0.90 <= e < 0.95 then newp=8 ; if 0.95 <= e < 0.99 then newp=10; if 0.99 <= e then newp=12; end;

end;
*/




if gender=2 and t ge 2 then do;

if sex_beh_trans_matrix_w=1 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=2 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=3 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=4 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=5 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;
if sex_beh_trans_matrix_w=6 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=7 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=8 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=9 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=10 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;
if sex_beh_trans_matrix_w=11 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=12 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=13 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=14 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=15 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;

s2=s2*rred;
cu1=s1;cu2=cu1+s2; a=uniform(0);
if            a < cu1/cu2 then do; newp=0; end; 
if cu1/cu2 <= a < cu2/cu2  then do; 
	e=uniform(0); 
	if age >= 25 then do;
	if e < 0.70 then newp = 1; if 0.70 <= e < 0.85 then newp = 2; if e ge 0.85 then newp = 3; 
	end;	
	if 15 <= age < 25 then do;
	if e < 0.30 then newp=1; 		if 0.30 <= e < 0.50 then newp=2; 	if 0.50 <= e < 0.65 then newp=3; 
	if 0.65 <= e < 0.77 then newp=4; 	if 0.77 <= e < 0.86 then newp=5; 	if 0.86 <= e < 0.92 then newp=6; 
	if 0.92 <= e < 0.96 then newp=7; if 0.96 <= e < 0.98 then newp=8; 	if 0.98 <= e then newp=9; 
	end;	
end;

end;

/*

* ts1m: replace code above with this;

if gender=2 and t ge 2 then do;

if sex_beh_trans_matrix_w=1 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=2 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=3 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=4 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=5 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.995; *newp=1-3; s2=0.005; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;
if sex_beh_trans_matrix_w=6 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=7 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=8 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=9 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=10 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;
if sex_beh_trans_matrix_w=11 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.99; *newp=1-3; s2=0.01; end;
end;
if sex_beh_trans_matrix_w=12 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
end;
if sex_beh_trans_matrix_w=13 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.95; *newp=1-3; s2=0.05; end;
end;
if sex_beh_trans_matrix_w=14 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.85; *newp=1-3; s2=0.15; end;
end;
if sex_beh_trans_matrix_w=15 then do;
	if       newp_tm1=0   then do; *newp=0; s1=0.98; *newp=1-3; s2=0.02; end;
	if 1  <= newp_tm1     then do; *newp=0; s1=0.75; *newp=1-3; s2=0.25; end;
end;


* ts1m;
s2 = s2 / 3;
s1 = 1 - s2;


s2=s2*rred;
cu1=s1;cu2=cu1+s2; a=uniform(0);
if            a < cu1/cu2 then do; newp=0; end; 
if cu1/cu2 <= a < cu2/cu2  then do; 
	e=uniform(0); 
	if age >= 25 then do;
	newp = 1; 
	end;	
	if 15 <= age < 25 then do;
	if e < 0.30 then newp=1; 		if 0.30 <= e < 0.50 then newp=1; 	if 0.50 <= e < 0.65 then newp=1; 
	if 0.65 <= e < 0.77 then newp=1; 	if 0.77 <= e < 0.86 then newp=2; 	if 0.86 <= e < 0.92 then newp=2; 
	if 0.92 <= e < 0.96 then newp=2; if 0.96 <= e < 0.98 then newp=3; 	if 0.98 <= e then newp=3; 
	end;	
end;

end;

*/

e=uniform(0);

if t ge 2  then do;
if gender = 2 and sw_tm1  = 0 then do;

	if ever_sw ne 1 then do; * dependent_on_time_step_length ;
	if 15 <= age < 20 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_1519*sqrt(rred_rc) then sw=1;
	if 20 <= age < 25 and life_sex_risk = 2 and e < base_rate_sw*sqrt(rred_rc) then sw=1;
	if 25 <= age < 35 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_2534*sqrt(rred_rc) then sw=1;
	if 35 <= age < 50 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_3549*sqrt(rred_rc) then sw=1;

	if 15 <= age < 20 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_1519*rr_sw_life_sex_risk_3*sqrt(rred_rc) then sw=1;
	if 20 <= age < 25 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_life_sex_risk_3*sqrt(rred_rc) then sw=1;
	if 25 <= age < 35 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_2534*rr_sw_life_sex_risk_3*sqrt(rred_rc) then sw=1;
	if 35 <= age < 50 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_3549*rr_sw_life_sex_risk_3*sqrt(rred_rc) then sw=1;
	end;

	if ever_sw = 1 then do; * dependent_on_time_step_length ;
	if 15 <= age < 20 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_1519*sqrt(rred_rc)*rr_sw_prev_sw then sw=1;
	if 20 <= age < 25 and life_sex_risk = 2 and e < base_rate_sw*sqrt(rred_rc)*rr_sw_prev_sw then sw=1;
	if 25 <= age < 35 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_2534*sqrt(rred_rc)*rr_sw_prev_sw then sw=1;
	if 35 <= age < 50 and life_sex_risk = 2 and e < base_rate_sw*rr_sw_age_3549*sqrt(rred_rc)*rr_sw_prev_sw then sw=1;

	if 15 <= age < 20 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_1519*rr_sw_life_sex_risk_3*sqrt(rred_rc)*rr_sw_prev_sw then sw=1;
	if 20 <= age < 25 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_life_sex_risk_3*sqrt(rred_rc)*rr_sw_prev_sw then sw=1;
	if 25 <= age < 35 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_2534*rr_sw_life_sex_risk_3*sqrt(rred_rc)*rr_sw_prev_sw then sw=1;
	if 35 <= age < 50 and life_sex_risk = 3 and e < base_rate_sw*rr_sw_age_3549*rr_sw_life_sex_risk_3*sqrt(rred_rc)*rr_sw_prev_sw then sw=1;
	end;

end;
end;


age_deb_sw=.;

*initial distribution of newp for sw (need to define tm1 here in order to define number of current partners below);
if t ge 2 and  sw_tm1 ne 1 and sw=1 then do; 
	e=uniform(0);
	if e < p_sw_init_newp_g1 then newp_tm1 = 0; if p_sw_init_newp_g1 <= e < (p_sw_init_newp_g1+p_sw_init_newp_g2) then newp_tm1 = 3 ; 
	if (p_sw_init_newp_g1+p_sw_init_newp_g2) <= e < (p_sw_init_newp_g1+p_sw_init_newp_g2+p_sw_init_newp_g3) then newp_tm1 = 20; 
	if (p_sw_init_newp_g1+p_sw_init_newp_g2+p_sw_init_newp_g3) <= e < (p_sw_init_newp_g1+p_sw_init_newp_g2+p_sw_init_newp_g3+p_sw_init_newp_g4) then newp_tm1 = 100;
	if (p_sw_init_newp_g1+p_sw_init_newp_g2+p_sw_init_newp_g3+p_sw_init_newp_g4) <= e then newp_tm1 = 150;

	if ever_sw ne 1 then do; 
		date_start_sw = caldate{t}; age_deb_sw=age; age_deb_sw_nm=age;*LBM Apr2020 nm=not missing;
	end; 
	if ever_sw=1 then date_restart_sw=caldate{t}; 
end;



if sw=1 then  ever_sw = 1;

* sw newp levels are 
1 	newp = 0
2   newp 1-6
3   newp 7-20
4   newp 21-50
5   newp 51-150
;

* dependent_on_time_step_length ;
rate_stop_sexwork = base_rate_stop_sexwork; if age >= 40 then rate_stop_sexwork = rate_stop_sexwork * 3;
if t ge 2 then do;
	if sw_tm1=1 then do;
		d_sw=uniform(0);
		if d_sw < rate_stop_sexwork/(sqrt(rred_rc)) or age ge 50 then do; sw=0; sw_program_visit=0; date_stop_sw=caldate{t};  end;
	end;
end;

age_stop_sw=.;
if date_stop_sw=caldate{t} then age_stop_sw=age;

if ever_sw=1 then tot_dur_sw=0;

***Duration of active sw;
act_dur_sw=0; ***duration of current period of sw;
if sw=1 then do;
	if date_restart_sw =. then act_dur_sw = (caldate{t}-date_start_sw);
	if date_restart_sw ne . then act_dur_sw = (caldate{t}-date_restart_sw);
	tot_dur_sw=caldate{t}-date_start_sw;
end;

***Total duration of all sw, inc inactive;
if ever_sw=1 then do;
	if sw=1 then tot_dur_eversw=caldate{t}-date_start_sw;
	if sw ne 1 then tot_dur_eversw=date_stop_sw-date_start_sw;
end;


if sw = 1 then do;
e=uniform(0);


* sw newp levels are 
1 	newp = 0
2   newp 1-6
3   newp 7-20
4   newp 21-50 
5   newp 50-150

;

* transitions between levels * dependent_on_time_step_length ;
if t ge 2 and newp_tm1 = 0 then do;
	if e < sw_newp_lev_1_1 then newp=0;
	if sw_newp_lev_1_1 <= e < sw_newp_lev_1_1+sw_newp_lev_1_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;    
	end;
	if sw_newp_lev_1_1+sw_newp_lev_1_2 <= e < sw_newp_lev_1_1+sw_newp_lev_1_2+sw_newp_lev_1_3 then do; q=uniform(0); newp = 6 + (q*14); newp = round(newp,1);	 end;
	if sw_newp_lev_1_1+sw_newp_lev_1_2+sw_newp_lev_1_3 <= e < sw_newp_lev_1_1+sw_newp_lev_1_2+sw_newp_lev_1_3+sw_newp_lev_1_4 then do; q=uniform(0); 	newp = 21 + (q*29); newp = round(newp,1);  end;
	if sw_newp_lev_1_1+sw_newp_lev_1_2+sw_newp_lev_1_3+sw_newp_lev_1_4 <= e       then do; q=uniform(0); 	newp = 51 + (q*100 ); newp = round(newp,1);  end;
end;

if  t ge 2 and 1 <= newp_tm1 <= 6 then do;
	if e < sw_newp_lev_2_1 then newp=0;
	if sw_newp_lev_2_1 <= e < sw_newp_lev_2_1+sw_newp_lev_2_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;    
	end;
	if sw_newp_lev_2_1+sw_newp_lev_2_2 <= e < sw_newp_lev_2_1+sw_newp_lev_2_2+sw_newp_lev_2_3 then do; q=uniform(0); newp = 6 + (q*14); newp = round(newp,1);	 end;
	if sw_newp_lev_2_1+sw_newp_lev_2_2+sw_newp_lev_2_3 <= e < sw_newp_lev_2_1+sw_newp_lev_2_2+sw_newp_lev_2_3+sw_newp_lev_2_4 then do; q=uniform(0); 	newp = 21 + (q*29); newp = round(newp,1);  end;
	if sw_newp_lev_2_1+sw_newp_lev_2_2+sw_newp_lev_2_3+sw_newp_lev_2_4 <= e       then do; q=uniform(0); 	newp = 51 + (q*100 ); newp = round(newp,1);  end;
end;

if  t ge 2 and 7 <= newp_tm1 <= 20 then do;
	if e < sw_newp_lev_3_1 then newp=0;
	if sw_newp_lev_3_1 <= e < sw_newp_lev_3_1+sw_newp_lev_3_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;   
	end;
	if sw_newp_lev_3_1+sw_newp_lev_3_2 <= e < sw_newp_lev_3_1+sw_newp_lev_3_2+sw_newp_lev_3_3 then do; q=uniform(0); newp = 6 + (q*14); newp = round(newp,1);	 end;
	if sw_newp_lev_3_1+sw_newp_lev_3_2+sw_newp_lev_3_3 <= e < sw_newp_lev_3_1+sw_newp_lev_3_2+sw_newp_lev_3_3+sw_newp_lev_3_4 then do; q=uniform(0); 	newp = 21 + (q*29); newp = round(newp,1);  end;
	if sw_newp_lev_3_1+sw_newp_lev_3_2+sw_newp_lev_3_3+sw_newp_lev_3_4 <= e       then do; q=uniform(0); 	newp = 51 + (q*100 ); newp = round(newp,1);  end;
end;

if  t ge 2 and  21 <= newp_tm1 <= 50 then do;
	if e < sw_newp_lev_4_1 then newp=0;
	if sw_newp_lev_4_1 <= e < sw_newp_lev_4_1+sw_newp_lev_4_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;    
	end;
	if sw_newp_lev_4_1+sw_newp_lev_4_2 <= e < sw_newp_lev_4_1+sw_newp_lev_4_2+sw_newp_lev_4_3 then do; q=uniform(0); newp = 6 + (q*14); newp = round(newp,1);	 end;
	if sw_newp_lev_4_1+sw_newp_lev_4_2+sw_newp_lev_4_3 <= e < sw_newp_lev_4_1+sw_newp_lev_4_2+sw_newp_lev_4_3+sw_newp_lev_4_4  then do; q=uniform(0); 	newp = 21 + (q*29); newp = round(newp,1);  end;
	if sw_newp_lev_4_1+sw_newp_lev_4_2+sw_newp_lev_4_3+sw_newp_lev_4_4  <= e       then do; q=uniform(0); 	newp = 51 + (q*100 ); newp = round(newp,1);  end;
end;

if  t ge 2 and  50 <  newp_tm1 then do;
	if e < sw_newp_lev_5_1 then newp=0;
	if sw_newp_lev_5_1 <= e < sw_newp_lev_5_1+sw_newp_lev_5_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;  
	end;
	if sw_newp_lev_5_1+sw_newp_lev_5_2 <= e < sw_newp_lev_5_1+sw_newp_lev_5_2+sw_newp_lev_5_3 then do; q=uniform(0); newp = 6 + (q*14); newp = round(newp,1);	 end;
	if sw_newp_lev_5_1+sw_newp_lev_5_2+sw_newp_lev_5_3 <= e < sw_newp_lev_5_1+sw_newp_lev_5_2+sw_newp_lev_5_3+sw_newp_lev_5_4 then do; q=uniform(0); 	newp = 21 + (q*29); newp = round(newp,1);  end;
	if sw_newp_lev_5_1+sw_newp_lev_5_2+sw_newp_lev_5_3+sw_newp_lev_5_4 <= e       then do; q=uniform(0); 	newp = 51 + (q*100 ); newp = round(newp,1);  end;
end;

if age > 30 then newp = min(30,newp);

end;


/*

* ts1m - levels change because this is newp in a 1 month period not 3;

* sw newp levels are 
1 	newp = 0
2   newp 1-6 / 3
3   newp 7-20 /3 
4   newp 21-50 /3
5   newp 51-150 /3

* note if used needs to be updated with vales above

;

* transitions between levels * dependent_on_time_step_length ;
if t ge 2 and newp_tm1 = 0 then do;
	if age > 30 then e=e*0.99; * older women cant be in highest category ;
	if e < sw_newp_lev_1_1 then newp=0;
	if sw_newp_lev_1_1 <= e < sw_newp_lev_1_1+sw_newp_lev_1_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;    
	end;
	if sw_newp_lev_1_1+sw_newp_lev_1_2 <= e < sw_newp_lev_1_1+sw_newp_lev_1_2+sw_newp_lev_1_3 then do; q=uniform(0); newp = 6 + (q*34); newp = round(newp,1);	 end;
	if sw_newp_lev_1_1+sw_newp_lev_1_2+sw_newp_lev_1_3 <= e < sw_newp_lev_1_1+sw_newp_lev_1_2+sw_newp_lev_1_3+sw_newp_lev_1_4 then do; q=uniform(0); 	newp = 41 + (q*59); newp = round(newp,1);  end;
	if sw_newp_lev_1_1+sw_newp_lev_1_2+sw_newp_lev_1_3+sw_newp_lev_1_4 <= e       then do; q=uniform(0); 	newp = 101 + (q*50 ); 
* ts1m; newp=newp/3; newp = round(newp,1);  end;
end;

if  t ge 2 and 1 <= newp_tm1 <= 6/3 then do;
	if age > 30 then e=e*0.99; * older women cant be in highest category ;
	if e < sw_newp_lev_2_1 then newp=0;
	if sw_newp_lev_2_1 <= e < sw_newp_lev_2_1+sw_newp_lev_2_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;    
	end;
	if sw_newp_lev_2_1+sw_newp_lev_2_2 <= e < sw_newp_lev_2_1+sw_newp_lev_2_2+sw_newp_lev_2_3 then do; q=uniform(0); newp = 6 + (q*34); newp = round(newp,1);	 end;
	if sw_newp_lev_2_1+sw_newp_lev_2_2+sw_newp_lev_2_3 <= e < sw_newp_lev_2_1+sw_newp_lev_2_2+sw_newp_lev_2_3+sw_newp_lev_2_4 then do; q=uniform(0); 	newp = 41 + (q*59); newp = round(newp,1);  end;
	if sw_newp_lev_2_1+sw_newp_lev_2_2+sw_newp_lev_2_3+sw_newp_lev_2_4 <= e       then do; q=uniform(0); 	newp = 101 + (q*50 ); 
* ts1m; newp=newp/3;newp = round(newp,1);  end;
end;

if  t ge 2 and 7/3 <= newp_tm1 <= 40/3 then do;
	if age > 30 then e=e*0.99; * older women cant be in highest category ;
	if e < sw_newp_lev_3_1 then newp=0;
	if sw_newp_lev_3_1 <= e < sw_newp_lev_3_1+sw_newp_lev_3_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;   
	end;
	if sw_newp_lev_3_1+sw_newp_lev_3_2 <= e < sw_newp_lev_3_1+sw_newp_lev_3_2+sw_newp_lev_3_3 then do; q=uniform(0); newp = 6 + (q*34); newp = round(newp,1);	 end;
	if sw_newp_lev_3_1+sw_newp_lev_3_2+sw_newp_lev_3_3 <= e < sw_newp_lev_3_1+sw_newp_lev_3_2+sw_newp_lev_3_3+sw_newp_lev_3_4 then do; q=uniform(0); 	newp = 41 + (q*59); newp = round(newp,1);  end;
	if sw_newp_lev_3_1+sw_newp_lev_3_2+sw_newp_lev_3_3+sw_newp_lev_3_4 <= e       then do; q=uniform(0); 	newp = 101 + (q*50 ); 
* ts1m; newp=newp/3;newp = round(newp,1);  end;
end;

if  t ge 2 and  41/3 <= newp_tm1 <= 100/3 then do;
	if age > 30 then e=e*0.98; * older women cant be in highest category ;
	if e < sw_newp_lev_4_1 then newp=0;
	if sw_newp_lev_4_1 <= e < sw_newp_lev_4_1+sw_newp_lev_4_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;    
	end;
	if sw_newp_lev_4_1+sw_newp_lev_4_2 <= e < sw_newp_lev_4_1+sw_newp_lev_4_2+sw_newp_lev_4_3 then do; q=uniform(0); newp = 6 + (q*34); newp = round(newp,1);	 end;
	if sw_newp_lev_4_1+sw_newp_lev_4_2+sw_newp_lev_4_3 <= e < sw_newp_lev_4_1+sw_newp_lev_4_2+sw_newp_lev_4_3+sw_newp_lev_4_4  then do; q=uniform(0); 	newp = 41 + (q*59); newp = round(newp,1);  end;
	if sw_newp_lev_4_1+sw_newp_lev_4_2+sw_newp_lev_4_3+sw_newp_lev_4_4  <= e       then do; q=uniform(0); 	newp = 101 + (q*50 ); 
* ts1m; newp=newp/3; newp = round(newp,1);  end;
end;

if  t ge 2 and  100/3 <  newp_tm1 then do;
	if e < sw_newp_lev_5_1 then newp=0;
	if sw_newp_lev_5_1 <= e < sw_newp_lev_5_1+sw_newp_lev_5_2 then do; q=uniform(0); 
		if q < 0.7 then newp=1; if 0.7 <= q < 0.8 then newp=2; if 0.8 <= q < 0.9 then newp=3; if 0.9 <= q < 0.95 then newp=4;    
		if 0.95 <= q < 0.98 then newp=5; if 0.98 <= q       then newp=6;  
	end;
	if sw_newp_lev_5_1+sw_newp_lev_5_2 <= e < sw_newp_lev_5_1+sw_newp_lev_5_2+sw_newp_lev_5_3 then do; q=uniform(0); newp = 6 + (q*34); newp = round(newp,1);	 end;
	if sw_newp_lev_5_1+sw_newp_lev_5_2+sw_newp_lev_5_3 <= e < sw_newp_lev_5_1+sw_newp_lev_5_2+sw_newp_lev_5_3+sw_newp_lev_5_4 then do; q=uniform(0); 	newp = 41 + (q*59); newp = round(newp,1);  end;
	if sw_newp_lev_5_1+sw_newp_lev_5_2+sw_newp_lev_5_3+sw_newp_lev_5_4 <= e       then do; q=uniform(0); 	newp = 101 + (q*50 ); 
* ts1m; newp=newp/3;
newp = round(newp,1);  end;
end;

end;

*/


* Reducing newp for FSW by 50% according to population change in risk behaviour;
if sw=1 and newp ge 1 then do;
u=uniform(0); if u < (1-rred_rc)*rate_sw_rred_rc then do; newp=newp/3; newp=round(newp,1);end;
end;

if sw=1 and newp ge 1 and eff_sw_program = 1 and sw_program_visit=1 then do;
if sw_program_effect=1 then do; u=uniform(0); if u < 0.05 then newp=newp/3; newp=round(newp,1);end;
if sw_program_effect=2 then do; u=uniform(0); if u < 0.10 then newp=newp/3; newp=round(newp,1);end;
end;


* Reducing newp by 50% if condom incr =1;
if caldate{t} = 2020.5 and condom_incr_2020 = 1 then do;
	u=uniform(0); if u < 0.50 then do;newp=newp/2;newp=round(newp,1);end;
end;




e=uniform(0);
if gender=1 then do;
	if      15 <= age < 25 then do;
		if 0 < r_s_ep_m15w15 <0.95 then e=e/(3*r_s_ep_m15w15); end;
	else if 25 <= age < 35 then do;
		if 0 < r_s_ep_m25w25 <0.95 then e=e/(3*r_s_ep_m25w25); end;
	else if 35 <= age < 45 then do;
		if 0 < r_s_ep_m35w35 <0.95 then e=e/(3*r_s_ep_m35w35); end;
	else if 45 <= age < 55 then do;
		if 0 < r_s_ep_m45w45 <0.95 then e=e/(3*r_s_ep_m45w45); end;
	else if 55 <= age < 65 then do;
		if 0 < r_s_ep_m55w55 <0.95 then e=e/(3*r_s_ep_m55w55); end;
end;
else if gender=2 then do;
	if      15 <= age < 25 then do;
		if r_s_ep_m15w15 >1.05 then e=e/(3*r_s_ep_m15w15); end;
	else if 25 <= age < 35 then do;
		if r_s_ep_m25w25 >1.05 then e=e/(3*r_s_ep_m25w25); end;
	else if 35 <= age < 45 then do;
		if r_s_ep_m35w35 >1.05 then e=e/(3*r_s_ep_m35w35); end;
	else if 45 <= age < 55 then do;
		if r_s_ep_m45w45 >1.05 then e=e/(3*r_s_ep_m45w45); end;
	else if 55 <= age < 65 then do;
		if r_s_ep_m55w55 >1.05 then e=e/(3*r_s_ep_m55w55); end;
end;

* reduction in sexual behaviour following hiv+ test;  * dependent_on_time_step_length ;
if t ge 3 and registd_tm1  ne 1 and epdiag_tm2=0  and epdiag_tm1 =  1 then e=e/ch_risk_diag; 
if t ge 3 and registd_tm2  ne 1 and registd_tm1 =1 and epdiag_tm1 ne 1 then e=e/ch_risk_diag;
* ts1m ;  * change these lines above to: 
* if t ge 3 and registd_tm1  ne 1 and epdiag_tm2=0  and epdiag_tm1 =  1 then e=e/(ch_risk_diag**(1/3)); 
* if t ge 3 and registd_tm2  ne 1 and registd_tm1=1 and epdiag_tm1 ne 1 then e=e/(ch_risk_diag**(1/3));

z=1; if caldate{t} ge 1995 then z=1/ch_risk_beh_ep; * dependent_on_time_step_length ;
* ts1m ;  * change this line above to: 
* z=1; 
* if caldate{t} ge 1995 then z=1/(ch_risk_beh_ep**(1/3));

* increased chance of longer term unprotected sex partnership ending after hiv diagnosis
in subject or in longer term partner (either due to starting to use condoms, stopping 
sex or partnership ending);
ep   =0; * dependent_on_time_step_length ;
if  ep_tm1=1 and lep=1 and e < (1-(0.25*z)) then ep=1; 
if  ep_tm1=1 and lep=2 and e < (1-(0.05*z)) then ep=1; 
if  ep_tm1=1 and lep=3 and e < (1-(0.02*z)) then ep=1; 

u=uniform(0);
if       r_ep_mw >  1.2 and gender=2 then u=u/4;
if 1.1 < r_ep_mw <= 1.2 and gender=2 then u=u/2;
if 0.8 <= r_ep_mw < 0.9 and gender=1 then u=u/2;
if .   <  r_ep_mw < 0.8 and gender=1 then u=u/4;

* reduction in sexual behaviour following hiv+ test ;
if registd_tm1=1 then u=u/ch_risk_diag;

if caldate{t} ge 1995 then u=u/ch_risk_beh_ep;
* less chance of starting longer term unprotected sex partnership after hiv diagnosis
in subject; * dependent_on_time_step_length ;
if ep_tm1=0 and 15 <= age < 25 and u < eprate then do; 
	ep=1; d=uniform(0); if d < 0.30 then lep=1; if .30 <= d < 0.60 then lep=2;  if .60 <= d then lep=3; end;
if ep_tm1=0 and 25 <= age < 35 and u < eprate then do; 
	ep=1; d=uniform(0); if d < 0.30 then lep=1; if .30 <= d < 0.60 then lep=2;  if .60 <= d then lep=3; end;
if ep_tm1=0 and 35 <= age < 45 and u < eprate/2 then do; 
	ep=1; d=uniform(0); if d < 0.30 then lep=1; if .30 <= d < 0.60 then lep=2;  if .60 <= d then lep=3; end;
if ep_tm1=0 and 45 <= age < 55 and u < eprate/3 then do; 
	ep=1; d=uniform(0); if d < 0.30 then lep=1; if .30 <= d < 0.80 then lep=2;  if .80 <= d then lep=3; end;
if ep_tm1=0 and 55 <= age < 65 and u < eprate/5 then do;
	ep=1; d=uniform(0); if d < 0.30 then lep=1; if 0.30 <= d then lep=2;  end;

if t ge 2 and newp ge 1 then ever_newp=1;
if t ge 2 and ep =  1 then ever_ep=1;

np = ep + newp;



*-----------------------------------------------------------------------------------------------------------------------------------------;

newp_ever = newp_ever + newp;
np_ever = np_ever + np;
np_lasttest = np_lasttest + np;
newp_lasttest = newp_lasttest + newp;


* RISK BEHAVIOUR FOR PEOPLE REACHING AGE 15;

if age <= 15.25  then do;
sti=0;hiv=0;
np=0; newp=0; ep=0;
newp_ever = 0;
np_ever = 0;
end;



* EXISTING PARTNERS;

ep=0; ep= np-newp;

* xx22; 
end;



* episodes of sex work;

if t ge 2 then do;
if sw_tm1 ne 1 and  sw=1 then episodes_sw=episodes_sw+1;
end;

sw_gt1ep=0;if episodes_sw  gt 1 then sw_gt1ep=1;


* OCCURRENCE OF NON-HIV SYMPTOMS THAT LEAD TO TESTING FOR HIV AS PART OF DIAGNOSTIC WORK UP (OR TRIGGERED BY DIAGNOSIS OF TB ETC);

if t ge 2 then do;
s=uniform(0);   * dependent_on_time_step_length ;
tested_symptoms_not_hiv =0;  if . < date_start_testing <= caldate{t} and s < rate_non_hiv_symptoms and tested ne 1  and registd_tm1 ne 1
and ( (testing_disrup_covid ne 1 or covid_disrup_affected ne 1) ) then do; 
tested_symptoms_not_hiv =1; tested=1; 
if ever_tested ne 1 then date1test=caldate{t}; ever_tested=1; dt_last_test=caldate{t}; end;
end;


*choice of value for rate_non_hiv_symptoms will be informed by data in proportion of people who are tested for 
HIV to investigate symtpoms, this includes people without HIV who develop TB
I inititially chose 0.001 as this implies around 30,000 tests per year which seems in the right ball-park but 
we will have to modify the value when we have data to compare with; 



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* RISK OF NEW INFECTION ;  * part of SECTION 3 - updating variables that exist for all adults, regardless of HIV status ;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


if t ge 2 and 15 <= age < 65 and death=. then do; * do loop ends at xx33;

vl_tm1=vl; vl=.;

ageg_ep=0;if ep=1 then do;

		if      15 <= age < 25 then ageg_ep=1;
		else if 25 <= age < 35 then ageg_ep=2;
		else if 35 <= age < 45 then ageg_ep=3;
		else if 45 <= age < 55 then ageg_ep=4;
		else if 55 <= age < 65 then ageg_ep=5;
end;

* EXISTING SEX PARTNERS AND WHETHER INFECTED, DIAGNOSED, ON ART, VIRAL SUPPRESSED;

if ep >= 1 then epi=0;

if t ge 2 and ep=1 and epi_tm1 =1 then epi=1;

f=uniform(0);if gender=1 and epi=1 and d_hiv_epi_mw > 50 and f < 0.1 then epi=0;

if t ge 2 and ep_tm1=1 then do;
	mr_epi=epi_tm1;
	if epi_tm1=1 then mr_epdiag=epdiag_tm1;
end;


* diagnosis, art and suppression status of existing partners;

* existing partner becomes infected;

if ep>=1 and epi=0 then do;

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
if ep=1 then do; epmono=0;
	if (gender=2 and ((ageg_ep=1 and s < prop_mono_m_1524) or (ageg_ep=2 and s < prop_mono_m_2534) or (ageg_ep=3 and s < prop_mono_m_3544) 
	or (ageg_ep=4 and s < prop_mono_m_4554) or (ageg_ep=5 and s < prop_mono_m_5564))) or 
	   (gender=1 and ((ageg_ep=1 and s < prop_mono_w_1524) or (ageg_ep=2 and s < prop_mono_w_2534) or (ageg_ep=3 and s < prop_mono_w_3544) 
	or (ageg_ep=4 and s < prop_mono_w_4554) or (ageg_ep=5 and s < prop_mono_w_5564))) then epmono=1;
	if epmono=1 and epi ne 1 then do;
		if hiv=1 then do;  * rep * dependent_on_time_step_length ;

			if       .  <  vl_tm1 < 2.7 then rep = max(0,tr_rate_undetec_vl+(0.000025*normal(0)));
			else if 2.7 <= vl_tm1 < 3.7 then rep = max(0,(0.01*fold_tr)+(0.0025*normal(0))); 
			else if 3.7 <= vl_tm1 < 4.7 then rep = max(0,(0.03*fold_tr)+(0.0075*normal(0)));
			else if 4.7 <= vl_tm1 < 5.7 then rep = max(0,(0.06*fold_tr)+(0.015*normal(0))); 
			else if        vl_tm1 >=5.7 then rep = max(0,(0.10*fold_tr)+(0.025*normal(0)));  
			if primary_tm1 =1 		    then rep = max(0,tr_rate_primary+(0.075*normal(0)));

* ts1m ; * replace lines above with:

*			if       .  <  vl_tm1 < 2.7 then rep = max(0,( 1 - (1 - tr_rate_undetec_vl)**(1/3) )+(0.000025/3*normal(0)));
*			else if 2.7 <= vl_tm1 < 3.7 then rep = max(0,(( 1 - (1 - 0.01)**(1/3) )*fold_tr)+(0.0025/3*normal(0))); 
*			else if 3.7 <= vl_tm1 < 4.7 then rep = max(0,(( 1 - (1 - 0.03)**(1/3) )*fold_tr)+(0.0075/3*normal(0)));
*			else if 4.7 <= vl_tm1 < 5.7 then rep = max(0,(( 1 - (1 - 0.06)**(1/3) )*fold_tr)+(0.015/3*normal(0))); 
*			else if        vl_tm1 >=5.7 then rep = max(0,(( 1 - (1 - 0.10)**(1/3) )*fold_tr)+(0.025/3*normal(0)));  
*			if primary_tm1 =1 		    then rep = max(0,( 1 - (1 - tr_rate_primary)**(1/3) )+(0.075/3*normal(0)));

			if gender=1 and ageg_ep gt 1  then rep = rep * fold_change_w;  * higher transmission risk in women;
			if gender=1 and ageg_ep =  1  then rep = rep * fold_change_yw;  * higher transmission risk in women;
			if sti=1                  then rep = rep * fold_change_sti;  * higher transmission risk with sti;
			a=uniform(0); if a < rep then do; epi=1; froms=1; end;
		end;
	end;
	else if epmono=0 and epi ne 1 then do;	
		if gender=1 then do;
			if      ageg_ep=1 and e < incidence1524w_epnewp then do; epi=1; fromo=1; end;
			else if ageg_ep=2 and e < incidence2534w_epnewp then do; epi=1; fromo=1; end;
			else if ageg_ep=3 and e < incidence3544w_epnewp then do; epi=1; fromo=1; end;
			else if ageg_ep=4 and e < incidence4554w_epnewp then do; epi=1; fromo=1; end;
			else if ageg_ep=5 and e < incidence5564w_epnewp then do; epi=1; fromo=1; end;
		end;
		else if gender=2 then do;
			if      ageg_ep=1 and e < incidence1524m_epnewp then do; epi=1; fromo=1; end;
			else if ageg_ep=2 and e < incidence2534m_epnewp then do; epi=1; fromo=1; end;
			else if ageg_ep=3 and e < incidence3544m_epnewp then do; epi=1; fromo=1; end;
			else if ageg_ep=4 and e < incidence4554m_epnewp then do; epi=1; fromo=1; end;
			else if ageg_ep=5 and e < incidence5564m_epnewp then do; epi=1; fromo=1; end;
		end;
	end;
end;


if gender=2 and d_hiv_epi_wm > 0 then epi=0;
if gender=1 and d_hiv_epi_mw > 0 then epi=0;

end;


if hiv=1 and epi=1 then do;
	if gender=2 and     r_hiv_epi_both > 1 then do; g=uniform(0); if g > 1/r_hiv_epi_both > . then do; epi=.; ep=0; epmono=.; ageg_ep=.; end; end;
	if gender=1 and . < r_hiv_epi_both < 1 then do; g=uniform(0); if g >   r_hiv_epi_both > . then do; epi=.; ep=0; epmono=.; ageg_ep=.; end; end;
end;

if epi ne 1 then do; froms=.; fromo=. ; already=.; old=.; end;

epdiag=0; epart=0; 
if epi=1 then do;

	if epdiag_tm1=1 then epdiag=1;
	if epdiag_tm1 ne 1 then do;
		epdiag=0; s=uniform(0);

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

		if s < j then epdiag=1;
	end;

	if epdiag=1 then do; * remember some infected partners are lost to follow-up;
		if epart_tm1=1 then do; epart=0; f=uniform(0); if f < 0.98 then epart=1; end;
		if epart_tm1 ne 1 and epdiag=1 then do;
			epart=0; s=uniform(0);

					if 0   >   d_onart then j=0;
					if 0   <=  d_onart < 0.05   then j=p_diag_onart/5;if 0.05   <=  d_onart < 0.1   then j=p_diag_onart/2;if 0.1  <=  d_onart    then j=p_diag_onart;
					if p_diag_onart > 0.95 then j=1;

			if art_intro_date <= caldate{t} and s < j  then epart=1;
		end;
	end;

	* rates of viral suppression;
	epvls=0; if epart=1 then do;
		if epvls_tm1=1 then do; epvls=1; f=uniform(0); if f < 0.03 then epvls=0; end;
		if epvls_tm1 ne 1 and epart=1 then do;
			if 0   >  d_vls then j=0;
				if 0.05 > d_vls >=  0    then j=p_onart_vls/5; 
				if 0.1 > d_vls >=  0.05  then j=p_onart_vls/2;  
				if d_vls >=  0.1    then j=p_onart_vls;
			epvls=0; s=uniform(0); if s < j  then epvls=1;
		end;
	end;
end;



* OCCURRENCE OF PREGNANCY;

u=uniform(0);
pregnant_ntd=0; pregnant_oth_dol_adv_birth_e=0;
if gender=2 and t ge 4 and ((caldate{t}-dt_lastbirth gt 1.25) or dt_lastbirth=.) then do;
	prob_pregnancy_newp = prob_pregnancy*fold_tr_newp;
	if (ep_tm3=1   and . lt u lt prob_pregnancy) or      
	   (newp_tm3 =1 and . lt u lt prob_pregnancy_newp) then do;
		pregnant=1;dt_lastbirth=caldate{t};cum_children=cum_children+1; pregnant_ntd=0;pregnant_oth_dol_adv_birth_e=0;
	end;
	if pregnant ne 1 and newp_tm3  gt 1 then do; * dependent_on_time_step_length ;
	* consider if pregnant will be 1 only for 1 period ;
		uu=2;do until (uu gt newp_tm3 );
			ua=uniform(0);
			if (. lt ua lt prob_pregnancy_newp) then do;
				pregnant=1;dt_lastbirth=caldate{t};cum_children=cum_children+1; pregnant_ntd=0; pregnant_oth_dol_adv_birth_e=0;
			end;
		uu=uu+1;
		end;
	end;
	if pregnant=1 and o_dol_tm3 =1 then do; u = uniform(0); if u < ntd_risk_dol then do; * not * dependent_on_time_step_length ;
			pregnant_ntd=1;prev_pregnant_ntd=1; date_pregnancy_ntd = caldate{t}; 
	end;  end;
	if pregnant=1 and bmi_gt23_start_dol = 1 and o_dol=1 then do; u = uniform(0); if u < oth_dol_adv_birth_e_risk then do; 
			pregnant_oth_dol_adv_birth_e=1; prev_oth_dol_adv_birth_e=1;
	end;  end;

end;


*HIV Testing in ANC;
a=uniform(0);tested_anc_prevdiag=0;w1549_birthanc=0;w1524_birthanc=0;hiv_w1549_birthanc=0;hiv_w1524_birthanc=0;
if pregnant=1 then do;  * dependent_on_time_step_length ;
	if a < prob_anc then do; * dec15 - remove age effect for malawi to simplify;
		anc=1;
		***LBM Aug19;
		if 15 le age lt 50 then do;w1549_birthanc=1;hiv_w1549_birthanc=hiv;end;
		if 15 le age lt 25 then do;w1524_birthanc=1;hiv_w1524_birthanc=hiv;end;
        if registd ne 1 and ( (testing_disrup_covid ne 1 or covid_disrup_affected ne 1 )) then do; tested=1; dt_last_test=caldate{t};np_lasttest=0; tested_anc=1;end;      
		if ever_tested ne 1 then do; ever_tested=1; date1test=caldate{t}; newp_lasttest_tested_this_per = newp_lasttest; newp_lasttest=0;end;
        *5Nov2016: women who are already diagnosed but who do not disclose get tested;
         u=uniform(0); if registd=1 and tested ne 1 and u<0.7 then do; * tested=1;tested_anc_prevdiag=1; end;
    end;
end;

*5Nov2016: additional HIV test 3 months after birth, this is because it is the easiest way to capture the fact that pregnant women are tested twice during pregnancy;
if t ge 2 and gender=2 and dt_lastbirth=caldate{t}-0.25 and tested_tm1=1 then do; * dependent_on_time_step_length ;
* ts1m ; * replace line above with:  
* if t ge 2 and gender=2 and dt_lastbirth=caldate{t}-(1/12) and tested_tm1=1 then do; 
	if registd ne 1 and ( (testing_disrup_covid ne 1 or covid_disrup_affected ne 1)) then do;anc=1;tested=1;ever_tested=1; dt_last_test=caldate{t};np_lasttest=0; end;
end;


* PREP ELIGIBILITY (to start and continue on PrEP);

prep_elig=0;  * dec17 - note change to requirement for newp ge 2, and different eligibility for new users than previous users;

* note this code below changed from kzn_prep program as only need newp ge 1 for sw to be eligible;

if t ge 2 and (registd ne 1) and hard_reach=0 then do;

	if prep_strategy=1 then do; 
	if sw_tm1=1 and newp_tm1 ge 1 then prep_elig=1; if prep_ever=1 and sw=1 and newp ge 1 then prep_elig=1; 
	end;

	if prep_strategy=2 then do;
	if sw_tm1=1 and newp_tm1 ge 1 then prep_elig=1; if prep_ever=1 and sw=1 and newp ge 1 then prep_elig=1; 
	if gender=2 and 15<=age<25 and (newp_tm1 ge 2 or (epdiag_tm1=1 and epart_tm1 ne 1)) then prep_elig=1; 
	if prep_ever=1 and gender=2 and 15<=age<25 and (newp ge 1 or (epdiag=1 and epart ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=3 then do;
	if sw_tm1=1 and newp_tm1 ge 1 then prep_elig=1; if prep_ever=1 and sw=1 and newp ge 1 then prep_elig=1; 
	if gender=2 and 15<=age<25 and (newp_tm1 ge 1 or (epdiag_tm1=1 and epart_tm1 ne 1)) then prep_elig=1; 
	if prep_ever=1 and gender=2 and 15<=age<25 and (newp ge 1 or (epdiag_tm1=1 and epart_tm1 ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=4 then do;
	if sw_tm1=1 and newp_tm1 ge 1 then prep_elig=1; if prep_ever=1 and sw=1 and newp ge 1 then prep_elig=1; 
	if gender=2 and 15<=age<25 and (newp_tm1 ge 1 or (ep_tm1=1 and epvls_tm1 ne 1)) then prep_elig=1; 
	if prep_ever=1 and gender=2 and 15<=age<25 and (newp ge 1 or (ep=1 and epvls ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=5 then do;
	if sw_tm1=1 and newp_tm1 ge 1 then prep_elig=1; if prep_ever=1 and sw=1 and newp ge 1 then prep_elig=1; 
	if gender=2 and (newp_tm1 ge 1 or (epdiag_tm1=1 and epart_tm1 ne 1)) then prep_elig=1; 
	if prep_ever=1 and gender=2 and (newp ge 1 or (epdiag=1 and epart ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=6 then do;
	if sw_tm1=1 and newp_tm1 ge 1 then prep_elig=1; if prep_ever=1 and sw=1 and newp ge 1 then prep_elig=1; 
	if 15<=age<25 and (newp_tm1 ge 1 or (epdiag_tm1=1 and epart_tm1 ne 1)) then prep_elig=1; 
	if 15<=age<25 and prep_ever=1 and (newp ge 1 or (epdiag=1 and epart ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=7 then do;
	if sw_tm1=1 and newp_tm1 ge 1 then prep_elig=1; if prep_ever=1 and sw=1 and newp ge 1 then prep_elig=1; 
	if (newp_tm1 ge 1 or (epdiag_tm1=1 and epart_tm1 ne 1)) then prep_elig=1; 
	if prep_ever=1 and (newp ge 1 or (epdiag=1 and epart ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=8 then do;
	if sw_tm1=1 and newp_tm1 ge 1 then prep_elig=1; if prep_ever=1 and sw=1 and newp ge 1 then prep_elig=1; 
	if (newp_tm1 ge 2 or (epdiag_tm1=1 and epart_tm1 ne 1)) then prep_elig=1; 
	if prep_ever=1 and (newp ge 2 or (epdiag=1 and epart ne 1)) then prep_elig=1; 
	end;

	if prep_strategy=9 then do;
	if (newp ge 1 or (epdiag=1 and epart ne 1)) then prep_elig=1; 
	end;


end;


* HIV TESTING;

tested_as_sw=.;
 
if registd ne 1 and caldate{t} ge (date_start_testing+3.5) and tested ne 1 
and ((testing_disrup_covid ne 1 or covid_disrup_affected ne 1 )) then do;

	if t ge 2 and sw_test_6mthly=1 and sw=1 and (caldate{t}-dt_last_test >= 0.5 or dt_last_test=.) 
	and ( (testing_disrup_covid ne 1 or covid_disrup_affected ne 1)) then do; 
		tested=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};
		np_lasttest=0; newp_lasttest_tested_this_per = newp_lasttest; newp_lasttest=0; tested_as_sw=1;
	end;


	if hard_reach=0 then do;
												
		unitest=uniform(0);

		* think not * dependent_on_time_step_length ;
 		if . < np_lasttest <= 0 then unitest = unitest * eff_test_targeting;  if no_test_if_np0 = 1 and . < np_lasttest <= 0 then unitest = 1;
		if newp_lasttest ge 1 then unitest=unitest/eff_test_targeting;  * targeting of testing - aug15;

		if      ever_tested ne 1  then do; 
			if unitest < rate_1sttest then do;
				newp_lasttest=0;
				tested=1; if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};
				np_lasttest=0; newp_lasttest_tested_this_per = newp_lasttest; newp_lasttest=0;
			end;

		end;

		if ever_tested  = 1  then do;

			if eff_max_freq_testing=1 then do;  
					if caldate{t}-dt_last_test >= 1.0 and unitest < rate_reptest then do;	
 					tested=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};
					np_lasttest=0;newp_lasttest_tested_this_per = newp_lasttest;newp_lasttest=0;
				end;
			end;
			if eff_max_freq_testing=2 then do;*every 6 months;  
				if caldate{t}-dt_last_test >= 0.5 and unitest < rate_reptest then do;
					tested=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};
					np_lasttest=0;newp_lasttest_tested_this_per = newp_lasttest; newp_lasttest=0; 
				end;
			end;
			if eff_max_freq_testing=4 then do;*every 3 months;  
				if caldate{t}-dt_last_test >= 0.25 and unitest < rate_reptest then do;
					tested=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;dt_last_test=caldate{t};    
					np_lasttest=0;newp_lasttest_tested_this_per = newp_lasttest;newp_lasttest=0;
				end;
			end;
		end;
	end;

	
	if t ge 4 and caldate{t} ge date_prep_intro and hard_reach=0 and ((testing_disrup_covid ne 1 or covid_disrup_affected ne 1)) then do;

		*Testing before ever starting PrEP;

		*only people eligible for PrEP have the additional testing rate (otherwise lots of people will get tested additionally
		without receiving PrEP if they are not eligible). This additional testing rate reflects the additional testing that will be
		available with roll-out and interest of PrEP
		 do not differentiate the probabilty of testing whether they have a short-term or long-term partner;

		if  prep_ever ne 1 and tested ne 1 and prep_elig=1 and (prep_willing_pop=1 or  (sw=1 and prep_willing_sw=1 ))  then do;
			a=uniform(0); if a < eff_rate_test_startprep then do;	
				tested=1;ever_tested=1;testfor_prep=1;dt_last_test=caldate{t};np_lasttest=0;
			end; 
		end;

		*Routine testing while on PREP;
		else if prep_ever=1 and prep_elig=1 then do;
			if prep_tm1 =1 then do;  * dependent_on_time_step_length;
				if annual_testing_prep=1 and caldate{t}-dt_last_test >= 1.0 then do;
					a=uniform(0); if a < rate_test_onprep then do; tested=1; dt_last_test=caldate{t}; np_lasttest=0; end; 
				end;
				else if annual_testing_prep=0.5 and caldate{t}-dt_last_test >= 0.5 then do;
					a=uniform(0); if a < rate_test_onprep then do; tested=1; dt_last_test=caldate{t}; np_lasttest=0; end;
				end;
				else if annual_testing_prep=0.25 and caldate{t}-dt_last_test >= 0.25 then do;
					a=uniform(0); if a < rate_test_onprep then do; tested=1; dt_last_test=caldate{t}; np_lasttest=0; end;
				end;
			end;
			*re-initiation of PrEP;
			else if prep_tm1  ne 1 then do; * dependent_on_time_step_length;
				a=uniform(0); if a < eff_rate_test_restartprep and stop_prep_choice ne 1 then do; tested=1; dt_last_test=caldate{t}; np_lasttest=0;end;
			end; * jul17;
		end;

	end;

end;


cost_test=0; 


* short term migration - exp_setting_lower_p_vl1000; * mar19;

exp_set_lower_p_v1000_in_period = 0;
if exp_setting_lower_p_vl1000 = 1 and 20 <= age < 50 then do;
r=uniform(0);  * dependent_on_time_step_length;
if gender = 1 and r < rate_exp_set_lower_p_vl1000 then exp_set_lower_p_v1000_in_period = 1;
if gender = 2 and r < rate_exp_set_lower_p_vl1000 / 2 then exp_set_lower_p_v1000_in_period = 1;
end;


* PREP INITIATION AND CONTINUATION;

* Note that date of stop of prep (date_prep_e) only given a value for people who stop tl prep or people on tld prep who stop without having
(or without been diagnosed with) hiv;

prep=0; pop_wide_tld_prep=0; prep_falseneg=0; 


if prep_disrup_covid = 1 and covid_disrup_affected = 1 then do; 
		ever_prep_covid_disrup=1;
		pre_covid_rate_choose_stop_prep = eff_rate_choose_stop_prep;
		pre_covid_pr_prep_restart_choice = eff_prob_prep_restart_choice;
		eff_rate_choose_stop_prep = 1;
		eff_prob_prep_restart_choice = 0 ;
end;
if prep_disrup_covid ne 1 and ever_prep_covid_disrup=1 then do; 
		eff_rate_choose_stop_prep = pre_covid_rate_choose_stop_prep ;
		eff_prob_prep_restart_choice = pre_covid_pr_prep_restart_choice ;
end;



*Jul2016 f_prep;
if t ge 4 and caldate{t} ge date_prep_intro and registd ne 1 and prep_elig=1 then do;

	unisensprep=uniform(0);
	*starting Prep;
	*if prep_ever ne 1 and hiv=0 and tested=1 then do;
	*it was tested_tm1=1 and hiv_tm1=0. Now changed to tested=1 and commented out hiv_tm1=0 because
	we want people who are false negative to also start PrEP, this is the reason why hiv=0 is now commented out;
	if prep_ever ne 1 and tested=1 and (hiv=0 or (hiv=1 and unisensprep > sens_vct)) then do;
		if sw = 1 then do;
			if prep_willing_sw=1 then do; 
				if 		testfor_prep = 1  then do; prep   =1; prep_ever=1; continuous_prep_use=0.25; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};end; 
				else if testfor_prep ne 1 then do;r=uniform(0); if r < prob_prep_b then do; prep   =1; prep_ever=1; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};end; end;
			end;
		end;
		else if sw ne 1 then do; 
			if prep_willing_pop=1 then do; 
				if 		testfor_prep = 1  then do;prep   =1; prep_ever=1; continuous_prep_use=0.25; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};end; 
				else if testfor_prep ne 1 then do;r=uniform(0); if r < prob_prep_b then do; prep   =1; prep_ever=1; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};end; end;
			end;
		end;
	started_prep_hiv_test_sens=0;if prep   =1 and (hiv=1 and unisensprep > sens_vct) then do; started_prep_hiv_test_sens=1;started_prep_hiv_test_sens_e=1;end;
	end;
	* continuing PrEP;
	if prep_ever=1 and dt_prep_s ne caldate{t} and (tested ne 1 or (tested=1 and (hiv=0 or (hiv=1 and unisensprep > sens_vct)))) then do; * may17;
		if prep_tm1 = 1 then do; * dependent_on_time_step_length;
			if annual_testing_prep=1 then do;
				if 0 <= caldate{t}-dt_last_test <= 1.0 then do;
					r=uniform(0); 
					if r < (1-eff_rate_choose_stop_prep) then do; prep=1; dt_prep_e=caldate{t}; continuous_prep_use = continuous_prep_use + (0.25); end;
					else if r >= (1-eff_rate_choose_stop_prep) then do; stop_prep_choice=1; continuous_prep_use=0; end; *variable for people who discontinued despite newp>1; 
				end;
			end;
			else if annual_testing_prep=0.5 then do;
				if 0 <= caldate{t}-dt_last_test <= 0.5 then do;
					r=uniform(0); 
					if r < (1-eff_rate_choose_stop_prep) then do; prep=1; dt_prep_e=caldate{t}; continuous_prep_use = continuous_prep_use + (0.25);end;
					else if r >= (1-eff_rate_choose_stop_prep) then do; stop_prep_choice=1; continuous_prep_use=0; end;*variable for people who discontinued despite newp>1; 
				end;
			end;
			else if annual_testing_prep=0.25 then do;
				if 0 <= caldate{t}-dt_last_test <= 0.25 then do;
					r=uniform(0); 
					if r < (1-eff_rate_choose_stop_prep) then do; prep=1; dt_prep_e=caldate{t};continuous_prep_use = continuous_prep_use + (0.25); end;
					else if r >= (1-eff_rate_choose_stop_prep) then do; stop_prep_choice=1; continuous_prep_use=0; end; *variable for people who discontinued despite newp>1; 
				end;
			end;
		end;
		else if prep_tm1 ne 1 then do;
			*if people discontinued even if they had newp>1 previously (stop_prep_choice=1), then the probability of restart is
			given by eff_prob_prep_restart_choice. if they discontinued because they were no longer eligible (no partners in a period and also
			stop_prep_choice ne 1) then the probability of restart is given by prob_prep_restart;
			*dt_prep_rs = date of prep restart (to count number of prep re-initiations);

			if tested=1 then do; * dependent_on_time_step_length;
				if stop_prep_choice=1 then do;
				r=uniform(0); 
				if r < eff_prob_prep_restart_choice then do; prep=1; continuous_prep_use=0.25; dt_prep_e=caldate{t}; dt_prep_rs=caldate{t}; stop_prep_choice=0; end;
				end; 
				else if stop_prep_choice ne 1 then do;
				r=uniform(0); 
				if r < prob_prep_restart then do; prep=1; dt_prep_e=caldate{t}; continuous_prep_use=0.25; dt_prep_c=caldate{t}; end;  * dt_prep_c is prep continuation in the sense
				that they are now continuing prep again now they have np >= 1; 
				end;
			end;
		end; 
	end;
end;

if prep=0 then continuous_prep_use=0;

if pop_wide_tld=1 and prep=1 then pop_wide_tld_prep=1; 


* tld initiation in person without hiv or with hiv but undiagnosed - note this can be in a person with hiv who has not tested;
if pop_wide_tld = 1 and registd ne 1 and ( prep_elig = 1 or ( ever_newp = 1 and ever_tested ne 1 ) ) then do;  

	if prep_ever ne 1 then do;   * dependent_on_time_step_length; 
			r=uniform(0); if (prep_willing_pop=1 or  (sw=1 and prep_willing_sw=1 )) and r < prob_prep_pop_wide_tld then do ;

* ts1m ; * replace line above with this:
*			r=uniform(0); * if (prep_willing_pop=1 or  (sw=1 and prep_willing_sw=1 )) and r < ( 1 - (1 - prob_prep_pop_wide_tld)**(1/3) ) then do ;

			prep   =1; pop_wide_tld_prep=1;  prep_ever=1; dt_prep_s=caldate{t}; dt_prep_e=caldate{t};
			end;
	end;*LBM Jul19;

	if prep_ever = 1 and dt_prep_s ne caldate{t} then do;   * dependent_on_time_step_length;
			if r < (1-eff_rate_choose_stop_prep) then do; prep   =1; pop_wide_tld_prep=1; dt_prep_e=caldate{t}; end;
			if r >= (1-eff_rate_choose_stop_prep) then do; stop_prep_choice=1; pop_wide_tld_prep=0; end; 

			if stop_prep_choice=1 then do;
				r=uniform(0); 
				if r < eff_prob_prep_restart_choice then do;  * dependent_on_time_step_length;
					prep   =1;pop_wide_tld_prep=1; dt_prep_e=caldate{t}; dt_prep_rs=caldate{t}; stop_prep_choice=0; 
				end;
			end; 
			else if stop_prep_choice ne 1 then do;
				r=uniform(0); 
				if r < prob_prep_restart then do;  * dependent_on_time_step_length;
					prep   =1; pop_wide_tld_prep=1; dt_prep_e=caldate{t}; dt_prep_c=caldate{t};
				end;  
				* dt_prep_c is prep continuation in the sense that they are now continuing prep again now they have np >= 1; 
			end;
	end;*LBM Jul19;
end;

if pop_wide_tld_prep=1 then do; if date_start_tld_prep = . then date_start_tld_prep = caldate{t}; end;



* prep_falseneg var - Mar2017 f_prep;
* use this var to ensure that these people who incorrectly start PrEP are not diagnosed later in the program;
if hiv=1 and unisensprep > sens_vct then prep_falseneg=1;


*PrEP clinic visits - modified Jan2017 f_prep;
if caldate{t} ge date_prep_intro and registd ne 1 and prep_elig=1 and pop_wide_tld ne 1 then do;
	if prep   =0 then do;
		if prep_ever ne 1 then visit_prep=.;
		else if prep_ever=1 and (prep_tm1 =1) then visit_prep=0;
	end;
	if prep   =1 then do;
		r=uniform(0);
		visit_prep=1; *drug pick-up only;
		if tested=1 then do;
			visit_prep=2; *drug pick-up and HIV test;
			if r < prob_prep_visit_counsel then visit_prep=3; *drug pick-up and counselling;
		end;

	end;
end;

if pop_wide_tld_prep=1 and ((tld_last_egfr=. and caldate{t} - dt_prep_s > 1) or (caldate{t} - tld_last_egfr > 1)) then do;
r=uniform(0); if r < pop_wide_tld_prob_egfr then visit_prep=2; * note this is for egfr only not an hiv test;
end;

* effect of weight gain due to use of dol as prep;
if i_mort_risk_dol_prep_weightg = . then i_mort_risk_dol_prep_weightg = 1.00 ;	
r = uniform(0);
if caldate{t} = date_start_tld_prep and r < prop_bmi_ge23 then do;  
		bmi_gt23_start_dol=1; 
		if incr_mort_risk_dol_weightg = 1 then i_mort_risk_dol_prep_weightg = 1.00 ; 
		if incr_mort_risk_dol_weightg = 1.1 then i_mort_risk_dol_prep_weightg = 1.03 ;  
		if incr_mort_risk_dol_weightg = 2 then i_mort_risk_dol_prep_weightg = 1.05 ;  
		if incr_mort_risk_dol_weightg = 2.1 then i_mort_risk_dol_prep_weightg = 1.07 ;
		if incr_mort_risk_dol_weightg = 2.2 then i_mort_risk_dol_prep_weightg = 1.10 ;  
		if incr_mort_risk_dol_weightg = 3 then i_mort_risk_dol_prep_weightg = 1.15 ;  
		if incr_mort_risk_dol_weightg = 4 then i_mort_risk_dol_prep_weightg = 1.25 ;  
end;


*Adherence to PrEP - modified Jan2017 f_prep;
if prep = 1 then do;
	adh=adhav_pr + adhvar*normal(0);  if adh gt 1 then adh=1; if adh < 0 then adh=0;
	if adhav_pr=0 then adh=0;
	*if adh ge 0.75 then adh=0.95; *based on conversation with Sheena McCormack and John Mellors - commented out as prep effectiveness too good otherwise for hets;
	*added age effect - adolescents to be 50% less likely to adhere;
	if age > 25 then do;
		f=uniform(0);
		if f<0.5 then adh = adh + ((1-adh) * factor_prep_adh_older) ;
	end;
end;

* this could be modified so that we account for suboptimal adherence to prep - so we could make prep a continuous variable
between 0 and 1 rather than binary 0 or 1; 
* assume for now that prep is tenofovir/ftc;

prep_all_past_year=.;
if prep   =1 then do; 
tot_yrs_prep = tot_yrs_prep+0.25; * dependent_on_time_step_length ;  
* ts1m ; * change this line to: 
tot_yrs_prep = tot_yrs_prep + (1/12);
;



prep_effectiveness_non_res_v = adh* eff_adh_prep ;
if t ge 4 and prep_tm1 =1 and continuous_prep_use >= 1 then prep_all_past_year=1;
* dependent_on_time_step_length ;  
end;






* RISK OF NEW INFECTED PARTNER PER NEW PARTNER; 
*  - men ; 




age_newp=.;

								   

/*
w15m15 =0.865*s_m_1524_newp; w15m25=0.47*s_m_2534_newp; w15m35=0.30*s_m_3544_newp; w15m45=0.43*s_m_4554_newp; w15m55=0.18*s_m_5564_newp;
w25m15 =0.11 *s_m_1524_newp; w25m25=0.43*s_m_2534_newp; w25m35=0.50*s_m_3544_newp; w25m45=0.30*s_m_4554_newp; w25m55=0.18*s_m_5564_newp;
w35m15 =0.025*s_m_1524_newp; w35m25=0.10*s_m_2534_newp; w35m35=0.20*s_m_3544_newp; w35m45=0.23*s_m_4554_newp; w35m55=0.27*s_m_5564_newp;
w45m15 =0.00 *s_m_1524_newp; w45m25=0.00*s_m_2534_newp; w45m35=0.00*s_m_3544_newp; w45m45=0.03*s_m_4554_newp; w45m55=0.27*s_m_5564_newp;
w55m15 =0.00 *s_m_1524_newp; w55m25=0.00*s_m_2534_newp; w55m35=0.00*s_m_3544_newp; w55m45=0.01*s_m_4554_newp; w55m55=0.10*s_m_5564_newp;
*/

if gender=1 and sex_age_mixing_matrix_m=1 then do;
if 15 <= age < 25 then do;e=uniform(0); 
if              e < 0.865  then do; risk_nippnp = t_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.865<= e < 0.975  then do; risk_nippnp = t_prop_newp_i_w_2534; age_newp=2;end;
else if 0.975<= e          then do; risk_nippnp = t_prop_newp_i_w_3544; age_newp=3; end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.47 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.47 <= e < 0.90 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3 ;end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.30 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.30 <= e < 0.80 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.80 <= e < 1.00 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 1.00 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.43 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.43 <= e < 0.73 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.73 <= e < 0.96 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.96 <= e < 0.99 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.99 <= e        then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.18 then do; risk_nippnp = t_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.18 <= e < 0.36 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.36 <= e < 0.63 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.63 <= e < 0.90 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.90 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
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
if      15 <= age < 25 then do;e=uniform(0);
if              e < 0.43 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.43 <= e < 0.77 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.77 <= e < 0.89 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.89 <= e < 0.99 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.99 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.09 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.09 <= e < 0.58 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.58 <= e < 0.88 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.88 <= e < 0.98 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.98 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.28 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.28 <= e < 0.62 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.62 <= e < 0.87 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.87 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
	
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
if 15 <= age < 25 then do;e=uniform(0); * dec17;
if              e < 0.865 /*(then newp age 15-25)*/ then do; risk_nippnp = t_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.865<= e < 0.975 /*(then newp age 25-35)*/ then do; risk_nippnp = t_prop_newp_i_w_2534; age_newp=2;end;
else if 0.975<= e         /*(then newp age 35-45)*/ then do; risk_nippnp = t_prop_newp_i_w_3544; age_newp=3; end; 
																												  
																												  
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.47 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.47 <= e < 0.90 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e < 1.00 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3 ;end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.20 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.20 <= e < 0.55 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.55 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.15 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.15 <= e < 0.38 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.38 <= e < 0.63 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.63 <= e < 0.93 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.93 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = t_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.13 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.13 <= e < 0.38 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.38 <= e < 0.68 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.68 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
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
if      15 <= age < 25 then do;e=uniform(0);
if              e < 0.43 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.43 <= e < 0.845 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.845 <= e < 0.965 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.965 <= e < 0.995 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.995 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.09 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.09 <= e < 0.59 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.59 <= e < 0.94 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.94 <= e < 0.99 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.99 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.28 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.28 <= e < 0.62 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.62 <= e < 0.87 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.87 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <=1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <=1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
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
if 15 <= age < 25 then do;e=uniform(0); 
if              e < 0.90   then do; risk_nippnp = t_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.90 <= e < 0.95   then do; risk_nippnp = t_prop_newp_i_w_2534; age_newp=2;end;
else if 0.95 <= e < 0.97   then do; risk_nippnp = t_prop_newp_i_w_3544; age_newp=3; end; 
else if 0.97 <= e < 0.99   then do; risk_nippnp = t_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.99 <= e          then do; risk_nippnp = t_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.44 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.44 <= e < 0.87 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.87 <= e < 0.97 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3 ;end; 
else if 0.97 <= e < 0.99   then do; risk_nippnp = t_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.99 <= e          then do; risk_nippnp = t_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.20 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.20 <= e < 0.54 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.54 <= e < 0.94 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.94 <= e <= 0.99 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.99 <= e          then do; risk_nippnp = t_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.15 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.15 <= e < 0.38 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.38 <= e < 0.63 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.63 <= e < 0.93 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.93 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = t_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.13 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.13 <= e < 0.38 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.38 <= e < 0.68 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.68 <= e        then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
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
if      15 <= age < 25 then do;e=uniform(0);
if              e < 0.25 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.25 <= e < 0.80 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.80 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.95 <= e < 0.98 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.98 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.09 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.09 <= e < 0.59 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.59 <= e < 0.94 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.94 <= e < 0.99 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.99 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.28 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.28 <= e < 0.62 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.62 <= e < 0.87 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.87 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
	
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
if 15 <= age < 25 then do;e=uniform(0); 
if              e < 0.93   then do; risk_nippnp = t_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.93 <= e < 0.98   then do; risk_nippnp = t_prop_newp_i_w_2534; age_newp=2;end;
else if 0.98 <= e < 0.99   then do; risk_nippnp = t_prop_newp_i_w_3544; age_newp=3; end; 
else if 0.99 <= e          then do; risk_nippnp = t_prop_newp_i_w_4554; age_newp=4; end; 
else if 1.00 <  e          then do; risk_nippnp = t_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.90 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e < 0.98 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3 ;end; 
else if 0.98 <= e < 0.99   then do; risk_nippnp = t_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.99 <= e          then do; risk_nippnp = t_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.20 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.20 <= e < 0.54 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.54 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e        then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 1.00 <  e          then do; risk_nippnp = t_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.15 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.15 <= e < 0.35 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.35 <= e < 0.60 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.60 <= e < 0.97 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.97 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = t_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.13 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.13 <= e < 0.33 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.33 <= e < 0.73 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.73 <= e        then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
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
if      15 <= age < 25 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.60 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.60 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.95 <= e < 0.98 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.98 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.55 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.55 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.95 <= e < 0.98 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.98 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.03 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.03 <= e < 0.08 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.08 <= e < 0.65 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.65 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
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
if 15 <= age < 25 then do;e=uniform(0); 
if              e < 0.94   then do; risk_nippnp = t_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.94 <= e < 0.99   then do; risk_nippnp = t_prop_newp_i_w_2534; age_newp=2;end;
else if 0.99 <= e <= 1.00   then do; risk_nippnp = t_prop_newp_i_w_3544; age_newp=3; end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.90 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e < 0.98 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3 ;end; 
else if 0.98 <= e < 0.99   then do; risk_nippnp = t_prop_newp_i_w_4554; age_newp=4; end; 
else if 0.99 <= e          then do; risk_nippnp = t_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.40 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.40 <= e < 0.80 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.80 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e < 0.99 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.99 <  e          then do; risk_nippnp = t_prop_newp_i_w_5564; age_newp=5; end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.30 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.30 <= e < 0.60 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.60 <= e < 0.85 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.85 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.95 <= e         then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.30 then do; risk_nippnp = t_prop_newp_i_w_1524;   age_newp=1;end; 
else if 0.30 <= e < 0.60 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.60 <= e < 0.90 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.90 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
else if 0.95 <= e        then do; risk_nippnp = t_prop_newp_i_w_5564;   age_newp=5;end; 
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
if      15 <= age < 25 then do;e=uniform(0);
if              e < 0.05 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.05 <= e < 0.50 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.50 <= e < 0.80 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.80 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.01 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.01 <= e < 0.41 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.41 <= e < 0.80 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.80 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.01 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.01 <= e < 0.08 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.08 <= e < 0.55 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.55 <= e < 0.85 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.85 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
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
if 15 <= age < 25 then do;e=uniform(0); 
if              e < 0.94   then do; risk_nippnp = t_prop_newp_i_w_1524; age_newp=1;end; 
else if 0.94 <= e < 0.99   then do; risk_nippnp = t_prop_newp_i_w_2534; age_newp=2;end;
else if 0.99 <= e <= 1.00   then do; risk_nippnp = t_prop_newp_i_w_3544; age_newp=3; end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.90 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.90 <= e < 0.98 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3 ;end; 
else if 0.98 <= e <= 1.00   then do; risk_nippnp = t_prop_newp_i_w_4554; age_newp=4; end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.85 then do; risk_nippnp = t_prop_newp_i_w_2534;  age_newp=2; end; 
else if 0.85 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.85 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.85 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.50 then do; risk_nippnp = t_prop_newp_i_w_1524;  age_newp=1; end; 
else if 0.50 <= e < 0.85 then do; risk_nippnp = t_prop_newp_i_w_2534;   age_newp=2;end; 
else if 0.85 <= e < 0.95 then do; risk_nippnp = t_prop_newp_i_w_3544;   age_newp=3;end; 
else if 0.95 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_w_4554;   age_newp=4;end; 
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
if      15 <= age < 25 then do;e=uniform(0);
if              e < 0.20 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.20 <= e < 0.40 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.40 <= e < 0.60 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.60 <= e < 0.80 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.80 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 25 <= age < 35 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.25 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.25 <= e < 0.50 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.50 <= e < 0.75 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 35 <= age < 45 then do;e=uniform(0);
if              e < 0.01 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.01 <= e < 0.02 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.02 <= e < 0.34 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.34 <= e < 0.67 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.67 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 45 <= age < 55 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.05 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.05 <= e < 0.75 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.75 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;
else if 55 <= age < 65 then do;e=uniform(0);
if              e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_1524;   age_newp=1;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_2534;   age_newp=2;end; 
else if 0.00 <= e < 0.00 then do; risk_nippnp = t_prop_newp_i_m_3544;   age_newp=3;end; 
else if 0.00 <= e < 0.10 then do; risk_nippnp = t_prop_newp_i_m_4554;   age_newp=4;end; 
else if 0.10 <= e <= 1.00 then do; risk_nippnp = t_prop_newp_i_m_5564;   age_newp=5;end; 
end;

end;





*--------------------------------------------------------------------------------------------------------------------;

* NUMBER OF NEW INFECTED PARTNERS ;
* risk of infected partner per new partner;
nip=0;
if risk_nippnp*newp > 0 then do;
	nip = min(ranpoi(0,risk_nippnp*newp),newp);
end;


* probability of infection from infected new partner;

u1=0; u2=0; u3=0; u4=0; u5=0; u6=0;

if gender=1 and age_newp=1 then do;
u1=t_prop_ageg1_w_vlg1; u2=t_prop_ageg1_w_vlg2; u3=t_prop_ageg1_w_vlg3; u4=t_prop_ageg1_w_vlg4; u5=t_prop_ageg1_w_vlg5; u6=t_prop_ageg1_w_vlg6;
end;
if gender=1 and age_newp=2 then do;
u1=t_prop_ageg2_w_vlg1; u2=t_prop_ageg2_w_vlg2; u3=t_prop_ageg2_w_vlg3; u4=t_prop_ageg2_w_vlg4; u5=t_prop_ageg2_w_vlg5; u6=t_prop_ageg2_w_vlg6;
end;
if gender=1 and age_newp=3 then do;
u1=t_prop_ageg3_w_vlg1; u2=t_prop_ageg3_w_vlg2; u3=t_prop_ageg3_w_vlg3; u4=t_prop_ageg3_w_vlg4; u5=t_prop_ageg3_w_vlg5; u6=t_prop_ageg3_w_vlg6;
end;
if gender=1 and age_newp=4 then do;
u1=t_prop_ageg4_w_vlg1; u2=t_prop_ageg4_w_vlg2; u3=t_prop_ageg4_w_vlg3; u4=t_prop_ageg4_w_vlg4; u5=t_prop_ageg4_w_vlg5; u6=t_prop_ageg4_w_vlg6;
end;
if gender=1 and age_newp=5 then do;
u1=t_prop_ageg5_w_vlg1; u2=t_prop_ageg5_w_vlg2; u3=t_prop_ageg5_w_vlg3; u4=t_prop_ageg5_w_vlg4; u5=t_prop_ageg5_w_vlg5; u6=t_prop_ageg5_w_vlg6;
end;

if gender=2 and age_newp=1 then do;
u1=t_prop_ageg1_m_vlg1; u2=t_prop_ageg1_m_vlg2; u3=t_prop_ageg1_m_vlg3; u4=t_prop_ageg1_m_vlg4; u5=t_prop_ageg1_m_vlg5; u6=t_prop_ageg1_m_vlg6;
end;
if gender=2 and age_newp=2 then do;
u1=t_prop_ageg2_m_vlg1; u2=t_prop_ageg2_m_vlg2; u3=t_prop_ageg2_m_vlg3; u4=t_prop_ageg2_m_vlg4; u5=t_prop_ageg2_m_vlg5; u6=t_prop_ageg2_m_vlg6;
end;
if gender=2 and age_newp=3 then do;
u1=t_prop_ageg3_m_vlg1; u2=t_prop_ageg3_m_vlg2; u3=t_prop_ageg3_m_vlg3; u4=t_prop_ageg3_m_vlg4; u5=t_prop_ageg3_m_vlg5; u6=t_prop_ageg3_m_vlg6;
end;
if gender=2 and age_newp=4 then do;
u1=t_prop_ageg4_m_vlg1; u2=t_prop_ageg4_m_vlg2; u3=t_prop_ageg4_m_vlg3; u4=t_prop_ageg4_m_vlg4; u5=t_prop_ageg4_m_vlg5; u6=t_prop_ageg4_m_vlg6;
end;
if gender=2 and age_newp=5 then do;
u1=t_prop_ageg5_m_vlg1; u2=t_prop_ageg5_m_vlg2; u3=t_prop_ageg5_m_vlg3; u4=t_prop_ageg5_m_vlg4; u5=t_prop_ageg5_m_vlg5; u6=t_prop_ageg5_m_vlg6;
end;


* if no infected people in age and gender group chosen then use non age-specific distribution ;
if u1+u2+u3+u4+u5+u6=0 then do;
if gender=2 then do; u1=t_prop_m_vlg1; u2=t_prop_m_vlg2; u3=t_prop_m_vlg3; u4=t_prop_m_vlg4; u5=t_prop_m_vlg5; u6=t_prop_m_vlg6; end;
if gender=1 then do; u1=t_prop_w_vlg1; u2=t_prop_w_vlg2; u3=t_prop_w_vlg3; u4=t_prop_w_vlg4; u5=t_prop_w_vlg5; u6=t_prop_w_vlg6; end;
end;


* mar19 if exposed elsewhere externaly, partners may be less likely to be suppressed, i.e u1=lower % supressed;
if exp_set_lower_p_v1000_in_period = 1 then do;   
u1 = u1 / external_exp_factor; 
end;


cu_1=.;cu_2=.;cu_3=.;cu_4=.;cu_5=.;cu_6=.;
cu_1=u1;cu_2=cu_1+u2;cu_3=cu_2+u3;cu_4=cu_3+u4;cu_5=cu_4+u5; cu_6=cu_5+u6;

*   vlg1 < 2.7    vlg2  2.7-3.7  vlg3  3.7-4.7   vlg4  4.7-5.7    vlg5  > 5.7    vlg6  primary;


if hiv=1 then s_infection=0;

*NNRTI resistance modelled separately as K103N, Y181C and G190A, rather than c_rtnnm   ;
k103m=.;  y181m=.;  g190m=.;  k65m=.;  m184m=.;  q151m=.; tam=.;  p32m=.; p33m=.; p46m=.; p47m=.;  p50lm=.; p50vm=.; 
p54m=.;   p76m=.;   p82m=.;   p84m=.;  p88m=.;   p90m=.;  inpm=.; insm=.;
k103m_p=.;  y181m_p=.;  g190m_p=.;  k65m_p=.;  m184m_p=.;  q151m_p=.;  tam_p=.;  p32m_p=.;  p33m_p=.;  p46m_p=.;  p47m_p=.; 
p50lm_p=.;  p50vm_p=.;  p54m_p=.;   p76m_p=.;  p82m_p=.;   p84m_p=.;   p88m_p=.; p90m_p=.;  inpm_p=.;  insm_p=.;

*prob infection in 3mths from the infected partner;


if t ge 2 and nip gt 0 then do;
	d=1;do until (d gt nip);
		risk_nip=0;  * dependent_on_time_step_length ;  
		a=uniform(0);
		if                   a < cu_1/cu_6 then do; risk_nip = max(0,(tr_rate_undetec_vl*fold_tr_newp)+(0.000025*normal(0))); vl_source=1; t_prop_rm=t_prop_vlg1_rm; end; *new for prep;
		else if cu_1/cu_6 <= a < cu_2/cu_6 then do; risk_nip = max(0,(0.01*fold_tr*fold_tr_newp)+(0.0025*normal(0)));       vl_source=2; t_prop_rm=t_prop_vlg2_rm; end; *new for prep;
		else if cu_2/cu_6 <= a < cu_3/cu_6 then do; risk_nip = max(0,(0.03*fold_tr*fold_tr_newp)+(0.0075*normal(0)));       vl_source=3; t_prop_rm=t_prop_vlg3_rm; end; *new for prep;
		else if cu_3/cu_6 <= a < cu_4/cu_6 then do; risk_nip = max(0,(0.06*fold_tr*fold_tr_newp)+(0.015*normal(0)));        vl_source=4; t_prop_rm=t_prop_vlg4_rm; end; *new for prep;
		else if cu_4/cu_6 <= a < cu_5/cu_6 then do; risk_nip = max(0,(0.10*fold_tr*fold_tr_newp)+(0.025*normal(0)));        vl_source=5; t_prop_rm=t_prop_vlg5_rm; end; *new for prep;
		else if cu_5/cu_6 <= a < cu_6/cu_6 then do; risk_nip = max(0,(tr_rate_primary*fold_tr_newp)+(0.075*normal(0)));       vl_source=6; t_prop_rm=t_prop_vlg6_rm; end; *new for prep;
/*
* ts1m ; * replace lines above with:

		if                   a < cu_1/cu_6 then do; risk_nip = max(0,(( 1 - (1 - tr_rate_undetec_vl)**(1/3) )*fold_tr_newp)+(0.000025*normal(0))); vl_source=1; s_prop_rm=s_prop_vlg1_rm; end; *new for prep;
		else if cu_1/cu_6 <= a < cu_2/cu_6 then do; risk_nip = max(0,(     ( 1 - (1 - 0.01)**(1/3) )     *fold_tr*fold_tr_newp)+(0.0025*normal(0)));       vl_source=2; s_prop_rm=s_prop_vlg2_rm; end; *new for prep;
		else if cu_2/cu_6 <= a < cu_3/cu_6 then do; risk_nip = max(0,(( 1 - (1 - 0.03)**(1/3) )*fold_tr*fold_tr_newp)+(0.0075*normal(0)));       vl_source=3; s_prop_rm=s_prop_vlg3_rm; end; *new for prep;
		else if cu_3/cu_6 <= a < cu_4/cu_6 then do; risk_nip = max(0,(( 1 - (1 - 0.06)**(1/3) )*fold_tr*fold_tr_newp)+(0.015*normal(0)));        vl_source=4; s_prop_rm=s_prop_vlg4_rm; end; *new for prep;
		else if cu_4/cu_6 <= a < cu_5/cu_6 then do; risk_nip = max(0,(( 1 - (1 - 0.10)**(1/3) )*fold_tr*fold_tr_newp)+(0.025*normal(0)));        vl_source=5; s_prop_rm=s_prop_vlg5_rm; end; *new for prep;
		else if cu_5/cu_6 <= a < cu_6/cu_6 then do; risk_nip = max(0,(( 1 - (1 - tr_rate_primary)**(1/3) )*fold_tr_newp)+(0.075*normal(0)));       vl_source=6; s_prop_rm=s_prop_vlg6_rm; end; *new for prep;
*/

* NOTE: if the partner is in VL_source=6 (ie in primary infection) we should really check whether the partner was on prep (despite being infected) at the time
of transmission.  if so, the tr_rate_primary should be lowered;

		  m184m_p=0; tam_p=0;   k65m_p=0;  q151m_p=0; k103m_p=0;  y181m_p=0;  g190m_p=0;  
		  p32m_p=0;  p33m_p=0;  p46m_p=0;  p47m_p=0;  p50lm_p=0;  p50vm_p=0;  p54m_p=0;  
		  p76m_p=0;  p82m_p=0;  p84m_p=0;  p88m_p=0;  p90m_p=0;   inpm_p=0;   insm_p=0;
		  mut_p=.;

		  e=uniform(0); if e < t_prop_rm  then do;
			*in order to have at least one mutation for all subjects who are supposed to have at least one;

		  f=1;do until ((f=10) or (mut_p ge 1));  

		  * resistance virus in partner - tams;

                * resistance virus in partner - tams;
                t_prop_tam = t_prop_tam1+t_prop_tam2+t_prop_tam3;
                g=uniform(0);
                if g < t_prop_tam  then  do; tam_p=max(1,ranpoi(0,1)); if tam_p ge 6 then tam_p=6;end;

				* resistance virus in partner - 184m;
				g=uniform(0);
				if g < t_prop_m184m  then m184m_p=1;
	
				* resistance virus in partner - k65m;
				g=uniform(0);
				if g < t_prop_k65m  then k65m_p=1;
	
				* resistance virus in partner - q151m;
				g=uniform(0);
				if g < t_prop_q151m  then q151m_p=1;

				* resistance virus in partner - nnrti;
				g=uniform(0);
				if g < t_prop_k103m then k103m_p=1;

				g=uniform(0);
				if g < t_prop_y181m then y181m_p=1;

				g=uniform(0);
				if g < t_prop_g190m then g190m_p=1;

				* resistance virus in partner - pr 32;
				g=uniform(0);
				if g < t_prop_p32m  then p32m_p=1;

				* resistance virus in partner - pr 33;
				g=uniform(0);
				if g < t_prop_p33m  then p33m_p=1;

				* resistance virus in partner - pr 46;
				g=uniform(0);
				if g < t_prop_p46m  then p46m_p=1;

				* resistance virus in partner - pr 47;
				g=uniform(0);
				if g < t_prop_p47m  then p47m_p=1;

				* resistance virus in partner - pr 50l;
				g=uniform(0);
				if g < t_prop_p50lm  then p50lm_p=1;

				* resistance virus in partner - pr 50v;
				g=uniform(0);
				if g < t_prop_p50vm  then p50vm_p=1;

				* resistance virus in partner - pr 54;
				g=uniform(0);
				if g < t_prop_p54m  then p54m_p=1;

				* resistance virus in partner - pr 76;
				g=uniform(0);
				if g < t_prop_p76m  then p76m_p=1;

				* resistance virus in partner - pr 82;
				g=uniform(0);
				if g < t_prop_p82m  then p82m_p=1;

				* resistance virus in partner - pr 84;
				g=uniform(0);
				if g < t_prop_p84m  then p84m_p=1;

				* resistance virus in partner - pr 88;
				g=uniform(0);
				if g < t_prop_p88m  then p88m_p=1;

				* resistance virus in partner - pr 90;
				g=uniform(0);
				if g < t_prop_p90m  then p90m_p=1;

				* resistance virus in partner - Integrase inhibitor primary mut;
				g=uniform(0);
				if g < t_prop_inpm  then inpm_p=1;

				* resistance virus in partner - Integrase inhibitor secondary mut;
				g=uniform(0);
				if g < t_prop_insm  then insm_p=1;

				mut_p = tam_p + m184m_p + k65m_p + q151m_p + k103m_p + y181m_p + g190m_p 
				+ p32m_p + p33m_p + p46m_p + p47m_p + p50lm_p + p50vm_p + p54m_p 
				+ p76m_p + p82m_p + p84m_p + p88m_p + p90m_p  + inpm_p  + insm_p;

				f=f+1;
			end;  
		end;


		if gender=2 and       age >= 20 then risk_nip = risk_nip * fold_change_w;  * higher transmission risk in women;
		if gender=2 and 15 <= age <  20 then risk_nip = risk_nip * fold_change_yw;  * higher transmission risk in women;
		if sti=1                        then risk_nip = risk_nip * fold_change_sti;  * higher transmission risk with sti;
		if gender=1 and mcirc   =1         then risk_nip = risk_nip * 0.4;  * lower transmission risk in men circumcised;
		if prep   =1 then do; 
			if m184m_p ne 1 and k65m_p ne 1 and tam_p<3 then risk_nip = risk_nip * (1-(adh * eff_adh_prep));
			if m184m_p ne 1 and k65m_p ne 1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh * eff_adh_prep));
			if m184m_p=1 and k65m_p ne 1 and tam_p<3 then risk_nip = risk_nip * (1-(adh * eff_adh_prep));
			if m184m_p ne 1 and k65m_p=1 and tam_p<3 then risk_nip = risk_nip * (1-(adh * eff_adh_prep));
			if m184m_p=1 and k65m_p ne 1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh * eff_adh_prep));
			if m184m_p ne 1 and k65m_p=1 and tam_p>=3 then risk_nip = risk_nip * (1-(adh * eff_adh_prep));
			if m184m_p=1 and k65m_p=1  then risk_nip = risk_nip * (1-(adh * 0.50 * eff_adh_prep));
			if m184m_p=1 and k65m_p=1 and (inpm_p ne 1 and pop_wide_tld_prep=1)  then risk_nip = risk_nip * (1-(adh * eff_adh_prep));
			if m184m_p=1 and k65m_p=1 and inpm_p = 1 and pop_wide_tld_prep=1  then risk_nip = risk_nip * (1-(adh * 0.5 * eff_adh_prep));

		end;


		a=uniform(0); if a < risk_nip then do;
		    if hiv=1 then do;
    		if onart    ne 1 then s_infection=1;  * may14 - added need to be off art to get super-infected;
			end;
			if hiv=0 then do;
				vl_source_inf = vl_source;
			    infected_primary=0;infected_vlsupp=0;
			    hiv=1; infected_newp=1; infected_ep=0; infection=caldate{t};* prob infected by person in primary;
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
if epi=1 then do;  * dependent_on_time_step_length ;  
	if epvls=1    then do; risk_eip = max(0,tr_rate_undetec_vl+(0.000025*normal(0)));          vl_source=1;	t_prop_rm=t_prop_vlg1_rm; end;
	if epvls ne 1 then do;
		if epi_tm1 =0 then do; risk_eip = max(0,tr_rate_primary+(0.075*normal(0))); ep_primary=1; vl_source=6;	t_prop_rm=t_prop_vlg6_rm; end;* infection in primary;
		if epi_tm1 =1 then do; risk_eip = max(0,(0.05*fold_tr)+(0.0125*normal(0)));               vl_source=4;	t_prop_rm=t_prop_vlg4_rm; end;
	end;* ie average risk for those with detectable vl;


* ts1m ; * replace lines above with:
*	if epvls=1    then do; * risk_eip = max(0,( 1 - (1 - tr_rate_undetec_vl)**(1/3) )+(0.000025/3*normal(0))); * vl_source=1;  *	s_prop_rm=s_prop_vlg1_rm; * end;
*	if epvls ne 1 then do;
*		if epi_tm1 =0 then do; * risk_eip = max(0,( 1 - (1 - tr_rate_primary)**(1/3) )+(0.075/3*normal(0))); * ep_primary=1; * vl_source=6;	* s_prop_rm=s_prop_vlg6_rm; * end;* infection in primary;
*		if epi_tm1 =1 then do; * risk_eip = max(0,(( 1 - (1 - 0.05)**(1/3) )*fold_tr)+(0.0125/3*normal(0))); * vl_source=4; * s_prop_rm=s_prop_vlg4_rm; * end;
*	end;* ie average risk for those with detectable vl;



		 *The definition of these variables to 0 has been moved before
		 e<t_prop_rm otherwise mut_p could refer to previous partners;

		  m184m_p=0;  tam_p=0;  k65m_p=0;  q151m_p=0; k103m_p=0; y181m_p=0;  g190m_p=0;  
		  p32m_p=0;   p33m_p=0; p46m_p=0;  p47m_p=0;  p50lm_p=0; p50vm_p=0;  p54m_p=0;  
		  p76m_p=0;   p82m_p=0; p84m_p=0;  p88m_p=0;  p90m_p=0;  inpm_p=0;   insm_p=0;
		  mut_p=.;

		  e=uniform(0); if e < t_prop_rm  then do;
			*in order to have at least one mutation for all subjects who are supposed to have at least one;

			f=1;do until ((f=10) or (mut_p ge 1));  

                * resistance virus in partner - tams;
                t_prop_tam = t_prop_tam1+t_prop_tam2+t_prop_tam3;
                g=uniform(0);
                if g < t_prop_tam  then  do; tam_p=max(1,ranpoi(0,1)); if tam_p ge 6 then tam_p=6;end;

				* resistance virus in partner - 184m;
				g=uniform(0);
				if g < t_prop_m184m  then m184m_p=1;
	
				* resistance virus in partner - k65m;
				g=uniform(0);
				if g < t_prop_k65m  then k65m_p=1;

				* resistance virus in partner - q151m;
				g=uniform(0);
				if g < t_prop_q151m  then q151m_p=1;

				* resistance virus in partner - nnrti;
				g=uniform(0);
				if g < t_prop_k103m then k103m_p=1;

				g=uniform(0);
				if g < t_prop_y181m then y181m_p=1;

				g=uniform(0);
				if g < t_prop_g190m then g190m_p=1;

				* resistance virus in partner - pr 32;
				g=uniform(0);
				if g < t_prop_p32m  then p32m_p=1;

				* resistance virus in partner - pr 33;
				g=uniform(0);
				if g < t_prop_p33m  then p33m_p=1;

				* resistance virus in partner - pr 46;
				g=uniform(0);
				if g < t_prop_p46m  then p46m_p=1;

				* resistance virus in partner - pr 47;
				g=uniform(0);
				if g < t_prop_p47m  then p47m_p=1;

				* resistance virus in partner - pr 50l;
				g=uniform(0);
				if g < t_prop_p50lm  then p50lm_p=1;

				* resistance virus in partner - pr 50v;
				g=uniform(0);
				if g < t_prop_p50vm  then p50vm_p=1;

				* resistance virus in partner - pr 54;
				g=uniform(0);
				if g < t_prop_p54m  then p54m_p=1;

				* resistance virus in partner - pr 76;
				g=uniform(0);
				if g < t_prop_p76m  then p76m_p=1;

				* resistance virus in partner - pr 82;
				g=uniform(0);
				if g < t_prop_p82m  then p82m_p=1;

				* resistance virus in partner - pr 84;
				g=uniform(0);
				if g < t_prop_p84m  then p84m_p=1;

				* resistance virus in partner - pr 88;
				g=uniform(0);
				if g < t_prop_p88m  then p88m_p=1;

				* resistance virus in partner - pr 90;
				g=uniform(0);
				if g < t_prop_p90m  then p90m_p=1;

				* resistance virus in partner - Integrase inhibitor primary mut;
				g=uniform(0);
				if g < t_prop_inpm  then inpm_p=1;

				* resistance virus in partner - Integrase inhibitor secondary mut;
				g=uniform(0);
				if g < t_prop_insm  then insm_p=1;

				mut_p = tam_p + m184m_p + k65m_p + q151m_p + k103m_p + y181m_p + g190m_p
				+  p32m_p + p33m_p + p46m_p + p47m_p + p50lm_p + p50vm_p + p54m_p 
				+ p76m_p +  p82m_p + p84m_p + p88m_p + p90m_p +  inpm_p + insm_p;

				f=f+1;
			end;  
		end;

	if gender=2 and age <  20 then risk_eip = risk_eip * fold_change_yw;* higher transmission risk in women;
	if gender=2 and age ge 20 then risk_eip = risk_eip * fold_change_w;  * higher transmission risk in women;
	if sti=1                  then risk_eip = risk_eip * fold_change_sti;  * higher transmission risk with sti;
	if gender=1 and mcirc   =1   then risk_eip = risk_eip* 0.4;  * lower transmission risk in men circumcised;

		if prep   =1 then do; 
			if m184m_p ne 1 and k65m_p ne 1 and tam_p<3 then risk_eip = risk_eip * (1-(adh * eff_adh_prep));
			if m184m_p ne 1 and k65m_p ne 1 and tam_p>=3 then risk_eip = risk_eip * (1-(adh * eff_adh_prep));
			if m184m_p=1 and k65m_p ne 1 and tam_p<3 then risk_eip = risk_eip * (1-(adh * eff_adh_prep));
			if m184m_p ne 1 and k65m_p=1 and tam_p<3 then risk_eip = risk_eip * (1-(adh * eff_adh_prep));
			if m184m_p=1 and k65m_p ne 1 and tam_p>=3 then risk_eip = risk_eip * (1-(adh * eff_adh_prep));
			if m184m_p ne 1 and k65m_p=1 and tam_p>=3 then risk_eip = risk_eip * (1-(adh * eff_adh_prep));
			if m184m_p=1 and k65m_p=1  then risk_eip = risk_eip * (1-(adh * 0.50 * eff_adh_prep));
			if m184m_p=1 and k65m_p=1 and (inpm_p ne 1 and pop_wide_tld_prep=1)  then risk_eip = risk_eip * (1-(adh * eff_adh_prep));
			if m184m_p=1 and k65m_p=1 and inpm_p = 1 and pop_wide_tld_prep=1  then risk_eip = risk_eip * (1-(adh * 0.5 * eff_adh_prep));

		end;

	b=uniform(0);
	if b < risk_eip then do;

		if hiv=0 then do;
			vl_source_inf = vl_source ;
			hiv=1; infected_ep=1;infected_newp=0; infection=caldate{t};
			infected_primary=0;	if ep_primary=1 then infected_primary=1;
			infected_vlsupp=0;  if vl_source=1 then infected_vlsupp=1;
			age_source_inf=ageg_ep;
			infected_prep=0; if prep   =1 then do; 
			infected_prep=1; infected_prep_source_prep_r=0; if (tam_p + m184m_p + k65m_p) ge 1 then infected_prep_source_prep_r=1; 
			end;
		end;
		if hiv=1 then do;
	    * prob infection in 3 mths;
		    a=uniform(0);b=uniform(0);
    		s_infection=0; if onart    ne 1 and b < risk_eip then s_infection=1;  * may14 - added need to be off art to get super-infected;
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
if ep_tm1=0 and ep=1 and epi    ne 1 then do;
	s=uniform(0);a=uniform(0);epi   =0;
	if s <  0.5 then do; if mr_epi   =1 then do; epi   =1; old=1 ;end;end;
	if a < prev then do; epi   =1; already=1; end;
	if epi   =1 then do;
		epdiag=0;
		if epdiag_tm1=1 then epdiag=1;
		if epdiag_tm1 ne 1 then do;
			epdiag=0; s=uniform(0);

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

			if s < j then epdiag=1;

			a=uniform(0);if (date_start_testing+3.5) <= caldate{t} then do;
				if s <  0.9 then epdiag=mr_epdiag;
				if s >=0.9 and a < j then epdiag=1;
			end;
		end;
		epart=0; if epdiag=1 then do; * remember some infected partners are lost to follow-up;
			if epart_tm1=1 then do; epart=0; f=uniform(0); if f < 0.98 then epart=1; end;
			if epart_tm1 ne 1 and epdiag=1 then do;
				epart=0; s=uniform(0);
				
					if 0    >  d_onart        then j=0;
					if 0    <= d_onart < 0.05 then j=p_diag_onart/5;
					if 0.05 <= d_onart < 0.1  then j=p_diag_onart/2;
					if 0.1  <= d_onart        then j=p_diag_onart;
					if    p_diag_onart > 0.95 then j=1;

				if art_intro_date <= caldate{t} and s < j  then epart=1;
			end;

		end;
		* rates of viral suppression;
		epvls=0; if epart=1 then do;
			if epvls_tm1=1 then do; epvls=1; f=uniform(0); if f < 0.03 then epvls=0; end;
			if epvls_tm1 ne 1 and epart=1 then do;
				if 0    > d_vls          then j=0;
				if 0.05 > d_vls >=  0    then j=p_onart_vls/5;  
				if 0.1  > d_vls >=  0.05 then j=p_onart_vls/2;  
				if        d_vls >=  0.1  then j=p_onart_vls;
				epvls=0; s=uniform(0); if s < j  then epvls=1;
			end;
		end;
	end;
end;

if infection = caldate{t} then age_infection = age;


* transmitted resistance;
xx77:   
if hiv=1 then do;

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

* xx33; 
end;

com_test=.;
if tested=1 and hiv ne 1 then do;
	cost_test= cost_test_c;
	u=uniform(0); if u lt 0.1365 and prep ne 1 then com_test=1;
	if com_test=1 then cost_test= cost_test_e;
	*Specificity of VCT: we simply assume that they will have a cost of a positive test, as treated as positive if the result is false positive;
	unispec=uniform(0);
	if unispec gt spec_vct                then cost_test=cost_test_b;
	if unispec gt spec_vct and com_test=1 then cost_test=cost_test_d;
end;

*separate cost for HIV-negative and HIV-positive people;
if tested=1   and hiv ne 1 and cost_test=0 then cost_test= cost_test_c;  



* INTRODUCE HIV INTO POPULATION ;

d=uniform(0);
if caldate{t}=startyr and newp >= newp_seed and d < 0.8   and infection=.  then do; 
		hiv=1; infected_primary=1;infected_diagnosed=0; infected_newp=1; age_source_inf=99;
		infected_ep=0;infection=caldate{t}; primary   =1;
		tam=0;   k103m=0; y181m=0; g190m=0; m184m=0; q151m=0; k65m=0;  p32m=0; p33m=0; p46m=0; p47m=0;  p50lm=0; 
		p50vm=0; p54m=0;  p76m=0;  p82m=0;  p84m=0;  p88m=0;  p90m=0;  inpm=0; insm=0;
end;






*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 3A - SETTING AND UPDATING VARIABLES FOR PEOPLE WITH HIV ;

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;





*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SET BASELINE VALUES AT TIME OF INFECTION;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


if caldate{t}=infection > . then do;

* visit - currently under hiv care ;
* nod = number of drugs on;
* tcur - time on current line of 3/4 ART - starts at 0 on t of start ;
* toffart - time since last stopped ART;
* linefail - this is failure however defined, based on monitoring approach;
* who3_ - pre-who4 symptoms;
* who4_ -  ever diagnosed with who4_ y/n;
* c_tox - current toxicity;
* newmut - risk of resistance arising (and dominating);
* x4v - X4 virus present or not;
* lost - patient visited clinic / under follow-up;
* tss_ = time since last stopping specific drugs;
* f_ = previous virological failure of drugs;
* o_ = currently on drug;
* p_ = previously taken drug;
* mr_ = for those off ART - drug used in most recent regimen ;
* r_ = level of resistance to each drug - determined by presence of mutations ;
* c_ = current resistance as majority virus;
* e_ = ever had mutation as dominant;
* t_ = previously stopped drug due to toxicity  ;
* resumec - indicates if cd4 has reached cmin after interruption and before toffart= 1 (ie 1 year);
* c_totmut - total current # mutations;
* e_totmut - total ever # mutations;


primary   =1;

* birth with infected child;
if gender=2 then do;
birth_with_inf_child=0;
child_with_resistant_hiv=0;
end;


* viral load;
vset = 4.075 + (0.5 * normal(0)) + ((age-35)*0.005) ;
if gender=2 then vset=vset-0.2;
if vset > 6.5 then vset=6.5;

* thought about giving women lower vl but this would affect progression - also do we know whether woman with given vl
is more or less infectious than man with the same vl ?;
vl = vset;

vprimary=7.5 + (0.5 * normal(0));
* vprimary exists only for transmission risk - it does not affect progression - vset is used for first v;


* CD4  - square root scale ;
csqr    = (mean_sqrtcd4_inf - (1.5 * vset) + 2*normal(0)) - ((age-35)*0.05);
if csqr    gt sqrt(1500) then csqr   =sqrt(1500); 
if csqr    lt 0 then csqr   =0;
if csqr    < 18 then csqr   =18; 
if cd4  < 324 then cd4 =324; cd4 =csqr**2;

cd4_infection=cd4 ;

* max CD4 count to which can return on ART;
cmax=exp(6.6+normal(0)*0.25);

patient_cd4_rise_art=exp(sd_patient_cd4_rise_art*normal(0));  * inter-patient variation in rate of CD4 rise - when CD4 is rising;

age_infection=age;

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


toffart=.;

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


* prep;  * these lines below needed for first period with hiv - keep them in;
if prep   =1 and pop_wide_tld_prep ne 1 then nactive=2-r_ten-r_3tc; 
if prep   =1 and pop_wide_tld_prep = 1 then nactive=3-r_ten-r_3tc-r_dol; 

*Infected_diagnosed and infected_naive
(the program below only determines whether a person is infected from a person diagnosed or 
naive or not, I would leave this as it is);

if vl_source_inf=1 and c_rm_inf=0 then do; t_prop_diag=t_prop_vlg1_rm0_diag;t_prop_naive=t_prop_vlg1_rm0_naive; end;
if vl_source_inf=1 and c_rm_inf=1 then do; t_prop_diag=t_prop_vlg1_rm1_diag;t_prop_naive=t_prop_vlg1_rm1_naive; end;

if vl_source_inf=2 and c_rm_inf=0 then do; t_prop_diag=t_prop_vlg2_rm0_diag;t_prop_naive=t_prop_vlg2_rm0_naive; end;
if vl_source_inf=2 and c_rm_inf=1 then do; t_prop_diag=t_prop_vlg2_rm1_diag;t_prop_naive=t_prop_vlg2_rm1_naive; end;

if vl_source_inf=3 and c_rm_inf=0 then do; t_prop_diag=t_prop_vlg3_rm0_diag;t_prop_naive=t_prop_vlg3_rm0_naive; end;
if vl_source_inf=3 and c_rm_inf=1 then do; t_prop_diag=t_prop_vlg3_rm1_diag;t_prop_naive=t_prop_vlg3_rm1_naive; end;

if vl_source_inf=4 and c_rm_inf=0 then do; t_prop_diag=t_prop_vlg4_rm0_diag;t_prop_naive=t_prop_vlg4_rm0_naive; end;
if vl_source_inf=4 and c_rm_inf=1 then do; t_prop_diag=t_prop_vlg4_rm1_diag;t_prop_naive=t_prop_vlg4_rm1_naive; end;

if vl_source_inf=5 and c_rm_inf=0 then do; t_prop_diag=t_prop_vlg5_rm0_diag;t_prop_naive=t_prop_vlg5_rm0_naive; end;
if vl_source_inf=5 and c_rm_inf=1 then do; t_prop_diag=t_prop_vlg5_rm1_diag;t_prop_naive=t_prop_vlg5_rm1_naive; end;

if vl_source_inf=6 and c_rm_inf=0 then do; t_prop_diag=t_prop_vlg6_rm0_diag;t_prop_naive=t_prop_vlg6_rm0_naive; end;
if vl_source_inf=6 and c_rm_inf=1 then do; t_prop_diag=t_prop_vlg6_rm1_diag;t_prop_naive=t_prop_vlg6_rm1_naive; end;

if infected_newp=1 then do;	
	infected_diagnosed=0; infected_naive=1;
	g=uniform(0);
    if g < t_prop_diag then infected_diagnosed=1;
	if infected_diagnosed=1 then do; 
		s=uniform(0);
		infected_naive=0; if s < t_prop_naive then infected_naive=1;
	end;
end;

if infected_ep=1 then do;
	infected_diagnosed=0; if epdiag_tm1=1 then infected_diagnosed=1;  
	infected_naive=1;
	if epart_tm1=1 then infected_naive=0;
	if epdiag_tm1=1 and epart_tm1=0 then do;
		* have to make this approximation below because dont track naive status of ep;
		a=uniform(0); infected_naive=0; if a < t_prop_naive then infected_naive=1;
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
onart   =0;
vmax = vl  ;
cmin    =cd4 ;
visit = .;
registd = 0;
naive=1;



*allow for diagnosis in primary infection, i.e. caldate{t}=infection;
*If HIV test type=3 (window period=3 months) then dont get diagnosed during primary infection ;
*If HIV test type=4 (window period=1 months) or HIV test type=1 (window period=10 days) then can get diagnosed during 
primary infection and hence stop prep;  

* ts1m - replace sens_primary below with sens_primary_ts1m ;


if t ge 2 then do; 

	if hivtest_type=4 then do;
		u=uniform(0);
		if primary   =1 and tested=1 and u lt sens_primary then do;
			registd=1; date1pos=caldate{t}; diagprim=caldate{t};
			visit   =1; lost   =0; cd4diag=cd4   ; if pop_wide_tld_prep ne 1 then onart   =0;
			if prep   =1 and pop_wide_tld_prep ne 1 then do;
				prep   =0; prep_ever=.; dt_prep_s=.; dt_prep_e=.; o_3tc=0; o_ten=0; tcur   =.; nactive=.;
			end;
		end;
	end;
	if hivtest_type=1 then do;
		u=uniform(0);
		if primary   =1 and tested=1 and u lt sens_primary then do;
			registd=1; date1pos=caldate{t}; diagprim=caldate{t};
			if prep   =1 and pop_wide_tld_prep ne 1 then do;
				prep   =0; prep_ever=.; dt_prep_s=.; dt_prep_e=.; o_3tc=0; o_ten=0; tcur   =.; nactive=.;
			end;  
		end;
	end;
end;



* note these lines only apply in period of infection;

if prep   =1 then do; o_3tc=1; o_ten=1; tcur   =0; end;
*I leave this command because I want those infected to be on 3tc and then until they are diagnosed,
but I copy this command above because I want those on prep who do not get infected to be on 3tc and ten;

* AP 21-7-19;  * note that onart=1 but registd = 0 ;
if prep = 1 and pop_wide_tld_prep=1 then do; onart   =1; time0=caldate{t}; yrart=time0;  started_art_as_tld_prep=1;
linefail=0; artline=1; tcur   =0;  line1=1;vfail1=0; naive=0; o_3tc=1; o_ten=1; o_dol=1; tcur   =0; 
o_zdv=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0; 
end;


* measured viral load;
vm = .;

* measured cd4 count;
cm = .;


x4v=0; c_tox = 0; who3_= 0; who4_= 0; 


end;



*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* UPDATING VARIABLES FOR PEOPLE WITH HIV ;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


if hiv=1 then do;



if t ge 2 and . < infection < caldate{t} < 2071.0 and dead_tm1 ne 1  then do;

sympt_diag=0;

c_tox_tm1=c_tox;   * current tox;
linefail_tm1 = linefail ;
artline_tm1 = artline ;
naive_tm1=naive;
interrupt_supply_tm1=interrupt_supply;
interrupt_choice_tm1=interrupt_choice;
interrupt_tm1 = interrupt;
return=0;
restart_tm1=restart; restart=0;
who3_tm1 = who3_;  * ever diagnosed with pre-who4_ symptoms y/n;
who4_tm1 = who4_; * ever diagnosed with who4_ y/n;
tb_tm2=tb_tm1; tb_tm1=tb;
vc_tm1=vc; vc=.;
cc_tm1=cc; cc=.;
vmax_tm1=vmax; 
x4v_tm1 = x4v; 
ccsqr_tm1=ccsqr;
csqr_tm1=csqr;
lost_tm1 = lost;
toffart_tm1=toffart;
nod_tm1=nod; nod=.;
nactive_tm1=nactive; nactive = .;
visit_tm1=visit;


* VISIT FREQUENCY  ;

	if lost_tm1 =1 then visit=0; * dependent_on_time_step_length ;  
   
	if onart   =1 then tcur   =tcur_tm1 +0.25;   
* ts1m:  	if onart   =1 then tcur   =tcur_tm1  + (1/12) ;
	if prep   =1 then tcur =  tcur_tm1 +0.25;   
* ts1m:  	if prep   =1 then tcur   =tcur_tm1  + (1/12) ;

	if prep   =0 and caldate{t} ge date_prep_intro and onart    ne 1 then tcur   =.;
	
	o_zdv_tm1=o_zdv; p_zdv_tm1=p_zdv; f_zdv_tm1=f_zdv; t_zdv_tm1=t_zdv; r_zdv_tm1=r_zdv;
	r_3tc_tm1=r_3tc; o_3tc_tm1=o_3tc; p_3tc_tm1=p_3tc; f_3tc_tm1=f_3tc; t_3tc_tm1=t_3tc;
	r_ten_tm1=r_ten; o_ten_tm1=o_ten; p_ten_tm1=p_ten; f_ten_tm1=f_ten; t_ten_tm1=t_ten;
	o_nev_tm2=o_nev_tm1; o_nev_tm1=o_nev;  p_nev_tm1=p_nev; f_nev_tm1=f_nev; t_nev_tm1=t_nev; r_nev_tm1=r_nev;
	o_efa_tm2=o_efa_tm1; o_efa_tm1=o_efa;  p_efa_tm1=p_efa; f_efa_tm1=f_efa; t_efa_tm1=t_efa; r_efa_tm1=r_efa; t_efa_tm1=t_efa;
	o_dar_tm1=o_dar; p_dar_tm1=p_dar; f_dar_tm1=f_dar; r_dar_tm1=r_dar;
	o_lpr_tm1=o_lpr; p_lpr_tm1=p_lpr; f_lpr_tm1=f_lpr; r_lpr_tm1=r_lpr; t_lpr_tm1=t_lpr;
	o_taz_tm1=o_taz; p_taz_tm1=p_taz; f_taz_tm1=f_taz; r_taz_tm1=r_taz; t_taz_tm1=t_taz;
    o_dol_tm3=o_dol_tm2; o_dol_tm2=o_dol_tm1; o_dol_tm1=o_dol;  p_dol_tm1=p_dol;f_dol_tm1=f_dol; t_dol_tm1=t_dol;r_dol_tm1=r_dol;

	vfail1_tm1 = vfail1;


	* this below includes for a person on ten-3tc prep at the time of adoption of pop wide tld prep;
	if prep = 1 and pop_wide_tld_prep = 1 then do;
	onart   =1; time0=caldate{t}; yrart=time0; started_art_as_tld_prep=1;
	linefail=0; artline=1; tcur  =0;  line1=1;vfail1=0; naive=0; o_3tc=1; o_ten=1; o_dol=1; 
	o_zdv=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0; 
	end;

	mr_zdv_tm1=mr_zdv; 	if tss_zdv ge 0 and o_zdv_tm1=0 then tss_zdv = tss_zdv+(1/12);
	mr_3tc_tm1=mr_3tc; if tss_3tc ge 0 and o_3tc_tm1=0 then tss_3tc = tss_3tc+(1/12);
	mr_ten_tm1=mr_ten; if tss_ten ge 0 and o_ten_tm1=0 then tss_ten = tss_ten+(1/12);
	mr_nev_tm1=mr_nev; if tss_nev ge 0 and o_nev_tm1=0 then tss_nev = tss_nev+(1/12);
	mr_dar_tm1=mr_dar; if tss_dar ge 0 and o_dar_tm1=0 then tss_dar = tss_dar+(1/12);
	mr_efa_tm1=mr_efa; if tss_efa ge 0 and o_efa_tm1=0 then tss_efa = tss_efa+(1/12);
	mr_lpr_tm1=mr_lpr; if tss_lpr ge 0 and o_lpr_tm1=0 then tss_lpr = tss_lpr+(1/12);
	mr_taz_tm1=mr_taz; if tss_taz ge 0 and o_taz_tm1=0 then tss_taz = tss_taz+(1/12);
	mr_dol_tm1=mr_dol; if tss_dol ge 0 and o_dol_tm1=0 then tss_dol = tss_dol+(1/12);

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
	
	if toffart_tm1 ge 0 and onart_tm1 =0 then do;
		toffart=toffart_tm1+0.25;   

 * ts1m:
		toffart=toffart_tm1+ (1/12);   

		if prep    ne 1 then do;
			if interrupt_supply_tm1 =1 then interrupt_supply   =1;
			if interrupt_choice_tm1 =1 then interrupt_choice   =1;
		end;
	end;

	e_rttams_tm2=e_rttams_tm1; 	e_rttams_tm1=e_rttams; 
	e_rt184m_tm2=e_rt184m_tm1;	e_rt184m_tm1=e_rt184m;
	e_rt65m_tm2=e_rt65m_tm1;	e_rt65m_tm1=e_rt65m;
	e_rt151m_tm2=e_rt151m_tm1;	e_rt151m_tm1=e_rt151m;
	e_rt103m_tm2=e_rt103m_tm1;	e_rt103m_tm1=e_rt103m;
	e_rt181m_tm2=e_rt181m_tm1;	e_rt181m_tm1=e_rt181m;
	e_rt190m_tm2=e_rt190m_tm1;	e_rt190m_tm1=e_rt190m;
	e_pr32m_tm2=e_pr32m_tm1;	e_pr32m_tm1=e_pr32m;
	e_pr33m_tm2=e_pr33m_tm1;	e_pr33m_tm1=e_pr33m;
	e_pr46m_tm2=e_pr46m_tm1;	e_pr46m_tm1=e_pr46m;
	e_pr47m_tm2=e_pr47m_tm1;	e_pr47m_tm1=e_pr47m;
	e_pr50vm_tm2=e_pr50vm_tm1;	e_pr50vm_tm1=e_pr50vm;
	e_pr50lm_tm2=e_pr50lm_tm1;	e_pr50lm_tm1=e_pr50lm;
	e_pr54m_tm2=e_pr54m_tm1;	e_pr54m_tm1=e_pr54m;
	e_pr76m_tm2=e_pr76m_tm1;	e_pr76m_tm1=e_pr76m;
	e_pr82m_tm2=e_pr82m_tm1;	e_pr82m_tm1=e_pr82m;
	e_pr84m_tm2=e_pr84m_tm1;	e_pr84m_tm1=e_pr84m;
	e_pr88m_tm2=e_pr88m_tm1;	e_pr88m_tm1=e_pr88m;
	e_pr90m_tm2=e_pr90m_tm1; 	e_pr90m_tm1=e_pr90m ;
	e_inpm_tm2=e_inpm_tm1;		e_inpm_tm1=e_inpm;
	e_insm_tm2=e_insm_tm1;		e_insm_tm1=e_insm;

	c_rttams_tm2=c_rttams_tm1; 	c_rttams_tm1=c_rttams; 
	c_rt184m_tm2=c_rt184m_tm1;	c_rt184m_tm1=c_rt184m;
	c_rt65m_tm2=c_rt65m_tm1;	c_rt65m_tm1=c_rt65m;
	c_rt151m_tm2=c_rt151m_tm1;	c_rt151m_tm1=c_rt151m;
	c_rt103m_tm2=c_rt103m_tm1;	c_rt103m_tm1=c_rt103m;
	c_rt181m_tm2=c_rt181m_tm1;	c_rt181m_tm1=c_rt181m;
	c_rt190m_tm2=c_rt190m_tm1;	c_rt190m_tm1=c_rt190m;
	c_pr32m_tm2=c_pr32m_tm1;	c_pr32m_tm1=c_pr32m;
	c_pr33m_tm2=c_pr33m_tm1;	c_pr33m_tm1=c_pr33m;
	c_pr46m_tm2=c_pr46m_tm1;	c_pr46m_tm1=c_pr46m;
	c_pr47m_tm2=c_pr47m_tm1;	c_pr47m_tm1=c_pr47m;
	c_pr50vm_tm2=c_pr50vm_tm1;	c_pr50vm_tm1=c_pr50vm;
	c_pr50lm_tm2=c_pr50lm_tm1;	c_pr50lm_tm1=c_pr50lm;
	c_pr54m_tm2=c_pr54m_tm1;	c_pr54m_tm1=c_pr54m;
	c_pr76m_tm2=c_pr76m_tm1;	c_pr76m_tm1=c_pr76m;
	c_pr82m_tm2=c_pr82m_tm1;	c_pr82m_tm1=c_pr82m;
	c_pr84m_tm2=c_pr84m_tm1;	c_pr84m_tm1=c_pr84m;
	c_pr88m_tm2=c_pr88m_tm1;	c_pr88m_tm1=c_pr88m;
	c_pr90m_tm2=c_pr90m_tm1; 	c_pr90m_tm1=c_pr90m; 
	c_inpm_tm2=c_inpm_tm1;		c_inpm_tm1=c_inpm;
	c_insm_tm2=c_insm_tm1;		c_insm_tm1=c_insm;




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

	cmin_tm3=cmin_tm2;   cmin_tm2=cmin_tm1;   cmin_tm1 = cmin  ;
	resumec_tm2 = resumec_tm1 ;  resumec_tm1 = resumec ;
	primary   =0; 

end;






*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* START OF CODE FOR HIV INFECTED WITH CALDATE{T} >= INFECTION+0.25;  * (or >= INFECTION+ (1/12) if ts1m)
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

if caldate{t} >= infection+0.25 > . then do;
* ts1m - replace line above by:
* if caldate{t} >= infection + (1/12) > . then do;

cd4_tm2=cd4_tm1;
cd4_tm1=cd4; cd4=.;
csqr_tm1 = csqr; csqr=.;


* measured viral load;  * may be * dependent_on_time_step_length ;  
vm_tm3 = vm_tm2; vm_tm2 = vm_tm1; vm_tm1 = vm;	vm = .;

* measured cd4 count;  * may be * dependent_on_time_step_length ;  
cm_tm3 = cm_tm2; cm_tm2 = cm_tm1; cm_tm1 = cm;  cm =.;             

who3_event_tm1 = who3_event ;


if t ge 2 and prep = 0 and prep_tm1 =1 and pop_wide_tld ne 1 then do; o_ten=0; o_3tc=0; toffart=0; end;
if t ge 2 and prep = 0 and prep_tm1 =1 and pop_wide_tld = 1 then do; o_ten=0; o_3tc=0; o_dol=0; toffart=0; end; 
* note we assume that if pop_wide_tld = 1 then all use of prep is tld not tl ;

* DIAGNOSIS of HIV ;

*
testing strategy 1: testing patients who present for testing or have symptoms (ie similar to developed countries)
testing strategy 2: testing only those presenting with symptoms (ie who stage 3 or 4 ) (which is programmed below anyway);



* elig_test... variables introduced feb17 to determine why people were getting tested;
elig_test_who4=0;elig_test_who3=0;elig_test_tb=0;elig_test_who4_tested=0;elig_test_tb_tested=0;elig_test_who3_tested=0;
	if t ge 3 and registd ne 1 and tested ne 1 and caldate{t} ge date_start_testing  then do; 
		if adc_tm1=1                                     then do; rate_test=test_rate_who4; elig_test_who4=1; end; *rate_test*incr_diag_rate_who4;			
		if adc_tm1=0 and tb_tm2 =0 and tb_tm1 =1         then do; rate_test=test_rate_tb; elig_test_tb=1; end;*rate_test*incr_diag_rate_tb;
		if who3_event_tm1 =1 and adc_tm1=0 and tb_tm1=0 then do; rate_test=test_rate_who3; elig_test_who3=1; end; *rate_test*incr_diag_rate_who3;

		if (adc_tm1=1 or (tb_tm2 =0 and tb_tm1 =1) or who3_event_tm1 =1) then do;
			unitest=uniform(0);if unitest<rate_test and ( (testing_disrup_covid ne 1 or covid_disrup_affected ne 1)) then do;
				tested=1;if ever_tested ne 1 then date1test=caldate{t};ever_tested=1;sympt_diag=1;
				sympt_diag_ever=1;dt_last_test=caldate{t};np_lasttest=0;
				newp_lasttest_tested_this_per = newp_lasttest;newp_lasttest=0;
				if adc_tm1=1 then elig_test_who4_tested=1; if adc_tm1=0 and tb_tm2=0 and tb_tm1 =1 then elig_test_tb_tested=1;
				if who3_event_tm1 =1 and adc_tm1=0 and tb_tm1 =0 then elig_test_who3_tested=1;
			end;
		end;
	end;

	e_eff_prob_loss_at_diag = eff_prob_loss_at_diag ;

	if sw=1 then e_eff_prob_loss_at_diag = eff_prob_loss_at_diag * eff_sw_higher_prob_loss_at_diag ;

	*Cost of diagnosing a person is higher 25$, than the cost of a negative result;
	if hiv=1 and tested=1 and registd_tm1 ne 1 and prep_falseneg ne 1 then do;	*V*hiv(t)=1 is valid for everybody;
		unisens=uniform(0);		
		if t ge 3 and unisens lt sens_vct then do; 
			registd=1; date1pos=caldate{t}; 
			visit=1; lost   =0; cd4diag=cd4_tm1;
			if pop_wide_tld_prep ne 1 then onart   =0;
			*costing of HIV-positive;
			if (adc_tm1=1 or (tb_tm2 =0 and tb_tm1 =1) or who3_event_tm1 =1) and unitest<rate_test then cost_test=cost_test_a;
			if cost_test=0 then do;
				if com_test ne 1 then cost_test= cost_test_b;
				if com_test =  1 then cost_test= cost_test_d;
			end;

			* some lost straight after diagnosis (unless already on tld);
			d=uniform(0);  * AP 22-7-19   ;
			if      adc_tm1 ne 1 and who3_event_tm1  ne 1 and ((caldate{t} - date_most_recent_tb) > 0.5 or (caldate{t} - date_most_recent_tb)=.)  
			and onart_tm1  ne 1 and pop_wide_tld_prep ne 1 then do;
					if d < e_eff_prob_loss_at_diag      then do; visit=0; lost   =1; end;
					if higher_newp_less_engagement = 1 and t ge 2 and newp_tm1 > 1 then do; 
					if d < e_eff_prob_loss_at_diag*1.5      then do; visit=0; lost   =1; end; * mar19;
					end;
			end;
			if (adc_tm1 = 1 or tb_tm1 =1) and d < prob_lossdiag_adctb then do; visit=0; lost   =1; end;
	    	if  who3_event_tm1  = 1        and d < prob_lossdiag_who3e then do; visit=0; lost   =1; end;
		end;
		if unisens ge sens_vct then do; 
			if cost_test=0 then cost_test= cost_test_c;
		end;
	end;


* AP 22-7-19;
* in pop_wide_tld prep use in person with hiv is set to zero when a person becomes diagnosed with hiv; 
* note that effect of art is determined by adh when on prep and when diagnosed and so onart, so I think this should be working ok;
if registd=1 and registd_tm1=0 and onart   =1 and pop_wide_tld_prep=1 then do; pop_wide_tld_prep = 0; prep = 0;  end;


* AP 21-7-19; * dont stop if have been taking tld prep ;
	if (infected_prep=1 or (hiv=1 and prep = 1)) and registd=1 and registd_tm1=0 and pop_wide_tld ne 1 then do; 
		prep = 0; o_3tc=0; o_ten=0; tss_ten   =0;tss_3tc   =0; 
	end;


* Loss to follow-up while off ART;
	if t ge 2 and onart   =0 and lost_tm1 =0 then do;
		e=uniform(0); 
		if 0.8 <= adhav       and e < eff_rate_lost     then do;lost=1;visit=0;return=0; end;
		if 0.5 <= adhav < 0.8 and e < eff_rate_lost*1.5 then do;lost=1;visit=0;return=0; end;
		if        adhav < 0.5 and e < eff_rate_lost*2   then do;lost=1;visit=0;return=0; end;
	end;

* Returning to clinic after loss to follow-up ;

	e_rate_return = eff_rate_return; 
	if higher_newp_less_engagement = 1 and t ge 2 and newp_tm1 > 1 then e_rate_return = eff_rate_return / 1.5;

	s=uniform(0);
	if adhav >= 0.8 then do;  
		if t ge 2 and lost_tm1 =1 and registd_tm1=1 and
		((adc_tm1=1 and s < prob_return_adc) or s < e_rate_return) then do;return=1;lost=0;visit=1;end;
	end;
	if 0.5 <= adhav < 0.8 then do;  
		if t ge 2 and lost_tm1 =1 and registd_tm1=1 and
		((adc_tm1=1 and s < prob_return_adc) or s < e_rate_return/2) then do;return=1;lost=0;visit=1;end;
	end;
	if adhav < 0.5 then do; 
		if t ge 2 and lost_tm1 =1 and registd_tm1=1 and
		((adc_tm1=1 and s < prob_return_adc) or s < e_rate_return/3) then do;return=1;lost=0;visit=1;end;
	end;


* pregnancy leads to re-engagement once option b+ implemented; 
	if registd=1 and (pregnant=1 or . < caldate{t} - dt_lastbirth <= 1) and art_initiation_strategy in (3,9,10) and lost=1 and return ne 1 then do;
		return=1;lost=0;visit=1;end;

* return cant happen if no_art_disrup_covid ;
if return=1 and covid_disrup_affected = 1 and no_art_disrup_covid=1 then do;return=0;lost=1;visit=0; end;

* shift to x4 virus being present - depends on viral load;
	if t ge 2 then do;
		pr_x4_shift=(10**vl_tm1)*0.0000004; s=uniform(0); if s < pr_x4_shift then do; x4v=1; date_x4=caldate{t};end;
	end;

* ts1m - replace above code with:
*	if t ge 2 then do;
*		pr_x4_shift=(10**vl_tm1)*0.0000004; * s=uniform(0); * if s < ( 1 - (1 - pr_x4_shift)**(1/3) ) then do; * x4v=1; * date_x4=caldate{t}; * end;
*	end;

	

* viral load changes from t-1 to t, if ART-naive at time t-1;

	if t ge 2 and prep    ne 1 then do;
	* dependent_on_time_step_length ;
		if naive=1 or (naive_tm1=1 and tcur=0) or (toffart    gt 0.25) then do;
			vc_tm1 =(gx*0.02275 + (0.05 * normal(0)))+ ((age_tm1-35)*0.00075);

* ts1m - add this line:
*			vc_tm1  = vc_tm1  / 3;

			vl = vl_tm1+ vc_tm1  ;
			if vl gt 6.5 then vl=6.5;
		end;
	end;



* CD4 changes from t-1 to t, if ART-naive at time t-1;
	if t ge 3 and prep    ne 1 then do;
	* dependent_on_time_step_length ;
		if naive=1 or (naive_tm1=1 and tcur=0) or (toffart    gt 0 and 0 <= cd4_tm1-cmin_tm1  < 300) or (toffart    gt 0
		and (resumec_tm1 =1 or resumec_tm2 =1)) then do;
* resumec indicates that cd4 has fallen to cmin since interruption (before toffart=1) and so usual cd4 changes start;

* dependent_on_time_step_length ;
			if vl_tm1 < 3 then ccsqr_tm1 =+0.000*fx+(sd_cd4*normal(0));
			if 3 <= vl_tm1 < 3.5 then ccsqr_tm1=-0.022*fx+(sd_cd4*normal(0));
			if 3.5 <= vl_tm1 < 4 then ccsqr_tm1=-0.085*fx+(sd_cd4*normal(0));
			if 4 <= vl_tm1 < 4.5 then ccsqr_tm1=-0.40*fx+(sd_cd4*normal(0));
			if 4.5 <= vl_tm1 < 5 then ccsqr_tm1=-0.40*fx+(sd_cd4*normal(0));
			if 5 <= vl_tm1 < 5.5 then ccsqr_tm1=-0.85*fx+(sd_cd4*normal(0));
			if 5.5 <= vl_tm1 < 6 then ccsqr_tm1=-1.30*fx+(sd_cd4*normal(0));
			if 6.0 <= vl_tm1 then ccsqr_tm1=-1.75*fx+(sd_cd4*normal(0));
			* these values higher than european model because effect of black race;

			if x4v_tm1 =1 then ccsqr_tm1 =ccsqr_tm1 -0.25;

* ts1m:     ccsqr_tm1  = ccsqr_tm1  / 3;

			* if t le 2 then ccsqr_tm1 =0;
			if cd4_tm1 < 0 then cd4_tm1=0;
			csqr    = sqrt(cd4_tm1) + ccsqr_tm1 ; if csqr    lt 0 then csqr   =0;
			cd4=csqr**2;  if cd4 < 0 then cd4=0; cc_tm1 =cd4-cd4_tm1;
		end;
	end;


res_test=.;


* WHETHER CD4 WAS MEASURED - NAIVE PATIENTS;
	w=uniform(0);
	if t ge 2 and  hiv_monitoring_strategy=2
	and naive=1 and visit=1 and (date_latest_cm = . or (caldate{t} - date_latest_cm) > 0.25) and w < prob_cd4_meas_done then do;
		cm   =(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc=1;
		if date_staging=. then do; date_staging = caldate{t}; cd4_staging = cm   ; who4_staging = who4_tm1; end;
		if ((art_intro_date             le caldate{t} lt 2010 and . lt cm    le 200) or
      	    (                              caldate{t} ge 2010 and . lt cm    le 350)) or 
			who4_tm1=1 then elig_mcd4_=1;		
	end;



* INITIATION OF ART ;

	if t ge 3 and  time0 = . and (((art_init_disrup_covid ne 1 or covid_disrup_affected ne 1) 
							and (no_art_disrup_covid ne 1 or covid_disrup_affected ne 1))) then do;

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
			if t ge 3 and visit=1 and naive_tm1=1 and art_intro_date <= caldate{t} and who4_tm1=1 then do;
				if (who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then u=u/2;
                if u < eff_pr_art_init then time0=caldate{t};
				if dt_first_elig=. then dt_first_elig=caldate{t};end;
		end;

		if art_initiation_strategy=2 then do;
			if t ge 3 and visit=1 and naive_tm1=1 and art_intro_date <= caldate{t} and (who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) 
			then do; 
				if (who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then u=u/2;
				if u < eff_pr_art_init then time0=caldate{t};
				if dt_first_elig=. then dt_first_elig=caldate{t};end;
		end;	

		if art_initiation_strategy=3 then do;
			if t ge 3 and visit=1 and naive_tm1=1 and art_intro_date <= caldate{t} then do;
				if (who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then u=u/2;
				if pregnant =1 then u=u/10; * jul18 ;

				if u < eff_pr_art_init then time0=caldate{t};

				if dt_first_elig=. then dt_first_elig=caldate{t};end;
		end;

		if hiv_monitoring_strategy=2 and art_initiation_strategy=4 then do;
			if t ge 4 and visit=1 and naive_tm1=1 and art_intro_date <= caldate{t} and
			(. < cm    < 200 or . < cm_tm1  < 200 or . < cm_tm2  < 200 or who4_tm1=1  or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then do;
				if (who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then u=u/2;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				if u < eff_pr_art_init then time0=caldate{t};
			end;
		end;

		if hiv_monitoring_strategy=2 and art_initiation_strategy=5 then do;
			if t ge 4 and visit=1 and naive_tm1=1 and art_intro_date <= caldate{t} and
			(. < cm    < 200 or . < cm_tm1  < 200 or . < cm_tm2  < 200
			or who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then do;
				if (who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then u=u/2;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				if u < eff_pr_art_init then time0=caldate{t};
			end;
		end;
		
		if hiv_monitoring_strategy=2 and art_initiation_strategy in (6 9) then do;
			if t ge 4 and visit=1 and naive_tm1=1 and art_intro_date <= caldate{t} and
			(. < cm    < 350 or . < cm_tm1  < 350 or . < cm_tm2  < 350 or who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then do;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				time0=caldate{t};  art_init_bplus_=1;
			end;
		end;

		if art_initiation_strategy in (3, 9, 10) then do;  * pregnancy leads to re-engagement once option b+ implemented;
			if (pregnant=1 or . < caldate{t} - dt_lastbirth <= 1) and visit=1 and naive_tm1=1 and art_intro_date <= caldate{t} then do;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				time0=caldate{t};  art_init_bplus_=1;
			end;
		end;

		if hiv_monitoring_strategy=2 and art_initiation_strategy = 10 then do;  
			if t ge 4 and visit=1 and naive_tm1=1 and art_intro_date <= caldate{t}  and
			(. < cm    < 500 or . < cm_tm1  < 500 or . < cm_tm2  < 500 or who4_tm1=1 or 0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then do;
				if dt_first_elig=. then dt_first_elig=caldate{t};
				time0=caldate{t}; art_init_cd4l500_=1; 
			end;
		end;


		* AP 19-7-19;

		* USE OF NVP FOR MTCT & HENCE DEVELOPMENT OF NVP RESISTANCE; * revised apr 2019 - because women have high rates of viral suppression (malawi)
		and diffcult to reconcile with these relatively high rates of nnrti resistance from nevirapine for pmtct;

		if gender=2 and caldate{t} gt date_pmtct then do;
			u=uniform(0); uu=uniform(0); 
			if anc=1 and naive=1 and uu < prob_pmtct then do;
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
		yrart=caldate{t};cd4art=cd4_tm1;vlart=vl_tm1;
		if 0 <= time_since_last_cm <= 0.5 then measured_cd4art=value_last_cm ;
	end;

* the values of c and v below will be overwritten below if toffart    changes back to 0;


* viral load and CD4 changes during ART interruption
- viral load returns to vmax in 3 months and adopts natural history changes thereafter
- CD4 rate of decline returns to natural history changes after three 3 month periods
- cc_tm1  is change from t-1 to t;

	if t ge 4 and 0 < toffart    <= 0.25 then do;
    	 vl=vmax_tm1;
     * assume rate cd4 fall depends on current viral load;
     	 if        vl >= 5 then cc_tm1 =-200+10*normal(0);
	     if 4.5 <= vl < 5 then cc_tm1=-160+10*normal(0);
	     if        vl < 4.5 then cc_tm1=-120+10*normal(0);
* ts1m:  cc_tm1 = cc_tm1 / 3;
	     z=cd4_tm1+cc_tm1;
	     cd4=max(cmin_tm1 ,z); if cd4 lt 0 then cd4=0; if cd4=cmin_tm1  then resumec   =1; 
	end;
	if t ge 4 and 0.25 < toffart    <= 0.5 and resumec_tm1  ne 1 then do;
	     * assume rate cd4 fall depends on current viral load;
    	 if vl >= 5 then cc_tm1=-100+10*normal(0);
	     if 4.5 <= vl < 5 then cc_tm1=-90+10*normal(0);
    	 if vl < 4.5 then cc_tm1=-80+10*normal(0);
* ts1m:  cc_tm1 = cc_tm1 / 3;
	     z=cd4_tm1+cc_tm1;
	     cd4=max(cmin_tm2 ,z); if cd4 lt 0 then cd4=0; if cd4=cmin_tm2  then resumec   =1;
	end;
	if 0.5 < toffart    <= 0.75 and t ge 4 and (resumec_tm1  ne 1 and resumec_tm2  ne 1) then do;
	     * assume rate cd4 fall depends on current viral load;
    	 if vl >= 5 then cc_tm1=-80+10*normal(0);
	     if 4.5 <= vl < 5 then cc_tm1=-70+10*normal(0);
	     if vl < 4.5 then cc_tm1=-60+10*normal(0);
* ts1m:  cc_tm1 = cc_tm1 / 3;
	     z=cd4_tm1+cc_tm1;
	     cd4=max(cmin_tm3 ,z); if cd4 lt 0 then cd4=0; if cd4=cmin_tm3  then resumec   =1;
	end;
	c_200_gt_nad=0;if t ge 3 and toffart    gt 0 and cd4_tm1-cmin_tm1  > 300 then do;
    	 * assume rate cd4 fall depends on current viral load;
	     c_200_gt_nad=1;
    	 if vl >= 5 then cc_tm1=-200+10*normal(0);
	     if 4.5 <= vl < 5 then cc_tm1=-160+10*normal(0);
	     if vl < 4.5 then cc_tm1=-120+10*normal(0);
* ts1m:  cc_tm1 = cc_tm1 / 3;
	     z=cd4_tm1+cc_tm1;
	     cd4=max(cmin_tm2 ,z); if cd4 lt 0 then cd4=0;
	end;
* after this point assume cd4 fall as in natural history;



* INTERRUPTION OF ART  (AND LOSS TO FOLLOW-UP);

	interrupt   =0;

* interruption due to "choice";
	if stop_tox    ne 1 then do; 

		if t ge 2 and onart_tm1 =1 then do;
			if  adh_tm1 >= 0.8  then do;
			    if c_tox_tm1=0 then prointer=eff_rate_int_choice ;
			    if c_tox_tm1=1 then prointer=rr_int_tox*eff_rate_int_choice; 
			end;
			if 0.5 <= adh_tm1 < 0.8 then do;
			    if c_tox_tm1=0 then prointer=1.5*incr_rate_int_low_adh*eff_rate_int_choice;
			    if c_tox_tm1=1 then prointer=rr_int_tox*1.5*incr_rate_int_low_adh*eff_rate_int_choice;
			end;
			if adh_tm1 < 0.5 then do;
			    if c_tox_tm1=0 then prointer=2*incr_rate_int_low_adh*eff_rate_int_choice;
			    if c_tox_tm1=1 then prointer=rr_int_tox*2*incr_rate_int_low_adh*eff_rate_int_choice;
			end;


	   if pregnant=1 then prointer = prointer/100; * jul18;
		* reduction in prob interruption after 1 year continuous art - mar16;
		if tcur ge 1 then prointer=prointer/2;
		if sw=1 then prointer=prointer * eff_sw_higher_int;
		*The rate of interruption also reduces with time on ART, decreasing after 2 years.  
		Evidence suggests that rates of discontinuation does decrease over time ((Kranzer 2010 Tassie 2010 Wandeler 2012) 
		although the point at which the risk lowers might be somewhat earlier than 2 years;  
		if higher_newp_less_engagement = 1 and t ge 2 and newp_tm1 > 1 then prointer = prointer * 1.5; * mar19;  
		r=uniform(0);if r < prointer then do; 
				interrupt_choice   =1; 
				int_clinic_not_aw=0; f=uniform(0); if f < clinic_not_aw_int_frac then int_clinic_not_aw=1;
			end;
		end;
	end;


* interruption due to interruption of drug supply ;

	if visit=1 and onart_tm1 =1  and interrupt_choice    ne 1
	and stop_tox ne 1 then do;

		prointer_supply= prob_supply_interrupted  ;
		s=uniform(0); if s < prointer_supply then interrupt_supply  =1;

		if no_art_disrup_covid = 1 and covid_disrup_affected = 1 then do; interrupt_supply  =1; was_on_art_covid_disrup=1; end;

	end;


	* interruption of prep before diagnosis;
	* dependent_on_time_step_length ; 
	if t ge 2 and prep_tm1 =1 and prep   =0 and registd ne 1 and pop_wide_tld =1 and onart   =1 then do;
		interrupt   =1;
		artline=.;onart   =0;toffart   =0;interrupt=1;date_last_interrupt=caldate{t};

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
		v_inter=vl_tm1; tcur_inter=tcur;
	end;

	if t ge 2 and (interrupt_choice   =1 or interrupt_supply   =1 or stop_tox   =1 or (interrupt   =1 and prep_tm1 =1 and prep=0))
	and restart_tm1 =0 and visit=1 and onart_tm1 =1 then do; 
		artline=.;onart   =0;toffart   =0;interrupt=1;date_last_interrupt=caldate{t};

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
		v_inter=vl_tm1; tcur_inter=tcur;
	end;

	if prep_tm1 =1 and prep=0 then toffart   =0;

	if t ge 2 and interrupt_tm1=1 then tcur=.;

	* people leaving clinic as well as interrupting (if interruption due to choice);
	if t ge 2 and interrupt=1 and (interrupt_choice   =1) then do;
		f=uniform(0);
	
		if f < eff_prob_lost_art     and        adhav >= 0.8 then do;lost=1; visit=0; return=0;end;
		if f < eff_prob_lost_art*1.5 and 0.5 <= adhav <  0.8 then do;lost=1; visit=0; return=0;end;
		if f < eff_prob_lost_art*2   and        adhav <  0.5 then do;lost=1; visit=0; return=0;end;
	end;

	
if int_clinic_not_aw=1 and lost = 1 then int_clinic_not_aw=0;
if int_clinic_not_aw=1 and (lost = 1 or death ne .) then int_clinic_not_aw=0;

if interrupt=1 then do; 
	no_interruptions=no_interruptions+1; 
	if date_1st_int=. then date_1st_int=caldate{t}; 
end;


* RE-INITIATION OF THERAPY AFTER INTERRUPTING -  restart = 1 means restart at time t;

	e_rate_restart=eff_rate_restart;
	restart   =0;d=uniform(0);
	if t ge 3 and interrupt_choice    = 1 and lost=0 and visit=1 and toffart_tm1  gt 0 and onart_tm1 =0 and tcur_tm1=. and interrupt=0 then do;
		if v_alert_6m_incr_adh = 1 and . < caldate{t}-date_v_alert <= 0.5  and date_v_alert > date_last_interrupt > . then e_rate_restart=e_rate_restart*10;

		if v_alert_perm_incr_adh = 1 and caldate{t} >= date_v_alert > .    and date_v_alert > date_last_interrupt > .  then e_rate_restart=e_rate_restart*10;

		if who3_event_tm1=1 then e_rate_restart = e_rate_restart*3;
		if adc_tm1=1 then e_rate_restart = e_rate_restart*5;
		if pregnant=1 then e_rate_restart = e_rate_restart*5; * jul18;
		if return   =1 then e_rate_restart = 1;

		if d < e_rate_restart  then do;restart=1; onart   =1;tcur=0; interrupt_choice=0; end;
		if return    =1 and restart=1 then do; 
			if date_first_art_exp_initiation=. then date_first_art_exp_initiation=caldate{t};  
			date_last_return_restart=caldate{t}; * oct16;
		end;

	end;


	if t ge 3 and interrupt_supply   =1 and visit=1 and toffart_tm1  gt 0 and onart_tm1 =0
	and tcur_tm1=. and interrupt=0 and d < prob_supply_resumed then do;
		restart   =1; onart   =1;tcur=0; interrupt_supply=0;
	end;

	if  no_art_disrup_covid ne 1 and covid_disrup_affected = 1 and was_on_art_covid_disrup=1 then do;
		restart   =1; onart   =1;tcur=0; interrupt_supply=0;
	end;


* initiation of a new regimen in a person who stopped d4t/3tc/efa due to tox when drug_availability=d4t/3tc/efa
  and now drug_availability=zdv/3tc/efa/lpr;
     if visit=1 and stop_tox   =1 and toffart_tm1  gt 0 and onart_tm1 =0 and tcur_tm1=. and interrupt=0
	 then do; stop_tox   =0;restart   =1; onart   =1;end;



* RE-INITIATION OF HAART AFTER INTERRUPTION;
* This is re-initiating when line of therapy has been switched to the next line, according to line of failure
  (ie line of therapy is one higher than lines failed, so they just restart the same regimen;

	if t ge 2 and restart   =1 then do;
		tcur=0;onart   =1;
		o_zdv=mr_zdv_tm1;
		o_3tc=mr_3tc_tm1;
		o_ten=mr_ten_tm1;
		o_nev=mr_nev_tm1;
		o_dar=mr_dar_tm1;
		o_efa=mr_efa_tm1;
		o_lpr=mr_lpr_tm1;
		o_taz=mr_taz_tm1;
		o_dol=mr_dol_tm1;

		* if return    =1 then do; * jan18 - think this should apply when restarting even if return ne 1;

			if reg_option     in (104 105 106 116 117 118) then do; if (o_efa=1 or o_nev=1) and t_dol ne 1 then do;o_efa=0; o_nev=0; o_dol=1; end; end;
			if reg_option     in (104 105 118) then do; if (o_taz=1 or o_lpr=1) and t_dol ne 1 then do;o_taz=0; o_lpr=0; o_dol=1; end; end;
			if reg_option     in (106) then do; if (o_taz=1 or o_lpr=1) and t_dol ne 1 and t_zdv ne 1 then do;o_taz=0; o_lpr=0; o_dol=1; o_ten=0;o_zdv=1; end; end;
			if reg_option     in (104 105 118) then do; if t_ten ne 1 then do;o_ten=1; o_zdv=0; end; end;
	
			if restart_res_test=1 then do;
			res_test=1;
    		if  (c_rt103m=1 or c_rt181m=1 or c_rt190m=1) and (o_efa=1 or o_nev=1) then do; o_ten=1; o_3tc=1; o_dol=1;o_efa=0 ; o_nev=0; end;
    		end;

		* end;

		if line1=1 and line2=0 then artline=1;
		if line2=1 then artline=2;
		if line3=1 then artline=3;
	end;


* INITIATION OF FIRST LINE THERAPY ;

if yrart=caldate{t} and onart    ne 1 and  art_intro_date <= yrart then do;
tcur=0;naive=0;artline=1;onart   =1;linefail=0;line1=1;vfail1=0;
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

	if prep_tm1 =0 and prep=1 then tcur=0;


* jan17 - so can change value of pr switch line and still record original value of this parameter;

e_pr_switch_line = eff_pr_switch_line;
	
if reg_option in (105 106) and o_dol=1 then e_pr_switch_line=0; * effective pr_switch_line;
if reg_option in (105 106) and o_dol=1 and linefail_tm1 =1 and line2=0 and start_line2=1 then start_line2=.; * mar18;

		if t ge 2  and interrupt=0 and linefail_tm1 =1 and line2=0 and (artline_tm1 =1) and visit=1 and reg_option ne 105 and reg_option ne 106  then do;
			q=uniform(0); if q < e_pr_switch_line then do; start_line2=1; date_start_line2=caldate{t}; cd4_start_line2 = cm   ; end;
		end;


* INITIATION OF 2ND LINE HAART - AFTER HAVING INTERRUPTED SINCE FAILING FIRST LINE;

	if t ge 2 and start_line2=1 then do; 
		artline=2; onart   =1; tcur=0;date_line2=caldate{t}; line2=1;choose_line2=1;adhav=adhav+altered_adh_sec_line; 
		if adhav gt 1 then adhav=1;
	end;
* increased adh second line;



* WHETHER TO INITIATE 3rd LINE HAART (FOR PEOPLE WHO FAILED second LINE AND STILL ON second LINE);
	if  third_line=1 then do;
		if t ge 2  and interrupt=0 and linefail_tm1 =2 and line3=0 and (artline_tm1 =2)
		and visit=1 then do;   
			q=uniform(0); if q < e_pr_switch_line then start_line3=1;
		end;
	end;


	* restart_pi_after_dtg_fail   -  may18;
	if reg_option in (103 104 110 111 114 116 117 118 119) and f_dol=1 and o_dol=1 and o_taz ne 1 and o_lpr ne 1 and (p_taz=1 or p_lpr=1) then do;
		if t ge 2  and interrupt=0 and visit=1 then do;   
			q=uniform(0); if q < e_pr_switch_line then restart_pi_after_dtg_fail=1;
		end;
	end;


* INITIATION OF 3rd LINE HAART - AFTER HAVING INTERRUPTED SINCE FAILING second line; * third line can now be pi after efa fail and dol fail;

	if third_line=1 then do;

		if t ge 2 and linefail_tm1 =2 and line3=0 and onart_tm1 =0 and restart   =1 and visit=1 then do;
			start_line3=1; 
		end;

	if reg_option in (120 121) and linefail_tm1 =2 and (f_dol=1 and f_3tc=1 and (f_zdv=1 or f_ten=1)) and (p_lpr ne 1 and p_taz ne 1) then do; 
		if t ge 2 and linefail_tm1=2 and onart_tm1 =0 and restart   =1 and visit=1 then do;
			pi_after_dtg_fail=1; start_line3=1;line3=1;
		end;

	end;

	
 	if reg_option in (104 118 120 121) and linefail_tm1=2 and (f_dol=1 and f_3tc=1 and f_ten=1) then do;

		if t ge 2 and linefail_tm1=2 and onart_tm1=0 and restart   =1 and visit=1 then do;
			if p_taz=1 or p_lpr=1 then restart_pi_after_dtg_fail=1; start_line3=1;line3=1;
		end;

	end;

	if reg_option in (103 104 110 111 114 116 117 118 119 120 121) and linefail_tm1=2 and (f_dol=1) then do;  * mar19 - not sure why above need f_3tc and f_ten =1 to
	restart pi so have added on 104 here, along with 111); 

		if t ge 2 and linefail_tm1=2 and onart_tm1=0 and restart   =1 and visit=1 then do;
			if p_taz=1 or p_lpr=1 then restart_pi_after_dtg_fail=1;  if p_taz ne 1 and p_lpr ne 1 then do;pi_after_dtg_fail=1;start_line3=1;line3=1;end;
		end;

	end;
	

	end;



	if t ge 2 and start_line3=1 then do; 
		artline=3; onart=1; tcur=0;date_line3=caldate{t}; line3=1;choose_line3=1;adhav=adhav+altered_adh_sec_line; 
		if adhav gt 1 then adhav=1;
	end;
* increased adh second and third line;


* set date_last_who3 to missing when start or restart art;
	if tcur=0 then do; date_last_who3=.;first_who3_line2=.; end;


* set int_clinic_not_aw=. if on art;
if onart=1 then int_clinic_not_aw=.;


if t ge 4 then do;

no_recent_vm_gt1000=0; if onart=1 and artline=1 and (sv=1 or (time_since_last_vm_gt3 = . or time_since_last_vm_gt3 > 0.75)) then no_recent_vm_gt1000=1;
recent_vm_gt1000=0; if onart=1  and artline=1 and (0 <= time_since_last_vm_gt3 <= 0.5) then recent_vm_gt1000=1;

* efa;

* due to t-1 probably * dependent_on_time_step_length ;

	if  interrupt=0 and o_efa_tm1=1 and transition_from_nnrti_done ne 1 and
		( 
		reg_option in (104 105 116 117 118) or 
		(reg_option = 106 and sv ne 1) or
		(reg_option in (102 103 106 119) and sv=1) or
		(reg_option = 106 and sv ne 1) 
		)
	then do;
		tss_efa   =0; o_dol=1;o_efa=0; 
		if (reg_option = 106 and sv ne 1) or ( reg_option in (116 117) and  linefail = 1 ) then do; tss_ten=0; o_ten=0;o_zdv=1;end;
		if 0 <= time_since_last_vm_gt3 <= 0.5 then date_start_zld_if_reg_op_116 = caldate{t};
		transition_from_nnrti_done = 1; date_transition_from_nnrti=caldate{t};
	end;
	
* nev;

	if  interrupt=0 and o_nev_tm1=1 and transition_from_nnrti_done ne 1 and
		( 
		reg_option in (104 105 116 117 118) or 
		(reg_option = 106 and sv ne 1) or
		(reg_option in (102 103 106 119) and sv=1) or
		(reg_option = 106 and sv ne 1) 
		)
	then do;
		tss_nev   =0; o_dol=1;o_nev=0; 
		if (reg_option = 106 and sv ne 1) or ( reg_option in (116 117) and  linefail=1 ) then do; tss_ten=0; o_ten=0;o_zdv=1;end;
		transition_from_nnrti_done = 1; date_transition_from_nnrti=caldate{t};
	end;
	

* zdv subsituted by ten after 2010.5;
	if interrupt=0 and o_zdv_tm1=1 and 2010.5 <= caldate{t} < 2012.5 and linefail_tm1 = 0 and artline=1 then do;
		tss_zdv=0; o_ten=1;o_zdv=0; 
	end;
end;




* switching from taz / lpr 2nd line to dolutegravir 2nd line; 

* AP 20-7-19; 

if artline=2 and (o_taz=1 or o_lpr=1) and transition_from_pi_done ne 1 and ( 
reg_option in (104 105 106 111 116 117 118)  or ( reg_option in (103 119) and sv = 1) 
) then do;
* taz;  
	if t ge 2  and interrupt=0 and f_dol ne 1 and o_taz=1 then do; tss_taz   =0; o_dol=1;o_taz=0; 
	transition_from_pi_done = 1; date_transition_from_pi=caldate{t};end;
* lpr;
	if t ge 2  and interrupt=0 and f_dol ne 1 and o_lpr=1 then do;	tss_lpr   =0; o_dol=1;o_lpr=0; 
	transition_from_pi_done = 1; date_transition_from_pi=caldate{t};end;
* ten;
	if reg_option in (104 105 118)  then do;
	if t ge 2  and interrupt=0 and o_zdv=1 and t_ten=0 then do;	tss_zdv=0; o_ten=1; o_zdv=0; end;
	end;
* zdv;
	if reg_option in (106 111 116 117) then do;
	if t ge 2  and interrupt=0 and o_ten=1 and t_zdv=0 then do;	tss_ten   =0; o_zdv=1; o_ten=0; end;
	end;
	
end;




* monitoring strategy 1500 is only for people on dol who have not failed previously;

if caldate{t} ge 2020.5 and art_monitoring_strategy=1500 and (o_dol ne 1 or linefail ge 1) then art_monitoring_strategy=150; 







* SWITCHING OF DRUGS DUE TO TOXICITY;   * for reg18 decided to remove all switching due to toxicity and programmatically unlikely to often happen
- can out back in for sensitivity analysis;

if prep=0 and switch_for_tox = 1 then do;

* tox risk and persistence 

* efa;
	s=uniform(0); r=uniform(0); if t ge 2  and interrupt=0 and o_efa_tm1=1 and
	((c_cns_tm1=1 and s < r_swi_efa_cns) or (c_ras_tm1=1 and r < r_swi_efa_ras ))
	then do;
		sw_toxicity=1;
		if t_nev_tm1=0  and o_nev ne 1  then do; t_efa=1;tss_efa   =0; o_nev=1;o_efa=0; goto x1; end;
		if caldate{t} ge 2014 and t_taz_tm1=0  and o_taz ne 1  then do; t_efa=1;tss_efa   =0; o_taz=1;o_efa=0; goto x1; end;
		if t_lpr_tm1=0  and o_lpr ne 1  then do; t_efa=1;tss_efa   =0; o_lpr=1;o_efa=0; goto x1; end;
		t_efa=1;tss_efa   =0;o_efa=0; * if cant switch then just stop nvp;
	x1: end;
	

* nev;
		s=uniform(0); r=uniform(0); if t ge 2  and interrupt=0 and o_nev_tm1=1 and
		((c_hep_tm1=1 and s < r_swi_nev_hep) or (c_ras_tm1=1 and r < r_swi_nev_ras ))
		then do;
			sw_toxicity=1;
			if t_efa_tm1=0  and o_efa ne 1  then do; t_nev=1;tss_nev   =0; o_efa=1;o_nev=0; goto x7; end;
			if caldate{t} ge 2014 and t_taz_tm1=0  and o_taz ne 1  then do; t_nev=1;tss_nev   =0; o_efa=1;o_nev=0; goto x7; end;
			t_nev=1;tss_nev   =0;o_nev=0; * if cant switch then just stop nvp;
	x7: end;

* zdv;
            s=uniform(0); d=uniform(0); e=uniform(0); if t ge 2  and interrupt=0 and o_zdv_tm1=1 and
            ((c_nau_tm1=1 and s lt r_swi_zdv_nau) or (c_head_tm1=1 and d < r_swi_zdv_head) or (c_lip_tm1=1 and e < r_swi_zdv_lip)
            or (c_ane_tm1=1 and e < r_swi_zdv_ane) or c_lac_tm1=r_swi_zdv_lac )   then do;
                  sw_toxicity=1;
                  if t_3tc_tm1=0  and o_3tc ne 1                   then do; t_zdv=1;tss_zdv   =0; o_3tc=1;o_zdv=0; goto x3; end;
                  if caldate{t} ge 2010.5 and t_ten_tm1=0  and o_ten ne 1 then do; t_zdv=1;tss_zdv   =0; o_ten=1;o_zdv=0; goto x3; end;
                  t_zdv=1;tss_zdv   =0;o_zdv=0;
            x3:end;

* ten;
            s=uniform(0); if t ge 2  and interrupt=0 and o_ten_tm1=1 and (c_neph_tm1=1 and s lt r_swi_ten_neph) then do;
                  sw_toxicity=1;
	              if t_zdv_tm1=0  and o_zdv ne 1 then do; t_ten=1;tss_ten   =0; o_zdv=1;o_ten=0; goto x6; end;
	              t_ten=1;tss_ten   =0;o_ten=0;
            x6:end;

* lpr;
		s=uniform(0); r=uniform(0); if t ge 2  and interrupt=0 and o_lpr_tm1=1 and
		((c_nau_tm1=1 and s < r_swi_lpr_nau ) or (c_dia_tm1=1 and r < r_swi_lpr_dia )) then do; *note nau currently does not occur with lpr;
			sw_toxicity=1;
			if caldate{t} ge 2014 and t_taz_tm1=0  and o_taz ne 1 then do; t_lpr=1;tss_lpr   =0; o_taz=1;o_lpr=0; goto x5; end;
			if t_nev_tm1=0  and o_nev ne 1 then do; t_lpr=1;tss_lpr   =0; o_nev=1;o_lpr=0; goto x5; end;
			t_lpr=1;tss_lpr   =0; o_lpr=0;
		x5:end;


* taz;
		s=uniform(0); r=uniform(0); if t ge 2  and interrupt=0 and o_taz_tm1=1 and 
		((c_nau_tm1=1 and s < r_swi_taz_nau ) or (c_dia_tm1=1 and r < r_swi_taz_dia )) then do; *note nau currently does not occur with taz;
			sw_toxicity=1;
			if t_lpr_tm1=0  and o_lpr ne 1 then do; t_taz=1;tss_taz   =0; o_lpr=1;o_taz=0; goto x8; end;
			if t_nev_tm1=0  and o_nev ne 1 then do; t_taz=1;tss_taz   =0; o_nev=1;o_taz=0; goto x8; end;
			t_taz=1;tss_taz   =0;o_taz=0; 
		x8: end;	

* dar - assume no new tox after previous pi;

* dol ;
	s=uniform(0);  if t ge 2  and interrupt=0 and o_dol_tm1=1 and (c_cns_tm1=1 and s < r_swi_dol_cns) then do; 
		sw_toxicity=1;
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

	if caldate{t} >= 2015 and (f_efa=1 or f_nev=1)  and reg_option in (103 110 111 114 116 117 119 120 121)  then do; * aug18;
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

 	if caldate{t} >= 2015 and f_dol=1 and reg_option in (102 103 104 113 115 116 117 118 119 120 121) then do;
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

if pi_after_dtg_fail=1  then do;  
			pi_after_dtg_fail=.;
			if artline=2 then artline=3; line3=1;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if t_taz=0 then o_taz=1;  if t_taz=1 and t_lpr=0 then o_lpr=1;  
			if t_zdv ne 1 then do; o_zdv=1;  end;
			if t_ten=0 and t_zdv=1 then do; o_ten=1; end;
end;

end;

* restart_pi_after_dtg_fail -  ;  * dec17;

if restart_pi_after_dtg_fail=1  then do;  
			restart_pi_after_dtg_fail=.;
			o_zdv=0;o_3tc=0;o_ten=0;o_nev=0;o_lpr=0;o_taz=0;o_efa=0;o_dol=0;o_dar=0;
			o_3tc=1;
			if t_taz=0 then o_taz=1;  if t_taz=1 and t_lpr=0 then o_lpr=1;  
			if t_zdv ne 1 then do; o_zdv=1;  end;
			if t_ten=0 and t_zdv=1 then do; o_ten=1; end;
end;




if art_monitoring_strategy = 153 then do; 
if t ge 2 and (o_efa=1 or (int_clinic_not_aw=1 and mr_efa=1) or o_nev=1 or (int_clinic_not_aw=1 and mr_nev=1)) and linefail=0
then do;
		if 0 <= caldate{t} - date_last_vlm_g1000 <= 0.5 then do;  
		linefail=1;r_fail=c_totmut; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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



if reg_option in (105 106) then art_monitoring_strategy = 153; * this is so that do not do the extra confirmatory vls, which is not needed since
wont switch anyway;


* current number of drugs on;
	nod   =o_zdv+o_3tc+o_ten+o_nev+o_dar+o_lpr+o_taz+o_efa+o_dol;


* current number of nucs on;
	nonuc=o_zdv+o_3tc+o_ten;


	if t ge 2 and onart=1 and restart   =0 then toffart   =.;
	
	if onart=1 then do;
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


* date first start specific drugs;
if o_dol=1 and p_dol_tm1 ne 1 then date_start_dol = caldate{t};
if o_efa=1 and p_efa_tm1 ne 1 then date_start_efa = caldate{t};
if o_nev=1 and p_nev_tm1 ne 1 then date_start_nev = caldate{t};


	
* adherence between t-1 and t  (adh); 

	if t ge 2 and onart_tm1=1 and (prep ne 1 or adh = .) then do;  * for person on prep whether pop wide tld or regular prep the adh should be
	already defined, based on adhav_pr - if prep = 1 it means person does not know they have hiv ;
		adh=adhav + adhvar*normal(0);

* effect on adherence of alerts due to vl > 1000;

	if v_alert_6m_incr_adh = 1 and . < caldate{t}-date_v_alert <= 0.5  then adh = 0.9 + (0.05*normal(0));

	if v_alert_perm_incr_adh = 1 and caldate{t} >= date_v_alert > .   then  adh = 0.9  + (0.05*normal(0));
	* this below means that the adhav effect on reduced risk of interruption is seen also in those who had permanent increased adh due to alert;
	if adhav_increase_due_to_alert=. and v_alert_perm_incr_adh=1 and caldate{t} >= date_v_alert > .  then do;
		adhav=0.9;adhav_increase_due_to_alert=1;
	end;
	

* current tox can affect adherence;  
		r=uniform(0); if c_tox_tm1=1 and r < 0.5 then adh=adh-red_adh_tox;

* reduced adherence if regimen is not 1 pill once a day - red_adh_multi_pill;
		if o_zdv = 1 or o_taz = 1 or o_lpr = 1 then adh = adh - red_adh_multi_pill ;


* poorer "adherence" (lower drug levels) if have "current" tb or adc;  
		if t ge 3 and (0 <= (caldate{t} - date_most_recent_tb) <= 0.5 or adc_tm1=1) then adh=adh- red_adh_tb_adc ;

* occasional severe drop in adherence / absorption (more likely when on PI) (only way I can think to explain v fail with no mutations on PI);
	f=uniform(0);
	if o_lpr=1 or o_taz=1 or o_dar=1 then  f=f/10;  
	if f < 0.010   then adh = adh - 0.6;   * changed from 0.005 to 0.020 - mar16; * changed from 0.020 to 0.010 and f/10 above changed from f/5 
	jun16 as cannot get levels of viral suppression higher than about 86%, even with adh_pattern_ 100 (best profile); * changed since nih talk 
	(for which program was padr_apr16; 

	* dec16 - for malawi_abc_e_jun16.sas - reduced from f < 0.010 to f < 0.001 and f=f/10 increased to f=f/100 (is prob is same for pi); 
	adh=round(adh,.001);if adh gt 1 then adh=1;if adh lt 0 then adh=0;
	
	end;

* higher effective adherence if on nnrti; * apr 2019 - remove e_adh and just have adh;
	if o_nev=1 or o_efa=1 then adh=adh + add_eff_adh_nnrti;


* apr 2019  - difference in adherence according to age and gender (at time 0 the adh pattern does not differ by age and gender - this code also moved
	down so applies after tox, tb/adc, pi effects;
e=uniform(0);

* note no effect when using e < 0.0;
if gender=1 and 15 <= age < 20 and adh > 0.8 and e < 0.3 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;
if gender=1 and 20 <= age < 25 and adh > 0.8 and e < 0.2 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;
if gender=1 and 25 <= age < 30 and adh > 0.8 and e < 0.1 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;
if gender=1 and 30 <= age < 35 and adh > 0.8 and e < 0.0 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;
if gender=1 and 35 <= age < 40 and adh > 0.8 and e < 0.0 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;
if gender=1 and 40 <= age < 45 and adh > 0.8 and e < 0.0 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;
if gender=1 and 45 <= age < 50 and adh > 0.8 and e < 0.0 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;
if gender=1 and 50 <= age      and adh > 0.8 and e < 0.0 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;

* _n6_ ;
if gender=2 and 15 <= age < 20 and adh > 0.8 and e < 0.2 then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;
if gender=2 and 20 <= age < 25 and adh < 0.8 and e < 0.1 then adh=0.90;
if gender=2 and 25 <= age < 30 and adh < 0.8 and e < 0.3 then adh=0.90;
if gender=2 and 30 <= age < 35 and adh < 0.8 and e < 0.5 then adh=0.90;
if gender=2 and 35 <= age < 40 and adh < 0.8 and e < 0.8 then adh=0.90;
if gender=2 and 40 <= age < 45 and adh < 0.8 and e < 0.8 then adh=0.90;
if gender=2 and 45 <= age < 50 and adh < 0.8 and e < 0.8 then adh=0.90;
if gender=2 and 50 <= age      and adh < 0.8 and e < 0.9 then adh=0.90;

e=uniform(0);
if gender=2 and sw=1 and adh > 0.8 and e < eff_prob_sw_lower_adh then do; r=uniform(0); adh=0.65; if r < 0.33 then adh=0.1; end;


* high risk of resistance with nnrtis even if v low adherence;
* dependent_on_time_step_length ;
if t ge 2 then adhmin=min(adh,adhmin_tm1);

* effect of art_low_adh_disrup_covid ;
if art_low_adh_disrup_covid = 1 then adh = adh - 0.25 ;


* REDUCED CD4 RISE FOR FASTER CD4 RISERS AFTER LONGER ON ART;

	pt_cd4_rise_art=patient_cd4_rise_art;

	if t ge 2 and 1  < tcur_tm1 <= 3  and patient_cd4_rise_art > 1 then pt_cd4_rise_art = patient_cd4_rise_art / 1.25;
	if t ge 2 and 3  < tcur_tm1 < 5  and patient_cd4_rise_art > 1 then pt_cd4_rise_art = patient_cd4_rise_art / 4;
	if t ge 2 and 5  <= tcur_tm1 and patient_cd4_rise_art > 1 then pt_cd4_rise_art = patient_cd4_rise_art / 12;  


* GREATER RATE OF CD4 LOSS WITH FAILING NNRTI REGIMEN - may want to change at some point from nactive_tm1 <=2 to vl_tm1>=500?;
	cd4_art_adj=0;   * dependent_on_time_step_length ;
	if ((o_nev=1 or o_efa=1) and 
	    (o_lpr=0 or o_taz=0 or o_dar=0) and nactive_tm1  <= 2) then cd4_art_adj = poorer_cd4rise_fail_nn;
 
	if poorer_cd4rise_fail_ii=1 and ((o_dol=1 ) and 
	    (o_lpr=0 or o_taz=0 or o_dar=0) and nactive_tm1  <= 2) then cd4_art_adj = poorer_cd4rise_fail_nn;

* AGE EFFECT ON CD4 RISE;
age_art_adj=((age-40)*-0.3);

* GREATER CD4 RISE on PI;
pi_art_adj=0; 
if (o_lpr=1 or o_dar=1 or o_taz=1) then pi_art_adj=3;

* GREATER CD4 RISE IN WOMEN;
gender_art_adj=0; 
if gender=2 then gender_art_adj=2;

cd4_art_adj = cd4_art_adj + age_art_adj + pi_art_adj + gender_art_adj;  * note for ts1m we divide cc by 3 below ;

if adh gt 1 then adh=1;


* AP 29-7-19;
* for output to calculate death rate and aids death rate in people on art by time from initiation, cd4 at art initiation and adh at start of art;  

* dependent_on_time_step_length ;  * including that code is divided into exact 0.25 units ;

if t ge 2 and tcur_tm1=0 and caldate{t} = yrart+0.25 then adh_in_first_period_onart = adh;
* ts1m:  if t ge 2 and tcur_tm1=0 and caldate{t} = yrart + (1/12) then adh_in_first_period_onart = adh;




* EFFECT OF NACTIVE >= 3 ART - on viral load / CD4 / resistance changes between t-1 and t;

* risk of new mutation(s) depends on latest viral load and effective adh level - * highest risk of res when adh between 0.5-0.8;
* nactive ge 3 - first 3 months ;
	if t ge 2 and nactive_tm1 ge 3 then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			 if adh >= 0.8 then do;vl=vmax_tm1 -3.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+180); newmut_tm1= 0.002*((vl+vl_tm1)/2); end;   * _i20_ ;
			 if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-2.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut_tm1=0.15*((vl+vl_tm1)/2); end;
			 if adh < 0.5 then do;  vl=vmax_tm1-0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
 			 if adh >= 0.8 then do;   vl=vmax_tm1-(3.0/3)+(sd_v_art*normal(0));   vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+180);    newmut_tm1= 0.002*((vl+vl_tm1)/2);  end;   
 			 if 0.5 <= adh < 0.8 then do;   vl=vmax_tm1-(2.0/3)+(sd_v_art*normal(0));   vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 );   newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 			 if adh < 0.5 then do;   vl=vmax_tm1-(0.5/3)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5 ); newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2); end;
 		end;
 		if tcur_tm1 = 1/12 then do;
 			 if adh >= 0.8 then do; vl=vmax_tm1-(3.0/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+180);  newmut_tm1= 0.002*((vl+vl_tm1)/2);  end;   
 			 if 0.5 <= adh < 0.8 then do; vl=vmax_tm1-(2.0/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 );  newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 			 if adh < 0.5 then do;   vl=vmax_tm1-(0.5/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2); end;
 		end;
 		if tcur_tm1 = 2/12 then do;
 			 if adh >= 0.8 then do; vl=vmax_tm1-3.0+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+180);  newmut_tm1= 0.002*((vl+vl_tm1)/2);  end;   
 			 if 0.5 <= adh < 0.8 then do; vl=vmax_tm1-2.0+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 );  newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 			 if adh < 0.5 then do;   vl=vmax_tm1-0.5+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			 cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2); end;
 		end;
*/
* nactive ge 3 - 3-6 months; * ( cd4 change and newmut depend only on most recent adh - vl depends on most recent and previous);
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;

			if        adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=v_min_art+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut_tm1= 0.002*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 <  0.8 and adh >= 0.8 then do; vl=1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut_tm1= 0.002*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl= 1.2 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl= 1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut_tm1= 0.10*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=2.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut_tm1= 0.10*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-2.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+7.5 ); newmut_tm1= 0.10*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.1*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1-0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-13 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.1*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1-0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.1*((vl+vl_tm1)/2); end;
	
		end;
* nactive ge 3 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl=v_min_art+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;   * oct 2014;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30); newmut_tm1=  0.002*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=1.2+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;* ie risk of rebound;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut_tm1=0.15*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.5+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;* ie almost certain rebound;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
		end;
	end;



* EFFECT OF NACTIVE = 2.75 ART - on viral load / CD4 / resistance changes between t-1 and t;

* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 2.75 - first 3 months ;
	if t ge 2 and nactive_tm1 = 2.75 then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-2.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+80); newmut_tm1= 0.01*((vl+vl_tm1)/2); end;   
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-1.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 ); newmut_tm1=0.15*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+4 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
 			if adh >= 0.8 then do; vl=vmax_tm1-(2.6/3)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
  		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+80);   newmut_tm1= 0.01*((vl+vl_tm1)/2);  end;   
 			if 0.5 <= adh < 0.8 then do; vl=vmax_tm1-(1.6/3)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 );  newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;   vl=vmax_tm1-(0.4/3)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+4 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 		end;
 			if tcur_tm1=1/12 then do;
 			if adh >= 0.8 then do;  vl=vmax_tm1-(2.6/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+80);  newmut_tm1= 0.01*((vl+vl_tm1)/2);  end;    
 			if 0.5 <= adh < 0.8 then do; vl=vmax_tm1-(1.6/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 );  newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;   vl=vmax_tm1-(0.4/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+4 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 		end;
 			if tcur_tm1=2/12 then do;
 			if adh >= 0.8 then do;  vl=vmax_tm1-2.6+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+80);  newmut_tm1= 0.01*((vl+vl_tm1)/2);  end;    
 			if 0.5 <= adh < 0.8 then do; vl=vmax_tm1-1.6+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30 );  newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;   vl=vmax_tm1-0.4+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+4 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2);  end;
 		end;
*/
* nactive ge 3 - 3-6 months; * ( cd4 change and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;
	
			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=v_min_art+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+28 ); newmut_tm1= 0.01*((vl+vl_tm1)/2); end;
		 	if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl=1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+28 ); newmut_tm1= 0.01*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl= 1.2 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
    		cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+28 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl= 1.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut_tm1= 0.15*((vl+vl_tm1)/2); end;
 			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=2.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut_tm1= 0.15*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-1.8+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+4.5 ); newmut_tm1= 0.15*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-14 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2); end;
 			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-14 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-14 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.15*((vl+vl_tm1)/2); end;

		end;
* nactive ge 3 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl=v_min_art+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+28); newmut_tm1= 0.01*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=1.2+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;* ie risk of rebound;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut_tm1=0.18*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.4+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;* ie almost certain rebound;
			cc_tm1=cd4_art_adj+(-14 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.18*((vl+vl_tm1)/2);  end;
		end;
	end;



* EFFECT OF NACTIVE = 2.5 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 2.5 - first 3 months ;
	if t ge 2 and nactive_tm1 = 2.5  then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-2.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+40); newmut_tm1= 0.03*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+23 ); newmut_tm1=0.2*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
 		if adh >= 0.8 then do;  vl=vmax_tm1-(2.2/3)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+40);   newmut_tm1= 0.03*((vl+vl_tm1)/2);   end;
 			if 0.5 <= adh < 0.8 then do;  vl=vmax_tm1-(1.2/3)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+23 );  newmut_tm1=0.2*((vl+vl_tm1)/2);   end;
 			if adh < 0.5 then do;    vl=vmax_tm1-(0.3/3)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2);   end;
 		end;
 		if tcur_tm1=1/12 then do; 
		if adh >= 0.8 then do;  vl=vmax_tm1-(2.2/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+40);  newmut_tm1= 0.03*((vl+vl_tm1)/2);  end;
 			if 0.5 <= adh < 0.8 then do; vl=vmax_tm1-(1.2/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+23 );  newmut_tm1=0.2*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;   vl=vmax_tm1-(0.3/2)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2);   end;
 		end;
 		if tcur_tm1=2/12 then do; 
 			if adh >= 0.8 then do;  vl=vmax_tm1-2.2+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+40); newmut_tm1= 0.03*((vl+vl_tm1)/2);  end;
 			if 0.5 <= adh < 0.8 then do;  vl=vmax_tm1-1.2+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+23 );  newmut_tm1=0.2*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;   vl=vmax_tm1-0.3+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2);   end;
 		end;
*/
* nactive = 2.5 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;
	
			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+25 ); newmut_tm1= 0.03*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl= 1.2 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+25 ); newmut_tm1= 0.03*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl= 1.2 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+25 ); newmut_tm1= 0.03*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=1.8+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=2.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-1.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut_tm1= 0.2 *((vl+vl_tm1)/2); end;

 			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-15 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1-0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-15 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1-0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-15 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2); end;
		end;
* nactive = 2.5 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl= 1.2+(sd_v_art*normal(0));
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+25); newmut_tm1= 0.03*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl= 1.2 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie risk of rebound;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1=0.2*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie almost certain rebound;
		    cc_tm1=cd4_art_adj+(-15 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2); end;
		end;
	end;


* EFFECT OF NACTIVE = 2.25 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 2.25 - first 3 months ;
	if t ge 2 and nactive_tm1 = 2.25  then do;
		if 0 <= tcur_tm1 < 0.25 then do;
 			if adh >= 0.8 then do; vl=vmax_tm1-1.8+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+35); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-1.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+20 ); newmut_tm1=0.25*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.25+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+2 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.25*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
  			if adh >= 0.8 then do;  vl=vmax_tm1-(1.8/3)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+35);   newmut_tm1= 0.05*((vl+vl_tm1)/2);   end;
 			if 0.5 <= adh < 0.8 then do;  vl=vmax_tm1-(1.1/3)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+20 );   newmut_tm1=0.25*((vl+vl_tm1)/2);   end;
 			if adh < 0.5 then do;   vl=vmax_tm1-(0.25/3)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+2 );   newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.25*((vl+vl_tm1)/2);  end;
 		end;
 			if tcur_tm1=1/12 then do; 
  			if adh >= 0.8 then do;  vl=vmax_tm1-(1.8/2)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+35);  newmut_tm1= 0.05*((vl+vl_tm1)/2);  end;
 			if 0.5 <= adh < 0.8 then do;  vl=vmax_tm1-(1.1/2)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+20 );  newmut_tm1=0.25*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;   vl=vmax_tm1-(0.25/2)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+2 );  newmut_tm1=0.05*((vl+vl_tm1)/2);   if (o_nev=1 or o_efa=1) then newmut_tm1=0.25*((vl+vl_tm1)/2);  end;
 		end;
 			if tcur_tm1=2/12 then do; 
  			if adh >= 0.8 then do;  vl=vmax_tm1-1.8+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+35);   newmut_tm1= 0.05*((vl+vl_tm1)/2);  end;
 			if 0.5 <= adh < 0.8 then do;  vl=vmax_tm1-1.1+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+20 );   newmut_tm1=0.25*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;    vl=vmax_tm1-0.25+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+2 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.25*((vl+vl_tm1)/2); end;
 		end;
*/
* nactive = 2.25 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;

			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=1.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+23 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl= 1.4 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+23 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl= 1.4 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+23 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=2.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=2.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-1.35+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-2  ); newmut_tm1= 0.2 *((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.25 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-15.5 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1-0.25+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-15.5 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2);  end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1-0.25+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-15.5 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.2*((vl+vl_tm1)/2);  end;

		end;
* nactive = 2.25 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl= 1.4+(sd_v_art*normal(0));
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+23); newmut_tm1= 0.08*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl= 1.6 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie risk of rebound;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut_tm1=0.25*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.25+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie almost certain rebound;
		    cc_tm1=cd4_art_adj+(-15.5 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.25*((vl+vl_tm1)/2); end;
		end;
	end;


* EFFECT OF NACTIVE = 2 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 2 - first 3 months ;
	if t ge 2 and nactive_tm1 = 2  then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			if adh >= 0.8 then do; vl= vmax_tm1 - 1.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30); newmut_tm1= 0.1*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl= vmax_tm1 - 0.9+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+1 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
		 	if adh >= 0.8 then do; vl= vmax_tm1 - (1.5/3)+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1; 
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30); newmut_tm1= 0.1*((vl+vl_tm1)/2);  end;
 			if 0.5 <= adh < 0.8 then do; vl= vmax_tm1 - (0.9/3)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+15 );  newmut_tm1=0.3*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;   vl=vmax_tm1-(0.2/3)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+1 );  newmut_tm1=0.05*((vl+vl_tm1)/2);  if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2);  end;
 		end;
 		if tcur_tm1=1/12 then do; 
		 	if adh >= 0.8 then do; vl= vmax_tm1 - 1.5/2+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1; 
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30);  newmut_tm1= 0.1*((vl+vl_tm1)/2);  end;
 			if 0.5 <= adh < 0.8 then do; vl= vmax_tm1 - (0.9/2)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+15 );  newmut_tm1=0.3*((vl+vl_tm1)/2);  end;
 			if adh < 0.5 then do;  vl=vmax_tm1-(0.2/2)+(sd_v_art*normal(0));  vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+1 );   newmut_tm1=0.05*((vl+vl_tm1)/2);   if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2);  end;
 		end;
 		if tcur_tm1=2/12 then do; 
 			if adh >= 0.8 then do; vl= vmax_tm1 - 1.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+30); newmut_tm1= 0.1*((vl+vl_tm1)/2); end;
 			if 0.5 <= adh < 0.8 then do;vl= vmax_tm1 - 0.9+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+15 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
 			if adh < 0.5 then do;  vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
 		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+1 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
 		end;
*/
* nactive = 2 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;

 			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=2.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+21 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 2.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+7.5); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl=vmax_tm1 - 2.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+7.5); newmut_tm1= 0.05*((vl+vl_tm1)/2); end;

 			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=2.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+7 ); newmut_tm1= 0.3 *((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-4.5 ); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-4.5 ); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2);  end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2);  end;

		end;
* nactive = 2 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
		 	if adh >= 0.8 then do; vl=vmax_tm1-2.5+(sd_v_art*normal(0));
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+21); newmut_tm1= 0.1*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie risk of rebound;
		    cc_tm1=cd4_art_adj+(-4.5 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie almost certain rebound;
    		cc_tm1=cd4_art_adj+(-16 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
	end;



* EFFECT OF NACTIVE = 1.75 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 1.75 first 3 months ;
	if t ge 2 and nactive_tm1 = 1.75  then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			if adh >= 0.8 then do; vl= vmax_tm1 - 1.25+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+25); newmut_tm1= 0.15*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl= vmax_tm1 - 0.8+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.15+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-1 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
			if adh >= 0.8 then do; vl= vmax_tm1 - (1.25/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+25); newmut_tm1= 0.15*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl= vmax_tm1 - (0.8/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-(0.15/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-1 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
			if tcur_tm1=1/12 then do; 
			if adh >= 0.8 then do; vl= vmax_tm1 - (1.25/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+25); newmut_tm1= 0.15*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl= vmax_tm1 - (0.8/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-(0.15/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-1 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
			if tcur_tm1=2/12 then do; 
			if adh >= 0.8 then do; vl= vmax_tm1 - 1.25+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+25); newmut_tm1= 0.15*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl= vmax_tm1 - 0.8+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.15+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-1 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
*/
* nactive = 1.75 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;

			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=2.7+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+19 ); newmut_tm1= 0.10*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 1.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+1.5 ); newmut_tm1= 0.10*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl=vmax_tm1 - 1.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+1.5 ); newmut_tm1= 0.10*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-2.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+4); * may17; newmut_tm1= 0.3 *((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 1.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-6 ); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-1.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-6 ); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.15+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16.5 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2);  end; *may17;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1-0.15+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16.5); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		 	if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1-0.15+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16.5); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;

		end;
* nactive = 1.75 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl=vmax_tm1-2.0+(sd_v_art*normal(0));
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+19); newmut_tm1= 0.15*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-1.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie risk of rebound;
		    cc_tm1=cd4_art_adj+(-7.5 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie almost certain rebound;
		    cc_tm1=cd4_art_adj+(-16.5 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2);  end;
		end;
	end;




* EFFECT OF NACTIVE = 1.5 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 1.5 - first 3 months ;
	if t ge 2 and nactive_tm1 = 1.5  then do;
		if 0 <= tcur_tm1 < 0.25 then do;
 			if adh >= 0.8 then do; vl=vmax_tm1-0.9+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+20); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-3 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
 			if adh >= 0.8 then do; vl=vmax_tm1-(0.9/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+20); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.6/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-3 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
		if tcur_tm1=1/12 then do; 
 			if adh >= 0.8 then do; vl=vmax_tm1-(0.9/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+20); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.6/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-3 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
			if tcur_tm1=2/12 then do; 
 			if adh >= 0.8 then do; vl=vmax_tm1-0.9+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+20); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-3 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
*/
* nactive = 1.5 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;
			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 1.7+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3  ); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-4.5 ); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl=vmax_tm1 - 1.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-4.5 ); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
	
			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 1.5 + (sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.8 + (sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-10); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.8 +(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-10); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.10+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-17); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1-0.10+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-17); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1-0.10+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-17); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;

		end;
* nactive = 1.5 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl=vmax_tm1-1.4+(sd_v_art*normal(0));
			cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut_tm1= 0.2*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.7+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie risk of rebound;
		    cc_tm1=cd4_art_adj+(-10); newmut_tm1=0.3*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie almost certain rebound;
			cc_tm1=cd4_art_adj+(-17); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2);  end;
		end;
	end;




* EFFECT OF NACTIVE = 1.25 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 1.25 - first 3 months ;
	if t ge 2 and nactive_tm1 = 1.25  then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-0.8+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+17); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut_tm1=0.35*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-6 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-(0.8/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+17); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.5/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut_tm1=0.35*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.05/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-6 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
			if tcur_tm1=1/12 then do; 
			if adh >= 0.8 then do; vl=vmax_tm1-(0.8/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+17); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.5/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut_tm1=0.35*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.05/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-6 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
			if tcur_tm1=2/12 then do; 
			if adh >= 0.8 then do; vl=vmax_tm1-0.8+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+17); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+8  ); newmut_tm1=0.35*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-6 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.3*((vl+vl_tm1)/2); end;
		end;
*/
* nactive = 1.25 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this inlcudes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;
			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 1.15+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-5  ); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 1.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-7  ); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl=vmax_tm1 - 1.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-7.5); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.9 + (sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-9 ); newmut_tm1= 0.35*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.65+ (sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11.5); newmut_tm1= 0.35*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.65+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11.5); newmut_tm1= 0.35*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-17.5); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.35*((vl+vl_tm1)/2);  end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1-0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-17.5 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.35*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1-0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-17.5 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.35*((vl+vl_tm1)/2); end;

		end;
* nactive = 1.25 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl=vmax_tm1-1.15+(sd_v_art*normal(0));
		    cc_tm1=cd4_art_adj+(-5); newmut_tm1= 0.3*((vl+vl_tm1)/2); end;
		 	if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie risk of rebound;
		    cc_tm1=cd4_art_adj+(-12 ); newmut_tm1=0.35*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie almost certain rebound;
		    cc_tm1=cd4_art_adj+(-17 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.35*((vl+vl_tm1)/2); end;
		end;
	end;




* EFFECT OF NACTIVE = 1 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 1  - first 3 months ;
	if t ge 2 and nactive_tm1 = 1  then do;
		if 0 <= tcur_tm1 < 0.25 then do;
		 	if adh >= 0.8 then do; vl=vmax_tm1-0.7+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13); newmut_tm1= 0.4*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5 ); newmut_tm1=0.4*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-10 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.4*((vl+vl_tm1)/2);  end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
		 	if adh >= 0.8 then do; vl=vmax_tm1-(0.7/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13); newmut_tm1= 0.4*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.4/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5 ); newmut_tm1=0.4*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.1/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-10 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.4*((vl+vl_tm1)/2);  end;
		end;
		if tcur_tm1=1/12 then do; 
		 	if adh >= 0.8 then do; vl=vmax_tm1-(0.7/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13); newmut_tm1= 0.4*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.4/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5 ); newmut_tm1=0.4*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.1/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-10 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.4*((vl+vl_tm1)/2);  end;
		end;
		if tcur_tm1=2/12 then do; 
		 	if adh >= 0.8 then do; vl=vmax_tm1-0.7+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+13); newmut_tm1= 0.4*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5 ); newmut_tm1=0.4*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-10 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.4*((vl+vl_tm1)/2);  end;
		end;

*/
* nactive = 1 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this includes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;
	
			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 0.9+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-9  ); newmut_tm1= 0.4 *((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 0.9+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-9  ); newmut_tm1= 0.4 *((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl=vmax_tm1 - 0.9+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-9  ); newmut_tm1= 0.4 *((vl+vl_tm1)/2); end;
	
			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-0.7+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11 ); newmut_tm1= 0.4 *((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1= 0.4 *((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1= 0.4 *((vl+vl_tm1)/2); end;
	
			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.4*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.4*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.4*((vl+vl_tm1)/2); end;
		end;
*  nactive = 1 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl=vmax_tm1-0.9+(sd_v_art*normal(0));
		    cc_tm1=cd4_art_adj+(-9 ); newmut_tm1= 0.4*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie risk of rebound;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1=0.4*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie almost certain rebound;
			cc_tm1=cd4_art_adj+(-18 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.4*((vl+vl_tm1)/2); end;
		end;
	end;



* EFFECT OF NACTIVE = 0.75 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 0.8  - first 3 months ;
	if t ge 2 and nactive_tm1 = 0.75 then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-0.55+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.25+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut_tm1=0.45*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.45*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-(0.55/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.25/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut_tm1=0.45*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.1/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.45*((vl+vl_tm1)/2); end;
		end;
		if tcur_tm1=1/12 then do; 
			if adh >= 0.8 then do; vl=vmax_tm1-(0.55/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.25/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut_tm1=0.45*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.1/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.45*((vl+vl_tm1)/2); end;
		end;
		if tcur_tm1=2/12 then do; 
			if adh >= 0.8 then do; vl=vmax_tm1-0.55+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+10 ); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.25+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+3 ); newmut_tm1=0.45*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.45*((vl+vl_tm1)/2); end;
		end;
*/
* nactive = 0.75- 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this includes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;

			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 0.75+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-10.5 ); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl=vmax_tm1 - 0.7+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11 ); newmut_tm1= 0.45 *((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl=vmax_tm1 - 0.7+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-11 ); newmut_tm1= 0.45 *((vl+vl_tm1)/2); end;
	
			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-0.55+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-12.5 ); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.35+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-14.5 ); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16 ); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.45*((vl+vl_tm1)/2);  end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.45*((vl+vl_tm1)/2);  end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.45*((vl+vl_tm1)/2); end;
		end;
*  nactive = 0.75- GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
		 	if adh >= 0.8 then do; vl=vmax_tm1-0.75+(sd_v_art*normal(0));
		    cc_tm1=cd4_art_adj+(-10.5); newmut_tm1= 0.45*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie risk of rebound;
		    cc_tm1=cd4_art_adj+(-14 ); newmut_tm1=0.45*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1; * ie almost certain rebound;
		    cc_tm1=cd4_art_adj+(-17 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.45*((vl+vl_tm1)/2);  end;
		end;
	end;



* EFFECT OF NACTIVE = 0.5 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 0.5  - first 3 months ;
	if t ge 2 and nactive_tm1 = 0.5 then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-12 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);  end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-(0.4/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.1/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.1/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-12 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);  end;
		end;
		if tcur_tm1=1/12 then do; 
			if adh >= 0.8 then do; vl=vmax_tm1-(0.4/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.1/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.1/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-12 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);  end;
		end;
		if tcur_tm1=2/12 then do; 
			if adh >= 0.8 then do; vl=vmax_tm1-0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+5); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(pt_cd4_rise_art*+0 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-12 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);  end;
		end;
*/
* nactive = 0.5 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this includes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;

			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl= vmax_tm1- 0.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-12 ); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl= vmax_tm1- 0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl= vmax_tm1- 0.5+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
	
			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-14 ); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl= vmax_tm1- 0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16 ); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16 ); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);  end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);  end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2); end;
		end;
*  nactive = 0.5 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
		 	if adh >= 0.8 then do; vl=vmax_tm1-0.6+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-12); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.3+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;* ie risk of rebound;
		    cc_tm1=cd4_art_adj+(-15 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.1+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;* ie almost certain rebound;
		    cc_tm1=cd4_art_adj+(-17 ); newmut_tm1=0.05*((vl+vl_tm1)/2);if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);  end;
		end;
	end;



* EFFECT OF NACTIVE = 0.25 ART - on viral load / CD4 / resistance changes between t-1 and t;
* risk of new mutation(s) depends on latest viral load and adh level - * highest risk of res when adh between 0.5-0.8;
* nactive = 0.25  - first 3 months ;
	if t ge 2 and nactive_tm1 = 0.25 then do;
		if 0 <= tcur_tm1 < 0.25 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
    		cc_tm1=cd4_art_adj+(-2); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-7 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2); end;
		end;
/*
* ts1m - replace above single block with three blocks below: (note that newmut and cc are divided by 3 lower down for ts1m)
 		if 0 <= tcur_tm1 < 1/12 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-(0.3/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
    		cc_tm1=cd4_art_adj+(-2); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.05/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-7 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.1/3)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2); end;
		end;
		if tcur_tm1=1/12 then do; 
			if adh >= 0.8 then do; vl=vmax_tm1-(0.3/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
    		cc_tm1=cd4_art_adj+(-2); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-(0.05/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-7 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+(0.1/2)+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2); end;
		end;
		if tcur_tm1=2/12 then do; 
			if adh >= 0.8 then do; vl=vmax_tm1-0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
    		cc_tm1=cd4_art_adj+(-2); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-7 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1+0.1+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-13 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2); end;
		end;
*/
* nactive = 0.25 - 3-6 months; * ( cd4 and newmut depend only on most recent adh - vl depends on most recent and previous);
* this includes people on current regimen for > 6 months but with high vl - eg due to previous poor adherence;
		if  (0.25 <= tcur_tm1 < 0.5 or (tcur_tm1 >= 0.5  and vl_tm1 ge 4)) and t ge 2 then do;
	
 			if adh_tm1 >= 0.8 and adh >= 0.8 then do; vl= vmax_tm1- 0.4+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-14 ); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh_tm1 < 0.8 and adh >= 0.8 then do; vl= vmax_tm1- 0.35+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-14.5); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if adh_tm1 < 0.5 and adh >= 0.8 then do; vl= vmax_tm1- 0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-16 ); newmut_tm1= 0.25*((vl+vl_tm1)/2); end;

			if adh_tm1 >= 0.8 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-15 ); newmut_tm1= 0.5*((vl+vl_tm1)/2);  end;
			if 0.5 <= adh_tm1 < 0.8 and 0.5 <= adh < 0.8 then do; vl= vmax_tm1- 0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
 			cc_tm1=cd4_art_adj+(-17.5 ); newmut_tm1= 0.5*((vl+vl_tm1)/2);  end;
			if adh_tm1 < 0.5 and 0.5 <= adh < 0.8 then do; vl=vmax_tm1 - 0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-17.5 ); newmut_tm1= 0.25*((vl+vl_tm1)/2);  end;

			if adh_tm1 >= 0.8 and  adh < 0.5 then do; vl=vmax_tm1-0.00+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);end;
			if 0.5 <= adh_tm1 < 0.8 and adh < 0.5 then do; vl=vmax_tm1+0.00+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);end;
			if adh_tm1 < 0.5 and adh < 0.5 then do; vl=vmax_tm1+0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
		    cc_tm1=cd4_art_adj+(-18 ); newmut_tm1= 0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);end;
		end;
*  nactive = 0.25 - GE 6 months;
		if (tcur_tm1 ge 0.5 and vl_tm1 lt 4) then do;
			if adh >= 0.8 then do; vl=vmax_tm1-0.3+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-12 ); newmut_tm1= 0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.1+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;* ie risk of rebound;
		    cc_tm1=cd4_art_adj+(-15 ); newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.0+(sd_v_art*normal(0)); vc_tm1=vl-vl_tm1;* ie almost certain rebound;
		    cc_tm1=cd4_art_adj+(-17 ); newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then newmut_tm1=0.5*((vl+vl_tm1)/2);end;
		end;
	end;


* EFFECT OF NACTIVE = 0 ART - on viral load / CD4 / resistance changes between t-1 and t;

	if t ge 2 and nactive_tm1=0 then do;
			if adh >= 0.8 then do; vl=vmax_tm1-0.2+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-15); *cd4=cd4_tm1+cc_tm1;newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if 0.5 <= adh < 0.8 then do;vl=vmax_tm1-0.05+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-17 ); *cd4=cd4_tm1+cc_tm1;newmut_tm1=0.5*((vl+vl_tm1)/2); end;
			if adh < 0.5 then do;  vl=vmax_tm1-0.0+(sd_v_art*normal(0));vc_tm1=vl-vl_tm1;
			cc_tm1=cd4_art_adj+(-18 ); *cd4=cd4_tm1+cc_tm1;newmut_tm1=0.05*((vl+vl_tm1)/2); if (o_nev=1 or o_efa=1) then 
			newmut_tm1=0.5*((vl+vl_tm1)/2);end;
	end;


if t ge 2 and nactive_tm1  >= 0 and cc_tm1 > 0 then do;
* dependent_on_time_step_length ;
	if 100 < cd4_tm1 <= 200 then cc_tm1=cc_tm1*0.85;
	else if  cd4_tm1 >  200 then cc_tm1=cc_tm1*0.7;
end;


* ts1m: 
* newmut_tm1 = newmut_tm1 / 3;
* cc_tm1 = cc_tm1 / 3;

if t ge 2 then cd4=cd4_tm1+cc_tm1; 

	if vl > 6.5 then vl=6.5;

	if . < cd4  lt 0 then cd4 =0;

* add variability to cd4 for those on art;
	if t ge 2 and nactive_tm1 ge 0 then do; cd4 =(sqrt(cd4 )+ sd_cd4*normal(0))**2; end;

	if  t ge 2 and tcur_tm1 ge 0 and cd4  gt cmax then cd4 =cmax+(normal(0)*50);
	if . < vl lt 0 then vl=0;

	if t ge 2 then do;
		newmut_tm1=newmut_tm1*fold_change_mut_risk;
		if started_prep_hiv_test_sens and prep=1 then newmut_tm1=newmut_tm1*0.33; * due to test at 1 month from start of prep - jul17;
		if newmut_tm1 gt 1 then newmut_tm1=1;
	end;


* define vmax and cmin;
	if t ge 2 then do;
		vmax   =max(vmax     ,vl);
		cmin   =min(cmin_tm1 ,cd4 );
	end;




* BIRTH WITH INFECTED CHILD;
* amended jun18 ;
	onart_birth_with_inf_child=0;onart_birth_with_inf_child_res=0;give_birth_with_hiv=0;birth_with_inf_child=0;	

	if pregnant=1 and hiv=1 and t ge 2 then do; 
		give_birth_with_hiv=1;
		u=uniform(0);
		if . < vl <= 3 then u=u*1000; 
		if 3 < vl <= 4 then u=u*2;
		if 4 < vl <= 5 then u=u*1;
		if 5 < vl then u=u/2;
		if . < caldate{t}-yrart <= 0.75 and onart=1 then u = u * 10 ; * jul18 - this is due to fact that pregnancy and birth are in same period and in 
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

	if onart =1 and birth_with_inf_child=1 then do; onart_birth_with_inf_child=1; ev_birth_with_inf_ch_onart = 1; end;
	if onart_birth_with_inf_child=1 and child_with_resistant_hiv=1 then onart_birth_with_inf_child_res=1;


* NEW RESISTANCE MUTATIONS ARISING (and dominating)
- if resistance appears between t-1 and t it doesnt affect the viral load until t+1;

	d=uniform(0);

	if t ge 2 and d lt newmut_tm1 then do;

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
		if o_dol_tm1=1 then do; 
		pr_res_dol=0.03; if higher_rate_res_dol=1 then pr_res_dol=0.1; 
		if art_tld_eod_disrup_covid = 1 then pr_res_dol = pr_res_dol * 2; 
			ax=uniform(0); if ax < pr_res_dol then c_inpm=1;  
			bx=uniform(0); if bx < pr_res_dol then c_insm=1;
		end;

	end;



c_totmut=c_rt184m+c_rttams+c_rt65m+c_rt151m+c_rt103m+c_rt181m+c_rt190m
	+c_pr32m+c_pr33m+c_pr46m+c_pr47m+c_pr50vm+c_pr50lm+c_pr54m+c_pr76m
	+c_pr82m+c_pr84m+c_pr88m+c_pr90m+c_inpm+c_insm;

c_totmut_pi=.;
c_totmut_pi=c_pr32m+c_pr33m+c_pr46m+c_pr47m+c_pr50vm+c_pr50lm+c_pr54m+c_pr76m
	+c_pr82m+c_pr84m+c_pr88m+c_pr90m;




	* NEW RESISTANCE TO NNRTI ARISING AS A RESULT OF ART INTERRUPTION - simultaneously stopping all drugs in a regimen
	containing an NNRTI may result in functional monotherapy because NNRTIs have much longer half-lives ; 

	if interrupt=1 and (o_nev_tm1=1 or o_efa_tm1=1) and (c_rt103m_tm1=0 and c_rt181m_tm1=0 and c_rt190m_tm1=0) then do;
		ax=uniform(0); if ax lt 0.018 then c_rt103m=1; 
		bx=uniform(0); if bx lt 0.006 then c_rt181m=1; 
		cx=uniform(0); if cx lt 0.006 then c_rt190m=1; 
	end;


	* DEFINE VARIABLES INDICATING WHETHER EVER HAD A GIVEN MUTATION (AS DOMINANT);
	*Acquisition of new resistance mutations;
	acq_rt65m=0;  if e_rt65m  ne 1 and c_rt65m=1  then do; acq_rt65m=1; dt_acq_rt65m=caldate{t}; end;
	acq_rt184m=0; if e_rt184m ne 1 and c_rt184m=1 then do; acq_rt184m=1;dt_acq_rt184m=caldate{t}; end;
	acq_rtm=0;    if e_totmut    lt 1 and (c_rt184m=1 or c_rttams ge 1 or c_rt65m=1 or c_rt151m=1 or c_rt103m=1 or c_rt181m=1 or c_rt190m=1
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
	e_totmut   =e_rt184m+e_rttams+e_rt65m+e_rt151m+e_rt103m+e_rt181m+e_rt190m
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
		a=uniform(0);if c_rt184m=1 and (tss_3tc    ge 1/12 or p_3tc=0)
		and a < .8 then c_rt184m=0;

		a=uniform(0);if c_rt151m=1 and (tss_zdv    ge 1/12 or p_zdv=0) and (tss_3tc    ge 1/12 or p_3tc=0) 
		and a < .6 then c_rt151m=c_rt151m_inf;
	
		a=uniform(0);if c_rt65m=1 and (tss_ten    ge 1/12 or p_ten=0) and (tss_3tc    ge 1/12 or p_3tc=0)
		and a < .6 then c_rt65m=c_rt65m_inf;

		a=uniform(0);if c_rttams ge 1 and (tss_zdv    ge 1/12 or p_zdv=0) and (tss_ten    ge 1/12 or p_ten=0)
		and a < .4 then c_rttams=c_rttams_inf;

	* nns; 
		a=uniform(0);if c_rt103m=1 and (tss_efa    ge 1/12 or p_efa=0) and (tss_nev    ge 1/12 or p_nev=0) 
		and a < rate_loss_acq_nnm_offart then c_rt103m=c_rt103m_inf;

		a=uniform(0);if c_rt181m=1 and (tss_efa    ge 1/12 or p_efa=0) and (tss_nev    ge 1/12 or p_nev=0) 
		and a < rate_loss_acq_nnm_offart then c_rt181m=c_rt181m_inf;

		a=uniform(0);if c_rt190m=1 and (tss_efa    ge 1/12 or p_efa=0) and (tss_nev    ge 1/12 or p_nev=0) 
		and a < rate_loss_acq_nnm_offart then c_rt190m=c_rt190m_inf;

	* pis;

		a=uniform(0);if c_pr32m ge 1 and (tss_lpr ge 1/12 or p_lpr=0) and (tss_dar ge 1/12 or p_dar=0) and (tss_taz ge 1/12 or p_taz=0) and a < rate_loss_acq_pim_offart then c_pr32m=c_pr32m_inf;
		a=uniform(0);if c_pr33m ge 1 and (tss_lpr ge 1/12 or p_lpr=0) and (tss_dar ge 1/12 or p_dar=0) and (tss_taz ge 1/12 or p_taz=0) and a < rate_loss_acq_pim_offart then c_pr33m=c_pr33m_inf;
		a=uniform(0);if c_pr46m ge 1 and (tss_lpr ge 1/12 or p_lpr=0) and (tss_dar ge 1/12 or p_dar=0) and a < rate_loss_acq_pim_offart then c_pr46m=c_pr46m_inf;
		a=uniform(0);if c_pr47m ge 1 and (tss_lpr ge 1/12 or p_lpr=0) and (tss_dar ge 1/12 or p_dar=0) and a < rate_loss_acq_pim_offart then c_pr47m=c_pr47m_inf;
		a=uniform(0);if c_pr50vm ge 1 and (tss_dar ge 1/12 or p_dar=0)  and (tss_lpr ge 1/12 or p_lpr=0) and a < rate_loss_acq_pim_offart then c_pr50vm=c_pr50vm_inf;
		a=uniform(0);if c_pr54m ge 1 and (tss_lpr ge 1/12 or p_lpr=0) and (tss_dar ge 1/12 or p_dar=0) and (tss_taz ge 1/12 or p_taz=0) and a < rate_loss_acq_pim_offart then c_pr54m=c_pr54m_inf;
		a=uniform(0);if c_pr76m ge 1 and (tss_dar ge 1/12 or p_dar=0) and (tss_lpr ge 1/12 or p_lpr=0) and a < rate_loss_acq_pim_offart then c_pr76m=c_pr76m_inf;
		a=uniform(0);if c_pr82m ge 1 and (tss_lpr ge 1/12 or p_lpr=0) and (tss_dar ge 1/12 or p_dar=0) and (tss_taz ge 1/12 or p_taz=0) and a < rate_loss_acq_pim_offart then c_pr82m=c_pr82m_inf;
		a=uniform(0);if c_pr84m ge 1 and (tss_dar ge 1/12 or p_dar=0) and (tss_taz ge 1/12 or p_taz=0) and (tss_lpr ge 1/12 or p_lpr=0) and a < rate_loss_acq_pim_offart then c_pr84m=c_pr84m_inf;
		a=uniform(0);if c_pr50lm ge 1 and (tss_taz ge 1/12 or p_taz=0) and a < rate_loss_acq_pim_offart then c_pr50lm=c_pr50lm_inf;
		a=uniform(0);if c_pr88m ge 1 and (tss_taz ge 1/12 or p_taz=0) and a < rate_loss_acq_pim_offart then c_pr88m=c_pr88m_inf;
		a=uniform(0);if c_pr90m ge 1 and (tss_lpr ge 1/12 or p_lpr=0) and (tss_dar ge 1/12 or p_dar=0) and a < rate_loss_acq_pim_offart then c_pr90m=c_pr90m_inf;

	* integrase inhibitor; 

		a=uniform(0);if c_inpm ge 1 and (tss_dol ge 1/12 or p_dol=0) and a < rate_loss_acq_iim_offart then c_inpm=c_inpm_inf;
		a=uniform(0);if c_insm ge 1 and (tss_dol ge 1/12 or p_dol=0) and a < rate_loss_acq_iim_offart then c_insm=c_insm_inf;

end;


* LOSS OF TRANSMITTED RESISTANCE MUTATIONS FROM MAJORITY VIRUS ("LOSS OF PERSISTENCE");

x=uniform(0); if t ge 2 and c_rttams_inf ge 1 and naive=1 and c_rttams ge 1 and x < rate_loss_persistence then c_rttams=c_rttams_tm1-1;  
x=uniform(0); if c_rt184m_inf = 1 and naive=1 and c_rt184m=1 and x < 3 * rate_loss_persistence then c_rt184m=0;
x=uniform(0); if c_rt65m_inf = 1 and naive=1 and c_rt65m=1 and x < rate_loss_persistence then c_rt65m=0;
x=uniform(0); if c_rt151m_inf = 1 and naive=1 and c_rt151m=1 and x < rate_loss_persistence then c_rt151m=0;
x=uniform(0); if c_rt103m_inf = 1 and naive=1 and c_rt103m=1 and x < rate_loss_persistence then c_rt103m=0;
x=uniform(0); if c_rt181m_inf = 1 and naive=1 and c_rt181m=1 and x < rate_loss_persistence then c_rt181m=0;
x=uniform(0); if c_rt190m_inf = 1 and naive=1 and c_rt190m=1 and x < rate_loss_persistence then c_rt190m=0;
x=uniform(0); if c_pr32m_inf = 1 and naive=1 and c_pr32m=1 and x < rate_loss_persistence then c_pr32m=0;
x=uniform(0); if c_pr33m_inf = 1 and naive=1 and c_pr33m=1 and x < rate_loss_persistence then c_pr33m=0;
x=uniform(0); if c_pr46m_inf = 1 and naive=1 and c_pr46m=1 and x < rate_loss_persistence then c_pr46m=0;
x=uniform(0); if c_pr47m_inf = 1 and naive=1 and c_pr47m=1 and x < rate_loss_persistence then c_pr47m=0;
x=uniform(0); if c_pr50lm_inf = 1 and naive=1 and c_pr50lm=1 and x < rate_loss_persistence then c_pr50lm=0;
x=uniform(0); if c_pr50vm_inf = 1 and naive=1 and c_pr50vm=1 and x < rate_loss_persistence then c_pr50vm=0;
x=uniform(0); if c_pr54m_inf = 1 and naive=1 and c_pr54m=1 and x < rate_loss_persistence then c_pr54m=0;
x=uniform(0); if c_pr76m_inf = 1 and naive=1 and c_pr76m=1 and x < rate_loss_persistence then c_pr76m=0;
x=uniform(0); if c_pr82m_inf = 1 and naive=1 and c_pr82m=1 and x < rate_loss_persistence then c_pr82m=0;
x=uniform(0); if c_pr84m_inf = 1 and naive=1 and c_pr84m=1 and x < rate_loss_persistence then c_pr84m=0;
x=uniform(0); if c_pr88m_inf = 1 and naive=1 and c_pr88m=1 and x < rate_loss_persistence then c_pr88m=0;
x=uniform(0); if c_pr90m_inf = 1 and naive=1 and c_pr90m=1 and x < rate_loss_persistence then c_pr90m=0;
x=uniform(0); if c_inpm_inf = 1  and naive=1 and c_inpm=1 and x < rate_loss_persistence then c_inpm=0;
x=uniform(0); if c_insm_inf = 1  and naive=1 and c_insm=1 and x < rate_loss_persistence then c_insm=0;


* LOSS OF MUTATIONS ACQUIRED IN PMTCT FROM MAJORITY and minoririty VIRUS ;

* dependent_on_time_step_length ;

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
if t ge 2 and vl gt log10(1000) and caldate{t} ge yrart+0.50 and ((onart=1 and tcur ge 0.5) ) 
and vfail1_tm1 ne 1 then do; vfail1=1; date_u_vfail=caldate{t};  u_vfail1_this_period=1;  end;


o_dol_at_risk_uvfail=.;u_vfail1_dol_this_period=.; 
if t ge 2 and o_dol=1 and tcur ge 0.5 and uvfail_dol ne 1 then do;
o_dol_at_risk_uvfail=1;
if vl gt log10(1000) then do; uvfail_dol = 1;  u_vfail1_dol_this_period=1; end;
end;

o_dol_2nd_vlg1000 = 0; * see below for defn; * eee;


* art_monitoring_strategy = 1. Clinical monitoring alone ;
* all coded below, associated with incidence of WHO 3 / 4;


* art_monitoring_strategy = 2. Clinical monitoring with single VL confirmation ;
* takes account of time delay for DBS or plasma measurement of vl, compared with POC ;
* all coded below, associated with incidence of WHO 3 / 4;


* art_monitoring_strategy = 3. Clinical monitoring with VL confirmation ;

if t ge 2 and visit=1 and art_monitoring_strategy=3 and 0.5 <= caldate{t}-date_last_vlm_g1000 <= 1.0 and (artline=1 or int_clinic_not_aw=1) and linefail_tm1=0 
and 0.5 <= caldate{t}-date_who3_4_event_switch_eval <= 1.0 then do;
	s=uniform(0); 
	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm    = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm    = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm    = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm    = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
	if vm    gt log10(1000) then do;
		if date_v_alert=. then date_v_alert=caldate{t};
		linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4 ; vl_fail1=vl;d1stlfail=caldate{t}; date_last_vlm_g1000 = caldate{t};
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


if t ge 2  and visit=1 and art_monitoring_strategy=8 and (artline=1 or int_clinic_not_aw=1) and linefail_tm1=0 then do;

		if caldate{t}-yrart ge 3 and (time_since_last_cm >= 0.25 or time_since_last_cm =.) then do; s=uniform(0);  * jan15;
		cd4_cost_inc = 1; if s < prob_cd4_meas_done then cm   =(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2;  end;
		if . < cm     < 200 then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2;  cd4_cost_inc = 2;
			if . < conf_measured_c < 200 then do;
				linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl;d1stlfail=caldate{t}; 
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
		if s < prob_cd4_meas_done then cm   =(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 1; end;
		if . < cm     < 100 then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 2;
			if . < conf_measured_c < 100 then do;
				linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl;d1stlfail=caldate{t}; 
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


if t ge 2  and visit=1 and art_monitoring_strategy=9 and (artline=1 or int_clinic_not_aw=1) and linefail_tm1=0 then do;
	
		if (  
		(mod(tcur,0.5)=0 and tcur ge 3)
		or 
		(int_clinic_not_aw=1 and caldate{t}-yrart ge 1 and mod(toffart,0.5)=0 )
		) then do; 
			s=uniform(0); 
			if s < prob_cd4_meas_done then cm   =(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 1; 
		end;
		if . < cm     < 200 then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 2;
			if . < conf_measured_c < 200 then do; 
				s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm    = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm    = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm    = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm    = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
				end;
			end; 
			vl_cost_inc = 1; 
			if 		(		(vm_format in (3,4) and vm    gt log10(1000)) 		or		(. < vm_format <= 2 and value_last_vm gt log10(vl_threshold))		) 		then do;
				if date_v_alert=. then date_v_alert=caldate{t};
				linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl;d1stlfail=caldate{t}; 
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

		if (tcur in (1,1.5,2,2.5) or (int_clinic_not_aw=1 and 0 < caldate{t}-yrart < 3 and toffart    in (0.5,1,1.5,2,2.5))) then do; 
			s=uniform(0); if s < prob_cd4_meas_done then cm   =(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 1; 
		end;
		if . < cm     < 100 then do;
				s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2;cd4_cost_inc = 2;
				if . < conf_measured_c < 100 then do;
					s=uniform(0);	
					if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm    = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm    = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm    = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm    = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
					end;  
				end;
			vl_cost_inc = 1;
			if 		(		(vm_format in (3,4) and vm gt log10(1000)) 		or		(. < vm_format <= 2 and value_last_vm gt log10(vl_threshold))		)  		then do;
				if date_v_alert=. then date_v_alert=caldate{t};
				linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl;d1stlfail=caldate{t}; 
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


if t ge 2 and visit=1 and art_monitoring_strategy=10 and (artline=1 or int_clinic_not_aw=1) and linefail_tm1=0 then do;

		if (
		(mod(tcur,0.5)=0 and tcur ge 3) 
		or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1 and mod(toffart   ,0.5)=0 ))  and (date_cd4_switch_eval = . or caldate{t}-date_cd4_switch_eval > 0.5)
		then do; s=uniform(0); if s < prob_cd4_meas_done then cm   =(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2;cd4_cost_inc = 1;  end;
		if . < cm     < 200 then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2;cd4_cost_inc = 2;
			if . < conf_measured_c < 200 then do; s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
			if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
			end;  
			end;
			vl_cost_inc = 1; 
			if vm gt log10(1000) then do;
				date_cd4_switch_eval=caldate{t}; date_last_vlm_g1000 = caldate{t};if date_v_alert=. then date_v_alert=caldate{t};
			end;
			conf_measured_c=.;
		end;
		if (tcur in (1,1.5,2,2.5) or (int_clinic_not_aw=1 and 0 < caldate{t}-yrart < 3 and toffart    in (0.5,1,1.5,2,2.5)))
		and (date_cd4_switch_eval = . or caldate{t}-date_cd4_switch_eval > 0.5) then do; s=uniform(0); 
		if s < prob_cd4_meas_done then cm   =(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2;cd4_cost_inc = 1; end;
		if . < cm     < 100  then do;
			s=uniform(0); if s < prob_cd4_meas_done then conf_measured_c=(sqrt(cd4)+(normal(0)*sd_measured_cd4))**2; cd4_cost_inc = 2;
			if . < conf_measured_c < 100 then do; s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		end;  
		end;
		vl_cost_inc = 1; 
			if vm gt log10(1000) then do;
				date_cd4_switch_eval=caldate{t};date_last_vlm_g1000 = caldate{t};if date_v_alert=. then date_v_alert=caldate{t};
			end;
			conf_measured_c=.;
		end;

		if t ge 3 and (artline=1 or int_clinic_not_aw=1) and linefail_tm1=0 and 0.5 <= caldate{t}-date_cd4_switch_eval <= 1.0 then do;s=uniform(0);
			if s < eff_prob_vl_meas_done then do; 
			if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
			end;  
			vl_cost_inc = 1;
			if vm gt log10(1000) then do;
				if date_v_alert=. then date_v_alert=caldate{t};
				linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl;d1stlfail=caldate{t}; date_last_vlm_g1000 = caldate{t};
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


if art_monitoring_strategy=150  and visit=1 and (artline=1 or int_clinic_not_aw=1) and linefail_tm1=0 
and restart    ne 1 and restart_tm1  ne 1  and (caldate{t} - date_transition_from_nnrti >= 0.5 or date_transition_from_nnrti =.) and t ge 2 then do;  
	if (caldate{t}-yrart >= time_of_first_vm and time_since_last_vm=.) or (caldate{t}-yrart = 1.0) or (time_since_last_vm >= 0.75) or  (min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 1.00 and 
	(caldate&j - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.)) then do; * jan15;
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		if min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 1.0 then date_conf_vl_measure_done = caldate{t} ;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; 
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=. then date_v_alert=caldate{t};
		end;
	end;
	
	* eee;	
	if o_dol=1 and (caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold)) then o_dol_2nd_vlg1000 = 1;

	if (caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold)) or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold))
	then do;  
			linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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



* art_monitoring_strategy = 1500.  viral load monitoring (6m, 12m, annual) + adh > 0.8 based on tdf level test;
* takes account of time delay for DBS or plasma measurement of vl, compared with POC ;

* dependent_on_time_step_length ;

drug_level_test=0;
if art_monitoring_strategy=1500  and visit=1 and (artline=1 or int_clinic_not_aw=1) and linefail_tm1=0 
and restart    ne 1 and restart_tm1  ne 1 and (caldate{t} - date_transition_from_nnrti >= 0.5 or date_transition_from_nnrti =.) and t ge 2 then do;  
	if (caldate{t}-yrart >= time_of_first_vm and time_since_last_vm=.) or (caldate{t}-yrart = 1.0) or (time_since_last_vm >= 0.75) or  (min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 1.00 and 
	(caldate{t} - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.)) then do; * jan15;
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		if min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 1.0 then do; date_conf_vl_measure_done = caldate{t} ; date_drug_level_test = caldate{t};
		drug_level_test=1; end;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; 
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=. then date_v_alert=caldate{t};  
		end;
	end;

	* eee;	
	if o_dol=1 and (caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold)) then o_dol_2nd_vlg1000 = 1;

	if (
	(caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold) and adh > 0.8) 
	or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold) and adh_tm1 > 0.8)
	) 
	then do;
			linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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

* dependent_on_time_step_length ;

if art_monitoring_strategy=152  and visit=1 and (artline=1 or int_clinic_not_aw=1) 
and restart    ne 1 and restart_tm1  ne 1 and linefail_tm1=0 and (caldate{t} - date_transition_from_nnrti >= 0.5 or date_transition_from_nnrti =.) and t ge 2 then do;  
	if (caldate{t}-yrart >= time_of_first_vm and time_since_last_vm=.) or (time_since_last_vm >= 1.75) or  (min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 0.5 and 
	(caldate&j - date_conf_vl_measure_done >= 2 or date_conf_vl_measure_done=.)) then do; * jan15;
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		if min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 0.5 then date_conf_vl_measure_done = caldate{t} ;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; 
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=. then date_v_alert=caldate{t};
		end;
	end;

	if (caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold)) or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold))
	then do;
			linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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

* dependent_on_time_step_length ;

if art_monitoring_strategy=153  and visit=1 and (artline=1 or int_clinic_not_aw=1) 
and restart    ne 1 and restart_tm1  ne 1 and linefail_tm1=0 and (caldate{t} - date_transition_from_nnrti >= 0.5 or date_transition_from_nnrti =.) and t ge 2 then do;  
	if (caldate{t}-yrart >= time_of_first_vm and time_since_last_vm=.) or (time_since_last_vm >= 0.75) then do; * jan15;
		s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; 
			date_last_vlm_g1000=caldate{t}; 
			if date_v_alert=. then date_v_alert=caldate{t};
			linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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



if ((reg_option in (103 116)) or (reg_option = 104 and art_monitoring_strategy ne 1500)) and artline=2 and o_dol=1 and p_taz=1 and f_dol_tm1 ne 1 and restart ne 1 and restart_tm1 ne 1 and t ge 2 then do; 
	if (time_since_last_vm >= 0.75) and (caldate&j - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.) 
and (caldate{t} - date_transition_from_pi >= 0.5 or date_transition_from_pi =.)
then do; 
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		if min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 1.0 then date_conf_vl_measure_done = caldate&j ;
		end;  
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; hhh=1;
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=.  then date_v_alert=caldate{t};
		end;
	end;
	time_since_last_vm_prev=time_since_last_vm;

	* eee;	
	if o_dol=1 and (caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold)) then o_dol_2nd_vlg1000 = 1;


	if (caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold)) or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold))
	then do;
			linefail=2;r_fail_2=c_totmut   ; cd4_fail1_2=cd4; vl_fail_2=vl; d2ndlfail=caldate{t}; 
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


if (reg_option = 117 or (reg_option = 104 and art_monitoring_strategy = 1500) or reg_option = 118 or reg_option=119)  and artline=2 
and o_dol=1 and p_taz=1 and f_dol_tm1 ne 1 and restart ne 1 and restart_tm1 ne 1 and t ge 2 then do; 
	if (time_since_last_vm >= 0.75) and (caldate&j - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.) 
and (caldate{t} - date_transition_from_pi >= 0.5 or date_transition_from_pi =.)
then do; 
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		if min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 1.0 then do; date_conf_vl_measure_done = caldate&j ;date_drug_level_test = caldate{t};
		drug_level_test=1;end;  
		end;
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; hhh=1;
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=.  then date_v_alert=caldate{t};
		end;
	end;
	time_since_last_vm_prev=time_since_last_vm;


	* eee;	
	if o_dol=1 and (caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold)) then o_dol_2nd_vlg1000 = 1;


	if (
	(caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold) and adh > 0.8) 
	or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold) and adh_tm1 > 0.8)
	) 
	then do;
			linefail=2;r_fail_2=c_totmut   ; cd4_fail1_2=cd4; vl_fail_2=vl; d2ndlfail=caldate{t}; 
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




if reg_option in (120 121) and linefail=1 and artline=2 and o_dol=1 and f_dol_tm1 ne 1 and p_taz ne 1 and p_lpr ne 1 and restart ne 1 and restart_tm1 ne 1 and t ge 2 then do; 
	if (time_since_last_vm >= 0.75) and (caldate&j - date_conf_vl_measure_done >= 1 or date_conf_vl_measure_done=.) 
and (caldate{t} - date_transition_from_pi >= 0.5 or date_transition_from_pi =.)
then do; 
		s=uniform(0);  date_last_vm_attempt=caldate&j;	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		if min_time_repeat_vm <= caldate{t}-date_vl_switch_eval <= 1.0 then do; date_conf_vl_measure_done = caldate&j ;date_drug_level_test = caldate{t};
		drug_level_test=1;end;  
		end;
		vl_cost_inc = 1;
		if vm gt log10(vl_threshold) then do; hhh=1;
			date_last_vlm_g1000=caldate{t}; if (date_vl_switch_eval=. or time_since_last_vm >= 1) then date_vl_switch_eval=caldate{t}; 
			if date_v_alert=.  then date_v_alert=caldate{t};
		end;
	end;
	time_since_last_vm_prev=time_since_last_vm;


	* eee;	
	if o_dol=1 and (caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold)) then o_dol_2nd_vlg1000 = 1;


	if (
	(caldate{t}=date_conf_vl_measure_done and vm_format in (3,4) and vm gt log10(vl_threshold) and adh > 0.8) 
	or
	(caldate{t} - date_conf_vl_measure_done = 0.25 and . < vm_format <= 2 and value_last_vm gt log10(vl_threshold) and adh_tm1 > 0.8)
	) 
	then do;
			linefail=2;r_fail_2=c_totmut   ; cd4_fail1_2=cd4; vl_fail_2=vl; d2ndlfail=caldate{t}; 
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





* eee;	
o_dol_2nd_vlg1000_dolr1_adh0=0;o_dol_2nd_vlg1000_dolr1_adh1=0;o_dol_2nd_vlg1000_dolr0_adh0=0;o_dol_2nd_vlg1000_dolr0_adh1=0;
if o_dol_2nd_vlg1000 = 1 then do;
if adh_tm1 < 0.8 and r_dol_tm1 > 0 then o_dol_2nd_vlg1000_dolr1_adh0 = 1;
if adh_tm1 >= 0.8 and r_dol_tm1 > 0 then o_dol_2nd_vlg1000_dolr1_adh1 = 1;
if adh_tm1 < 0.8 and r_dol_tm1 = 0 then o_dol_2nd_vlg1000_dolr0_adh0 = 1;
if adh_tm1 >= 0.8 and r_dol_tm1 = 0 then o_dol_2nd_vlg1000_dolr0_adh1 = 1;
end;


* measure viral load on second line (in fact, after failing first line) ; 
if reg_option ne 103 and reg_option ne 104  and reg_option ne 116  and reg_option ne 117  and reg_option ne 118 and reg_option ne 119 and f_dol ne 1 then do;   
* if reg_option ne 103 and reg_option ne 104 and f_dol ne 1 then we keep monitoring as coded 
above at art monitoring strategy 150; * may18;

if sv_secondline=1 and visit=1 and linefail ge 1 and restart ne 1 and restart_tm1 ne 1 and t ge 2 then do;  
	if time_since_last_vm >= 0.75 or time_since_last_vm = . then do; 
		s=uniform(0);  if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
		vl_cost_inc=1;
		end;  
		end;
end;
end;


if res_test_6m_if_vlg1000=1 and t ge 2 then do;  * last_vm_gt_1000 only defined while linefail = 0;
	
	if visit=1 and 
	(caldate{t} - yrart = 0.50 and ( onart = 1 or int_clinic_not_aw=1 )) then do;s=uniform(0);	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1; end;
			if vm gt log10(1000) then do; res_test=1; if date_v_alert=. then date_v_alert=caldate{t};end;
			if ((o_nev=1 or o_efa=1 or (int_clinic_not_aw=1 and (mr_nev=1 or mr_efa=1))) 
			and (c_rt103m=1 or c_rt181m=1 or c_rt190m=1) ) and vm gt log10(1000) then do;
			linefail=1;r_fail=c_totmut   ; d1stlfail=caldate{t}; 
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

if naive=1 then do; artline=.; linefail=.;end;


* MEASURED CD4 AT RESTART;
	if restart=1 and cm    ne . then  measured_cd4_restart=cm   ;


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

	nactive=nod   -((o_zdv*r_zdv)+(o_3tc*r_3tc)+(o_ten*r_ten)
	                  +(o_dar*r_dar)+(o_efa*r_efa)+(o_nev*r_nev)+(o_taz*r_taz)+(o_lpr*r_lpr)+(o_dol*r_dol));

	* zdv lower potency ;
	if o_zdv=1 and zdv_potency_p75=1 then nactive=nactive - 0.25*(1-r_zdv);

	* what if PI/r worth more than 1.0 drugs ?;
	if o_lpr=1 and pir_higher_potency=1 then nactive=nactive+ (1-r_lpr);
	if o_dar=1 and pir_higher_potency=1 then nactive=nactive+ (1-r_dar);
	if o_taz=1 and pir_higher_potency=1 then nactive=nactive+ (1-r_taz);


	* dol_higher_potency;
	if o_dol=1 and dol_higher_potency=1 then nactive=nactive+ (1-r_dol);
	if o_dol=1 and dol_higher_potency=0.5 then nactive=nactive+ (0.5*(1-r_dol));
	if o_dol=1 and dol_higher_potency=0.25 then nactive=nactive+ (0.25*(1-r_dol));

	* added may 2019 in response to advance results - now using potency of 1.5 for both efa and dol;
	if o_efa=1 then nactive=nactive+ (0.5*(1-r_efa)); 

	nactive = round(nactive,0.25);


	* what if is over-estimate actual proportionate drug activity ?;
	nactive=nactive-is_red_activity;
	if nactive < 0 then nactive=0;

	if nod   =0 then nactive=.;

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

	if caldate{t}=date_line2 > . then nactive_line2=nactive;
	
	* nactive at start of art;
	if caldate{t}=yrart then nactive_start_art = nactive;

* REGISTERING OF NEW CURRENT TOXICITY AND CONTINUATION OF EXISTING TOXICITY;
	* ? ~~~~~~~~~~~~~~ this should depend on adherence - higher adherence, more toxicity;

* below tox risk and persistence ;

	c_nau=0;
	r=uniform(0); if . < caldate{t}-yrart < 1 then r=r/5.0; * increased risk of nausea in first year;
	if t ge 2 and (o_taz=1 or o_dar=1)               then do; 
	if c_nau_tm1=0 and r < (r_nau_start_taz_dar * double_rate_gas_tox_taz) then c_nau=1; 
	if c_nau_tm1=1 then c_nau=1; if c_nau_tm1=1 and r < p_nau_stops_taz_dar then c_nau=0;  
	end;
	if t ge 2 and (o_zdv=1 or o_lpr=1) then do; 
	if c_nau_tm1=0 and r < r_nau_start_zdv_lpr then c_nau=1; 
	if c_nau_tm1=1 then c_nau=1; if c_nau_tm1=1 and r < p_nau_stops_zdv_lpr then c_nau=0;  
	end;

	c_dia=0;
	r=uniform(0);if . < caldate{t}-yrart < 1 then r=r/2.5; * increased risk of diarrhoea in first year;
	if t ge 2 and o_lpr=1 then do; 
	if c_dia_tm1=0 and r < r_dia_start_lpr then c_dia=1; 
	if c_dia_tm1=1 then c_dia=1; if c_dia_tm1=1 and r < p_dia_stops_lpr then c_dia=0;  
	end;
	r=uniform(0);if . < caldate{t}-yrart < 1 then r=r/2.5;
	if t ge 2 and (o_taz=1  or o_dar=1) then do; 	
	if c_dia_tm1=0 and r < (r_dia_start_taz_dar * double_rate_gas_tox_taz) then c_dia=1; 
	if c_dia_tm1=1 then c_dia=1; if c_dia_tm1=1 and r < p_dia_stops_taz_dar then c_dia=0;
	end;

	c_ras=0;
	r=uniform(0);
	if t ge 3 and (o_efa=1 and 0 <= caldate{t}-date_start_efa <= 0.5 and r < r_ras_start_efa ) then c_ras=1;
	if t ge 3 and (o_nev=1 and 0 <= caldate{t}-date_start_nev <= 0.5 and r < r_res_start_nev ) then c_ras=1;

	if tox_weightg_dol=1 then do;
	* note c_weightg is weight gain as a toxicity potentially affecting treatment interruption;
	r=uniform(0);
	if t ge 3 and (o_dol=1 and 0 < (caldate{t} - date_start_dol) <= 1 and r < r_weightg_start_dol  ) then c_weightg=1;
	if o_dol ne 1 or (caldate{t} - date_start_dol) > 1 then c_weightg = 0;
	end;

	* note that increased mortality risk due to weight rise on dol is independent of weightg as a tox (potentially leading to discontinuation)
	the former is about self assessment of body image and how that affects drug persistence - the latter is about people who already have a
	bmi above 23 for whom a rise could lead to increased risk of death (eg resulting fron diabetes) ;

	if incr_mort_risk_dol_weightg_i = . then incr_mort_risk_dol_weightg_i = 1.00 ;	
	r = uniform(0);
	if caldate{t} = date_start_dol and (r < prop_bmi_ge23  or (date_start_tld_prep ne . and bmi_gt23_start_dol =1)) then do;  
			bmi_gt23_start_dol=1;
			if incr_mort_risk_dol_weightg = 1 then incr_mort_risk_dol_weightg_i = 1.00 ;  
			if incr_mort_risk_dol_weightg = 1.1 then incr_mort_risk_dol_weightg_i = 1.03 ;  
			if incr_mort_risk_dol_weightg = 2 then incr_mort_risk_dol_weightg_i = 1.05 ;  
			if incr_mort_risk_dol_weightg = 2.1 then incr_mort_risk_dol_weightg_i = 1.07 ;
 			if incr_mort_risk_dol_weightg = 2.2 then incr_mort_risk_dol_weightg_i = 1.10 ;  
			if incr_mort_risk_dol_weightg = 3 then incr_mort_risk_dol_weightg_i = 1.15 ;  
			if incr_mort_risk_dol_weightg = 4 then incr_mort_risk_dol_weightg_i = 1.25 ;  
	end;

	bmi_gt23_start_dol_wwc=0;
	if gender=2 and age < 55 and want_no_more_children ne 1 and bmi_gt23_start_dol = 1 then bmi_gt23_start_dol_wwc=1;

	c_cns=0;
	r=uniform(0);
	if t ge 2 and o_efa=1 then do;
		if c_cns_tm1=0 and r < r_cns_start_efa and tcur < 1 then c_cns=1;
		if c_cns_tm1=1 then c_cns=1; if c_cns_tm1=1  and tcur < 1 and r < p_cns_stops_efa then c_cns=0;
		if c_cns_tm1=1 then c_cns=1; if c_cns_tm1=1  and tcur >= 1 and r < p_cns_stops_efa / 2 then c_cns=0;
	end;
	rr=uniform(0);
	if t ge 2 and o_dol=1 then do;  * take incidence as half for efa but with same persistence rate; * apr16; * changed since nih talk; 
		if c_cns_tm1=0 and rr < (r_cns_start_dol * rel_dol_tox) and tcur < 1 then c_cns=1;
		if c_cns_tm1=1 then c_cns=1; if c_cns_tm1=1  and tcur < 1 and rr < p_cns_stops_dol then c_cns=0;
		if c_cns_tm1=1 then c_cns=1; if c_cns_tm1=1  and tcur >= 1 and rr < p_cns_stops_dol / 6 then c_cns=0; * this makes this p_cns_stops the same as for efa;
	end;

	* no c_lip=0 because stays once have it even if stop drugs;
	r=uniform(0);
	if o_zdv=1 and r < r_lip_start_zdv then c_lip=1;
	
	c_hep=0;
	r=uniform(0);
	if  o_nev=1 and tcur <= 0.5 and r < r_hep_start_nev then c_hep=1;
	
	c_otx=0;
	r=uniform(0);
	if . < caldate{t}-yrart < 1 then r=r/1.5; * increased risk of otox in first year;
	if onart=1 and r < r_otx_start then c_otx=1;

	c_ane=0;
	r=uniform(0); if . < caldate{t}-yrart < 1 then r=r/1.5; * increased risk of ane in first year;
	if t ge 2 and o_zdv=1 and c_ane_tm1 =0 and r < r_ane_start_zdv then c_ane=1;
	if o_zdv=1 and c_ane_tm1=1 then c_ane=1; if c_ane_tm1=1 and r < p_ane_stops_zdv then c_ane=0;

	c_head=0;
	d=uniform(0); if . < caldate{t}-yrart < 1 then d=d/1.5; * increased risk of head in first year;
	if t ge 2 and o_zdv=1 and c_head_tm1 =0 and d < r_head_start_zdv then c_head=1;
	if o_zdv=1 and c_head_tm1=1 then c_head=1; if c_head_tm1=1 and r < p_head_stops_zdv then c_head=0;

	c_lac=0;
	d=uniform(0); if o_zdv=1 and d < r_lac_start_zdv then c_lac=1;

	e=uniform(0);
	c_neph=0;
	if t ge 2 and o_ten=1 and c_neph_tm1=0 and e < r_neph_start_ten then c_neph=1;
	if o_ten=1 and c_neph_tm1=1 then c_neph=1; if c_neph_tm1=1 and r < p_neph_stops_ten then c_neph=0;
	if t ge 2 and o_ten=0 and c_neph_tm1=1 and e < (1 - p_neph_stops_after_ten) then c_neph=1;

	c_tox=0;
	if c_nau=1 or c_lip = 1 or c_pen = 1 or c_ras = 1 or c_cns = 1 or c_lac=1 or c_ane=1
	or c_hep = 1 or c_dia = 1 or c_otx = 1 or c_neph = 1 or c_weightg=1	then c_tox=1;


	* PCP prophylaxis; * amended nov19;

	d=uniform(0);

	pcp_p_tm1=pcp_p;

	if hiv_monitoring_strategy=2 then do;
		if visit=1 and . < cm    < 350 and d lt 0.8 and caldate{t}>=1996 then pcp_p   =1;
	end;

	r=uniform(0);
	if visit=1 and (who3_event   =1 or adc=1) and r lt 0.8 and caldate{t}>=1996 then pcp_p   =1;

	if caldate{t} ge 2015 and visit=1 and d < 0.8 then pcp_p   =1;

	if  cotrim_disrup_covid = 1 and covid_disrup_affected = 1 then pcp_p = 0;

	* rates used to assess risk of ARC, AIDS and AIDS death;

* consider if * dependent_on_time_step_length ;

	if        cd4 > 650 then base_rate=0.002;
	if 500 <= cd4 < 650 then base_rate=0.01;
	if 450 <= cd4 < 500 then base_rate=0.013;
	if 400 <= cd4 < 450 then base_rate=0.016;
	if 375 <= cd4 < 400 then base_rate=0.02 ;
	if 350 <= cd4 < 375 then base_rate=0.022;
	if 325 <= cd4 < 350 then base_rate=0.025;
	if 300 <= cd4 < 325 then base_rate=0.03;
	if 275 <= cd4 < 300 then base_rate=0.037;
	if 250 <= cd4 < 275 then base_rate=0.045;
	if 225 <= cd4 < 250 then base_rate=0.055;
	if 200 <= cd4 < 225 then base_rate=0.065;
	if 175 <= cd4 < 200 then base_rate=0.08;
	if 150 <= cd4 < 175 then base_rate=0.1 ;
	if 125 <= cd4 < 150 then base_rate=0.13;
	if 100 <= cd4 < 125 then base_rate=0.17;
	if 90  <= cd4 < 100 then base_rate=0.20;
	if 80  <= cd4 < 90 then base_rate=0.23;
	if 70  <= cd4 < 80 then base_rate=0.28;
	if 60  <= cd4 < 70 then base_rate=0.32;
	if 50  <= cd4 < 60 then base_rate=0.40;
	if 40  <= cd4 < 50 then base_rate=0.50;
	if 30  <= cd4 < 40 then base_rate=0.80;
	if 20  <= cd4 < 30 then base_rate=1.10;
	if 10  <= cd4 < 20 then base_rate=1.80;
	if 0   <= cd4 < 10 then base_rate=2.50;


* independent effect of vl;

	if vl < 3 then base_rate=base_rate*0.2;
	if 3 <= vl < 4 then base_rate=base_rate*0.3;
	if 4 <= vl < 4.5 then base_rate=base_rate*0.6;
	if 4.5 <= vl < 5 then base_rate=base_rate*0.9;
	if 5 <= vl < 5.5 then base_rate=base_rate*1.2;
	if 5.5 <= vl then base_rate=base_rate*1.6;
	
	* risk increases with age;
	base_rate = base_rate*((age/38)**1.2);


	* for sensitivity analysis - fold change in base rate;
	base_rate = base_rate * fold_change_in_risk_base_rate;


	* occurrence of who 3 symptoms;
	who3_event   =0; tb   =0;
	if t ge 2 and dead=0 then do; 
		who3_rate=base_rate*fold_incr_who3;
		* assume higher risk than of who4, but with same predictors;
		if nod    ge 3 then who3_rate = 0.6*who3_rate;
		if nod    = 2 then who3_rate = 0.85*who3_rate;
		if nod    = 1 then who3_rate = 0.9*who3_rate;
		if nod    = 0 then who3_rate = 1*who3_rate;

		who3_risk  = 1 - exp (-0.25*who3_rate);
* ts1m: *	who3_risk  = 1 - exp (-(1/12)*who3_rate);

		x5=uniform(0);
		if x5 le who3_risk  then do; 
			who3_event   =1;


* ------------------------------------------------------------------------------------------------------- ;
f=uniform(0);

		if t ge 3 and art_monitoring_strategy = 1 and f < prob_who3_diagnosed then do;
					if ((artline=1 and tcur ge 1) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and . < caldate{t}-date_last_who3 < 1 
					and linefail_tm1=0 then do;
						linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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
				if ((artline=1 and tcur ge 1) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and . < caldate{t}-date_last_who3 < 1 and linefail_tm1=0 then do; 
			s=uniform(0);s=s/0.8; * lower probability that vl measure is done if it is triggered by CD4 or clinical disease; if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
	* take account of time delay with dbs or plasma compared with poc;
		if 	((vm_format in (3,4) and vm gt log10(1000)) 	or	(. < vm_format <= 2 and value_last_vm gt log10(vl_threshold))	) 
		then do;
						if date_v_alert=. then date_v_alert=caldate{t};
						linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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
				if ((artline=1 and tcur ge 1) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and . < caldate{t}-date_last_who3 < 1 and linefail_tm1=0 and 
				((caldate{t}-date_who3_4_event_switch_eval > 0.5) or date_who3_4_event_switch_eval=.) then do; 
			s=uniform(0);s=s/0.8; * lower probability that vl measure is done if it is triggered by CD4 or clinical disease; 			if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
					if vm gt log10(1000) then do; 
						if date_v_alert=. then date_v_alert=caldate{t};
						date_last_vlm_g1000 = caldate{t}; date_who3_4_event_switch_eval=caldate{t};
					end;
				end;
		end;


		if artline=1 and tcur ge 1 and linefail_tm1=0 then date_last_who3=caldate{t};
		if artline=2 and tcur ge 1 and linefail_tm1=1 then first_who3_line2=1;


			who3_=1;who3_date=caldate{t}; if date_first_who3 = . then date_first_who3 = caldate{t}; cd4_who3_=cd4;timewho3_=who3_date-caldate1;
			y=uniform(0); if y < 0.2 then do; tb   =1; if tb_date=. then tb_date=caldate{t}; date_most_recent_tb = caldate{t}; end;

		end;
	end;

	if cd4 < 200 then c_lt200=1;else c_lt200=0;

	* occurrence of who4 diseases;
	adc=0;
	adc_diagnosed=.; adc_naive=.; adc_line1_lf0=.; adc_line1_lf1=.; adc_line2_lf1=.; adc_line2_lf2=.; adc_artexpoff=.;
	if  dead=0 then do;
		rate=base_rate;
		if t ge 2 and (0 <= (caldate{t} - date_most_recent_tb) <= 0.5) then rate=base_rate;
	
		if pcp_p   =1 then rate=rate*0.8;
		if nod    ge 3 then rate = 0.6 *rate;
		if nod    = 2 then rate = 0.85*rate;
		if nod    =1 then rate = 0.9*rate;

		riskx = 1 - exp (-0.25*rate);

* ts1m: *	riskx = 1 - exp (-(1/12)*rate);

		x2=uniform(0); if x2 le riskx then do;
			adc=1;  if dateaids=. then dateaids=caldate{t}; 
			adc_diagnosed=0; if registd=1 then adc_diagnosed=1;  adc_naive=0; if naive=1 then adc_naive=1;
			adc_line1_lf0=0; if artline=1 and linefail=0 then adc_line1_lf0 =1;
			adc_line1_lf1=0; if artline=1 and linefail=1 then adc_line1_lf1 =1; adc_line2_lf1=0; if artline=2 and linefail=1 then adc_line2_lf1 =1;
			adc_line2_lf2=0; if artline=2 and linefail=2 then adc_line2_lf2 =1; adc_artexpoff=0; if naive=0 and onart=0 then adc_artexpoff =1;

* ------------------------------------------------------------------------------------------------------- ;
f=uniform(0);

			if t ge 3 and art_monitoring_strategy = 1  and f < prob_who4_diagnosed  then do;
					if ((artline=1 and tcur ge 1) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and linefail_tm1=0 then do;
						linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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
					if ((artline=1 and tcur ge 1) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and linefail_tm1=0 then do;
					s=uniform(0);s=s/0.8; * lower probability that vl measure is done if it is triggered by CD4 or clinical disease;  	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;

		* takes account of time delay with dbs or plasma compared with poc;
		if ((vm_format in (3,4) and vm gt log10(1000)) or (. < vm_format <= 2 and value_last_vm gt log10(vl_threshold))) then do;
							if date_v_alert=. then date_v_alert=caldate{t};
							linefail=1;r_fail=c_totmut   ; cd4_fail1=cd4; vl_fail1=vl; d1stlfail=caldate{t}; 
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
				if ((artline=1 and tcur ge 1) or (int_clinic_not_aw=1 and caldate{t}-yrart ge 1)) and linefail_tm1=0 
				and ((caldate{t}-date_who3_4_event_switch_eval > 0.5) or date_who3_4_event_switch_eval=.) then do; 
					s=uniform(0);s=s/0.8; * lower probability that vl measure is done if it is triggered by CD4 or clinical disease; 	if s < eff_prob_vl_meas_done then do; 
		if vm_format=1 then do; vm = max(0,vl+(normal(0)*0.22)); vm_type=1; end;
		if vm_format=2 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=2;  end;
		if vm_format=3 then do; vm = max(0,vl+(normal(0)*0.22));  vm_type=3;  end;
		if vm_format=4 then do; vm_plasma = max(0,vl+(normal(0)*0.22)) ; vm = (0.5 * vl) + (0.5 * vm_plasma) + vl_whb_offset + (normal(0)*(sd_vl_whb + (decr_sd_vl_whb*(4-vl))))  ; vm_type=4;  end;
	end;  
	vl_cost_inc = 1;
					if vm gt log10(1000) then do; 
						if date_v_alert=. then date_v_alert=caldate{t};
						date_last_vlm_g1000 = caldate{t}; 
						date_who3_4_event_switch_eval=caldate{t};
					end;
				end;
			end;


if who4_=0 then do; 
				who4_=1; who4_date=caldate{t};cd4_who4_=cd4;vl_who4_=vl; 
				naive_who4_=naive;x4v_who4_=x4v;artwho4_=onart;timewho4_=who4_date-caldate1;
		end;
	end;
end;

	who4_time = who4_date-date1pos;


* latest measured cd4 and vl;
if cm    ne . then do; latest_cm = cm   ; date_latest_cm=caldate{t}; end;
if vm ne . then do; latest_vm = vm; date_latest_vm=caldate{t}; end;



	* DEATH - causes:  who4=1 / non-HIV =2 ;
	
	if dead=0 then do;

	dead_diagnosed=.; dead_naive=.; dead_onart=.; dead_line1_lf0=.; dead_line1_lf1=.; dead_line2_lf1=.; dead_line2_lf2=.; dead_artexpoff=.; dead_nn=.;dead_pir=.;
	dead_adc=.;
	dead_6m_onart=.;dead_12m_onart=.;dead_24m_onart=.;dead_36m_onart=.;

		hiv_death_rate=base_rate*fold_decr_hivdeath;

		incr_death_rate_tb_ = incr_death_rate_tb; incr_death_rate_adc_ = incr_death_rate_adc;

		if visit=1 and (sv ne 1 or (adh > 0.8 and onart=1)) then do; * so lower death rate if under care when adc occurs, unless under simplified visits 
		and poorly adherent to art (because in that situation not really visiting clinicians/nurses at most visits) - reason for the poor adh condition
		is that the people who are on simplified visits but non adherent or interrupted are close to being lost;	
			incr_death_rate_tb_ = incr_death_rate_tb / 1.5; incr_death_rate_adc_ = incr_death_rate_adc / 1.5; 
		end;  * note visit is not set to 1 above just because adc has occurred, although registd  is set to 1;    

		if t ge 2 and (0 <= (caldate{t} - date_most_recent_tb) <= 0.5) and who4_ = 0 then hiv_death_rate = hiv_death_rate*incr_death_rate_tb_;
		if adc=1 then hiv_death_rate = hiv_death_rate*incr_death_rate_adc_;

		if  inc_death_rate_aids_disrup_covid = 1 and covid_disrup_affected = 1 and (adc=1 or (0 <= (caldate{t} - date_most_recent_tb) <= 0.5)) then do;  
		hiv_death_rate = hiv_death_rate * 2;
		end;

		if pcp_p   =1  then hiv_death_rate = hiv_death_rate*0.8;
		if nod    ge 3 then hiv_death_rate = 0.6 * hiv_death_rate;
		if nod    = 2 then  hiv_death_rate = 0.85* hiv_death_rate;
		if nod    = 1 then  hiv_death_rate = 0.9 * hiv_death_rate;
		if nod    = 0 then  hiv_death_rate = 1.0 * hiv_death_rate;

		death_rix = 1 - exp(-0.25*hiv_death_rate); 
* ts1m: *	death_rix = 1 - exp (-(1/12)*hiv_death_rate);
		x3=uniform(0);
		if x3 le death_rix then do;

		rdcause=1;

* some of these deaths are related to CD4 but wont go down as who4_ related (eg other cancers, but not incl liver death)
so a proportion (15%) are classified as non-who4_;
			dead=1; death=caldate{t}; timedead=death-infection; cd4_dead=cd4;agedeath=age;

			dead_diagnosed=0; if registd=1 then dead_diagnosed=1;  dead_naive=0; if naive=1 then dead_naive=1;
			dead_onart=0; if onart=1 then dead_onart=1; dead_line1_lf0=0; if artline=1 and linefail=0 then dead_line1_lf0 =1;
			dead_line1=0; if artline=1 then dead_line1 =1;  dead_line2=0; if artline=2 then dead_line2 =1;
			dead_line1_lf1=0; if artline=1 and linefail=1 then dead_line1_lf1 =1; dead_line2_lf1=0; if artline=2 and linefail=1 then dead_line2_lf1 =1;
			dead_line2_lf2=0; if artline=2 and linefail=2 then dead_line2_lf2 =1; dead_artexpoff=0; if naive=0 and onart=0 then dead_artexpoff =1;
			dead_nn=0; if o_nev=1 or o_efa=1 then dead_nn=1; dead_pir=0; if o_lpr=1 or o_dar=1  or o_taz=1 then dead_pir=1; dead_adc=0; if adc=1 then dead_adc=1;
			dead_line1_vlg500=0; if artline=1 and vl ge 2.7 then dead_line1_vlg500=1;
			dead_line2_vlg500=0; if artline=2 and vl ge 2.7 then dead_line2_vlg500=1;
			dead_artexp=0; if naive=0 then dead_artexp=1;
			
			dead_6m_onart=0; if onart=1 and . lt caldate{t}-yrart le 0.5 then dead_6m_onart=1;
			dead_12m_onart=0;if onart=1 and . lt caldate{t}-yrart le 1   then dead_12m_onart=1;
			dead_24m_onart=0;if onart=1 and . lt caldate{t}-yrart le 2   then dead_24m_onart=1;
			dead_36m_onart=0;if onart=1 and . lt caldate{t}-yrart le 3   then dead_36m_onart=1;

			r=uniform(0);
			if r < 0.85 then do; dcause=1;if who4_=0 then do; who4_=1; who4_date=caldate{t}; cd4_who4_=cd4;end; end;
			if r >= 0.85 then dcause=2;
		end;

		if hbv=1 or hcv=1 then do;
			liverdra = base_rate / 6.0; * so liver death assumed closely CD4 related;

* consider if * dependent_on_time_step_length ;
			liverdri3 = 1 - exp(-0.25*liverdra); x3=uniform(0);
		end;
		if x3 le liverdri3 then do;
			dead=1; death=caldate{t}; timedead=death-infection; cd4_dead=cd4; liver_death=1; dcause=2; rdcause=1; agedeath=age;
		end;


* what death rates to use ?;

		if gender=1 then do; * based on SA deeath rates in 1997 (pre most AIDS deaths);
			if 15 <= age < 20 then ac_death_rate = 0.00200;
			if 20 <= age < 25 then ac_death_rate = 0.00320;
			if 25 <= age < 30 then ac_death_rate = 0.00580;
			if 30 <= age < 35 then ac_death_rate = 0.00750;
			if 35 <= age < 40 then ac_death_rate = 0.00800;
			if 40 <= age < 45 then ac_death_rate = 0.01000;
			if 45 <= age < 50 then ac_death_rate = 0.01200;
			if 50 <= age < 55 then ac_death_rate = 0.01900;
			if 55 <= age < 60 then ac_death_rate = 0.02500;
			if 60 <= age < 65 then ac_death_rate = 0.03500;
			if 65 <= age < 70 then ac_death_rate = 0.04500;
			if 70 <= age < 75 then ac_death_rate = 0.05500;
			if 75 <= age < 80 then ac_death_rate = 0.06500;
			if 80 <= age < 85 then ac_death_rate = 0.10000;
			if 85 <= age  then ac_death_rate = 0.4000;
		end;

		if gender=2 then do; * based on SA deeath rates in 1997 (pre most AIDS deaths);
			if 15 <= age < 20 then ac_death_rate = 0.00150;
			if 20 <= age < 25 then ac_death_rate = 0.00280;
			if 25 <= age < 30 then ac_death_rate = 0.00400;
			if 30 <= age < 35 then ac_death_rate = 0.00400;
			if 35 <= age < 40 then ac_death_rate = 0.00420;
			if 40 <= age < 45 then ac_death_rate = 0.00550;
			if 45 <= age < 50 then ac_death_rate = 0.00750;
			if 50 <= age < 55 then ac_death_rate = 0.01100;
			if 55 <= age < 60 then ac_death_rate = 0.01500;	
			if 60 <= age < 65 then ac_death_rate = 0.02100;
			if 65 <= age < 70 then ac_death_rate = 0.03000;
			if 70 <= age < 75 then ac_death_rate = 0.03800;
			if 75 <= age < 80 then ac_death_rate = 0.05000;
			if 80 <= age < 85 then ac_death_rate = 0.07000;
			if 85 <= age  then ac_death_rate = 0.15000;
		end;

		if c_neph=1 then ac_death_rate=ac_death_rate+0.005;
		if c_lac=1 then ac_death_rate=ac_death_rate+0.10;

	ac_death_rate = ac_death_rate * fold_change_ac_death_rate; * apr14 these death rates increased to reflect better pop pyramid;

	if onart ne 1 then ac_death_rate = 2 * ac_death_rate;
	if onart =1 then ac_death_rate = 1.3 * ac_death_rate;

		if o_dol=1 and incr_mort_risk_dol_weightg ge 1 then ac_death_rate = ac_death_rate  * incr_mort_risk_dol_weightg_i; 

		if o_ten=1 and ten_is_taf_2020=1 then ac_death_rate = ac_death_rate  * 1.25; 

		ac_deathrix = 1 - exp(-0.25*ac_death_rate);
* ts1m:  ac_deathrix = 1 - exp(-(1/12)*ac_death_rate); 

		x3=uniform(0);

		if x3 le ac_deathrix then do;
			dead=1; death=caldate{t}; timedead=death-infection; cd4_dead=cd4; dcause=2; rdcause=2; agedeath=age;
		end;
	end;


* time known to have been virally suppressed at last vlm;

* likely * dependent_on_time_step_length ;
	vlt_ = min(1000,vl_threshold);
	if . < vm < log10(vlt_) then do;  * sep14;
		if time_known_v_supp_at_last_vlm = . then time_known_v_supp_at_last_vlm = 0; 
		if time_known_v_supp_at_last_vlm ge 0 then time_known_v_supp_at_last_vlm = time_known_v_supp_at_last_vlm + (caldate{t} - date_last_known_v_suppression); 
		date_last_known_v_suppression = caldate{t}; 
	end;
	if vm >= log10(vlt_) then do; time_known_v_supp_at_last_vlm = .; date_last_known_v_suppression=.; end;

	if vm ne . then do; time_since_last_vm = 0; value_last_vm = vm ; end;
	if vm > 3 then time_since_last_vm_gt3 = 0; 

	if vm=. then time_since_last_vm = time_since_last_vm + 0.25;
	if vm <= 3 then time_since_last_vm_gt3 = time_since_last_vm_gt3 + 0.25; 
* ts1m: 	
*	if vm=. then time_since_last_vm = time_since_last_vm + (1/12);
*	if vm <= 3 then time_since_last_vm_gt3 = time_since_last_vm_gt3 + (1/12); 

	if cm ne . then do; time_since_last_cm = 0; value_last_cm = cm ; end;
	if cm   =. then time_since_last_cm = time_since_last_cm + 0.25; 
* ts1m: 	if cm   =. then time_since_last_cm = time_since_last_cm + (1/12);

	sv=0;
 

	if sv_secondline ne 1 then do;
	if t ge 4 and (onart=1 or int_clinic_not_aw=1) 
	and . < caldate{t} - date_last_known_v_suppression <= 1.25 and linefail=0 then sv=1; 
	end;

	if sv_secondline = 1 then do;
	if t ge 4 and (onart=1 or int_clinic_not_aw=1) 
	and . < caldate{t} - date_last_known_v_suppression <= 1.25 then sv=1; 
	end;

	if sv_secondline ne 1 then do;
	if t ge 4 and art_monitoring_strategy=152 and (onart=1 or int_clinic_not_aw=1) and . < caldate{t} - date_last_known_v_suppression <= 2.25 
	and linefail=0 then sv=1; 
	end;

	if sv_secondline = 1 then do;
	if t ge 4 and art_monitoring_strategy=152 and (onart=1 or int_clinic_not_aw=1) and . < caldate{t} - date_last_known_v_suppression <= 2.25 
	and linefail=0 then sv=1; 
	end;

	if visit=1 then do; if date_linked_to_care = . then date_linked_to_care = caldate{t}; linked_to_care=1;  end;

	if registd=0 then visit=.;

	if caldate&j=death > . then do;
			dead_diagnosed=0; if registd=1 then dead_diagnosed=1;  dead_naive=0; if naive=1 then dead_naive=1;
			dead_onart=0; if onart=1 then dead_onart=1; dead_line1_lf0=0; if artline=1 and linefail=0 then dead_line1_lf0 =1;
			dead_line1=0; if artline=1 then dead_line1 =1;  dead_line2=0; if artline=2 then dead_line2 =1;
			dead_u_vfail1=0; if death > date_u_vfail > . then dead_u_vfail1=1; 			
			dead_line1_lf1=0; if artline=1 and linefail=1 then dead_line1_lf1 =1; dead_line2_lf1=0; if artline=2 and linefail=1 then dead_line2_lf1 =1;
			dead_line2_lf2=0; if artline=2 and linefail=2 then dead_line2_lf2 =1; dead_artexpoff=0; if naive=0 and onart=0 then dead_artexpoff =1;
			dead_nn=0; if o_nev=1 or o_efa=1 then dead_nn=1; dead_pir=0; if o_lpr=1 or o_dar=1  or o_taz=1 then dead_pir=1; dead_adc=0; if adc=1 then dead_adc=1;
			dead_line1_vlg1000=0; if artline=1 and vl ge 3 then dead_line1_vlg1000=1;
			dead_line2_vlg1000=0; if artline=2 and vl ge 3 then dead_line2_vlg1000=1;
			dead_artexp=0; if naive=0 then dead_artexp=1;
			dead_6m_onart=0; if onart=1 and . lt caldate{t}-yrart le 0.5 then dead_6m_onart=1;
			dead_12m_onart=0;if onart=1 and . lt caldate{t}-yrart le 1   then dead_12m_onart=1;
			dead_24m_onart=0;if onart=1 and . lt caldate{t}-yrart le 2   then dead_24m_onart=1;
			dead_36m_onart=0;if onart=1 and . lt caldate{t}-yrart le 3   then dead_36m_onart=1;
	end;



end;

* end of code for those with caldate{t} >= infection +0.25;



end;
* END OF THE CODE FOR HIV INFECTED;



* ------------------------------------------------------------------------------------------------------------------------------------------;

* End of SECTION 3A ;

* ------------------------------------------------------------------------------------------------------------------------------------------;





* COSTS (MEASURED IN 1000s OF DOLLARS);
* costs at t are costs from t to t+0.25  (or 1/12 if ts1m);

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
if start_line2_this_period=1 then cost_switch_line=cost_switch_line_a;

	art_cost=0;

    art_cost=(o_zdv*cost_zdv) + (o_ten*cost_ten) + (o_3tc*cost_3tc) + (o_nev*cost_nev) +
    (o_lpr*cost_lpr) + (o_dar*cost_dar)+ (o_taz*cost_taz)+ (o_efa*cost_efa)+ (o_dol*cost_dol);

	* ART initiation cost;
	if yrart=caldate{t} then art_cost = art_cost + art_init_cost;

 	art_1_cost=0; if artline=1 then art_1_cost=art_cost; 
	art_2_cost=0; if artline=2 then art_2_cost=art_cost;
	art_3_cost=0; if artline=3 then art_3_cost=art_cost;

 
* ADC costs;
	adc_cost=0;
	if adc=1 then adc_cost=adc_cost_a;
	
* who3 costs;
	who3_cost=0;
	if who3_event   =1 then who3_cost=who3_cost_a;

* tb costs;
	tb_cost=0;
	if t ge 2 and 0 <= (caldate{t} - date_most_recent_tb) < 0.5 then tb_cost=tb_cost_a;

* co-trimoxazole costs;
	cot_cost=0;
	if pcp_p   =1 then cot_cost=cot_cost_a;

* targeted adh intervention cost;
t_adh_int_cost=0;  if caldate{t}=date_v_alert then  t_adh_int_cost = cost_t_adh_int;


* visit costs;
full_vis_cost=0; vis_cost=0; 
if visit=1 then do; vis_cost=vis_cost_a; full_vis_cost=vis_cost_a; end;* what is cost of an outpatient visit ? / doctor/nurse/admin time plus other tests;


* possibility of lower clinic cost if have measured VL < 1000 ;  *http://www.sajhivmed.org.za/index.php/sajhivmed/article/view/924/821;
vis_cost_sv=0;full_vis_cost_sv=0;
* consider if * dependent_on_time_step_length ;
if sv=1 then do;	vis_cost=vis_cost-redn_in_vis_cost_vlm_supp; full_vis_cost_sv = full_vis_cost; vis_cost_sv = vis_cost;  end;


* pre-death morbidity costs if people dying with dcause =2;

non_aids_pre_death_cost = 0;  if death=caldate{t} and rdcause = 2 then non_aids_pre_death_cost = 1.000;



* lab costs;
	cd4_cost=0; 
	if cd4_cost_inc=1 then cd4_cost=cd4_cost_a;
	if cd4_cost_inc=2 then cd4_cost= 2 * cd4_cost_a;

	cd4_cost_inc=0;

	vl_cost=0; 
	if vl_cost_inc=1 and vm_format in (1,2) then vl_cost=vl_cost_lab; 
	if vl_cost_inc=1 and vm_format in (3,4) then vl_cost=vl_cost_poc;

	v_lab_transport_cost=0; 


	* test cost incurred for proportion of tests not done, result not obtained - but currently this proportion set to 0;
	cost_vl_not_done=0;
	if vm=. and vl_cost_inc=1 then do;
	vl_cost=cost_vl_not_done;
	end;
	
	vl_cost_inc=0;

	res_cost=0; if res_test=1 then res_cost=res_cost_a;


	cost_drug_level_test = 0;

	if caldate{t} = date_drug_level_test then drug_level_test_cost = cost_drug_level_test;

	if t ge 2 and dead_tm1=1 then dead   =.;

* f_prep - Cost of PrEP - tests costed separately - from kzn mar19;
cost_prep=0; cost_prep_visit=0;cost_prep_ac_adh=0;
if prep=1 and pop_wide_tld_prep ne 1 then do;
	cost_ten=0;	cost_3tc=0;
	cost_prep = prep_drug_cost ;  cost_prep_ac_adh=cost_prep*adh; * 1.2 is supply chain, as for arvs;
	if visit_prep = 1 then cost_prep_visit = cost_prep_clinic / 2; * drug pick-up only - mar18 ; 
	if visit_prep = 2 then cost_prep_visit = cost_prep_clinic; 
	if visit_prep = 3 then cost_prep_visit = cost_prep_clinic+cost_prep_clinic_couns;
	*cost depends on whether they are just picking up the drug or also receiving further clinic time (counselling);
end;
if pop_wide_tld_prep = 1 then do;
	cost_ten=0;	cost_3tc=0; cost_dol=0;
	cost_prep = prep_drug_cost_tld ;  cost_prep_ac_adh=cost_prep*adh; * 1.2 is supply chain, as for arvs;
	if visit_prep = 1 then cost_prep_visit = cost_prep_clinic / 2; * drug pick-up only - mar18 ; 
	if visit_prep = 2 then cost_prep_visit = cost_prep_clinic; 
	if visit_prep = 3 then cost_prep_visit = cost_prep_clinic+cost_prep_clinic_couns;
end;


cost_circ=0; if new_mcirc=1 then cost_circ=circ_cost_a; 

cost_condom_dn=0; if caldate{t} ge 1995 and 15 <= age < 65 then cost_condom_dn=condom_dn_cost;

cost_sw_program=0; if sw_program_visit=1 then cost_sw_program = sw_program_cost;


cost =  max(0,art_cost) +adc_cost+cd4_cost+vl_cost+vis_cost+who3_cost+cot_cost+tb_cost+res_cost
+max(0,t_adh_int_cost) + cost_test + max (0, cost_circ) + max (0, cost_switch_line) + max(0, cost_prep) + max(0,cost_prep_visit)
+  max(0,drug_level_test_cost) + max(0,cost_condom_dn) + max(0,cost_sw_program);

cost_onart=0; if onart=1 then cost_onart=max(0,art_cost) + max (0, cd4_cost) + max (0, vl_cost) + max (0, vis_cost)
+ max (0,adc_cost) + max (0, who3_cost) + max (0, tb_cost) + max(0, cot_cost) +  max (0, res_cost) + max(0,t_adh_int_cost)
+ max (0, cost_switch_line) +  max(0,drug_level_test_cost);

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

if dead   =. then do; cost=0; cost_onart=0; art_cost=0;adc_cost=0;cd4_cost=0;vl_cost=0;vis_cost=0;who3_cost=0;cot_cost=0;tb_cost=0;
res_cost=0;t_adh_int_cost =0; cost_test=0; cost_prep=0; cost_circ=0;cost_switch_line=0 ; cost_condom_dn=0;cost_sw_program=0;
 cost_prep_visit=0;end;

* this below is cost of care of hiv infected child and should hold even after mothers death - estimate $30 per 3 months for total care incl art;
* low cost partially is to take account of possibility of child dying ;

 * dependent_on_time_step_length ;
cost_child_hiv = 0; if ever_birth_with_inf_child=1 then cost_child_hiv = cost_child_hiv_a;  
cost_child_hiv_mo_art = 0; if ev_birth_with_inf_ch_onart=1 then cost_child_hiv_mo_art = cost_child_hiv_mo_art_a;  


* DEATH IN UNINFECTED ;

if hiv ne 1 and age >= 15 and dead   =0 then do;

* no death age under 15 - those with age  < 15 dont enter model properly until reach 15;
* roughly close to zimbabwe - Lopman et al  Bull of the WHO  2006;
* if this is changed, the distribution of age  will also have to be changed so that in absence of hiv the age distribution
at time zero is the same as that in later years;

 * dependent_on_time_step_length ;

if gender=1 then do; * based on SA death rates in 1997 (pre most AIDS deaths);
		if 15 <= age < 20 then ac_death_rate = 0.00200;
		if 20 <= age < 25 then ac_death_rate = 0.00320;
		if 25 <= age < 30 then ac_death_rate = 0.00580;
		if 30 <= age < 35 then ac_death_rate = 0.00750;
		if 35 <= age < 40 then ac_death_rate = 0.00800;
		if 40 <= age < 45 then ac_death_rate = 0.01000;
		if 45 <= age < 50 then ac_death_rate = 0.01200;
		if 50 <= age < 55 then ac_death_rate = 0.01900;
		if 55 <= age < 60 then ac_death_rate = 0.02500;
		if 60 <= age < 65 then ac_death_rate = 0.03500;
		if 65 <= age < 70 then ac_death_rate = 0.04500;
		if 70 <= age < 75 then ac_death_rate = 0.05500;
		if 75 <= age < 80 then ac_death_rate = 0.06500;
		if 80 <= age < 85 then ac_death_rate = 0.10000;
		if 85 <= age  then ac_death_rate = 0.4000;
	end;

	if gender=2 then do; * based on SA death rates in 1997 (pre most AIDS deaths);
		if 15 <= age < 20 then ac_death_rate = 0.00150;
		if 20 <= age < 25 then ac_death_rate = 0.00280;
		if 25 <= age < 30 then ac_death_rate = 0.00400;
		if 30 <= age < 35 then ac_death_rate = 0.00400;
		if 35 <= age < 40 then ac_death_rate = 0.00420;
		if 40 <= age < 45 then ac_death_rate = 0.00550;
		if 45 <= age < 50 then ac_death_rate = 0.00750;
		if 50 <= age < 55 then ac_death_rate = 0.01100;
		if 55 <= age < 60 then ac_death_rate = 0.01500;
		if 60 <= age < 65 then ac_death_rate = 0.02100;
		if 65 <= age < 70 then ac_death_rate = 0.03000;
		if 70 <= age < 75 then ac_death_rate = 0.03800;
		if 75 <= age < 80 then ac_death_rate = 0.05000;
		if 80 <= age < 85 then ac_death_rate = 0.07000;
		if 85 <= age  then ac_death_rate = 0.15000;
	end;

	if i_mort_risk_dol_prep_weightg = . then i_mort_risk_dol_prep_weightg = 1.00 ;
	if pop_wide_tld_prep=1 then ac_death_rate = ac_death_rate  * i_mort_risk_dol_prep_weightg; 

	ac_death_rate = ac_death_rate * fold_change_ac_death_rate ; 

	ac_deathrix = 1 - exp(-0.25*ac_death_rate); x3=uniform(0);
* ts1m:  ac_deathrix = 1 - exp(-(1/12)*ac_death_rate); 

	if x3 le ac_deathrix then do;
		dead   =1; death=caldate{t}; timedead=death-infection; dcause=2; agedeath=age;
	end;

end;


* covid and covid death;

	covid = 0; a = uniform(0);
	if age ge 15 and prev_covid ne 1 and 2020.25 <= caldate{t} < 2020.75 then do; covid = 1; prev_covid=1;  end; 

	if covid = 1 and dead ne 1 then do;
	if 15 <= age < 20 then cov_deathrix = 0.0001  ;
	if 20 <= age < 30 then cov_deathrix = 0.0003  ;
	if 30 <= age < 40 then cov_deathrix = 0.0008  ;
	if 40 <= age < 50 then cov_deathrix = 0.0016  ;
	if 50 <= age < 60 then cov_deathrix = 0.006   ;
	if 60 <= age < 70 then cov_deathrix = 0.019   ;
	if 70 <= age < 80 then cov_deathrix = 0.043   ;
	if 80 <= age      then cov_deathrix = 0.078   ;
	if cov_death_risk_mult = 2 then cov_deathrix = cov_deathrix * 2;
	if cov_death_risk_mult = 3 then cov_deathrix = cov_deathrix * 3;
	end;

	xcovid = uniform(0);
	if covid = 1 and xcovid le cov_deathrix then do;
		dead   =1; death=caldate{t}; timedead=death-infection; dcause=3; agedeath=age; 
	end;



if tested=1 then ever_tested=1;


if  caldate{t} > death > . then do;
	hiv=.;newp=.;np=.;epi   =.; epmono=.;
	cd4=.;cc=.;vc=.;vl=.;age=.;adc=.;adh=.;who4_=.;nod   =.;tcur=.;who3_=.;
	onart   =.;visit=.;nactive=.;registd=.;
	tested=.;
	naive=.;artline=.;linefail=.;
	o_zdv=.;o_3tc=.;o_dar=.;o_ten=.;
	e_totmut   =.; who3_event=.;
	o_efa=.;o_lpr=.;o_taz=.;o_dol=.;
	cmin   =.;
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
	c_lip=.;c_pen=.;c_ras=.;c_cns=.;c_hep=.;x4v=.;
	c_nau=.;c_otx=.;c_tox=.;c_head=.;c_dia=.;c_ane=.;c_lac=.;
	c_neph = .;
	restart=.;interrupt=.;
	lost=.;toffart   =.;
	primary   =.;ever_tested=.;date_last_test=.;sympt_diag=.;sympt_diag_ever=.;
	ever_ep=.;ever_newp=.;ever_sw=.;ever_sw1849_=.;act_years_sw=.;years_sw=.;
	acq_rt65m=.;acq_rt184m=.;acq_rtm=.;
	time_acq_rt65m=.;time_acq_rt184m=.;time_acq_rtm=.;time_stop_prep=.;
	prep=.;hr_noprep=.;elig_prep_epdiag=.;elig_prep=.;	primary_prep=.;primary_hr_noprep=.; 
	hiv1_prep=.;infected_prep=.; primary_r_prep=.;ever_i_nor_prep=.;i_r_prep=.;rm_prep=.;
	rt65m_3_prep=.;rt184m_3_prep=.;rtm_3_prep=.;rt65m_6_prep=.;rt184m_6_prep=.;rtm_6_prep=.;rt65m_9_prep=.;rt184m_9_prep=.;rtm_9_prep=.;
	rt65m_12_prep=.;rt184m_12_prep=.;rtm_12_prep=.;rt65m_18_prep=.;rt184m_18_prep=.;rtm_18_prep=.;onprep_3=.;onprep_6=.;onprep_9=.;onprep_12=.;onprep_18=.;
	cum_children=.;pregnant=.;anc=.;on_sd_nvp=.;on_dual_nvp=.;int_clinic_not_aw=.;
	dead_6m_onart=.; dead_12m_onart=.;dead_24m_onart=.;dead_36m_onart=.;
	np_ever=.;newp_ever=.;
	episodes_sw=.;sw_gt1ep=.; age_deb_sw=.;age_deb_sw_nm=.; sw=.;
	tested_circ=.;tested_anc_prevdiag=.;
	ever_hiv1_prep=.; visit_prep=.; prepstart=.; ever_stopped_prep_choice=.; preprestart=.; n_test_prev_4p_onprep=.;pop_wide_tld_prep=.;
end;


* END OF THE OVERALL LOOP;

xx55:
t=t+1;
end;




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 4

Derive values of additional variables for this 3 month period for each person. 
These are variables we want to save outputs for in the form of sums across individuals, either to analyse afterwards, or to feed back into 
the next 3 month period of the model


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;



* steps below are for conversion of scales before outputting cd4 count converted from square root scale
to absolute scale ;

t=&e;
do until (t=&f);
	vc=round(vc,0.001);
	vl=round(vl,.01);
	vm=round(vm,.1);
	if cd4 ne . then cd4=round(cd4,1);if cm    ne . then cm   =round(cm   ,1);
	cmin=round(cmin,1);
	cc=round(cc,1);
t=t+1;
end;
cd4_who4_=round(cd4_who4_,1);
cd4_dead=round(cd4_dead,1);
cd4diag=round(cd4diag,1);
vset=round(vset,.1);


if 15 <= age < 25 then ageg=1;
if 25 <= age < 35 then ageg=2;
if 35 <= age < 45 then ageg=3;
if 45 <= age < 55 then ageg=4;
if 55 <= age < 65 then ageg=5;

if gender=1 then do;
	if 15 <= age < 25 then ageg1m=1;else ageg1m=0;
	if 25 <= age < 35 then ageg2m=1;else ageg2m=0;
	if 35 <= age < 45 then ageg3m=1;else ageg3m=0;
	if 45 <= age < 55 then ageg4m=1;else ageg4m=0;
	if 55 <= age < 65 then ageg5m=1;else ageg5m=0;

	if 15 <= age < 18 then ageg1517m=1;else ageg1517m=0;
	if 18 <= age < 20 then ageg1819m=1;else ageg1819m=0;
	if 15 <= age < 20 then ageg1519m=1;else ageg1519m=0;
	if 20 <= age < 25 then ageg2024m=1;else ageg2024m=0;
	if 25 <= age < 30 then ageg2529m=1;else ageg2529m=0;
	if 30 <= age < 35 then ageg3034m=1;else ageg3034m=0;
	if 35 <= age < 40 then ageg3539m=1;else ageg3539m=0;
	if 40 <= age < 45 then ageg4044m=1;else ageg4044m=0;
	if 45 <= age < 50 then ageg4549m=1;else ageg4549m=0;
	if 50 <= age < 55 then ageg5054m=1;else ageg5054m=0;
	if 55 <= age < 60 then ageg5559m=1;else ageg5559m=0;
	if 60 <= age < 65 then ageg6064m=1;else ageg6064m=0;
	if 65 <= age < 70 then ageg6569m=1;else ageg6569m=0;
	if 70 <= age < 75 then ageg7074m=1;else ageg7074m=0;
	if 75 <= age < 80 then ageg7579m=1;else ageg7579m=0;
	if 80 <= age < 85 then ageg8084m=1;else ageg8084m=0;
	if 85 <= age      then ageg85plm=1;else ageg85plm=0;

	if 15 <= age < 65 then ageg1564m=1;else ageg1564m=0;
	if 15 <= age < 50 then ageg1549m=1;else ageg1549m=0;

	if 10 <= age < 15 then ageg1014m=1;else ageg1014m=0;

end;

if gender=2 then do;
	if 15 <= age < 25 then ageg1w=1;else ageg1w=0;
	if 25 <= age < 35 then ageg2w=1;else ageg2w=0;
	if 35 <= age < 45 then ageg3w=1;else ageg3w=0;
	if 45 <= age < 55 then ageg4w=1;else ageg4w=0;
	if 55 <= age < 65 then ageg5w=1;else ageg5w=0;

	if 15 <= age < 18 then ageg1517w=1;else ageg1517w=0;
	if 18 <= age < 20 then ageg1819w=1;else ageg1819w=0;
	if 15 <= age < 20 then ageg1519w=1;else ageg1519w=0;
	if 20 <= age < 25 then ageg2024w=1;else ageg2024w=0;
	if 25 <= age < 30 then ageg2529w=1;else ageg2529w=0;
	if 30 <= age < 35 then ageg3034w=1;else ageg3034w=0;
	if 35 <= age < 40 then ageg3539w=1;else ageg3539w=0;
	if 40 <= age < 45 then ageg4044w=1;else ageg4044w=0;
	if 45 <= age < 50 then ageg4549w=1;else ageg4549w=0;
	if 50 <= age < 55 then ageg5054w=1;else ageg5054w=0;
	if 55 <= age < 60 then ageg5559w=1;else ageg5559w=0;
	if 60 <= age < 65 then ageg6064w=1;else ageg6064w=0;
	if 65 <= age < 70 then ageg6569w=1;else ageg6569w=0;
	if 70 <= age < 75 then ageg7074w=1;else ageg7074w=0;
	if 75 <= age < 80 then ageg7579w=1;else ageg7579w=0;
	if 80 <= age < 85 then ageg8084w=1;else ageg8084w=0;
	if 85 <= age      then ageg85plw=1;else ageg85plw=0;

	if 15 <= age < 65 then ageg1564w=1;else ageg1564w=0;
	if 15 <= age < 50 then ageg1549w=1;else ageg1549w=0;
end;

alive_m = 0;  if age ge 15 and gender=1 then alive_m = 1;
alive_w = 0;  if age ge 15 and gender=2 then alive_w = 1;
if 15 <= age < 50 then alive1549=1;else alive1549=0;
if 15 <= age < 50 and gender=1 then alive1549_m=1;else alive1549_m=0;
if 15 <= age < 50 and gender=2 then alive1549_w=1;else alive1549_w=0;
if 15 <= age < 65 then alive1564=1;else alive1564=0;
if 15 <= age < 65 and gender=1 then alive1564_m=1;else alive1564_m=0;
if 15 <= age < 65 and gender=2 then alive1564_w=1;else alive1564_w=0;

age_1849w=0;if 18 <= age < 50 and gender=2 then age_1849w=1;
age_1844m=0;if 18 <= age < 45 and gender=1 then age_1844m=1;
age_1844w=0;if 18 <= age < 45 and gender=2 then age_1844w=1;


*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*;
ceb_w1524=0;ceb_w2534=0;ceb_w3544=0;ceb_w4549=0;
if gender=2 then do;
	if      15 <= age < 25 then ceb_w1524=cum_children;
	else if 25 <= age < 35 then ceb_w2534=cum_children;
	else if 35 <= age < 45 then ceb_w3544=cum_children;
	else if 45 <= age < 50 then ceb_w4549=cum_children;
end;
hiv_pregnant=0; if pregnant=1 and hiv=1 then hiv_pregnant=1;
hiv_anc=0;      if anc=1      and hiv=1 then hiv_anc=1;
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*;

primary1519m=0; if gender=1 and primary=1 and 15 <= age < 20 then primary1519m=1;
primary2024m=0; if gender=1 and primary=1 and 20 <= age < 25 then primary2024m=1;
primary2529m=0; if gender=1 and primary=1 and 25 <= age < 30 then primary2529m=1;
primary3034m=0; if gender=1 and primary=1 and 30 <= age < 35 then primary3034m=1;
primary3539m=0; if gender=1 and primary=1 and 35 <= age < 40 then primary3539m=1;
primary4044m=0; if gender=1 and primary=1 and 40 <= age < 45 then primary4044m=1;
primary4549m=0; if gender=1 and primary=1 and 45 <= age < 50 then primary4549m=1;
primary5054m=0; if gender=1 and primary=1 and 50 <= age < 55 then primary5054m=1;
primary5559m=0; if gender=1 and primary=1 and 55 <= age < 60 then primary5559m=1;
primary6064m=0; if gender=1 and primary=1 and 60 <= age < 65 then primary6064m=1;

primary1549m=0; if gender=1 and primary=1 and 15 <= age < 50 then primary1549m=1;

primary1519w=0; if gender=2 and primary=1 and 15 <= age < 20 then primary1519w=1;
primary2024w=0; if gender=2 and primary=1 and 20 <= age < 25 then primary2024w=1;
primary2529w=0; if gender=2 and primary=1 and 25 <= age < 30 then primary2529w=1;
primary3034w=0; if gender=2 and primary=1 and 30 <= age < 35 then primary3034w=1;
primary3539w=0; if gender=2 and primary=1 and 35 <= age < 40 then primary3539w=1;
primary4044w=0; if gender=2 and primary=1 and 40 <= age < 45 then primary4044w=1;
primary4549w=0; if gender=2 and primary=1 and 45 <= age < 50 then primary4549w=1;
primary5054w=0; if gender=2 and primary=1 and 50 <= age < 55 then primary5054w=1;
primary5559w=0; if gender=2 and primary=1 and 55 <= age < 60 then primary5559w=1;
primary6064w=0; if gender=2 and primary=1 and 60 <= age < 65 then primary6064w=1;

primary1549w=0; if gender=2 and primary=1 and 15 <= age < 50 then primary1549w=1;

primary1549=0; if primary=1 and 15 <= age < 50 then primary1549=1;


primary1524m_ep=0; if gender=1 and primary=1 and 15 <= age < 25 and ep=1 then primary1524m_ep=1;
primary2534m_ep=0; if gender=1 and primary=1 and 25 <= age < 35 and ep=1 then primary2534m_ep=1;
primary3544m_ep=0; if gender=1 and primary=1 and 35 <= age < 45 and ep=1 then primary3544m_ep=1;
primary4554m_ep=0; if gender=1 and primary=1 and 45 <= age < 55 and ep=1 then primary4554m_ep=1;
primary5564m_ep=0; if gender=1 and primary=1 and 55 <= age < 65 and ep=1 then primary5564m_ep=1;
primary1524w_ep=0; if gender=2 and primary=1 and 15 <= age < 25 and ep=1 then primary1524w_ep=1;
primary2534w_ep=0; if gender=2 and primary=1 and 25 <= age < 35 and ep=1 then primary2534w_ep=1;
primary3544w_ep=0; if gender=2 and primary=1 and 35 <= age < 45 and ep=1 then primary3544w_ep=1;
primary4554w_ep=0; if gender=2 and primary=1 and 45 <= age < 55 and ep=1 then primary4554w_ep=1;
primary5564w_ep=0; if gender=2 and primary=1 and 55 <= age < 65 and ep=1 then primary5564w_ep=1;

primary1524m_epnewp=0; if gender=1 and primary=1 and 15 <= age < 25 and ep=1 and newp ge 1 then primary1524m_epnewp=1;
primary2534m_epnewp=0; if gender=1 and primary=1 and 25 <= age < 35 and ep=1 and newp ge 1 then primary2534m_epnewp=1;
primary3544m_epnewp=0; if gender=1 and primary=1 and 35 <= age < 45 and ep=1 and newp ge 1 then primary3544m_epnewp=1;
primary4554m_epnewp=0; if gender=1 and primary=1 and 45 <= age < 55 and ep=1 and newp ge 1 then primary4554m_epnewp=1;
primary5564m_epnewp=0; if gender=1 and primary=1 and 55 <= age < 65 and ep=1 and newp ge 1 then primary5564m_epnewp=1;
primary1524w_epnewp=0; if gender=2 and primary=1 and 15 <= age < 25 and ep=1 and newp ge 1 then primary1524w_epnewp=1;
primary2534w_epnewp=0; if gender=2 and primary=1 and 25 <= age < 35 and ep=1 and newp ge 1 then primary2534w_epnewp=1;
primary3544w_epnewp=0; if gender=2 and primary=1 and 35 <= age < 45 and ep=1 and newp ge 1 then primary3544w_epnewp=1;
primary4554w_epnewp=0; if gender=2 and primary=1 and 45 <= age < 55 and ep=1 and newp ge 1 then primary4554w_epnewp=1;
primary5564w_epnewp=0; if gender=2 and primary=1 and 55 <= age < 65 and ep=1 and newp ge 1 then primary5564w_epnewp=1;

primary_ep_m=0; if primary=1 and ep=1 and epi  =0 and gender=1 then primary_ep_m=1;
primary_ep_w=0; if primary=1 and ep=1 and epi  =0 and gender=2 then primary_ep_w=1;

* this is denominator for incidence of hiv in those with ep=1 epi=0
  only uninfected, as these are at risk of infection ;
eph0_m=0; if ep=1 and hiv=0  and epi  =0 and gender=1 then eph0_m=1;
eph0_w=0; if ep=1 and hiv=0  and epi  =0 and gender=2 then eph0_w=1;

i_m_1524_newp=0; if hiv=1 and gender=1 and 15 <= age < 25 then i_m_1524_newp=newp;
i_m_2534_newp=0; if hiv=1 and gender=1 and 25 <= age < 35 then i_m_2534_newp=newp;
i_m_3544_newp=0; if hiv=1 and gender=1 and 35 <= age < 45 then i_m_3544_newp=newp;
i_m_4554_newp=0; if hiv=1 and gender=1 and 45 <= age < 55 then i_m_4554_newp=newp;
i_m_5564_newp=0; if hiv=1 and gender=1 and 55 <= age < 65 then i_m_5564_newp=newp;

m_1524_newp=0;if  gender=1 and 15 <= age < 25 then m_1524_newp=newp;
m_2534_newp=0;if  gender=1 and 25 <= age < 35 then m_2534_newp=newp;
m_3544_newp=0;if  gender=1 and 35 <= age < 45 then m_3544_newp=newp;
m_4554_newp=0;if  gender=1 and 45 <= age < 55 then m_4554_newp=newp;
m_5564_newp=0;if  gender=1 and 55 <= age < 65 then m_5564_newp=newp;

i_w_1524_newp=0; if hiv=1 and gender=2 and 15 <= age < 25 then i_w_1524_newp=newp;
i_w_2534_newp=0; if hiv=1 and gender=2 and 25 <= age < 35 then i_w_2534_newp=newp;
i_w_3544_newp=0; if hiv=1 and gender=2 and 35 <= age < 45 then i_w_3544_newp=newp;
i_w_4554_newp=0; if hiv=1 and gender=2 and 45 <= age < 55 then i_w_4554_newp=newp;
i_w_5564_newp=0; if hiv=1 and gender=2 and 55 <= age < 65 then i_w_5564_newp=newp;

w_1524_newp=0;if  gender=2 and 15 <= age < 25 then w_1524_newp=newp;
w_2534_newp=0;if  gender=2 and 25 <= age < 35 then w_2534_newp=newp;
w_3544_newp=0;if  gender=2 and 35 <= age < 45 then w_3544_newp=newp;
w_4554_newp=0;if  gender=2 and 45 <= age < 55 then w_4554_newp=newp;
w_5564_newp=0;if  gender=2 and 55 <= age < 65 then w_5564_newp=newp;

m1524_ep1524=0; m2534_ep2534=0; m3544_ep3544=0; m4554_ep4554=0; m5564_ep5564=0;
w1524_ep1524=0; w2534_ep2534=0; w3544_ep3544=0; w4554_ep4554=0; w5564_ep5564=0;

if gender=1 and ep=1 then do;
	if 15 <= age < 25 then do;
		m1524_ep1524=1; 
	end;
	else if 25 <= age < 35 then do;
		m2534_ep2534=1;
	end;
	else if 35 <= age < 45 then do;
		m3544_ep3544=1;
	end;
	else if 45 <= age < 55 then do;
		m4554_ep4554=1;
	end;
	else if 55 <= age < 65 then do;
		m5564_ep5564=1;
	end;
end;
else if gender=2 and ep=1 then do;
	if 15 <= age < 25 then do;
		w1524_ep1524=1;
	end;
	else if 25 <= age < 35 then do;
		w2534_ep2534=1;
	end;
	else if 35 <= age < 45 then do;
		w3544_ep3544=1;
	end;
	else if 45 <= age < 55 then do;
		w4554_ep4554=1;
	end;
	else if 55 <= age < 65 then do;
		w5564_ep5564=1;
	end;
end;


newp_ge1=0;if newp >= 1 then newp_ge1=1; if newp=. then newp_ge1=.;
newp_ge5=0;if newp >= 5 then newp_ge5=1; if newp=. then newp_ge5=.;
newp_ge10=0; if newp >= 10  then newp_ge10=1; if newp=. then newp_ge10=.;
newp_ge50=0; if newp >= 50  then newp_ge50=1; if newp=. then newp_ge50=.;

m1524_newp_ge1=0;m2534_newp_ge1=0;m3544_newp_ge1=0;m4554_newp_ge1=0;m5564_newp_ge1=0; m1549_newp_ge1=0;
m1524_newp_ge5=0;m2534_newp_ge5=0;m3544_newp_ge5=0;m4554_newp_ge5=0;m5564_newp_ge5=0; 
w1524_newp_ge1=0;w2534_newp_ge1=0;w3544_newp_ge1=0;w4554_newp_ge1=0;w5564_newp_ge1=0; w1549_newp_ge1=0;
w1524_newp_ge5=0;w2534_newp_ge5=0;w3544_newp_ge5=0;w4554_newp_ge5=0;w5564_newp_ge5=0; 
if gender=1 then do;
	if newp >= 5 then do;
		if      15 <= age < 25 then m1524_newp_ge5=1; else if 25 <= age < 35 then m2534_newp_ge5=1; else if 35 <= age < 45 then m3544_newp_ge5=1;
		else if 45 <= age < 55 then m4554_newp_ge5=1; else if 55 <= age < 65 then m5564_newp_ge5=1; end;
	if newp >= 1 then do;
		if      15 <= age < 25 then m1524_newp_ge1=1; else if 25 <= age < 35 then m2534_newp_ge1=1; else if 35 <= age < 45 then m3544_newp_ge1=1;
		else if 45 <= age < 55 then m4554_newp_ge1=1; else if 55 <= age < 65 then m5564_newp_ge1=1; end;
	else if newp=. then do;
		if      15 <= age < 25 then m1524_newp_ge1=.; else if 25 <= age < 35 then m2534_newp_ge1=.; else if 35 <= age < 45 then m3544_newp_ge1=.;
		else if 45 <= age < 55 then m4554_newp_ge1=.; else if 55 <= age < 65 then m5564_newp_ge1=.; end;
    if newp >= 1 and 15 <= age < 50 then m1549_newp_ge1=1;
end;
else if gender=2 then do;
	if newp >= 5 then do;
		if      15 <= age < 25 then w1524_newp_ge5=1; else if 25 <= age < 35 then w2534_newp_ge5=1; else if 35 <= age < 45 then w3544_newp_ge5=1;
		else if 45 <= age < 55 then w4554_newp_ge5=1; else if 55 <= age < 65 then w5564_newp_ge5=1; end;
	if newp >= 1 then do;
		if      15 <= age < 25 then w1524_newp_ge1=1; else if 25 <= age < 35 then w2534_newp_ge1=1; else if 35 <= age < 45 then w3544_newp_ge1=1;
		else if 45 <= age < 55 then w4554_newp_ge1=1; else if 55 <= age < 65 then w5564_newp_ge1=1; end;
	else if newp=. then do;
		if      15 <= age < 25 then w1524_newp_ge1=.; else if 25 <= age < 35 then w2534_newp_ge1=.; else if 35 <= age < 45 then w3544_newp_ge1=.;
		else if 45 <= age < 55 then w4554_newp_ge1=.; else if 55 <= age < 65 then w5564_newp_ge1=.; end;
    if newp >= 1 and 15 <= age < 50 then w1549_newp_ge1=1;
end;


nnewp_l4p=0;
nnewp_l4p=(newp+newp_tm1+newp_tm2+newp_tm3);

* ts1m: can define nnewp_l4p last year but note this is not used below, l4p is used;
/*
nnewp_l4p = newp_tm12 + newp_tm11 + newp_tm10 + newp_tm9  + newp_tm8  + newp_tm7  + newp_tm6  + newp_tm5  + newp_tm4  + newp_tm3  + newp_tm2 + 
newp_tm1  + newp ;
*/


conc=0;
if ((ep=1 and newp ge 1) or newp ge 2) or ((ep_tm1=1 and newp_tm1 ge 1) or newp_tm1 ge 2) or 
   ((ep_tm2=1 and newp_tm2 ge 1) or newp_tm2 ge 2) or ((ep_tm3=1 and newp_tm3 ge 1) or newp_tm3 ge 2) then conc=1;
* l4p means last 4 periods - so for 3 month time steps this is last year as before;
npgt1conc_l4p_1524m=0;if gender=1 and 15 <= age < 25 then npgt1conc_l4p_1524m=conc;
npgt1conc_l4p_1524w=0;if gender=2 and 15 <= age < 25 then npgt1conc_l4p_1524w=conc;
npgt1conc_l4p_2549m=0;if gender=1 and 25 <= age <=49 then npgt1conc_l4p_2549m=conc;
npgt1conc_l4p_2549w=0;if gender=2 and 25 <= age <=49 then npgt1conc_l4p_2549w=conc;
npgt1conc_l4p_5064m=0;if gender=1 and 50 <= age < 65 then npgt1conc_l4p_5064m=conc;
npgt1conc_l4p_5064w=0;if gender=2 and 50 <= age < 65 then npgt1conc_l4p_5064w=conc;

npgt1conc_l4p_1519m=0;if gender=1 and 15 <= age < 20 then npgt1conc_l4p_1519m=conc;
npgt1conc_l4p_1519w=0;if gender=2 and 15 <= age < 20 then npgt1conc_l4p_1519w=conc;


***  Number of new partners in the last year. To update table in supplementary material; 
*1>= np;

* l4p means last 4 periods;

npge1_l4p_1564m=0;if gender=1 and 15 <= age < 65 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_1564m=1;
npge1_l4p_1524m=0;if gender=1 and 15 <= age < 25 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_1524m=1;
npge1_l4p_2534m=0;if gender=1 and 25 <= age < 35 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_2534m=1;
npge1_l4p_3544m=0;if gender=1 and 35 <= age < 45 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_3544m=1;
npge1_l4p_4554m=0;if gender=1 and 45 <= age < 55 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_4554m=1;
npge1_l4p_5564m=0;if gender=1 and 55 <= age < 65 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_5564m=1;
npge1_l4p_1564w=0;if gender=2 and 15 <= age < 65 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_1564w=1;
npge1_l4p_1524w=0;if gender=2 and 15 <= age < 25 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_1524w=1;
npge1_l4p_2534w=0;if gender=2 and 25 <= age < 35 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_2534w=1;
npge1_l4p_3544w=0;if gender=2 and 35 <= age < 45 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_3544w=1;
npge1_l4p_4554w=0;if gender=2 and 45 <= age < 55 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_4554w=1;
npge1_l4p_5564w=0;if gender=2 and 55 <= age < 65 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_5564w=1;


*>=2 np;
npge2_l4p_1564m=0;if gender=1 and 15 <= age < 65 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1564m=1;
npge2_l4p_1524m=0;if gender=1 and 15 <= age < 25 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1524m=1;
npge2_l4p_2534m=0;if gender=1 and 25 <= age < 35 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_2534m=1;
npge2_l4p_3544m=0;if gender=1 and 35 <= age < 45 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_3544m=1;
npge2_l4p_4554m=0;if gender=1 and 45 <= age < 55 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_4554m=1;
npge2_l4p_5564m=0;if gender=1 and 55 <= age < 65 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_5564m=1;
npge2_l4p_1564w=0;if gender=2 and 15 <= age < 65 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1564w=1;
npge2_l4p_1524w=0;if gender=2 and 15 <= age < 25 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1524w=1;
npge2_l4p_2534w=0;if gender=2 and 25 <= age < 35 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_2534w=1;
npge2_l4p_3544w=0;if gender=2 and 35 <= age < 45 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_3544w=1;
npge2_l4p_4554w=0;if gender=2 and 45 <= age < 55 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_4554w=1;
npge2_l4p_5564w=0;if gender=2 and 55 <= age < 65 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_5564w=1;


*>=10 np;
npge10_l4p_1564m=0;if gender=1 and 15 <= age < 65 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_1564m=1;
npge10_l4p_1524m=0;if gender=1 and 15 <= age < 25 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_1524m=1;
npge10_l4p_2534m=0;if gender=1 and 25 <= age < 35 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_2534m=1;
npge10_l4p_3544m=0;if gender=1 and 35 <= age < 45 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_3544m=1;
npge10_l4p_4554m=0;if gender=1 and 45 <= age < 55 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_4554m=1;
npge10_l4p_5564m=0;if gender=1 and 55 <= age < 65 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_5564m=1;
npge10_l4p_1564w=0;if gender=2 and 15 <= age < 65 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_1564w=1;
npge10_l4p_1524w=0;if gender=2 and 15 <= age < 25 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_1524w=1;
npge10_l4p_2534w=0;if gender=2 and 25 <= age < 35 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_2534w=1;
npge10_l4p_3544w=0;if gender=2 and 35 <= age < 45 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_3544w=1;
npge10_l4p_4554w=0;if gender=2 and 45 <= age < 55 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_4554w=1;
npge10_l4p_5564w=0;if gender=2 and 55 <= age < 65 and (nnewp_l4p ge 10 or (nnewp_l4p=9 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge10_l4p_5564w=1;


*>=50 np;
npge50_l4p_1564m=0;if gender=1 and 15 <= age < 65 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_1564m=1;
npge50_l4p_1524m=0;if gender=1 and 15 <= age < 25 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_1524m=1;
npge50_l4p_2534m=0;if gender=1 and 25 <= age < 35 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_2534m=1;
npge50_l4p_3544m=0;if gender=1 and 35 <= age < 45 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_3544m=1;
npge50_l4p_4554m=0;if gender=1 and 45 <= age < 55 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_4554m=1;
npge50_l4p_5564m=0;if gender=1 and 55 <= age < 65 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_5564m=1;
npge50_l4p_1564w=0;if gender=2 and 15 <= age < 65 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_1564w=1;
npge50_l4p_1524w=0;if gender=2 and 15 <= age < 25 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_1524w=1;
npge50_l4p_2534w=0;if gender=2 and 25 <= age < 35 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_2534w=1;
npge50_l4p_3544w=0;if gender=2 and 35 <= age < 45 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_3544w=1;
npge50_l4p_4554w=0;if gender=2 and 45 <= age < 55 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_4554w=1;
npge50_l4p_5564w=0;if gender=2 and 55 <= age < 65 and (nnewp_l4p ge 50 or (nnewp_l4p=49 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge50_l4p_5564w=1;

newpge1_l4p_1529m=0;if gender=1 and 15 <= age < 30 and (newp ge 1 or newp_tm1 ge 1 or newp_tm2 ge 1 or newp_tm3 ge 1) then newpge1_l4p_1529m=1;
newpge1_l4p_1529w=0;if gender=2 and 15 <= age < 30 and (newp ge 1 or newp_tm1 ge 1 or newp_tm2 ge 1 or newp_tm3 ge 1) then newpge1_l4p_1529w=1;

npge2_l4p_1844m=0;if gender=1 and 18 <= age < 45 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1844m=1;
npge2_l4p_1844w=0;if gender=2 and 18 <= age < 45 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1844w=1;
npge2_l4p_1549m=0;if gender=1 and 18 <= age < 50 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1549m=1;
npge2_l4p_1549w=0;if gender=2 and 18 <= age < 50 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1549w=1;

newpge1_l4p_1529m=0;if gender=1 and 15 <= age < 30 and (newp ge 1 or newp_tm1 ge 1 or newp_tm2 ge 1 or newp_tm3 ge 1) then newpge1_l4p_1529m=1;
newpge1_l4p_1529w=0;if gender=2 and 15 <= age < 30 and (newp ge 1 or newp_tm1 ge 1 or newp_tm2 ge 1 or newp_tm3 ge 1) then newpge1_l4p_1529w=1;

sw_1564=0;sw_1549=0;sw_1849=0;sw_1519=0;sw_2024=0;sw_2529=0;sw_3039=0;sw_ov40=0;sw_newp=0;sw1524_newp=0;

if gender=2 and sw=1 then do;
	if 15 le age lt 65 then sw_1564=1;
	if 15 le age lt 50 then sw_1549=1;
	if 18 le age lt 50 then sw_1849=1;
	if 15 le age lt 20 then sw_1519=1;
	if 20 le age lt 25 then sw_2024=1;
	if 25 le age lt 30 then sw_2529=1;
	if 30 le age lt 40 then sw_3039=1;
	if 		 age ge 40 then sw_ov40=1;
	sw_newp=newp;
	if 15 le age lt 25 then sw1524_newp=newp;
end;


***For rates;
age_deb_sw1519_=0;age_deb_sw2024_=0;age_deb_sw2529_=0;age_deb_sw3039_=0;age_deb_swov40_=0;
if 15 le age_deb_sw lt 20 then age_deb_sw1519_=1;
if 20 le age_deb_sw lt 25 then age_deb_sw2024_=1;
if 25 le age_deb_sw lt 30 then age_deb_sw2529_=1;
if 30 le age_deb_sw lt 40 then age_deb_sw3039_=1;
if       age_deb_sw ge 40 then age_deb_swov40_=1;

***For proportion starting sw in each age cat;
age_deb_sw_nm1519_=0;age_deb_sw_nm2024_=0;age_deb_sw_nm2529_=0;age_deb_sw_nm3039_=0;age_deb_sw_nmov40_=0;
if sw=1 then do;
if 15 le age_deb_sw_nm lt 20 then age_deb_sw_nm1519_=1;
if 20 le age_deb_sw_nm lt 25 then age_deb_sw_nm2024_=1;
if 25 le age_deb_sw_nm lt 30 then age_deb_sw_nm2529_=1;
if 30 le age_deb_sw_nm lt 40 then age_deb_sw_nm3039_=1;
if       age_deb_sw_nm ge 40 then age_deb_sw_nmov40_=1;
end;

actdur_sw_0to3=0;actdur_sw_3to5=0;actdur_sw_6to9=0;actdur_sw_10to19=0;actdur_sw_ov20=0;
if 0 lt act_dur_sw lt 3 then actdur_sw_0to3=1;
if 3 le act_dur_sw lt 6 then actdur_sw_3to5=1;
if 6 le act_dur_sw lt 10 then actdur_sw_6to9=1;
if 10 le act_dur_sw lt 20 then actdur_sw_10to19=1;
if act_dur_sw ge 20 then actdur_sw_ov20=1;

totdur_sw_0to3=0;totdur_sw_3to5=0;totdur_sw_6to9=0;totdur_sw_10to19=0;totdur_sw_ov20=0;
if 0 lt tot_dur_sw lt 3 then totdur_sw_0to3=1;
if 3 le tot_dur_sw lt 6 then totdur_sw_3to5=1;
if 6 le tot_dur_sw lt 10 then totdur_sw_6to9=1;
if 10 le tot_dur_sw lt 20 then totdur_sw_10to19=1;
if tot_dur_sw ge 20 then totdur_sw_ov20=1;

totdur_eversw_0to3=0;totdur_eversw_3to5=0;totdur_eversw_6to9=0;totdur_eversw_10to19=0;totdur_eversw_ov20=0;
if 0 lt tot_dur_eversw lt 3 then totdur_eversw_0to3=1;
if 3 le tot_dur_eversw lt 6 then totdur_eversw_3to5=1;
if 6 le tot_dur_eversw lt 10 then totdur_eversw_6to9=1;
if 10 le tot_dur_eversw lt 20 then totdur_eversw_10to19=1;
if tot_dur_eversw ge 20 then totdur_eversw_ov20=1;

age_stop_sw1519_=0;age_stop_sw2024_=0;age_stop_sw2529_=0;age_stop_sw3039_=0;age_stop_swov40_=0;
if 15 le age_stop_sw lt 20 then age_stop_sw1519_=1;
if 20 le age_stop_sw lt 25 then age_stop_sw2024_=1;
if 25 le age_stop_sw lt 30 then age_stop_sw2529_=1;
if 30 le age_stop_sw lt 40 then age_stop_sw3039_=1;
if       age_stop_sw ge 40 then age_stop_swov40_=1;



sw_newp_cat=.;
if sw =1 then do;
if newp=0 then sw_newp_cat=1;
if 1 <= newp <= 5 then sw_newp_cat=2;
if 6 <= newp <= 40  then sw_newp_cat=3;
if 41 <= newp <= 100 then sw_newp_cat=4;
if 101 <= newp then sw_newp_cat=5;
end;

sw_newp_cat1=0; if sw_newp_cat=1 then sw_newp_cat1=1;
sw_newp_cat2=0; if sw_newp_cat=2 then sw_newp_cat2=1;
sw_newp_cat3=0; if sw_newp_cat=3 then sw_newp_cat3=1;
sw_newp_cat4=0; if sw_newp_cat=4 then sw_newp_cat4=1;
sw_newp_cat5=0; if sw_newp_cat=5 then sw_newp_cat5=1;


*** % of people with at least 1/2 condomless partners by HIV status for Table K in supplementary material;

npge1_l4p_1564_hivpos=0;if hiv=1 and 15 <= age < 65 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_1564_hivpos=1;
npge2_l4p_1564_hivpos=0;if hiv=1 and 15 <= age < 65 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1564_hivpos=1;

npge1_l4p_1564_hivdiag=0;if hiv=1 and registd=1 and 15 <= age < 65 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_1564_hivdiag=1;
npge2_l4p_1564_hivdiag=0;if hiv=1 and registd=1 and 15 <= age < 65 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1564_hivdiag=1;

npge1_l4p_1564_hivneg=0;if hiv=0 and 15 <= age < 65 and (nnewp_l4p ge 1 or (nnewp_l4p=0 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge1_l4p_1564_hivneg=1;
npge2_l4p_1564_hivneg=0;if hiv=0 and 15 <= age < 65 and (nnewp_l4p ge 2 or (nnewp_l4p=1 and (ep=1 or ep_tm1=1 or ep_tm2=1 or ep_tm3=1))) then npge2_l4p_1564_hivneg=1;

***Survival output for supplementary material;
if infection > . then who4_yn=0; survwho4 = min(who4_date,caldate&j,death)-infection; if survwho4=who4_date-infection then who4_yn=1;
if infection > . then dead_yn=0; survdead = min(death,caldate&j)-infection; if survdead=death-infection then dead_yn=1;

***Survival to date first lost and first returned;
if caldate&j ge yrart > . and date_first_lost_art=. and lost=1 then date_first_lost_art=caldate&j;
if t ge 2 and lost_tm1=1 and lost=0 and caldate&j ge date_first_lost_art > . and date_return_lost_art=. then date_return_lost_art=caldate&j;

* note using competing risks approach here;
surv_dead_lost = min(death,caldate&j)-date_first_lost_art; dead_lost_yn=0; if surv_dead_lost = death-date_first_lost_art > . and date_return_lost_art=. then dead_lost_yn=1;
surv_return_lost = min(caldate&j,date_return_lost_art)-date_first_lost_art; return_lost_yn=0; if surv_return_lost = date_return_lost_art-date_first_lost_art > . 
then return_lost_yn=1;

* date first cd4 < 200;
if date_cd4_l200 = . and . < cd4 < 200 then date_cd4_l200 = caldate&j; 

* time to cd4 increase from ART;
if cd4-cd4art ge 100 and date_cd4_100=. then date_cd4_100=caldate&j;
if cd4-cd4art ge 200 and date_cd4_200=. then date_cd4_200=caldate&j;

* time to first viral failure;
if date_first_vfail =. and onart_gt6m_vlg500=1 then date_first_vfail = caldate&j; 

* this is v failure using underlying VL (v) but assuming only look at VL every year, so more comparable with Fox and other SA data;
if date_first_vfail_annual = . and onart_gt6m_vlg1000=1 and caldate&j-yrart in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) then 
date_first_vfail_annual = caldate&j;

if date_first_vfail_r_onart =. and r_onart_gt6m_vlg1000=1 then date_first_vfail_r_onart = caldate&j; 
if date_first_vfail_1000 =. and onart_gt6m_vlg1000=1 then date_first_vfail_1000 = caldate&j; 

survvfail = min(date_first_vfail,caldate&j,death)-yrart; vfail_yn=0; if survvfail = date_first_vfail-yrart > . then vfail_yn=1;
survvfail_annual = min( date_first_vfail_annual, caldate&j, death)-yrart; vfail_annual_yn=0; if survvfail_annual = date_first_vfail_annual-yrart > . then 
vfail_annual_yn=1;
survvfail_r_onart = min(date_first_vfail_r_onart,caldate&j,death)-yrart; vfail_r_onart_yn=0; if survvfail_r_onart = date_first_vfail_r_onart-yrart > . then vfail_r_onart_yn=1;
survvfail_1000 = min(date_first_vfail_1000,caldate&j,death)-yrart; vfail_1000_yn=0; if survvfail_1000 = date_first_vfail_1000-yrart > . then vfail_1000_yn=1;
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

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 1; if caldate&j = death then art_time_adh_bcd4_dead_g =1; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=1; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 2; if caldate&j = death then art_time_adh_bcd4_dead_g =2; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=2; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 3; if caldate&j = death then art_time_adh_bcd4_dead_g =3; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=3; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 4; if caldate&j = death then art_time_adh_bcd4_dead_g =4; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=4; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 5; if caldate&j = death then art_time_adh_bcd4_dead_g =5; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=5; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 6; if caldate&j = death then art_time_adh_bcd4_dead_g =6; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=6; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 7; if caldate&j = death then art_time_adh_bcd4_dead_g =7; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=7; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 8; if caldate&j = death then art_time_adh_bcd4_dead_g =8; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=8; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 9; if caldate&j = death then art_time_adh_bcd4_dead_g =9; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=9; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 10; if caldate&j = death then art_time_adh_bcd4_dead_g =10; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=10; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 11; if caldate&j = death then art_time_adh_bcd4_dead_g =11; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=11; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 12; if caldate&j = death then art_time_adh_bcd4_dead_g =12; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=12; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 13; if caldate&j = death then art_time_adh_bcd4_dead_g =13; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=13; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 14; if caldate&j = death then art_time_adh_bcd4_dead_g =14; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=14; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 15; if caldate&j = death then art_time_adh_bcd4_dead_g =15; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=15; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 16; if caldate&j = death then art_time_adh_bcd4_dead_g =16; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=16; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 17; if caldate&j = death then art_time_adh_bcd4_dead_g =17; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=17; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 18; if caldate&j = death then art_time_adh_bcd4_dead_g =18; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=18; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 19; if caldate&j = death then art_time_adh_bcd4_dead_g =19; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=19; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 20; if caldate&j = death then art_time_adh_bcd4_dead_g =20; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=20; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 21; if caldate&j = death then art_time_adh_bcd4_dead_g =21; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=21; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 22; if caldate&j = death then art_time_adh_bcd4_dead_g =22; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=22; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 23; if caldate&j = death then art_time_adh_bcd4_dead_g =23; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=23; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 24; if caldate&j = death then art_time_adh_bcd4_dead_g =24; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=24; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 25; if caldate&j = death then art_time_adh_bcd4_dead_g =25; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=25; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 26; if caldate&j = death then art_time_adh_bcd4_dead_g =26; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=26; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 27; if caldate&j = death then art_time_adh_bcd4_dead_g =27; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=27; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 28; if caldate&j = death then art_time_adh_bcd4_dead_g =28; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=28; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 29; if caldate&j = death then art_time_adh_bcd4_dead_g =29; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=29; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 30; if caldate&j = death then art_time_adh_bcd4_dead_g =30; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=30; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 31; if caldate&j = death then art_time_adh_bcd4_dead_g =31; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=31; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 32; if caldate&j = death then art_time_adh_bcd4_dead_g =32; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=32; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 33; if caldate&j = death then art_time_adh_bcd4_dead_g =33; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=33; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 34; if caldate&j = death then art_time_adh_bcd4_dead_g =34; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=34; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and . < adh_in_first_period_onart < 0.5 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 35; if caldate&j = death then art_time_adh_bcd4_dead_g =35; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=35; end;


if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 36; if caldate&j = death then art_time_adh_bcd4_dead_g =36; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=36; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 37; if caldate&j = death then art_time_adh_bcd4_dead_g =37; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=37; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 38; if caldate&j = death then art_time_adh_bcd4_dead_g =38; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=38; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 39; if caldate&j = death then art_time_adh_bcd4_dead_g =39; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=39; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 40; if caldate&j = death then art_time_adh_bcd4_dead_g =40; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=40; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 41; if caldate&j = death then art_time_adh_bcd4_dead_g =41; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=41; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 42; if caldate&j = death then art_time_adh_bcd4_dead_g =42; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=42; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 43; if caldate&j = death then art_time_adh_bcd4_dead_g =43; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=43; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 44; if caldate&j = death then art_time_adh_bcd4_dead_g =44; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=44; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 45; if caldate&j = death then art_time_adh_bcd4_dead_g =45; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=45; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 46; if caldate&j = death then art_time_adh_bcd4_dead_g =46; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=46; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 47; if caldate&j = death then art_time_adh_bcd4_dead_g =47; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=47; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 48; if caldate&j = death then art_time_adh_bcd4_dead_g =48; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=48; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 49; if caldate&j = death then art_time_adh_bcd4_dead_g =49; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=49; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 50; if caldate&j = death then art_time_adh_bcd4_dead_g =50; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=50; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 51; if caldate&j = death then art_time_adh_bcd4_dead_g =51; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=51; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 52; if caldate&j = death then art_time_adh_bcd4_dead_g =52; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=52; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 53; if caldate&j = death then art_time_adh_bcd4_dead_g =53; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=53; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 54; if caldate&j = death then art_time_adh_bcd4_dead_g =54; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=54; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 55; if caldate&j = death then art_time_adh_bcd4_dead_g =55; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=55; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 56; if caldate&j = death then art_time_adh_bcd4_dead_g =56; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=56; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 57; if caldate&j = death then art_time_adh_bcd4_dead_g =57; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=57; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 58; if caldate&j = death then art_time_adh_bcd4_dead_g =58; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=58; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 59; if caldate&j = death then art_time_adh_bcd4_dead_g =59; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=59; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 60; if caldate&j = death then art_time_adh_bcd4_dead_g =60; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=60; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 61; if caldate&j = death then art_time_adh_bcd4_dead_g =61; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=61; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 61; if caldate&j = death then art_time_adh_bcd4_dead_g =62; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=62; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 63; if caldate&j = death then art_time_adh_bcd4_dead_g =63; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=63; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 64; if caldate&j = death then art_time_adh_bcd4_dead_g =64; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=64; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 65; if caldate&j = death then art_time_adh_bcd4_dead_g =65; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=65; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 66; if caldate&j = death then art_time_adh_bcd4_dead_g =66; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=66; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 67; if caldate&j = death then art_time_adh_bcd4_dead_g =67; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=67; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 68; if caldate&j = death then art_time_adh_bcd4_dead_g =68; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=68; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 69; if caldate&j = death then art_time_adh_bcd4_dead_g =69; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=69; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.5 <= adh_in_first_period_onart < 0.8 and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 70; if caldate&j = death then art_time_adh_bcd4_dead_g =70; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=70; end;


if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 71; if caldate&j = death then art_time_adh_bcd4_dead_g =71; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=71; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 72; if caldate&j = death then art_time_adh_bcd4_dead_g =72; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=72; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 73; if caldate&j = death then art_time_adh_bcd4_dead_g =73; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=73; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 74; if caldate&j = death then art_time_adh_bcd4_dead_g =74; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=74; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 75; if caldate&j = death then art_time_adh_bcd4_dead_g =75; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=75; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 76; if caldate&j = death then art_time_adh_bcd4_dead_g =76; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=76; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and . < cd4art < 100 then do; 
art_time_adh_bcd4_g = 77; if caldate&j = death then art_time_adh_bcd4_dead_g =77; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=77; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 78; if caldate&j = death then art_time_adh_bcd4_dead_g =78; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=78; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 79; if caldate&j = death then art_time_adh_bcd4_dead_g =79; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=79; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 80; if caldate&j = death then art_time_adh_bcd4_dead_g =80; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=80; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 81; if caldate&j = death then art_time_adh_bcd4_dead_g =81; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=81; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 82; if caldate&j = death then art_time_adh_bcd4_dead_g =82; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=82; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 83; if caldate&j = death then art_time_adh_bcd4_dead_g =83; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=83; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 100 <= cd4art < 200 then do; 
art_time_adh_bcd4_g = 84; if caldate&j = death then art_time_adh_bcd4_dead_g =84; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=84; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 85; if caldate&j = death then art_time_adh_bcd4_dead_g =85; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=85; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 86; if caldate&j = death then art_time_adh_bcd4_dead_g =86; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=86; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 87; if caldate&j = death then art_time_adh_bcd4_dead_g =87; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=87; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 88; if caldate&j = death then art_time_adh_bcd4_dead_g =88; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=88; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 89; if caldate&j = death then art_time_adh_bcd4_dead_g =89; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=89; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 90; if caldate&j = death then art_time_adh_bcd4_dead_g =90; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=90; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 200 <= cd4art < 350 then do; 
art_time_adh_bcd4_g = 91; if caldate&j = death then art_time_adh_bcd4_dead_g =91; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=91; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 92; if caldate&j = death then art_time_adh_bcd4_dead_g =92; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=92; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 93; if caldate&j = death then art_time_adh_bcd4_dead_g =93; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=93; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 94; if caldate&j = death then art_time_adh_bcd4_dead_g =94; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=94; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 95; if caldate&j = death then art_time_adh_bcd4_dead_g =95; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=95; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 96; if caldate&j = death then art_time_adh_bcd4_dead_g =96; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=96; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 97; if caldate&j = death then art_time_adh_bcd4_dead_g =97; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=97; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 350 <= cd4art < 500 then do; 
art_time_adh_bcd4_g = 98; if caldate&j = death then art_time_adh_bcd4_dead_g =98; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=98; end;

if caldate&j - yrart = 0.25 and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 99; if caldate&j = death then art_time_adh_bcd4_dead_g =99; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=99; end;
if caldate&j - yrart = 0.5  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 100; if caldate&j = death then art_time_adh_bcd4_dead_g =100; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=100; end;
if 0.75 <= caldate&j - yrart <= 1  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 101; if caldate&j = death then art_time_adh_bcd4_dead_g =101; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=101; end;
if 1.25 <= caldate&j - yrart <= 2   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 102; if caldate&j = death then art_time_adh_bcd4_dead_g =102; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=102; end;
if 2.25 <= caldate&j - yrart <= 3   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 103; if caldate&j = death then art_time_adh_bcd4_dead_g =103; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=103; end;
if 3.25 <= caldate&j - yrart <= 5   and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
art_time_adh_bcd4_g = 104; if caldate&j = death then art_time_adh_bcd4_dead_g =104; if caldate&j = death and dcause=1 then art_time_adh_bcd4_adead_g=104; end;
if 5.25 <= caldate&j - yrart <= 10  and (onart=1 or int_clinic_not_aw =1) and 0.8 <= adh_in_first_period_onart  and 500 <= cd4art  then do; 
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


if (onart=1 or int_clinic_not_aw=1) then do;

	* proportion of time with nactive < 3 for 1st line drugs in which linefail still 0 ;
	if date_res_1stline=. and linefail=0 and . < nactive < 3 then date_res_1stline=caldate&j;
	onart_res_1stline =0; onart_res_1stline_linefail0=0; if caldate&j ge date_res_1stline > . then do; onart_res_1stline =1; if linefail=0 then onart_res_1stline_linefail0=1;  end;
	* proportion with resistance by viral load level;
	onart_vlg1 = 0; onart_vlg1_r = 0; if vlg1=1 then do; onart_vlg1 =1; if . < nactive < 3 then onart_vlg1_r = 1; ; end;
	onart_vlg2 = 0; onart_vlg2_r = 0; if vlg2=1 then do; onart_vlg2 =1; if . < nactive < 3 then onart_vlg2_r = 1; ; end;
	onart_vlg3 = 0; onart_vlg3_r = 0; if vlg3=1 then do; onart_vlg3 =1; if . < nactive < 3 then onart_vlg3_r = 1; ; end;
	onart_vlg4 = 0; onart_vlg4_r = 0; if vlg4=1 then do; onart_vlg4 =1; if . < nactive < 3 then onart_vlg4_r = 1; ; end;
	onart_vlg5 = 0; onart_vlg5_r = 0; if vlg5=1 then do; onart_vlg5 =1; if . < nactive < 3 then onart_vlg5_r = 1; ; end;
	* proportion of people with new WHO within 1 year of ART who have VL < 1000, same for 1-3 years, > 3 years;
	onart_who4_year1=0; onart_who4_year1_vlt1000=0; if 0 <= caldate&j - yrart <= 1 and adc=1 then do; onart_who4_year1=1; if . < vl < 3 then onart_who4_year1_vlt1000=1;  end;
	onart_who4_year3=0; onart_who4_year3_vlt1000=0; if 0 <= caldate&j - yrart <= 3 and adc=1 then do; onart_who4_year3=1; if . < vl < 3 then onart_who4_year3_vlt1000=1;  end;
	* proportion of people with CD4 < 200 within 1 year of ART who have VL < 1000, same for 1-3 years, > 3 years;
	onart_cd4l200_year1=0; onart_cd4l200_year1_vlt1000=0; if 0 <= caldate&j - yrart <= 1 and . < cd4 < 200 then do; onart_cd4l200_year1=1; if . < vl < 3 then onart_cd4l200_year1_vlt1000=1;  end;
	onart_cd4l200_year3=0; onart_cd4l200_year3_vlt1000=0; if 0 <= caldate&j - yrart <= 3 and . < cd4 < 200 then do; onart_cd4l200_year3=1; if . < vl < 3 then onart_cd4l200_year3_vlt1000=1;  end;
	* time spent with CD4 < 200 / < 50 (with linefail=0 and overall on art);
	onart_linefail0 = 0; onart_linefail0_cl200=0; if linefail=0 then do; onart_linefail0 = 1;  if . < cd4 < 200 then onart_linefail0_cl200=1; end;
	onart_cl200=0; if . < cd4 < 200 then onart_cl200=1; 
	onart_linefail0 = 0; onart_linefail0_cl50=0; if linefail=0 then do; onart_linefail0 = 1;  if . < cd4 < 50 then onart_linefail0_cl50=1; end;
	onart_cl50=0; if . < cd4 < 50 then onart_cl50=1; 
	* time spent with VL > 1000 (with linefail=0 and overall on art);
	onart_linefail0_vg1000=0; if linefail=0 and vl >= 3 then onart_linefail0_vg1000=1; 
	onart_vg1000=0; if vl >= 3 then onart_vg1000=1; 
	* time spent with VL > 1000 and resistance (with linefail=0 and overall on art);
	onart_linefail0_vg1000_r=0; if linefail=0 and caldate&j ge date_res_1stline > . and vl >= 3 then onart_linefail0_vg1000_r=1; 
	onart_vg1000_r=0; if vl >= 3 and caldate&j ge date_res_1stline > . then onart_vg1000_r=1; 
	onart_cl350=0; if cl350 = 1 then onart_cl350 = 1;

end;

*** Attrition;
art_attrit_1yr = 0; art_attrit_1yr_on = 0;  if caldate_never_dot - yrart = 1 then do; art_attrit_1yr = 1; if onart=1 or int_clinic_not_aw=1 then art_attrit_1yr_on = 1;  end;
art_attrit_2yr = 0; art_attrit_2yr_on = 0;  if caldate_never_dot - yrart = 2 then do; art_attrit_2yr = 1; if onart=1 or int_clinic_not_aw=1 then art_attrit_2yr_on = 1;  end;
art_attrit_3yr = 0; art_attrit_3yr_on = 0;  if caldate_never_dot - yrart = 3 then do; art_attrit_3yr = 1; if onart=1 or int_clinic_not_aw=1 then art_attrit_3yr_on = 1;  end;
art_attrit_4yr = 0; art_attrit_4yr_on = 0;  if caldate_never_dot - yrart = 4 then do; art_attrit_4yr = 1; if onart=1 or int_clinic_not_aw=1 then art_attrit_4yr_on = 1;  end;
art_attrit_5yr = 0; art_attrit_5yr_on = 0;  if caldate_never_dot - yrart = 5 then do; art_attrit_5yr = 1; if onart=1 or int_clinic_not_aw=1 then art_attrit_5yr_on = 1;  end;
art_attrit_6yr = 0; art_attrit_6yr_on = 0;  if caldate_never_dot - yrart = 6 then do; art_attrit_6yr = 1; if onart=1 or int_clinic_not_aw=1 then art_attrit_6yr_on = 1;  end;
art_attrit_7yr = 0; art_attrit_7yr_on = 0;  if caldate_never_dot - yrart = 7 then do; art_attrit_7yr = 1; if onart=1 or int_clinic_not_aw=1 then art_attrit_7yr_on = 1;  end;
art_attrit_8yr = 0; art_attrit_8yr_on = 0;  if caldate_never_dot - yrart = 8 then do; art_attrit_8yr = 1; if onart=1 or int_clinic_not_aw=1 then art_attrit_8yr_on = 1;  end;

linked_to_care_this_period=.; if caldate&j = date_linked_to_care > . then linked_to_care_this_period=1;


*** Dead within 6 months of starting ART;
art_dur_l6m_dead=.;  art_dur_g6m_dead=.;  art_dur_l6m=.;    art_dur_g6m=.;   
art_tdur_l6m_dead=.;  art_tdur_g6m_dead=.;  art_tdur_l6m=.;    art_tdur_g6m=.; 

if (onart=1 or int_clinic_not_aw=1) then do;

if caldate&j = death > . and hiv=1 and rdcause=1 then do;
if . < caldate&j-yrart <= 0.5 then art_tdur_l6m_dead=1;
if 0.5 < caldate&j-yrart then art_tdur_g6m_dead=1;
end;

if . < caldate&j-yrart <= 0.5 then art_tdur_l6m=1;
if 0.5 < caldate&j-yrart then art_tdur_g6m=1;

if caldate&j = death > . and hiv=1  and rdcause=1 then do;
if . < tcur <= 0.5 then art_dur_l6m_dead=1;
if 0.5 < tcur then art_dur_g6m_dead=1;
end;

if . < tcur <= 0.5 then art_dur_l6m=1;
if 0.5 < tcur then art_dur_g6m=1;

if tcur=. then do; art_dur_l6m_dead=art_tdur_l6m_dead; art_dur_g6m_dead=art_tdur_g6m_dead; 
art_dur_l6m=art_tdur_l6m; art_dur_g6m=art_tdur_g6m;  end;

end;


*** Total circumcisions and new circumcisions;
mcirc_1014m=0;new_mcirc_1014m=0;vmmc1014m=0;new_vmmc1014m=0;if gender=1 and 10 le age lt 15 then do; mcirc_1014m=mcirc; new_mcirc_1014m=new_mcirc; new_vmmc1014m=new_vmmc; vmmc1014m=vmmc; end;

mcirc_1519m=0;new_mcirc_1519m=0;vmmc1519m=0;new_vmmc1519m=0;if gender=1 and 15 le age lt 20 then do; mcirc_1519m=mcirc; new_mcirc_1519m=new_mcirc; new_vmmc1519m=new_vmmc; vmmc1519m=vmmc; end;
mcirc_2024m=0;new_mcirc_2024m=0;vmmc2024m=0;new_vmmc2024m=0;if gender=1 and 20 le age lt 25 then do; mcirc_2024m=mcirc; new_mcirc_2024m=new_mcirc; new_vmmc2024m=new_vmmc; vmmc2024m=vmmc; end;
mcirc_2529m=0;new_mcirc_2529m=0;vmmc2529m=0;new_vmmc2529m=0;if gender=1 and 25 le age lt 30 then do; mcirc_2529m=mcirc; new_mcirc_2529m=new_mcirc; new_vmmc2529m=new_vmmc; vmmc2529m=vmmc; end;
mcirc_3034m=0;new_mcirc_3034m=0;vmmc3034m=0;new_vmmc3034m=0;if gender=1 and 30 le age lt 35 then do; mcirc_3034m=mcirc; new_mcirc_3034m=new_mcirc; new_vmmc3034m=new_vmmc; vmmc3034m=vmmc; end;
mcirc_3539m=0;new_mcirc_3539m=0;vmmc3539m=0;new_vmmc3539m=0;if gender=1 and 35 le age lt 40 then do; mcirc_3539m=mcirc; new_mcirc_3539m=new_mcirc; new_vmmc3539m=new_vmmc; vmmc3539m=vmmc; end;
mcirc_4044m=0;new_mcirc_4044m=0;vmmc4044m=0;new_vmmc4044m=0;if gender=1 and 40 le age lt 45 then do; mcirc_4044m=mcirc; new_mcirc_4044m=new_mcirc; new_vmmc4044m=new_vmmc; vmmc4044m=vmmc; end;
mcirc_4549m=0;new_mcirc_4549m=0;vmmc4549m=0;new_vmmc4549m=0;if gender=1 and 45 le age lt 50 then do; mcirc_4549m=mcirc; new_mcirc_4549m=new_mcirc; new_vmmc4549m=new_vmmc; vmmc4549m=vmmc; end;
mcirc_50plm=0;new_mcirc_50plm=0;vmmc50plm=0;new_vmmc50plm=0;if gender=1 and       age ge 50 then do; mcirc_50plm=mcirc; new_mcirc_50plm=new_mcirc; new_vmmc50plm=new_vmmc; vmmc50plm=vmmc; end;
mcirc_5054m=0;new_mcirc_5054m=0;vmmc5054m=0;new_vmmc5054m=0;if gender=1 and 50 le age lt 55 then do; mcirc_5054m=mcirc; new_mcirc_5054m=new_mcirc; new_vmmc5054m=new_vmmc; vmmc5054m=vmmc; end;
mcirc_5559m=0;new_mcirc_5559m=0;vmmc5559m=0;new_vmmc5559m=0;if gender=1 and 55 le age lt 60 then do; mcirc_5559m=mcirc; new_mcirc_5559m=new_mcirc; new_vmmc5559m=new_vmmc; vmmc5559m=vmmc; end;
mcirc_6064m=0;new_mcirc_6064m=0;vmmc6064m=0;new_vmmc6064m=0;if gender=1 and 60 le age lt 65 then do; mcirc_6064m=mcirc; new_mcirc_6064m=new_mcirc; new_vmmc6064m=new_vmmc; vmmc6064m=vmmc; end;
mcirc_6569m=0;new_mcirc_6569m=0;vmmc6569m=0;new_vmmc6569m=0;if gender=1 and 65 le age lt 70 then do; mcirc_6569m=mcirc; new_mcirc_6569m=new_mcirc; new_vmmc6569m=new_vmmc; vmmc6569m=vmmc; end;
mcirc_7074m=0;new_mcirc_7074m=0;vmmc7074m=0;new_vmmc7074m=0;if gender=1 and 70 le age lt 75 then do; mcirc_7074m=mcirc; new_mcirc_7074m=new_mcirc; new_vmmc7074m=new_vmmc; vmmc7074m=vmmc; end;
mcirc_7579m=0;new_mcirc_7579m=0;vmmc7579m=0;new_vmmc7579m=0;if gender=1 and 75 le age lt 80 then do; mcirc_7579m=mcirc; new_mcirc_7579m=new_mcirc; new_vmmc7579m=new_vmmc; vmmc7579m=vmmc; end;
mcirc_8084m=0;new_mcirc_8084m=0;vmmc8084m=0;new_vmmc8084m=0;if gender=1 and 80 le age lt 85 then do; mcirc_8084m=mcirc; new_mcirc_8084m=new_mcirc; new_vmmc8084m=new_vmmc; vmmc8084m=vmmc; end;
mcirc_85plm=0;new_mcirc_85plm=0;vmmc85plm=0;new_vmmc85plm=0;if gender=1 and 85 le age       then do; mcirc_85plm=mcirc; new_mcirc_85plm=new_mcirc; new_vmmc85plm=new_vmmc; vmmc85plm=vmmc; end;


* uncertain about this code here below - currently setting all variables to . so they do not come up as errors in proc univariate;

new_1519sw=.;new_2024sw=.;new_2529sw=.;new_3039sw=.;new_ge40sw=.;tot_newp=.;newp_p3m=.;years_ep=.;ever_ep=.;p_ep_py=.;act_years_sw=.;

/*
new_1519sw=.;new_2024sw=.;new_2529sw=.;new_3039sw=.;new_ge40sw=.;
if 15 le age le 65 then do;
	tot_newp = tot_newp + newp;
	newp_p3m = tot_newp /((age-15)/4);

	years_ep = years_ep + (ep/4);
	if ep=1 then do;ever_ep=1; p_ep_py = (years_ep)/(age-15);end;

	if t ge 2 and gender=2 and sw=1 and sw_tm2 ne 1 then do;
			if 15 le age lt 20 then new_1519sw = 1;
			if 20 le age lt 25 then new_2024sw = 1;
			if 25 le age lt 30 then new_2529sw = 1;
			if 30 le age lt 40 then new_3039sw = 1;
			if       age ge 40 then new_ge40sw = 1;
		act_years_sw = act_years_sw + 0.25;
	end;
end;
*/

primary_sw=0;   	if sw=1   		and primary=1 then primary_sw=1;
primary_sw1519_=0;  if sw_1519=1    and primary=1 then primary_sw1519_=1;
primary_sw2024_=0;  if sw_2024=1    and primary=1 then primary_sw2024_=1;
primary_sw2529_=0;  if sw_2529=1    and primary=1 then primary_sw2529_=1;
primary_sw3039_=0;  if sw_3039=1    and primary=1 then primary_sw3039_=1;

sw_vg1000=0;if sw=1                 and vl > 3.0 then sw_vg1000=1;


***People with long term partners;
ep_m  =0; if gender=1 and ep=1 then ep_m  =1;
ep_w  =0; if gender=2 and ep=1 then ep_w  =1;

m_1524_ep=0;if  gender=1 and 15 <= age < 25 then m_1524_ep=ep;
m_2534_ep=0;if  gender=1 and 25 <= age < 35 then m_2534_ep=ep;
m_3544_ep=0;if  gender=1 and 35 <= age < 45 then m_3544_ep=ep;
m_4554_ep=0;if  gender=1 and 45 <= age < 55 then m_4554_ep=ep;
m_5564_ep=0;if  gender=1 and 55 <= age < 65 then m_5564_ep=ep;

w_1524_ep=0;if  gender=2 and 15 <= age < 25 then w_1524_ep=ep;
w_2534_ep=0;if  gender=2 and 25 <= age < 35 then w_2534_ep=ep;
w_3544_ep=0;if  gender=2 and 35 <= age < 45 then w_3544_ep=ep;
w_4554_ep=0;if  gender=2 and 45 <= age < 55 then w_4554_ep=ep;
w_5564_ep=0;if  gender=2 and 55 <= age < 65 then w_5564_ep=ep;


***People with long term partners and newp;
m_1524_epnewp=0;if  gender=1 and 15 <= age < 25 and ep=1 and newp ge 1 then m_1524_epnewp=1;
m_2534_epnewp=0;if  gender=1 and 25 <= age < 35 and ep=1 and newp ge 1 then m_2534_epnewp=1;
m_3544_epnewp=0;if  gender=1 and 35 <= age < 45 and ep=1 and newp ge 1 then m_3544_epnewp=1;
m_4554_epnewp=0;if  gender=1 and 45 <= age < 55 and ep=1 and newp ge 1 then m_4554_epnewp=1;
m_5564_epnewp=0;if  gender=1 and 55 <= age < 65 and ep=1 and newp ge 1 then m_5564_epnewp=1;

w_1524_epnewp=0;if  gender=2 and 15 <= age < 25 and ep=1 and newp ge 1 then w_1524_epnewp=1;
w_2534_epnewp=0;if  gender=2 and 25 <= age < 35 and ep=1 and newp ge 1 then w_2534_epnewp=1;
w_3544_epnewp=0;if  gender=2 and 35 <= age < 45 and ep=1 and newp ge 1 then w_3544_epnewp=1;
w_4554_epnewp=0;if  gender=2 and 45 <= age < 55 and ep=1 and newp ge 1 then w_4554_epnewp=1;
w_5564_epnewp=0;if  gender=2 and 55 <= age < 65 and ep=1 and newp ge 1 then w_5564_epnewp=1;


***For each man, whether they have had 1, 2 or 5 newp in their lifetime (but note this is newp since 1989 only)
   To try to understand % of men who had FSW partnership;
m_1524_ge1newpever=0;m_2534_ge1newpever=0;m_3544_ge1newpever=0;m_4554_ge1newpever=0;m_5564_ge1newpever=0;
m_1524_ge2newpever=0;m_2534_ge2newpever=0;m_3544_ge2newpever=0;m_4554_ge2newpever=0;m_5564_ge2newpever=0;
m_1524_ge5newpever=0;m_2534_ge5newpever=0;m_3544_ge5newpever=0;m_4554_ge5newpever=0;m_5564_ge5newpever=0;
w_ge1newpever=0;w_ge2newpever=0;w_ge5newpever=0;
if gender=1 then do;
	if 15 <= age < 25 and newp_ever ge 1 then m_1524_ge1newpever=1; 
	if 25 <= age < 35 and newp_ever ge 1 then m_2534_ge1newpever=1; 
	if 35 <= age < 45 and newp_ever ge 1 then m_3544_ge1newpever=1; 
	if 45 <= age < 55 and newp_ever ge 1 then m_4554_ge1newpever=1; 
	if 55 <= age < 65 and newp_ever ge 1 then m_5564_ge1newpever=1; 

	if 15 <= age < 25 and newp_ever ge 2 then m_1524_ge2newpever=1; 
	if 25 <= age < 35 and newp_ever ge 2 then m_2534_ge2newpever=1; 
	if 35 <= age < 45 and newp_ever ge 2 then m_3544_ge2newpever=1; 
	if 45 <= age < 55 and newp_ever ge 2 then m_4554_ge2newpever=1; 
	if 55 <= age < 65 and newp_ever ge 2 then m_5564_ge2newpever=1; 

	if 15 <= age < 25 and newp_ever ge 5 then m_1524_ge5newpever=1; 
	if 25 <= age < 35 and newp_ever ge 5 then m_2534_ge5newpever=1; 
	if 35 <= age < 45 and newp_ever ge 5 then m_3544_ge5newpever=1; 
	if 45 <= age < 55 and newp_ever ge 5 then m_4554_ge5newpever=1; 
	if 55 <= age < 65 and newp_ever ge 5 then m_5564_ge5newpever=1; 
end;
if gender=2 then do;
	if newp_ever ge 1 then w_ge1newpever=1; 
	if newp_ever ge 2 then w_ge2newpever=1; 
	if newp_ever ge 5 then w_ge5newpever=1; 
end;


* People with hiv aged 15-65;
hiv1564=hiv; if age >= 65 then hiv1564=.;
hiv1549=0; if hiv=1 and 15 <= age < 50 then hiv1549=1;

hiv1517m=0; if hiv=1 and gender=1 and 15 <= age < 18 then hiv1517m=1;
hiv1819m=0; if hiv=1 and gender=1 and 18 <= age < 20 then hiv1819m=1;
hiv1519m=0; if hiv=1 and gender=1 and 15 <= age < 20 then hiv1519m=1;
hiv2024m=0; if hiv=1 and gender=1 and 20 <= age < 25 then hiv2024m=1;
hiv2529m=0; if hiv=1 and gender=1 and 25 <= age < 30 then hiv2529m=1;
hiv3034m=0; if hiv=1 and gender=1 and 30 <= age < 35 then hiv3034m=1;
hiv3539m=0; if hiv=1 and gender=1 and 35 <= age < 40 then hiv3539m=1;
hiv4044m=0; if hiv=1 and gender=1 and 40 <= age < 45 then hiv4044m=1;
hiv4549m=0; if hiv=1 and gender=1 and 45 <= age < 50 then hiv4549m=1;
hiv5054m=0; if hiv=1 and gender=1 and 50 <= age < 55 then hiv5054m=1;
hiv5559m=0; if hiv=1 and gender=1 and 55 <= age < 60 then hiv5559m=1;
hiv6064m=0; if hiv=1 and gender=1 and 60 <= age < 65 then hiv6064m=1;
hiv6569m=0; if hiv=1 and gender=1 and 65 <= age < 70 then hiv6569m=1;
hiv7074m=0; if hiv=1 and gender=1 and 70 <= age < 75 then hiv7074m=1;
hiv7579m=0; if hiv=1 and gender=1 and 75 <= age < 80 then hiv7579m=1;
hiv8084m=0; if hiv=1 and gender=1 and 80 <= age < 85 then hiv8084m=1;
hiv85plm=0; if hiv=1 and gender=1 and 85 <= age      then hiv85plm=1;

hiv1564m=0; if hiv=1 and gender=1 and 15 <= age < 65 then hiv1564m=1;
hiv1549m=0; if hiv=1 and gender=1 and 15 <= age < 50 then hiv1549m=1;

hiv1517w=0; if hiv=1 and gender=2 and 15 <= age < 18 then hiv1517w=1;
hiv1819w=0; if hiv=1 and gender=2 and 18 <= age < 20 then hiv1819w=1;
hiv1519w=0; if hiv=1 and gender=2 and 15 <= age < 20 then hiv1519w=1;
hiv2024w=0; if hiv=1 and gender=2 and 20 <= age < 25 then hiv2024w=1;
hiv2529w=0; if hiv=1 and gender=2 and 25 <= age < 30 then hiv2529w=1;
hiv3034w=0; if hiv=1 and gender=2 and 30 <= age < 35 then hiv3034w=1;
hiv3539w=0; if hiv=1 and gender=2 and 35 <= age < 40 then hiv3539w=1;
hiv4044w=0; if hiv=1 and gender=2 and 40 <= age < 45 then hiv4044w=1;
hiv4549w=0; if hiv=1 and gender=2 and 45 <= age < 50 then hiv4549w=1;
hiv5054w=0; if hiv=1 and gender=2 and 50 <= age < 55 then hiv5054w=1;
hiv5559w=0; if hiv=1 and gender=2 and 55 <= age < 60 then hiv5559w=1;
hiv6064w=0; if hiv=1 and gender=2 and 60 <= age < 65 then hiv6064w=1;
hiv6569w=0; if hiv=1 and gender=2 and 65 <= age < 70 then hiv6569w=1;
hiv7074w=0; if hiv=1 and gender=2 and 70 <= age < 75 then hiv7074w=1;
hiv7579w=0; if hiv=1 and gender=2 and 75 <= age < 80 then hiv7579w=1;
hiv8084w=0; if hiv=1 and gender=2 and 80 <= age < 85 then hiv8084w=1;
hiv85plw=0; if hiv=1 and gender=2 and 85 <= age      then hiv85plw=1;

hiv1564w=0; if hiv=1 and gender=2 and 15 <= age < 65 then hiv1564w=1;
hiv1549w=0; if hiv=1 and gender=2 and 15 <= age < 50 then hiv1549w=1;


***HIV amongst FSW;
hiv_sw=0;hiv_sw1849_=0;hiv_sw1549_=0;hiv_sw1519_=0;hiv_sw2024_=0;hiv_sw2529_=0;hiv_sw3039_=0;hiv_swov40_=0;

if hiv=1 and sw=1 then do;
	hiv_sw=1;
	if 18 le age lt 50 then hiv_sw1849_=1;
	if 15 le age lt 50 then hiv_sw1549_=1;
	if 15 le age lt 20 then hiv_sw1519_=1;
	if 20 le age lt 25 then hiv_sw2024_=1;	
	if 25 le age lt 30 then hiv_sw2529_=1;
	if 30 le age lt 40 then hiv_sw3039_=1;
	if 		 age ge 40 then hiv_swov40_=1;
end;


i_ep=0;diag_ep=0; 
if hiv1564=1 then i_ep=ep;
if registd=1  then diag_ep=ep;

diag_epun=0;if registd=1 and ep=1 and epdiag ne 1 then diag_epun=ep;


***HIV specific outputs;
vl50=.; vg50=.; vl200=.; vg200=.; vl1000= .; vg1000=.; vg1000_m=.; vg1000_w=.; vg1000_m_1524=.;vg1000_w_1524=.;
ever_ep_hiv=.;ever_ep_diag=.;ever_newp_hiv=.;ever_newp_diag=.;
ever_sw_hiv=.;ever_sw_diag=.;
dead1564_=.;dead_diag=.;

if hiv =1 then do;

	newp_hiv=newp;
	newp_ge1_hiv=0; if newp >= 1 then newp_ge1_hiv=1; if newp=. then newp_ge1_hiv=.;
	if registd=1 then do;
		newp_ge1_hiv_diag=0; if newp >= 1 then newp_ge1_hiv_diag=1; if newp=. then newp_ge1_hiv_diag=.;
	end;

	ever_ep_hiv = ever_ep;
	if registd=1 then ever_ep_diag=ever_ep;

	ever_newp_hiv = ever_newp;
	if registd=1 then ever_newp_diag=ever_newp;

	ever_sw_hiv = ever_sw;
	if registd=1 then ever_sw_diag=ever_sw;

	if . < vl < 1.7 then vl50=1; else vl50=0;
	vg50=1-vl50;
	if . < vl < 2.3 then vl200=1; else vl200=0;
	vg200=1-vl200;
	if . < vl < 3.0 then vl1000=1; else vl1000=0;
	vg1000=1-vl1000;

	if gender = 1 then do;
	vl1000_m=vl1000;
	vg1000_m=0; if vg1000 = 1 then  vg1000_m = vg1000;
	if 15 <= age < 25 then do; vg1000_m_1524=0; if vg1000 = 1 then vg1000_m_1524=1 ;  end ;
	end;

	if gender = 2 then do;
	vl1000_w=vl1000;
	vg1000_w=0;	if vg1000 = 1 then  vg1000_w = vg1000;
	if 15 <= age < 25 then do; vg1000_w_1524=0; if vg1000 = 1 then vg1000_w_1524=1 ;  end ;
	end;


* two variables indicate vl < 500: vlg1 indexes infectivity and viral load is increased by 0.5 log when
sti present, vl500 takes the vl as it is;

* increase viral load temporarily if sti;	
	if sti=1 then vl = vl + 0.5;

* consider primary infection length  * dependent_on_time_step_length ;
	if   . <  vl < 2.7 and primary=0  then vlg1=1;else vlg1=0;
	if 2.7 <= vl < 3.7 and primary=0  then vlg2=1;else vlg2=0;
	if 3.7 <= vl < 4.7 and primary=0  then vlg3=1;else vlg3=0;
	if 4.7 <= vl < 5.7 and primary=0  then vlg4=1;else vlg4=0;
	if 5.7 <= vl 		and primary=0  then vlg5=1;else vlg5=0;
	if 						primary=1  then vlg6=1;else vlg6=0;

***Used to calculate the viral load distribution of people during new partnerships (ep+newp);

i_v1_np=0; i_v2_np=0; i_v3_np=0; i_v4_np=0; i_v5_np=0; i_v6_np=0; 
i_v1_ep=0; i_v2_ep=0; i_v3_ep=0; i_v4_ep=0; i_v5_ep=0; i_v6_ep=0; 
i_v1_newp=0; i_v2_newp=0; i_v3_newp=0; i_v4_newp=0; i_v5_newp=0; i_v6_newp=0; 


i_vl1000_m_np=np=0; i_v11000_m_ep=0; i_vl1000_m_newp=0;i_vl1000_w_np=np=0; i_v11000_w_ep=0; i_vl1000_w_newp=0;

i_v1_age1_m_np=0; i_v1_age1_m_ep=0; i_v1_age1_m_newp=0;i_v1_age1_w_np=0; i_v1_age1_w_ep=0; i_v1_age1_w_newp=0;
i_v2_age1_m_np=0; i_v2_age1_m_ep=0; i_v2_age1_m_newp=0;i_v2_age1_w_np=0; i_v2_age1_w_ep=0; i_v2_age1_w_newp=0;
i_v3_age1_m_np=0; i_v3_age1_m_ep=0; i_v3_age1_m_newp=0;i_v3_age1_w_np=0; i_v3_age1_w_ep=0; i_v3_age1_w_newp=0;
i_v4_age1_m_np=0; i_v4_age1_m_ep=0; i_v4_age1_m_newp=0;i_v4_age1_w_np=0; i_v4_age1_w_ep=0; i_v4_age1_w_newp=0;
i_v5_age1_m_np=0; i_v5_age1_m_ep=0; i_v5_age1_m_newp=0;i_v5_age1_w_np=0; i_v5_age1_w_ep=0; i_v5_age1_w_newp=0;
i_v6_age1_m_np=0; i_v6_age1_m_ep=0; i_v6_age1_m_newp=0;i_v6_age1_w_np=0; i_v6_age1_w_ep=0; i_v6_age1_w_newp=0;

i_v1_age2_m_np=0; i_v1_age2_m_ep=0; i_v1_age2_m_newp=0;i_v1_age2_w_np=0; i_v1_age2_w_ep=0; i_v1_age2_w_newp=0;
i_v2_age2_m_np=0; i_v2_age2_m_ep=0; i_v2_age2_m_newp=0;i_v2_age2_w_np=0; i_v2_age2_w_ep=0; i_v2_age2_w_newp=0;
i_v3_age2_m_np=0; i_v3_age2_m_ep=0; i_v3_age2_m_newp=0;i_v3_age2_w_np=0; i_v3_age2_w_ep=0; i_v3_age2_w_newp=0;
i_v4_age2_m_np=0; i_v4_age2_m_ep=0; i_v4_age2_m_newp=0;i_v4_age2_w_np=0; i_v4_age2_w_ep=0; i_v4_age2_w_newp=0;
i_v5_age2_m_np=0; i_v5_age2_m_ep=0; i_v5_age2_m_newp=0;i_v5_age2_w_np=0; i_v5_age2_w_ep=0; i_v5_age2_w_newp=0;
i_v6_age2_m_np=0; i_v6_age2_m_ep=0; i_v6_age2_m_newp=0;i_v6_age2_w_np=0; i_v6_age2_w_ep=0; i_v6_age2_w_newp=0;

i_v1_age3_m_np=0; i_v1_age3_m_ep=0; i_v1_age3_m_newp=0;i_v1_age3_w_np=0; i_v1_age3_w_ep=0; i_v1_age3_w_newp=0;
i_v2_age3_m_np=0; i_v2_age3_m_ep=0; i_v2_age3_m_newp=0;i_v2_age3_w_np=0; i_v2_age3_w_ep=0; i_v2_age3_w_newp=0;
i_v3_age3_m_np=0; i_v3_age3_m_ep=0; i_v3_age3_m_newp=0;i_v3_age3_w_np=0; i_v3_age3_w_ep=0; i_v3_age3_w_newp=0;
i_v4_age3_m_np=0; i_v4_age3_m_ep=0; i_v4_age3_m_newp=0;i_v4_age3_w_np=0; i_v4_age3_w_ep=0; i_v4_age3_w_newp=0;
i_v5_age3_m_np=0; i_v5_age3_m_ep=0; i_v5_age3_m_newp=0;i_v5_age3_w_np=0; i_v5_age3_w_ep=0; i_v5_age3_w_newp=0;
i_v6_age3_m_np=0; i_v6_age3_m_ep=0; i_v6_age3_m_newp=0;i_v6_age3_w_np=0; i_v6_age3_w_ep=0; i_v6_age3_w_newp=0;

i_v1_age4_m_np=0; i_v1_age4_m_ep=0; i_v1_age4_m_newp=0;i_v1_age4_w_np=0; i_v1_age4_w_ep=0; i_v1_age4_w_newp=0;
i_v2_age4_m_np=0; i_v2_age4_m_ep=0; i_v2_age4_m_newp=0;i_v2_age4_w_np=0; i_v2_age4_w_ep=0; i_v2_age4_w_newp=0;
i_v3_age4_m_np=0; i_v3_age4_m_ep=0; i_v3_age4_m_newp=0;i_v3_age4_w_np=0; i_v3_age4_w_ep=0; i_v3_age4_w_newp=0;
i_v4_age4_m_np=0; i_v4_age4_m_ep=0; i_v4_age4_m_newp=0;i_v4_age4_w_np=0; i_v4_age4_w_ep=0; i_v4_age4_w_newp=0;
i_v5_age4_m_np=0; i_v5_age4_m_ep=0; i_v5_age4_m_newp=0;i_v5_age4_w_np=0; i_v5_age4_w_ep=0; i_v5_age4_w_newp=0;
i_v6_age4_m_np=0; i_v6_age4_m_ep=0; i_v6_age4_m_newp=0;i_v6_age4_w_np=0; i_v6_age4_w_ep=0; i_v6_age4_w_newp=0;

i_v1_age5_m_np=0; i_v1_age5_m_ep=0; i_v1_age5_m_newp=0;i_v1_age5_w_np=0; i_v1_age5_w_ep=0; i_v1_age5_w_newp=0;
i_v2_age5_m_np=0; i_v2_age5_m_ep=0; i_v2_age5_m_newp=0;i_v2_age5_w_np=0; i_v2_age5_w_ep=0; i_v2_age5_w_newp=0;
i_v3_age5_m_np=0; i_v3_age5_m_ep=0; i_v3_age5_m_newp=0;i_v3_age5_w_np=0; i_v3_age5_w_ep=0; i_v3_age5_w_newp=0;
i_v4_age5_m_np=0; i_v4_age5_m_ep=0; i_v4_age5_m_newp=0;i_v4_age5_w_np=0; i_v4_age5_w_ep=0; i_v4_age5_w_newp=0;
i_v5_age5_m_np=0; i_v5_age5_m_ep=0; i_v5_age5_m_newp=0;i_v5_age5_w_np=0; i_v5_age5_w_ep=0; i_v5_age5_w_newp=0;
i_v6_age5_m_np=0; i_v6_age5_m_ep=0; i_v6_age5_m_newp=0;i_v6_age5_w_np=0; i_v6_age5_w_ep=0; i_v6_age5_w_newp=0;

i_fsw_v1_np=0; i_fsw_v2_np=0; i_fsw_v3_np=0; i_fsw_v4_np=0; i_fsw_v5_np=0; i_fsw_v6_np=0; 

* consider primary infection length  * dependent_on_time_step_length ;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_np=np; i_v1_ep=ep; i_v1_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_np=np; i_v2_ep=ep; i_v2_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_np=np; i_v3_ep=ep; i_v3_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_np=np; i_v4_ep=ep; i_v4_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_np=np; i_v5_ep=ep; i_v5_newp=newp; end;
	if 					    primary=1  then do; i_v6_np=np; i_v6_ep=ep; i_v6_newp=newp; end;

	if  gender = 1 and .  <  vl < 3 and primary=0  then do; i_vl1000_m_np=np; i_v11000_m_ep=ep; i_vl1000_m_newp=newp; end;
	if  gender = 2 and .  <  vl < 3 and primary=0  then do; i_vl1000_w_np=np; i_v11000_w_ep=ep; i_vl1000_w_newp=newp; end;

	if gender=1 and 15 <= age < 25 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age1_m_np=np; i_v1_age1_m_ep=ep; i_v1_age1_m_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age1_m_np=np; i_v2_age1_m_ep=ep; i_v2_age1_m_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age1_m_np=np; i_v3_age1_m_ep=ep; i_v3_age1_m_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age1_m_np=np; i_v4_age1_m_ep=ep; i_v4_age1_m_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age1_m_np=np; i_v5_age1_m_ep=ep; i_v5_age1_m_newp=newp; end;
	if 					    primary=1  then do; i_v6_age1_m_np=np; i_v6_age1_m_ep=ep; i_v6_age1_m_newp=newp; end;
	end;
	if gender=1 and 25 <= age < 35 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age2_m_np=np; i_v1_age2_m_ep=ep; i_v1_age2_m_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age2_m_np=np; i_v2_age2_m_ep=ep; i_v2_age2_m_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age2_m_np=np; i_v3_age2_m_ep=ep; i_v3_age2_m_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age2_m_np=np; i_v4_age2_m_ep=ep; i_v4_age2_m_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age2_m_np=np; i_v5_age2_m_ep=ep; i_v5_age2_m_newp=newp; end;
	if 					    primary=1  then do; i_v6_age2_m_np=np; i_v6_age2_m_ep=ep; i_v6_age2_m_newp=newp; end;
	end;
	if gender=1 and 35 <= age < 45 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age3_m_np=np; i_v1_age3_m_ep=ep; i_v1_age3_m_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age3_m_np=np; i_v2_age3_m_ep=ep; i_v2_age3_m_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age3_m_np=np; i_v3_age3_m_ep=ep; i_v3_age3_m_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age3_m_np=np; i_v4_age3_m_ep=ep; i_v4_age3_m_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age3_m_np=np; i_v5_age3_m_ep=ep; i_v5_age3_m_newp=newp; end;
	if 					    primary=1  then do; i_v6_age3_m_np=np; i_v6_age3_m_ep=ep; i_v6_age3_m_newp=newp; end;
	end;
	if gender=1 and 45 <= age < 55 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age4_m_np=np; i_v1_age4_m_ep=ep; i_v1_age4_m_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age4_m_np=np; i_v2_age4_m_ep=ep; i_v2_age4_m_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age4_m_np=np; i_v3_age4_m_ep=ep; i_v3_age4_m_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age4_m_np=np; i_v4_age4_m_ep=ep; i_v4_age4_m_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age4_m_np=np; i_v5_age4_m_ep=ep; i_v5_age4_m_newp=newp; end;
	if 					    primary=1  then do; i_v6_age4_m_np=np; i_v6_age4_m_ep=ep; i_v6_age4_m_newp=newp; end;
	end;
	if gender=1 and 55 <= age < 65 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age5_m_np=np; i_v1_age5_m_ep=ep; i_v1_age5_m_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age5_m_np=np; i_v2_age5_m_ep=ep; i_v2_age5_m_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age5_m_np=np; i_v3_age5_m_ep=ep; i_v3_age5_m_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age5_m_np=np; i_v4_age5_m_ep=ep; i_v4_age5_m_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age5_m_np=np; i_v5_age5_m_ep=ep; i_v5_age5_m_newp=newp; end;
	if 					    primary=1  then do; i_v6_age5_m_np=np; i_v6_age5_m_ep=ep; i_v6_age5_m_newp=newp; end;
	end;


	if gender=2 and 15 <= age < 25 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age1_w_np=np; i_v1_age1_w_ep=ep; i_v1_age1_w_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age1_w_np=np; i_v2_age1_w_ep=ep; i_v2_age1_w_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age1_w_np=np; i_v3_age1_w_ep=ep; i_v3_age1_w_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age1_w_np=np; i_v4_age1_w_ep=ep; i_v4_age1_w_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age1_w_np=np; i_v5_age1_w_ep=ep; i_v5_age1_w_newp=newp; end;
	if 					    primary=1  then do; i_v6_age1_w_np=np; i_v6_age1_w_ep=ep; i_v6_age1_w_newp=newp; end;
	end;
	if gender=2 and 25 <= age < 35 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age2_w_np=np; i_v1_age2_w_ep=ep; i_v1_age2_w_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age2_w_np=np; i_v2_age2_w_ep=ep; i_v2_age2_w_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age2_w_np=np; i_v3_age2_w_ep=ep; i_v3_age2_w_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age2_w_np=np; i_v4_age2_w_ep=ep; i_v4_age2_w_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age2_w_np=np; i_v5_age2_w_ep=ep; i_v5_age2_w_newp=newp; end;
	if 					    primary=1  then do; i_v6_age2_w_np=np; i_v6_age2_w_ep=ep; i_v6_age2_w_newp=newp; end;
	end;
	if gender=2 and 35 <= age < 45 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age3_w_np=np; i_v1_age3_w_ep=ep; i_v1_age3_w_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age3_w_np=np; i_v2_age3_w_ep=ep; i_v2_age3_w_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age3_w_np=np; i_v3_age3_w_ep=ep; i_v3_age3_w_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age3_w_np=np; i_v4_age3_w_ep=ep; i_v4_age3_w_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age3_w_np=np; i_v5_age3_w_ep=ep; i_v5_age3_w_newp=newp; end;
	if 					    primary=1  then do; i_v6_age3_w_np=np; i_v6_age3_w_ep=ep; i_v6_age3_w_newp=newp; end;
	end;
	if gender=2 and 45 <= age < 55 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age4_w_np=np; i_v1_age4_w_ep=ep; i_v1_age4_w_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age4_w_np=np; i_v2_age4_w_ep=ep; i_v2_age4_w_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age4_w_np=np; i_v3_age4_w_ep=ep; i_v3_age4_w_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age4_w_np=np; i_v4_age4_w_ep=ep; i_v4_age4_w_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age4_w_np=np; i_v5_age4_w_ep=ep; i_v5_age4_w_newp=newp; end;
	if 					    primary=1  then do; i_v6_age4_w_np=np; i_v6_age4_w_ep=ep; i_v6_age4_w_newp=newp; end;
	end;
	if gender=2 and 55 <= age < 65 then do;
	if  .  <  vl < 2.7 and primary=0  then do; i_v1_age5_w_np=np; i_v1_age5_w_ep=ep; i_v1_age5_w_newp=newp; end;
	if 2.7 <= vl < 3.7 and primary=0  then do; i_v2_age5_w_np=np; i_v2_age5_w_ep=ep; i_v2_age5_w_newp=newp; end;
	if 3.7 <= vl < 4.7 and primary=0  then do; i_v3_age5_w_np=np; i_v3_age5_w_ep=ep; i_v3_age5_w_newp=newp; end;
	if 4.7 <= vl < 5.7 and primary=0  then do; i_v4_age5_w_np=np; i_v4_age5_w_ep=ep; i_v4_age5_w_newp=newp; end;
	if 5.7 <= vl		and primary=0  then do; i_v5_age5_w_np=np; i_v5_age5_w_ep=ep; i_v5_age5_w_newp=newp; end;
	if 					    primary=1  then do; i_v6_age5_w_np=np; i_v6_age5_w_ep=ep; i_v6_age5_w_newp=newp; end;
	end;

	i_age1_m_np=0; if gender=1 and 15 <= age < 25 then i_age1_m_np=np;
	i_age2_m_np=0; if gender=1 and 25 <= age < 35 then i_age2_m_np=np;
	i_age3_m_np=0; if gender=1 and 35 <= age < 45 then i_age3_m_np=np;
	i_age4_m_np=0; if gender=1 and 45 <= age < 55 then i_age4_m_np=np;
	i_age5_m_np=0; if gender=1 and 55 <= age < 65 then i_age5_m_np=np;

	i_m_1549_np=0; if gender=1 and 15 <= age < 50 then i_m_1549_np=np;

	i_age1_w_np=0; if gender=2 and 15 <= age < 25 then i_age1_w_np=np;
	i_age2_w_np=0; if gender=2 and 25 <= age < 35 then i_age2_w_np=np;
	i_age3_w_np=0; if gender=2 and 35 <= age < 45 then i_age3_w_np=np;
	i_age4_w_np=0; if gender=2 and 45 <= age < 55 then i_age4_w_np=np;
	i_age5_w_np=0; if gender=2 and 55 <= age < 65 then i_age5_w_np=np;

	i_w_1549_np=0; if gender=2 and 15 <= age < 50 then i_w_1549_np=np;

	i_age1_m_newp=0; if gender=1 and 15 <= age < 25 then i_age1_m_newp=newp;
	i_age2_m_newp=0; if gender=1 and 25 <= age < 35 then i_age2_m_newp=newp;
	i_age3_m_newp=0; if gender=1 and 35 <= age < 45 then i_age3_m_newp=newp;
	i_age4_m_newp=0; if gender=1 and 45 <= age < 55 then i_age4_m_newp=newp;
	i_age5_m_newp=0; if gender=1 and 55 <= age < 65 then i_age5_m_newp=newp;

	i_age1_w_newp=0; if gender=2 and 15 <= age < 25 then i_age1_w_newp=newp;
	i_age2_w_newp=0; if gender=2 and 25 <= age < 35 then i_age2_w_newp=newp;
	i_age3_w_newp=0; if gender=2 and 35 <= age < 45 then i_age3_w_newp=newp;
	i_age4_w_newp=0; if gender=2 and 45 <= age < 55 then i_age4_w_newp=newp;
	i_age5_w_newp=0; if gender=2 and 55 <= age < 65 then i_age5_w_newp=newp;


	i_m_d_newp=0; if registd=1 and gender=1 then i_m_d_newp=newp;
	i_w_d_newp=0; if registd=1 and gender=2 then i_w_d_newp=newp;

	i_m_np=0; if gender=1 then i_m_np=np;
	i_w_np=0; if gender=2 then i_w_np=np;

* consider primary infection length * dependent_on_time_step_length ;
	if sw=1 then do;
		if  .  <  vl < 2.7 and primary=0  then i_fsw_v1_np=np;
		if 2.7 <= vl < 3.7 and primary=0  then i_fsw_v2_np=np;
		if 3.7 <= vl < 4.7 and primary=0  then i_fsw_v3_np=np;
		if 4.7 <= vl < 5.7 and primary=0  then i_fsw_v4_np=np;
		if 5.7 <= vl		and primary=0  then i_fsw_v5_np=np;
		if 						primary=1  then i_fsw_v6_np=np;
	end;

	* decrease again viral load if sti;
	if sti=1 then vl = vl - 0.5;


	 rm_tm1 = rm_ ;  nnm_tm1=nnm_;  pim_tm1=pim_; inpm_tm1=inpm_; insm_tm1=insm_; 


	* presence of any mutation;
	rm_=0; if hiv1564=1 and (c_rt103m=1 or c_rt181m=1 or c_rt190m=1 or c_rt65m=1 or c_rt184m=1 or c_rt151m=1 or c_rttams >= 1 
	or c_pr32m=1 or c_pr33m=1 or c_pr46m=1 or c_pr47m=1 or c_pr50vm=1 or c_pr50lm=1 or c_pr54m=1  or c_pr76m=1 
	or c_pr82m=1 or c_pr84m=1 or c_pr88m=1 or c_pr90m=1 or c_inpm=1 or c_insm=1) then rm_=1;
	
	* presence of any mutation;
	rme_=0; if hiv1564=1 and (e_rt103m=1 or e_rt181m=1 or e_rt190m=1 or e_rt65m=1  or e_rt184m=1 or e_rt151m=1 or e_rttams >= 1 
	or e_pr32m=1 or e_pr33m=1 or e_pr46m=1 or e_pr47m=1 or e_pr50vm=1 or e_pr50lm=1 or e_pr54m=1  or e_pr76m=1 
	or e_pr82m=1 or e_pr84m=1 or e_pr88m=1 or e_pr90m=1 or e_inpm=1 or e_insm=1) then rme_=1;

	* presence of any ii mutation;
	iime_=0; if hiv1564=1 and (e_inpm=1 or e_insm=1) then iime_=1;
	
	* presence of any nn mutation;
	nnme_=0; if hiv1564=1 and (e_rt103m=1 or e_rt181m=1 or e_rt190m=1) then nnme_=1;
	
	* presence of any nn mutation by gender;  * apr 19;
	nnme_w_=0; if hiv1564=1 and gender=2 and (e_rt103m=1 or e_rt181m=1 or e_rt190m=1) then nnme_w_=1;
	nnme_m_=0; if hiv1564=1 and gender=1 and (e_rt103m=1 or e_rt181m=1 or e_rt190m=1) then nnme_m_=1;

	* presence of any pi mutation;
	pime_=0; if hiv1564=1 and (e_pr32m=1 or e_pr33m=1 or e_pr46m=1 or e_pr47m=1 or e_pr50vm=1 or e_pr50lm=1 or e_pr54m=1  
	or e_pr76m=1 or e_pr82m=1 or e_pr84m=1 or e_pr88m=1 or e_pr90m=1) then pime_=1;
	
	* presence of any nrti mutation;
	nrtime_=0; if hiv1564=1 and (e_rt65m=1  or e_rt184m=1 or e_rt151m=1 or e_rttams >= 1) then nrtime_=1;

	* presence of any resistance mutation according to viral load;
	i_r_vlg1_np=0; if hiv1564=1 and rm_=1 and vlg1=1 then i_r_vlg1_np=np;
	i_r_vlg2_np=0; if hiv1564=1 and rm_=1 and vlg2=1 then i_r_vlg2_np=np;
	i_r_vlg3_np=0; if hiv1564=1 and rm_=1 and vlg3=1 then i_r_vlg3_np=np;
	i_r_vlg4_np=0; if hiv1564=1 and rm_=1 and vlg4=1 then i_r_vlg4_np=np;
	i_r_vlg5_np=0; if hiv1564=1 and rm_=1 and vlg5=1 then i_r_vlg5_np=np;
	i_r_vlg6_np=0; if hiv1564=1 and rm_=1 and primary=1 then i_r_vlg6_np=np;

	* survival time from start of art to v failure with resistance ;
	if date_rm_maj_vf=. and rm_=1 and onart_gt6m_vlg1000=1 then date_rm_maj_vf = caldate&j; 
	surv_rm_maj_vf = min(date_rm_maj_vf,caldate&j,death)-yrart; rm_maj_vf_yn=0; if surv_rm_maj_vf = date_rm_maj_vf-yrart > . then rm_maj_vf_yn=1;


	* whether diagnosed, according to viral load and resistance;
	i_diag_vlg1_rm0_np=0; if hiv1564=1 and registd=1 and vlg1=1 and rm_=0 then i_diag_vlg1_rm0_np=np;
	i_diag_vlg1_rm1_np=0; if hiv1564=1 and registd=1 and vlg1=1 and rm_=1 then i_diag_vlg1_rm1_np=np;
	
	i_diag_vlg2_rm0_np=0; if hiv1564=1 and registd=1 and vlg2=1 and rm_=0 then i_diag_vlg2_rm0_np=np;
	i_diag_vlg2_rm1_np=0; if hiv1564=1 and registd=1 and vlg2=1 and rm_=1 then i_diag_vlg2_rm1_np=np;

	i_diag_vlg3_rm0_np=0; if hiv1564=1 and registd=1 and vlg3=1 and rm_=0 then i_diag_vlg3_rm0_np=np;
	i_diag_vlg3_rm1_np=0; if hiv1564=1 and registd=1 and vlg3=1 and rm_=1 then i_diag_vlg3_rm1_np=np;
	
	i_diag_vlg4_rm0_np=0; if hiv1564=1 and registd=1 and vlg4=1 and rm_=0 then i_diag_vlg4_rm0_np=np;
	i_diag_vlg4_rm1_np=0; if hiv1564=1 and registd=1 and vlg4=1 and rm_=1 then i_diag_vlg4_rm1_np=np;

	i_diag_vlg5_rm0_np=0; if hiv1564=1 and registd=1 and vlg5=1 and rm_=0 then i_diag_vlg5_rm0_np=np;
	i_diag_vlg5_rm1_np=0; if hiv1564=1 and registd=1 and vlg5=1 and rm_=1 then i_diag_vlg5_rm1_np=np;
	
	i_diag_vlg6_rm0_np=0; if hiv1564=1 and registd=1 and vlg6=1 and rm_=0 then i_diag_vlg6_rm0_np=np;
	i_diag_vlg6_rm1_np=0; if hiv1564=1 and registd=1 and vlg6=1 and rm_=1 then i_diag_vlg6_rm1_np=np;
	

	* whether art naive, according to viral load and resistance;
	i_naive_vlg1_rm0_np=0; if hiv1564=1 and naive=1 and vlg1=1 and registd=1 and rm_=0 then i_naive_vlg1_rm0_np=np;
	i_naive_vlg1_rm1_np=0; if hiv1564=1 and naive=1 and vlg1=1 and registd=1 and rm_=1 then i_naive_vlg1_rm1_np=np;
	
	i_naive_vlg2_rm0_np=0; if hiv1564=1 and naive=1 and vlg2=1 and registd=1 and rm_=0 then i_naive_vlg2_rm0_np=np;
	i_naive_vlg2_rm1_np=0; if hiv1564=1 and naive=1 and vlg2=1 and registd=1 and rm_=1 then i_naive_vlg2_rm1_np=np;

	i_naive_vlg3_rm0_np=0; if hiv1564=1 and naive=1 and vlg3=1 and registd=1 and rm_=0 then i_naive_vlg3_rm0_np=np;
	i_naive_vlg3_rm1_np=0; if hiv1564=1 and naive=1 and vlg3=1 and registd=1 and rm_=1 then i_naive_vlg3_rm1_np=np;

	i_naive_vlg4_rm0_np=0; if hiv1564=1 and naive=1 and vlg4=1 and registd=1 and rm_=0 then i_naive_vlg4_rm0_np=np;
	i_naive_vlg4_rm1_np=0; if hiv1564=1 and naive=1 and vlg4=1 and registd=1 and rm_=1 then i_naive_vlg4_rm1_np=np;
	
	i_naive_vlg5_rm0_np=0; if hiv1564=1 and naive=1 and vlg5=1 and registd=1 and rm_=0 then i_naive_vlg5_rm0_np=np;
	i_naive_vlg5_rm1_np=0; if hiv1564=1 and naive=1 and vlg5=1 and registd=1 and rm_=1 then i_naive_vlg5_rm1_np=np;

	i_naive_vlg6_rm0_np=0; if hiv1564=1 and naive=1 and vlg6=1 and registd=1 and rm_=0 then i_naive_vlg6_rm0_np=np;
	i_naive_vlg6_rm1_np=0; if hiv1564=1 and naive=1 and vlg6=1 and registd=1 and rm_=1 then i_naive_vlg6_rm1_np=np;


*** Distribution of resistance mutations amongst those with resistance to inform rm in the infectious pool;

	if rm_=1 then do;
		tam1_=0; if c_rttams=1 then tam1_=1;
		tam2_=0; if c_rttams=2 then tam2_=1;
		tam3_=0; if c_rttams >=3 then tam3_=1;
		k103m_=0;  if c_rt103m=1  then k103m_=1;
		y181m_=0;  if c_rt181m=1  then y181m_=1;
		g190m_=0;  if c_rt190m=1  then g190m_=1;
		nnm_=0;  
		if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 then nnm_=1;

		m184m_=0;if c_rt184m=1 then m184m_=1;
		q151m_=0;if c_rt151m=1 then q151m_=1;
		k65m_=0; if c_rt65m=1  then k65m_=1;
		p32m_=0; if c_pr32m=1  then p32m_=1;
		p33m_=0; if c_pr33m=1  then p33m_=1;
		p46m_=0; if c_pr46m=1  then p46m_=1;
		p47m_=0; if c_pr47m=1  then p47m_=1;
		p50vm_=0; if c_pr50vm=1  then p50vm_=1;
		p50lm_=0; if c_pr50lm=1  then p50lm_=1;
		p54m_=0; if c_pr54m=1  then p54m_=1;
		p76m_=0; if c_pr76m=1  then p76m_=1;
		p82m_=0; if c_pr82m=1  then p82m_=1;
		p84m_=0; if c_pr84m=1  then p84m_=1;
		p88m_=0; if c_pr88m=1  then p88m_=1;
		p90m_=0; if c_pr90m=1  then p90m_=1;
		pim_=0; 
		if p32m_=1 or p33m_=1 or p46m_=1 or
		p47m_=1 or p50vm_=1 or p50lm_=1 or 
		p54m_=1 or p76m_=1 or p82m_=1 or p84m_=1  or p88m_=1 or
		p90m_=1 then pim_=1;
		inpm_=0;  if c_inpm=1  then inpm_=1;
		insm_=0;  if c_insm=1  then insm_=1;
		inm_=0;   if inpm_=1 or insm_=1 then inm_=1;
	end;

	i_tam=0; i_nnm=0; i_im=0; i_184m=0; i_pim=0; i_65m=0;
	if primary=1 then do; 
		i_pim=max(0,pim_); 
		if c_rttams ge 1 then i_tam = 1;  
		i_184m=c_rt184m;
		i_65m=c_rt65m;
		if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 then i_nnm=1;
		if c_inpm=1 or c_insm=1 then i_im=1;  
		i_rm=rm_; 
	end;

	if c_rt103m=1 or c_rt181m=1 or c_rt190m=1 or c_rt65m=1 or c_rt184m=1 or c_rttams >= 1 or c_rt151m=1
	or c_pr32m=1  or c_pr33m=1 	or c_pr46m=1  or c_pr47m=1 or c_pr50vm=1 or c_pr50lm=1 or c_pr54m=1 
	or c_pr76m=1  or c_pr82m=1  or c_pr84m=1  or c_pr88m=1 or c_pr90m=1  or c_inpm=1   or c_insm=1
	then i_rm=1; if primary ne 1 then i_rm=.;

	if primary=1 then do; r_=0;
		if r_zdv  >= 0.5 or r_efa  >= 0.5 or r_nev  >= 0.5 or r_ten  >= 0.5 or r_3tc  >= 0.5 
		or r_dar >= 0.5 or r_lpr >= 0.5  or r_taz >= 0.5 or r_dol >= 0.5 then r_=1;
	end;


	r_vg50=.; 
	if vg50=1 then do;
		r_vg50=0; if rm_=1 then  r_vg50=1;
	end;

	r_vg200=.; 
	if vg200=1 then do;
		r_vg200=0; if rm_=1 then  r_vg200=1;
	end;

	r_vg1000=.; 
	if vg1000=1 then do;
	r_vg1000=0; if rm_=1 then  r_vg1000=1;
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
		pim_art=max(0,pim_); 
		if c_rttams ge 1 then tam_art = 1;  
		m184_art=c_rt184m; 
		if c_inpm=1 or c_insm=1 then im_art = 1;
		r_art=0;
		if r_zdv  >= 0.5 or r_efa  >= 0.5 or r_nev  >= 0.5 or r_ten  >= 0.5 or r_3tc  >= 0.5 
		or r_dar >= 0.5 or r_lpr >= 0.5 or r_taz >= 0.5 or r_dol >= 0.5 then r_art=1; 
		nactive_art_start_lt3 = 0; if . < nactive_start_art < 3 then nactive_art_start_lt3 = 1;
		nactive_art_start_lt2 = 0; if . < nactive_start_art < 2 then nactive_art_start_lt2 = 1;
		nactive_art_start_lt1p5 = 0; if . < nactive_start_art < 1.5 then nactive_art_start_lt1p5 = 1;
	end; 

	nactive_line2_lt4 =0; if . < nactive_line2 < 4 then nactive_line2_lt4 = 1;
	nactive_line2_lt3 =0; if . < nactive_line2 < 3 then nactive_line2_lt3 = 1;
	nactive_line2_lt2 =0; if . < nactive_line2 < 2 then nactive_line2_lt2 = 1;
	nactive_line2_lt1p5 =0; if . < nactive_line2 < 1.5 then nactive_line2_lt1p5 = 1;

	if hiv1564=1 then dead1564_=dead  ; if age <15 or age >= 65 then dead1564_=.;
	if registd=1 then dead_diag=dead1564_;

	cl50=0;cl100=0;cl200=0;cl350=0;
	if . < cd4 < 50 then cl50=1; if cd4=. then cl50=.;
	if . < cd4 < 100 then cl100=1; if cd4=. then cl100=.;
	if . < cd4 < 200 then cl200=1; if cd4=. then cl200=.;
	if . < cd4 < 350 then cl350=1; if cd4=. then cl350=.;
	if . < cd4 < 500 then cl500=1; if cd4=. then cl500=.;

	elig_treat200=0; if hiv1564=1 and (naive=0 or cl200=1 or who4_=1) then elig_treat200=1;
	elig_treat350=0; if hiv1564=1 and (naive=0 or cl350=1 or who4_=1) then elig_treat350=1;
	elig_treat500=0; if hiv1564=1 and (naive=0 or cl500=1 or who4_=1) then elig_treat500=1;


***Outputs for specific periods;
	inf_primary=0; inf_vlsupp=0;inf_newp=0;inf_ep=0;inf_diag=0;inf_naive=0;

	if primary=1 then do;
		if infected_primary=1 then inf_primary=1;
		if infected_vlsupp=1  then inf_vlsupp=1;
		if infected_newp=1    then inf_newp=1;
		if infected_ep=1      then inf_ep=1;
		if infected_diagnosed=1 then inf_diag=1;
		if infected_naive=1    then inf_naive=1;
		if r_=1 then do;
			inf_tdr_prim=0;inf_tdr_diag=0;inf_tdr_naive=0;inf_tdr_vlsupp=0;inf_tdr_newp=0;
			if infected_primary=1   then inf_tdr_prim=1;
			if infected_diagnosed=1 then inf_tdr_diag=1;
			if infected_naive=1     then inf_tdr_naive=1;
			if infected_vlsupp=1    then inf_tdr_vlsupp=1;
			if infected_newp=1      then inf_tdr_newp=1;
		end;
	end;

	backincare=0;if lost_tm1=1 and visit=1 then backincare=1;


end; * this closes loop for hiv + only;

*** Status of concordant/discordant partnerships;
hiv0epi1_w=0; if gender=2 and hiv=0 and epi  =1 then hiv0epi1_w=1; 
hiv1epi0_w=0; if gender=2 and hiv=1 and epi  =0 then hiv1epi0_w=1; 
hiv1epi1_w=0; if gender=2 and hiv=1 and epi  =1 then hiv1epi1_w=1; 
hiv0epi1_m=0; if gender=1 and hiv=0 and epi  =1 then hiv0epi1_m=1; 
hiv1epi0_m=0; if gender=1 and hiv=1 and epi  =0 then hiv1epi0_m=1; 
hiv1epi1_m=0; if gender=1 and hiv=1 and epi  =1 then hiv1epi1_m=1; 

*** Existing partner infected this period;
hiv0epprim=0; if hiv=0 and epi  =1 and epi_tm1=0 and ep_tm1=1 then hiv0epprim=1; 

*** Virally supressed on ART;
if prep   ne 1 then do;
	* No time restriction on ART;
	vl1000_art=.;
	if onart = 1 then vl1000_art=vl1000;
	* No time restriction on ART, including interruption clinic unaware;
	onart_iicu = .; vl1000_art_iicu = .;
	if (onart = 1 or int_clinic_not_aw) = 1 then onart_iicu=1;
	if onart_iicu=1 then vl1000_art_iicu = vl1000;
	* On ART >6m;
	onart_gt6m = .; vl1000_art_gt6m = .;
	if onart = 1 and tcur > 0.5 then onart_gt6m = 1;
	if onart_gt6m=1 then vl1000_art_gt6m= vl1000;
	* On ART >6m, including interruption clinic unaware; ;
	onart_gt6m_iicu=.;vl1000_art_gt6m_iicu = .; 
	if ((onart = 1 and tcur > 0.5) or (int_clinic_not_aw = 1 and caldate&j - yrart > 0.5)) then onart_gt6m_iicu =1;
	if onart_gt6m_iicu=1 then vl1000_art_gt6m_iicu = vl1000; 
end;

* here ;

* hiv+ and started art due to being on tld_prep, currently hiv+ and on tld_prep, and vl1000 for these ;

started_art_as_tld_prep_vl1000=.; onart_as_tld_prep=.; onart_as_tld_prep_vl1000=.;
if started_art_as_tld_prep = 1 then do; started_art_as_tld_prep_vl1000 = vl1000;  end;
if started_art_as_tld_prep = 1 and onart=1 and registd ne 1 then onart_as_tld_prep=1; 
if onart_as_tld_prep=1 then do; onart_as_tld_prep_vl1000 = vl1000;   end; 

***As above, stratified by gender;
vl1000_art_m =.;onart_iicu_m=.;vl1000_art_iicu_m=.;onart_gt6m_m=.;vl1000_art_gt6m_m=.;onart_gt6m_iicu_m=.;vl1000_art_gt6m_iicu_m=.;
vl1000_art_w =.;onart_iicu_w=.;vl1000_art_iicu_w=.;onart_gt6m_w=.;vl1000_art_gt6m_w=.;onart_gt6m_iicu_w=.;vl1000_art_gt6m_iicu_w=.;
vl1000_art_1524_ 		= .;	onart_iicu_1524_ 		= .;	vl1000_art_iicu_1524_ 	= .;	onart_gt6m_1524_		= .; 
vl1000_art_gt6m_1524_	= .;	onart_gt6m_iicu_1524_	= .;	vl1000_art_gt6m_iicu_1524_ = .;	vl1000_art_2549_ 		= .;
onart_iicu_2549_ 		= .;	vl1000_art_iicu_2549_ 	= .;	onart_gt6m_2549_		= .; 	vl1000_art_gt6m_2549_	= .;
onart_gt6m_iicu_2549_	= .;	vl1000_art_gt6m_iicu_2549_ = .;	vl1000_art_50pl_ 		= .;	onart_iicu_50pl_ 		= .;
vl1000_art_iicu_50pl_ 	= .;	onart_gt6m_50pl_		= .; 	vl1000_art_gt6m_50pl_	= .;	onart_gt6m_iicu_50pl_	= .;
vl1000_art_gt6m_iicu_50pl_ = .;  onart_gt6m_iicu_sw	= .;	vl1000_art_gt6m_iicu_sw = .;

if gender=1 then do;
	vl1000_art_m 		= vl1000_art;

	onart_iicu_m 		= onart_iicu;
	vl1000_art_iicu_m 	= vl1000_art_iicu;

	onart_gt6m_m 		= onart_gt6m;
	vl1000_art_gt6m_m	= vl1000_art_gt6m;

	onart_gt6m_iicu_m	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_m = vl1000_art_gt6m_iicu;
end;

if gender=2 then do;
	vl1000_art_w 		= vl1000_art;

	onart_iicu_w 		= onart_iicu;
	vl1000_art_iicu_w 	= vl1000_art_iicu;

	onart_gt6m_w		= onart_gt6m; 
	vl1000_art_gt6m_w	= vl1000_art_gt6m;

	onart_gt6m_iicu_w	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_w = vl1000_art_gt6m_iicu;
end;

*** As above, stratified by age;
if 15 <= age < 25 then do;
	vl1000_art_1524_ 		= vl1000_art;

	onart_iicu_1524_ 		= onart_iicu;
	vl1000_art_iicu_1524_ 	= vl1000_art_iicu;

	onart_gt6m_1524_		= onart_gt6m; 
	vl1000_art_gt6m_1524_	= vl1000_art_gt6m;

	onart_gt6m_iicu_1524_	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_1524_ = vl1000_art_gt6m_iicu;
end;

if 25 <= age < 50 then do;
	vl1000_art_2549_ 		= vl1000_art;

	onart_iicu_2549_ 		= onart_iicu;
	vl1000_art_iicu_2549_ 	= vl1000_art_iicu;

	onart_gt6m_2549_		= onart_gt6m; 
	vl1000_art_gt6m_2549_	= vl1000_art_gt6m;

	onart_gt6m_iicu_2549_	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_2549_ = vl1000_art_gt6m_iicu;
end;

if 50 <= age  then do;
	vl1000_art_50pl_ 		= vl1000_art;

	onart_iicu_50pl_ 		= onart_iicu;
	vl1000_art_iicu_50pl_ 	= vl1000_art_iicu;

	onart_gt6m_50pl_		= onart_gt6m; 
	vl1000_art_gt6m_50pl_	= vl1000_art_gt6m;

	onart_gt6m_iicu_50pl_	= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_50pl_ = vl1000_art_gt6m_iicu;
end;

if sw=1 then do;
	onart_gt6m_iicu_sw		= onart_gt6m_iicu;
	vl1000_art_gt6m_iicu_sw = vl1000_art_gt6m_iicu;
end;

***90-90-90 indicators for SW according to whether or not they have visited a SW program;
diag_sw_inprog=0;diag_sw_noprog=0;onart_sw_inprog=0;onart_sw_noprog=0;vl1000_art_gt6m_iicu_sw_inprog=0;
vl1000_art_gt6m_iicu_sw_noprog=0;

if sw_program_visit=1 and sw=1 then do;
diag_sw_inprog=diag_sw; onart_sw_inprog=onart_sw; vl1000_art_gt6m_iicu_sw_inprog=vl1000_art_gt6m_iicu_sw;
end;

if sw_program_visit=0 and sw=1 then do;
diag_sw_noprog=diag_sw; onart_sw_noprog=onart_sw; vl1000_art_gt6m_iicu_sw_noprog=vl1000_art_gt6m_iicu_sw;
end;


vl1000_art_incintcun_sw=.;   if sw=1      then vl1000_art_incintcun_sw    = vl1000_art_iicu;


*** On ART, VL >1000;
onart_vlg1000=0; if onart=1 and vl1000=0 then onart_vlg1000=1;
*** On ART for >6m, VL (and measured vl) EVER >1000;
if onart=1 and vl1000=0 and tcur ge 0.5 then ever_onart_gt6m_vlg1000=1;
if onart=1 and vm > log10(1000) and tcur ge 0.5 then ever_onart_gt6m_vl_m_g1000=1;
*** On ART for >6m, current VL >1000;
onart_gt6m_vlg1000=0; if ((onart=1 and tcur ge 0.5) or int_clinic_not_aw=1) and vl >= log10(1000)  and caldate&j ge yrart+0.5 > . then onart_gt6m_vlg1000=1;
*** Really on ART for >6m, current VL >1000;
r_onart_gt6m_vlg1000=0; if (onart=1 and tcur ge 0.5) and vl1000=0 and caldate&j ge yrart+0.5  > . then r_onart_gt6m_vlg1000=1;

if epvls ne 1 then epvls=0;

*** VL at 12m /24m after starting ART;
art_12m=.; art_24m=.; vl1000_art_12m =.; vl1000_art_24m = .; art_12m_onart=.; vl1000_art_12m_onart=.;
lost_12m=.; visit_12m=.; offart_12m=.;
line2_12m=.; vl1000_line2_12m=.; vl1000_line2_12m_onart=.; line2_12m_onart=.;
r_vg1000_art_12m_onart=.;
lost_6m=.;  lost_24m=.; lost_36m=.; visit_6m=.; visit_24m=.;visit_36m=.;visit_60m=.;

if yrart = caldate&j-1 > . then do; 
	art_12m=1; 	vl1000_art_12m = vl1000; 
	if (onart=1 or int_clinic_not_aw=1) 			  then do; art_12m_onart=1;vl1000_art_12m_onart=0;end;
	if (onart=1 or int_clinic_not_aw=1) and vl1000=1 then vl1000_art_12m_onart=1;
	if (onart=1 or int_clinic_not_aw=1) and vg1000=1 then r_vg1000_art_12m_onart=r_vg1000;

	offart_12m=0; if onart=0 and int_clinic_not_aw ne 1 then offart_12m=1;
	lost_12m=0;   if lost=1 then lost_12m=1;
	visit_12m=0;  if visit=1 then visit_12m=1;
end;

if caldate&j = yrart+2 > . then do; art_24m=1; vl1000_art_24m = vl1000; end;

*** VL at 12m on 2nd line;
if caldate&j = date_line2+1 > . then do; 
	line2_12m=1; vl1000_line2_12m = vl1000; 
	if (onart=1 or int_clinic_not_aw=1) then line2_12m_onart=1;
	if (onart=1 or int_clinic_not_aw=1) and vl1000=1 then vl1000_line2_12m_onart=1;
end;

if yrart = caldate&j-0.5 > . then do; 
	visit_6m=0;  if visit=1 then visit_6m=1;
	lost_6m=0;   if lost  =1  then lost_6m=1;
end;
if yrart = caldate&j-2 > . then do; 
	visit_24m=0;  if visit=1 then visit_24m=1;
	lost_24m=0;   if lost  =1  then lost_24m=1;
end;
if yrart = caldate&j-3 > . then do; 
	visit_36m=0;  if visit=1 then visit_36m=1;
	lost_36m=0;   if lost  =1  then lost_36m=1;
end;
if yrart = caldate&j-5 > . then do;
	visit_60m=0;  if visit=1 then visit_60m=1;
end;

*** Underlying virological failure at any point in the past;
u_vfail1=0; if caldate&j ge date_u_vfail > . then u_vfail1=1;
*** Viral load categories at 1st line failure;
line1_fail_this_period=0;
vl_vfail1_g1=0; vl_vfail1_g2=0; vl_vfail1_g3=0; vl_vfail1_g4=0; vl_vfail1_g5=0; vl_vfail1_g6=0; res_vfail1=0;
if linefail_tm1=0 and linefail=1 then do;
	line1_fail_this_period=1;
	if .< vl_fail1 < 3 then vl_vfail1_g1 = 1;
	if 3 <= vl_fail1 < 3.5 then vl_vfail1_g2 = 1;
	if 3.5 <= vl_fail1 < 4 then vl_vfail1_g3 = 1;
	if 4 <= vl_fail1 < 4.5 then vl_vfail1_g4 = 1;
	if 4.5 <= vl_fail1 < 5 then vl_vfail1_g5 = 1;
	if 5 <= vl_fail1  then vl_vfail1_g6 = 1;
	res_vfail1 = 0; if r_fail ge 1 then res_vfail1=1;
end;


if onart=1 then do;
	hiv1564_onart=hiv1564;
	dead1564_onart=dead1564_;
end;

*** Diagnosed and on ART by sex and ep;
artexp=0; if naive=0 then artexp=1; 
if      gender=1 then do; diag_m=registd; epdiag_m=epdiag; epi_m=epi  ; onart_m=onart; eponart_m=epart; end;
else if gender=2 then do; diag_w=registd; epdiag_w=epdiag; epi_w=epi  ; onart_w=onart; eponart_w=epart; end;

***VL on 2nd line;
if (onart=1 or int_clinic_not_aw=1) and caldate&j >= date_line2 > . then line2_incl_int_clinic_not_aw = 1;
if line2_incl_int_clinic_not_aw = 1 and vl1000=1 then vl1000_line2=1;
if line2_incl_int_clinic_not_aw = 1 and pim_=1 then pim_line2=1;

onart_cd4_g500=0;  if (onart=1 or int_clinic_not_aw=1) and cd4 >= 500 then onart_cd4_g500=1;


*Prep;
hr_noprep=0;       if (epi  =1 or newp ge 2) and prep   ne 1 then hr_noprep=1;

primary_prep=0;     if primary=1 and infected_prep=1 then primary_prep=1;
primary_hr_noprep=0;if primary=1 and hr_noprep=1     then primary_hr_noprep=1;
hiv1_prep=0; 	   if hiv=1 and prep  =1 then hiv1_prep=1;
if infected_prep=1 then do;
	primary_r_prep=r_;*new infections with TDR;
	ever_i_nor_prep=0;
	if primary_r_prep=1 then i_r_prep=1;
	if primary_r_prep=0 then ever_i_nor_prep=1;*Subjects ever infected while on PrEP without TDR;
end;

*Subjects ever infected while on PrEP without TDR who acquire resistance;
if ever_i_nor_prep=1 then rm_prep=rm_;

*Outcomes relating to PrEP;

*Number of people eligible for PrEP;
elig_prep_epdiag=0;	*if registd ne 1 and hard_reach=0 and epdiag=1 then elig_prep_epdiag=1;
					if prep_elig=1 and epdiag=1 then elig_prep_epdiag=1;
elig_prep=0;       	*if registd ne 1 and hard_reach=0 and (epi  =1 or newp ge 2) then elig_prep=1; 
					if prep_elig=1 then elig_prep=1;

elig_prep_w_1524 = 0; elig_prep_w_2534 = 0; elig_prep_w_3544 = 0; elig_prep_w_1549 = 0; 
if gender = 2 and 15 <= age < 25 then do; if prep_elig=1 then elig_prep_w_1524 = 1;  end;
if gender = 2 and 25 <= age < 35 then do; if prep_elig=1 then elig_prep_w_2534 = 1;  end;
if gender = 2 and 35 <= age < 45 then do; if prep_elig=1 then elig_prep_w_3544 = 1;  end;
if gender = 2 and 15 <= age < 50 then do; if prep_elig=1 then elig_prep_w_1549 = 1;  end;
if sw=1 then do; elig_prep_sw = 0; if prep_elig = 1 then elig_prep_sw = 1;   end;

prep_w_1524 = 0; prep_w_2534 = 0; prep_w_3544 = 0; prep_w_1549 = 0;
if gender = 2 and 15 <= age < 25 then do;  if prep=1 then prep_w_1524 = 1;  end;
if gender = 2 and 25 <= age < 35 then do;  if prep=1 then prep_w_2534 = 1;  end;
if gender = 2 and 35 <= age < 45 then do;  if prep=1 then prep_w_3544 = 1;  end;
if gender = 2 and 15 <= age < 49 then do;  if prep=1 then prep_w_1549 = 1;  end;

elig_prep_onprep=0;
if elig_prep = 1 then do;
if prep=1 then elig_prep_onprep=1;
end;

* high risk but not on prep;
hr_noprep=0;      		if (epi  =1 or newp ge 2) and registd ne 1 and prep   ne 1 then hr_noprep=1;
primary_hr_noprep=0;	if primary=1 and hr_noprep=1 then primary_hr_noprep=1;

* number on prep women age 15-24;
prep_w_1524 = 0 ; if prep   =1 and gender =2 and 15 <= age < 25 then prep_w_1524 = 1 ;

* number of sex workers on prep;
prep_sw = 0 ; if prep   =1 and sw=1 then prep_sw = 1 ;

*At start of PrEP;
prepstart=0; age_prepstart=.; ep_prepstart=.; newp_prepstart=.;
if dt_prep_s=caldate&j then do;
	prepstart=1;
	age_prepstart=age;
	ep_prepstart=ep;
	newp_prepstart=newp;
end;

*People accidentally on PrEP due to window period;  
started_prep_in_primary =0; if hiv=1 and dt_prep_s=caldate&j and primary = 1 then do; started_prep_in_primary =1;
started_prep_in_primary_e =1; end;

*Resistance related to PreP;
primary_prep=0; 
if infected_prep=1 and primary=1 then do;
	primary_prep=1; * infected in this period while having been on prep;     
	primary_r_prep=c_rm_inf; * new infections with TDR; * may17;
	ever_i_nor_prep=0;
	if primary_r_prep=1 then i_r_prep=1;
	if primary_r_prep ne 1 then ever_i_nor_prep=1; *Subjects EVER infected while on PrEP without TDR;
end;

* if infected by a person with prep resistance - infected_prep_source_prep_r;

*Subjects ever infected while on PrEP without TDR who acquire resistance;
if ever_i_nor_prep=1 then rm_prep=rm_;

*Whether resistance was transmitted or acquired when infected whilst on prep;
infected_prep_no_r=0; infected_prep_r=0;

* ts1m: note length primary dependent_on_time_step_length ;

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
hiv1_prep=0; 	   if hiv=1 and prep  =1 then do; hiv1_prep=1;  ever_hiv1_prep=1; end;

if ever_hiv1_prep=1 then do; 
cur_res_efa_ever_hiv1_prep =0 ; if cur_res_efa = 1 then cur_res_efa_ever_hiv1_prep =1;
cur_res_dol_ever_hiv1_prep =0 ; if cur_res_dol = 1 then cur_res_dol_ever_hiv1_prep =1;
cur_res_ten_ever_hiv1_prep =0 ; if cur_res_ten = 1 then cur_res_ten_ever_hiv1_prep =1;
cur_res_3tc_ever_hiv1_prep =0 ; if cur_res_3tc = 1 then cur_res_3tc_ever_hiv1_prep =1;
end;


* proportion of hiv tests on prep which are +ve;
if t ge 4 then do; * jan18 ;
* ts1m: note this is 1 period on prep so is 1 month is ts1m ; 
test_period1_on_prep =.; test_period1_on_prep_pos=.; test_gt_period1_on_prep =.; test_gt_period1_on_prep_pos=.;
if prep_tm2 ne 1 and prep_tm1=1 and tested=1 then do; test_period1_on_prep =1; test_period1_on_prep_pos=0; if caldate&j = date1pos then test_period1_on_prep_pos=1; end;
if prep_tm2=1 and prep_tm1=1 and prep=1 then do; test_gt_period1_on_prep =1; test_gt_period1_on_prep_pos=0; if caldate&j = date1pos then test_gt_period1_on_prep_pos=1; end;
end;

*Time from first to last use of prep;
years_since_start_prep=0; 
if prep_ever=1 then years_since_start_prep=dt_prep_e-dt_prep_s;


*Number of HIV tests in the previous year for people currently on PrEP;
n_test_prev_4p_onprep = 0;
* dependent_on_time_step_length ;
* ts1m :  when 1 month time step this is 4 months rather than 1 year (4p means 4 periods);
if caldate&j > 1990 and prep=1 and (. < caldate&j-dt_last_test < 1) then n_test_prev_4p_onprep=sum(tested,tested_tm1,tested_tm2,tested_tm3);

*Discontinutation (through choice) and re-initiation of PrEP;
ever_stopped_prep_choice=0; preprestart=0; 
if dt_prep_e=caldate&j and stop_prep_choice=1 then ever_stopped_prep_choice=1;
if dt_prep_rs=caldate&j then preprestart=1;
if dt_prep_c=caldate&j then prep_continue_np_ge1=1;


* Time from infection whilst on PrEP and whether they are still on PrEP after 3, 6, 9, 12, 18 months - only applies when pop_wide_tld not in place;
if  infected_prep=1 and pop_wide_tld ne 1 then do;
	time_from_infection=caldate&j-infection;
* dependent_on_time_step_length ;
	time_stop_prep= dt_prep_e+0.25-infection;
* ts1m:  replace line above with:
	time_stop_prep= dt_prep_e+(1/12)-infection;

	if time_from_infection=0.25 then onprep_3=prep;
	if time_from_infection=0.5  then onprep_6=prep;
	if time_from_infection=0.75 then onprep_9=prep;
	if time_from_infection=1.0  then onprep_12=prep;
	if time_from_infection=1.5  then onprep_18=prep;
end;

* resistance profile for people infected whilst on PrEP (whether this was acquired or transmitted);
if infected_prep=1 then do;

	if time_from_infection=0.25 then do;
		rt65m_3_prep =c_rt65m; rt184m_3_prep=c_rt184m; rttams_3_prep=c_rttams; if (rt65m_3_prep + rt184m_3_prep + rttams_3_prep) >= 1 
		then prep_r_3m_from_i_on_prep=1;  rtm_3_prep=rm_;
	end;
	else if time_from_infection=0.5 then do;
		rt65m_6_prep =c_rt65m; rt184m_6_prep=c_rt184m; rttams_6_prep=c_rttams; if (rt65m_6_prep + rt184m_6_prep + rttams_6_prep) >= 1 
		then prep_r_6m_from_i_on_prep=1; rtm_6_prep=rm_;
	end;
	else if time_from_infection=0.75 then do;
		rt65m_9_prep =c_rt65m; rt184m_9_prep=c_rt184m; rttams_9_prep=c_rttams; if (rt65m_9_prep + rt184m_9_prep + rttams_9_prep) >= 1 
		then prep_r_9m_from_i_on_prep=1; rtm_9_prep=rm_;
	end;
	else if time_from_infection=1 then do;
		rt65m_12_prep =c_rt65m; rt184m_12_prep=c_rt184m; rttams_12_prep=c_rttams; if (rt65m_12_prep + rt184m_12_prep + rttams_12_prep) >= 1 
		then prep_r_12m_from_i_on_prep=1; rtm_12_prep=rm_;
	end;
	else if time_from_infection=1.5 then do;
		rt65m_18_prep =c_rt65m; rt184m_18_prep=c_rt184m; rttams_18_prep=c_rttams; if (rt65m_18_prep + rt184m_18_prep + rttams_18_prep) >= 1 
		then prep_r_18m_from_i_on_prep=1; rtm_18_prep=rm_;
	end;

end;

* resistance profile for people infected whilst on PrEP but not with resistant virus;
if infected_prep=1 and i_r_prep ne 1  then do;
	time_acq_rt65m  = caldate&j -infection; if acq_rt65m=1  then time_acq_rt65m = dt_acq_rt65m -infection;
	time_acq_rt184m = caldate&j -infection; if acq_rt184m=1 then time_acq_rt184m= dt_acq_rt184m-infection;
	time_acq_rtm    = caldate&j -infection; if acq_rtm=1     then time_acq_rtm   = dt_acq_rtm   -infection;

	if time_from_infection=0.25 then do;
		acq_rt65m_3_prep =c_rt65m; acq_rt184m_3_prep=c_rt184m; acq_rtm_3_prep=rm_;
	end;
	else if time_from_infection=0.5 then do;
		acq_rt65m_6_prep =c_rt65m; acq_rt184m_6_prep=c_rt184m; acq_rtm_6_prep=rm_;
	end;
	else if time_from_infection=0.75 then do;
		acq_rt65m_9_prep =c_rt65m; acq_rt184m_9_prep=c_rt184m; acq_rtm_9_prep=rm_;
	end;
	else if time_from_infection=1 then do;
		acq_rt65m_12_prep =c_rt65m; acq_rt184m_12_prep=c_rt184m; acq_rtm_12_prep=rm_;
	end;
	else if time_from_infection=1.5 then do;
		acq_rt65m_18_prep =c_rt65m; acq_rt184m_18_prep=c_rt184m; acq_rtm_18_prep=rm_;
	end;

	if time_from_infection=0.25 then onprep_3_i_prep_no_r=prep;
	if time_from_infection=0.5  then onprep_6_i_prep_no_r=prep;
	if time_from_infection=0.75 then onprep_9_i_prep_no_r=prep;
	if time_from_infection=1.0  then onprep_12_i_prep_no_r=prep;
	if time_from_infection=1.5  then onprep_18_i_prep_no_r=prep;

end;

*Adherence to PrEP at time of infection;
if caldate&j = infection > . then do;


* ts1m: note that when ts1m primary infection lasts 1 month ;
inf_prep_adhg80 =0;	if prep=1 and        adh gt 0.8	then inf_prep_adhg80 =primary;
inf_prep_adh5080=0;	if prep=1 and 0.5 lt adh le 0.8	then inf_prep_adh5080=primary;
inf_prep_adhl50 =0;	if prep=1 and  .  lt adh le 0.5	then inf_prep_adhl50 =primary;
end;
*Adherence to PrEP;
prep_adhg80 =0;	if prep=1 and        adh gt 0.8	then prep_adhg80 =1;
prep_adh5080=0;	if prep=1 and 0.5 lt adh le 0.8	then prep_adh5080=1;
prep_adhl50 =0;	if prep=1 and  .  lt adh le 0.5	then prep_adhl50 =1;

*To calculate proportion of people on PrEP;
onprep_1549=0; onprep_m=0; onprep_w=0; onprep_sw=0; onprep_1524=0; onprep_1524w=0;
if prep=1 then do;
	if (15<=age<49) then onprep_1549=1;
	if gender=1 and (15<=age<49) then onprep_m=1;
	if gender=2 and (15<=age<49) then onprep_w=1;
	if sw=1 then onprep_sw=1;
	if (15<=age<25) then onprep_1524=1;
	if gender=2 and (15<=age<25) then onprep_1524w=1;
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

if 15 le age lt 50 then tested1549_=tested;
if gender=1 and 15 le age lt 50 then tested1549m=tested;
if gender=2 and 15 le age lt 50 then tested1549w=tested;


***Access to being  tested given some are hard to reach;
acc_test=0;acc_test_1524_=0;acc_test_2549_=0;acc_test_5064_=0;acc_test_sw=0;
if hard_reach=0 then do;
	acc_test=1;
	if 15 le age lt 25 then acc_test_1524_=1;
	if 25 le age lt 50 then acc_test_2549_=1;
	if 50 le age lt 65 then acc_test_5064_=1;
	if sw=1 	     then acc_test_sw=1;
end;

* ts1m:  this is last 4 periods so 4 months if time step 1 month;
tested_4p_m1549_=0; tested_4p_m1519_=0; tested_4p_m2024_=0; tested_4p_m2529_=0;tested_4p_m3039_=0; tested_4p_m4049_=0; tested_4p_m5064_=0;
tested_4p_w1549_=0; tested_4p_w1519_=0; tested_4p_w2024_=0; tested_4p_w2529_=0;tested_4p_w3039_=0; tested_4p_w4049_=0; tested_4p_w5064_=0; 
tested_4p_sw=0;

if t ge 4 and (tested=1 or tested_tm1=1 or tested_tm2=1 or tested_tm3=1) then do;
	if gender=1 then do;
		if 15 le age lt 50 then tested_4p_m1549_=1; 
		if 15 le age lt 20 then tested_4p_m1519_=1; 
		if 20 le age lt 25 then tested_4p_m2024_=1;
		if 25 le age lt 30 then tested_4p_m2529_=1;
		if 30 le age lt 40 then tested_4p_m3039_=1;
		if 40 le age lt 50 then tested_4p_m4049_=1;
		if 50 le age lt 65 then tested_4p_m5064_=1;
	end;
	else if gender=2 then do;
		if 15 le age lt 50 then tested_4p_w1549_=1;
		if 15 le age lt 20 then tested_4p_w1519_=1;
		if 20 le age lt 25 then tested_4p_w2024_=1;
		if 25 le age lt 30 then tested_4p_w2529_=1;
		if 30 le age lt 40 then tested_4p_w3039_=1;
		if 40 le age lt 50 then tested_4p_w4049_=1;
		if 50 le age lt 65 then tested_4p_w5064_=1;
		if sw=1       		 then tested_4p_sw=1;

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
onart_m6569_=0;onart_m7074_=0;onart_m7579_=0;onart_m8084_=0;onart_m85pl_=0;
onart_w1549_=0;onart_w1564_=0;
onart_w1519_=0;onart_w2024_=0;onart_w2529_=0;onart_w3034_=0;onart_w3539_=0;onart_w4044_=0;onart_w4549_=0;onart_w5054_=0;onart_w5559_=0;onart_w6064_=0; 
onart_w6569_=0;onart_w7074_=0;onart_w7579_=0;onart_w8084_=0;onart_w85pl_=0; 
onart_sw=0; 	

if gender=1 then do;
	if      15 le age lt 50 then do; ever_tested_m1549_=ever_tested; diag_m1549_=registd;  onart_m1549_=onart; end;
	if      15 le age lt 65 then do; ever_tested_m1564_=ever_tested; diag_m1564_=registd;  onart_m1564_=onart; end;
	if      15 le age lt 20 then do; ever_tested_m1519_=ever_tested; diag_m1519_=registd;  onart_m1519_=onart; end;
	else if 20 le age lt 25 then do; ever_tested_m2024_=ever_tested; diag_m2024_=registd;  onart_m2024_=onart; end;
	else if 25 le age lt 30 then do; ever_tested_m2529_=ever_tested; diag_m2529_=registd;  onart_m2529_=onart; end;
	else if 30 le age lt 35 then do; ever_tested_m3034_=ever_tested; diag_m3034_=registd;  onart_m3034_=onart; end;
	else if 35 le age lt 40 then do; ever_tested_m3539_=ever_tested; diag_m3539_=registd;  onart_m3539_=onart; end;
	else if 40 le age lt 45 then do; ever_tested_m4044_=ever_tested; diag_m4044_=registd;  onart_m4044_=onart; end;
	else if 45 le age lt 50 then do; ever_tested_m4549_=ever_tested; diag_m4549_=registd;  onart_m4549_=onart; end;
	else if 50 le age lt 55 then do; ever_tested_m5054_=ever_tested; diag_m5054_=registd;  onart_m5054_=onart; end;
	else if 55 le age lt 60 then do; ever_tested_m5559_=ever_tested; diag_m5559_=registd;  onart_m5559_=onart; end;
	else if 60 le age lt 65 then do; ever_tested_m6064_=ever_tested; diag_m6064_=registd;  onart_m6064_=onart; end;
	else if 65 le age lt 70 then do; diag_m6569_=registd;  onart_m6569_=onart; end;
	else if 70 le age lt 75 then do; diag_m7074_=registd;  onart_m7074_=onart; end;
	else if 75 le age lt 80 then do; diag_m7579_=registd;  onart_m7579_=onart; end;
	else if 80 le age lt 85 then do; diag_m8084_=registd;  onart_m8084_=onart; end;
	else if 85 le age       then do; diag_m85pl_=registd;  onart_m85pl_=onart; end;
end;
else if gender=2 then do;
	if      15 le age lt 50 then do; ever_tested_w1549_=ever_tested; diag_w1549_=registd;  onart_w1549_=onart; end;
	if      15 le age lt 65 then do; ever_tested_w1564_=ever_tested; diag_w1564_=registd;  onart_w1564_=onart; end;
	if      15 le age lt 20 then do; ever_tested_w1519_=ever_tested; diag_w1519_=registd;  onart_w1519_=onart; end;
	else if 20 le age lt 25 then do; ever_tested_w2024_=ever_tested; diag_w2024_=registd;  onart_w2024_=onart; end;
	else if 25 le age lt 30 then do; ever_tested_w2529_=ever_tested; diag_w2529_=registd;  onart_w2529_=onart; end;
	else if 30 le age lt 35 then do; ever_tested_w3034_=ever_tested; diag_w3034_=registd;  onart_w3034_=onart; end;
	else if 35 le age lt 40 then do; ever_tested_w3539_=ever_tested; diag_w3539_=registd;  onart_w3539_=onart; end;
	else if 40 le age lt 45 then do; ever_tested_w4044_=ever_tested; diag_w4044_=registd;  onart_w4044_=onart; end;
	else if 45 le age lt 50 then do; ever_tested_w4549_=ever_tested; diag_w4549_=registd;  onart_w4549_=onart; end;
	else if 50 le age lt 55 then do; ever_tested_w5054_=ever_tested; diag_w5054_=registd;  onart_w5054_=onart; end;
	else if 55 le age lt 60 then do; ever_tested_w5559_=ever_tested; diag_w5559_=registd;  onart_w5559_=onart; end;
	else if 60 le age lt 65 then do; ever_tested_w6064_=ever_tested; diag_w6064_=registd;  onart_w6064_=onart; end;
	else if 65 le age lt 70 then do; diag_w6569_=registd;  onart_w6569_=onart; end;
	else if 70 le age lt 75 then do; diag_w7074_=registd;  onart_w7074_=onart; end;
	else if 75 le age lt 80 then do; diag_w7579_=registd;  onart_w7579_=onart; end;
	else if 80 le age lt 85 then do; diag_w8084_=registd;  onart_w8084_=onart; end;
	else if 85 le age       then do; diag_w85pl_=registd;  onart_w85pl_=onart; end;
	if sw = 1 		   then do;  ever_tested_sw   =ever_tested; diag_sw   =registd; onart_sw   =onart;vs_sw=vl1000; end;
	if sw ne 1           then      ever_tested_sw=0;
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

	if 15 le age lt 50 then do; pregnant_w1549=1; hiv_pregn_w1549_=1; if anc=1 then do; w1549_anc=1;tested_w1549_anc=tested; hiv_w1549_anc=hiv;end;end;
	if 15 le age lt 25 then do; pregnant_w1524=1; hiv_pregn_w1524_=1; if anc=1 then do; w1524_anc=1;tested_w1524_anc=tested; hiv_w1524_anc=hiv;end;end;
	if 15 le age lt 20 then do; pregnant_w1519=1; 				   if anc=1 then do; 			 tested_w1519_anc=tested; hiv_w1519_anc=hiv;end;end;
	if 20 le age lt 25 then do; pregnant_w2024=1; 				   if anc=1 then do; 			 tested_w2024_anc=tested; hiv_w2024_anc=hiv;end;end;
	if 25 le age lt 30 then do; pregnant_w2529=1; 				   if anc=1 then do; 			 tested_w2529_anc=tested; hiv_w2529_anc=hiv;end;end;
	if 30 le age lt 35 then do; pregnant_w3034=1; 				   if anc=1 then do; 			 tested_w3034_anc=tested; hiv_w3034_anc=hiv;end;end;
	if 35 le age lt 40 then do; pregnant_w3539=1; 				   if anc=1 then do; 			 tested_w3539_anc=tested; hiv_w3539_anc=hiv;end;end;
	if 40 le age lt 45 then do; pregnant_w4044=1; 				   if anc=1 then do; 			 tested_w4044_anc=tested; hiv_w4044_anc=hiv;end;end;
	if 45 le age lt 50 then do; pregnant_w4549=1; 				   if anc=1 then do; 			 tested_w4549_anc=tested; hiv_w4549_anc=hiv;end;end;
	if 50 le age lt 65 then do; pregnant_w50pl=1; 				   if anc=1 then do; 			 tested_w5064_anc=tested; hiv_w5064_anc=hiv;end;end;
end;

hiv_pregnant=0; if pregnant=1 and hiv=1 then hiv_pregnant=1;
hiv_anc=0;      if anc=1      and hiv=1 then hiv_anc=1;

pmtct=0;if pregnant=1 and (on_sd_nvp=1 or on_dual_nvp=1 or . lt time0 le caldate&j) then pmtct=1;


***Deaths;
if gender=1 then do;
	dead_m=dead  ;
	if 15 <= age < 20 then dead1519m_all=dead;
	if 20 <= age < 25 then dead2024m_all=dead;
	if 25 <= age < 30 then dead2529m_all=dead;
	if 30 <= age < 35 then dead3034m_all=dead;
	if 35 <= age < 40 then dead3539m_all=dead;
	if 40 <= age < 45 then dead4044m_all=dead;
	if 45 <= age < 50 then dead4549m_all=dead;
end;
if gender=2 then do;
	dead_w=dead;
	if 15 <= age < 20 then dead1519w_all=dead;
	if 20 <= age < 25 then dead2024w_all=dead;
	if 25 <= age < 30 then dead2529w_all=dead;
	if 30 <= age < 35 then dead3034w_all=dead;
	if 35 <= age < 40 then dead3539w_all=dead;
	if 40 <= age < 45 then dead4044w_all=dead;
	if 45 <= age < 50 then dead4549w_all=dead;
end;

if 15 <= age < 65 then dead1564_all=dead;
if gender=1 and 15 <= age < 65 then dead1564m_all=dead;
if gender=2 and 15 <= age < 65 then dead1564w_all=dead;

death_hivrel=0; if caldate&j = death > . and dcause=1 then death_hivrel=dead;

death_dcause3 = 0; if caldate&j = death > . and dcause=3 then death_dcause3 = dead ;

per1_art_int = 0; per2_art_int = 0; dead_per1_art_int = 0; dead_per2_art_int = 0;
cd4_before_int = .; cd4_before_int_lt100 = .; cd4_before_int_100200 = .; 
cd4_per1_art_int=.; cd4_per1_art_int_lt100=.; cd4_per1_art_int_100200=.;
cd4_per2_art_int=.; cd4_per2_art_int_lt100=.; cd4_per2_art_int_100200=.;

if onart_tm1 = 1 and onart = 0 then per1_art_int = 1;
if onart_tm2 = 1 and onart_tm1 = 0 and onart = 0 then per2_art_int = 1;
if per1_art_int = 1 then do;
	dead_per1_art_int = 0; if dead=1 then dead_per1_art_int =1;
	cd4_before_int = cd4_tm1; cd4_per1_art_int = cd4;
	if . < cd4_before_int < 100 then cd4_before_int_lt100=1; if 100 <= cd4_before_int < 200 then cd4_before_int_100200=1;   
	if . < cd4_per1_art_int < 100 then cd4_per1_art_int_lt100=1; 
	if 100 <= cd4_per1_art_int < 200 then cd4_per1_art_int_100200=1;   
end;
if per2_art_int = 1 then do;
	dead_per2_art_int = 0; if dead=1 then dead_per2_art_int =1;
	cd4_per2_art_int = cd4;
	if . < cd4_per2_art_int < 100 then cd4_per2_art_int_lt100=1; 
	if 100 <= cd4_per2_art_int < 200 then cd4_per2_art_int_100200=1;  
end;



***Utilities;
cur_efa_cns_tox=0; if o_efa and c_cns=1 then cur_efa_cns_tox=1;
cur_dol_cns_tox=0; if o_dol and c_cns=1 then cur_dol_cns_tox=1;

if 15 <= age < 65 then do;
util=1; * these in order ;
if c_tox=1 then util=util_tox;
if cur_efa_cns_tox=1 then util=min(util,util_cns_efa_tox);
if cur_dol_cns_tox=1 then util=min(util,util_cns_dol_tox); * cant be on both efa and dol;
if who3_event  =1 and tb  =0 then util=util_who3;
if t ge 2 and (0 <= (caldate&j - date_most_recent_tb) < 0.5) then util=util_tb;
if adc=1 then util=util_adc;
* ts1m:  note that disability due to adc, who3 etc will only last 1 month when time step is 1 month ;
end;


*** VF according to line of ART;
if line2=1 and line3 ne 1 then startedline2=1;

line1_lf0=0; if artline=1 and linefail=0 then line1_lf0 =1;
line1_lf1=0; if artline=1 and linefail=1 then line1_lf1 =1; line2_lf1=0; if artline=2 and linefail=1 then line2_lf1 =1;
line2_lf2=0; if artline=2 and linefail=2 then line2_lf2 =1; artexpoff=0; if naive=0 and onart=0 and int_clinic_not_aw ne 1 then artexpoff =1;
line1_vlg1000=0; if artline=1 and vl1000=0 then line1_vlg1000=1;line2_vlg1000=0; if artline=2 and vl1000=0 then line2_vlg1000=1;

line1_=0; if artline=1 then line1_ =1;
line2_=0; if artline=2 then line2_ =1;
line3_=0; if artline=3 then line3_ =1;

*** On ART with ADC / CD4<200 / resistance;
onart_adc=0; if onart=1 and adc=1 then onart_adc=1;
onart_cl200=0; if onart=1 and cl200=1 then onart_cl200=1;
onart_iicu_res=0; if (onart=1  or int_clinic_not_aw=1) and rm_=1 then onart_iicu_res=1;
onart_res=0; if onart=1 and rm_=1 then onart_res=1;

*** On ART for >6m with resistance;
onart_gt6m_nnres_vlg1000=0; if ((onart=1 and tcur ge 0.5) or int_clinic_not_aw=1) and vl1000=0 and (c_rt103m=1 or c_rt181m=1 or c_rt190m=1)  and caldate&j ge yrart+0.5 > .
then onart_gt6m_nnres_vlg1000=1;
onart_gt6m_pires_vlg1000=0; if ((onart=1 and tcur ge 0.5) or int_clinic_not_aw=1) and vl1000=0 and (c_pr32m=1 or c_pr33m=1 
or c_pr46m=1 or c_pr47m=1 or c_pr50vm=1 or c_pr50lm=1 or c_pr54m=1  or c_pr76m=1 or c_pr82m=1 or c_pr84m=1 or c_pr88m=1 
or c_pr90m=1)  and caldate&j ge yrart+0.5 > . then onart_gt6m_pires_vlg1000=1; 
onart_gt6m_res_vlg1000=0; if ((onart=1 and tcur ge 0.5) or int_clinic_not_aw=1) and vl1000=0 and rm_=1  and caldate&j ge yrart+0.5  > . then onart_gt6m_res_vlg1000=1;

***Adherence;
adh_low=.; adh_med=.; adh_hi=.;
if onart=1 or int_clinic_not_aw=1 then do; 
adh_low=0; if adh < 0.5 or int_clinic_not_aw=1 then adh_low=1; adh_med=0; if 0.5 <= adh < 0.8 then adh_med=1; adh_hi=0; if 0.8 <= adh then adh_hi=1;
end;
adhav_low_onart=.;  if . < adhav < 0.5 and onart=1 then adhav_low_onart=1;
adhav_hi_onart=.;  if 0.8 <= adhav and onart=1 then adhav_hi_onart=1;

* adh level by gender - apr 19 ;
adh_low_w=.; adh_med_w=.; adh_hi_w=.;
if gender=2 and (onart=1 or int_clinic_not_aw=1) then do; 
adh_low_w=0; if adh < 0.5 or int_clinic_not_aw=1 then adh_low_w=1; 
adh_med_w=0; if 0.5 <= adh < 0.8 then adh_med_w=1; 
adh_hi_w=0; if 0.8 <= adh then adh_hi_w=1;
end;

* adh level by gender - apr 19 ;
adh_low_m=.; adh_med_m=.; adh_hi_m=.;
if gender=1 and (onart=1 or int_clinic_not_aw=1) then do; 
adh_low_m=0; if adh < 0.5 or int_clinic_not_aw=1 then adh_low_m=1; 
adh_med_m=0; if 0.5 <= adh < 0.8 then adh_med_m=1; 
adh_hi_m=0; if 0.8 <= adh then adh_hi_m=1;
end;


* regimen on;

tle=0;  if o_efa=1 and o_ten=1 and o_3tc=1 and nod=3 then tle=1;
tld=0;  if o_dol=1 and o_ten=1 and o_3tc=1 and nod=3 then tld=1;
zld=0;  if o_dol=1 and o_zdv=1 and o_3tc=1 and nod=3 then zld=1;
zla=0;  if o_taz=1 and o_zdv=1 and o_3tc=1 and nod=3 then zla=1;
if onart=1 then do;
otherreg=0; if tle ne 1 and tld ne 1 and zld ne 1 and zla ne 1 then  otherreg=1;
end;


no_recent_vm_gt1000_dol=0; no_recent_vm_gt1000_efa=0;  
if no_recent_vm_gt1000=1 and o_dol=1 then no_recent_vm_gt1000_dol=1;
if no_recent_vm_gt1000=1 and o_efa=1 then no_recent_vm_gt1000_efa=1;

recent_vm_gt1000_dol=0;recent_vm_gt1000_efa=0; recent_vm_gt1000_zdv=0; 
if recent_vm_gt1000=1 and o_dol=1 then recent_vm_gt1000_dol=1;
if recent_vm_gt1000=1 and o_efa=1 then recent_vm_gt1000_efa=1;
if recent_vm_gt1000=1 and o_zdv=1 then recent_vm_gt1000_zdv=1;


* toxicity and adherence by drug ;

o_zdv_tox = 0; if o_zdv = 1 and c_tox = 1 then o_zdv_tox = 1;
o_3tc_tox = 0; if o_3tc = 1 and c_tox = 1 then o_3tc_tox = 1;
o_ten_tox = 0; if o_ten = 1 and c_tox = 1 then o_ten_tox = 1;
o_taz_tox = 0; if o_taz = 1 and c_tox = 1 then o_taz_tox = 1;
o_lpr_tox = 0; if o_lpr = 1 and c_tox = 1 then o_lpr_tox = 1;
o_efa_tox = 0; if o_efa = 1 and c_tox = 1 then o_efa_tox = 1;
o_nev_tox = 0; if o_nev = 1 and c_tox = 1 then o_nev_tox = 1;
o_dol_tox = 0; if o_dol = 1 and c_tox = 1 then o_dol_tox = 1;
o_tle_tox = 0; if tle = 1 and c_tox = 1 then o_tle_tox = 1;
o_tld_tox = 0; if tld = 1 and c_tox = 1 then o_tld_tox = 1;
o_zld_tox = 0; if zld = 1 and c_tox = 1 then o_zld_tox = 1;
o_zla_tox = 0; if zla = 1 and c_tox = 1 then o_zla_tox = 1;

o_zdv_adh_hi = 0; if o_zdv = 1 and adh >= 0.8 then o_zdv_adh_hi = 1;
o_3tc_adh_hi = 0; if o_3tc = 1 and adh >= 0.8 then o_3tc_adh_hi = 1;
o_ten_adh_hi = 0; if o_ten = 1 and adh >= 0.8 then o_ten_adh_hi = 1;
o_taz_adh_hi = 0; if o_taz = 1 and adh >= 0.8 then o_taz_adh_hi = 1;
o_lpr_adh_hi = 0; if o_lpr = 1 and adh >= 0.8 then o_lpr_adh_hi = 1;
o_efa_adh_hi = 0; if o_efa = 1 and adh >= 0.8 then o_efa_adh_hi = 1;
o_nev_adh_hi = 0; if o_nev = 1 and adh >= 0.8 then o_nev_adh_hi = 1;
o_dol_adh_hi = 0; if o_dol = 1 and adh >= 0.8 then o_dol_adh_hi = 1;
o_tle_adh_hi = 0; if tle = 1 and adh >= 0.8 then o_tle_adh_hi = 1;
o_tld_adh_hi = 0; if tld = 1 and adh >= 0.8 then o_tld_adh_hi = 1;
o_zld_adh_hi = 0; if zld = 1 and adh >= 0.8 then o_zld_adh_hi = 1;
o_zla_adh_hi = 0; if zla = 1 and adh >= 0.8 then o_zla_adh_hi = 1;


* for dolswitch: this code below is so can compare adherence to zld to adherence to tld (ie adh to zdv vs ten) in people who switch to zld
with reg_option 116 (and dont switch with reg_option 104);
if caldate&j = date_start_zld_if_reg_op_116 then do;
start_zld_if_reg_op_116=1;
onart_start_zld_if_reg_op_116 = 0; if onart = 1 then onart_start_zld_if_reg_op_116 = 1;
e_rt65m_st_zld_if_reg_op_116 = 0; if e_rt65m = 1 and onart_start_zld_if_reg_op_116 = 1 then e_rt65m_st_zld_if_reg_op_116 = 1;
end;
a_zld_if_reg_op_116 = 0; adh_hi_a_zld_if_reg_op_116 = 0; nac_ge2p75_a_zld_if_reg_op_116 = 0; n_zld_if_reg_op_116 = 0;
nac_ge2p00_a_zld_if_reg_op_116 = 0;nac_ge1p50_a_zld_if_reg_op_116 = 0;
if caldate&j >= date_start_zld_if_reg_op_116 > . and adh > . then a_zld_if_reg_op_116 = 1;
if caldate&j >= date_start_zld_if_reg_op_116 > . and onart_start_zld_if_reg_op_116 = 1 then n_zld_if_reg_op_116 = 1;
* note when sum below s_x_n_zld_if_reg_op_116 includes those who died since date_start_zld_if_reg_op_116 ;
if a_zld_if_reg_op_116 = 1 and adh > 0.8 then adh_hi_a_zld_if_reg_op_116 = 1; 
if a_zld_if_reg_op_116 = 1 and nactive >= 2.75 then nac_ge2p75_a_zld_if_reg_op_116 = 1; 
if a_zld_if_reg_op_116 = 1 and nactive >= 2.00 then nac_ge2p00_a_zld_if_reg_op_116 = 1; 
if a_zld_if_reg_op_116 = 1 and nactive >= 1.50 then nac_ge1p50_a_zld_if_reg_op_116 = 1; 

*Discounting from 2020 (125th step); * 3%;  * dependent_on_time_step_length ;         
d=&j;  
discount = (0.9924141173)**(d-125);
* ts1m:  discount = (0.9974649513861632)**(d-(125*3));


_ly=.; _dly=.; _qaly=.; _dqaly=.;_cost_=.; _dcost_=.;_dcost_onart_=.;
if 15 <= age < 65 then do;
_ly = 0.25 ; _dly = discount*0.25;  _qaly = 0.25*util ; _dqaly = 0.25*discount*util ; 
/* 
* ts1m:  replace line above with :
_ly = 1/12 ; _dly = discount*(1/12);  _qaly = (1/12)*util ; _dqaly = (1/12)*discount*util ; 
*/
_cost_ = cost ; 
_dcost_ = cost*discount ; 
end;

dead_daly=.; dead_ddaly=.;live_daly=.;  live_ddaly=.; age_would_be_now =.;
if 15 <= age < 65 then do;  
live_ddaly = (1 - util)*0.25*discount; 
live_daly = (1 - util)*0.25; end;
/* 
ts1m: replace two lines above with:
live_ddaly = (1 - util)*(1/12)*discount; 
live_daly = (1 - util)*(1/12); end;
*/
if age ge 65 then do; live_daly=0;  live_ddaly=0;  end;
	if death >= 1993 then do;
		age_would_be_now = (agedeath + (caldate_never_dot - death));
		dead_daly=0; dead_ddaly=0;
		if . < death < caldate_never_dot and 15 <= age_would_be_now < 65 then do;	
		dead_ddaly = 0.25*discount; dead_daly = 0.25;    
/* 
ts1m: replace line above with:
dead_ddaly = (1/12)*discount; dead_daly = (1/12);  
*/
	end;
end;


dead_daly_80=.; dead_ddaly_80=.;live_daly_80=.;  live_ddaly_80=.; age_would_be_now =.;
if 15 <= age < 80 then do;  
live_ddaly_80 = (1 - util)*0.25*discount; 
live_daly_80 = (1 - util)*0.25; end;
if age ge 80 then do; live_daly_80=0;  live_ddaly_80=0;  end;
	if death >= 1993 then do;
		age_would_be_now = (agedeath + (caldate_never_dot - death));
		dead_daly_80=0; dead_ddaly_80=0;
		if . < death < caldate_never_dot and 15 <= age_would_be_now < 80 then do;	
		dead_ddaly_80 = 0.25*discount; dead_daly_80 = 0.25;    
	end;
end;


_dart_cost = art_cost*discount ;
_donart_cost = cost_onart*discount ;
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

_d_t_adh_int_cost = t_adh_int_cost *discount;
_dpi_cost=pi_cost*discount;
_dcost_circ = cost_circ*discount;
_dcost_condom_dn = cost_condom_dn*discount;
_dcost_sw_program = cost_sw_program*discount;
_dcost_switch_line = cost_switch_line*discount;
_dcost_child_hiv = cost_child_hiv*discount;
_dcost_child_hiv_mo_art = cost_child_hiv_mo_art*discount;
_dcost_prep = cost_prep*discount;
_dcost_prep_ac_adh = cost_prep_ac_adh*discount;
_dcost_prep_visit = cost_prep_visit*discount;
_dcost_art_init = cost_art_init*discount;
_dcost_drug_level_test = drug_level_test_cost*discount;

_dcost_non_aids_pre_death = non_aids_pre_death_cost*discount;

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
tested_m=0; if gender=1 and tested=1 then tested_m=1;
tested_m_sympt=0; if gender=1 and tested=1 and (elig_test_who4_tested=1 or elig_test_who3_tested=1 or elig_test_tb_tested=1 or tested_symptoms_not_hiv=1)
then tested_m_sympt=1;
tested_m_circ=0; if gender=1 and tested=1 and tested_circ=1 then tested_m_circ=1;
* allocation of tests in women 1 anc  2 symptoms  3  sw;
tested_f=0; if gender=2 and tested=1 then tested_f=1;
tested_f_anc=0; if gender=2 and tested=1 and tested_anc = 1 then tested_f_anc=1;
tested_f_sympt=0; if gender=2 and tested=1 and (elig_test_who4_tested=1 or elig_test_who3_tested=1 or elig_test_tb_tested=1 or tested_symptoms_not_hiv=1)
and tested_anc ne 1 then tested_f_sympt=1;
tested_f_sw=0; if gender=2 and tested=1 and tested_as_sw=1 and tested_anc ne 1 and
(elig_test_who4_tested ne 1 and elig_test_who3_tested ne 1 and elig_test_tb_tested ne 1 and tested_symptoms_not_hiv ne 1) then tested_f_sw=1;
tested_f_non_anc=0; if gender=2 and tested=1 and tested_anc ne 1 then tested_f_non_anc=1;

***Changed from max(c_rt103m, c_rt181m, c_rt190m) to max(c_rt103m_inf, c_rt181m_inf, c_rt190m_inf).
   Previously, pregnant women who attend ANC could be diagnosed and develop NVP resistance within the same time period and hence
   would have been included below. Mutations now are at infection to counter this;

nn_tdr_diag=0;if caldate&j = date1pos > . then do; if max(c_rt103m_inf, c_rt181m_inf, c_rt190m_inf)=1 then nn_tdr_diag=1; end;

*** Failed >=1 line;
linefail_ge1=0; if linefail ge 1 then linefail_ge1=1;

*** Viral suppression achieved after VL>1000;
if caldate&j = date_v_alert + 0.5 > . and (onart=1 or int_clinic_not_aw=1) then do; 
	m6_after_alert=1; m6_after_alert_vl1000=0;
	if . < vl < 3 then m6_after_alert_vl1000=1;   
end;


*** CD4 at ART start and at diagnosis;
cd4art_started_this_period=0; if yrart=caldate&j then cd4art_started_this_period=cd4art;
cd4diag_diag_this_period=0; if date1pos=caldate&j then cd4diag_diag_this_period=cd4diag;

*** Number of active drugs at start of ART;
if yrart=caldate&j then nactive_art=nactive;

pre_art_care=0;
if visit=1 and naive=1 then pre_art_care=1;


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
status_death_hr_g=.;death_hiv=.;death_hiv_m=.;death_hiv_w=.;sdg_hr_1=.;sdg_hr_2=.;sdg_hr_3=.;sdg_hr_4=.;sdg_hr_5=.;sdg_hr_6=.;sdg_hr_7=.;sdg_hr_8=.;sdg_hr_9=.;sdg_hr_99=.;
if hiv=1 and caldate&j=death and dead1564_ = 1 and rdcause=1 then do;
death_hiv=1;if gender=1 then death_hiv_m=1;if gender=2 then death_hiv_w=1;
status_death_hr_g=99;
if t ge 2 and registd_tm1 ne 1 then status_death_hr_g=1;
if t ge 2 and registd_tm1=1 and linked_to_care ne 1 then status_death_hr_g=2;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive=1 and visit ne 1 then status_death_hr_g=3;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive=1 and visit=1 then status_death_hr_g=4;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive ne 1 and visit ne 1 then status_death_hr_g=5;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive ne 1 and visit=1 then status_death_hr_g=6;
if (onart=1 or int_clinic_not_aw=1) and linefail ne 1 then  status_death_hr_g=7;
if (onart=1 or int_clinic_not_aw=1) and linefail = 1 and line2 ne 1 then  status_death_hr_g=8;
if (onart=1 or int_clinic_not_aw=1) and linefail = 1 and line2 = 1 then  status_death_hr_g=9;

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
if hiv=1 and caldate&j=death and dead1564_ = 1 then do;
status_death_g=99;
if t ge 2 and registd_tm1 ne 1 then status_death_g=1;
if t ge 2 and registd_tm1=1 and linked_to_care ne 1 then status_death_g=2;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive=1 and visit ne 1 then status_death_g=3;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive=1 and visit=1 then status_death_g=4;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive ne 1 and visit ne 1 then status_death_g=5;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive ne 1 and visit=1 then status_death_g=6;
if (onart=1 or int_clinic_not_aw=1) and linefail ne 1 then  status_death_g=7;
if (onart=1 or int_clinic_not_aw=1) and linefail = 1 and line2 ne 1 then  status_death_g=8;
if (onart=1 or int_clinic_not_aw=1) and linefail = 1 and line2 = 1 then  status_death_g=9;

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

if hiv=1 then do;

status_g=99;
if t ge 2 and registd_tm1 ne 1 then status_g=1;
if t ge 2 and registd_tm1=1 and linked_to_care ne 1 then status_g=2;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive=1 and visit ne 1 then status_g=3;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive=1 and visit=1 then status_g=4;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive ne 1 and visit ne 1 then status_g=5;
if t ge 2 and registd_tm1=1 and linked_to_care = 1 and naive ne 1 and visit=1 then status_g=6;
if (onart=1 or int_clinic_not_aw=1) and linefail ne 1 then  status_g=7;
if (onart=1 or int_clinic_not_aw=1) and linefail = 1 and line2 ne 1 then  status_g=8;
if (onart=1 or int_clinic_not_aw=1) and linefail = 1 and line2 = 1 then  status_g=9;

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


*** Dead in period in which ART was started;
dead_art_1p = .; if caldate&j=yrart and yrart=death then dead_art_1p = 1;

*** First test this period;
firsttest=0; if caldate&j=date1test > . then firsttest=1;

*** Naive by gender;
if naive=1 and gender=1 then naive_m=1;
if naive=1 and gender=2 then naive_w=1;

*** Number of partners >2 / >10;
npge2=0; if np ge 2 then npge2=1;
npge10=0; if np ge 10 then npge10=1;

*** Prep code;
prep_newp=.;
prep_newpg0 = 0;prep_newpg1 = 0;prep_newpg2 = 0;prep_newpg3 = 0;prep_newpg4 = 0;
if prep=1 then do;
prep_newp = newp; 
if newp  =0 then prep_newpg0 = 1;
if newp  =1 then prep_newpg1 = 1;
if newp  =2 then prep_newpg2 = 1;
if 3 <= newp < 10 then prep_newpg3 = 1;
if 10 <= newp then prep_newpg4 = 1;
end;

newp_this_per_age1524w_onprep=.; newp_this_per_age1524w=.;prep_ever_w_1524=.;
if gender=2 and 15 <= age < 25 and newp ge 1 then do;
prep_ever_w_1524=0;
if prep_ever=1 then prep_ever_w_1524=1;
newp_this_per_age1524w=1;
if prep=1 then newp_this_per_age1524w_onprep=1;
if prep ne 1 then newp_this_per_age1524w_onprep=0;
end;

newp_this_per_art_or_prep=0;   newp_this_per_art=0;   newp_this_per_prep=0;  newp_this_per_prep_sw=0;  
newp_this_per_elig_prep=0;  newp_this_per_elig_prep_sw=0;  newp_this_per_hivneg = 0; newp_this_per_hivneg_1549=0; newp_this_per_1549=0;
newp_this_per=0; if newp ge 1 then newp_this_per=1;
if newp_this_per=1 then do;
	if onart=1 then newp_this_per_art=1;
	if prep=1 then newp_this_per_prep=1;
	if sw=1 and prep=1 then newp_this_per_prep_sw=1;
	if prep=1 or onart=1 then newp_this_per_art_or_prep=1;
	if prep_elig = 1 then newp_this_per_elig_prep=1; 
	if sw=1 and prep_elig = 1 then newp_this_per_elig_prep_sw=1; 
	if hiv ne 1 then newp_this_per_hivneg=1;
	if hiv ne 1 and 15 <= age < 50 then newp_this_per_hivneg_1549=1;
	if 15 <= age < 50 then newp_this_per_1549=1;
end;

newp_hivneg=0;
if hiv ne 1 then newp_hivneg = max(newp,0);


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
if vl >= log10(1000) and ((onart=1 and tcur ge 0.5) or int_clinic_not_aw=1) then vlg1000_onart=1;
if vl >= log10(1000) and c_rt184m=1 then vlg1000_184m=1;
if vl >= log10(1000) and c_rt65m=1 then vlg1000_65m=1;
if vl >= log10(1000) and ((onart=1 and tcur ge 0.5) or int_clinic_not_aw=1) and c_rt184m=1 then vlg1000_onart_184m=1;
if vl >= log10(1000) and ((onart=1 and tcur ge 0.5) or int_clinic_not_aw=1) and c_rt65m=1 then vlg1000_onart_65m=1;

ontle=0; vlg1000_ontle=0; vlg1000_65m_ontle=0; vlg1000_184m_ontle=0; vlg1000_nnm_ontle=0; vlg1000_tams_ontle=0;
if (onart=1 and tcur ge 0.5 and o_efa=1 and o_ten=1 and o_3tc = 1) then do;
	ontle=1;
	if vl >= log10(1000) then do;
		vlg1000_ontle=1;
		if c_rt184m=1 then vlg1000_184m_ontle=1;
		if c_rt65m=1 then vlg1000_65m_ontle=1;
		if c_rttams ge 1 then vlg1000_tams_ontle=1;
		if nnm_=1 then vlg1000_nnm_ontle=1;
	end;
end;

ontld=0; vlg1000_ontld=0; vlg1000_65m_ontld=0; vlg1000_184m_ontld=0;  vlg1000_nnm_ontld=0; vlg1000_inm_ontld=0; vlg1000_tams_ontld=0;
if (onart=1 and tcur ge 0.5 and o_dol=1 and o_ten=1 and o_3tc = 1) then do;
	ontld=1;
	if vl >= log10(1000) then do;
		vlg1000_ontld=1;
		if c_rt184m=1 then vlg1000_184m_ontld=1;
		if c_rt65m=1 then vlg1000_65m_ontld=1;
		if c_rttams ge 1 then vlg1000_tams_ontld=1;
		if nnm_=1 then vlg1000_nnm_ontld=1;
		if inm_=1 then vlg1000_inm_ontld=1;
	end;
end;

if time_to_65m = . and e_rt65m=1 then time_to_65m=caldate&j-infection; 
if time_to_184m = . and e_rt184m=1 then time_to_184m=caldate&j-infection; 

if hiv=1 and prep ne 1 and prep_tm1=1 then hiv_date_stop_prep=caldate&j;

if 15 <= age and hiv=1 and caldate&j ne . then do;

surv_65m = min(caldate&j-infection, time_to_65m);
m65_yn=0; if surv_65m = time_to_65m then m65_yn=1;

surv_184m = min(caldate&j-infection, time_to_184m);
m184_yn=0; if surv_184m = time_to_184m then m184_yn=1;

survaids = min(dateaids,tb_date,caldate&j) - infection;
aidsyn=0; if survaids=min(dateaids, tb_date)-infection > . then aidsyn=1; 

survwho34 = min(date_first_who3, tb_date, dateaids, caldate&j) - infection;
who34yn = 0; if survwho34=min(date_first_who3, tb_date, dateaids)-infection > . then who34yn =1; 

survcl200 = min(date_cd4_l200, caldate&j)  - infection;
cl200yn=0; if survcl200 = date_cd4_l200 - infection then cl200yn=1;

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
if newp = 0 then do; newp_g_m_0 = 1; n_newp_g_m_0 = newp; end;
if newp = 1 then do; newp_g_m_1 = 1; n_newp_g_m_1 = newp; end;
if 2 <= newp <= 3 then do; newp_g_m_2 = 1; n_newp_g_m_2 = newp; end;
if 4 <= newp < 10 then do; newp_g_m_3 = 1; n_newp_g_m_3 = newp; end;
if 10 <= newp <  30 then do; newp_g_m_4 = 1; n_newp_g_m_4 = newp; end;
if 30 <= newp < 100 then do; newp_g_m_5 = 1; n_newp_g_m_5 = newp; end;
if 100 <= newp       then do; newp_g_m_6 = 1; n_newp_g_m_6 = newp; end;
end;

newp_g_w_0 = .; newp_g_w_1 = .; newp_g_w_2 = .; newp_g_w_3 = .; newp_g_w_4 = .;newp_g_w_5 = .;newp_g_w_6 = .;
n_newp_g_w_0 = .; n_newp_g_w_1 = .; n_newp_g_w_2 = .; n_newp_g_w_3 = .; n_newp_g_w_4 = .;n_newp_g_w_5 = .;n_newp_g_w_6 = .;

if gender = 2 then do;
if newp = 0 then do; newp_g_w_0 = 1; n_newp_g_w_0 = newp; end;
if newp = 1 then do; newp_g_w_1 = 1; n_newp_g_w_1 = newp; end;
if 2 <= newp <= 3 then do; newp_g_w_2 = 1; n_newp_g_w_2 = newp; end;
if 4 <= newp < 10 then do; newp_g_w_3 = 1; n_newp_g_w_3 = newp; end;
if 10 <= newp <  30 then do; newp_g_w_4 = 1; n_newp_g_w_4 = newp; end;
if 30 <= newp < 100 then do; newp_g_w_5 = 1; n_newp_g_w_5 = newp; end;
if 100 <= newp       then do; newp_g_w_6 = 1; n_newp_g_w_6 = newp; end;
end;


newp_g_yw_0 = .; newp_g_yw_1 = .; newp_g_yw_2 = .; newp_g_yw_3 = .; newp_g_yw_4 = .;newp_g_yw_5 = .;newp_g_yw_6 = .;
n_newp_g_yw_0 = .; n_newp_g_yw_1 = .; n_newp_g_yw_2 = .; n_newp_g_yw_3 = .; n_newp_g_yw_4 = .;n_newp_g_yw_5 = .;n_newp_g_yw_6 = .;


if gender = 2 and 15 <= age < 25 then do;
if newp = 0 then do; newp_g_yw_0 = 1; n_newp_g_yw_0 = newp; end;
if newp = 1 then do; newp_g_yw_1 = 1; n_newp_g_yw_1 = newp; end;
if 2 <= newp <= 3 then do; newp_g_yw_2 = 1; n_newp_g_yw_2 = newp; end;
if 4 <= newp < 10 then do; newp_g_yw_3 = 1; n_newp_g_yw_3 = newp; end;
if 10 <= newp <  30 then do; newp_g_yw_4 = 1; n_newp_g_yw_4 = newp; end;
if 30 <= newp < 100 then do; newp_g_yw_5 = 1; n_newp_g_yw_5 = newp; end;
if 100 <= newp       then do; newp_g_yw_6 = 1; n_newp_g_yw_6 = newp; end;
end;


* number of np had by hiv-ve people (not counting those adherent on prep +/- those circumcised); 

if hiv ne 1 then do;
	if gender=1 and 15 <= age < 50 and (prep ne 1 or adh < 0.8) then do;  susc_np_1549_m = newp + ep;   end;
	if gender=1 and 15 <= age < 50 and (prep ne 1 or adh < 0.8) and mcirc   ne 1 then do;  susc_np_inc_circ_1549_m = newp + ep;   end;
	if gender=2 and 15 <= age < 50 and (prep ne 1 or adh < 0.8) then do;  susc_np_1549_w = newp + ep;   end;
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
    if rm_tm1=1 then _ai_naive_no_pmtct_c_r_=1;
    if nnm_tm1=1 then _ai_naive_no_pmtct_c_nnm_=1;
    if pim_tm1=1 then _ai_naive_no_pmtct_c_pim_=1;
    if inpm_tm1=1 or insm_=1 then _ai_naive_no_pmtct_c_inm_=1;
    if c_rt184m_tm2=1 then _ai_naive_no_pmtct_c_rt184m_=1;
    if c_rt65m_tm2=1 then _ai_naive_no_pmtct_c_rt65m_=1;
    if c_rttams_tm2 ge 1 then _ai_naive_no_pmtct_c_rttams_=1;
    if e_totmut   ge 1 then _ai_naive_no_pmtct_e_r_=1;
    if e_nnmut ge 1 then _ai_naive_no_pmtct_e_nnm_=1;
    if e_pimut ge 1 then _ai_naive_no_pmtct_e_pim_=1;
    if e_inmut ge 1 then _ai_naive_no_pmtct_e_inm_=1;
    if e_rt184m=1 then _ai_naive_no_pmtct_e_rt184m_=1;
    if e_rt65m=1 then _ai_naive_no_pmtct_e_rt65m_=1;
    if e_rttams ge 1 then _ai_naive_no_pmtct_e_rttams_=1;
end;



*   all art (re-)initiators  ;
_all_ai_=.;_all_ai_c_r_=.; _all_ai_c_nnm_=.; _all_ai_c_pim_=.;_all_ai_c_inm_=.;_all_ai_c_rt184m_=.;_all_ai_c_rt65m_=.;_all_ai_c_rttams_=.;
_all_ai_e_r_=.; _all_ai_e_nnm_=.; _all_ai_e_pim_=.;_all_ai_e_inm_=.;_all_ai_e_rt184m_=.;_all_ai_e_rt65m_=.;_all_ai_e_rttams_=.;
if (return   =1 and restart=1) or yrart=caldate&j > . then do;
    _all_ai_=1;
    if rm_tm1=1 then _all_ai_c_r_=1;
    if nnm_tm1=1 then _all_ai_c_nnm_=1;
    if pim_tm1=1 then _all_ai_c_pim_=1;
    if inpm_tm1=1 or insm_=1 then _all_ai_c_inm_=1;
    if c_rt184m_tm2=1 then _all_ai_c_rt184m_=1;
    if c_rt65m_tm2=1 then _all_ai_c_rt65m_=1;
    if c_rttams_tm2 ge 1 then _all_ai_c_rttams_=1;
    if e_totmut   ge 1 then _all_ai_e_r_=1;
    if e_nnmut ge 1 then _all_ai_e_nnm_=1;
    if e_pimut ge 1 then _all_ai_e_pim_=1;
    if e_inmut ge 1 then _all_ai_e_inm_=1;
    if e_rt184m=1 then _all_ai_e_rt184m_=1;
    if e_rt65m=1 then _all_ai_e_rt65m_=1;
    if e_rttams ge 1 then _all_ai_e_rttams_=1;
end;


*** Off ART with low VL;
offart_vl1000=.;
offart=.; if hiv=1 and onart ne 1 then offart=1;
if offart=1 and vl1000=1 then offart_vl1000=1;

* variables relating to first line failure - switch cascade;

* of people with initial vl > 1000 in past year (v_alert, date_v_alert), proportion with resistance;
* of people with initial vl > 1000 in past year, proportion with vl < 1000;

v_alert_past_yr = .; v_alert_past_yr_rm =.; v_alert_past_yr_vl1000=.;v_alert_past_yr_adc=.;v_alert_past_yr_dead=.; v_alert_past_yr_rm_c=.;
if naive ne 1 then v_alert_past_yr = 0; if 0 <= caldate&j - date_v_alert < 1 then v_alert_past_yr = 1;
if v_alert_past_yr = 1 and onart_iicu=1 then do;
v_alert_past_yr_rm=0; if rme_=1 then v_alert_past_yr_rm=1; 
v_alert_past_yr_rm_c=0; if nnm_=1 then v_alert_past_yr_rm_c=1; * note this;
v_alert_past_yr_vl1000=0; if vl1000=1 then v_alert_past_yr_vl1000=1; 
v_alert_past_yr_adc=0; if adc=1 then v_alert_past_yr_adc=1; 
v_alert_past_yr_dead=0; if caldate&j = death > . then v_alert_past_yr_dead=1; 
end;

* of people with initial vl > 1000 (v_alert) in past 6m, and still on ART , proportion with vl < 1000;
v_alert_6m_ago_onart = .;v_alert_6m_ago_onart_vl1000=.;
if caldate&j - date_v_alert = 0.5 and artline=1 then v_alert_6m_ago_onart = 1;
if v_alert_6m_ago_onart = 1 then do;
v_alert_6m_ago_onart_vl1000 = 0; if vl1000 = 1 then v_alert_6m_ago_onart_vl1000 =1;
end;

* of people with initial vl > 1000 (v_alert) in past 3m, and still on ART , proportion with vl < 1000;
v_alert_3m_ago_onart = .;v_alert_3m_ago_onart_vl1000=.;
if caldate&j - date_v_alert = 0.25 and artline=1 then v_alert_3m_ago_onart = 1;
if v_alert_3m_ago_onart = 1 then do;
v_alert_3m_ago_onart_vl1000 = 0; if vl1000 = 1 then v_alert_3m_ago_onart_vl1000 =1;
end;

* of people with initial vl > 1000 (v_alert) in past 9m, and still on ART , proportion with vl < 1000;
v_alert_9m_ago_onart = .;v_alert_9m_ago_onart_vl1000=.;
if caldate&j - date_v_alert = 0.75 and artline=1 then v_alert_9m_ago_onart = 1;
if v_alert_9m_ago_onart = 1 then do;
v_alert_9m_ago_onart_vl1000 = 0; if vl1000 = 1 then v_alert_9m_ago_onart_vl1000 =1;
end;

* of people with initial vl > 1000 (v_alert) in past 2y, and still on ART , proportion with vl < 1000;
v_alert_2y_ago_onart = .;v_alert_2y_ago_onart_vl1000=.;
if caldate&j - date_v_alert = 2 and artline=1 then v_alert_2y_ago_onart = 1;
if v_alert_2y_ago_onart = 1 then do;
v_alert_2y_ago_onart_vl1000 = 0; if vl1000 = 1 then v_alert_2y_ago_onart_vl1000 =1;
end;

if 0 < (date_v_alert - yrart) < 1 then do;  * e_ stands for early;
e_v_alert_6m_ago_onart = 1;  e_v_alert_6m_ago_onart_vl1000 = v_alert_6m_ago_onart_vl1000;
end; 


* of people with current vl > 1000 on first line, proportion identified as linefail = 1; 

online1_vg1000=.; online1_vg1000_lf1 =.; online1_vg1000_cd4l200 =.;
if onart=1 and artline =1 and vg1000=1 then online1_vg1000=1;
if online1_vg1000=1 then do;
online1_vg1000_lf1=0; if linefail ge 1 then online1_vg1000_lf1=1;
online1_vg1000_cd4l200 =0; if . < cd4 < 200 then online1_vg1000_cd4l200 =1;
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
if ever_onart_gt6m_vlg1000 = 1 and onart=1 then do;
ev_art_g1k=1; ev_art_g1k_l1k=0; if vl1000=1 then ev_art_g1k_l1k=1; 
end;

ev_art_g1k_not2l_adead=0; ev_art_g1k_not2l_adc=0;ev_art_g1k_not2l=0;
if ever_onart_gt6m_vlg1000 = 1 and (date_line2 =. or 2018.75 <= date_line2) then do;
ev_art_g1k_not2l=1; 
ev_art_g1k_not2l_adead=0; if caldate&j = death > . and dcause=1 then ev_art_g1k_not2l_adead=1; 
ev_art_g1k_not2l_adc=0; if adc=1 then ev_art_g1k_not2l_adc=1; 
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
if onart = 1 and r_efa ge 0.75 then onart_efa_r = 1;
if onart_efa_r = 1 then do;
onart_efa_r_2l = 0;
if artline ge 2 then onart_efa_r_2l = 1;
end;

* of people defined as failing efavirenz-based first line ART, proportion with NNRTI drug resistance ; 
onefa_linefail1 = .;  onefa_linefail1_r=.;
if o_efa = 1 and linefail = 1 then onefa_linefail1 = 1;  
if onefa_linefail1 = 1 then do;
onefa_linefail1_r=0; if r_efa ge 0.75 then onefa_linefail1_r=1; 
end;


* status at defined periods after start 1st line art ;

if (caldate_never_dot - yrart = 1) and yrart ge 2018.5 then do;

status_artl1_1=99;

if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vl1000=1 then status_artl1_1 = 1;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vl1000=1 then status_artl1_1 = 2;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ ne 1 then status_artl1_1 = 3;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ ne 1 then status_artl1_1 = 4;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ = 1 and r_dol gt 0 then status_artl1_1 = 5;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ = 1 and r_dol le 0 then status_artl1_1 = 6;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ = 1 and r_dol gt 0 then status_artl1_1 = 7;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ = 1 and r_dol le 0 then status_artl1_1 = 8;
if (onart ne 1 and int_clinic_not_aw ne 1 and line2 ne 1) and visit=1 then status_artl1_1 = 9;
if (onart ne 1 and int_clinic_not_aw ne 1 and line2 = 1) and visit=1 then status_artl1_1 = 10;
if visit ne 1  and line2 ne 1 then status_artl1_1 = 11;
if visit ne 1  and line2 = 1 then status_artl1_1 = 12;
if dcause=1  and line2 ne 1 then status_artl1_1 = 13;	
if dcause=1  and line2 = 1 then status_artl1_1 = 14;	
if dcause=2  and line2 ne 1 then status_artl1_1 = 15;
if dcause=2  and line2 = 1 then status_artl1_1 = 16;
	
r_dol_artl1_1 = 0; if r_dol > 0  then r_dol_artl1_1 = 1;
r_efa_artl1_1 = 0; if r_efa > 0  then r_efa_artl1_1 = 1;
r_taz_artl1_1 = 0; if r_taz > 0  then r_taz_artl1_1 = 1;

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

if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vl1000=1 then status_artl1_3 = 1;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vl1000=1 then status_artl1_3 = 2;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ ne 1 then status_artl1_3 = 3;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ ne 1 then status_artl1_3 = 4;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ = 1 and r_dol gt 0 then status_artl1_3 = 5;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ = 1 and r_dol le 0 then status_artl1_3 = 6;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ = 1 and r_dol gt 0 then status_artl1_3 = 7;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ = 1 and r_dol le 0 then status_artl1_3 = 8;
if (onart ne 1 and int_clinic_not_aw ne 1 and line2 ne 1) and visit=1 then status_artl1_3 = 9;
if (onart ne 1 and int_clinic_not_aw ne 1 and line2 = 1) and visit=1 then status_artl1_3 = 10;
if visit ne 1  and line2 ne 1 then status_artl1_3 = 11;
if visit ne 1  and line2 = 1 then status_artl1_3 = 12;
if dcause=1  and line2 ne 1 then status_artl1_3 = 13;	
if dcause=1  and line2 = 1 then status_artl1_3 = 14;	
if dcause=2  and line2 ne 1 then status_artl1_3 = 15;
if dcause=2  and line2 = 1 then status_artl1_3 = 16;
	
r_dol_artl1_3 = 0; if r_dol > 0  then r_dol_artl1_3 = 1;
r_efa_artl1_3 = 0; if r_efa > 0  then r_efa_artl1_3 = 1;
r_taz_artl1_3 = 0; if r_taz > 0  then r_taz_artl1_3 = 1;

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

if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vl1000=1 then status_artl1_5 = 1;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vl1000=1 then status_artl1_5 = 2;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ ne 1 then status_artl1_5 = 3;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ ne 1 then status_artl1_5 = 4;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ = 1 and r_dol gt 0 then status_artl1_5 = 5;
if ((onart=1 or int_clinic_not_aw=1) and line2 ne 1) and vg1000=1 and rm_ = 1 and r_dol le 0 then status_artl1_5 = 6;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ = 1 and r_dol gt 0 then status_artl1_5 = 7;
if ((onart=1 or int_clinic_not_aw=1) and line2 = 1) and vg1000=1 and rm_ = 1 and r_dol le 0 then status_artl1_5 = 8;
if (onart ne 1 and int_clinic_not_aw ne 1 and line2 ne 1) and visit=1 then status_artl1_5 = 9;
if (onart ne 1 and int_clinic_not_aw ne 1 and line2 = 1) and visit=1 then status_artl1_5 = 10;
if visit ne 1  and line2 ne 1 then status_artl1_5 = 11;
if visit ne 1  and line2 = 1 then status_artl1_5 = 12;
if dcause=1  and line2 ne 1 then status_artl1_5 = 13;	
if dcause=1  and line2 = 1 then status_artl1_5 = 14;	
if dcause=2  and line2 ne 1 then status_artl1_5 = 15;
if dcause=2  and line2 = 1 then status_artl1_5 = 16;
	
r_dol_artl1_5 = 0; if r_dol > 0  then r_dol_artl1_5 = 1;
r_efa_artl1_5 = 0; if r_efa > 0  then r_efa_artl1_5 = 1;
r_taz_artl1_5 = 0; if r_taz > 0  then r_taz_artl1_5 = 1;

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

if caldate&j = 2020.5 and ((e_rt65m= 1 or e_rt151m=1) and e_rt184m=1) and vl > 3 and onart=1 then ten3tc_r_f = 1;

if (caldate_never_dot - 2020.5 = 1) and ten3tc_r_f=1 then do;

outc_ten3tc_r_f_1=99;

if (onart=1 or int_clinic_not_aw=1) and vl1000=1 then outc_ten3tc_r_f_1 = 1;
if (onart=1 or int_clinic_not_aw=1) and vg1000=1 and rm_ ne 1 then outc_ten3tc_r_f_1 = 2;
if (onart=1 or int_clinic_not_aw=1) and vg1000=1 and rm_ = 1 and r_dol   le 0 then outc_ten3tc_r_f_1 = 3;
if (onart=1 or int_clinic_not_aw=1) and vg1000=1 and rm_ = 1 and r_dol   gt 0 then outc_ten3tc_r_f_1 = 4;
if (onart ne 1 and int_clinic_not_aw ne 1) and visit=1 then outc_ten3tc_r_f_1 = 5;
if visit ne 1  then outc_ten3tc_r_f_1 = 6;
if death ne . then outc_ten3tc_r_f_1 = 7;	

r_dol_ten3tc_r_f_1 = 0; if r_dol   > 0  then r_dol_ten3tc_r_f_1 = 1;
end;

outc_ten3tc_r_f_1_1=0; if outc_ten3tc_r_f_1 =1 then outc_ten3tc_r_f_1_1=1;outc_ten3tc_r_f_1_2=0; if outc_ten3tc_r_f_1 = 2 then outc_ten3tc_r_f_1_2=1;
outc_ten3tc_r_f_1_3=0; if outc_ten3tc_r_f_1 =3 then outc_ten3tc_r_f_1_3=1;outc_ten3tc_r_f_1_4=0; if outc_ten3tc_r_f_1 = 4 then outc_ten3tc_r_f_1_4=1;
outc_ten3tc_r_f_1_5=0; if outc_ten3tc_r_f_1 =5 then outc_ten3tc_r_f_1_5=1;outc_ten3tc_r_f_1_6=0; if outc_ten3tc_r_f_1 = 6 then outc_ten3tc_r_f_1_6=1;
outc_ten3tc_r_f_1_7=0; if outc_ten3tc_r_f_1 =7 then outc_ten3tc_r_f_1_7=1;



***Pregnancy outcomes;
pregnant_vlg1000 = 0;
if pregnant =1 and vl > 3 then pregnant_vlg1000 = 1;

pregnant_onart = 0;
if pregnant = 1 and (onart=1) then pregnant_onart = 1;

pregnant_onart_vlg1000 = 0;
if pregnant = 1 and (onart=1) and vl > 3 then pregnant_onart_vlg1000 = 1;

pregnant_onart_vl_high = 0;
if pregnant = 1 and (onart=1) and 3 <= vl < 4 then pregnant_onart_vl_high = 1;
pregnant_onart_vl_vhigh = 0;
if pregnant = 1 and (onart=1) and 4 <= vl < 5 then pregnant_onart_vl_vhigh = 1;
pregnant_onart_vl_vvhigh = 0;
if pregnant = 1 and (onart=1) and 5 <= vl  then pregnant_onart_vl_vvhigh = 1;

pregnant_o_dol = 0;
if pregnant =1 and o_dol = 1 then pregnant_o_dol = 1;

pregnant_not_diagnosed_pos=0; if pregnant=1 and registd  ne 1 then pregnant_not_diagnosed_pos=1;


* daly outputs ;

dead_ddaly_ntd=0;
if prev_pregnant_ntd=1 then dead_ddaly_ntd = 0.25*discount;
* ts1m: replace above with : 
* if prev_pregnant_ntd=1 then dead_ddaly_ntd = (1/12)*discount;

* AP 19-7-19;
dead_ddaly_oth_dol_adv_birth_e=0;
if prev_oth_dol_adv_birth_e=1 then dead_ddaly_oth_dol_adv_birth_e = 0.25*discount;
* ts1m: replace above with : 
* if prev_oth_dol_adv_birth_e=1 then dead_ddaly_oth_dol_adv_birth_e = (1/12)*discount;

ddaly_mtct=0;
if ever_birth_with_inf_child=1 then ddaly_mtct = 0.1*0.25*discount;
* ts1m: replace above with : 
* if ever_birth_with_inf_child=1 then ddaly_mtct = 0.1*(1/12)*discount;


* AP 19-7-19;
ddaly_non_aids_pre_death=0;
if death = caldate&j and rdcause=2 then ddaly_non_aids_pre_death = 1 * 0.25 * discount;
* ts1m: replace above with : 
* if death = caldate&j and rdcause=2 then ddaly_non_aids_pre_death = 1 * (1/12) * discount;

dead_rdcause2=0;
if death = caldate&j and rdcause=2 then dead_rdcause2=1;
dead_onart_rdcause2=0;
if death = caldate&j and onart=1 and rdcause=2 then dead_onart_rdcause2=1;



* variables to follow newp andd infection risk dynamics ;

nip_w=.; if gender=2 then nip_w = nip   ;
nip_m=.; if gender=1 then nip_m = nip   ;

risk_nippnp_w=.; if gender=2 then risk_nippnp_w = risk_nippnp;
risk_nippnp_m=.; if gender=1 then risk_nippnp_m = risk_nippnp;

risk_nip_w=.; if gender=2 then risk_nip_w = risk_nip;
risk_nip_m=.; if gender=1 then risk_nip_m = risk_nip;

epi_w=0; if gender=2 then epi_w = epi  ;
epi_m=0; if gender=1 then epi_m = epi  ;

newp_ge1_w=0; if gender=2 then newp_ge1_w = newp_ge1;
newp_ge1_m=0; if gender=1 then newp_ge1_m = newp_ge1;

if gender=2 and 15 <= age < 50 then do;
sw1549=0; if sw = 1 then sw1549=1; 
end;

rred_balance_w = .;  if gender=2 then rred_balance_w = rred_balance;
rred_balance_m = .;  if gender=1 then rred_balance_m = rred_balance;

s1_m =. ; if gender = 1 then s1_m = s1;
s2_m =. ; if gender = 1 then s2_m = s2;
s3_m =. ; if gender = 1 then s3_m = s3;
s4_m =. ; if gender = 1 then s4_m = s4;
s1_f =. ; if gender = 2 then s1_f = s1;
s2_f =. ; if gender = 2 then s2_f = s2;

newp_sw = 0;  if sw = 1 then newp_sw = newp; 




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 5

* CREATE SUMS OF VARIABLES IN ORDER TO BE ABLE TO CREATE SUMMARIES TO SAVE AND TO FEED BACK INTO NEXT 3 MONTH PERIOD;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


* thoughts :

need to ensure that all s_ variables below are not included in data set

;


if 15 <= age < 65 and (death = . or caldate&j = death ) then do;

	s_n + 1; 

	/*number alive and with hiv in each age group*/
	s_alive1549 + alive1549; s_alive1549_w	+ alive1549_w;	s_alive1549_m + alive1549_m; s_alive1564 + alive1564; s_alive1564_w + alive1564_w ;
	s_alive1564_m + alive1564_m ; 

	s_ageg1517m + ageg1517m ; s_ageg1819m + ageg1819m; s_ageg1519m + ageg1519m; s_ageg2024m	+ ageg2024m;
	s_ageg2529m + ageg2529m ; s_ageg3034m + ageg3034m; s_ageg3539m + ageg3539m; s_ageg4044m + ageg4044m; s_ageg4549m + ageg4549m;
	s_ageg5054m + ageg5054m ; s_ageg5559m + ageg5559m; s_ageg5559m + ageg5559m; s_ageg6064m + ageg6064m; s_ageg1564m + ageg1564m; 
	s_ageg1549m + ageg1549m ; s_age_1844m + age_1844m; 

	s_ageg1517w + ageg1517w ; s_ageg1819w + ageg1819w; s_ageg1519w + ageg1519w; s_ageg2024w	+ ageg2024w;
	s_ageg2529w + ageg2529w ; s_ageg3034w + ageg3034w; s_ageg3539w + ageg3539w; s_ageg4044w + ageg4044w; s_ageg4549w + ageg4549w;
	s_ageg5054w + ageg5054w ; s_ageg5559w + ageg5559w; s_ageg5559w + ageg5559w; s_ageg6064w + ageg6064w; s_ageg1564w + ageg1564w; 
	s_ageg1549w + ageg1549w ; s_age_1844w + age_1844w; 

	s_ageg1m + ageg1m ; s_ageg2m + ageg2m ; s_ageg3m + ageg3m ; s_ageg4m + ageg4m ; s_ageg5m + ageg5m ; s_ageg1w + ageg1w ; s_ageg2w + ageg2w ;
	s_ageg3w + ageg3w ; s_ageg4w + ageg4w ; s_ageg5w + ageg5w ;

	s_hiv1564 + hiv1564 ; s_hiv1549 + hiv1549 ; 

	s_hiv1517m + hiv1517m ; s_hiv1819m + hiv1819m ; s_hiv1519m + hiv1519m ; s_hiv2024m + hiv2024m ;	s_hiv2529m + hiv2529m ; s_hiv3034m + hiv3034m ; 
	s_hiv3539m + hiv3539m ; s_hiv4044m + hiv4044m ; s_hiv4549m + hiv4549m ; s_hiv5054m + hiv5054m ; s_hiv5559m + hiv5559m ; s_hiv6064m + hiv6064m ;
	s_hiv1564m + hiv1564m ; s_hiv1549m + hiv1549m ;	

	s_hiv1517w + hiv1517w ; s_hiv1819w + hiv1819w ; s_hiv1519w + hiv1519w ; s_hiv2024w + hiv2024w ;	s_hiv2529w + hiv2529w ; s_hiv3034w + hiv3034w ; 
	s_hiv3539w + hiv3539w ; s_hiv4044w + hiv4044w ; s_hiv4549w + hiv4549w ; s_hiv5054w + hiv5054w ; s_hiv5559w + hiv5559w ; s_hiv6064w + hiv6064w ;
	s_hiv1564w + hiv1564w ; s_hiv1549w + hiv1549w ;	

	s_sg_1 + sg_1 ; s_sg_2 + sg_2 ; s_sg_3 + sg_3 ; s_sg_4 + sg_4 ; s_sg_5 + sg_5 ; s_sg_6 + sg_6 ; s_sg_7 + sg_7 ; s_sg_8 + sg_8 ; 
	s_sg_9 + sg_9 ; s_sg_99 + sg_99 ; 	

	/*primary infection*/

	s_primary + primary ; s_primary1549 + primary1549 ; s_primary1549m + primary1549m ; s_primary1549w + primary1549w ;
	s_infected_primary + infected_primary; s_inf_primary + inf_primary ; 

	s_primary1519m + primary1519m ; s_primary2024m + primary2024m ; s_primary2529m + primary2529m ; s_primary3034m + primary3034m ; 
	s_primary3539m + primary3539m ; s_primary4044m + primary4044m ; s_primary4549m + primary4549m ; s_primary5054m + primary5054m ;
	s_primary5559m + primary5559m ; s_primary6064m + primary6064m ;			
			
	s_primary1519w + primary1519w ; s_primary2024w + primary2024w ; s_primary2529w + primary2529w ; s_primary3034w + primary3034w ; 
	s_primary3539w + primary3539w ; s_primary4044w + primary4044w ; s_primary4549w + primary4549w ; s_primary5054w + primary5054w ;
	s_primary5559w + primary5559w ; s_primary6064w + primary6064w ;			
			
	s_primary_ep_m + primary_ep_m ; s_primary_ep_w + primary_ep_w ;  

	s_primary1524m_ep + primary1524m_ep ; s_primary2534m_ep + primary2534m_ep ; s_primary3544m_ep + primary3544m_ep ; s_primary4554m_ep + primary4554m_ep;
	s_primary5564m_ep + primary5564m_ep ; s_primary1524w_ep + primary1524w_ep ; s_primary2534w_ep + primary2534w_ep ; s_primary3544w_ep + primary3544w_ep;
    s_primary4554w_ep + primary4554w_ep ; s_primary5564w_ep + primary5564w_ep ;  
	
	s_primary_sw + primary_sw ; s_primary_sw1519_ + primary_sw1519_; s_primary_sw2024_ + primary_sw2024_; 
	s_primary_sw2529_ + primary_sw2529_; s_primary_sw3039_ + primary_sw3039_;

	s_inf_vlsupp + inf_vlsupp ; s_inf_newp + inf_newp ; s_inf_ep + inf_ep ; s_inf_diag + inf_diag ; s_inf_naive + inf_naive ;

	
	/*outputs amongst those infected*/

	s_i_m_d_newp + i_m_d_newp ; s_i_w_d_newp + i_w_d_newp ; s_i_w_np + i_w_np ; s_i_m_np + i_m_np ; s_i_ep + i_ep ;

	s_i_m_1524_newp + i_m_1524_newp ; s_i_m_2534_newp + i_m_2534_newp ; s_i_m_3544_newp + i_m_3544_newp ; s_i_m_4554_newp + i_m_4554_newp ;
	s_i_m_4554_newp + i_m_4554_newp ; s_i_m_5564_newp + i_m_5564_newp ;

	s_i_w_1524_newp + i_w_1524_newp ; s_i_w_2534_newp + i_w_2534_newp ; s_i_w_3544_newp + i_w_3544_newp ; s_i_w_4554_newp + i_w_4554_newp ;
	s_i_w_4554_newp + i_w_4554_newp ; s_i_w_5564_newp + i_w_5564_newp ;

	s_i_r_vlg1_np + i_r_vlg1_np ; s_i_r_vlg2_np + i_r_vlg2_np ; s_i_r_vlg3_np + i_r_vlg3_np ; s_i_r_vlg4_np + i_r_vlg4_np ; 
	s_i_r_vlg5_np + i_r_vlg5_np ; s_i_r_vlg6_np + i_r_vlg6_np ; 

	s_i_diag_vlg1_rm0_np + i_diag_vlg1_rm0_np ; s_i_diag_vlg2_rm0_np + i_diag_vlg2_rm0_np ; s_i_diag_vlg3_rm0_np + i_diag_vlg3_rm0_np ; 
	s_i_diag_vlg4_rm0_np + i_diag_vlg4_rm0_np ; s_i_diag_vlg5_rm0_np + i_diag_vlg5_rm0_np ; s_i_diag_vlg6_rm0_np + i_diag_vlg6_rm0_np ; 

	s_i_diag_vlg1_rm1_np + i_diag_vlg1_rm1_np ; s_i_diag_vlg2_rm1_np + i_diag_vlg2_rm1_np ; s_i_diag_vlg3_rm1_np + i_diag_vlg3_rm1_np ; 
	s_i_diag_vlg4_rm1_np + i_diag_vlg4_rm1_np ; s_i_diag_vlg5_rm1_np + i_diag_vlg5_rm1_np ; s_i_diag_vlg6_rm1_np + i_diag_vlg6_rm1_np ; 

	s_i_naive_vlg1_rm0_np + i_naive_vlg1_rm0_np ; s_i_naive_vlg2_rm0_np + i_naive_vlg2_rm0_np ; s_i_naive_vlg3_rm0_np + i_naive_vlg3_rm0_np ; 
	s_i_naive_vlg4_rm0_np + i_naive_vlg4_rm0_np ; s_i_naive_vlg5_rm0_np + i_naive_vlg5_rm0_np ; s_i_naive_vlg6_rm0_np + i_naive_vlg6_rm0_np ; 

	s_i_naive_vlg1_rm1_np + i_naive_vlg1_rm1_np ; s_i_naive_vlg2_rm1_np + i_naive_vlg2_rm1_np ; s_i_naive_vlg3_rm1_np + i_naive_vlg3_rm1_np ; 
	s_i_naive_vlg4_rm1_np + i_naive_vlg4_rm1_np ; s_i_naive_vlg5_rm1_np + i_naive_vlg5_rm1_np ; s_i_naive_vlg6_rm1_np + i_naive_vlg6_rm1_np ; 

	s_i_v1_np + i_v1_np ; s_i_v2_np + i_v2_np ; s_i_v3_np + i_v3_np ; s_i_v4_np + i_v4_np ; s_i_v5_np + i_v5_np ; s_i_v6_np + i_v6_np ; 

	/*Number ep and newp*/

	s_np + np ; s_newp + newp ; s_newp_ge1 + newp_ge1 ; s_newp_ge5 + newp_ge5 ; s_newp_ge10 + newp_ge10 ; s_newp_ge50 +  newp_ge50 ;
	s_ep + ep ; s_ep_m + ep_m ; s_ep_w + ep_w ; s_npge10 + npge10 ; s_npge2 + npge2 ; s_npge2_l4p_1549m + npge2_l4p_1549m;
	s_npge2_l4p_1549w + npge2_l4p_1549w ;

	s_m_1524_ep + m_1524_ep ; s_m_2534_ep + m_2534_ep ; s_m_3544_ep + m_3544_ep ; s_m_4554_ep + m_4554_ep ; s_m_5564_ep + m_5564_ep ;
	s_w_1524_ep + w_1524_ep ; s_w_2534_ep + w_2534_ep ; s_w_3544_ep + w_3544_ep ; s_w_4554_ep + w_4554_ep ; s_w_5564_ep + w_5564_ep ;

	s_m_1524_newp + m_1524_newp ; s_m_2534_newp + m_2534_newp ; s_m_3544_newp + m_3544_newp ; s_m_4554_newp + m_4554_newp ; s_m_5564_newp + m_5564_newp ;
	s_w_1524_newp + w_1524_newp ; s_w_2534_newp + w_2534_newp ; s_w_3544_newp + w_3544_newp ; s_w_4554_newp + w_4554_newp ; s_w_5564_newp + w_5564_newp ;

	s_m_1524_epnewp + m_1524_epnewp ; s_m_2534_epnewp + m_2534_epnewp ; s_m_3544_epnewp + m_3544_epnewp ; s_m_4554_epnewp + m_4554_epnewp ; s_m_5564_epnewp + m_5564_epnewp ;
	s_w_1524_epnewp + w_1524_epnewp ; s_w_2534_epnewp + w_2534_epnewp ; s_w_3544_epnewp + w_3544_epnewp ; s_w_4554_epnewp + w_4554_epnewp ; s_w_5564_epnewp + w_5564_epnewp ;

	s_newp_ge1_hiv + newp_ge1_hiv ; s_ever_ep + ever_ep ; s_ever_newp + ever_newp ;      

	s_m1524_ep1524 + m1524_ep1524 ; s_m2534_ep2534 + m2534_ep2534 ; s_m3544_ep3544 + m3544_ep3544 ; s_m4554_ep4554 + m4554_ep4554 ; s_m5564_ep5564 + m5564_ep5564 ;
	s_w1524_ep1524 + w1524_ep1524 ; s_w2534_ep2534 + w2534_ep2534 ; s_w3544_ep3544 + w3544_ep3544 ; s_w4554_ep4554 + w4554_ep4554 ; s_w5564_ep5564 + w5564_ep5564 ;
 
	s_m1524_newp_ge1 + m1524_newp_ge1 ; s_m2534_newp_ge1 + m2534_newp_ge1 ; s_m3544_newp_ge1 + m3544_newp_ge1 ; s_m4554_newp_ge1 + m4554_newp_ge1; s_m5564_newp_ge1 +  m5564_newp_ge1;
	s_m1524_newp_ge5 + m1524_newp_ge5 ; s_m2534_newp_ge5 + m2534_newp_ge5 ; s_m3544_newp_ge5 + m3544_newp_ge5 ; s_m4554_newp_ge5 + m4554_newp_ge5; s_m5564_newp_ge5 +  m5564_newp_ge5;

	s_w1524_newp_ge1 + w1524_newp_ge1 ; s_w2534_newp_ge1 + w2534_newp_ge1 ; s_w3544_newp_ge1 + w3544_newp_ge1 ; s_w4554_newp_ge1 + w4554_newp_ge1; s_w5564_newp_ge1 +  w5564_newp_ge1;
	s_w1524_newp_ge5 + w1524_newp_ge5 ; s_w2534_newp_ge5 + w2534_newp_ge5 ; s_w3544_newp_ge5 + w3544_newp_ge5 ; s_w4554_newp_ge5 + w4554_newp_ge5; s_w5564_newp_ge5 +  w5564_newp_ge5;

	s_m1549_newp_ge1 + m1549_newp_ge1 ; s_w1549_newp_ge1 + w1549_newp_ge1 ;

	s_newp_g_m_0 + newp_g_m_0 ; s_newp_g_m_1 + newp_g_m_1 ; s_newp_g_m_2 + newp_g_m_2 ; s_newp_g_m_3 + newp_g_m_3 ; s_newp_g_m_4 + newp_g_m_4 ; 
	s_newp_g_m_5 + newp_g_m_5 ; s_newp_g_m_6 + newp_g_m_6 ; 

	s_n_newp_g_m_0 + n_newp_g_m_0 ; s_n_newp_g_m_1 + n_newp_g_m_1 ; s_n_newp_g_m_2 + n_newp_g_m_2 ; s_n_newp_g_m_3 + n_newp_g_m_3 ; s_n_newp_g_m_4 + n_newp_g_m_4 ; 
	s_n_newp_g_m_5 + n_newp_g_m_5 ; s_n_newp_g_m_6 + n_newp_g_m_6 ; 

	s_newp_g_w_0 + newp_g_w_0 ; s_newp_g_w_1 + newp_g_w_1 ; s_newp_g_w_2 + newp_g_w_2 ; s_newp_g_w_3 + newp_g_w_3 ; s_newp_g_w_4 + newp_g_w_4 ; 
	s_newp_g_w_5 + newp_g_w_5 ; s_newp_g_w_6 + newp_g_w_6 ; 

	s_n_newp_g_w_0 + n_newp_g_w_0 ; s_n_newp_g_w_1 + n_newp_g_w_1 ; s_n_newp_g_w_2 + n_newp_g_w_2 ; s_n_newp_g_w_3 + n_newp_g_w_3 ; s_n_newp_g_w_4 + n_newp_g_w_4 ; 
	s_n_newp_g_w_5 + n_newp_g_w_5 ; s_n_newp_g_w_6 + n_newp_g_w_6 ; 

	s_newp_g_yw_0 + newp_g_yw_0 ; s_newp_g_yw_1 + newp_g_yw_1 ; s_newp_g_yw_2 + newp_g_yw_2 ; s_newp_g_yw_3 + newp_g_yw_3 ; s_newp_g_yw_4 + newp_g_yw_4 ; 
	s_newp_g_yw_5 + newp_g_yw_5 ; s_newp_g_yw_6 + newp_g_yw_6 ; 

	s_n_newp_g_yw_0 + n_newp_g_yw_0 ; s_n_newp_g_yw_1 + n_newp_g_yw_1 ; s_n_newp_g_yw_2 + n_newp_g_yw_2 ; s_n_newp_g_yw_3 + n_newp_g_yw_3 ; s_n_newp_g_yw_4 + n_newp_g_yw_4 ; 
	s_n_newp_g_yw_5 + n_newp_g_yw_5 ; s_n_newp_g_yw_6 + n_newp_g_yw_6 ; 

	s_npgt1conc_l4p_1524m + npgt1conc_l4p_1524m ; s_npgt1conc_l4p_1524w + npgt1conc_l4p_1524w ; 

	s_npgt1conc_l4p_1519m + npgt1conc_l4p_1519m ; s_npgt1conc_l4p_1519w + npgt1conc_l4p_1519w ; 
	s_npgt1conc_l4p_2449m + npgt1conc_l4p_2449m ; s_npgt1conc_l4p_2449w + npgt1conc_l4p_2449w ; 
	s_npgt1conc_l4p_5064m + npgt1conc_l4p_5064m ; s_npgt1conc_l4p_5064w + npgt1conc_l4p_5064w ; 

	s_susc_np_inc_circ_1549_m + susc_np_inc_circ_1549_m ; s_susc_np_1549_m + susc_np_1549_m ; s_susc_np_1549_w + susc_np_1549_w ;
	s_newp_this_per_art_or_prep + newp_this_per_art_or_prep ; s_newp_this_per_art + newp_this_per_art ; s_newp_this_per_prep + newp_this_per_prep ;
	s_newp_this_per_prep_sw + newp_this_per_prep_sw ;  s_newp_this_per_elig_prep + newp_this_per_elig_prep ;
	s_newp_this_per_elig_prep_sw + newp_this_per_elig_prep_sw ;
    s_newp_this_per + newp_this_per ; s_newp_sw + newp_sw ;  s_newp_hivneg + newp_hivneg ; s_newp_this_per_hivneg + newp_this_per_hivneg ;
	s_newp_this_per_hivneg_1549 + newp_this_per_hivneg_1549;  s_newp_this_per_1549 + newp_this_per_1549 ;

	s_i_v1_ep + i_v1_ep ; s_i_v2_ep + i_v2_ep ; s_i_v3_ep + i_v3_ep ; s_i_v4_ep + i_v4_ep ; s_i_v5_ep + i_v5_ep ; s_i_v6_ep + i_v6_ep ; 
	s_i_v1_newp + i_v1_newp ; s_i_v2_newp + i_v2_newp ; s_i_v3_newp + i_v3_newp ; s_i_v4_newp + i_v4_newp ; s_i_v5_newp + i_v5_newp ; s_i_v6_newp + i_v6_newp ; 

	s_primary1524m_epnewp + primary1524m_epnewp ; s_primary2534m_epnewp + primary2534m_epnewp ; s_primary3544m_epnewp + primary3544m_epnewp ; 
	s_primary4554m_epnewp + primary4554m_epnewp ; s_primary5564m_epnewp + primary5564m_epnewp ; 
	s_primary1524w_epnewp + primary1524w_epnewp ; s_primary2534w_epnewp + primary2534w_epnewp ; s_primary3544w_epnewp + primary3544w_epnewp ;
	s_primary4554w_epnewp + primary4554w_epnewp ; s_primary5564w_epnewp + primary5564w_epnewp ;
 
	s_eponart + epart ;  s_s_m_newp + t_m_newp ; s_s_w_newp + t_w_newp ;

	/*status of partner*/

	s_eph0_m + eph0_m ; s_eph0_w + eph0_w ; s_nip + nip ; s_epi + epi ; 

	s_newp_hiv + newp_hiv ; s_newp_ge1_hiv_diag + newp_ge1_hiv_diag ; s_epdiag + epdiag ; s_diag_epun + diag_epun ; s_epart + epart ;
	s_epvls + epvls ; s_hiv1epi0_w + hiv1epi0_w ; s_hiv0epi1_w + hiv0epi1_w ; s_hiv1epi0_m + hiv1epi0_m ; s_hiv0epi1_m + hiv0epi1_m ;
	s_hiv1epi1_m + hiv1epi1_m ; s_hiv1epi1_w + hiv1epi1_w ; s_hiv0epprim + hiv0epprim ; s_ever_ep_hiv + ever_ep_hiv ; s_ever_ep_diag + ever_ep_diag ;
	s_ever_newp_hiv + ever_newp_hiv ; s_ever_newp_diag + ever_newp_diag ; s_infected_newp_m + infected_newp_m ; s_infected_newp_w + infected_newp_w ;
    s_infected_ep_m + infected_ep_m ; s_infected_ep_w + infected_ep_w ;
  
 	s_i_vl1000_m_np + i_vl1000_m_np ; s_i_v11000_m_ep + i_v11000_m_ep ; s_i_vl1000_m_newp + i_vl1000_m_newp ; s_i_vl1000_w_np + i_vl1000_w_np ;
  	s_i_v11000_w_ep + i_v11000_w_ep ; s_i_vl1000_w_newp + i_vl1000_w_newp ; 
 
	s_i_v1_age1_w_np + i_v1_age1_w_np ; s_i_v1_age2_w_np + i_v1_age2_w_np ; s_i_v1_age3_w_np + i_v1_age3_w_np ;
	s_i_v1_age4_w_np + i_v1_age4_w_np ; s_i_v1_age5_w_np + i_v1_age5_w_np ;
	s_i_v1_age1_m_np + i_v1_age1_m_np ; s_i_v1_age2_m_np + i_v1_age2_m_np ; s_i_v1_age3_m_np + i_v1_age3_m_np ;
	s_i_v1_age4_m_np + i_v1_age4_m_np ; s_i_v1_age5_m_np + i_v1_age5_m_np ;
	s_i_v1_age1_w_newp + i_v1_age1_w_newp ; s_i_v1_age2_w_newp + i_v1_age2_w_newp ; s_i_v1_age3_w_newp + i_v1_age3_w_newp ;
	s_i_v1_age4_w_newp + i_v1_age4_w_newp ; s_i_v1_age5_w_newp + i_v1_age5_w_newp ;
	s_i_v1_age1_m_newp + i_v1_age1_m_newp ; s_i_v1_age2_m_newp + i_v1_age2_m_newp ; s_i_v1_age3_m_newp + i_v1_age3_m_newp ;
	s_i_v1_age4_m_newp + i_v1_age4_m_newp ; s_i_v1_age5_m_newp + i_v1_age5_m_newp ;
	s_i_v1_age1_w_ep + i_v1_age1_w_ep ; s_i_v1_age2_w_ep + i_v1_age2_w_ep ; s_i_v1_age3_w_ep + i_v1_age3_w_ep ; 
	s_i_v1_age4_w_ep + i_v1_age4_w_ep ; s_i_v1_age5_w_ep + i_v1_age5_w_ep ; 
	s_i_v1_age1_m_ep + i_v1_age1_m_ep ; s_i_v1_age2_m_ep + i_v1_age2_m_ep ; s_i_v1_age3_m_ep + i_v1_age3_m_ep ; 
	s_i_v1_age4_m_ep + i_v1_age4_m_ep ; s_i_v1_age5_m_ep + i_v1_age5_m_ep ; 

	s_i_v2_age1_w_np + i_v2_age1_w_np ; s_i_v2_age2_w_np + i_v2_age2_w_np ; s_i_v2_age3_w_np + i_v2_age3_w_np ;
	s_i_v2_age4_w_np + i_v2_age4_w_np ; s_i_v2_age5_w_np + i_v2_age5_w_np ;
	s_i_v2_age1_m_np + i_v2_age1_m_np ; s_i_v2_age2_m_np + i_v2_age2_m_np ; s_i_v2_age3_m_np + i_v2_age3_m_np ;
	s_i_v2_age4_m_np + i_v2_age4_m_np ; s_i_v2_age5_m_np + i_v2_age5_m_np ;
	s_i_v2_age1_w_newp + i_v2_age1_w_newp ; s_i_v2_age2_w_newp + i_v2_age2_w_newp ; s_i_v2_age3_w_newp + i_v2_age3_w_newp ;
	s_i_v2_age4_w_newp + i_v2_age4_w_newp ; s_i_v2_age5_w_newp + i_v2_age5_w_newp ;
	s_i_v2_age1_m_newp + i_v2_age1_m_newp ; s_i_v2_age2_m_newp + i_v2_age2_m_newp ; s_i_v2_age3_m_newp + i_v2_age3_m_newp ;
	s_i_v2_age4_m_newp + i_v2_age4_m_newp ; s_i_v2_age5_m_newp + i_v2_age5_m_newp ;
	s_i_v2_age1_w_ep + i_v2_age1_w_ep ; s_i_v2_age2_w_ep + i_v2_age2_w_ep ; s_i_v2_age3_w_ep + i_v2_age3_w_ep ; 
	s_i_v2_age4_w_ep + i_v2_age4_w_ep ; s_i_v2_age5_w_ep + i_v2_age5_w_ep ; 
	s_i_v2_age1_m_ep + i_v2_age1_m_ep ; s_i_v2_age2_m_ep + i_v2_age2_m_ep ; s_i_v2_age3_m_ep + i_v2_age3_m_ep ; 
	s_i_v2_age4_m_ep + i_v2_age4_m_ep ; s_i_v2_age5_m_ep + i_v2_age5_m_ep ; 

	s_i_v3_age1_w_np + i_v3_age1_w_np ; s_i_v3_age2_w_np + i_v3_age2_w_np ; s_i_v3_age3_w_np + i_v3_age3_w_np ;
	s_i_v3_age4_w_np + i_v3_age4_w_np ; s_i_v3_age5_w_np + i_v3_age5_w_np ;
	s_i_v3_age1_m_np + i_v3_age1_m_np ; s_i_v3_age2_m_np + i_v3_age2_m_np ; s_i_v3_age3_m_np + i_v3_age3_m_np ;
	s_i_v3_age4_m_np + i_v3_age4_m_np ; s_i_v3_age5_m_np + i_v3_age5_m_np ;
	s_i_v3_age1_w_newp + i_v3_age1_w_newp ; s_i_v3_age2_w_newp + i_v3_age2_w_newp ; s_i_v3_age3_w_newp + i_v3_age3_w_newp ;
	s_i_v3_age4_w_newp + i_v3_age4_w_newp ; s_i_v3_age5_w_newp + i_v3_age5_w_newp ;
	s_i_v3_age1_m_newp + i_v3_age1_m_newp ; s_i_v3_age2_m_newp + i_v3_age2_m_newp ; s_i_v3_age3_m_newp + i_v3_age3_m_newp ;
	s_i_v3_age4_m_newp + i_v3_age4_m_newp ; s_i_v3_age5_m_newp + i_v3_age5_m_newp ;
	s_i_v3_age1_w_ep + i_v3_age1_w_ep ; s_i_v3_age2_w_ep + i_v3_age2_w_ep ; s_i_v3_age3_w_ep + i_v3_age3_w_ep ; 
	s_i_v3_age4_w_ep + i_v3_age4_w_ep ; s_i_v3_age5_w_ep + i_v3_age5_w_ep ; 
	s_i_v3_age1_m_ep + i_v3_age1_m_ep ; s_i_v3_age2_m_ep + i_v3_age2_m_ep ; s_i_v3_age3_m_ep + i_v3_age3_m_ep ; 
	s_i_v3_age4_m_ep + i_v3_age4_m_ep ; s_i_v3_age5_m_ep + i_v3_age5_m_ep ; 

	s_i_v4_age1_w_np + i_v4_age1_w_np ; s_i_v4_age2_w_np + i_v4_age2_w_np ; s_i_v4_age3_w_np + i_v4_age3_w_np ;
	s_i_v4_age4_w_np + i_v4_age4_w_np ; s_i_v4_age5_w_np + i_v4_age5_w_np ;
	s_i_v4_age1_m_np + i_v4_age1_m_np ; s_i_v4_age2_m_np + i_v4_age2_m_np ; s_i_v4_age3_m_np + i_v4_age3_m_np ;
	s_i_v4_age4_m_np + i_v4_age4_m_np ; s_i_v4_age5_m_np + i_v4_age5_m_np ;
	s_i_v4_age1_w_newp + i_v4_age1_w_newp ; s_i_v4_age2_w_newp + i_v4_age2_w_newp ; s_i_v4_age3_w_newp + i_v4_age3_w_newp ;
	s_i_v4_age4_w_newp + i_v4_age4_w_newp ; s_i_v4_age5_w_newp + i_v4_age5_w_newp ;
	s_i_v4_age1_m_newp + i_v4_age1_m_newp ; s_i_v4_age2_m_newp + i_v4_age2_m_newp ; s_i_v4_age3_m_newp + i_v4_age3_m_newp ;
	s_i_v4_age4_m_newp + i_v4_age4_m_newp ; s_i_v4_age5_m_newp + i_v4_age5_m_newp ;
	s_i_v4_age1_w_ep + i_v4_age1_w_ep ; s_i_v4_age2_w_ep + i_v4_age2_w_ep ; s_i_v4_age3_w_ep + i_v4_age3_w_ep ; 
	s_i_v4_age4_w_ep + i_v4_age4_w_ep ; s_i_v4_age5_w_ep + i_v4_age5_w_ep ; 
	s_i_v4_age1_m_ep + i_v4_age1_m_ep ; s_i_v4_age2_m_ep + i_v4_age2_m_ep ; s_i_v4_age3_m_ep + i_v4_age3_m_ep ; 
	s_i_v4_age4_m_ep + i_v4_age4_m_ep ; s_i_v4_age5_m_ep + i_v4_age5_m_ep ; 

	s_i_v5_age1_w_np + i_v5_age1_w_np ; s_i_v5_age2_w_np + i_v5_age2_w_np ; s_i_v5_age3_w_np + i_v5_age3_w_np ;
	s_i_v5_age4_w_np + i_v5_age4_w_np ; s_i_v5_age5_w_np + i_v5_age5_w_np ;
	s_i_v5_age1_m_np + i_v5_age1_m_np ; s_i_v5_age2_m_np + i_v5_age2_m_np ; s_i_v5_age3_m_np + i_v5_age3_m_np ;
	s_i_v5_age4_m_np + i_v5_age4_m_np ; s_i_v5_age5_m_np + i_v5_age5_m_np ;
	s_i_v5_age1_w_newp + i_v5_age1_w_newp ; s_i_v5_age2_w_newp + i_v5_age2_w_newp ; s_i_v5_age3_w_newp + i_v5_age3_w_newp ;
	s_i_v5_age4_w_newp + i_v5_age4_w_newp ; s_i_v5_age5_w_newp + i_v5_age5_w_newp ;
	s_i_v5_age1_m_newp + i_v5_age1_m_newp ; s_i_v5_age2_m_newp + i_v5_age2_m_newp ; s_i_v5_age3_m_newp + i_v5_age3_m_newp ;
	s_i_v5_age4_m_newp + i_v5_age4_m_newp ; s_i_v5_age5_m_newp + i_v5_age5_m_newp ;
	s_i_v5_age1_w_ep + i_v5_age1_w_ep ; s_i_v5_age2_w_ep + i_v5_age2_w_ep ; s_i_v5_age3_w_ep + i_v5_age3_w_ep ; 
	s_i_v5_age4_w_ep + i_v5_age4_w_ep ; s_i_v5_age5_w_ep + i_v5_age5_w_ep ; 
	s_i_v5_age1_m_ep + i_v5_age1_m_ep ; s_i_v5_age2_m_ep + i_v5_age2_m_ep ; s_i_v5_age3_m_ep + i_v5_age3_m_ep ; 
	s_i_v5_age4_m_ep + i_v5_age4_m_ep ; s_i_v5_age5_m_ep + i_v5_age5_m_ep ; 

	s_i_v6_age1_w_np + i_v6_age1_w_np ; s_i_v6_age2_w_np + i_v6_age2_w_np ; s_i_v6_age3_w_np + i_v6_age3_w_np ;
	s_i_v6_age4_w_np + i_v6_age4_w_np ; s_i_v6_age5_w_np + i_v6_age5_w_np ;
	s_i_v6_age1_m_np + i_v6_age1_m_np ; s_i_v6_age2_m_np + i_v6_age2_m_np ; s_i_v6_age3_m_np + i_v6_age3_m_np ;
	s_i_v6_age4_m_np + i_v6_age4_m_np ; s_i_v6_age5_m_np + i_v6_age5_m_np ;
	s_i_v6_age1_w_newp + i_v6_age1_w_newp ; s_i_v6_age2_w_newp + i_v6_age2_w_newp ; s_i_v6_age3_w_newp + i_v6_age3_w_newp ;
	s_i_v6_age4_w_newp + i_v6_age4_w_newp ; s_i_v6_age5_w_newp + i_v6_age5_w_newp ;
	s_i_v6_age1_m_newp + i_v6_age1_m_newp ; s_i_v6_age2_m_newp + i_v6_age2_m_newp ; s_i_v6_age3_m_newp + i_v6_age3_m_newp ;
	s_i_v6_age4_m_newp + i_v6_age4_m_newp ; s_i_v6_age5_m_newp + i_v6_age5_m_newp ;
	s_i_v6_age1_w_ep + i_v6_age1_w_ep ; s_i_v6_age2_w_ep + i_v6_age2_w_ep ; s_i_v6_age3_w_ep + i_v6_age3_w_ep ; 
	s_i_v6_age4_w_ep + i_v6_age4_w_ep ; s_i_v6_age5_w_ep + i_v6_age5_w_ep ; 
	s_i_v6_age1_m_ep + i_v6_age1_m_ep ; s_i_v6_age2_m_ep + i_v6_age2_m_ep ; s_i_v6_age3_m_ep + i_v6_age3_m_ep ; 
	s_i_v6_age4_m_ep + i_v6_age4_m_ep ; s_i_v6_age5_m_ep + i_v6_age5_m_ep ; 

	s_i_age1_m_np + i_age1_m_np ; s_i_age2_m_np + i_age2_m_np ; s_i_age3_m_np + i_age3_m_np ; s_i_age4_m_np + i_age4_m_np ; s_i_age5_m_np + i_age5_m_np ; 
	s_i_age1_w_np + i_age1_w_np ; s_i_age2_w_np + i_age2_w_np ; s_i_age3_w_np + i_age3_w_np ; s_i_age4_w_np + i_age4_w_np ; s_i_age5_w_np + i_age5_w_np ; 

	s_i_age1_m_newp + i_age1_m_newp ; s_i_age2_m_newp + i_age2_m_newp ; s_i_age3_m_newp + i_age3_m_newp ; s_i_age4_m_newp + i_age4_m_newp ; s_i_age5_m_newp + i_age5_m_newp ; 
	s_i_age1_w_newp + i_age1_w_newp ; s_i_age2_w_newp + i_age2_w_newp ; s_i_age3_w_newp + i_age3_w_newp ; s_i_age4_w_newp + i_age4_w_newp ; s_i_age5_w_newp + i_age5_w_newp ; 

	s_i_m_1549_np + i_m_1549_np ; s_i_w_1549_np +  i_w_1549_np ;

	/*resistance*/

	s_tam1_ + tam1_ ; s_tam2_ + tam2_ ; s_tam3_ + tam3_ ; s_m184m_ + m184m_ ; s_k103m_ + k103m_ ; s_y181m_ + y181m_ ; s_g190m_ + g190m_ ; 
	s_nnm_ + nnm_ ; s_q151m_ + q151m_ ; s_k65m_ + k65m_ ; s_p32m_ + p32m_ ; s_p33m_ + p33m_ ; s_p46m_ + p46m_ ; s_p47m_ + p47m_ ; s_p50vm_ + p50vm_ ;
	s_p50lm_ + p50lm_ ; s_p54m_ + p54m_ ; s_p76m_ + p76m_ ; s_p82m_ + p82m_ ; s_p84m_ + p84m_ ; s_p88m_ + p88m_ ; s_p90m_ + p90m_ ; s_pim_ + pim_;
    s_inpm_ + inpm_ ; s_insm_ + insm_ ; s_rm_ + rm_ ; s_i_nnm + i_nnm ; s_i_rm + i_rm ; s_i_pim + i_pim ; s_i_tam + i_tam ; s_i_im + i_im ;
    s_inm_ + inm_ ; s_i_184m + i_184m ; s_im_art + im_art ; s_pim_art + pim_art ; s_tam_art + tam_art ; s_m184_art + m184_art ; s_r_ + r_ ;
    s_r_3tc + r_3tc ; s_r_nev + r_nev ; s_r_lpr + r_lpr ; s_r_taz + r_taz ; s_r_efa + r_efa ; s_r_ten + r_ten ; s_r_zdv + r_zdv ; s_r_dol + r_dol ;
 	s_rme_ + rme_ ; s_iime_ = iime_ ; s_nnme_ = nnme_ ; s_pime_ = pime_ ; s_nrtime_ = nrtime_ ; s_res_1stline_startline2 + res_1stline_startline2 ;
	s_nnm_art + nnm_art ; s_nnm_art_m + nnm_art_m ; s_nnm_art_w + nnm_art_w ; s_r_art + r_art ; s_acq_rt65m + acq_rt65m ; s_acq_rt184m + acq_rt184m ;
	s_acq_rtm + acq_rtm ; s_onart_iicu_res + onart_iicu_res ; s_nactive_art_start_lt2 + nactive_art_start_lt2 ; s_nactive_art_start_lt3 + nactive_art_start_lt3 ;
	s_nactive_art_start_lt1p5 + nactive_art_start_lt1p5 ; s_nactive_line2_lt4 + nactive_line2_lt4 ; s_nactive_line2_lt3 + nactive_line2_lt3 ;
	s_nactive_line2_lt2 + nactive_line2_lt2 ; s_nactive_line2_lt1p5 + nactive_line2_lt1p5 ; s_pim_line2 +  pim_line2 ; s_nn_res_pmtct + nn_res_pmtct ;
    s_nn_res_pmtct_art_notdr + nn_res_pmtct_art_notdr ; s_super_i_r + super_i_r ; s_onart_efa_r + onart_efa_r ; s_onart_efa_r_2l + onart_efa_r_2l ;
  	s_onefa_linefail1_r + onefa_linefail1_r ; s_o_dol_2nd_vlg1000 + o_dol_2nd_vlg1000 ;
	s_o_dol_2nd_vlg1000_dolr1_adh0 + o_dol_2nd_vlg1000_dolr1_adh0 ; s_o_dol_2nd_vlg1000_dolr1_adh1 + o_dol_2nd_vlg1000_dolr1_adh1 ;
	s_o_dol_2nd_vlg1000_dolr0_adh0 + o_dol_2nd_vlg1000_dolr0_adh0 ; s_o_dol_2nd_vlg1000_dolr0_adh1 + o_dol_2nd_vlg1000_dolr0_adh1 ;
    s_ontle + ontle; s_vlg1000_ontle + vlg1000_ontle; s_vlg1000_184m_ontle + vlg1000_184m_ontle; s_vlg1000_65m_ontle + vlg1000_65m_ontle;   
	s_vlg1000_nnm_ontle + vlg1000_nnm_ontle; s_ontld + ontld ; s_vlg1000_ontld + vlg1000_ontld; s_vlg1000_65m_ontld + vlg1000_65m_ontld; 
	s_vlg1000_184m_ontld + vlg1000_184m_ontld;  s_vlg1000_nnm_ontld + vlg1000_nnm_ontld; s_vlg1000_inm_ontld + vlg1000_inm_ontld;
    s_vlg1000_tams_ontld + vlg1000_tams_ontld; s_vlg1000_tams_ontle + vlg1000_tams_ontle;      


	/*prep*/

	s_prep + prep;  s_prep_sw + prep_sw ; s_prep_w_1524 + prep_w_1524 ; s_elig_prep_epdiag + elig_prep_epdiag ; s_infected_prep + infected_prep ;
	s_prep_ever + prep_ever ; s_primary_prep + primary_prep ; s_hiv1_prep + hiv1_prep ; s_i_r_prep + i_r_prep ; s_primary_r_prep + primary_r_prep ;
	s_ever_i_nor_prep + ever_i_nor_prep ; s_rm_prep + rm_prep ;  s_elig_prep_onprep + elig_prep_onprep ;
	s_elig_prep + elig_prep ; s_hr_noprep + hr_noprep ; s_primary_hr_noprep + primary_hr_noprep ;
	s_rt65m_3_prep + rt65m_3_prep ; s_rt184m_3_prep + rt184m_3_prep ; s_rtm_3_prep + rtm_3_prep ; s_rt65m_6_prep + rt65m_6_prep ; 
	s_rt184m_6_prep + rt184m_6_prep ; s_rtm_6_prep + rtm_6_prep ; s_rt65m_9_prep + rt65m_9_prep ; s_rt184m_9_prep + rt184m_9_prep ;               
    s_rtm_9_prep + rtm_9_prep ; s_rt65m_12_prep + rt65m_12_prep ; s_rt184m_12_prep + rt184m_12_prep ; s_rtm_12_prep + rtm_12_prep ;        
    s_rt65m_18_prep + rt65m_18_prep ; s_rt184m_18_prep + rt184m_18_prep ; s_rtm_18_prep + rtm_18_prep ; s_onprep_3 + onprep_3 ; s_onprep_6 + onprep_6 ;       
    s_onprep_9 + onprep_9 ; s_onprep_12 + onprep_12 ; s_onprep_18 + onprep_18 ; s_prepstart + prepstart ; 
	s_ever_stopped_prep_choice + ever_stopped_prep_choice ; s_preprestart + preprestart ; s_acq_rt65m_3_prep + acq_rt65m_3_prep ;   
    s_acq_rt184m_3_prep + acq_rt184m_3_prep ; s_acq_rtm_3_prep + acq_rtm_3_prep ; s_acq_rt65m_6_prep + acq_rt65m_6_prep ; 
	s_acq_rt184m_6_prep + acq_rt184m_6_prep ; s_acq_rtm_6_prep + acq_rtm_6_prep ; s_acq_rt65m_9_prep + acq_rt65m_9_prep ; 
	s_acq_rt184m_9_prep + acq_rt184m_9_prep ; s_acq_rtm_9_prep + acq_rtm_9_prep ; s_acq_rt65m_12_prep + acq_rt65m_12_prep ;
    s_acq_rt184m_12_prep + acq_rt184m_12_prep ; s_acq_rtm_12_prep + acq_rtm_12_prep ; s_acq_rt65m_18_prep + acq_rt65m_18_prep ;
	s_acq_rt184m_18_prep + acq_rt184m_18_prep ; s_acq_rtm_18_prep + acq_rtm_18_prep ;                                              
	s_inf_prep_adhg80 + inf_prep_adhg80 ; s_inf_prep_adh5080 + inf_prep_adh5080 ;
    s_inf_prep_adhl50 + inf_prep_adhl50 ; s_prep_adhg80 + prep_adhg80 ; s_prep_adh5080 + prep_adh5080 ; s_prep_adhl50 + prep_adhl50 ;
	s_onprep_1549 + onprep_1549 ; s_onprep_m + onprep_m ; s_onprep_w + onprep_w ; s_onprep_sw + onprep_sw ; s_onprep_1524 + onprep_1524 ;
	s_onprep_1524w + onprep_1524w ; s_elig_prep_sw + elig_prep_sw ; s_elig_prep_w_1549 + elig_prep_w_1549;  s_prep_w_1549 + prep_w_1549;
	s_elig_prep_w_1524 + elig_prep_w_1524 ; s_elig_prep_w_2534 + elig_prep_w_2534 ; s_elig_prep_w_3544 + elig_prep_w_3544 ;
    s_prep_w_2534 + prep_w_2534 ; s_prep_w_3544 + prep_w_3544 ; s_infected_prep_source_prep_r + infected_prep_source_prep_r ;
    s_prepinfect_prep_r + prepinfect_prep_r ; s_prepinfect_prep_r_p + prepinfect_prep_r_p ; s_infected_prep_no_r + infected_prep_no_r ;
    s_infected_prep_r + infected_prep_r ; s_started_prep_in_primary + started_prep_in_primary ; s_tot_yrs_prep + tot_yrs_prep ;
	s_onprep_3_i_prep_no_r + onprep_3_i_prep_no_r ; s_onprep_6_i_prep_no_r + onprep_6_i_prep_no_r ; s_onprep_9_i_prep_no_r + onprep_9_i_prep_no_r ;
    s_onprep_12_i_prep_no_r + onprep_12_i_prep_no_r ;  s_onprep_18_i_prep_no_r + onprep_18_i_prep_no_r ; s_prepinfect_rm_p + prepinfect_rm_p ;     
	s_prepinfect_m184m_p + prepinfect_m184m_p ; s_prepinfect_k65m_p + prepinfect_k65m_p ; s_prepinfect_tam_p + prepinfect_tam_p ; 
 	s_prepinfect_rtm + prepinfect_rtm ; s_prepinfect_k65m + prepinfect_k65m ; s_prepinfect_m184m + prepinfect_m184m ; s_prepinfect_tam + prepinfect_tam ;
 	s_prep_willing_pop + prep_willing_pop ; s_prep_willing_sw + prep_willing_sw ; s_stop_prep_choice + stop_prep_choice ; 
	s_started_prep_hiv_test_sens + started_prep_hiv_test_sens ; s_cur_res_prep_drug + cur_res_prep_drug ; 
	s_started_prep_hiv_test_sens_e + started_prep_hiv_test_sens_e ; s_started_prep_in_primary_e +  started_prep_in_primary_e ; 
 	s_cur_res_ten + cur_res_ten ; s_cur_res_3tc + cur_res_3tc ; s_i_65m + i_65m ; s_cur_res_efa + cur_res_efa ;  		   	   		   	     
  	s_cur_res_ten_vlg1000 + cur_res_ten_vlg1000 ; s_cur_res_3tc_vlg1000 + cur_res_3tc_vlg1000 ; s_cur_res_efa_vlg1000 + cur_res_efa_vlg1000 ;		  	           
 	s_ever_hiv1_prep + ever_hiv1_prep ; s_cur_res_efa_ever_hiv1_prep + cur_res_efa_ever_hiv1_prep ; s_cur_res_ten_ever_hiv1_prep + cur_res_ten_ever_hiv1_prep ;		   				
	s_cur_res_3tc_ever_hiv1_prep + cur_res_3tc_ever_hiv1_prep ; s_prep_effectiveness_non_res_v + prep_effectiveness_non_res_v ;				   		    				  			
 	s_prep_3m_after_inf_no_r + prep_3m_after_inf_no_r ; s_prep_3m_after_inf_no_r_184 + prep_3m_after_inf_no_r_184 ; 	 
	s_prep_3m_after_inf_no_r_65 + prep_3m_after_inf_no_r_65 ; s_prep_6m_after_inf_no_r + prep_6m_after_inf_no_r ;  
    s_prep_6m_after_inf_no_r_184 + prep_6m_after_inf_no_r_184 ; s_prep_6m_after_inf_no_r_65 + prep_6m_after_inf_no_r_65 ;   				    
 	s_prep_12m_after_inf_no_r + prep_12m_after_inf_no_r ; s_prep_12m_after_inf_no_r_184 + prep_12m_after_inf_no_r_184 ; 
	s_prep_12m_after_inf_no_r_65 + prep_12m_after_inf_no_r_65 ; s_hiv_prep_reason_1 + hiv_prep_reason_1 ; s_hiv_prep_reason_2 + hiv_prep_reason_2 ;
 	s_hiv_prep_reason_3 + hiv_prep_reason_3 ; s_hiv_prep_reason_4 + hiv_prep_reason_4 ;  s_prep_newp + prep_newp ;
    s_prep_newpg0 + prep_newpg0 ; s_prep_newpg1 + prep_newpg1 ; s_prep_newpg2 + prep_newpg2 ; s_prep_newpg3 + prep_newpg3 ; 
	s_prep_newpg4  + prep_newpg4  ; s_newp_this_per_age1524w_onprep + newp_this_per_age1524w_onprep ;
  	s_newp_this_per_age1524w + newp_this_per_age1524w ; s_prep_ever_w_1524 + prep_ever_w_1524 ; s_prep_ever_w + prep_ever_w ;
    s_test_gt_period1_on_prep + test_gt_period1_on_prep ; s_test_gt_period1_on_prep_pos + test_gt_period1_on_prep_pos ;
    s_test_period1_on_prep + test_period1_on_prep ; s_test_period1_on_prep_pos + test_period1_on_prep_pos ; s_prepuptake_sw + prepuptake_sw ;
	s_prepuptake_pop + prepuptake_pop ; s_prob_prep_restart_choice + prob_prep_restart_choice ; s_prep_all_past_year + prep_all_past_year ;
    s_tot_yrs_prep_gt_5 + tot_yrs_prep_gt_5 ; s_tot_yrs_prep_gt_10 + tot_yrs_prep_gt_10 ; s_tot_yrs_prep_gt_20 + tot_yrs_prep_gt_20 ;
	s_pop_wide_tld_prep + pop_wide_tld_prep ;    
       
	/*testing and diagnosis*/

	s_tested + tested ; s_tested_m + tested_m ; s_tested_f + tested_f ; s_tested_f_non_anc + tested_f_non_anc ; s_tested_f_anc + tested_f_anc ;
	s_ever_tested_m + ever_tested_m ; s_ever_tested_w + ever_tested_w ; s_firsttest + firsttest ; s_tested1549_ + tested1549_ ;
	s_tested1549m + tested1549m ; s_tested1549w + tested1549w ; s_tested_4p_m1549_ + tested_4p_m1549_ ; s_tested_4p_m1519_ + tested_4p_m1519_ ;
    s_tested_4p_m2024_ + tested_4p_m2024_ ; s_tested_4p_m2529_ + tested_4p_m2529_ ; s_tested_4p_m3039_ + tested_4p_m3039_ ; 
	s_tested_4p_m4049_ + tested_4p_m4049_ ; s_tested_4p_m5064_ + tested_4p_m5064_ ; s_tested_4p_w1549_ + tested_4p_w1549_ ; 
	s_tested_4p_w1519_ + tested_4p_w1519_ ; s_tested_4p_w2024_ + tested_4p_w2024_ ; s_tested_4p_w2529_ + tested_4p_w2529_ ;
	s_tested_4p_w3039_ + tested_4p_w3039_ ; s_tested_4p_w4049_ + tested_4p_w4049_ ; s_tested_4p_w5064_ + tested_4p_w5064_ ;
 	s_tested_4p_sw + tested_4p_sw ; 
	s_ever_tested_m1549_ + ever_tested_m1549_ ; s_ever_tested_m1519_ + ever_tested_m1519_ ;
    s_ever_tested_m2024_ + ever_tested_m2024_ ; s_ever_tested_m2529_ + ever_tested_m2529_ ; s_ever_tested_m3034_ + ever_tested_m3034_ ;
   	s_ever_tested_m3539_ + ever_tested_m3539_ ; s_ever_tested_m4044_ + ever_tested_m4044_ ; s_ever_tested_m4549_ + ever_tested_m4549_ ;
	s_ever_tested_m5054_ + ever_tested_m5054_ ; s_ever_tested_m5559_ + ever_tested_m5559_ ; s_ever_tested_m6064_ + ever_tested_m6064_ ;
	s_ever_tested_w1549_ + ever_tested_w1549_ ; s_ever_tested_w1519_ + ever_tested_w1519_ ;
    s_ever_tested_w2024_ + ever_tested_w2024_ ; s_ever_tested_w2529_ + ever_tested_w2529_ ; s_ever_tested_w3034_ + ever_tested_w3034_ ;
   	s_ever_tested_w3539_ + ever_tested_w3539_ ; s_ever_tested_w4044_ + ever_tested_w4044_ ; s_ever_tested_w4549_ + ever_tested_w4549_ ;
	s_ever_tested_w5054_ + ever_tested_w5054_ ; s_ever_tested_w5559_ + ever_tested_w5559_ ; s_ever_tested_w6064_ + ever_tested_w6064_ ;
	s_ever_tested_sw + ever_tested_sw ; 
	s_elig_test_who4 + elig_test_who4 ; s_elig_test_who3 + elig_test_who3 ; s_elig_test_tb + elig_test_tb ; s_elig_test_who4_tested + elig_test_who4_tested ;
    s_elig_test_tb_tested + elig_test_tb_tested ; s_elig_test_who3_tested + elig_test_who3_tested ; s_com_test + com_test ; 
	s_tested_anc_prevdiag + tested_anc_prevdiag ; s_tested_anc + tested_anc ; s_tested_as_sw + tested_as_sw ; s_tested_m_sympt + tested_m_sympt ;    
	s_tested_f_sympt + tested_f_sympt ; s_tested_f_sw + tested_f_sw ; s_tested_m_circ + tested_m_circ ; s_rate_1sttest + rate_1sttest ;
    s_rate_reptest + rate_reptest ; s_newp_lasttest_tested_this_per + newp_lasttest_tested_this_per ; s_acc_test + acc_test ; 
	s_acc_test_1524_ + acc_test_1524_ ; s_acc_test_2549_ + acc_test_2549_ ; s_acc_test_5064_ + acc_test_5064_ ; s_acc_test_sw + acc_test_sw ;     
    s_diag + registd ;  s_diag_m1549_ + diag_m1549_ ; s_diag_w1549_ + diag_w1549_ ; 
    s_diag_m1519_ + diag_m1519_ ; s_diag_m2024_ + diag_m2024_ ; s_diag_m2529_ + diag_m2529_ ; s_diag_m3034_ + diag_m3034_ ; s_diag_m3539_ + diag_m3539_ ;      
    s_diag_m4044_ + diag_m4044_ ; s_diag_m4549_ + diag_m4549_ ; s_diag_m5054_ + diag_m5054_ ; s_diag_m5559_ + diag_m5559_ ; s_diag_m6064_ + diag_m6064_ ; 
    s_diag_w1519_ + diag_w1519_ ; s_diag_w2024_ + diag_w2024_ ; s_diag_w2529_ + diag_w2529_ ; s_diag_w3034_ + diag_w3034_ ; s_diag_w3539_ + diag_w3539_ ;      
    s_diag_w4044_ + diag_w4044_ ; s_diag_w4549_ + diag_w4549_ ; s_diag_w5054_ + diag_w5054_ ; s_diag_w5559_ + diag_w5559_ ; s_diag_w6064_ + diag_w6064_ ; 
	s_diag_sw + diag_sw ; s_nn_tdr_diag + nn_tdr_diag ; s_diag_this_period + diag_this_period ; s_diag_this_period_m + diag_this_period_m ;
	s_diag_this_period_f + diag_this_period_f ; s_diag_this_period_f_non_anc + diag_this_period_f_non_anc ; 
	s_diag_this_period_f_anc + diag_this_period_f_anc ; s_diag_this_period_m_sympt + diag_this_period_m_sympt ; 
	s_diag_this_period_f_sympt + diag_this_period_f_sympt ; s_sympt_diag + sympt_diag ; s_sympt_diag_ever + sympt_diag_ever ; s_diag_m + diag_m ;
	s_diag_w + diag_w ; s_epdiag_m + epdiag_m ; s_epdiag_w + epdiag_w ; s_epi_m  + epi_m  ; s_epi_w + epi_w ; s_diag_ep + diag_ep ;
             
	/*VL and CD4*/

	s_vlg1 + vlg1 ; s_vlg2 + vlg2 ; s_vlg3 + vlg3 ; s_vlg4 + vlg4 ; s_vlg5 + vlg5 ; s_vlg6 + vlg6 ; 
	s_line1_vlg1000 + line1_vlg1000 ; s_line2_vlg1000 + line2_vlg1000 ; s_res_vfail1 + res_vfail1 ; s_u_vfail1_this_period + u_vfail1_this_period ;
	s_u_vfail1 + u_vfail1 ; s_vl_vfail1_g1 + vl_vfail1_g1 ; s_vl_vfail1_g2 + vl_vfail1_g2 ; s_vl_vfail1_g3 + vl_vfail1_g3 ; 
	s_vl_vfail1_g4 + vl_vfail1_g4 ; s_vl_vfail1_g5 + vl_vfail1_g5 ; s_vl_vfail1_g6 + vl_vfail1_g6 ; s_vlg1000_onart + vlg1000_onart ;
	s_vlg1000_184m + vlg1000_184m ; s_vlg1000_65m + vlg1000_65m ; s_vlg1000_onart_184m + vlg1000_onart_184m ; s_vlg1000_onart_65m + vlg1000_onart_65m ;
	s_sw_vg1000 + sw_vg1000 ; s_vg1000 + vg1000 ; s_vg1000_m + vg1000_m ; s_vg1000_w + vg1000_w ; s_vg1000_m_1524 + vg1000_m_1524;
	s_vg1000_w_1524 + vg1000_w_1524;  s_r_vg50 + r_vg50 ; s_r_vg200 + r_vg200 ;
	s_r_vg1000 + r_vg1000 ; s_vl1000 + vl1000 ; s_vl1000_art + vl1000_art ; s_onart_iicu + onart_iicu ; s_vl1000_art_iicu + vl1000_art_iicu ;
    s_onart_gt6m + onart_gt6m ; s_vl1000_art_gt6m + vl1000_art_gt6m ; s_onart_gt6m_iicu + onart_gt6m_iicu ; 
	s_vl1000_art_gt6m_iicu + vl1000_art_gt6m_iicu; s_vl1000_m + vl1000_m ; s_vl1000_art_m + vl1000_art_m ; s_onart_iicu_m + onart_iicu_m ;
    s_vl1000_art_iicu_m + vl1000_art_iicu_m ; s_onart_gt6m_m + onart_gt6m_m ; s_vl1000_art_gt6m_m + vl1000_art_gt6m_m ;       
	s_onart_gt6m_iicu_m + onart_gt6m_iicu_m ; s_vl1000_art_gt6m_iicu_m + vl1000_art_gt6m_iicu_m ; s_vl1000_w + vl1000_w ; s_vl1000_art_w + vl1000_art_w ;	  	        
 	s_onart_iicu_w + onart_iicu_w ; s_vl1000_art_iicu_w + vl1000_art_iicu_w ; s_onart_gt6m_w + onart_gt6m_w ; s_vl1000_art_gt6m_w + vl1000_art_gt6m_w ;
	s_onart_gt6m_iicu_w + onart_gt6m_iicu_w ; s_vl1000_art_gt6m_iicu_w + vl1000_art_gt6m_iicu_w ; s_vl1000_art_1524_ + vl1000_art_1524_ ;       
 	s_onart_iicu_1524_ + onart_iicu_1524_ ; s_vl1000_art_iicu_1524_ + vl1000_art_iicu_1524_ ; s_onart_gt6m_1524_ + onart_gt6m_1524_ ;
 	s_vl1000_art_gt6m_1524_ + vl1000_art_gt6m_1524_ ; s_onart_gt6m_iicu_1524_ + onart_gt6m_iicu_1524_ ; 
	s_vl1000_art_gt6m_iicu_1524_ + vl1000_art_gt6m_iicu_1524_ ; s_vl1000_art_2549_ + vl1000_art_2549_ ; s_onart_iicu_2549_ + onart_iicu_2549_ ;
    s_vl1000_art_iicu_2549_ + vl1000_art_iicu_2549_ ; s_onart_gt6m_2549_ + onart_gt6m_2549_ ; s_vl1000_art_gt6m_2549_ + vl1000_art_gt6m_2549_ ;             
    s_onart_gt6m_iicu_2549_ + onart_gt6m_iicu_2549_ ; s_vl1000_art_gt6m_iicu_2549_ + vl1000_art_gt6m_iicu_2549_ ; 
	s_vl1000_art_50pl_ + vl1000_art_50pl_ ; s_onart_iicu_50pl_ + onart_iicu_50pl_ ; s_vl1000_art_iicu_50pl_ + vl1000_art_iicu_50pl_ ;
	s_onart_gt6m_50pl_ + onart_gt6m_50pl_ ; s_vl1000_art_gt6m_50pl_ + vl1000_art_gt6m_50pl_ ; s_onart_gt6m_iicu_50pl_ + onart_gt6m_iicu_50pl_ ;
 	s_vl1000_art_gt6m_iicu_50pl_ + vl1000_art_gt6m_iicu_50pl_ ; s_vl1000_art_incintcun_sw + vl1000_art_incintcun_sw ;
	s_vl1000_art_gt6m_iicu_sw + vl1000_art_gt6m_iicu_sw ; s_onart_gt6m_iicu_sw + onart_gt6m_iicu_sw ;
    s_u_vfail1_dol_this_period + u_vfail1_dol_this_period ; s_o_dol_at_risk_uvfail + o_dol_at_risk_uvfail ; s_elig_treat200 + elig_treat200 ;
    s_elig_treat350 + elig_treat350 ; s_elig_treat500 + elig_treat500 ; s_cl100 + cl100 ; s_cl50 + cl50 ; s_cl200 + cl200 ; s_cl350 + cl350 ;
	s_cd4art_started_this_period + cd4art_started_this_period ; s_cd4diag_diag_this_period + cd4diag_diag_this_period ;

	/*ART*/

	s_naive + naive; s_naive_m + naive_m ; s_naive_w + naive_w ; s_onart + onart ; s_int_clinic_not_aw + int_clinic_not_aw ; s_art_start + art_start ; 
	s_art_start_m + art_start_m ; s_art_start_w + art_start_w ; s_artexp  + artexp  ; s_artexpoff +  artexpoff ; s_onart_m + onart_m ; s_onart_w + onart_w ; 
	s_onart_m1549_ + onart_m1549_ ; s_onart_m1564_ + onart_m1564_ ; s_onart_m1519_ + onart_m1519_ ; s_onart_m2024_ + onart_m2024_ ; 
  	s_onart_m2529_ + onart_m2529_ ; s_onart_m3034_ + onart_m3034_ ; s_onart_m3539_ + onart_m3539_ ; s_onart_m4044_ + onart_m4044_ ;
 	s_onart_m4549_ + onart_m4549_ ; s_onart_m5054_ + onart_m5054_ ; s_onart_m5559_ + onart_m5559_ ; s_onart_m6064_ + onart_m6064_ ;
	s_onart_m6569_ + onart_m6569_ ; s_onart_m7074_ + onart_m7074_ ; s_onart_m7579_ + onart_m7579_ ; s_onart_m8084_ + onart_m8084_ ;
	s_onart_m85pl_ + onart_m85pl_ ;
	s_onart_w1549_ + onart_w1549_ ; s_onart_w1564_ + onart_w1564_ ; s_onart_w1519_ + onart_w1519_ ; s_onart_w2024_ + onart_w2024_ ; 
  	s_onart_w2529_ + onart_w2529_ ; s_onart_w3034_ + onart_w3034_ ; s_onart_w3539_ + onart_w3539_ ; s_onart_w4044_ + onart_w4044_ ;
 	s_onart_w4549_ + onart_w4549_ ; s_onart_w5054_ + onart_w5054_ ; s_onart_w5559_ + onart_w5559_ ; s_onart_w6064_ + onart_w6064_ ;  
	s_onart_w6569_ + onart_w6569_ ; s_onart_w7074_ + onart_w7074_ ; s_onart_w7579_ + onart_w7579_ ; s_onart_w8084_ + onart_w8084_ ;
	s_onart_w85pl_ + onart_w85pl_ ;
    s_onart_sw + onart_sw ; s_art_dur_l6m + art_dur_l6m ; s_art_dur_g6m + art_dur_g6m ; s_art_tdur_l6m + art_tdur_l6m ; s_art_tdur_g6m + art_tdur_g6m ;
	s_eponart_m + eponart_m ; s_eponart_w + eponart_w ; s_hiv1564_onart + hiv1564_onart ; s_dead1564_onart + dead1564_onart ; 
	s_who3_art_init + who3_art_init ; s_who4_art_init + who4_art_init ; s_art_start_pregnant + art_start_pregnant ; 
	s_lpr + o_lpr ; s_taz + o_taz ; s_3tc + o_3tc ; s_nev + o_nev ; s_efa + o_efa ; s_ten + o_ten ; s_zdv + o_zdv ; s_dol + o_dol ; 
	s_onefa_linefail1 + onefa_linefail1 ; s_ev_art_g1k_l1k + ev_art_g1k_l1k ; s_ev_art_g1k_not2l + ev_art_g1k_not2l ; 
	s_ev_art_g1k_not2l_l1k + ev_art_g1k_not2l_l1k ; s_ev_art_g1k + ev_art_g1k ; s_ev_art_g1k_not2l_adc + ev_art_g1k_not2l_adc ;
   	s_art_12m + art_12m ; s_vl1000_art_12m + vl1000_art_12m ; s_art_24m + art_24m ; s_vl1000_art_24m + vl1000_art_24m ; s_art_12m_onart + art_12m_onart ;   
    s_vl1000_art_12m_onart + vl1000_art_12m_onart ; s_startedline2 + startedline2 ; s_start_line2_this_period + start_line2_this_period ;        
	s_line2_12m + line2_12m ; s_line2_12m_onart + line2_12m_onart ; s_line2_incl_int_clinic_not_aw + line2_incl_int_clinic_not_aw ;
	s_onart_vlg1000 + onart_vlg1000 ; s_ever_onart_gt6m_vlg1000 + ever_onart_gt6m_vlg1000 ; s_ever_onart_gt6m_vl_m_g1000 + ever_onart_gt6m_vl_m_g1000 ;
    s_onart_gt6m_vlg1000 + onart_gt6m_vlg1000 ; s_r_onart_gt6m_vlg1000 + r_onart_gt6m_vlg1000 ; s_onart_gt6m_nnres_vlg1000 + onart_gt6m_nnres_vlg1000 ;
    s_onart_gt6m_pires_vlg1000 + onart_gt6m_pires_vlg1000 ; s_onart_gt6m_res_vlg1000 + onart_gt6m_res_vlg1000 ; s_online1_vg1000 + online1_vg1000 ;
    s_online1_vg1000_lf1 + online1_vg1000_lf1 ; s_online1_vg1000_cd4l200 + online1_vg1000_cd4l200 ; s_offart_vl1000 + offart_vl1000 ;
	s_vl1000_line2_12m + vl1000_line2_12m ; s_vl1000_line2_12m_onart + vl1000_line2_12m_onart ; s_vl1000_line2 + vl1000_line2 ; s_offart + offart ;
    s_line1_ + line1_ ; s_line2_ + line2_ ; s_line1_lf0 + line1_lf0 ; s_line1_lf1 + line1_lf1 ; s_line1_lf1 + line1_lf1 ; s_line2_lf1 + line2_lf1 ;
    s_line2_lf2 + line2_lf2 ; s_linefail_ge1 + linefail_ge1 ; s_line1_fail_this_period + line1_fail_this_period ; s_lf1_past_yr + lf1_past_yr ;
    s_lf1_past_yr_line2 + lf1_past_yr_line2 ; s_onart_cl200 + onart_cl200 ; s_onart_cd4_g500 + onart_cd4_g500 ; s_onart_res + onart_res ;
    s_adh_low + adh_low ; s_adh_med + adh_med ; s_adh_hi + adh_hi ; s_adhav_low_onart + adhav_low_onart ; s_adhav_hi_onart + adhav_hi_onart ;
	s_v_alert_past_yr + v_alert_past_yr ; s_v_alert_past_yr_rm + v_alert_past_yr_rm ; s_v_alert_past_yr_vl1000 + v_alert_past_yr_vl1000 ; 
	s_v_alert_past_yr_adc + v_alert_past_yr_adc ; s_v_alert_past_yr_dead + v_alert_past_yr_dead ; s_v_alert_6m_ago_onart + v_alert_6m_ago_onart ;
    s_v_alert_6m_ago_onart_vl1000 + v_alert_6m_ago_onart_vl1000 ; s_v_alert_past_yr_rm_c + v_alert_past_yr_rm_c ; 
	s_e_v_alert_6m_ago_onart + e_v_alert_6m_ago_onart ; s_e_v_alert_6m_ago_onart_vl1000 + e_v_alert_6m_ago_onart_vl1000 ;
  	s_v_alert_3m_ago_onart + v_alert_3m_ago_onart ; s_v_alert_3m_ago_onart_vl1000 + v_alert_3m_ago_onart_vl1000 ; 
	s_v_alert_9m_ago_onart + v_alert_9m_ago_onart ; s_v_alert_9m_ago_onart_vl1000 + v_alert_9m_ago_onart_vl1000 ;
    s_v_alert_2y_ago_onart + v_alert_2y_ago_onart ; s_v_alert_2y_ago_onart_vl1000 + v_alert_2y_ago_onart_vl1000 ;   
    s_m6_after_alert + m6_after_alert ; s_m6_after_alert_vl1000 + m6_after_alert_vl1000 ; s_c_tox + c_tox ; s_cur_dol_cns_tox + cur_dol_cns_tox ;     
	s_cur_efa_cns_tox + cur_efa_cns_tox ; s_prev_oth_dol_adv_birth_e + prev_oth_dol_adv_birth_e ; 
	s_pregnant_oth_dol_adv_birth_e + pregnant_oth_dol_adv_birth_e ; s_ai_naive_no_pmtct_ + _ai_naive_no_pmtct_ ; 
	s_ai_naive_no_pmtct_c_r_ + _ai_naive_no_pmtct_c_r_ ; s_ai_naive_no_pmtct_c_nnm_ + _ai_naive_no_pmtct_c_nnm_ ;
    s_ai_naive_no_pmtct_c_pim_ + _ai_naive_no_pmtct_c_pim_ ; s_ai_naive_no_pmtct_c_inm_ + _ai_naive_no_pmtct_c_inm_ ;    
    s_ai_naive_no_pmtct_c_rt184m_ + _ai_naive_no_pmtct_c_rt184m_ ; s_ai_naive_no_pmtct_c_rt65m_ + _ai_naive_no_pmtct_c_rt65m_ ;      
 	s_ai_naive_no_pmtct_c_rttams_ + _ai_naive_no_pmtct_c_rttams_ ; s_ai_naive_no_pmtct_e_r_ + _ai_naive_no_pmtct_e_r_ ;
    s_ai_naive_no_pmtct_e_nnm_ + _ai_naive_no_pmtct_e_nnm_ ; s_ai_naive_no_pmtct_e_pim_ + _ai_naive_no_pmtct_e_pim_ ;
	s_ai_naive_no_pmtct_e_inm_ + _ai_naive_no_pmtct_e_inm_ ; s_ai_naive_no_pmtct_e_rt184m_ + _ai_naive_no_pmtct_e_rt184m_ ;
    s_ai_naive_no_pmtct_e_rt65m_ + _ai_naive_no_pmtct_e_rt65m_ ; s_ai_naive_no_pmtct_e_rttams_ + _ai_naive_no_pmtct_e_rttams_ ;   
    s_all_ai_ + _all_ai_ ; s_all_ai_c_r_ + _all_ai_c_r_ ; s_all_ai_c_nnm_ + _all_ai_c_nnm_ ; s_all_ai_c_pim_ + _all_ai_c_pim_ ;
    s_all_ai_c_inm_ + _all_ai_c_inm_ ; s_all_ai_c_rt184m_ + _all_ai_c_rt184m_ ; s_all_ai_c_rt65m_ + _all_ai_c_rt65m_ ;  
	s_all_ai_c_rttams_ + _all_ai_c_rttams_ ; s_all_ai_e_r_ + _all_ai_e_r_ ; s_all_ai_e_nnm_ + _all_ai_e_nnm_ ; s_all_ai_e_pim_ + _all_ai_e_pim_ ;
    s_all_ai_e_inm_ + _all_ai_e_inm_ ; s_all_ai_e_rt184m_ + _all_ai_e_rt184m_ ; s_all_ai_e_rt65m_ + _all_ai_e_rt65m_ ; 
	s_all_ai_e_rttams_ + _all_ai_e_rttams_ ; s_r_dol_ten3tc_r_f_1 + r_dol_ten3tc_r_f_1 ; s_outc_ten3tc_r_f_1_1 + outc_ten3tc_r_f_1_1 ;
	s_outc_ten3tc_r_f_1_2 + outc_ten3tc_r_f_1_2 ; s_outc_ten3tc_r_f_1_3 + outc_ten3tc_r_f_1_3 ; s_outc_ten3tc_r_f_1_4 + outc_ten3tc_r_f_1_4 ;
    s_outc_ten3tc_r_f_1_5 + outc_ten3tc_r_f_1_5 ; s_outc_ten3tc_r_f_1_6 + outc_ten3tc_r_f_1_6 ; s_outc_ten3tc_r_f_1_7 + outc_ten3tc_r_f_1_7 ;
 	s_drug_level_test + drug_level_test ; s_tle + tle ; s_tld + tld ; s_zld + zld ; s_zla + zla ; s_otherreg + otherreg ;
    s_no_recent_vm_gt1000 + no_recent_vm_gt1000 ; s_no_recent_vm_gt1000_dol + no_recent_vm_gt1000_dol ; 
	s_no_recent_vm_gt1000_efa + no_recent_vm_gt1000_efa ; s_recent_vm_gt1000 + recent_vm_gt1000 ; s_recent_vm_gt1000_dol + recent_vm_gt1000_dol ;        
	s_recent_vm_gt1000_efa + recent_vm_gt1000_efa ; s_recent_vm_gt1000_zdv + recent_vm_gt1000_zdv ; s_o_zdv_tox + o_zdv_tox ; s_o_3tc_tox + o_3tc_tox ;
	s_o_ten_tox + o_ten_tox ; s_o_taz_tox + o_taz_tox ; s_o_lpr_tox + o_lpr_tox ; s_o_efa_tox + o_efa_tox ; s_o_nev_tox + o_nev_tox ; 
   	s_o_dol_tox + o_dol_tox ; s_o_zdv_adh_hi + o_zdv_adh_hi ; s_o_3tc_adh_hi + o_3tc_adh_hi ; s_o_ten_adh_hi + o_ten_adh_hi ;
    s_o_taz_adh_hi + o_taz_adh_hi ; s_o_lpr_adh_hi + o_lpr_adh_hi ; s_o_efa_adh_hi + o_efa_adh_hi ; s_o_nev_adh_hi + o_nev_adh_hi ; s_o_dol_adh_hi + o_dol_adh_hi ; 
 	s_o_tle_tox + o_tle_tox ; s_o_tld_tox = o_tld_tox ; s_o_zld_tox + o_zld_tox ; s_o_zla_tox + o_zla_tox ; s_o_tle_adh_hi + o_tle_adh_hi ;
    s_o_tld_adh_hi + o_tld_adh_hi ; s_o_zld_adh_hi + o_zld_adh_hi ; s_o_zla_adh_hi + o_zla_adh_hi ; s_a_zld_if_reg_op_116 + a_zld_if_reg_op_116 ;   
    s_adh_hi_a_zld_if_reg_op_116 + adh_hi_a_zld_if_reg_op_116 ; s_nac_ge2p75_a_zld_if_reg_op_116 + nac_ge2p75_a_zld_if_reg_op_116 ;   
	s_nac_ge2p00_a_zld_if_reg_op_116 + nac_ge2p00_a_zld_if_reg_op_116 ; s_nac_ge1p50_a_zld_if_reg_op_116 + nac_ge1p50_a_zld_if_reg_op_116 ;
    s_start_zld_if_reg_op_116 + start_zld_if_reg_op_116 ; s_onart_start_zld_if_reg_op_116 + onart_start_zld_if_reg_op_116 ; 
	s_e_rt65m_st_zld_if_reg_op_116 + e_rt65m_st_zld_if_reg_op_116 ; s_n_zld_if_reg_op_116 + n_zld_if_reg_op_116 ;

	s_per1_art_int + per1_art_int ; 	s_per2_art_int + per2_art_int  ;	s_dead_per1_art_int+ dead_per1_art_int;  	s_dead_per2_art_int +dead_per2_art_int ;
	s_cd4_before_int+ cd4_before_int  ;	s_cd4_before_int_lt100 +cd4_before_int_lt100;  	s_cd4_before_int_100200 +cd4_before_int_100200;  
	s_cd4_per1_art_int +cd4_per1_art_int ;	s_cd4_per1_art_int_lt100+ cd4_per1_art_int_lt100; 	s_cd4_per1_art_int_100200 +cd4_per1_art_int_100200;
	s_cd4_per2_art_int +cd4_per2_art_int ;	s_cd4_per2_art_int_lt100+ cd4_per2_art_int_lt100; 	s_cd4_per2_art_int_100200+ cd4_per2_art_int_100200;

	s_started_art_as_tld_prep_vl1000 + started_art_as_tld_prep_vl1000 ;    s_onart_as_tld_prep + onart_as_tld_prep; 
	s_onart_as_tld_prep_vl1000 + onart_as_tld_prep_vl1000 ;    s_started_art_as_tld_prep + started_art_as_tld_prep ; 


	/*costs and dalys*/

	s_cost + cost ; s_onart_cost + onart_cost ; s_art_cost + art_cost ; s_adc_cost + adc_cost ; s_cd4_cost + cd4_cost ; s_vl_cost + vl_cost ; s_vis_cost + vis_cost ; 
	s_full_vis_cost + full_vis_cost ; s_who3_cost + who3_cost ; s_cot_cost + cot_cost ; s_tb_cost + tb_cost ; s_cost_test + cost_test ;
	s_res_cost + res_cost ; s_cost_circ + cost_circ ; s_cost_condom_dn + cost_condom_dn ; s_cost_sw_program + cost_sw_program ;  
	s_t_adh_int_cost + t_adh_int_cost ; s_cost_test_m + cost_test_m ; 
	s_cost_test_f + cost_test_f ; s_cost_prep + cost_prep ; s_cost_prep_visit + cost_prep_visit ; s_cost_prep_ac_adh + cost_prep_ac_adh ; 
	s_cost_test_m_sympt + cost_test_m_sympt ; s_cost_test_f_sympt + cost_test_f_sympt ;                         
    s_cost_test_m_circ + cost_test_m_circ ; s_cost_test_f_anc + cost_test_f_anc ; s_cost_test_f_sw + cost_test_f_sw ;                      
  	s_cost_test_f_non_anc + cost_test_f_non_anc ; s_pi_cost + pi_cost ;	s_cost_switch_line + cost_switch_line ; s_cost_child_hiv + cost_child_hiv ;   			
  	s_cost_child_hiv_mo_art + cost_child_hiv_mo_art ; s_cost_art_init + cost_art_init ; s_art_1_cost + art_1_cost ; s_art_2_cost + art_2_cost ;	     		     			 
	s_art_3_cost + art_3_cost ; s_cost_vl_not_done + cost_vl_not_done ; s_cost_zdv + cost_zdv ; s_cost_ten + cost_ten ; s_cost_3tc + cost_3tc ;  	    
 	s_cost_nev + cost_nev ; s_cost_lpr + cost_lpr ; s_cost_dar + cost_dar ; s_cost_taz + cost_taz ; s_cost_efa + cost_efa ; s_cost_dol + cost_dol ;  
    s_ly + _ly ; s_dly + _dly ; s_qaly + _qaly ; s_dqaly + _dqaly ; s_cost_ + _cost_ ; s_live_daly + live_daly ; s_live_ddaly + live_ddaly ;	  	  	 
	s_dcost_ + _dcost_ ; s_donart_cost + _donart_cost ; s_dart_cost + _dart_cost ; s_dadc_cost + _dadc_cost ; s_dcd4_cost + _dcd4_cost ; s_dvl_cost + _dvl_cost ; s_dvis_cost + _dvis_cost ;  	  	    	   	     	 	 	  	  	  	      
	s_dfull_vis_cost + _dfull_vis_cost ; s_dwho3_cost + _dwho3_cost ; s_dcot_cost + _dcot_cost ; s_dtb_cost + _dtb_cost ; s_dtest_cost + _dtest_cost ;
    s_dres_cost + _dres_cost ; s_dcost_circ + _dcost_circ ; s_dcost_condom_dn + dcost_condom_dn ;  s_dcost_sw_program + dcost_sw_program ;
	s_d_t_adh_int_cost + _d_t_adh_int_cost ; s_dtest_cost_m + _dtest_cost_m ; 
	s_dtest_cost_f + _dtest_cost_f ; s_dcost_prep + _dcost_prep ; s_dcost_prep_visit + _dcost_prep_visit ; s_dcost_prep_ac_adh + _dcost_prep_ac_adh ;          
	s_dcost_test_m_sympt + _dcost_test_m_sympt ; 
	s_dcost_test_f_sympt + _dcost_test_f_sympt ; s_dcost_test_m_circ + _dcost_test_m_circ ; s_dcost_test_f_anc + _dcost_test_f_anc ;
  	s_dcost_test_f_sw + _dcost_test_f_sw ; s_dcost_test_f_non_anc + _dcost_test_f_non_anc ; s_dpi_cost + _dpi_cost ; s_dcost_switch_line + _dcost_switch_line ;       	     	    	       
    s_dcost_child_hiv + _dcost_child_hiv ; s_dcost_child_hiv_mo_art + _dcost_child_hiv_mo_art ; s_dcost_art_init + _dcost_art_init ;               
   	s_dart_1_cost + _dart_1_cost ; s_dart_2_cost + _dart_2_cost ; s_dart_3_cost + _dart_3_cost ; s_dcost_vl_not_done + _dcost_vl_not_done ;		  		
  	s_dcost_non_aids_pre_death + _dcost_non_aids_pre_death ; s_ddaly_non_aids_pre_death + ddaly_non_aids_pre_death ;     			  	  	   
 	s_dead_ddaly_oth_dol_adv_birth_e + dead_ddaly_oth_dol_adv_birth_e ; s_dcost_drug_level_test + _dcost_drug_level_test ;    	   		   		
     		
	/*visits and linkage*/

	s_visit + visit ; s_lost + lost ; s_linked_to_care + linked_to_care ; s_linked_to_care_this_period + linked_to_care_this_period ;
	s_pre_art_care + pre_art_care ; s_visit_prep_no + visit_prep_no ; s_visit_prep_d + visit_prep_d ; s_visit_prep_dt + visit_prep_dt ;
    s_visit_prep_dtc + visit_prep_dtc ; s_sv + sv ; s_sv_secondline + sv_secondline ;

	/*deaths*/

	s_dead1564_all + dead1564_all ; s_dead1564m_all + dead1564m_all ; s_dead1564w_all + dead1564w_all ; 
	s_dead1519m_all + dead1519m_all ; s_dead2024m_all + dead2024m_all ; s_dead2529m_all + dead2529m_all ; s_dead3034m_all + dead3034m_all ;  
	s_dead3539m_all + dead3539m_all ; s_dead4044m_all + dead4044m_all ; s_dead4549m_all + dead4549m_all ;
	s_dead1519w_all + dead1519w_all ; s_dead2024w_all + dead2024w_all ; s_dead2529w_all + dead2529w_all ; s_dead3034w_all + dead3034w_all ;  
	s_dead3539w_all + dead3539w_all ; s_dead4044w_all + dead4044w_all ; s_dead4549w_all + dead4549w_all ;
	s_death_hivrel + death_hivrel ;	s_dead_rdcause2 + dead_rdcause2 ; s_dead_onart_rdcause2 + dead_onart_rdcause2 ; s_dead1564_ + dead1564_ ;
	s_death_hiv + death_hiv ;s_death_hiv_m + death_hiv_m ;s_death_hiv_w + death_hiv_w ; 
	s_dead_diag + dead_diag ; s_dead_naive + dead_naive ; s_dead_onart + dead_onart ; s_dead_line1_lf0 + dead_line1_lf0 ;
    s_dead_line1_lf1 + dead_line1_lf1 ; s_dead_line2_lf1 + dead_line2_lf1 ; s_dead_line2_lf2 + dead_line2_lf2 ; s_dead_artexp + dead_artexp ;
	s_dead_artexpoff + dead_artexpoff ; s_dead_nn + dead_nn ; s_dead_pir + dead_pir ; s_dead_adc + dead_adc ; s_dead_line1 + dead_line1 ;
	s_dead_line2 + dead_line2 ; s_dead_art_1p + dead_art_1p ; s_dead_u_vfail1 + dead_u_vfail1 ; s_dead_line1_vlg1000 + dead_line1_vlg1000 ;
 	s_dead_line2_vlg1000 + dead_line2_vlg1000 ; s_ev_onart_gt6m_vlg1000_dead + ev_onart_gt6m_vlg1000_dead ; s_sdg_1 + sdg_1 ;
	s_sdg_2 + sdg_2 ; s_sdg_3 + sdg_3 ; s_sdg_4 + sdg_4 ; s_sdg_5 + sdg_5 ; s_sdg_6 + sdg_6 ; s_sdg_7 + sdg_7 ; s_sdg_8 + sdg_8 ; 
	s_sdg_9 + sdg_9 ; s_sdg_99 + sdg_99 ; s_sdg_hr_1 + sdg_hr_1 ;
	s_sdg_hr_2 + sdg_hr_2 ; s_sdg_hr_3 + sdg_hr_3 ; s_sdg_hr_4 + sdg_hr_4 ; s_sdg_hr_5 + sdg_hr_5 ; s_sdg_hr_6 + sdg_hr_6 ; s_sdg_hr_7 + sdg_hr_7 ; 
	s_sdg_hr_8 + sdg_hr_8 ; s_sdg_hr_9 + sdg_hr_9 ; s_sdg_hr_99 + sdg_hr_99 ; 
    s_art_dur_l6m_dead + art_dur_l6m_dead ; s_art_dur_g6m_dead + art_dur_g6m_dead ; s_art_tdur_l6m_dead + art_tdur_l6m_dead ;  
	s_art_tdur_g6m_dead + art_tdur_g6m_dead ; s_ev_onart_gt6m_vlg1000_adead + ev_onart_gt6m_vlg1000_adead ; 
	s_ev_onart_gt6m_vl_m_g1000_dead + ev_onart_gt6m_vl_m_g1000_dead ; s_ev_onart_gt6m_vl_m_g1000_adead + ev_onart_gt6m_vl_m_g1000_adead ; 
	s_ev_art_g1k_not2l_adead + ev_art_g1k_not2l_adead ; s_death_dcause3 + death_dcause3 ;     


	/*sex workers*/

	s_base_rate_sw + base_rate_sw ; s_sw + sw ; s_sw_1549 + sw_1549 ; s_sw_1849 + sw_1849 ; s_sw_1519 + sw_1519 ; s_sw_2024 + sw_2024 ;
	s_sw_2529 + sw_2529 ; s_sw_3039 + sw_3039 ; s_sw_ov40 + sw_ov40 ; s_ever_sw + ever_sw ; s_ever_sw1849_ + ever_sw1849_ ; s_sw_1564 + sw_1564 ;
	s_ever_sw_hiv + ever_sw_hiv ; s_ever_sw_diag + ever_sw_diag ; s_hiv_sw + hiv_sw ; s_hiv_sw1849_ + hiv_sw1849_ ; s_hiv_sw1549_ + hiv_sw1549_ ; 
  	s_hiv_sw1519_ + hiv_sw1519_ ; s_hiv_sw2024_ + hiv_sw2024_ ; s_hiv_sw2529_ + hiv_sw2529_ ; s_hiv_sw3039_ + hiv_sw3039_ ; s_hiv_swov40_ + hiv_swov40_ ;              
	s_i_fsw_v1_np + i_fsw_v1_np ; s_i_fsw_v2_np + i_fsw_v2_np ; s_i_fsw_v3_np + i_fsw_v3_np ; s_i_fsw_v4_np + i_fsw_v4_np ; 
	s_i_fsw_v5_np + i_fsw_v5_np ; s_i_fsw_v6_np + i_fsw_v6_np ; s_sw_newp + sw_newp ; s_sw1524_newp + sw1524_newp ; s_sw_newp_cat1 + sw_newp_cat1 ;
	s_sw_newp_cat2 + sw_newp_cat2 ; s_sw_newp_cat3 + sw_newp_cat3 ; s_sw_newp_cat4 + sw_newp_cat4 ; s_sw_newp_cat5 + sw_newp_cat5 ;
    s_episodes_sw + episodes_sw ; s_sw_gt1ep + sw_gt1ep ; s_new_1519sw + new_1519sw ; s_new_2024sw + new_2024sw ; s_new_2529sw + new_2529sw ;
 	s_new_3039sw + new_3039sw ; s_new_ge40sw + new_ge40sw ; s_vs_sw + vs_sw ;

	s_age_deb_sw1519_ + age_deb_sw1519_;  s_age_deb_sw2024_ + age_deb_sw2024_;  s_age_deb_sw2529_ + age_deb_sw2529_;
	s_age_deb_sw3039_ + age_deb_sw3039_;  s_age_deb_swov40_ + age_deb_swov40_; 
	s_age_deb_sw_nm1519_ + age_deb_sw_nm1519_;  s_age_deb_sw_nm2024_ + age_deb_sw_nm2024_;  s_age_deb_sw_nm2529_ + age_deb_sw_nm2529_;
	s_age_deb_sw_nm3039_ + age_deb_sw_nm3039_;  s_age_deb_sw_nmov40_ + age_deb_sw_nmov40_; 

	s_age_stop_sw1519_ + age_stop_sw1519_;  s_age_stop_sw2024_ + age_stop_sw2024_;  s_age_stop_sw2529_ + age_stop_sw2529_;
	s_age_stop_sw3039_ + age_stop_sw3039_;  s_age_stop_swov40_ + age_stop_swov40_; 

	s_actdur_sw_0to3 + actdur_sw_0to3; s_actdur_sw_3to5 + actdur_sw_3to5; s_actdur_sw_6to9 + actdur_sw_6to9;
	s_actdur_sw_10to19 + actdur_sw_10to19;  
	s_totdur_sw_0to3 + totdur_sw_0to3; s_totdur_sw_3to5 + totdur_sw_3to5; s_totdur_sw_6to9 + totdur_sw_6to9;
	s_totdur_sw_10to19 + totdur_sw_10to19;  
	s_totdur_eversw_0to3 + totdur_eversw_0to3; s_totdur_eversw_3to5 + totdur_eversw_3to5; s_totdur_eversw_6to9 + totdur_eversw_6to9;
	s_totdur_eversw_10to19 + totdur_eversw_10to19;  

	s_sw_program_visit + sw_program_visit ;
	s_diag_sw_noprog + diag_sw_noprog; 	s_diag_sw_inprog + diag_sw_inprog;
	s_onart_sw_noprog + onart_sw_noprog; s_onart_sw_inprog + onart_sw_inprog;
	s_vl1000_art_gt6m_iicu_sw_noprog + vl1000_art_gt6m_iicu_sw_noprog; s_vl1000_art_gt6m_iicu_sw_inprog + vl1000_art_gt6m_iicu_sw_inprog;

	s_sw1519_tp1 + sw1519_tp1; s_sw2024_tp1 + sw2024_tp1; s_sw2529_tp1 + sw2529_tp1; s_sw3039_tp1 + sw3039_tp1; s_swov40_tp1 + swov40_tp1;

	/*ADC etc*/

	s_adc + adc ; s_who3_event + who3_event ; s_who4_ + who4_ ; s_tb + tb ; s_adc_diagnosed + adc_diagnosed ; s_onart_adc + onart_adc ;
	s_adc_naive + adc_naive ; s_adc_line1_lf0 + adc_line1_lf0 ; s_adc_line1_lf1 + adc_line1_lf1 ; s_adc_line2_lf1 + adc_line2_lf1 ;
	s_adc_line2_lf2 + adc_line2_lf2 ; s_adc_artexpoff + adc_artexpoff ;

	/*Pregnancy and children*/

	s_pregnant + pregnant ; s_anc + anc ; s_w1549_birthanc + w1549_birthanc ; s_w1524_birthanc + w1524_birthanc ; s_hiv_w1549_birthanc + hiv_w1549_birthanc ;
	s_hiv_w1524_birthanc + hiv_w1524_birthanc ; s_hiv_pregnant + hiv_pregnant ; s_pregnant_not_diagnosed_pos + pregnant_not_diagnosed_pos ;
	s_hiv_pregn_w1549_ + hiv_pregn_w1549_ ; s_hiv_pregn_w1524_ + hiv_pregn_w1524_ ; s_hiv_anc + hiv_anc ; s_pmtct + pmtct ; s_on_sd_nvp + on_sd_nvp ;
	s_on_dual_nvp + on_dual_nvp ; s_ever_sd_nvp + ever_sd_nvp ; s_ever_dual_nvp + ever_dual_nvp ; s_pregnant_w1549 + pregnant_w1549 ; 
	s_pregnant_w1524 + pregnant_w1524 ; s_pregnant_w1519 + pregnant_w1519 ; s_pregnant_w2024 + pregnant_w2024 ; s_pregnant_w2529 + pregnant_w2529 ;
	s_pregnant_w3034 + pregnant_w3034 ; s_pregnant_w3539 + pregnant_w3539 ; s_pregnant_w4044 + pregnant_w4044 ; s_pregnant_w4549 + pregnant_w4549 ;
    s_pregnant_w50pl + pregnant_w50pl ; s_tested_w1549_anc + tested_w1549_anc ; s_tested_w1524_anc + tested_w1524_anc ; s_tested_w1519_anc + tested_w1519_anc ;       
    s_tested_w2024_anc + tested_w2024_anc ; s_tested_w2529_anc + tested_w2529_anc ; s_tested_w3034_anc + tested_w3034_anc ;       
    s_tested_w3539_anc + tested_w3539_anc ; s_tested_w4044_anc + tested_w4044_anc ; s_tested_w4549_anc + tested_w4549_anc ;  
    s_tested_w50pl_anc + tested_w50pl_anc; s_hiv_w1549_anc + hiv_w1549_anc ; s_hiv_w1524_anc + hiv_w1524_anc ; s_hiv_w1519_anc + hiv_w1519_anc ;                        
    s_hiv_w2024_anc + hiv_w2024_anc ; s_hiv_w2529_anc + hiv_w2529_anc ; s_hiv_w3034_anc + hiv_w3034_anc ; s_hiv_w3539_anc + hiv_w3539_anc ;
    s_hiv_w4044_anc + hiv_w4044_anc ; s_hiv_w4549_anc + hiv_w4549_anc ; s_hiv_w50pl_anc + hiv_w50pl_anc ;          
    s_ceb_w1524 + ceb_w1524 ; s_ceb_w2534 + ceb_w2534 ; s_ceb_w3544 + ceb_w3544 ; s_ceb_w4549 + ceb_w4549 ; s_want_no_more_children + want_no_more_children ;
    s_pregnant_ntd + pregnant_ntd ; s_pregnant_vlg1000 + pregnant_vlg1000 ; s_pregnant_o_dol + pregnant_o_dol ; 
	s_pregnant_onart_vlg1000 + pregnant_onart_vlg1000 ; s_pregnant_onart + pregnant_onart ; s_pregnant_onart_vl_high + pregnant_onart_vl_high ;
	s_pregnant_onart_vl_vhigh + pregnant_onart_vl_vhigh ; s_pregnant_onart_vl_vvhigh + pregnant_onart_vl_vvhigh ; 
	s_birth_with_inf_child + birth_with_inf_child ; s_child_with_resistant_hiv + child_with_resistant_hiv ; s_give_birth_with_hiv + give_birth_with_hiv ;
	s_onart_birth_with_inf_child_res + onart_birth_with_inf_child_res ; s_onart_birth_with_inf_child + onart_birth_with_inf_child ;	  			 		   

	/*circumcision*/

	s_mcirc + mcirc ; s_mcirc_1519m + mcirc_1519m ; s_mcirc_2024m + mcirc_2024m ; s_mcirc_2529m + mcirc_2529m ; s_mcirc_3034m + mcirc_3034m ; 
	s_mcirc_3539m + mcirc_3539m ; s_mcirc_4044m + mcirc_4044m ; s_mcirc_4549m + mcirc_4549m ; s_mcirc_50plm + mcirc_50plm ;
	s_mcirc_5054m + mcirc_5054m ; s_mcirc_5559m + mcirc_5559m ; s_mcirc_6064m + mcirc_6064m ; s_mcirc_6569m + mcirc_6569m ;
	s_mcirc_7074m + mcirc_7074m ; s_mcirc_7579m + mcirc_7579m ; s_mcirc_8084m + mcirc_8084m ; s_mcirc_85plm + mcirc_85plm ;
	s_vmmc + vmmc ; s_vmmc1519m + vmmc1519m ; s_vmmc2024m + vmmc2024m ; s_vmmc2529m + vmmc2529m ; s_vmmc3034m + vmmc3034m ; s_vmmc3539m + vmmc3539m ;
    s_vmmc4044m + vmmc4044m ; s_vmmc4549m + vmmc4549m ; s_vmmc50plm + vmmc50plm ;
	s_new_vmmc + new_vmmc ; s_new_vmmc1519m + new_vmmc1519m ; s_new_vmmc2024m + new_vmmc2024m ; s_new_vmmc2529m + new_vmmc2529m ; s_new_vmmc3034m + new_vmmc3034m ; s_new_vmmc3539m + new_vmmc3539m ;
    s_new_vmmc4044m + new_vmmc4044m ; s_new_vmmc4549m + new_vmmc4549m ; s_new_vmmc50plm + new_vmmc50plm ;
	s_new_mcirc + new_mcirc ; s_new_mcirc_1519m + new_mcirc_1519m ; s_new_mcirc_2024m + new_mcirc_2024m ; s_new_mcirc_2529m + new_mcirc_2529m ;
	s_new_mcirc_3034m + new_mcirc_3034m ; s_new_mcirc_3539m + new_mcirc_3539m ; s_new_mcirc_4044m + new_mcirc_4044m ; s_new_mcirc_4549m + new_mcirc_4549m ; 
	s_new_mcirc_5054m + new_mcirc_5054m ; s_new_mcirc_5559m + new_mcirc_5559m ;s_new_mcirc_6064m + new_mcirc_6064m ;s_new_mcirc_6569m + new_mcirc_6569m ;
	s_new_mcirc_7074m + new_mcirc_7074m ;s_new_mcirc_7579m + new_mcirc_7579m ;s_new_mcirc_8084m + new_mcirc_8084m ;s_new_mcirc_85plm + new_mcirc_85plm ;
 	s_new_mcirc_50plm + new_mcirc_50plm ;  s_hivneg_uncirc_1014 + hivneg_uncirc_1014 ; s_hivneg_uncirc_1519 + hivneg_uncirc_1519 ; 
	s_hivneg_uncirc_2024 + hivneg_uncirc_2024 ; s_hivneg_uncirc_2529 + hivneg_uncirc_2529 ; s_hivneg_uncirc_3034 + hivneg_uncirc_3034 ; 
	s_hivneg_uncirc_3539 + hivneg_uncirc_3539 ; s_hivneg_uncirc_4044 + hivneg_uncirc_4044 ; s_hivneg_uncirc_4549 + hivneg_uncirc_4549 ;

            
	/*supp mat*/

	s_onart_vlg1 + onart_vlg1 ; s_onart_vlg2 + onart_vlg2 ; s_onart_vlg3 + onart_vlg3 ; s_onart_vlg4 + onart_vlg4 ; s_onart_vlg5 + onart_vlg5 ;
	s_onart_vlg1_r + onart_vlg1_r ; s_onart_vlg2_r + onart_vlg2_r ; s_onart_vlg3_r + onart_vlg3_r ; s_onart_vlg4_r + onart_vlg4_r ; 
	s_onart_vlg5_r + onart_vlg5_r ; s_onart_who4_year1 + onart_who4_year1 ; s_onart_who4_year1_vlt1000 + onart_who4_year1_vlt1000 ;
	s_onart_who4_year3 + onart_who4_year3 ; s_onart_who4_year3_vlt1000 + onart_who4_year3_vlt1000 ; s_onart_cd4l200_year1 + onart_cd4l200_year1 ;
    s_onart_cd4l200_year1_vlt1000 + onart_cd4l200_year1_vlt1000 ; s_onart_cd4l200_year3 + onart_cd4l200_year3 ;     
    s_onart_cd4l200_year3_vlt1000 + onart_cd4l200_year3_vlt1000 ; s_onart_res_1stline_linefail0 + onart_res_1stline_linefail0 ;
    s_onart_res_1stline + onart_res_1stline ; s_onart_linefail0 + onart_linefail0 ; s_onart_linefail0_cl200 + onart_linefail0_cl200 ;
    s_onart_linefail0_cl50 + onart_linefail0_cl50 ; s_onart_cl50 + onart_cl50 ; s_onart_linefail0_vg1000 + onart_linefail0_vg1000 ;
	s_onart_vg1000 + onart_vg1000 ; s_onart_linefail0_vg1000_r + onart_linefail0_vg1000_r ; s_onart_vg1000_r + onart_vg1000_r ;
    s_onart_cl350 + onart_cl350 ; s_newpge1_l4p_1529m + newpge1_l4p_1529m ; s_newpge1_l4p_1529w + newpge1_l4p_1529w ; 
    s_m_1524_ge1newpever + m_1524_ge1newpever ; s_m_2534_ge1newpever + m_2534_ge1newpever ; s_m_3544_ge1newpever + m_3544_ge1newpever ;
	s_m_4554_ge1newpever + m_4554_ge1newpever ; s_m_5564_ge1newpever + m_5564_ge1newpever ;
    s_m_1524_ge2newpever + m_1524_ge2newpever ; s_m_2534_ge2newpever + m_2534_ge2newpever ; s_m_3544_ge2newpever + m_3544_ge2newpever ;
	s_m_4554_ge2newpever + m_4554_ge2newpever ; s_m_5564_ge2newpever + m_5564_ge2newpever ;	
    s_m_1524_ge5newpever + m_1524_ge5newpever ; s_m_2534_ge5newpever + m_2534_ge5newpever ; s_m_3544_ge5newpever + m_3544_ge5newpever ;
	s_m_4554_ge5newpever + m_4554_ge5newpever ; s_m_5564_ge5newpever + m_5564_ge5newpever ;	
	s_w_ge1newpever + w_ge1newpever ; s_w_ge2newpever + w_ge2newpever ; s_w_ge5newpever + w_ge5newpever ;
    s_npge1_l4p_1564m + npge1_l4p_1564m ; s_npge1_l4p_1524m + npge1_l4p_1524m ; s_npge1_l4p_2534m + npge1_l4p_2534m ; s_npge1_l4p_3544m + npge1_l4p_3544m ;
	s_npge1_l4p_4554m + npge1_l4p_4554m ; s_npge1_l4p_5564m + npge1_l4p_5564m ; s_npge1_l4p_1564w + npge1_l4p_1564w ; s_npge1_l4p_1524w + npge1_l4p_1524w ;
	s_npge1_l4p_2534w + npge1_l4p_2534w ; s_npge1_l4p_3544w + npge1_l4p_3544w ; s_npge1_l4p_4554w + npge1_l4p_4554w ; s_npge1_l4p_5564w + npge1_l4p_5564w ;

    s_npge2_l4p_1564m + npge2_l4p_1564m ; s_npge2_l4p_1524m + npge2_l4p_1524m ; s_npge2_l4p_2534m + npge2_l4p_2534m ; s_npge2_l4p_3544m + npge2_l4p_3544m ;
	s_npge2_l4p_4554m + npge2_l4p_4554m ; s_npge2_l4p_5564m + npge2_l4p_5564m ; s_npge2_l4p_1564w + npge2_l4p_1564w ; s_npge2_l4p_1524w + npge2_l4p_1524w ;
	s_npge2_l4p_2534w + npge2_l4p_2534w ; s_npge2_l4p_3544w + npge2_l4p_3544w ; s_npge2_l4p_4554w + npge2_l4p_4554w ; s_npge2_l4p_5564w + npge2_l4p_5564w ;

    s_npge10_l4p_1564m + npge10_l4p_1564m ; s_npge10_l4p_1524m + npge10_l4p_1524m ; s_npge10_l4p_2534m + npge10_l4p_2534m ; s_npge10_l4p_3544m + npge10_l4p_3544m ;
	s_npge10_l4p_4554m + npge10_l4p_4554m ; s_npge10_l4p_5564m + npge10_l4p_5564m ; s_npge10_l4p_1564w + npge10_l4p_1564w ; s_npge10_l4p_1524w + npge10_l4p_1524w ;
	s_npge10_l4p_2534w + npge10_l4p_2534w ; s_npge10_l4p_3544w + npge10_l4p_3544w ; s_npge10_l4p_4554w + npge10_l4p_4554w ; s_npge10_l4p_5564w + npge10_l4p_5564w ;

    s_npge50_l4p_1564m + npge50_l4p_1564m ; s_npge50_l4p_1524m + npge50_l4p_1524m ; s_npge50_l4p_2534m + npge50_l4p_2534m ; s_npge50_l4p_3544m + npge50_l4p_3544m ;
	s_npge50_l4p_4554m + npge50_l4p_4554m ; s_npge50_l4p_5564m + npge50_l4p_5564m ; s_npge50_l4p_1564w + npge50_l4p_1564w ; s_npge50_l4p_1524w + npge50_l4p_1524w ;
	s_npge50_l4p_2534w + npge50_l4p_2534w ; s_npge50_l4p_3544w + npge50_l4p_3544w ; s_npge50_l4p_4554w + npge50_l4p_4554w ; s_npge50_l4p_5564w + npge50_l4p_5564w ;
	
	s_npge1_l4p_1564_hivpos + npge1_l4p_1564_hivpos ; s_npge2_l4p_1564_hivpos + npge2_l4p_1564_hivpos ; s_npge1_l4p_1564_hivdiag + npge1_l4p_1564_hivdiag ;
	s_npge2_l4p_1564_hivdiag + npge2_l4p_1564_hivdiag ; s_npge1_l4p_1564_hivneg + npge1_l4p_1564_hivneg ; s_npge2_l4p_1564_hivneg + npge2_l4p_1564_hivneg ;

	/* covid */ 

	s_covid + covid ; 

end;

if 15 <= age or death ne . then do;

	s_dead_daly + dead_daly ; s_dead_ddaly + dead_ddaly ; s_dead_allage + dead; 
	s_dead_daly_80 + dead_daly_80 ; s_dead_ddaly_80 + dead_ddaly_80 ; 
	s_death_dcause3_allage + death_dcause3 ;  s_death_hivrel_allage + death_hivrel;
  	s_art_attrit_1yr + art_attrit_1yr ; s_art_attrit_1yr_on + art_attrit_1yr_on ; s_art_attrit_2yr + art_attrit_2yr ;
	s_art_attrit_2yr_on + art_attrit_2yr_on ; s_art_attrit_3yr + art_attrit_3yr ; s_art_attrit_3yr_on + art_attrit_3yr_on ; 
    s_art_attrit_4yr + art_attrit_4yr ; s_art_attrit_4yr_on + art_attrit_4yr_on ; s_art_attrit_5yr + art_attrit_5yr ; 
	s_art_attrit_5yr_on + art_attrit_5yr_on ; s_art_attrit_6yr + art_attrit_6yr ; s_art_attrit_6yr_on + art_attrit_6yr_on ;
    s_art_attrit_7yr + art_attrit_7yr ; s_art_attrit_7yr_on + art_attrit_7yr_on ; s_art_attrit_8yr + art_attrit_8yr ;
	s_art_attrit_8yr_on + art_attrit_8yr_on ; s_dead_ddaly_ntd + dead_ddaly_ntd ; s_cost_child_hiv + cost_child_hiv ; 
	s_cost_child_hiv_mo_art + cost_child_hiv_mo_art ; s_ddaly_mtct + ddaly_mtct ; s_ageg6569m + ageg6569m ; s_ageg7074m + ageg7074m ;
	s_ageg7579m + ageg7579m ; s_ageg8084m + ageg8084m ; s_ageg6569w + ageg6569w ; s_ageg7074w + ageg7074w ; s_ageg7579w + ageg7579w ;
 	s_ageg8084w + ageg8084w ; s_ageg85plw + ageg85plw ; s_ageg85plm + ageg85plm ; 
	s_hiv6569m + hiv6569m ; s_hiv7074m + hiv7074m ; s_hiv7579m + hiv7579m ; s_hiv8084m + hiv8084m ; s_hiv6569w + hiv6569w ;
    s_hiv7074w + hiv7074w ; s_hiv7579w + hiv7579w ; s_hiv8084w + hiv8084w ; s_hiv85plw + hiv85plw ;s_hiv85plm + hiv85plm ; 
	s_alive_w + alive_w ; s_alive_m + alive_m ; 
	s_x_n_zld_if_reg_op_116 + n_zld_if_reg_op_116 ;

end;

if 0 <= age or death ne . then do;
	s_birth_circ + birth_circ ; s_mcirc_1014m + mcirc_1014m ; s_new_mcirc_1014m + new_mcirc_1014m ;
	s_vmmc1014m + vmmc1014m ; 	s_new_vmmc1014m + new_vmmc1014m ; s_ageg1014m + ageg1014m; 
end;

if 15 <= age < 80 and (death = . or caldate&j = death ) then do;
	s_live_daly_80 + live_daly_80 ; s_live_ddaly_80 + live_ddaly_80 ;

	s_cost_80 + cost ; s_art_cost_80 + art_cost ;  
    s_adc_cost_80 + adc_cost ; s_cd4_cost_80 + cd4_cost ; s_vl_cost_80 + vl_cost ; s_vis_cost_80 + vis_cost ; 
	s_full_vis_cost_80 + full_vis_cost ; s_who3_cost_80 + who3_cost ; s_cot_cost_80 + cot_cost ; s_tb_cost_80 + tb_cost ; s_cost_test_80 + cost_test ;
	s_res_cost_80 + res_cost ; s_cost_circ_80 + cost_circ ; s_cost_condom_dn_80 + cost_condom_dn ; s_cost_sw_program_80 + cost_sw_program ;  
	s_t_adh_int_cost_80 + t_adh_int_cost ; s_cost_test_m_80 + cost_test_m ; 
	s_cost_test_f_80 + cost_test_f ; s_cost_prep_80 + cost_prep ; s_cost_prep_visit_80 + cost_prep_visit ; s_cost_prep_ac_adh_80 + cost_prep_ac_adh ; 
	s_cost_test_m_sympt_80 + cost_test_m_sympt ; s_cost_test_f_sympt_80 + cost_test_f_sympt ;                         
    s_cost_test_m_circ_80 + cost_test_m_circ ; s_cost_test_f_anc_80 + cost_test_f_anc ; s_cost_test_f_sw_80 + cost_test_f_sw ;                      
  	s_cost_test_f_non_anc_80 + cost_test_f_non_anc ; s_pi_cost_80 + pi_cost ;	s_cost_switch_line_80 + cost_switch_line ; s_cost_child_hiv_80 + cost_child_hiv ;   			
  	s_cost_child_hiv_mo_art_80 + cost_child_hiv_mo_art ; s_cost_art_init_80 + cost_art_init ; s_art_1_cost_80 + art_1_cost ; s_art_2_cost_80 + art_2_cost ;	     		     			 
	s_art_3_cost_80 + art_3_cost ; s_cost_vl_not_done_80 + cost_vl_not_done ; s_cost_zdv_80 + cost_zdv ; s_cost_ten_80 + cost_ten ; s_cost_3tc_80 + cost_3tc ;  	    
 	s_cost_nev_80 + cost_nev ; s_cost_lpr_80 + cost_lpr ; s_cost_dar_80 + cost_dar ; s_cost_taz_80 + cost_taz ; s_cost_efa_80 + cost_efa ; s_cost_dol_80 + cost_dol ;  
    s_cost__80 + _cost_ ;   	  	 
	s_dcost__80 + _dcost_ ; s_dart_cost_80 + _dart_cost ; s_dadc_cost_80 + _dadc_cost ; s_dcd4_cost_80 + _dcd4_cost ; s_dvl_cost_80 + _dvl_cost ; s_dvis_cost_80 + _dvis_cost ;  	  	    	   	     	 	 	  	  	  	      
	s_dfull_vis_cost_80 + _dfull_vis_cost ; s_dwho3_cost_80 + _dwho3_cost ; s_dcot_cost_80 + _dcot_cost ; s_dtb_cost_80 + _dtb_cost ; s_dtest_cost_80 + _dtest_cost ;
    s_dres_cost_80 + _dres_cost ; s_dcost_circ_80 + _dcost_circ ; s_dcost_condom_dn_80 + dcost_condom_dn ;  s_dcost_sw_program_80 + dcost_sw_program ;
	s_d_t_adh_int_cost_80 + _d_t_adh_int_cost ; s_dtest_cost_m_80 + _dtest_cost_m ; 
	s_dtest_cost_f_80 + _dtest_cost_f ; s_dcost_prep_80 + _dcost_prep ; s_dcost_prep_visit_80 + _dcost_prep_visit ; s_dcost_prep_ac_adh_80 + _dcost_prep_ac_adh ;          
	s_dcost_test_m_sympt_80 + _dcost_test_m_sympt ; 
	s_dcost_test_f_sympt_80 + _dcost_test_f_sympt ; s_dcost_test_m_circ_80 + _dcost_test_m_circ ; s_dcost_test_f_anc_80 + _dcost_test_f_anc ;
  	s_dcost_test_f_sw_80 + _dcost_test_f_sw ; s_dcost_test_f_non_anc_80 + _dcost_test_f_non_anc ; s_dpi_cost_80 + _dpi_cost ; s_dcost_switch_line_80 + _dcost_switch_line ;       	     	    	       
    s_dcost_child_hiv_80 + _dcost_child_hiv ; s_dcost_child_hiv_mo_art_80 + _dcost_child_hiv_mo_art ; s_dcost_art_init_80 + _dcost_art_init ;               
   	s_dart_1_cost_80 + _dart_1_cost ; s_dart_2_cost_80 + _dart_2_cost ; s_dart_3_cost_80 + _dart_3_cost ; s_dcost_vl_not_done_80 + _dcost_vl_not_done ;		  		
  	s_dcost_non_aids_pre_death_80 + _dcost_non_aids_pre_death ; s_ddaly_non_aids_pre_death_80 + ddaly_non_aids_pre_death ;     			  	  	   
 	s_dcost_drug_level_test_80 + _dcost_drug_level_test ;    	   		   		
     		
end;


cald = caldate_never_dot ;


* procs;
/*

proc print; var  cald  yrart  onart art_monitoring_strategy  linefail artline vl vm nod o_efa f_efa o_dol f_dol o_taz 
f_taz  o_ten f_ten  o_zdv f_zdv  o_3tc f_3tc  pi_after_dtg_fail  restart_pi_after_dtg_fail; 
where p_dol=1 and  linefail ge 1 and death = .;
run;


proc print; var cald option no_art_disrup_covid was_on_art_covid_disrup interrupt interrupt_choice lost return restart onart vl ;
where serial_no < 500 and naive=0 and was_on_art_covid_disrup=1 and death = .;
run; 


proc print; var serial_no caldate&j sw sw_program  sw_program_visit onart adh sw_program_effect sw_test_6mthly
eff_sw_program eff_sw_higher_int  eff_sw_higher_prob_loss_at_diag  eff_prob_sw_lower_adh
sw_lower_art_use_adh sw_higher_int prob_sw_lower_adh  sw_higher_prob_loss_at_diag  
rate_engage_sw_program rate_disengage_sw_program cost_sw_program   ;
where gender=2 and age ge 15 and death = . and sw=1 ;
run;


proc print; var serial_no caldate&j 
prep prep_strategy prep_elig  prep_ever  dt_prep_s  dt_prep_e  continuous_prep_use
adh_pattern_prep rate_test_startprep rate_test_restartprep rate_choose_stop_prep prob_prep_restart_choice prepuptake_sw  prepuptake_pop 
eff_rate_test_startprep eff_rate_test_restartprep eff_rate_choose_stop_prep eff_prob_prep_restart_choice prepuptake_sw prepuptake_pop 
prepuptake_pop annual_testing_prep hivtest_type eff_adh_prep factor_prep_adh_older rate_test_onprep pr_prep_b prob_prep_restart prob_prep_visit_counsel
tot_yrs_prep prob_prep_restart_choice prepuptake_sw prepuptake_pop pop_wide_tld_prob_egfr;
where age ge 15 and hiv ne 1;
run;

proc freq; tables caldate&j s_hiv1564; where serial_no=100000; run;

proc print; var serial_no caldate&j infection yrart prointer onart onart_gt6m_iicu vl1000_art_gt6m_iicu tcur 
int_clinic_not_aw nactive_tm1 adh vl  vmax_tm1 cc_tm1 cd4_tm1 cd4 cmin toffart rate_int_choice death ;
where age ge 15 and registd = 1 and death = . and serial_no < 1000 ;
run;

proc freq; tables  registd  vl1000_art_gt6m_iicu  onart_gt6m_iicu  vg1000 naive  onart ; where death = . or caldate&j = death ; run;

proc print; var   caldate&j  cald  s_vl1000_art_gt6m_iicu  s_onart_gt6m_iicu  s_naive  s_onart  s_diag  s_vg1000  s_hiv1564;
where serial_no = 10000;
run;

*/




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 6

* create a data set that contains the sums (over all living people, or otherwise) and derived variables based on these sums 
for any variables we want to save outputs, either to analyse afterwards, or to feed back into the next 3 month period of the model.   

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;



* =========   data sums =================================================================================== ;


data sums; set r&da1; if serial_no = &population;

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

if s_w_1524_newp = 0 then s_prop_newp_i_w_1524 = 0;
if s_w_2534_newp = 0 then s_prop_newp_i_w_2534 = 0;
if s_w_3544_newp = 0 then s_prop_newp_i_w_3544 = 0;
if s_w_4554_newp = 0 then s_prop_newp_i_w_4554 = 0;
if s_w_5564_newp = 0 then s_prop_newp_i_w_5564 = 0;
if s_m_1524_newp = 0 then s_prop_newp_i_m_1524 = 0;
if s_m_2534_newp = 0 then s_prop_newp_i_m_2534 = 0;
if s_m_3544_newp = 0 then s_prop_newp_i_m_3544 = 0;
if s_m_4554_newp = 0 then s_prop_newp_i_m_4554 = 0;
if s_m_5564_newp = 0 then s_prop_newp_i_m_5564 = 0;

* Used for balance;
s_m_newp = s_m_1524_newp+s_m_2534_newp+s_m_3544_newp+s_m_4554_newp+s_m_5564_newp;
s_w_newp = s_w_1524_newp+s_w_2534_newp+s_w_3544_newp+s_w_4554_newp+s_w_5564_newp;

d_s_newp = s_m_newp - s_w_newp;

r_s_newp = s_m_newp / s_w_newp;

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

if s_w1524_ep1524 gt 0 then r_s_ep_m15w15 = s_m1524_ep1524 / s_w1524_ep1524 ; 
if s_w2534_ep2534 gt 0 then r_s_ep_m25w25 = s_m2534_ep2534 / s_w2534_ep2534 ; 
if s_w3544_ep3544 gt 0 then r_s_ep_m35w35 = s_m3544_ep3544 / s_w3544_ep3544 ; 
if s_w4554_ep4554 gt 0 then r_s_ep_m45w45 = s_m4554_ep4554 / s_w4554_ep4554 ; 
if s_w5564_ep5564 gt 0 then r_s_ep_m55w55 = s_m5564_ep5564 / s_w5564_ep5564 ;





if sex_age_mixing_matrix_w=1 then do;
ptnewp15_m=(0.43*s_w_1524_newp)+(0.09*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.34*s_w_1524_newp)+(0.49*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.12*s_w_1524_newp)+(0.30*s_w_2534_newp)+(0.34*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.10*s_w_1524_newp)+(0.10*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.01*s_w_1524_newp)+(0.02*s_w_2534_newp)+(0.13*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w=2 then do;
ptnewp15_m=(0.43*s_w_1524_newp)+(0.09*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.415*s_w_1524_newp)+(0.50*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.12*s_w_1524_newp)+(0.35*s_w_2534_newp)+(0.34*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.03*s_w_1524_newp)+(0.05*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.005*s_w_1524_newp)+(0.01*s_w_2534_newp)+(0.13*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w=3 then do;
ptnewp15_m=(0.25*s_w_1524_newp)+(0.09*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.55 *s_w_1524_newp)+(0.50*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.15*s_w_1524_newp)+(0.35*s_w_2534_newp)+(0.34*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.03*s_w_1524_newp)+(0.05*s_w_2534_newp)+(0.25*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.02 *s_w_1524_newp)+(0.01*s_w_2534_newp)+(0.13*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w=4 then do;
ptnewp15_m=(0.05*s_w_1524_newp)+(0.03*s_w_2534_newp)+(0.03*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.55 *s_w_1524_newp)+(0.52*s_w_2534_newp)+(0.05*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.35*s_w_1524_newp)+(0.40*s_w_2534_newp)+(0.57*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.03*s_w_1524_newp)+(0.03*s_w_2534_newp)+(0.30*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.02 *s_w_1524_newp)+(0.02*s_w_2534_newp)+(0.05*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w=5 then do;
ptnewp15_m=(0.05*s_w_1524_newp)+(0.01*s_w_2534_newp)+(0.01*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.45 *s_w_1524_newp)+(0.40*s_w_2534_newp)+(0.07*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.30*s_w_1524_newp)+(0.39*s_w_2534_newp)+(0.47*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.15*s_w_1524_newp)+(0.15*s_w_2534_newp)+(0.30*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.05 *s_w_1524_newp)+(0.05*s_w_2534_newp)+(0.15*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;

if sex_age_mixing_matrix_w=6 then do;
ptnewp15_m=(0.20*s_w_1524_newp)+(0.00*s_w_2534_newp)+(0.01*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp25_m=(0.20 *s_w_1524_newp)+(0.25*s_w_2534_newp)+(0.01*s_w_3544_newp)+(0.00*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp35_m=(0.20*s_w_1524_newp)+(0.25*s_w_2534_newp)+(0.32*s_w_3544_newp)+(0.05*s_w_4554_newp)+(0.00*s_w_5564_newp);
ptnewp45_m=(0.20*s_w_1524_newp)+(0.25*s_w_2534_newp)+(0.33*s_w_3544_newp)+(0.70*s_w_4554_newp)+(0.10*s_w_5564_newp);
ptnewp55_m=(0.20 *s_w_1524_newp)+(0.25*s_w_2534_newp)+(0.33*s_w_3544_newp)+(0.25*s_w_4554_newp)+(0.90*s_w_5564_newp);
end;



if sex_age_mixing_matrix_m=1 then do;
ptnewp15_w=(0.865*s_m_1524_newp)+(0.47*s_m_2534_newp)+(0.30*s_m_3544_newp)+(0.43*s_m_4554_newp)+(0.18*s_m_5564_newp);
ptnewp25_w=(0.11*s_m_1524_newp)+(0.43*s_m_2534_newp)+(0.50*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.18*s_m_5564_newp);
ptnewp35_w=(0.025*s_m_1524_newp)+(0.10*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.23*s_m_4554_newp)+(0.27*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.03*s_m_4554_newp)+(0.27*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.01*s_m_4554_newp)+(0.10*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m=2 then do;
ptnewp15_w=(0.865*s_m_1524_newp)+(0.47*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.15*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp25_w=(0.11*s_m_1524_newp)+(0.43*s_m_2534_newp)+(0.35*s_m_3544_newp)+(0.23*s_m_4554_newp)+(0.08*s_m_5564_newp);
ptnewp35_w=(0.025*s_m_1524_newp)+(0.10*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.25*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.07*s_m_4554_newp)+(0.32*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m=3 then do;
ptnewp15_w=(0.90 *s_m_1524_newp)+(0.44*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.15*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.43*s_m_2534_newp)+(0.34*s_m_3544_newp)+(0.23*s_m_4554_newp)+(0.08*s_m_5564_newp);
ptnewp35_w=(0.02 *s_m_1524_newp)+(0.10*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.25*s_m_5564_newp);
ptnewp45_w=(0.02*s_m_1524_newp)+(0.02*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp55_w=(0.01*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.07*s_m_4554_newp)+(0.32*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m=4 then do;
ptnewp15_w=(0.93 *s_m_1524_newp)+(0.50*s_m_2534_newp)+(0.20*s_m_3544_newp)+(0.15*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.40*s_m_2534_newp)+(0.34*s_m_3544_newp)+(0.20*s_m_4554_newp)+(0.08*s_m_5564_newp);
ptnewp35_w=(0.01 *s_m_1524_newp)+(0.08*s_m_2534_newp)+(0.41*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.20*s_m_5564_newp);
ptnewp45_w=(0.01*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.37*s_m_4554_newp)+(0.40*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.03*s_m_4554_newp)+(0.27*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m=5 then do;
ptnewp15_w=(0.94 *s_m_1524_newp)+(0.50*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.40*s_m_2534_newp)+(0.40*s_m_3544_newp)+(0.30*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp35_w=(0.01 *s_m_1524_newp)+(0.08*s_m_2534_newp)+(0.15*s_m_3544_newp)+(0.25*s_m_4554_newp)+(0.30*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.04*s_m_3544_newp)+(0.10*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.01*s_m_2534_newp)+(0.01*s_m_3544_newp)+(0.05*s_m_4554_newp)+(0.05*s_m_5564_newp);
end;

if sex_age_mixing_matrix_m=6 then do;
ptnewp15_w=(0.94 *s_m_1524_newp)+(0.50*s_m_2534_newp)+(0.50*s_m_3544_newp)+(0.50*s_m_4554_newp)+(0.50*s_m_5564_newp);
ptnewp25_w=(0.05*s_m_1524_newp)+(0.40*s_m_2534_newp)+(0.35*s_m_3544_newp)+(0.35*s_m_4554_newp)+(0.35*s_m_5564_newp);
ptnewp35_w=(0.01 *s_m_1524_newp)+(0.08*s_m_2534_newp)+(0.10*s_m_3544_newp)+(0.10*s_m_4554_newp)+(0.10*s_m_5564_newp);
ptnewp45_w=(0.00*s_m_1524_newp)+(0.02*s_m_2534_newp)+(0.05*s_m_3544_newp)+(0.05*s_m_4554_newp)+(0.05*s_m_5564_newp);
ptnewp55_w=(0.00*s_m_1524_newp)+(0.00*s_m_2534_newp)+(0.00*s_m_3544_newp)+(0.00*s_m_4554_newp)+(0.00*s_m_5564_newp);
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
if s_alive1549_m gt 0 then prevalence1549m =  s_hiv1549m / s_alive1549_m;
if s_alive1549_w gt 0 then prevalence1549w =  s_hiv1549w / s_alive1549_w;
if prevalence1524m gt 0 then prev_ratio_1524 = prevalence1524w / prevalence1524m ;

prevalence2024w = s_hiv2024w  / s_ageg2024w ;
prevalence2024m = s_hiv2024m  / s_ageg2024m ;
prevalence2529w = s_hiv2529w  / s_ageg2529w ;
incidence1549w = (4 * 100 * s_primary1549w) / (s_alive1549_w - s_hiv1549w + s_primary1549w);
incidence1549m = (4 * 100 * s_primary1549m) / (s_alive1549_m - s_hiv1549m + s_primary1549m);

cum_ratio_newp_mw = s_s_m_newp / s_s_w_newp;

drop serial_no ;


keep
 
/*general*/
s_n  cald  run  option
																														 										  
/*number alive and in each age group*/
s_alive1549 	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m		s_ageg1014m	
s_ageg1517w		s_ageg1819w		s_ageg1519w  	s_ageg2024w		s_ageg2529w  	s_ageg3034w		s_ageg3539w		s_ageg4044w	
s_ageg4549w		s_ageg5054w 	s_ageg5559w		s_ageg6064w		s_ageg1564w		s_ageg1549w		s_age_1844w
s_ageg1m  s_ageg2m  s_ageg3m  s_ageg4m  s_ageg5m  s_ageg1w  s_ageg2w  s_ageg3w  s_ageg4w  s_ageg5w  

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		s_ageg85plw
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		s_ageg85plm
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m	s_hiv85plm	
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w  s_hiv85plw 
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
s_primary_sw  s_primary_sw1519_  s_primary_sw2024_  s_primary_sw2529_  s_primary_sw3039_
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
s_np  s_newp  s_newp_ge1  s_newp_ge5  s_newp_ge10  s_newp_ge50  s_ep  s_ep_m  s_ep_w  s_npge10  s_npge2  s_npge2_l4p_1549m  s_npge2_l4p_1549w
s_m_1524_ep  	 s_m_2534_ep 	  s_m_3544_ep 	   s_m_4554_ep 		s_m_5564_ep 	 
s_w_1524_ep		 s_w_2534_ep 	  s_w_3544_ep	   s_w_4554_ep 		s_w_5564_ep 
s_m_1524_newp  	 s_m_2534_newp    s_m_3544_newp    s_m_4554_newp  	s_m_5564_newp
s_w_1524_newp  	 s_w_2534_newp    s_w_3544_newp    s_w_4554_newp    s_w_5564_newp
s_m_1524_epnewp  s_m_2534_epnewp  s_m_3544_epnewp  s_m_4554_epnewp  s_m_5564_epnewp 
s_w_1524_epnewp  s_w_2534_epnewp  s_w_3544_epnewp  s_w_4554_epnewp  s_w_5564_epnewp
s_newp_ge1_hiv 

s_ever_ep  s_ever_newp  
s_m1524_ep1524 s_m2534_ep2534 s_m3544_ep3544 s_m4554_ep4554 s_m5564_ep5564 
s_w1524_ep1524 s_w2534_ep2534 s_w3544_ep3544 s_w4554_ep4554 s_w5564_ep5564 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5
s_m1549_newp_ge1  s_w1549_newp_ge1

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 
	
npgt1conc_l4p_1524m  npgt1conc_l4p_1524w  npgt1conc_l4p_1519m  npgt1conc_l4p_1519w  npgt1conc_l4p_2549m 
npgt1conc_l4p_2549w  npgt1conc_l4p_5064m  npgt1conc_l4p_5064w 

s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

s_newp_this_per_art_or_prep   s_newp_this_per_art   s_newp_this_per_prep s_newp_this_per_prep_sw s_newp_this_per_elig_prep 	s_newp_this_per_elig_prep_sw 
s_newp_this_per   s_newp_sw  s_newp_hivneg   s_newp_this_per_hivneg  s_newp_this_per_hivneg_1549  s_newp_this_per_1549 
  
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
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  
s_ai_naive_no_pmtct_ s_ai_naive_no_pmtct_c_nnm_
s_ai_naive_no_pmtct_c_pim_  s_ai_naive_no_pmtct_c_inm_   s_ai_naive_no_pmtct_c_rt184m_  s_ai_naive_no_pmtct_c_rt65m_  s_ai_naive_no_pmtct_c_rttams_ 
s_o_dol_2nd_vlg1000 s_o_dol_2nd_vlg1000_dolr1_adh0  s_o_dol_2nd_vlg1000_dolr1_adh1  s_o_dol_2nd_vlg1000_dolr0_adh0 s_o_dol_2nd_vlg1000_dolr0_adh1 

s_ontle  s_vlg1000_ontle  s_vlg1000_184m_ontle  s_vlg1000_65m_ontle  s_vlg1000_nnm_ontle s_ontld  s_vlg1000_ontld  s_vlg1000_65m_ontld 
s_vlg1000_184m_ontld  s_vlg1000_nnm_ontld s_vlg1000_inm_ontld  s_vlg1000_tams_ontle  s_vlg1000_tams_ontld


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
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w  s_elig_prep_sw   s_elig_prep_onprep

s_elig_prep_w_1549 s_prep_w_1549 

s_elig_prep_w_1524 s_elig_prep_w_2534 s_elig_prep_w_3544 s_prep_w_1524      s_prep_w_2534      s_prep_w_3544 

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

s_prep_newp s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg4  
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_ever_w_1524  s_prep_ever_w
s_test_gt_period1_on_prep  s_test_gt_period1_on_prep_pos  s_test_period1_on_prep  s_test_period1_on_prep_pos  
s_prepuptake_sw 	 s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep	prep_strategy  								

/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_tested1549_		s_tested1549m       s_tested1549w
s_tested_4p_m1549_ 	s_tested_4p_m1519_ 	s_tested_4p_m2024_ s_tested_4p_m2529_  s_tested_4p_m3039_  s_tested_4p_m4049_  s_tested_4p_m5064_
s_tested_4p_w1549_ 	s_tested_4p_w1519_ 	s_tested_4p_w2024_ s_tested_4p_w2529_  s_tested_4p_w3039_  s_tested_4p_w4049_  s_tested_4p_w5064_ 
s_tested_4p_sw		

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_who3_tested  
s_com_test  s_tested_anc_prevdiag  s_tested_anc 		
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
s_diag_this_period_m_sympt  s_diag_this_period_f_sympt  
s_sympt_diag  s_sympt_diag_ever  s_diag_m  s_diag_w  s_epdiag_m  s_epdiag_w	 s_epi_m  s_epi_w
s_diag_ep

/*VL and CD4*/
s_vlg1  s_vlg2  s_vlg3  s_vlg4  s_vlg5  s_vlg6
s_line1_vlg1000 s_line2_vlg1000  s_res_vfail1
s_u_vfail1_this_period  s_u_vfail1  s_vl_vfail1_g1 s_vl_vfail1_g2 s_vl_vfail1_g3 s_vl_vfail1_g4 s_vl_vfail1_g5 s_vl_vfail1_g6 
s_vlg1000_onart  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_184m  s_vlg1000_onart_65m  s_sw_vg1000
s_vg1000  s_vg1000_m  s_vg1000_w s_vg1000_w_1524  s_vg1000_m_1524 s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw s_vl1000_art_gt6m_iicu_sw  s_onart_gt6m_iicu_sw

s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
 s_naive    s_onart  s_int_clinic_not_aw
s_art_start  	s_art_start_m   s_art_start_w   s_artexp  s_artexpoff  s_onart_m  s_onart_w
s_onart_m1549_  s_onart_m1564_  s_onart_m1519_  s_onart_m2024_  s_onart_m2529_  s_onart_m3034_  s_onart_m3539_  
s_onart_m4044_  s_onart_m4549_  s_onart_m5054_  s_onart_m5559_  s_onart_m6064_	
s_onart_m6569_	s_onart_m7074_	s_onart_m7579_	s_onart_m8084_	s_onart_m85pl_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	
s_onart_w6569_	s_onart_w7074_	s_onart_w7579_	s_onart_w8084_	s_onart_w85pl_
s_onart_sw
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
s_onart_cl200  s_onart_cd4_g500  s_onart_res  

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  

s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

s_drug_level_test    s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

s_o_zdv_tox s_o_3tc_tox s_o_ten_tox s_o_taz_tox s_o_lpr_tox s_o_efa_tox s_o_nev_tox s_o_dol_tox 
s_o_zdv_adh_hi s_o_3tc_adh_hi s_o_ten_adh_hi s_o_taz_adh_hi s_o_lpr_adh_hi s_o_efa_adh_hi s_o_nev_adh_hi s_o_dol_adh_hi 

s_o_tle_tox s_o_tld_tox s_o_zld_tox s_o_zla_tox s_o_tle_adh_hi  s_o_tld_adh_hi  s_o_zld_adh_hi  s_o_zla_adh_hi 

s_a_zld_if_reg_op_116  s_adh_hi_a_zld_if_reg_op_116  s_nac_ge2p75_a_zld_if_reg_op_116  s_nac_ge2p00_a_zld_if_reg_op_116  s_nac_ge1p50_a_zld_if_reg_op_116

s_start_zld_if_reg_op_116   s_onart_start_zld_if_reg_op_116   s_e_rt65m_st_zld_if_reg_op_116  s_n_zld_if_reg_op_116  s_x_n_zld_if_reg_op_116 

s_per1_art_int s_per2_art_int	s_dead_per1_art_int	s_dead_per2_art_int  s_cd4_before_int	s_cd4_before_int_lt100   	s_cd4_before_int_100200 
s_cd4_per1_art_int 	s_cd4_per1_art_int_lt100	s_cd4_per1_art_int_100200 s_cd4_per2_art_int 	s_cd4_per2_art_int_lt100	s_cd4_per2_art_int_100200

s_started_art_as_tld_prep_vl1000    s_onart_as_tld_prep   s_onart_as_tld_prep_vl1000     s_started_art_as_tld_prep 

/*costs and dalys (default to age 65; _80 */
s_cost       s_onart_cost    s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ  s_cost_condom_dn  s_cost_sw_program  s_t_adh_int_cost     s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  	
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_donart_cost	   s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dwho3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ  s_dcost_condom_dn   s_dcost_sw_program  s_d_t_adh_int_cost   s_dtest_cost_f  s_dtest_cost_m
s_dcost_prep   s_dcost_prep_visit  			   s_dcost_prep_ac_adh 			
s_dcost_test_m_sympt  	       s_dcost_test_f_sympt  		   s_dcost_test_m_circ  	  	 	s_dcost_test_f_anc s_dcost_test_f_sw
s_dcost_test_f_non_anc 	       s_dpi_cost     s_dcost_switch_line  		  s_dcost_child_hiv s_dcost_child_hiv_mo_art  		   s_dcost_art_init
   s_dart_1_cost  s_dart_2_cost     s_dart_3_cost	   s_dcost_vl_not_done 	
s_dcost_non_aids_pre_death   s_ddaly_non_aids_pre_death  s_dead_ddaly_oth_dol_adv_birth_e   s_dcost_drug_level_test
s_dead_ddaly_ntd	s_ddaly_mtct  s_dead_ddaly  s_live_daly_80  s_live_ddaly_80  s_dead_daly_80  s_dead_ddaly_80

s_cost_80  s_art_cost_80  s_adc_cost_80  s_cd4_cost_80  s_vl_cost_80  s_vis_cost_80  s_full_vis_cost_80  s_who3_cost_80  s_cot_cost_80 
s_tb_cost_80  s_cost_test_80  s_res_cost_80  s_cost_circ_80  s_cost_condom_dn_80  s_cost_sw_program_80  s_t_adh_int_cost_80  s_cost_test_m_80  
s_cost_test_f_80  s_cost_prep_80  s_cost_prep_visit_80  s_cost_prep_ac_adh_80    s_cost_test_m_sympt_80    
s_cost_test_f_sympt_80    s_cost_test_m_circ_80   s_cost_test_f_anc_80  s_cost_test_f_sw_80
s_cost_test_f_non_anc_80   s_pi_cost_80  	  s_cost_switch_line_80    s_cost_child_hiv_80  s_cost_child_hiv_mo_art_80    s_cost_art_init_80
s_art_1_cost_80  s_art_2_cost_80  s_art_3_cost_80  	  s_cost_vl_not_done_80 s_cost_zdv_80  s_cost_ten_80 	  s_cost_3tc_80 	  s_cost_nev_80  	  
s_cost_lpr_80  	  s_cost_dar_80 	  s_cost_taz_80  	  	  s_cost_efa_80  	  s_cost_dol_80  
s_cost__80   s_dcost__80  	  s_dart_cost_80  s_dadc_cost_80  s_dcd4_cost_80  s_dvl_cost_80	  s_dvis_cost_80  	s_dfull_vis_cost_80  s_dwho3_cost_80 
s_dcot_cost_80 s_dtb_cost_80  s_dtest_cost_80  s_dres_cost_80  s_dcost_circ_80  s_dcost_condom_dn_80  s_dcost_sw_program_80  s_d_t_adh_int_cost_80  
s_dtest_cost_f_80  s_dtest_cost_m_80  s_dcost_prep_80  s_dcost_prep_visit_80  	 s_dcost_prep_ac_adh_80 
s_dcost_test_m_sympt_80  	  s_dcost_test_f_sympt_80  		  s_dcost_test_m_circ_80  	s_dcost_test_f_anc_80 s_dcost_test_f_sw_80
s_dcost_test_f_non_anc_80 	  s_dpi_cost_80  s_dcost_switch_line_80   s_dcost_child_hiv_80  s_dcost_child_hiv_mo_art_80  s_dcost_art_init_80 
s_dart_1_cost_80  s_dart_2_cost_80  s_dart_3_cost_80	  s_dcost_vl_not_done_80 s_dcost_non_aids_pre_death_80  s_dcost_drug_level_test_80


/*visits*/
s_visit  s_lost  s_linked_to_care  s_linked_to_care_this_period
s_pre_art_care   
s_visit_prep_no  s_visit_prep_d  s_visit_prep_dt  s_visit_prep_dtc
s_sv  s_sv_secondline   

/*deaths*/
s_dead1564_all	   s_dead1564m_all    s_dead1564w_all
s_dead1519m_all  s_dead2024m_all  s_dead2529m_all  s_dead3034m_all  s_dead3539m_all s_dead4044m_all  s_dead4549m_all
s_dead1519w_all  s_dead2024w_all  s_dead2529w_all  s_dead3034w_all  s_dead3539w_all s_dead4044w_all  s_dead4549w_all
s_death_hivrel  s_dead_rdcause2  s_dead_onart_rdcause2  s_death_dcause3
s_dead1564_   s_death_hiv  s_death_hiv_m  s_death_hiv_w  s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_1p 
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
 s_ev_art_g1k_not2l_adead  s_dead_allage  s_death_dcause3_allage  s_death_hivrel_allage

/*sex workers*/
s_base_rate_sw  s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw1849_  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp   s_sw1524_newp s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  
s_vs_sw

s_age_deb_sw1519_  s_age_deb_sw2024_  s_age_deb_sw2529_  s_age_deb_sw3039_  s_age_deb_swov40_ 
s_age_deb_sw_nm1519_  s_age_deb_sw_nm2024_  s_age_deb_sw_nm2529_  s_age_deb_sw_nm3039_  s_age_deb_sw_nmov40_ 

s_age_stop_sw1519_  s_age_stop_sw2024_  s_age_stop_sw2529_  s_age_stop_sw3039_  s_age_stop_swov40_ 

s_actdur_sw_0to3  s_actdur_sw_3to5  s_actdur_sw_6to9  s_actdur_sw_10to19  
s_totdur_sw_0to3  s_totdur_sw_3to5  s_totdur_sw_6to9  s_totdur_sw_10to19 
s_totdur_eversw_0to3  s_totdur_eversw_3to5  s_totdur_eversw_6to9  s_totdur_eversw_10to19 

s_sw_program_visit

s_diag_sw_noprog  s_diag_sw_inprog  s_onart_sw_noprog  s_onart_sw_inprog  
s_vl1000_art_gt6m_iicu_sw_noprog  s_vl1000_art_gt6m_iicu_sw_inprog 

s_sw1519_tp1  s_sw2024_tp1  s_sw2529_tp1  s_sw3039_tp1  s_swov40_tp1

/*ADC etc*/
s_adc  s_who3_event  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 

/*Pregnancy and children*/
s_pregnant 	s_anc  s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant 
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524_  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_ceb_w1524 		s_ceb_w2534 		s_ceb_w3544 		s_ceb_w4549 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child    

/*circumcision*/
s_mcirc  s_mcirc_1519m  s_mcirc_2024m  s_mcirc_2529m  s_mcirc_3034m  s_mcirc_3539m  s_mcirc_4044m  s_mcirc_4549m 
s_mcirc_50plm  	s_mcirc_5054m  s_mcirc_5559m  s_mcirc_6064m  s_mcirc_6569m 	s_mcirc_7074m  s_mcirc_7579m  s_mcirc_8084m  s_mcirc_85plm 
s_vmmc s_vmmc1519m  s_vmmc2024m  s_vmmc2529m  s_vmmc3034m  s_vmmc3539m  s_vmmc4044m  s_vmmc4549m  s_vmmc50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3034m  s_new_mcirc_3539m  
s_new_mcirc_4044m  s_new_mcirc_4549m  s_new_mcirc_50plm
s_new_mcirc_5054m s_new_mcirc_5559m s_new_mcirc_6064m s_new_mcirc_6569m s_new_mcirc_7074m s_new_mcirc_7579m s_new_mcirc_8084m s_new_mcirc_85plm
s_new_vmmc s_new_vmmc1519m  s_new_vmmc2024m  s_new_vmmc2529m  s_new_vmmc3034m  s_new_vmmc3539m  s_new_vmmc4044m 
s_new_vmmc4549m  s_new_vmmc50plm

s_hivneg_uncirc_1014  s_hivneg_uncirc_1519 s_hivneg_uncirc_2024  s_hivneg_uncirc_2529  s_hivneg_uncirc_3034 
s_hivneg_uncirc_3539 s_hivneg_uncirc_4044  s_hivneg_uncirc_4549 

s_birth_circ  s_mcirc_1014m  s_new_mcirc_1014m  s_vmmc1014m  s_new_vmmc1014m



/*parameters sampled*/
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  sex_age_mixing_matrix_m sex_age_mixing_matrix_w   p_rred_p  p_hsb_p  newp_factor  fold_tr_newp
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate circ_inc_15_19 circ_red_20_30  circ_red_30_50
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat   base_rate_sw 
prob_prep_restart_choice 	prepuptake_sw 		prepuptake_pop   cd4_monitoring   base_rate_stop_sexwork    rred_a_p higher_newp_with_lower_adhav
rr_int_tox   rate_birth_with_infected_child   incr_mort_risk_dol_weightg sw_program_effect
greater_disability_tox 	  greater_tox_zdv 	higher_rate_res_dol  rel_dol_tox  dol_higher_potency  prop_bmi_ge23
ntd_risk_dol oth_dol_adv_birth_e_risk  ntd_risk_dol  double_rate_gas_tox_taz  zdv_potency_p75
sw_program eff_sw_program sw_higher_int  prob_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
nnrti_res_no_effect  sw_init_newp sw_trans_matrix  rate_sw_rred_rc  effect_weak_sw_prog_newp  effect_strong_sw_prog_newp
sw_art_disadv  zero_3tc_activity_m184  zero_tdf_activity_k65r  lower_future_art_cov  higher_future_prep_cov

/*2020 interventions*/
condom_incr_2020    			  incr_test_2020             decr_hard_reach_2020  incr_adh_2020 
decr_prob_loss_at_diag_2020 	  decr_rate_lost_2020 		    decr_rate_lost_art_2020    incr_rate_return_2020     
incr_rate_restart_2020          incr_rate_init_2020          decr_rate_int_choice_2020  incr_prob_vl_meas_done_2020 
incr_pr_switch_line_2020    	 prep_improvements       	 incr_adh_pattern_prep_2020 
inc_r_test_startprep_2020   incr_r_test_restartprep_2020 decr_r_choose_stop_prep_2020 
inc_p_prep_restart_choi_2020  incr_prepuptake_sw_2020      incr_prepuptake_pop_2020   prep_strategy_2020 
 circ_inc_rate_2020 		     incr_test_targeting_2020   
incr_max_freq_testing_2020      initial_pr_switch_line       initial_prob_vl_meas_done  sw_test_6mthly_2020   reg_option_switch_2020 
art_mon_drug_levels_2020   ten_is_taf_2020  	pop_wide_tld_2020  single_vl_switch_efa_2020

eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice 	prepuptake_sw  prepuptake_pop e_decr_hard_reach_2020  eff_test_targeting

vmmc_disrup_covid condom_disrup_covid prep_disrup_covid swprog_disrup_covid testing_disrup_covid art_tld_disrup_covid art_tld_eod_disrup_covid
art_init_disrup_covid vl_adh_switch_disrup_covid cotrim_disrup_covid no_art_disrup_covid inc_death_rate_aids_disrup_covid art_low_adh_disrup_covid
cov_death_risk_mult


/*supp material*/
s_onart_vlg1     s_onart_vlg2     s_onart_vlg3     s_onart_vlg4     s_onart_vlg5    
s_onart_vlg1_r   s_onart_vlg2_r   s_onart_vlg3_r   s_onart_vlg4_r   s_onart_vlg5_r 
s_onart_who4_year1   s_onart_who4_year1_vlt1000  s_onart_who4_year3   s_onart_who4_year3_vlt1000  s_onart_cd4l200_year1  
s_onart_cd4l200_year1_vlt1000  s_onart_cd4l200_year3   s_onart_cd4l200_year3_vlt1000  s_onart_res_1stline_linefail0   
s_onart_res_1stline  s_onart_linefail0  s_onart_linefail0_cl200  s_onart_linefail0_cl50  s_onart_cl50  s_onart_linefail0_vg1000  
s_onart_vg1000   s_onart_linefail0_vg1000_r   s_onart_vg1000_r   s_onart_cl350

s_newpge1_l4p_1529m	s_newpge1_l4p_1529w

s_m_1524_ge1newpever  s_m_2534_ge1newpever  s_m_3544_ge1newpever  s_m_4554_ge1newpever  s_m_5564_ge1newpever
s_m_1524_ge2newpever  s_m_2534_ge2newpever  s_m_3544_ge2newpever  s_m_4554_ge2newpever  s_m_5564_ge2newpever
s_m_1524_ge5newpever  s_m_2534_ge5newpever  s_m_3544_ge5newpever  s_m_4554_ge5newpever  s_m_5564_ge5newpever
s_w_ge1newpever		  s_w_ge2newpever		s_w_ge5newpever

s_npge1_l4p_1564m  s_npge1_l4p_1524m  s_npge1_l4p_2534m  s_npge1_l4p_3544m  s_npge1_l4p_4554m  s_npge1_l4p_5564m  s_npge1_l4p_1564w  s_npge1_l4p_1524w  s_npge1_l4p_2534w  s_npge1_l4p_3544w  s_npge1_l4p_4554w  s_npge1_l4p_5564w
s_npge2_l4p_1564m  s_npge2_l4p_1524m  s_npge2_l4p_2534m  s_npge2_l4p_3544m  s_npge2_l4p_4554m  s_npge2_l4p_5564m  s_npge2_l4p_1564w  s_npge2_l4p_1524w  s_npge2_l4p_2534w  s_npge2_l4p_3544w  s_npge2_l4p_4554w  s_npge2_l4p_5564w
s_npge10_l4p_1564m  s_npge10_l4p_1524m  s_npge10_l4p_2534m  s_npge10_l4p_3544m  s_npge10_l4p_4554m  s_npge10_l4p_5564m  s_npge10_l4p_1564w  s_npge10_l4p_1524w  s_npge10_l4p_2534w  s_npge10_l4p_3544w  s_npge10_l4p_4554w  s_npge10_l4p_5564w
s_npge50_l4p_1564m  s_npge50_l4p_1524m  s_npge50_l4p_2534m  s_npge50_l4p_3544m  s_npge50_l4p_4554m  s_npge50_l4p_5564m  s_npge50_l4p_1564w  s_npge50_l4p_1524w  s_npge50_l4p_2534w  s_npge50_l4p_3544w  s_npge50_l4p_4554w  s_npge50_l4p_5564w
s_npge1_l4p_1564_hivpos  s_npge2_l4p_1564_hivpos  s_npge1_l4p_1564_hivdiag  s_npge2_l4p_1564_hivdiag  s_npge1_l4p_1564_hivneg  s_npge2_l4p_1564_hivneg

/* covid */

s_covid

/* used in abort statements */

prevalence1549  prev_ratio_1524 incidence1549w incidence1549m cum_ratio_newp_mw

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

s_prop_m_vlg1  s_prop_m_vlg2  s_prop_m_vlg3  s_prop_m_vlg4  s_prop_m_vlg5 s_prop_m_vlg6 
s_prop_w_vlg1  s_prop_w_vlg2  s_prop_w_vlg3  s_prop_w_vlg4  s_prop_w_vlg5 s_prop_w_vlg6

p_onart_vls  p_onart_epvls  d_vls
p_diag  p_diag_onart  p_diag_eponart  p_diag_m  p_diag_w  p_epdiag_m  p_epdiag_w  d_diag_m  d_diag_w
d_onart

d_hiv_epi_wm  d_hiv_epi_mw  r_hiv_epi_both  r_ep_mw

r_s_ep_m15w15 r_s_ep_m25w25 r_s_ep_m35w35 r_s_ep_m45w45 r_s_ep_m55w55 

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r  s_m_newp   s_w_newp
ptnewp15_m  ptnewp25_m  ptnewp35_m  ptnewp45_m  ptnewp55_m
ptnewp15_w  ptnewp25_w  ptnewp35_w  ptnewp45_w  ptnewp55_w

/* keep going - only needed for test runs */

keep_going_1999   keep_going_2004   keep_going_2016   keep_going_2020   

;





* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 7

* add the variable values for this 3 months period to the data set cum_l1 or cum_l2 (it flips between these) - this is the data set of model
outputs that we are building up to save at the end

update the data set of individual values of variables for each person from the 3 month period just completed by adding in the summary variable 
values from that 3 month period

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;



data cum_l&da2; set cum_l&da1 sums;


data s;set sums;
do i=1 to &population; 
	n=1; output; 
end; 
drop i;

data r&da2; merge r&da1 s   ;

* these variables below need creating so that can use t_ version in main code and then use s_ in the sum statments - sum statements need the sum
variable not to exist in the data set;

t_prop_newp_i_w_1524 = s_prop_newp_i_w_1524 ;  
t_prop_newp_i_w_2534 = s_prop_newp_i_w_2534  ;  
t_prop_newp_i_w_3544 = s_prop_newp_i_w_3544  ;  
t_prop_newp_i_w_4554 = s_prop_newp_i_w_4554  ;  
t_prop_newp_i_w_5564 = s_prop_newp_i_w_5564  ; 
t_prop_newp_i_m_1524 = s_prop_newp_i_m_1524  ;  
t_prop_newp_i_m_2534 = s_prop_newp_i_m_2534  ;  
t_prop_newp_i_m_3544 = s_prop_newp_i_m_3544  ;  
t_prop_newp_i_m_4554 = s_prop_newp_i_m_4554  ;  
t_prop_newp_i_m_5564 = s_prop_newp_i_m_5564  ; 
t_prop_ageg1_w_vlg1 = s_prop_ageg1_w_vlg1 ;  
t_prop_ageg1_w_vlg2 = s_prop_ageg1_w_vlg2 ;  
t_prop_ageg1_w_vlg3 = s_prop_ageg1_w_vlg3 ;  
t_prop_ageg1_w_vlg4 = s_prop_ageg1_w_vlg4 ;  
t_prop_ageg1_w_vlg5 = s_prop_ageg1_w_vlg5 ; 
t_prop_ageg1_w_vlg6 = s_prop_ageg1_w_vlg6 ;  
t_prop_ageg2_w_vlg1 = s_prop_ageg2_w_vlg1 ;  
t_prop_ageg2_w_vlg2 = s_prop_ageg2_w_vlg2 ;  
t_prop_ageg2_w_vlg3 = s_prop_ageg2_w_vlg3 ;  
t_prop_ageg2_w_vlg4 = s_prop_ageg2_w_vlg4 ;  
t_prop_ageg2_w_vlg5 = s_prop_ageg2_w_vlg5 ; 
t_prop_ageg2_w_vlg6 = s_prop_ageg2_w_vlg6 ;  
t_prop_ageg3_w_vlg1 = s_prop_ageg3_w_vlg1 ;  
t_prop_ageg3_w_vlg2 = s_prop_ageg3_w_vlg2 ;  
t_prop_ageg3_w_vlg3 = s_prop_ageg3_w_vlg3 ;  
t_prop_ageg3_w_vlg4 = s_prop_ageg3_w_vlg4 ;  
t_prop_ageg3_w_vlg5 = s_prop_ageg3_w_vlg5 ; 
t_prop_ageg3_w_vlg6 = s_prop_ageg3_w_vlg6 ;  
t_prop_ageg4_w_vlg1 = s_prop_ageg4_w_vlg1 ;  
t_prop_ageg4_w_vlg2 = s_prop_ageg4_w_vlg2 ;  
t_prop_ageg4_w_vlg3 = s_prop_ageg4_w_vlg3 ;  
t_prop_ageg4_w_vlg4 = s_prop_ageg4_w_vlg4 ;  
t_prop_ageg4_w_vlg5 = s_prop_ageg4_w_vlg5 ; 
t_prop_ageg4_w_vlg6 = s_prop_ageg4_w_vlg6 ;  
t_prop_ageg5_w_vlg1 = s_prop_ageg5_w_vlg1 ;  
t_prop_ageg5_w_vlg2 = s_prop_ageg5_w_vlg2 ;  
t_prop_ageg5_w_vlg3 = s_prop_ageg5_w_vlg3 ;  
t_prop_ageg5_w_vlg4 = s_prop_ageg5_w_vlg4 ;  
t_prop_ageg5_w_vlg5 = s_prop_ageg5_w_vlg5 ; 
t_prop_ageg5_w_vlg6 = s_prop_ageg5_w_vlg6 ;  
t_prop_ageg1_m_vlg1 = s_prop_ageg1_m_vlg1 ;  
t_prop_ageg1_m_vlg2 = s_prop_ageg1_m_vlg2 ;  
t_prop_ageg1_m_vlg3 = s_prop_ageg1_m_vlg3 ;  
t_prop_ageg1_m_vlg4 = s_prop_ageg1_m_vlg4 ;  
t_prop_ageg1_m_vlg5 = s_prop_ageg1_m_vlg5 ; 
t_prop_ageg1_m_vlg6 = s_prop_ageg1_m_vlg6 ;  
t_prop_ageg2_m_vlg1 = s_prop_ageg2_m_vlg1 ;  
t_prop_ageg2_m_vlg2 = s_prop_ageg2_m_vlg2 ;  
t_prop_ageg2_m_vlg3 = s_prop_ageg2_m_vlg3 ;  
t_prop_ageg2_m_vlg4 = s_prop_ageg2_m_vlg4 ;  
t_prop_ageg2_m_vlg5 = s_prop_ageg2_m_vlg5 ; 
t_prop_ageg2_m_vlg6 = s_prop_ageg2_m_vlg6 ;  
t_prop_ageg3_m_vlg1 = s_prop_ageg3_m_vlg1 ;  
t_prop_ageg3_m_vlg2 = s_prop_ageg3_m_vlg2 ;  
t_prop_ageg3_m_vlg3 = s_prop_ageg3_m_vlg3 ;  
t_prop_ageg3_m_vlg4 = s_prop_ageg3_m_vlg4 ;  
t_prop_ageg3_m_vlg5 = s_prop_ageg3_m_vlg5 ; 
t_prop_ageg3_m_vlg6 = s_prop_ageg3_m_vlg6 ;  
t_prop_ageg4_m_vlg1 = s_prop_ageg4_m_vlg1 ;  
t_prop_ageg4_m_vlg2 = s_prop_ageg4_m_vlg2 ;  
t_prop_ageg4_m_vlg3 = s_prop_ageg4_m_vlg3 ;  
t_prop_ageg4_m_vlg4 = s_prop_ageg4_m_vlg4 ;  
t_prop_ageg4_m_vlg5 = s_prop_ageg4_m_vlg5 ; 
t_prop_ageg4_m_vlg6 = s_prop_ageg4_m_vlg6 ;  
t_prop_ageg5_m_vlg1 = s_prop_ageg5_m_vlg1 ;  
t_prop_ageg5_m_vlg2 = s_prop_ageg5_m_vlg2 ;  
t_prop_ageg5_m_vlg3 = s_prop_ageg5_m_vlg3 ;  
t_prop_ageg5_m_vlg4 = s_prop_ageg5_m_vlg4 ;  
t_prop_ageg5_m_vlg5 = s_prop_ageg5_m_vlg5 ; 
t_prop_ageg5_m_vlg6 = s_prop_ageg5_m_vlg6 ;  
t_prop_m_vlg1 = s_prop_m_vlg1 ;  
t_prop_m_vlg2 = s_prop_m_vlg2 ;  
t_prop_m_vlg3 = s_prop_m_vlg3 ;  
t_prop_m_vlg4 = s_prop_m_vlg4 ; 
t_prop_m_vlg5 = s_prop_m_vlg5 ;  
t_prop_m_vlg6 = s_prop_m_vlg6 ;  
t_prop_w_vlg1 = s_prop_w_vlg1 ; 
t_prop_w_vlg2 = s_prop_w_vlg2 ;  
t_prop_w_vlg3 = s_prop_w_vlg3 ;  
t_prop_w_vlg4 = s_prop_w_vlg4 ;  
t_prop_w_vlg5 = s_prop_w_vlg5 ;  
t_prop_w_vlg6 = s_prop_w_vlg6 ;  
t_prop_vlg1_rm = s_prop_vlg1_rm ;  
t_prop_vlg2_rm = s_prop_vlg2_rm ; 
t_prop_vlg3_rm = s_prop_vlg3_rm ;  
t_prop_vlg4_rm = s_prop_vlg4_rm ;  
t_prop_vlg5_rm = s_prop_vlg5_rm ;  
t_prop_vlg6_rm = s_prop_vlg6_rm ;  
t_prop_tam2 = s_prop_tam2 ;  
t_prop_tam1 = s_prop_tam1 ;  
t_prop_tam3 = s_prop_tam3 ; 
t_prop_m184m = s_prop_m184m ;  
t_prop_k65m = s_prop_k65m ;  
t_prop_q151m = s_prop_q151m ;  
t_prop_k103m = s_prop_k103m ;  
t_prop_y181m = s_prop_y181m ;  
t_prop_g190m = s_prop_g190m ;  
t_prop_p32m = s_prop_p32m ; 
t_prop_p33m = s_prop_p33m ;  
t_prop_p46m = s_prop_p46m ;  
t_prop_p47m = s_prop_p47m ;  
t_prop_p50lm = s_prop_p50lm ;  
t_prop_p50vm = s_prop_p50vm ;  
t_prop_p54m = s_prop_p54m ;  
t_prop_p76m = s_prop_p76m ; 
t_prop_p82m = s_prop_p82m ;  
t_prop_p84m = s_prop_p84m ;  
t_prop_p88m = s_prop_p88m ;  
t_prop_p90m = s_prop_p90m ;  
t_prop_inpm = s_prop_inpm ;  
t_prop_insm = s_prop_insm ; 
t_prop_vlg1_rm0_diag = s_prop_vlg1_rm0_diag ;  
t_prop_vlg1_rm0_naive = s_prop_vlg1_rm0_naive ; 
t_prop_vlg1_rm1_diag = s_prop_vlg1_rm1_diag ;  
t_prop_vlg1_rm1_naive = s_prop_vlg1_rm1_naive ;  
t_prop_vlg2_rm0_diag = s_prop_vlg2_rm0_diag ;  
t_prop_vlg2_rm0_naive = s_prop_vlg2_rm0_naive ;  
t_prop_vlg2_rm1_diag = s_prop_vlg2_rm1_diag ; 
t_prop_vlg2_rm1_naive = s_prop_vlg2_rm1_naive ;  
t_prop_vlg3_rm0_diag = s_prop_vlg3_rm0_diag ;  
t_prop_vlg3_rm0_naive = s_prop_vlg3_rm0_naive ;  
t_prop_vlg3_rm1_diag = s_prop_vlg3_rm1_diag ;  
t_prop_vlg3_rm1_naive = s_prop_vlg3_rm1_naive ; 
t_prop_vlg4_rm0_diag = s_prop_vlg4_rm0_diag ;  
t_prop_vlg4_rm0_naive = s_prop_vlg4_rm0_naive ;  
t_prop_vlg4_rm1_diag = s_prop_vlg4_rm1_diag ;  
t_prop_vlg4_rm1_naive = s_prop_vlg4_rm1_naive ;  
t_prop_vlg5_rm0_diag = s_prop_vlg5_rm0_diag ; 
t_prop_vlg5_rm0_naive = s_prop_vlg5_rm0_naive ;  
t_prop_vlg5_rm1_diag = s_prop_vlg5_rm1_diag ;  
t_prop_vlg5_rm1_naive = s_prop_vlg5_rm1_naive ;  
t_prop_vlg6_rm0_diag = s_prop_vlg6_rm0_diag ;  
t_prop_vlg6_rm0_naive = s_prop_vlg6_rm0_naive ; 
t_prop_vlg6_rm1_diag = s_prop_vlg6_rm1_diag ;  
t_prop_vlg6_rm1_naive = s_prop_vlg6_rm1_naive ;  
t_m_newp = s_m_newp; 
t_w_newp = s_w_newp;


drop 


/*general*/
s_n  cald  
																														 										  
/*number alive and in each age group*/
s_alive1549 	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m		s_ageg1014m	
s_ageg1517w		s_ageg1819w		s_ageg1519w  	s_ageg2024w		s_ageg2529w  	s_ageg3034w		s_ageg3539w		s_ageg4044w	
s_ageg4549w		s_ageg5054w 	s_ageg5559w		s_ageg6064w		s_ageg1564w		s_ageg1549w		s_age_1844w
s_ageg1m  s_ageg2m  s_ageg3m  s_ageg4m  s_ageg5m  s_ageg1w  s_ageg2w  s_ageg3w  s_ageg4w  s_ageg5w  

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		s_ageg85plm
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		s_ageg85plw
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m	s_hiv85plm	
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w  s_hiv85plw 
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
s_primary_sw  s_primary_sw1519_  s_primary_sw2024_  s_primary_sw2529_  s_primary_sw3039_
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
s_np  s_newp  s_newp_ge1  s_newp_ge5  s_newp_ge10  s_newp_ge50  s_ep  s_ep_m  s_ep_w  s_npge10  s_npge2  s_npge2_l4p_1549m  s_npge2_l4p_1549w
s_m_1524_ep  	 s_m_2534_ep 	  s_m_3544_ep 	   s_m_4554_ep 		s_m_5564_ep 	 
s_w_1524_ep		 s_w_2534_ep 	  s_w_3544_ep	   s_w_4554_ep 		s_w_5564_ep 
s_m_1524_newp  	 s_m_2534_newp    s_m_3544_newp    s_m_4554_newp  	s_m_5564_newp
s_w_1524_newp  	 s_w_2534_newp    s_w_3544_newp    s_w_4554_newp    s_w_5564_newp
s_m_1524_epnewp  s_m_2534_epnewp  s_m_3544_epnewp  s_m_4554_epnewp  s_m_5564_epnewp 
s_w_1524_epnewp  s_w_2534_epnewp  s_w_3544_epnewp  s_w_4554_epnewp  s_w_5564_epnewp
s_newp_ge1_hiv 

s_ever_ep  s_ever_newp  
s_m1524_ep1524 s_m2534_ep2534 s_m3544_ep3544 s_m4554_ep4554 s_m5564_ep5564 
s_w1524_ep1524 s_w2534_ep2534 s_w3544_ep3544 s_w4554_ep4554 s_w5564_ep5564 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5
s_m1549_newp_ge1  s_w1549_newp_ge1

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 
	
s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

s_newp_this_per_art_or_prep   s_newp_this_per_art   s_newp_this_per_prep  s_newp_this_per_prep_sw  s_newp_this_per_elig_prep 	
s_newp_this_per_elig_prep_sw 
s_newp_this_per   s_newp_sw  s_newp_hivneg   s_newp_this_per_hivneg    s_newp_this_per_hivneg_1549  s_newp_this_per_1549

s_s_m_newp  s_s_w_newp

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
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  
s_ai_naive_no_pmtct_ s_ai_naive_no_pmtct_c_nnm_
s_ai_naive_no_pmtct_c_pim_  s_ai_naive_no_pmtct_c_inm_   s_ai_naive_no_pmtct_c_rt184m_  s_ai_naive_no_pmtct_c_rt65m_  s_ai_naive_no_pmtct_c_rttams_ 
s_o_dol_2nd_vlg1000 s_o_dol_2nd_vlg1000_dolr1_adh0  s_o_dol_2nd_vlg1000_dolr1_adh1  s_o_dol_2nd_vlg1000_dolr0_adh0 s_o_dol_2nd_vlg1000_dolr0_adh1 


s_ontle  s_vlg1000_ontle  s_vlg1000_184m_ontle  s_vlg1000_65m_ontle  s_vlg1000_nnm_ontle s_ontld  s_vlg1000_ontld  s_vlg1000_65m_ontld 
s_vlg1000_184m_ontld  s_vlg1000_nnm_ontld s_vlg1000_inm_ontld  s_vlg1000_tams_ontle  s_vlg1000_tams_ontld

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
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w  s_elig_prep_sw   s_elig_prep_onprep

s_elig_prep_w_1549 s_prep_w_1549 

s_elig_prep_w_1524 s_elig_prep_w_2534 s_elig_prep_w_3544 s_prep_w_1524      s_prep_w_2534      s_prep_w_3544 

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

s_prep_newp  s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg4  
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_ever_w_1524  s_prep_ever_w
s_test_gt_period1_on_prep  s_test_gt_period1_on_prep_pos  s_test_period1_on_prep  s_test_period1_on_prep_pos  
s_prepuptake_sw 	 s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep	 							

/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_tested1549_		s_tested1549m       s_tested1549w
s_tested_4p_m1549_ 	s_tested_4p_m1519_ 	s_tested_4p_m2024_ s_tested_4p_m2529_  s_tested_4p_m3039_  s_tested_4p_m4049_  s_tested_4p_m5064_
s_tested_4p_w1549_ 	s_tested_4p_w1519_ 	s_tested_4p_w2024_ s_tested_4p_w2529_  s_tested_4p_w3039_  s_tested_4p_w4049_  s_tested_4p_w5064_ 
s_tested_4p_sw		

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_who3_tested  
s_com_test  s_tested_anc_prevdiag  s_tested_anc 		
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
s_diag_this_period_m_sympt  s_diag_this_period_f_sympt  
s_sympt_diag  s_sympt_diag_ever  s_diag_m  s_diag_w  s_epdiag_m  s_epdiag_w	 s_epi_m  s_epi_w
s_diag_ep

/*VL and CD4*/
s_vlg1  s_vlg2  s_vlg3  s_vlg4  s_vlg5  s_vlg6
s_line1_vlg1000 s_line2_vlg1000  s_res_vfail1
s_u_vfail1_this_period  s_u_vfail1  s_vl_vfail1_g1 s_vl_vfail1_g2 s_vl_vfail1_g3 s_vl_vfail1_g4 s_vl_vfail1_g5 s_vl_vfail1_g6 
s_vlg1000_onart  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_184m  s_vlg1000_onart_65m  s_sw_vg1000
s_vg1000  s_vg1000_m  s_vg1000_w  s_vg1000_w_1524  s_vg1000_m_1524  s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw s_vl1000_art_gt6m_iicu_sw  s_onart_gt6m_iicu_sw

s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
 s_naive    s_onart  s_int_clinic_not_aw
s_art_start  	s_art_start_m   s_art_start_w   s_artexp  s_artexpoff  s_onart_m  s_onart_w
s_onart_m1549_  s_onart_m1564_  s_onart_m1519_  s_onart_m2024_  s_onart_m2529_  s_onart_m3034_  s_onart_m3539_  
s_onart_m4044_  s_onart_m4549_  s_onart_m5054_  s_onart_m5559_  s_onart_m6064_	
s_onart_m6569_	s_onart_m7074_	s_onart_m7579_	s_onart_m8084_	s_onart_m85pl_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	
s_onart_w6569_	s_onart_w7074_	s_onart_w7579_	s_onart_w8084_	s_onart_w85pl_	
s_onart_sw
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
s_onart_cl200  s_onart_cd4_g500  s_onart_res  

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  

s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

s_drug_level_test    s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

s_o_zdv_tox s_o_3tc_tox s_o_ten_tox s_o_taz_tox s_o_lpr_tox s_o_efa_tox s_o_nev_tox s_o_dol_tox 
s_o_zdv_adh_hi s_o_3tc_adh_hi s_o_ten_adh_hi s_o_taz_adh_hi s_o_lpr_adh_hi s_o_efa_adh_hi s_o_nev_adh_hi s_o_dol_adh_hi 

s_o_tle_tox s_o_tld_tox s_o_zld_tox s_o_zla_tox s_o_tle_adh_hi  s_o_tld_adh_hi  s_o_zld_adh_hi  s_o_zla_adh_hi 

s_a_zld_if_reg_op_116  s_adh_hi_a_zld_if_reg_op_116  s_nac_ge2p75_a_zld_if_reg_op_116  s_nac_ge2p00_a_zld_if_reg_op_116  s_nac_ge1p50_a_zld_if_reg_op_116

s_start_zld_if_reg_op_116   s_onart_start_zld_if_reg_op_116   s_e_rt65m_st_zld_if_reg_op_116  s_n_zld_if_reg_op_116  s_x_n_zld_if_reg_op_116 

s_per1_art_int s_per2_art_int	s_dead_per1_art_int	s_dead_per2_art_int  s_cd4_before_int	s_cd4_before_int_lt100   	s_cd4_before_int_100200 
s_cd4_per1_art_int 	s_cd4_per1_art_int_lt100	s_cd4_per1_art_int_100200 s_cd4_per2_art_int 	s_cd4_per2_art_int_lt100	s_cd4_per2_art_int_100200

s_started_art_as_tld_prep_vl1000    s_onart_as_tld_prep   s_onart_as_tld_prep_vl1000     s_started_art_as_tld_prep 

/*costs and dalys*/
s_cost       s_onart_cost		s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ  s_cost_condom_dn  s_cost_sw_program     s_t_adh_int_cost     s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  			 
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_donart_cost		s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dwho3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ   s_dcost_condom_dn  s_dcost_sw_program   s_d_t_adh_int_cost   s_dtest_cost_f  s_dtest_cost_m
s_dcost_prep   s_dcost_prep_visit  			   s_dcost_prep_ac_adh 		
s_dcost_test_m_sympt  	       s_dcost_test_f_sympt  		   s_dcost_test_m_circ  	  	 	s_dcost_test_f_anc s_dcost_test_f_sw
s_dcost_test_f_non_anc 	       s_dpi_cost     s_dcost_switch_line  		  s_dcost_child_hiv s_dcost_child_hiv_mo_art  		   s_dcost_art_init
   s_dart_1_cost  s_dart_2_cost     s_dart_3_cost	   s_dcost_vl_not_done 	
s_dcost_non_aids_pre_death   s_ddaly_non_aids_pre_death  s_dead_ddaly_oth_dol_adv_birth_e   s_dcost_drug_level_test
s_dead_ddaly_ntd	s_ddaly_mtct  s_dead_ddaly  s_live_daly_80  s_live_ddaly_80  s_dead_daly_80  s_dead_ddaly_80

s_cost_80  s_art_cost_80  s_adc_cost_80  s_cd4_cost_80  s_vl_cost_80  s_vis_cost_80  s_full_vis_cost_80  s_who3_cost_80  s_cot_cost_80 
s_tb_cost_80  s_cost_test_80  s_res_cost_80  s_cost_circ_80  s_cost_condom_dn_80  s_cost_sw_program_80  s_t_adh_int_cost_80  s_cost_test_m_80  
s_cost_test_f_80  s_cost_prep_80  s_cost_prep_visit_80  s_cost_prep_ac_adh_80   s_cost_test_m_sympt_80    
s_cost_test_f_sympt_80    s_cost_test_m_circ_80   s_cost_test_f_anc_80  s_cost_test_f_sw_80
s_cost_test_f_non_anc_80   s_pi_cost_80  	  s_cost_switch_line_80    s_cost_child_hiv_80  s_cost_child_hiv_mo_art_80    s_cost_art_init_80
s_art_1_cost_80  s_art_2_cost_80  s_art_3_cost_80  	  s_cost_vl_not_done_80 s_cost_zdv_80  s_cost_ten_80 	  s_cost_3tc_80 	  s_cost_nev_80  	  
s_cost_lpr_80  	  s_cost_dar_80 	  s_cost_taz_80  	  	  s_cost_efa_80  	  s_cost_dol_80  
s_cost__80   s_dcost__80  	  s_dart_cost_80  s_dadc_cost_80  s_dcd4_cost_80  s_dvl_cost_80	  s_dvis_cost_80  	s_dfull_vis_cost_80  s_dwho3_cost_80 
s_dcot_cost_80 s_dtb_cost_80  s_dtest_cost_80  s_dres_cost_80  s_dcost_circ_80  s_dcost_condom_dn_80  s_dcost_sw_program_80  s_d_t_adh_int_cost_80  
s_dtest_cost_f_80  s_dtest_cost_m_80  s_dcost_prep_80  s_dcost_prep_visit_80  	 s_dcost_prep_ac_adh_80 	
s_dcost_test_m_sympt_80  	  s_dcost_test_f_sympt_80  		  s_dcost_test_m_circ_80  	s_dcost_test_f_anc_80 s_dcost_test_f_sw_80
s_dcost_test_f_non_anc_80 	  s_dpi_cost_80  s_dcost_switch_line_80   s_dcost_child_hiv_80  s_dcost_child_hiv_mo_art_80  s_dcost_art_init_80 
s_dart_1_cost_80  s_dart_2_cost_80  s_dart_3_cost_80	  s_dcost_vl_not_done_80 s_dcost_non_aids_pre_death_80  s_dcost_drug_level_test_80


/*visits*/
s_visit  s_lost  s_linked_to_care  s_linked_to_care_this_period
s_pre_art_care   
s_visit_prep_no  s_visit_prep_d  s_visit_prep_dt  s_visit_prep_dtc
s_sv  s_sv_secondline   

/*deaths*/
s_dead1564_all	   s_dead1564m_all    s_dead1564w_all
s_dead1519m_all  s_dead2024m_all  s_dead2529m_all  s_dead3034m_all  s_dead3539m_all s_dead4044m_all  s_dead4549m_all
s_dead1519w_all  s_dead2024w_all  s_dead2529w_all  s_dead3034w_all  s_dead3539w_all s_dead4044w_all  s_dead4549w_all
s_death_hivrel  s_dead_rdcause2  s_dead_onart_rdcause2  s_death_dcause3
s_dead1564_   s_death_hiv s_death_hiv_m s_death_hiv_w s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_1p 
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
 s_ev_art_g1k_not2l_adead  s_dead_allage   s_death_dcause3_allage  s_death_hivrel_allage

/*sex workers*/
s_base_rate_sw  s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw1849_  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp   s_sw1524_newp s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  
s_vs_sw
s_age_deb_sw1519_  s_age_deb_sw2024_  s_age_deb_sw2529_  s_age_deb_sw3039_  s_age_deb_swov40_ 
s_age_deb_sw_nm1519_  s_age_deb_sw_nm2024_  s_age_deb_sw_nm2529_  s_age_deb_sw_nm3039_  s_age_deb_sw_nmov40_ 

s_age_stop_sw1519_  s_age_stop_sw2024_  s_age_stop_sw2529_  s_age_stop_sw3039_  s_age_stop_swov40_ 

s_actdur_sw_0to3  s_actdur_sw_3to5  s_actdur_sw_6to9  s_actdur_sw_10to19  
s_totdur_sw_0to3  s_totdur_sw_3to5  s_totdur_sw_6to9  s_totdur_sw_10to19 
s_totdur_eversw_0to3  s_totdur_eversw_3to5  s_totdur_eversw_6to9  s_totdur_eversw_10to19 

s_sw_program_visit

s_diag_sw_noprog  s_diag_sw_inprog  s_onart_sw_noprog  s_onart_sw_inprog  
s_vl1000_art_gt6m_iicu_sw_noprog  s_vl1000_art_gt6m_iicu_sw_inprog 

s_sw1519_tp1  s_sw2024_tp1  s_sw2529_tp1  s_sw3039_tp1  s_swov40_tp1

/*ADC etc*/
s_adc  s_who3_event  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 

/*Pregnancy and children*/
s_pregnant 	s_anc  s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant 
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524_  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_ceb_w1524 		s_ceb_w2534 		s_ceb_w3544 		s_ceb_w4549 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child    

/*circumcision*/
s_mcirc  s_mcirc_1519m  s_mcirc_2024m  s_mcirc_2529m  s_mcirc_3034m  s_mcirc_3539m  s_mcirc_4044m  s_mcirc_4549m 
s_mcirc_5054m  s_mcirc_5559m  s_mcirc_6064m  s_mcirc_6569m 	s_mcirc_7074m  s_mcirc_7579m  s_mcirc_8084m  s_mcirc_85plm 
s_mcirc_50plm
s_vmmc s_vmmc1519m  s_vmmc2024m  s_vmmc2529m  s_vmmc3034m  s_vmmc3539m  s_vmmc4044m  s_vmmc4549m  s_vmmc50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3034m  s_new_mcirc_3539m  
s_new_mcirc_4044m  s_new_mcirc_4549m  s_new_mcirc_50plm
s_new_mcirc_5054m s_new_mcirc_5559m s_new_mcirc_6064m s_new_mcirc_6569m s_new_mcirc_7074m s_new_mcirc_7579m s_new_mcirc_8084m s_new_mcirc_85plm
s_new_vmmc s_new_vmmc1519m  s_new_vmmc2024m  s_new_vmmc2529m  s_new_vmmc3034m  s_new_vmmc3539m  s_new_vmmc4044m 
s_new_vmmc4549m  s_new_vmmc50plm

s_hivneg_uncirc_1014  s_hivneg_uncirc_1519 s_hivneg_uncirc_2024  s_hivneg_uncirc_2529  s_hivneg_uncirc_3034 
s_hivneg_uncirc_3539 s_hivneg_uncirc_4044  s_hivneg_uncirc_4549 

s_birth_circ  s_mcirc_1014m  s_new_mcirc_1014m  s_vmmc1014m  s_new_vmmc1014m

/* covid */

s_covid

/*supp material*/
s_onart_vlg1     s_onart_vlg2     s_onart_vlg3     s_onart_vlg4     s_onart_vlg5    
s_onart_vlg1_r   s_onart_vlg2_r   s_onart_vlg3_r   s_onart_vlg4_r   s_onart_vlg5_r 
s_onart_who4_year1   s_onart_who4_year1_vlt1000  s_onart_who4_year3   s_onart_who4_year3_vlt1000  s_onart_cd4l200_year1  
s_onart_cd4l200_year1_vlt1000  s_onart_cd4l200_year3   s_onart_cd4l200_year3_vlt1000  s_onart_res_1stline_linefail0   
s_onart_res_1stline  s_onart_linefail0  s_onart_linefail0_cl200  s_onart_linefail0_cl50  s_onart_cl50  s_onart_linefail0_vg1000  
s_onart_vg1000   s_onart_linefail0_vg1000_r   s_onart_vg1000_r   s_onart_cl350

s_newpge1_l4p_1529m	s_newpge1_l4p_1529w

s_m_1524_ge1newpever  s_m_2534_ge1newpever  s_m_3544_ge1newpever  s_m_4554_ge1newpever  s_m_5564_ge1newpever
s_m_1524_ge2newpever  s_m_2534_ge2newpever  s_m_3544_ge2newpever  s_m_4554_ge2newpever  s_m_5564_ge2newpever
s_m_1524_ge5newpever  s_m_2534_ge5newpever  s_m_3544_ge5newpever  s_m_4554_ge5newpever  s_m_5564_ge5newpever
s_w_ge1newpever		  s_w_ge2newpever		s_w_ge5newpever

s_npge1_l4p_1564m  s_npge1_l4p_1524m  s_npge1_l4p_2534m  s_npge1_l4p_3544m  s_npge1_l4p_4554m  s_npge1_l4p_5564m  s_npge1_l4p_1564w  s_npge1_l4p_1524w  s_npge1_l4p_2534w  s_npge1_l4p_3544w  s_npge1_l4p_4554w  s_npge1_l4p_5564w
s_npge2_l4p_1564m  s_npge2_l4p_1524m  s_npge2_l4p_2534m  s_npge2_l4p_3544m  s_npge2_l4p_4554m  s_npge2_l4p_5564m  s_npge2_l4p_1564w  s_npge2_l4p_1524w  s_npge2_l4p_2534w  s_npge2_l4p_3544w  s_npge2_l4p_4554w  s_npge2_l4p_5564w
s_npge10_l4p_1564m  s_npge10_l4p_1524m  s_npge10_l4p_2534m  s_npge10_l4p_3544m  s_npge10_l4p_4554m  s_npge10_l4p_5564m  s_npge10_l4p_1564w  s_npge10_l4p_1524w  s_npge10_l4p_2534w  s_npge10_l4p_3544w  s_npge10_l4p_4554w  s_npge10_l4p_5564w
s_npge50_l4p_1564m  s_npge50_l4p_1524m  s_npge50_l4p_2534m  s_npge50_l4p_3544m  s_npge50_l4p_4554m  s_npge50_l4p_5564m  s_npge50_l4p_1564w  s_npge50_l4p_1524w  s_npge50_l4p_2534w  s_npge50_l4p_3544w  s_npge50_l4p_4554w  s_npge50_l4p_5564w
s_npge1_l4p_1564_hivpos  s_npge2_l4p_1564_hivpos  s_npge1_l4p_1564_hivdiag  s_npge2_l4p_1564_hivdiag  s_npge1_l4p_1564_hivneg  s_npge2_l4p_1564_hivneg

/* other s_ variables to drop before next round */

s_ai_naive_no_pmtct_c_inm_  s_ai_naive_no_pmtct_c_pim_  s_ai_naive_no_pmtct_c_r_      s_ai_naive_no_pmtct_c_rt184m_  s_ai_naive_no_pmtct_c_rt65m_  
s_ai_naive_no_pmtct_c_rttams_ s_ai_naive_no_pmtct_e_inm_   s_ai_naive_no_pmtct_e_nnm_   s_ai_naive_no_pmtct_e_pim_  
s_ai_naive_no_pmtct_e_r_    s_ai_naive_no_pmtct_e_rt184m_   s_ai_naive_no_pmtct_e_rt65m_   s_ai_naive_no_pmtct_e_rttams_ 
s_all_ai_        		s_all_ai_c_inm_     s_all_ai_c_nnm_    s_all_ai_c_pim_    s_all_ai_c_r_  
s_all_ai_c_rt184m_     	s_all_ai_c_rt65m_       s_all_ai_c_rttams_   s_all_ai_e_inm_    s_all_ai_e_nnm_ 
s_all_ai_e_pim_      	s_all_ai_e_r_       s_all_ai_e_rt184m_     s_all_ai_e_rt65m_    s_all_ai_e_rttams_  
s_art_attrit_1yr     	s_art_attrit_1yr_on     s_art_attrit_2yr   s_art_attrit_2yr_on   s_art_attrit_3yr   
s_art_attrit_3yr_on     s_art_attrit_4yr      s_art_attrit_4yr_on  s_art_attrit_5yr   
s_art_attrit_5yr_on     s_art_attrit_6yr      s_art_attrit_6yr_on   s_art_attrit_7yr   s_art_attrit_7yr_on   
s_art_attrit_8yr    	s_art_attrit_8yr_on   s_dead_daly   s_epart    s_hiv1564  s_infection  s_m_newp 
s_naive_m       		s_naive_w      s_npgt1conc_l4p_1519m    s_npgt1conc_l4p_1519w   s_npgt1conc_l4p_1524m 
s_npgt1conc_l4p_1524w    s_npgt1conc_l4p_2449m    s_npgt1conc_l4p_2449w    s_npgt1conc_l4p_5064m    s_npgt1conc_l4p_5064w 
s_prop_ageg1_m_vlg1    s_prop_ageg1_m_vlg2    s_prop_ageg1_m_vlg3   s_prop_ageg1_m_vlg4  s_prop_ageg1_m_vlg5 
s_prop_ageg1_m_vlg6    s_prop_ageg1_w_vlg1    s_prop_ageg1_w_vlg2   s_prop_ageg1_w_vlg3    s_prop_ageg1_w_vlg4 
s_prop_ageg1_w_vlg5  s_prop_ageg1_w_vlg6   s_prop_ageg2_m_vlg1   s_prop_ageg2_m_vlg2    s_prop_ageg2_m_vlg3 
s_prop_ageg2_m_vlg4    s_prop_ageg2_m_vlg5   s_prop_ageg2_m_vlg6  s_prop_ageg2_w_vlg1   s_prop_ageg2_w_vlg2 
s_prop_ageg2_w_vlg3    s_prop_ageg2_w_vlg4     s_prop_ageg2_w_vlg5  s_prop_ageg2_w_vlg6   s_prop_ageg3_m_vlg1 
s_prop_ageg3_m_vlg2    s_prop_ageg3_m_vlg3    s_prop_ageg3_m_vlg4    s_prop_ageg3_m_vlg5     s_prop_ageg3_m_vlg6   
s_prop_ageg3_w_vlg1    s_prop_ageg3_w_vlg2    s_prop_ageg3_w_vlg3     s_prop_ageg3_w_vlg4   s_prop_ageg3_w_vlg5  
s_prop_ageg3_w_vlg6    s_prop_ageg4_m_vlg1   s_prop_ageg4_m_vlg2  s_prop_ageg4_m_vlg3   s_prop_ageg4_m_vlg4   s_prop_ageg4_m_vlg5 
s_prop_ageg4_m_vlg6    s_prop_ageg4_w_vlg1    s_prop_ageg4_w_vlg2   s_prop_ageg4_w_vlg3    s_prop_ageg4_w_vlg4  s_prop_ageg4_w_vlg5  
s_prop_ageg4_w_vlg6     s_prop_ageg5_m_vlg1   s_prop_ageg5_m_vlg2    s_prop_ageg5_m_vlg3   s_prop_ageg5_m_vlg4 
s_prop_ageg5_m_vlg5   s_prop_ageg5_m_vlg6    s_prop_ageg5_w_vlg1   s_prop_ageg5_w_vlg2   s_prop_ageg5_w_vlg3   s_prop_ageg5_w_vlg4
s_prop_ageg5_w_vlg5   s_prop_ageg5_w_vlg6   s_prop_g190m  s_prop_inpm   s_prop_insm   s_prop_k103m   s_prop_k65m 
s_prop_m184m    s_prop_m_vlg1    s_prop_m_vlg2   s_prop_m_vlg3    s_prop_m_vlg4    s_prop_m_vlg5   
s_prop_m_vlg6     s_prop_newp_i_m_1524   s_prop_newp_i_m_2534   s_prop_newp_i_m_3544   s_prop_newp_i_m_4554 s_prop_newp_i_m_5564 
s_prop_newp_i_w_1524   s_prop_newp_i_w_2534    s_prop_newp_i_w_3544   s_prop_newp_i_w_4554   s_prop_newp_i_w_5564 
s_prop_p32m    s_prop_p33m  s_prop_p46m    s_prop_p47m  s_prop_p50lm  s_prop_p50vm   s_prop_p54m  s_prop_p76m 
s_prop_p82m   s_prop_p84m    s_prop_p88m    s_prop_p90m  s_prop_pim  s_prop_q151m   s_prop_tam1   s_prop_tam2  
s_prop_tam3   s_prop_vlg1_rm  s_prop_vlg1_rm0_diag   s_prop_vlg1_rm0_naive    s_prop_vlg1_rm1_diag   s_prop_vlg1_rm1_naive  
s_prop_vlg2_rm   s_prop_vlg2_rm0_diag   s_prop_vlg2_rm0_naive   s_prop_vlg2_rm1_diag   s_prop_vlg2_rm1_naive s_prop_vlg3_rm  
s_prop_vlg3_rm0_diag   s_prop_vlg3_rm0_naive    s_prop_vlg3_rm1_diag   s_prop_vlg3_rm1_naive  s_prop_vlg4_rm 
s_prop_vlg4_rm0_diag    s_prop_vlg4_rm0_naive   s_prop_vlg4_rm1_diag     s_prop_vlg4_rm1_naive  s_prop_vlg5_rm  
s_prop_vlg5_rm0_diag    s_prop_vlg5_rm0_naive    s_prop_vlg5_rm1_diag  s_prop_vlg5_rm1_naive  s_prop_vlg6_rm s_prop_vlg6_rm0_diag 
s_prop_vlg6_rm0_naive  s_prop_vlg6_rm1_diag    s_prop_vlg6_rm1_naive s_prop_w_vlg1   s_prop_w_vlg2 s_prop_w_vlg3   s_prop_w_vlg4  
s_prop_w_vlg5   s_prop_w_vlg6   s_prop_y181m   s_sw  s_w_newp ;


data r&da2; set r&da2; 

if age  >= year_start;


/*

* WHETHER TO KEEP GOING BEYOND 2016;

* ts1m - change this below t0 330;
if &j=110 then do;
prevalence2024w = s_hiv2024w  / s_ageg2024w ;
prevalence2024m = s_hiv2024m  / s_ageg2024m ;
prevalence2529w = s_hiv2529w  / s_ageg2529w ;
incidence1549 = (s_primary1549 * 100 * 4) / (s_alive1549 - s_hiv1549 + s_primary1549);
incidence1549w = (s_primary1549w * 100 * 4) / (s_alive1549_w - s_hiv1549w + s_primary1549w);
incidence1549m = (s_primary1549m * 100 * 4) / (s_alive1549_m - s_hiv1549m + s_primary1549m);
* ts1m - replace above with incidence1549 = (s_primary1549 * 100 * 12) / (s_alive1549 - s_hiv1549 + s_primary1549) etc;
ratio_prev_age2529w_overall = prevalence2529w / prevalence1549 ;  
keep_going_2016=0;
if ratio_prev_age2529w_overall > 0.5 and prev_ratio_1524 > 1.5 and 1/1.15 <= cum_ratio_newp_mw < 1.15 
and incidence1549w / incidence1549m > 1.25 and incidence1549 < 2.5 
then keep_going_2016=1;
end;


* WHETHER TO KEEP GOING BEYOND 2020 ;

if &j=122 then do;
incidence1549 = (s_primary1549 * 100 * 4) / (s_alive1549 - s_hiv1549 + s_primary1549);
* ts1m - replace above with; 
* incidence1549 = (s_primary1549 * 100 * 12) / (s_alive1549 - s_hiv1549 + s_primary1549);
mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ; p_vl1000 = 1- p_vg1000 ;
if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm_ = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
prop_w_giving_birth_this_per = s_pregnant / s_alive1564_w;
prop_w_1549_sw = s_sw_1549 / s_alive1549_w;

* ts1m change below to:  0.012/3 <= prop_w_giving_birth_this_per < 0.055/3;

keep_going_2020=0;
if	0.01 	<=	prevalence1549    
and prev_ratio_1524 > 1.5
and	   	0  	  <	 incidence1549      
and 	0.02  <= mtct_prop < 0.25
and     0.25  <= p_diag 
and     0.68  <= p_diag_onart     
and     0.70  <= p_onart_vl1000 
and     0.35  <= p_vl1000 < 0.82
and  	0.012 <= prop_w_giving_birth_this_per < 0.055
and  0.003 <=  prop_w_1549_sw < 0.03
and     0.00  <  p_ai_no_arv_c_nnm_  
then keep_going_2020=1;



end;

*/


* end of macro update_r1 ;

%mend update_r1;




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 8

* Run the macro 3 month period by 3 month period (one row of udate_r1 statements per 3 months)

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;




%update_r1(da1=1,da2=2,e=1,f=2,g=1,h=8,j=1,s=0);
%update_r1(da1=2,da2=1,e=2,f=3,g=1,h=8,j=2,s=0);
%update_r1(da1=1,da2=2,e=3,f=4,g=1,h=8,j=3,s=0);
%update_r1(da1=2,da2=1,e=4,f=5,g=1,h=8,j=4,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=1,h=8,j=5,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=1,h=8,j=6,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=1,h=8,j=7,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=1,h=8,j=8,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=5,h=12,j=9,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=5,h=12,j=10,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=5,h=12,j=11,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=5,h=12,j=12,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=9,h=16,j=13,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=9,h=16,j=14,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=9,h=16,j=15,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=9,h=16,j=16,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=13,h=20,j=17,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=13,h=20,j=18,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=13,h=20,j=19,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=13,h=20,j=20,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=17,h=24,j=21,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=17,h=24,j=22,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=17,h=24,j=23,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=17,h=24,j=24,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=21,h=28,j=25,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=21,h=28,j=26,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=21,h=28,j=27,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=21,h=28,j=28,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=25,h=32,j=29,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=25,h=32,j=30,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=25,h=32,j=31,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=25,h=32,j=32,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=29,h=36,j=33,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=29,h=36,j=34,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=29,h=36,j=35,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=29,h=36,j=36,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=33,h=40,j=37,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=33,h=40,j=38,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=33,h=40,j=39,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=33,h=40,j=40,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=37,h=44,j=41,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=37,h=44,j=42,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=37,h=44,j=43,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=37,h=44,j=44,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=41,h=48,j=45,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=41,h=48,j=46,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=41,h=48,j=47,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=41,h=48,j=48,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=45,h=52,j=49,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=45,h=52,j=50,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=45,h=52,j=51,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=45,h=52,j=52,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=49,h=56,j=53,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=49,h=56,j=54,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=49,h=56,j=55,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=49,h=56,j=56,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=53,h=60,j=57,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=53,h=60,j=58,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=53,h=60,j=59,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=53,h=60,j=60,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=57,h=64,j=61,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=57,h=64,j=62,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=57,h=64,j=63,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=57,h=64,j=64,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=61,h=68,j=65,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=61,h=68,j=66,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=61,h=68,j=67,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=61,h=68,j=68,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=65,h=72,j=69,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=65,h=72,j=70,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=65,h=72,j=71,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=65,h=72,j=72,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=69,h=76,j=73,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=69,h=76,j=74,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=69,h=76,j=75,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=69,h=76,j=76,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=73,h=80,j=77,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=73,h=80,j=78,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=73,h=80,j=79,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=73,h=80,j=80,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=77,h=84,j=81,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=77,h=84,j=82,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=77,h=84,j=83,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=77,h=84,j=84,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=81,h=88,j=85,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=81,h=88,j=86,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=81,h=88,j=87,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=81,h=88,j=88,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=85,h=92,j=89,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=85,h=92,j=90,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=85,h=92,j=91,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=85,h=92,j=92,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=89,h=96,j=93,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=89,h=96,j=94,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=89,h=96,j=95,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=89,h=96,j=96,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=93,h=100,j=97,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=93,h=100,j=98,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=93,h=100,j=99,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=93,h=100,j=100,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=97,h=104,j=101,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=97,h=104,j=102,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=97,h=104,j=103,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=97,h=104,j=104,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=101,h=108,j=105,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=101,h=108,j=106,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=101,h=108,j=107,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=101,h=108,j=108,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=105,h=112,j=109,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=105,h=112,j=110,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=105,h=112,j=111,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=105,h=112,j=112,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=109,h=116,j=113,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=109,h=116,j=114,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=109,h=116,j=115,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=109,h=116,j=116,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=113,h=120,j=117,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=113,h=120,j=118,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=113,h=120,j=119,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=113,h=120,j=120,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=117,h=124,j=121,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=117,h=124,j=122,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=117,h=124,j=123,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=117,h=124,j=124,s=0);
%update_r1(da1=1,da2=2,e=5,f=6,g=121,h=128,j=125,s=0);
%update_r1(da1=2,da2=1,e=6,f=7,g=121,h=128,j=126,s=0);
%update_r1(da1=1,da2=2,e=7,f=8,g=121,h=128,j=127,s=0);
%update_r1(da1=2,da2=1,e=8,f=9,g=121,h=128,j=128,s=0);


* ts1m:  need more update statements ;




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* SECTION 9

* Write the data set of accumulated outputs from each 3 month period to an external file

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


data a.&tmpfilename&dataset_id(compress=binary); set cum_l1;
/**
* file "C:\Loveleen\Synthesis model\Multiple enhancements\multiple_enhancements_&dataset_id";  

* put   
*/
keep


/*general*/
run   cald   option 

/*number alive and in each age group*/
s_alive1549	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m		s_ageg1014m	
s_ageg1517w		s_ageg1819w		s_ageg1519w  	s_ageg2024w		s_ageg2529w  	s_ageg3034w		s_ageg3539w		s_ageg4044w	
s_ageg4549w		s_ageg5054w 	s_ageg5559w		s_ageg6064w		s_ageg1564w		s_ageg1549w		s_age_1844w
s_ageg1m  s_ageg2m  s_ageg3m  s_ageg4m  s_ageg5m  s_ageg1w  s_ageg2w  s_ageg3w  s_ageg4w  s_ageg5w  

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		s_ageg85plm
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		s_ageg85plw
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m	s_hiv85plm	
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w  s_hiv85plw 
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
s_primary_sw  s_primary_sw1519_  s_primary_sw2024_  s_primary_sw2529_  s_primary_sw3039_
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
s_np  s_newp  s_newp_ge1  s_newp_ge5  s_newp_ge10  s_newp_ge50  s_ep  s_ep_m  s_ep_w  s_npge10  s_npge2  s_npge2_l4p_1549m  s_npge2_l4p_1549w
s_m_1524_ep  	 s_m_2534_ep 	  s_m_3544_ep 	   s_m_4554_ep 		s_m_5564_ep 	 
s_w_1524_ep		 s_w_2534_ep 	  s_w_3544_ep	   s_w_4554_ep 		s_w_5564_ep 
s_m_1524_newp  	 s_m_2534_newp    s_m_3544_newp    s_m_4554_newp  	s_m_5564_newp
s_w_1524_newp  	 s_w_2534_newp    s_w_3544_newp    s_w_4554_newp    s_w_5564_newp
s_m_1524_epnewp  s_m_2534_epnewp  s_m_3544_epnewp  s_m_4554_epnewp  s_m_5564_epnewp 
s_w_1524_epnewp  s_w_2534_epnewp  s_w_3544_epnewp  s_w_4554_epnewp  s_w_5564_epnewp
s_newp_ge1_hiv 

s_ever_ep  s_ever_newp  
s_m1524_ep1524 s_m2534_ep2534 s_m3544_ep3544 s_m4554_ep4554 s_m5564_ep5564 
s_w1524_ep1524 s_w2534_ep2534 s_w3544_ep3544 s_w4554_ep4554 s_w5564_ep5564 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5
s_m1549_newp_ge1  s_w1549_newp_ge1

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 

npgt1conc_l4p_1524m  npgt1conc_l4p_1524w  npgt1conc_l4p_1519m  npgt1conc_l4p_1519w  npgt1conc_l4p_2549m 
npgt1conc_l4p_2549w  npgt1conc_l4p_5064m  npgt1conc_l4p_5064w 

s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

s_newp_this_per_art_or_prep   s_newp_this_per_art   s_newp_this_per_prep  s_newp_this_per_prep_sw 
s_newp_this_per_elig_prep 	s_newp_this_per_elig_prep_sw 
s_newp_this_per  s_newp_sw  s_newp_hivneg   s_newp_this_per_hivneg    s_newp_this_per_hivneg_1549  s_newp_this_per_1549

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
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  
s_ai_naive_no_pmtct_   s_ai_naive_no_pmtct_c_nnm_
s_ai_naive_no_pmtct_c_pim_  s_ai_naive_no_pmtct_c_inm_   s_ai_naive_no_pmtct_c_rt184m_  s_ai_naive_no_pmtct_c_rt65m_  s_ai_naive_no_pmtct_c_rttams_ 
s_o_dol_2nd_vlg1000 s_o_dol_2nd_vlg1000_dolr1_adh0  s_o_dol_2nd_vlg1000_dolr1_adh1  s_o_dol_2nd_vlg1000_dolr0_adh0 s_o_dol_2nd_vlg1000_dolr0_adh1 


s_ontle  s_vlg1000_ontle  s_vlg1000_184m_ontle  s_vlg1000_65m_ontle  s_vlg1000_nnm_ontle s_ontld s_vlg1000_ontld  s_vlg1000_65m_ontld 
s_vlg1000_184m_ontld  s_vlg1000_nnm_ontld s_vlg1000_inm_ontld  s_vlg1000_tams_ontle  s_vlg1000_tams_ontld

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
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w  s_elig_prep_sw   s_elig_prep_onprep

s_elig_prep_w_1549 s_prep_w_1549 

s_elig_prep_w_1524 s_elig_prep_w_2534 s_elig_prep_w_3544 s_prep_w_1524      s_prep_w_2534      s_prep_w_3544 

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

s_prep_newp  s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg4  
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_ever_w_1524  s_prep_ever_w
s_test_gt_period1_on_prep  s_test_gt_period1_on_prep_pos  s_test_period1_on_prep  s_test_period1_on_prep_pos  
s_prepuptake_sw 	 s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep   prep_strategy
										

/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_tested1549_		s_tested1549m       s_tested1549w
s_tested_4p_m1549_ 	s_tested_4p_m1519_ 	s_tested_4p_m2024_ s_tested_4p_m2529_  s_tested_4p_m3039_  s_tested_4p_m4049_  s_tested_4p_m5064_
s_tested_4p_w1549_ 	s_tested_4p_w1519_ 	s_tested_4p_w2024_ s_tested_4p_w2529_  s_tested_4p_w3039_  s_tested_4p_w4049_  s_tested_4p_w5064_ 
s_tested_4p_sw		

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_who3_tested  
s_com_test  s_tested_anc_prevdiag  s_tested_anc 		
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
s_diag_this_period_m_sympt  s_diag_this_period_f_sympt  
s_sympt_diag  s_sympt_diag_ever  s_diag_m  s_diag_w  s_epdiag_m  s_epdiag_w	 s_epi_m  s_epi_w
s_diag_ep

/*VL and CD4*/
s_vlg1  s_vlg2  s_vlg3  s_vlg4  s_vlg5  s_vlg6
s_line1_vlg1000 s_line2_vlg1000  s_res_vfail1
s_u_vfail1_this_period  s_u_vfail1  s_vl_vfail1_g1 s_vl_vfail1_g2 s_vl_vfail1_g3 s_vl_vfail1_g4 s_vl_vfail1_g5 s_vl_vfail1_g6 
s_vlg1000_onart  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_184m  s_vlg1000_onart_65m  s_sw_vg1000
s_vg1000  s_vg1000_m  s_vg1000_w  s_vg1000_w_1524  s_vg1000_m_1524  s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw s_vl1000_art_gt6m_iicu_sw  s_onart_gt6m_iicu_sw

s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
  s_naive    s_onart  s_int_clinic_not_aw
s_art_start  	s_art_start_m   s_art_start_w   s_artexp  s_artexpoff  s_onart_m  s_onart_w
s_onart_m1549_  s_onart_m1564_  s_onart_m1519_  s_onart_m2024_  s_onart_m2529_  s_onart_m3034_  s_onart_m3539_  
s_onart_m4044_  s_onart_m4549_  s_onart_m5054_  s_onart_m5559_  s_onart_m6064_	
s_onart_m6569_	s_onart_m7074_	s_onart_m7579_	s_onart_m8084_	s_onart_m85pl_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	
s_onart_w6569_	s_onart_w7074_	s_onart_w7579_	s_onart_w8084_	s_onart_w85pl_	
s_onart_sw
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
s_onart_cl200  s_onart_cd4_g500  s_onart_res 

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  

s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e 

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

s_drug_level_test   s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

s_o_zdv_tox s_o_3tc_tox s_o_ten_tox s_o_taz_tox s_o_lpr_tox s_o_efa_tox s_o_nev_tox s_o_dol_tox 
s_o_zdv_adh_hi s_o_3tc_adh_hi s_o_ten_adh_hi s_o_taz_adh_hi s_o_lpr_adh_hi s_o_efa_adh_hi s_o_nev_adh_hi s_o_dol_adh_hi 

s_o_tle_tox s_o_tld_tox s_o_zld_tox s_o_zla_tox s_o_tle_adh_hi  s_o_tld_adh_hi  s_o_zld_adh_hi  s_o_zla_adh_hi 

s_a_zld_if_reg_op_116  s_adh_hi_a_zld_if_reg_op_116  s_nac_ge2p75_a_zld_if_reg_op_116  s_nac_ge2p00_a_zld_if_reg_op_116  s_nac_ge1p50_a_zld_if_reg_op_116

s_start_zld_if_reg_op_116   s_onart_start_zld_if_reg_op_116   s_e_rt65m_st_zld_if_reg_op_116  s_n_zld_if_reg_op_116   s_x_n_zld_if_reg_op_116 

s_per1_art_int s_per2_art_int	s_dead_per1_art_int	s_dead_per2_art_int  s_cd4_before_int	s_cd4_before_int_lt100   	s_cd4_before_int_100200 
s_cd4_per1_art_int 	s_cd4_per1_art_int_lt100	s_cd4_per1_art_int_100200 s_cd4_per2_art_int 	s_cd4_per2_art_int_lt100	s_cd4_per2_art_int_100200

s_started_art_as_tld_prep_vl1000    s_onart_as_tld_prep   s_onart_as_tld_prep_vl1000     s_started_art_as_tld_prep 

/*costs and dalys*/
s_cost       s_onart_cost		s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ   s_cost_condom_dn  s_cost_sw_program  s_t_adh_int_cost      s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  			 
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
  	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_donart_cost 		s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dwho3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ  s_dcost_condom_dn  s_dcost_sw_program   s_d_t_adh_int_cost   s_dtest_cost_f  s_dtest_cost_m
s_dcost_prep   s_dcost_prep_visit  			   s_dcost_prep_ac_adh 			  
s_dcost_test_m_sympt  	       s_dcost_test_f_sympt  		   s_dcost_test_m_circ  	  	 	s_dcost_test_f_anc s_dcost_test_f_sw
s_dcost_test_f_non_anc 	       s_dpi_cost     s_dcost_switch_line  		  s_dcost_child_hiv s_dcost_child_hiv_mo_art  		   s_dcost_art_init
	   s_dart_1_cost  s_dart_2_cost     s_dart_3_cost	   s_dcost_vl_not_done 	
s_dcost_non_aids_pre_death   s_ddaly_non_aids_pre_death  s_dead_ddaly_oth_dol_adv_birth_e   s_dcost_drug_level_test
s_dead_ddaly_ntd  s_ddaly_mtct    s_dead_ddaly  s_live_daly_80  s_live_ddaly_80  s_dead_daly_80  s_dead_ddaly_80

s_cost_80  s_art_cost_80  s_adc_cost_80  s_cd4_cost_80  s_vl_cost_80  s_vis_cost_80  s_full_vis_cost_80  s_who3_cost_80  s_cot_cost_80 
s_tb_cost_80  s_cost_test_80  s_res_cost_80  s_cost_circ_80  s_cost_condom_dn_80  s_cost_sw_program_80  s_t_adh_int_cost_80  s_cost_test_m_80  
s_cost_test_f_80  s_cost_prep_80  s_cost_prep_visit_80  s_cost_prep_ac_adh_80    s_cost_test_m_sympt_80    
s_cost_test_f_sympt_80    s_cost_test_m_circ_80   s_cost_test_f_anc_80  s_cost_test_f_sw_80
s_cost_test_f_non_anc_80   s_pi_cost_80  	  s_cost_switch_line_80    s_cost_child_hiv_80  s_cost_child_hiv_mo_art_80    s_cost_art_init_80
s_art_1_cost_80  s_art_2_cost_80  s_art_3_cost_80  	  s_cost_vl_not_done_80 s_cost_zdv_80  s_cost_ten_80 	  s_cost_3tc_80 	  s_cost_nev_80  	  
s_cost_lpr_80  	  s_cost_dar_80 	  s_cost_taz_80  	  	  s_cost_efa_80  	  s_cost_dol_80  
s_cost__80   s_dcost__80  	  s_dart_cost_80  s_dadc_cost_80  s_dcd4_cost_80  s_dvl_cost_80	  s_dvis_cost_80  	s_dfull_vis_cost_80  s_dwho3_cost_80 
s_dcot_cost_80 s_dtb_cost_80  s_dtest_cost_80  s_dres_cost_80  s_dcost_circ_80  s_dcost_condom_dn_80  s_dcost_sw_program_80  s_d_t_adh_int_cost_80  
s_dtest_cost_f_80  s_dtest_cost_m_80  s_dcost_prep_80  s_dcost_prep_visit_80  	 s_dcost_prep_ac_adh_80 	
s_dcost_test_m_sympt_80  	  s_dcost_test_f_sympt_80  		  s_dcost_test_m_circ_80  	s_dcost_test_f_anc_80 s_dcost_test_f_sw_80
s_dcost_test_f_non_anc_80 	  s_dpi_cost_80  s_dcost_switch_line_80   s_dcost_child_hiv_80  s_dcost_child_hiv_mo_art_80  s_dcost_art_init_80 
s_dart_1_cost_80  s_dart_2_cost_80  s_dart_3_cost_80	  s_dcost_vl_not_done_80 s_dcost_non_aids_pre_death_80  s_dcost_drug_level_test_80


/*visits*/
s_visit  s_lost  s_linked_to_care  s_linked_to_care_this_period
s_pre_art_care  
s_visit_prep_no  s_visit_prep_d  s_visit_prep_dt  s_visit_prep_dtc
s_sv  s_sv_secondline   

/*deaths*/
s_dead1564_all	   s_dead1564m_all    s_dead1564w_all
s_dead1519m_all  s_dead2024m_all  s_dead2529m_all  s_dead3034m_all  s_dead3539m_all s_dead4044m_all  s_dead4549m_all
s_dead1519w_all  s_dead2024w_all  s_dead2529w_all  s_dead3034w_all  s_dead3539w_all s_dead4044w_all  s_dead4549w_all
s_death_hivrel  s_dead_rdcause2  s_dead_onart_rdcause2  s_death_dcause3
s_dead1564_  s_death_hiv  s_death_hiv_m s_death_hiv_w  s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_1p 
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
s_ev_art_g1k_not2l_adead  s_dead_allage  s_death_dcause3_allage  s_death_hivrel_allage

/*sex workers*/
s_base_rate_sw  s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw1849_  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp   s_sw1524_newp s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  
s_diag_sw s_onart_sw s_vs_sw 

s_age_deb_sw1519_  s_age_deb_sw2024_  s_age_deb_sw2529_  s_age_deb_sw3039_  s_age_deb_swov40_ 
s_age_deb_sw_nm1519_  s_age_deb_sw_nm2024_  s_age_deb_sw_nm2529_  s_age_deb_sw_nm3039_  s_age_deb_sw_nmov40_ 

s_age_stop_sw1519_  s_age_stop_sw2024_  s_age_stop_sw2529_  s_age_stop_sw3039_  s_age_stop_swov40_ 

s_actdur_sw_0to3  s_actdur_sw_3to5  s_actdur_sw_6to9  s_actdur_sw_10to19  
s_totdur_sw_0to3  s_totdur_sw_3to5  s_totdur_sw_6to9  s_totdur_sw_10to19 
s_totdur_eversw_0to3  s_totdur_eversw_3to5  s_totdur_eversw_6to9  s_totdur_eversw_10to19 

s_sw_program_visit

s_diag_sw_noprog  s_diag_sw_inprog  s_onart_sw_noprog  s_onart_sw_inprog  
s_vl1000_art_gt6m_iicu_sw_noprog  s_vl1000_art_gt6m_iicu_sw_inprog 

s_sw1519_tp1  s_sw2024_tp1  s_sw2529_tp1  s_sw3039_tp1  s_swov40_tp1

/*ADC etc*/
s_adc  s_who3_event  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 

/*Pregnancy and children*/
s_pregnant 	s_anc  s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant 
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524_  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_ceb_w1524 	s_ceb_w2534		s_ceb_w3544 	s_ceb_w4549 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child  

/*circumcision*/
s_mcirc  s_mcirc_1519m  s_mcirc_2024m  s_mcirc_2529m  s_mcirc_3034m  s_mcirc_3539m  s_mcirc_4044m  s_mcirc_4549m 
s_mcirc_5054m  s_mcirc_5559m  s_mcirc_6064m  s_mcirc_6569m 	s_mcirc_7074m  s_mcirc_7579m  s_mcirc_8084m  s_mcirc_85plm 
s_mcirc_50plm
s_vmmc s_vmmc1519m  s_vmmc2024m  s_vmmc2529m  s_vmmc3034m  s_vmmc3539m  s_vmmc4044m  s_vmmc4549m  s_vmmc50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3034m  s_new_mcirc_3539m  
s_new_mcirc_4044m  s_new_mcirc_4549m  s_new_mcirc_50plm
s_new_mcirc_5054m s_new_mcirc_5559m s_new_mcirc_6064m s_new_mcirc_6569m s_new_mcirc_7074m s_new_mcirc_7579m s_new_mcirc_8084m s_new_mcirc_85plm
s_new_vmmc s_new_vmmc1519m  s_new_vmmc2024m  s_new_vmmc2529m  s_new_vmmc3034m  s_new_vmmc3539m  s_new_vmmc4044m 
s_new_vmmc4549m  s_new_vmmc50plm

s_birth_circ  s_mcirc_1014m  s_new_mcirc_1014m  s_vmmc1014m  s_new_vmmc1014m

/*parameters sampled*/
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  sex_age_mixing_matrix_m sex_age_mixing_matrix_w   p_rred_p  p_hsb_p  newp_factor  fold_tr_newp
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate  circ_inc_15_19  circ_red_20_30  circ_red_30_50
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat   base_rate_sw 
prob_prep_restart_choice 	prepuptake_sw 		prepuptake_pop   cd4_monitoring   base_rate_stop_sexwork    rred_a_p  higher_newp_with_lower_adhav
rr_int_tox   rate_birth_with_infected_child  nnrti_res_no_effect  double_rate_gas_tox_taz   incr_mort_risk_dol_weightg 
greater_disability_tox 	  greater_tox_zdv 	higher_rate_res_dol  rel_dol_tox  dol_higher_potency  prop_bmi_ge23
ntd_risk_dol  oth_dol_adv_birth_e_risk  zdv_potency_p75
sw_program  eff_sw_program  sw_program_effect sw_higher_int  prob_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
sw_init_newp sw_trans_matrix  rate_sw_rred_rc  effect_weak_sw_prog_newp  effect_strong_sw_prog_newp  sw_art_disadv
zero_3tc_activity_m184  zero_tdf_activity_k65r lower_future_art_cov  higher_future_prep_cov

/*2020 interventions*/
condom_incr_2020    			  incr_test_2020             decr_hard_reach_2020  incr_adh_2020 
decr_prob_loss_at_diag_2020 	  decr_rate_lost_2020 		    decr_rate_lost_art_2020    incr_rate_return_2020     
incr_rate_restart_2020          incr_rate_init_2020          decr_rate_int_choice_2020  incr_prob_vl_meas_done_2020 
incr_pr_switch_line_2020    	 prep_improvements       	 incr_adh_pattern_prep_2020 
inc_r_test_startprep_2020   incr_r_test_restartprep_2020 decr_r_choose_stop_prep_2020 
inc_p_prep_restart_choi_2020  incr_prepuptake_sw_2020      incr_prepuptake_pop_2020   prep_strategy_2020 
	  circ_inc_rate_2020 		     incr_test_targeting_2020   
incr_max_freq_testing_2020      initial_pr_switch_line       initial_prob_vl_meas_done  sw_test_6mthly_2020   reg_option_switch_2020 
art_mon_drug_levels_2020   ten_is_taf_2020  	pop_wide_tld_2020 single_vl_switch_efa_2020

eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice  e_decr_hard_reach_2020  eff_test_targeting

vmmc_disrup_covid condom_disrup_covid prep_disrup_covid swprog_disrup_covid testing_disrup_covid art_tld_disrup_covid art_tld_eod_disrup_covid
art_init_disrup_covid vl_adh_switch_disrup_covid cotrim_disrup_covid no_art_disrup_covid inc_death_rate_aids_disrup_covid art_low_adh_disrup_covid
cov_death_risk_mult

/*supp material*/
s_onart_vlg1     s_onart_vlg2     s_onart_vlg3     s_onart_vlg4     s_onart_vlg5    
s_onart_vlg1_r   s_onart_vlg2_r   s_onart_vlg3_r   s_onart_vlg4_r   s_onart_vlg5_r 
s_onart_who4_year1   s_onart_who4_year1_vlt1000  s_onart_who4_year3   s_onart_who4_year3_vlt1000  s_onart_cd4l200_year1  
s_onart_cd4l200_year1_vlt1000  s_onart_cd4l200_year3   s_onart_cd4l200_year3_vlt1000  s_onart_res_1stline_linefail0   
s_onart_res_1stline  s_onart_linefail0  s_onart_linefail0_cl200  s_onart_linefail0_cl50  s_onart_cl50  s_onart_linefail0_vg1000  
s_onart_vg1000   s_onart_linefail0_vg1000_r   s_onart_vg1000_r   s_onart_cl350

s_newpge1_l4p_1529m	s_newpge1_l4p_1529w

s_m_1524_ge1newpever  s_m_2534_ge1newpever  s_m_3544_ge1newpever  s_m_4554_ge1newpever  s_m_5564_ge1newpever
s_m_1524_ge2newpever  s_m_2534_ge2newpever  s_m_3544_ge2newpever  s_m_4554_ge2newpever  s_m_5564_ge2newpever
s_m_1524_ge5newpever  s_m_2534_ge5newpever  s_m_3544_ge5newpever  s_m_4554_ge5newpever  s_m_5564_ge5newpever
s_w_ge1newpever		  s_w_ge2newpever		s_w_ge5newpever

s_npge1_l4p_1564m  s_npge1_l4p_1524m  s_npge1_l4p_2534m  s_npge1_l4p_3544m  s_npge1_l4p_4554m  s_npge1_l4p_5564m  s_npge1_l4p_1564w  s_npge1_l4p_1524w  s_npge1_l4p_2534w  s_npge1_l4p_3544w  s_npge1_l4p_4554w  s_npge1_l4p_5564w
s_npge2_l4p_1564m  s_npge2_l4p_1524m  s_npge2_l4p_2534m  s_npge2_l4p_3544m  s_npge2_l4p_4554m  s_npge2_l4p_5564m  s_npge2_l4p_1564w  s_npge2_l4p_1524w  s_npge2_l4p_2534w  s_npge2_l4p_3544w  s_npge2_l4p_4554w  s_npge2_l4p_5564w
s_npge10_l4p_1564m  s_npge10_l4p_1524m  s_npge10_l4p_2534m  s_npge10_l4p_3544m  s_npge10_l4p_4554m  s_npge10_l4p_5564m  s_npge10_l4p_1564w  s_npge10_l4p_1524w  s_npge10_l4p_2534w  s_npge10_l4p_3544w  s_npge10_l4p_4554w  s_npge10_l4p_5564w
s_npge50_l4p_1564m  s_npge50_l4p_1524m  s_npge50_l4p_2534m  s_npge50_l4p_3544m  s_npge50_l4p_4554m  s_npge50_l4p_5564m  s_npge50_l4p_1564w  s_npge50_l4p_1524w  s_npge50_l4p_2534w  s_npge50_l4p_3544w  s_npge50_l4p_4554w  s_npge50_l4p_5564w
s_npge1_l4p_1564_hivpos  s_npge2_l4p_1564_hivpos  s_npge1_l4p_1564_hivdiag  s_npge2_l4p_1564_hivdiag  s_npge1_l4p_1564_hivneg  s_npge2_l4p_1564_hivneg

/* covid */

s_covid

/* used in abort statements */

prevalence1549  prev_ratio_1524 incidence1549w  incidence1549m  cum_ratio_newp_mw

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

s_prop_m_vlg1  s_prop_m_vlg2  s_prop_m_vlg3  s_prop_m_vlg4  s_prop_m_vlg5 s_prop_m_vlg6 
s_prop_w_vlg1  s_prop_w_vlg2  s_prop_w_vlg3  s_prop_w_vlg4  s_prop_w_vlg5 s_prop_w_vlg6

p_onart_vls  p_onart_epvls  d_vls
p_diag  p_diag_onart  p_diag_eponart  p_diag_m  p_diag_w  p_epdiag_m  p_epdiag_w  d_diag_m  d_diag_w
d_onart

d_hiv_epi_wm  d_hiv_epi_mw  r_hiv_epi_both  r_ep_mw 

r_s_ep_m15w15 r_s_ep_m25w25 r_s_ep_m35w35 r_s_ep_m45w45 r_s_ep_m55w55 

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r  s_m_newp   s_w_newp
ptnewp15_m  ptnewp25_m  ptnewp35_m  ptnewp45_m  ptnewp55_m
ptnewp15_w  ptnewp25_w  ptnewp35_w  ptnewp45_w  ptnewp55_w


; 

* note need to keep one s_n ! ;

run;






