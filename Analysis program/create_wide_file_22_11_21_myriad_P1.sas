
*libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\VMMC\vmmc20reps_out_vmmc20reps";
libname a "/home/rmjllob/Scratch";

data d1;  
set a.vmmc_final;
run;


data a; set d1  ;

**option_new=1 = continuation for 5 years;
**option_new=2 = no further vmmc;
if option=4 then option_new=1;
if option=2 then option_new=2;
run;

proc sort; by run cald option_new;run;

* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a ;
 
if cald=2021.5;
s_alive = s_alive_m + s_alive_w ;
sf_2021 = 10000000 / s_alive;
keep run sf_2021;
proc sort; by run;run;

*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2021;


data y; 
merge a sf;
by run ;

* preparatory code ;

* ================================================================================= ;

if s_pregnant_oth_dol_adv_birth_e = . then s_pregnant_oth_dol_adv_birth_e = 0;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

* ================================================================================= ;


* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* note discounting is from 2021 - no adjustment needed;
* ts1m - this code needs to change for ts1m;

%let year_start_disc=2021;
discount_3py = 1/(1.03**(cald-&year_start_disc));
discount_5py = 1/(1.05**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;

* ================================================================================= ;



* dalys and life years;

* ================================================================================= ;

ly = s_ly * &sf;
dly = s_dly * &sf;

s_ddaly = (s_dead_ddaly_80* &discount) + s_live_ddaly_80;
s_ddaly_Op=s_dyll_80 + s_live_ddaly_80;

dead_ddaly_ntd = s_dead_ddaly_ntd * &sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;


ddaly = s_ddaly * &sf * 4;
ddaly_Op = s_ddaly_Op * &sf * 4;


* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 


dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * &sf * 4; * odabe ;

ddaly_mtct = s_ddaly_mtct * &sf * 4;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * &sf * 4; * napd;

ddaly_ac_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ac_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;


ddaly_adults = ddaly;
ddaly_adults_Op = ddaly_Op;




* ================================================================================= ;

/*
proc print; var cald  run option ddaly_ntd_mtct_odab_napd  ddaly  dead_ddaly_ntd  ddaly_mtct  dead_ddaly_odabe   
ddaly_non_aids_pre_death;
where cald = 2021;
run;
*/



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

***check costs all have _80;

***Redefine VMMC costs to $90 (+/-30 in sens analyses) to match those being used for Zimbabwe and Malawi;;

s_cost_circ_new= (s_cost_circ_80*(90/90));*For sensitivity analyses change to 60/90 and 120/90;
s_dcost_circ_new=&discount*s_cost_circ_new;*use this to calculate dcost_circ below;

* ts1m - 12 instead of 4; 

dzdv_cost = s_cost_zdv_80 * &discount * &sf * 4 / 1000;
dten_cost = s_cost_ten_80 * &discount * &sf * 4 / 1000;
d3tc_cost = s_cost_3tc_80 * &discount * &sf * 4 / 1000; 
dnev_cost = s_cost_nev_80 * &discount * &sf * 4 / 1000;
dlpr_cost = s_cost_lpr_80 * &discount * &sf * 4 / 1000;
ddar_cost = s_cost_dar_80 * &discount * &sf * 4 / 1000;
dtaz_cost = s_cost_taz_80 * &discount * &sf * 4 / 1000;
defa_cost = s_cost_efa_80 * &discount * &sf * 4 / 1000;
ddol_cost = s_cost_dol_80 * &discount * &sf * 4 / 1000;


if s_dart_cost_80=. then s_dart_cost_80=0;
*if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep_80=. then s_dcost_prep_80=0;
if s_dcost_prep_visit_80=. then s_dcost_prep_visit_80=0;
if s_dcost_prep_ac_adh_80=. then s_dcost_prep_ac_adh_80=0;
if s_dcost_circ_80=. then s_dcost_circ_80=0;
if s_dcost_condom_dn_80=. then s_dcost_condom_dn_80=0;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost_80 * &sf * 4 / 1000;
dart_1_cost = s_dart_1_cost_80 * &sf * 4 / 1000;
dart_2_cost = s_dart_2_cost_80 * &sf * 4 / 1000;
dart_3_cost = s_dart_3_cost_80 * &sf * 4 / 1000;
dart_cost = s_dart_cost_80 * &sf * 4 / 1000;
dvl_cost = s_dvl_cost_80 * &sf * 4 / 1000;
dcd4_cost = s_dcd4_cost_80 * &sf * 4 / 1000;
dadc_cost = s_dadc_cost_80 * &sf * 4 / 1000;
dtb_cost = s_dtb_cost_80 * &sf * 4 / 1000;
dtest_cost = s_dtest_cost_80 * &sf * 4 / 1000;
*dwho3_cost = s_dwho3_cost * &sf * 4 / 1000;
dnon_tb_who3_cost = s_dnon_tb_who3_cost_80 * &sf * 4 / 1000;
dcot_cost = s_dcot_cost_80 * &sf * 4 / 1000;
dres_cost = s_dres_cost_80 * &sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost_80 * &sf * 4 / 1000;  
*dcost_cascade_interventions = s_dcost_cascade_interventions * &sf * 4 / 1000;  
dcost_prep = s_dcost_prep_80 * &sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit_80 * &sf * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh_80 * &sf * 4 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death_80 * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost_80 * &sf * 4 / 1000;
dcost_circ = s_dcost_circ_new * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn_80 * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line_80 * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test_80 * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv_80 * &sf * 4 / 1000; * s_cost_child_hiv is discounted cost;
 

dclin_cost = dadc_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost;

* sens analysis;

* dtaz_cost = dtaz_cost * (100 / 180);
* dtaz_cost = dtaz_cost * (50 / 180);
* dzdv_cost = dzdv_cost * (25 / 45);


dart_cost_x = dart_1_cost + dart_2_cost + dart_3_cost; 
dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

* dcost = dart_cost_y + dclin_cost + dcd4_cost + dvl_cost + dvis_cost + dtest_cost + d_t_adh_int_cost + dswitchline_cost
		+dcost_circ + dcost_condom_dn  + dcost_child_hiv  + dcost_non_aids_pre_death ;


dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test + /*dcost_cascade_interventions +*/ dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death ;

s_cost_art_x = s_cost_zdv_80 + s_cost_ten_80 + s_cost_3tc_80 + s_cost_nev_80 + s_cost_lpr_80 + s_cost_dar_80 + s_cost_taz_80
+ s_cost_efa_80 + s_cost_dol_80 ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 

if &discount gt 0 then cost_clin_care = dcost_clin_care / &discount;

if &discount gt 0 then cost = dcost / &discount;

* ================================================================================= ;


* derived var cald iables relating to population, not only those with hiv ;

if s_ai_naive_no_pmtct_c_nnm_ = . then s_ai_naive_no_pmtct_c_nnm_ = 0; 
if s_ai_naive_no_pmtct_c_pim_ = . then s_ai_naive_no_pmtct_c_pim_ = 0;
if s_ai_naive_no_pmtct_c_inm_ = . then s_ai_naive_no_pmtct_c_inm_ = 0;
if s_ai_naive_no_pmtct_c_rt184m_ = . then s_ai_naive_no_pmtct_c_rt184m_ = 0;
if s_ai_naive_no_pmtct_c_rt65m_ = . then s_ai_naive_no_pmtct_c_rt65m_ = 0;
if s_ai_naive_no_pmtct_c_rttams_ = . then s_ai_naive_no_pmtct_c_rttams_ = 0;

s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
s_mcirc_3039m = s_mcirc_3034m + s_mcirc_3539m;
s_mcirc_4049m = s_mcirc_4044m + s_mcirc_4549m;

s_vmmc1549m = s_vmmc1519m + s_vmmc2024m + s_vmmc2529m + s_vmmc3034m + s_vmmc3539m + s_vmmc4044m + s_vmmc4549m ;
s_vmmc3039m = s_vmmc3034m + s_vmmc3539m;
s_vmmc4049m = s_vmmc4044m + s_vmmc4549m;

s_hiv1524m = s_hiv1519m + s_hiv2024m ;
s_hiv1524w = s_hiv1519w + s_hiv2024w ;




* s_mcirc_1549m;				s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
* s_mcirc_3039m;				s_mcirc_3039m = s_mcirc_3034m + s_mcirc_3539m;
* s_mcirc_4049m;				s_mcirc_4049m = s_mcirc_4044m + s_mcirc_4549m;

* s_vmmc1549m;					s_vmmc1549m = s_vmmc1519m + s_vmmc2024m + s_vmmc2529m + s_vmmc3034m + s_vmmc3539m + s_vmmc4044m + s_vmmc4549m ;
* s_vmmc3039m;					s_vmmc3039m = s_vmmc3034m + s_vmmc3539m;
* s_vmmc4049m;					s_vmmc4049m = s_vmmc4044m + s_vmmc4549m;

* s_new_vmmc1549m;				s_new_vmmc1549m = s_new_vmmc1519m + s_new_vmmc2024m + s_new_vmmc2529m + s_new_vmmc3034m + s_new_vmmc3539m + s_new_vmmc4044m + s_new_vmmc4549m ;
* s_new_vmmc3039m;				s_new_vmmc3039m = s_new_vmmc3034m + s_new_vmmc3539m;
* s_new_vmmc4049m;				s_new_vmmc4049m = s_new_vmmc4044m + s_new_vmmc4549m;

* s_hiv1524m;					s_hiv1524m = s_hiv1519m + s_hiv2024m ;
* s_hiv1524w;					s_hiv1524w = s_hiv1519w + s_hiv2024w ;

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp;
								if gender_r_newp gt 0 then log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;
* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_m1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;

* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf_2021;
* p_newp_sw;					p_newp_sw = s_sw_newp / s_w_newp ;

* n_tested_m;					n_tested_m = s_tested_m * sf_2021 * 4;
* n_tested;						n_tested = s_tested * sf_2021 * 4;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

* p_mcirc;						p_mcirc = s_mcirc / s_alive1564_m ;
* p_mcirc_inc1014m;				p_mcirc_inc1014m = (s_mcirc + s_mcirc_1014m)/ (s_alive1564_m + s_ageg1014m);
* p_mcirc_1014m;				if s_ageg1014m gt 0 then p_mcirc_1014m = s_mcirc_1014m / s_ageg1014m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3034m;				p_mcirc_3034m = s_mcirc_3034m / s_ageg3034m ;
* p_mcirc_3039m;				p_mcirc_3539m = s_mcirc_3539m / s_ageg3539m ;
* p_mcirc_3039m;				p_mcirc_3039m = s_mcirc_3039m / (s_ageg3034m + s_ageg3539m) ;
* p_mcirc_4044m;				p_mcirc_4044m = s_mcirc_4044m / s_ageg4044m ;
* p_mcirc_4549m;				p_mcirc_4549m = s_mcirc_4549m / s_ageg4549m ;
* p_mcirc_4049m;				p_mcirc_4049m = s_mcirc_4049m / (s_ageg4044m + s_ageg4549m) ;
* p_mcirc_50plm;				p_mcirc_50plm = s_mcirc_50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;

*new vmmc uptake rate per year (denom=hiv -ve males);
* p_new_vmmc_u;					p_new_vmmc_u = (s_new_vmmc / (s_alive1564_m -s_hiv1564m))*4;
* p_new_vmmc_u_1049m;			p_new_vmmc_u_1049m = ((s_new_vmmc1549m + s_new_vmmc1014m) / ((s_ageg1549m - s_hiv1549m) + (s_ageg1014m)))*4;
* p_new_vmmc_1014m_u;			if (s_ageg1014m) gt 0 then p_new_vmmc_1014m_u = (s_new_vmmc1014m / (s_ageg1014m))*4 ;
* p_new_vmmc_1519m_u;			p_new_vmmc_1519m_u = (s_new_vmmc1519m / (s_ageg1519m - s_hiv1519m))*4;
* p_new_vmmc_2024m_u;			p_new_vmmc_2024m_u = (s_new_vmmc2024m / (s_ageg2024m - s_hiv2024m))*4;
* p_new_vmmc_2529m_u;			p_new_vmmc_2529m_u = (s_new_vmmc2529m / (s_ageg2529m - s_hiv2529m))*4;
* p_new_vmmc_3034m_u;			if s_ageg3034m gt 0 then p_new_vmmc_3034m_u = (s_new_vmmc3034m / (s_ageg3034m - s_hiv3034m))*4;
* p_new_vmmc_3539m_u;			if s_ageg3539m gt 0 then p_new_vmmc_3539m_u = (s_new_vmmc3539m / (s_ageg3539m - s_hiv3539m))*4;
* p_new_vmmc_3039m_u;			if (s_ageg3034m + s_ageg3539m) gt 0 then 
								p_new_vmmc_3039m_u = (s_new_vmmc3039m / ((s_ageg3034m + s_ageg3539m) - (s_hiv3034m + s_hiv3539m)))*4;
* p_new_vmmc_4044m_u;			if s_ageg4044m gt 0 then p_new_vmmc_4044m_u = (s_new_vmmc4044m / (s_ageg4044m - s_hiv4044m))*4 ;
* p_new_vmmc_4549m_u;			if (s_ageg4549m-s_hiv4549m) gt 0 then p_new_vmmc_4549m_u = (s_new_vmmc4549m / (s_ageg4549m - s_hiv4549m))*4 ;
* p_new_vmmc_4049m_u;			if (s_ageg4044m + s_ageg4549m) gt 0 then  
								p_new_vmmc_4049m_u = (s_new_vmmc4049m / ((s_ageg4044m + s_ageg4549m) - (s_hiv4044m + s_hiv4549m)))*4 ;
* p_new_vmmc_50plm_u;			p_new_vmmc_50plm_u = (s_new_vmmc50plm / ((s_ageg5054m + s_ageg5559m + s_ageg6064m) - (s_hiv5054m + s_hiv5559m + s_hiv6064m)))*4 ;
* p_new_vmmc_1549m_u;			p_new_vmmc_1549m_u = (s_new_vmmc1549m / (s_ageg1549m - s_hiv1549m ))*4;

*% vmmc ;
* p_vmmc;						p_vmmc = s_vmmc /s_alive1564_m ;
* p_vmmc_inc1014m;				p_vmmc_inc1014m = (s_vmmc + s_vmmc1014m) / (s_alive1564_m + s_ageg1014m);
* p_vmmc_1014m;					if s_ageg1014m gt 0 then p_vmmc_1014m = s_vmmc1014m / s_ageg1014m ;
* p_vmmc_1519m;					p_vmmc_1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc_2024m;					p_vmmc_2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc_2529m;					p_vmmc_2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc_3039m;					p_vmmc_3039m = s_vmmc3039m / (s_ageg3034m + s_ageg3539m) ;
* p_vmmc_4049m;					p_vmmc_4049m = s_vmmc4049m / (s_ageg4044m + s_ageg4549m) ;
* p_vmmc_50plm;					p_vmmc_50plm = s_vmmc50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_vmmc_1549m;					p_vmmc_1549m = s_vmmc1549m / s_ageg1549m ;


* prop_w_1549_sw;				prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  

* prep;

* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;
* prop_elig_on_prep;			if s_elig_prep then prop_elig_on_prep = s_prep / s_elig_prep ; 
* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;
* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;


* p_elig_prep;   				p_elig_prep = s_elig_prep / (s_alive1564 - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* n_prep;						n_prep = s_prep * sf_2021;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * sf_2021;
* p_hiv1_prep;					if s_prep gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep ;

* n_prep_ever;					n_prep_ever = s_prep_ever * sf_2021;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;

* av_prep_eff_non_res_v;  		if s_prep > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * sf_2021;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * sf_2021;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * sf_2021;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * sf_2021;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf_2021;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf_2021;

* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_prep_adhg80 ;				if s_prep gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep ;

* av_prep_eff_non_res_v;        if s_prep > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* ts1m - below change 4 to 12;
* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1564;				incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);

* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);


* incidence1524w;				incidence1524w = ((s_primary1519w + s_primary2024w) * 4 * 100) / 
									(s_ageg1519w + s_ageg2024w - s_hiv1519w - s_hiv2024w + s_primary1519w + s_primary2024w);
* incidence1524m;				incidence1524m = ((s_primary1519m + s_primary2024m) * 4 * 100) / 
									(s_ageg1519m + s_ageg2024m - s_hiv1519m - s_hiv2024m + s_primary1519m + s_primary2024m);

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* prevalence1519w;				prevalence1519w = s_hiv1519w  / s_ageg1519w ;
* prevalence1519m;				prevalence1519m = s_hiv1519m  / s_ageg1519m ;
* prevalence2024w;				prevalence2024w = s_hiv2024w  / s_ageg2024w ;
* prevalence2024m;				prevalence2024m = s_hiv2024m  / s_ageg2024m ;
* prevalence2529w;				prevalence2529w = s_hiv2529w  / s_ageg2529w ;
* prevalence2529m;				prevalence2529m = s_hiv2529m  / s_ageg2529m ;
* prevalence3034w;				prevalence3034w = s_hiv3034w  / s_ageg3034w ;
* prevalence3034m;				prevalence3034m = s_hiv3034m  / s_ageg3034m ;
* prevalence3539w;				prevalence3539w = s_hiv3539w  / s_ageg3539w ;
* prevalence3539m;				prevalence3539m = s_hiv3539m  / s_ageg3539m ;
* prevalence4044w;				prevalence4044w = s_hiv4044w  / s_ageg4044w ;
* prevalence4044m;				prevalence4044m = s_hiv4044m  / s_ageg4044m ;
* prevalence4549w;				prevalence4549w = s_hiv4549w  / s_ageg4549w ;
* prevalence4549m;				prevalence4549m = s_hiv4549m  / s_ageg4549m ;

* prevalence1524w;				prevalence1524w =  s_hiv1524w  / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m =  s_hiv1524m  / (s_ageg1519m + s_ageg2024m) ;

* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

* derived variables relating to people with hiv ;
								if s_primary gt 0 then do;
* p_inf_vlsupp ;				p_inf_vlsupp = s_inf_vlsupp   / s_primary;
* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;
								end;
* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hiv1564 ;  p_diag = p_diag * 100;
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m / s_hiv1564m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w / s_hiv1564w ;  p_diag_w = p_diag_w * 100;

* p_diag_m1524;					if s_hiv1524m > 0 then p_diag_m1524 = (s_diag_m1519_+s_diag_m2024_)/(s_hiv1524m);
* p_diag_w1524;					if s_hiv1524w > 0 then p_diag_w1524 = (s_diag_w1519_+s_diag_w2024_)/(s_hiv1524w);

* p_diag_sw;					if s_sw_1564 > 0 then p_diag_sw = s_diag_sw / s_sw_1564; 

* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_pim;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_pim = s_ai_naive_no_pmtct_c_pim_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt184m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt184m = s_ai_naive_no_pmtct_c_rt184m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt65m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt65m = s_ai_naive_no_pmtct_c_rt65m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rttams;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rttams = s_ai_naive_no_pmtct_c_rttams_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_inm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_inm = s_ai_naive_no_pmtct_c_inm_ / s_ai_naive_no_pmtct_;

* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart;						if s_hiv1564 gt 0 then p_onart = s_onart / s_hiv1564;

* p_efa;						if s_onart > 0 then p_efa = s_efa / s_onart ;
* p_taz;						if s_onart > 0 then p_taz = s_taz / s_onart ;
* p_ten;						if s_onart > 0 then p_ten = s_ten / s_onart ;
* p_zdv;						if s_onart > 0 then p_zdv = s_zdv / s_onart ;
* p_dol; 						if s_onart > 0 then p_dol = s_dol / s_onart ;
* p_3tc;						if s_onart > 0 then p_3tc = s_3tc / s_onart ;
* p_lpr; 						if s_onart > 0 then p_lpr = s_lpr / s_onart ;
* p_nev;						if s_onart > 0 then p_nev = s_nev / s_onart ;

* p_tle;						if s_onart > 0 then p_tle = s_tle / s_onart ;
* p_tld;						if s_onart > 0 then p_tld = s_tld / s_onart ;
* p_zld;						if s_onart > 0 then p_zld = s_zld / s_onart ;
* p_zla;						if s_onart > 0 then p_zla = s_zla / s_onart ;
* p_otherreg;					if s_onart > 0 then p_otherreg = s_otherreg / s_onart ;

* p_o_zdv_tox;					if s_zdv gt 0 then p_o_zdv_tox = s_o_zdv_tox / s_zdv ;
* p_o_3tc_tox;					if s_3tc gt 0 then p_o_3tc_tox = s_o_3tc_tox / s_3tc ;
* p_o_ten_tox;					if s_ten gt 0 then p_o_ten_tox = s_o_ten_tox / s_ten ;
* p_o_taz_tox;					if s_taz gt 0 then p_o_taz_tox = s_o_taz_tox / s_taz ;
* p_o_lpr_tox;					if s_lpr gt 0 then p_o_lpr_tox = s_o_lpr_tox / s_lpr ;
* p_o_efa_tox;					if s_efa gt 0 then p_o_efa_tox = s_o_efa_tox / s_efa ;
* p_o_nev_tox;					if s_nev gt 0 then p_o_nev_tox = s_o_nev_tox / s_nev ;
* p_o_dol_tox;					if s_dol gt 0 then p_o_dol_tox = s_o_dol_tox / s_dol ;

* p_o_tle_tox;					if s_tle gt 0 then p_o_tle_tox = s_o_tle_tox / s_tle ;
* p_o_tld_tox;					if s_tld gt 0 then p_o_tld_tox = s_o_tld_tox / s_tld ;
* p_o_zld_tox;					if s_zld gt 0 then p_o_zld_tox = s_o_zld_tox / s_zld ;
* p_o_zla_tox;					if s_zla gt 0 then p_o_zla_tox = s_o_zla_tox / s_zla ;

* p_o_zdv_adh_hi;				if s_zdv gt 0 then p_o_zdv_adh_hi = s_o_zdv_adh_hi / s_zdv ;
* p_o_3tc_adh_hi;				if s_3tc gt 0 then p_o_3tc_adh_hi = s_o_3tc_adh_hi / s_3tc ;
* p_o_ten_adh_hi;				if s_ten gt 0 then p_o_ten_adh_hi = s_o_ten_adh_hi / s_ten ;
* p_o_taz_adh_hi;				if s_taz gt 0 then p_o_taz_adh_hi = s_o_taz_adh_hi / s_taz ;
* p_o_lpr_adh_hi;				if s_lpr gt 0 then p_o_lpr_adh_hi = s_o_lpr_adh_hi / s_lpr ;
* p_o_efa_adh_hi;				if s_efa gt 0 then p_o_efa_adh_hi = s_o_efa_adh_hi / s_efa ;
* p_o_nev_adh_hi;				if s_nev gt 0 then p_o_nev_adh_hi = s_o_nev_adh_hi / s_nev ;
* p_o_dol_adh_hi;				if s_dol gt 0 then p_o_dol_adh_hi = s_o_dol_adh_hi / s_dol ;

* p_o_tle_adh_hi;				if s_tle gt 0 then p_o_tle_adh_hi = s_o_tle_adh_hi / s_tle ;
* p_o_tld_adh_hi;				if s_tld gt 0 then p_o_tld_adh_hi = s_o_tld_adh_hi / s_tld ;
* p_o_zld_adh_hi;				if s_zld gt 0 then p_o_zld_adh_hi = s_o_zld_adh_hi / s_zld ;
* p_o_zla_adh_hi;				if s_zla gt 0 then p_o_zla_adh_hi = s_o_zla_adh_hi / s_zla ;

* p_adh_hi;						if s_onart gt 0 then p_adh_hi = s_adh_hi / s_onart;

* p_k65m;						if s_hiv1564 gt 0 then p_k65m = s_k65m_ / s_hiv1564 ;
* p_m184m;						if s_hiv1564 gt 0 then p_m184m = s_m184m_ / s_hiv1564 ;

* p_vlg1000_184m;				if s_vg1000 > 0 then p_vlg1000_184m = s_vlg1000_184m / s_vg1000 ;
* p_vlg1000_65m;				if s_vg1000 > 0 then p_vlg1000_65m = s_vlg1000_65m / s_vg1000 ;

* p_vlg1000_184m_hiv;			if s_hiv1564 > 0 then p_vlg1000_184m_hiv = s_vlg1000_184m / s_hiv1564  ;
* p_vlg1000_65m_hiv;			if s_hiv1564 > 0 then p_vlg1000_65m_hiv = s_vlg1000_65m / s_hiv1564  ;

* p_vlg1000_onart_65m;			if s_vlg1000_onart > 0 then p_vlg1000_onart_65m = s_vlg1000_onart_65m / s_vlg1000_onart ;
* p_vlg1000_onart_184m;			if s_vlg1000_onart > 0 then p_vlg1000_onart_184m = s_vlg1000_onart_184m / s_vlg1000_onart ;

* p_184m_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_184m_ontle_vlg1000 = s_vlg1000_184m_ontle / s_vlg1000_ontle ;
* p_tams_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_tams_ontle_vlg1000 = s_vlg1000_tams_ontle / s_vlg1000_ontle ;
* p_65m_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_65m_ontle_vlg1000 = s_vlg1000_65m_ontle / s_vlg1000_ontle ;
* p_nnm_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_nnm_ontle_vlg1000 = s_vlg1000_nnm_ontle / s_vlg1000_ontle ;

* p_184m_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_184m_ontld_vlg1000 = s_vlg1000_184m_ontld / s_vlg1000_ontld ;
* p_tams_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_tams_ontld_vlg1000 = s_vlg1000_tams_ontld / s_vlg1000_ontld ;
* p_65m_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_65m_ontld_vlg1000 = s_vlg1000_65m_ontld / s_vlg1000_ontld ;
* p_nnm_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_nnm_ontld_vlg1000 = s_vlg1000_nnm_ontld / s_vlg1000_ontld ;
* p_inm_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_inm_ontld_vlg1000 = s_vlg1000_inm_ontld / s_vlg1000_ontld ;

								if s_onart_start_zld_if_reg_op_116 gt 0 then do;
* p_nactive_ge2p75_xyz;			p_nactive_ge2p75_xyz = s_nac_ge2p75_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge2p00_xyz;			p_nactive_ge2p00_xyz = s_nac_ge2p00_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge1p50_xyz;			p_nactive_ge1p50_xyz = s_nac_ge1p50_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
								end;

* p_adh_hi_xyz_ot1;				if s_a_zld_if_reg_op_116 gt 0 then p_adh_hi_xyz_ot1 = s_adh_hi_a_zld_if_reg_op_116 / s_a_zld_if_reg_op_116;
* p_adh_hi_xyz_ot2;				if s_onart_start_zld_if_reg_op_116 gt 0 then p_adh_hi_xyz_ot2 = s_adh_hi_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_adh_hi_xyz_itt;				if s_x_n_zld_if_reg_op_116 gt 0 then  p_adh_hi_xyz_itt = s_adh_hi_a_zld_if_reg_op_116 / s_x_n_zld_if_reg_op_116;

* p_e_rt65m_xyz; 				if s_onart_start_zld_if_reg_op_116 gt 0 then p_e_rt65m_xyz = s_e_rt65m_st_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116 ;

* p_startedline2;				if s_artexp > 0 then do; p_startedline2 = s_startedline2 / s_artexp; end;
* Of people on ART, percent with CD4 < 500;	
								if  s_onart_iicu > 0 then  p_onart_cd4_l500 = 1 - (s_onart_cd4_g500 / s_onart_iicu) ;
* Of people on ART, percent with CD4 < 200;	
								if s_onart_iicu > 0 then  p_onart_cd4_l200 = s_onart_cl200 / s_onart_iicu ;
* p_drug_level_test;			if s_onart > 0 then p_drug_level_test = s_drug_level_test / s_onart ;

* p_linefail_ge1;				if s_artexp > 0 then p_linefail_ge1 = s_linefail_ge1 / s_artexp;
* p_startedline2;				if s_artexp > 0 then p_startedline2 = s_startedline2 / s_artexp; 
* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_artexp_vl1000;				if s_artexp > 0 then p_artexp_vl1000 = s_vl1000_art_gt6m_iicu / s_artexp ;

* p_vg1000, p_vl1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* p_vg1000_m, p_vl1000_m;		if s_hiv1564m  > 0 then p_vg1000_m = s_vg1000_m / s_hiv1564m ;  p_vl1000_m = 1- p_vg1000_m ;
* p_vg1000_w, p_vl1000_w;		if s_hiv1564w  > 0 then p_vg1000_w = s_vg1000_w / s_hiv1564w ;  p_vl1000_w = 1- p_vg1000_w ;
* p_vg1000_m_1524;				if s_hiv1524m  > 0 then p_vg1000_m_1524 = s_vg1000_m_1524 / s_hiv1524m ;
* p_vg1000_w_1524;				if s_hiv1524w  > 0 then p_vg1000_w_1524 = s_vg1000_w_1524 / s_hiv1524w ;
* p_vl1000_m_1524;				p_vl1000_m_1524 = 1 - p_vg1000_m_1524 ;
* p_vl1000_w_1524;				p_vl1000_w_1524 = 1 - p_vg1000_w_1524 ;

* p_onart_m;					if s_hiv1564m > 0 then p_onart_m = s_onart_m / s_hiv1564m  ;
* p_onart_w;					if s_hiv1564w  > 0 then p_onart_w = s_onart_w / s_hiv1564w  ;  
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_1524;			if s_onart_gt6m_iicu_1524_ > 0 then p_onart_vl1000_1524 = s_vl1000_art_gt6m_iicu_1524_ / s_onart_gt6m_iicu_1524_ ;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* p_vl1000_art_12m;				if s_art_12m > 0 then p_vl1000_art_12m = s_vl1000_art_12m / s_art_12m ;
* p_vl1000_art_12m_onart;		if s_art_12m_onart > 0 then p_vl1000_art_12m_onart = s_vl1000_art_12m / s_art_12m_onart ;

* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);
* prev_vg1000_newp_m;			if s_m_newp gt 0 then prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_m_newp;
* prev_vg1000_newp_w;			if s_w_newp gt 0 then prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_w_newp;
* r_efa_hiv;					if s_hiv1564 > 0 then r_efa_hiv = s_r_efa / s_hiv1564 ;
* p_dol_2vg1000_dolr1_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh0 = s_o_dol_2nd_vlg1000_dolr1_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr1_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh1 = s_o_dol_2nd_vlg1000_dolr1_adh1 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh0 = s_o_dol_2nd_vlg1000_dolr0_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh1 = s_o_dol_2nd_vlg1000_dolr0_adh1 / s_o_dol_2nd_vlg1000 ;

* p_iime_;						p_iime_ = s_iime_ / s_hiv1564 ;
* p_pime_;						p_pime_ = s_pime_ / s_hiv1564 ;
* p_nnme_;						p_nnme_ = s_nnme_ / s_hiv1564 ;

* p_death_hivrel_age_le64;		if s_death_hivrel_allage gt 0 then p_death_hivrel_age_le64 = s_death_hivrel / s_death_hivrel_allage ;

* aids_death_rate;				if s_hiv1564 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hiv1564 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;
* death_rate_artexp;			if s_artexp gt 0 then death_rate_artexp = (4 * 100 * s_dead_artexp / s_artexp);
* death_rate;					if s_hiv1564 > 0 then death_rate= (4 * 100 * s_dead1564_) / s_hiv1564;
* death_rate_hiv; 				if s_hiv1564 > 0 then death_rate_hiv = (4 * 100 * s_death_hiv) / s_hiv1564;
				 				if s_hiv1564m > 0 then death_rate_hiv_m = (4 * 100 * s_death_hiv_m) / s_hiv1564m;
								if s_hiv1564w > 0 then death_rate_hiv_w = (4 * 100 * s_death_hiv_w) / s_hiv1564w;
* death_rate_hiv_all;			if s_alive1564 > 0 then death_rate_hiv_all = (4 * 100 * s_death_hiv) / s_alive1564;
				 				if s_alive1564_m > 0 then death_rate_hiv_all_m = (4 * 100 * s_death_hiv_m) / s_alive1564_m;
								if s_alive1564_w > 0 then death_rate_hiv_all_w = (4 * 100 * s_death_hiv_w) / s_alive1564_w;

* n_onart;						n_onart = s_onart * sf_2021 ;
* n_diag;						n_diag = s_diag_this_period * sf_2021 * 4 ;
* n_start_line2;				n_start_line2 = s_start_line2_this_period * sf_2021 * 4 ;
* n_vl_test_done;				n_vl_test_done = (s_vl_cost / 0.022  )  * sf_2021 * 4 ;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage * sf_2021;
* n_death_covid;				n_death_covid = s_death_dcause3_allage * sf_2021;
* n_death;						n_death = s_dead_allage * sf_2021;
* n_covid;						n_covid = s_covid * sf_2021;
								inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid;

* n_death_discount;				n_death_discount = n_death*&discount;
* death_rate_all_discount;		death_rate_all_discount = (4 * 100 * s_dead_allage) / (s_alive_w + s_alive_m) ;


* n_give_birth_w_hiv;			n_give_birth_w_hiv = s_give_birth_with_hiv * sf_2021 * 4; * number of women with hiv giving birth per year;
* n_birth_with_inf_child;		n_birth_with_inf_child = s_birth_with_inf_child * sf_2021 * 4;
* n_pregnant_ntd;				s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058); n_pregnant_ntd = s_pregnant_ntd    * sf_2021 * 4 ; 
								* number pregnant with baby with neural tube defect;

* n_preg_odabe;					n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf_2021 * 4;  
								* annual number of pregnancies with other adverse dol birth event;


* n_mcirc1549_py;				n_mcirc1549_py =	s_mcirc_1549m * sf_2021 * 4;
* n_mcirc1549_3m;				n_mcirc1549_3m =	s_mcirc_1549m * sf_2021;
* n_vmmc1549_py;				n_vmmc1549_py =		s_vmmc1549m * sf_2021 * 4;
* n_vmmc1549_3m;				n_vmmc1549_3m =		s_vmmc1549m * sf_2021;
* n_new_vmmc1549_py;			n_new_vmmc1549_py =	s_new_vmmc1549m * sf_2021 * 4;
* n_new_vmmc1049_py;			n_new_vmmc1049_py = (s_new_vmmc1549m + s_new_vmmc1014m) * sf_2021 * 4;

* n_new_inf1549m;				n_new_inf1549m=s_primary1549m * sf_2021 * 4;
* n_new_inf1549;				n_new_inf1549=s_primary1549 * sf_2021 * 4;
* n_infection;					n_infection  = s_primary     * sf_2021 * 4;

* d_n_new_inf1549;				d_n_new_inf1549 = &discount * n_new_inf1549;
* d_n_infection;				d_n_infection = &discount * n_infection;


* n_ageg1519m ;					n_ageg1519m = s_ageg1519m * sf_2021 ;
* n_ageg2024m ;					n_ageg2024m = s_ageg2024m * sf_2021 ;
* n_ageg2529m ;					n_ageg2529m = s_ageg2529m * sf_2021 ;
* n_ageg3034m ;					n_ageg3034m = s_ageg3034m * sf_2021 ;
* n_ageg3539m ;					n_ageg3539m = s_ageg3539m * sf_2021 ;
* n_ageg4044m ;					n_ageg4044m = s_ageg4044m * sf_2021 ;
* n_ageg4549m ;					n_ageg4549m = s_ageg4549m * sf_2021 ;
* n_ageg5054m ;					n_ageg5054m = s_ageg5054m * sf_2021 ;
* n_ageg5559m ;					n_ageg5559m = s_ageg5559m * sf_2021 ;
* n_ageg6064m ;					n_ageg6064m = s_ageg6064m * sf_2021 ;
* n_ageg6569m ;					n_ageg6569m = s_ageg6569m * sf_2021 ;
* n_ageg7074m ;					n_ageg7074m = s_ageg7074m * sf_2021 ;
* n_ageg7579m ;					n_ageg7579m = s_ageg7579m * sf_2021 ;
* n_ageg8084m ;					n_ageg8084m = s_ageg8084m * sf_2021 ;
* n_ageg85plw ;					n_ageg85plw  = s_ageg85plw * sf_2021 ;
* n_ageg1519w ;					n_ageg1519w = s_ageg1519w * sf_2021 ;
* n_ageg2024w ;					n_ageg2024w = s_ageg2024w * sf_2021 ;
* n_ageg2529w ;					n_ageg2529w = s_ageg2529w * sf_2021 ;
* n_ageg3034w ;					n_ageg3034w = s_ageg3034w * sf_2021 ;
* n_ageg3539w ;					n_ageg3539w = s_ageg3539w * sf_2021 ;
* n_ageg4044w ;					n_ageg4044w = s_ageg4044w * sf_2021 ;
* n_ageg4549w ;					n_ageg4549w = s_ageg4549w * sf_2021 ;
* n_ageg5054w ;					n_ageg5054w = s_ageg5054w * sf_2021 ;
* n_ageg5559w ;					n_ageg5559w = s_ageg5559w * sf_2021 ;
* n_ageg6064w ;					n_ageg6064w = s_ageg6064w * sf_2021 ;
* n_ageg6569w ;					n_ageg6569w = s_ageg6569w * sf_2021 ;
* n_ageg7074w ;					n_ageg7074w = s_ageg7074w * sf_2021 ;
* n_ageg7579w ;					n_ageg7579w = s_ageg7579w * sf_2021 ;
* n_ageg8084w ;					n_ageg8084w = s_ageg8084w * sf_2021 ;
* n_ageg85plw ;					n_ageg85plw  = s_ageg85plw * sf_2021 ;

* n_onart_m1519 ;				n_onart_m1519 = s_onart_m1519_  * sf_2021 ;
* n_onart_m2024 ;				n_onart_m2024 = s_onart_m2024_  * sf_2021 ;
* n_onart_m2529 ;				n_onart_m2529 = s_onart_m2529_  * sf_2021 ;
* n_onart_m3034 ;				n_onart_m3034 = s_onart_m3034_  * sf_2021 ;
* n_onart_m3539 ;				n_onart_m3539 = s_onart_m3539_  * sf_2021 ;
* n_onart_m4044 ;				n_onart_m4044 = s_onart_m4044_  * sf_2021 ;
* n_onart_m4549 ;				n_onart_m4549 = s_onart_m4549_  * sf_2021 ;
* n_onart_m5054 ;				n_onart_m5054 = s_onart_m5054_  * sf_2021 ;
* n_onart_m5559 ;				n_onart_m5559 = s_onart_m5559_  * sf_2021 ;
* n_onart_m6064 ;				n_onart_m6064 = s_onart_m6064_  * sf_2021 ;
* n_onart_m6569 ;				n_onart_m6569 = s_onart_m6569_  * sf_2021 ;
* n_onart_m7074 ;				n_onart_m7074 = s_onart_m7074_  * sf_2021 ;
* n_onart_m7579 ;				n_onart_m7579 = s_onart_m7579_  * sf_2021 ;
* n_onart_m8084 ;				n_onart_m8084 = s_onart_m8084_  * sf_2021 ;
* n_onart_m85pl ;				n_onart_m85pl = s_onart_m85pl_  * sf_2021 ;
* n_onart_w1519 ;				n_onart_w1519 = s_onart_w1519_  * sf_2021 ;
* n_onart_w2024 ;				n_onart_w2024 = s_onart_w2024_  * sf_2021 ;
* n_onart_w2529 ;				n_onart_w2529 = s_onart_w2529_  * sf_2021 ;
* n_onart_w3034 ;				n_onart_w3034 = s_onart_w3034_  * sf_2021 ;
* n_onart_w3539 ;				n_onart_w3539 = s_onart_w3539_  * sf_2021 ;
* n_onart_w4044 ;				n_onart_w4044 = s_onart_w4044_  * sf_2021 ;
* n_onart_w4549 ;				n_onart_w4549 = s_onart_w4549_  * sf_2021 ;
* n_onart_w5054 ;				n_onart_w5054 = s_onart_w5054_  * sf_2021 ;
* n_onart_w5559 ;				n_onart_w5559 = s_onart_w5559_  * sf_2021 ;
* n_onart_w6064 ;				n_onart_w6064 = s_onart_w6064_  * sf_2021 ;
* n_onart_w6569 ;				n_onart_w6569 = s_onart_w6569_  * sf_2021 ;
* n_onart_w7074 ;				n_onart_w7074 = s_onart_w7074_  * sf_2021 ;
* n_onart_w7579 ;				n_onart_w7579 = s_onart_w7579_  * sf_2021 ;
* n_onart_w8084 ;				n_onart_w8084 = s_onart_w8084_  * sf_2021 ;
* n_onart_w85pl ;				n_onart_w85pl = s_onart_w85pl_  * sf_2021 ;

* n_mcirc_1014m ;				n_mcirc_1014m = s_mcirc_1014m * sf_2021 ;
* n_mcirc_1519m ;				n_mcirc_1519m = s_mcirc_1519m * sf_2021 ;
* n_mcirc_2024m ;				n_mcirc_2024m = s_mcirc_2024m * sf_2021 ;
* n_mcirc_2529m ;				n_mcirc_2529m = s_mcirc_2529m * sf_2021 ;
* n_mcirc_3034m ;				n_mcirc_3034m = s_mcirc_3034m * sf_2021 ;
* n_mcirc_3539m ;				n_mcirc_3539m = s_mcirc_3539m * sf_2021 ;
* n_mcirc_4044m ;				n_mcirc_4044m = s_mcirc_4044m * sf_2021 ;
* n_mcirc_4549m ;				n_mcirc_4549m = s_mcirc_4549m * sf_2021 ;
* n_mcirc_5054m ;				n_mcirc_5054m = s_mcirc_5054m * sf_2021 ;
* n_mcirc_5559m ;				n_mcirc_5559m = s_mcirc_5559m * sf_2021 ;
* n_mcirc_6064m ;				n_mcirc_6064m = s_mcirc_6064m * sf_2021 ;
* n_mcirc_6569m ;				n_mcirc_6569m = s_mcirc_6569m * sf_2021 ;
* n_mcirc_7074m ;				n_mcirc_7074m = s_mcirc_7074m * sf_2021 ;
* n_mcirc_7579m ;				n_mcirc_7579m = s_mcirc_7579m * sf_2021 ;
* n_mcirc_8084m ;				n_mcirc_8084m = s_mcirc_8084m * sf_2021 ;
* n_mcirc_85plm ;				n_mcirc_85plm = s_mcirc_85plm * sf_2021 ;

* n_new_mcirc_1014m ;			n_new_mcirc_1014m = s_new_mcirc_1014m * sf_2021 ;
* n_new_mcirc_1519m ;			n_new_mcirc_1519m = s_new_mcirc_1519m * sf_2021 ;
* n_new_mcirc_2024m ;			n_new_mcirc_2024m = s_new_mcirc_2024m * sf_2021 ;
* n_new_mcirc_2529m ;			n_new_mcirc_2529m = s_new_mcirc_2529m * sf_2021 ;
* n_new_mcirc_3034m ;			n_new_mcirc_3034m = s_new_mcirc_3034m * sf_2021 ;
* n_new_mcirc_3539m ;			n_new_mcirc_3539m = s_new_mcirc_3539m * sf_2021 ;
* n_new_mcirc_4044m ;			n_new_mcirc_4044m = s_new_mcirc_4044m * sf_2021 ;
* n_new_mcirc_4549m ;			n_new_mcirc_4549m = s_new_mcirc_4549m * sf_2021 ;
* n_new_mcirc_5054m ;			n_new_mcirc_5054m = s_new_mcirc_5054m * sf_2021 ;
* n_new_mcirc_5559m ;			n_new_mcirc_5559m = s_new_mcirc_5559m * sf_2021 ;
* n_new_mcirc_6064m ;			n_new_mcirc_6064m = s_new_mcirc_6064m * sf_2021 ;
* n_new_mcirc_6569m ;			n_new_mcirc_6569m = s_new_mcirc_6569m * sf_2021 ;
* n_new_mcirc_7074m ;			n_new_mcirc_7074m = s_new_mcirc_7074m * sf_2021 ;
* n_new_mcirc_7579m ;			n_new_mcirc_7579m = s_new_mcirc_7579m * sf_2021 ;
* n_new_mcirc_8084m ;			n_new_mcirc_8084m = s_new_mcirc_8084m * sf_2021 ;
* n_new_mcirc_85plm ;			n_new_mcirc_85plm = s_new_mcirc_85plm * sf_2021 ;

* n_new_inf_1519m ;				n_new_inf_1519m = s_primary1519m  * sf_2021 ;
* n_new_inf_2024m ;				n_new_inf_2024m = s_primary2024m  * sf_2021 ;
* n_new_inf_2529m ;				n_new_inf_2529m = s_primary2529m  * sf_2021 ;
* n_new_inf_3034m ;				n_new_inf_3034m = s_primary3034m  * sf_2021 ;
* n_new_inf_3539m ;				n_new_inf_3539m = s_primary3539m  * sf_2021 ;
* n_new_inf_4044m ;				n_new_inf_4044m = s_primary4044m  * sf_2021 ;
* n_new_inf_4549m ;				n_new_inf_4549m = s_primary4549m  * sf_2021 ;
* n_new_inf_5054m ;				n_new_inf_5054m = s_primary5054m  * sf_2021 ;
* n_new_inf_5559m ;				n_new_inf_5559m = s_primary5559m  * sf_2021 ;
* n_new_inf_6064m ;				n_new_inf_6064m = s_primary6064m  * sf_2021 ;
* n_new_inf_1519w ;				n_new_inf_1519w = s_primary1519w  * sf_2021 ;
* n_new_inf_2024w ;				n_new_inf_2024w = s_primary2024w  * sf_2021 ;
* n_new_inf_2529w ;				n_new_inf_2529w = s_primary2529w  * sf_2021 ;
* n_new_inf_3034w ;				n_new_inf_3034w = s_primary3034w  * sf_2021 ;
* n_new_inf_3539w ;				n_new_inf_3539w = s_primary3539w  * sf_2021 ;
* n_new_inf_4044w ;				n_new_inf_4044w = s_primary4044w  * sf_2021 ;
* n_new_inf_4549w ;				n_new_inf_4549w = s_primary4549w  * sf_2021 ;
* n_new_inf_5054w ;				n_new_inf_5054w = s_primary5054w  * sf_2021 ;
* n_new_inf_5559w ;				n_new_inf_5559w = s_primary5559w  * sf_2021 ;
* n_new_inf_6064w ;				n_new_inf_6064w = s_primary6064w  * sf_2021 ;

* n_hiv1519m ; 					n_hiv1519m = s_hiv1519m  * sf_2021 ;
* n_hiv2024m ; 					n_hiv2024m = s_hiv2024m  * sf_2021 ;
* n_hiv2529m ; 					n_hiv2529m = s_hiv2529m  * sf_2021 ;
* n_hiv3034m ; 					n_hiv3034m = s_hiv3034m  * sf_2021 ;
* n_hiv3539m ; 					n_hiv3539m = s_hiv3539m  * sf_2021 ;
* n_hiv4044m ; 					n_hiv4044m = s_hiv4044m  * sf_2021 ;
* n_hiv4549m ; 					n_hiv4549m = s_hiv4549m  * sf_2021 ;
* n_hiv5054m ; 					n_hiv5054m = s_hiv5054m  * sf_2021 ;
* n_hiv5559m ; 					n_hiv5559m = s_hiv5559m  * sf_2021 ;
* n_hiv6064m ; 					n_hiv6064m = s_hiv6064m  * sf_2021 ;
* n_hiv6569m ; 					n_hiv6569m = s_hiv6569m  * sf_2021 ;
* n_hiv7074m ; 					n_hiv7074m = s_hiv7074m  * sf_2021 ;
* n_hiv7579m ; 					n_hiv7579m = s_hiv7579m  * sf_2021 ;
* n_hiv8084m ; 					n_hiv8084m = s_hiv8084m  * sf_2021 ;
* n_hiv85plm ; 					n_hiv85plm = s_hiv85plm  * sf_2021 ;
* n_hiv1519w ; 					n_hiv1519w = s_hiv1519w  * sf_2021 ;
* n_hiv2024w ; 					n_hiv2024w = s_hiv2024w  * sf_2021 ;
* n_hiv2529w ; 					n_hiv2529w = s_hiv2529w  * sf_2021 ;
* n_hiv3034w ; 					n_hiv3034w = s_hiv3034w  * sf_2021 ;
* n_hiv3539w ; 					n_hiv3539w = s_hiv3539w  * sf_2021 ;
* n_hiv4044w ; 					n_hiv4044w = s_hiv4044w  * sf_2021 ;
* n_hiv4549w ; 					n_hiv4549w = s_hiv4549w  * sf_2021 ;
* n_hiv5054w ; 					n_hiv5054w = s_hiv5054w  * sf_2021 ;
* n_hiv5559w ; 					n_hiv5559w = s_hiv5559w  * sf_2021 ;
* n_hiv6064w ; 					n_hiv6064w = s_hiv6064w  * sf_2021 ;
* n_hiv6569w ; 					n_hiv6569w = s_hiv6569w  * sf_2021 ;
* n_hiv7074w ; 					n_hiv7074w = s_hiv7074w  * sf_2021 ;
* n_hiv7579w ; 					n_hiv7579w = s_hiv7579w  * sf_2021 ;
* n_hiv8084w ; 					n_hiv8084w = s_hiv8084w  * sf_2021 ;
* n_hiv85plw ; 					n_hiv85plw = s_hiv85plw  * sf_2021 ;


keep run option option_new cald /*dataset*/
s_alive p_w_giv_birth_this_per p_newp_ge1 p_1524_newp_ge1 p_newp_ge5 p_newp_ge1_age1549 gender_r_newp  
p_newp_sw  n_tested_m   p_tested_past_year_1549m  p_tested_past_year_1549w
p_diag_m1524 p_diag_w1524 p_diag_sw  p_onart_cd4_l200
p_mcirc  p_mcirc_inc1014m  p_mcirc_1014m  p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3034m p_mcirc_3539m p_mcirc_3039m
p_mcirc_4044m p_mcirc_4549m p_mcirc_4049m p_mcirc_50plm p_mcirc_1549m
p_vmmc  p_vmmc_inc1014m  p_vmmc_1014m  p_vmmc_1519m p_vmmc_2024m p_vmmc_2529m p_vmmc_3039m p_vmmc_4049m p_vmmc_50plm p_vmmc_1549m
p_new_vmmc_u  p_new_vmmc_u_1049m  p_new_vmmc_1014m_u  p_new_vmmc_1519m_u p_new_vmmc_2024m_u p_new_vmmc_2529m_u 
p_new_vmmc_3034m_u  p_new_vmmc_3539m_u  p_new_vmmc_3039m_u  p_new_vmmc_4044m_u  p_new_vmmc_4549m_u  p_new_vmmc_4049m_u p_new_vmmc_50plm_u p_new_vmmc_1549m_u
prop_w_1549_sw	prop_w_ever_sw prop_sw_hiv prop_w_1524_onprep prop_1564_onprep prop_sw_onprep p_prep_adhg80  av_prep_eff_non_res_v
prevalence1549m prevalence1549w prevalence1549 
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 			
prevalence1524w prevalence1524m  prevalence_sw
incidence1549 incidence1564 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary mtct_prop
p_diag p_diag_m p_diag_w p_ai_no_arv_c_nnm prop_sw_newp0
p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m   p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm
p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw
p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_onart_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w   p_vl1000_m_1524  p_vl1000_w_1524    
p_onart_m p_onart_w p_onart_vl1000_w p_onart_vl1000_m  p_onart_vl1000_1524	  p_onart_vl1000_sw
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w  p_startedline2
 p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart  ddaly_adults  dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost dcost_cascade_intervntn     dcost_circ  dcost_condom_dn dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv 
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564  prop_sw_onprep  p_onart  p_vl1000_art_12m  p_vl1000_art_12m_onart
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  p_k65m  p_m184m  p_artexp_vl1000
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000  p_tams_ontle_vlg1000   p_tams_ontld_vlg1000 p_vlg1000_184m p_vlg1000_65m
death_rate  death_rate_hiv death_rate_hiv_w  death_rate_hiv_m death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w p_iime_   p_pime_   p_nnme_  n_pregnant_ntd  n_preg_odabe
n_birth_with_inf_child  n_tested  p_vlg1000_onart_65m  p_vlg1000_onart_184m  p_elig_prep
prop_elig_on_prep n_hiv1_prep  n_prep  n_covid  n_death_covid n_death n_death_hivrel p_death_hivrel_age_le64 
p_prep_ever  p_hiv1_prep incidence1524w   incidence1524m  test_prop_positive  p_newp_prep n_infection 
p_newp_this_per_prep  p_newp_prep_hivneg  av_prep_eff_non_res_v

sf_2021 sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti super_infection an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_who3e higher_newp_less_engagement
fold_tr switch_for_tox adh_pattern_prep rate_test_startprep rate_test_restartprep
rate_choose_stop_prep circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz 
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice 	eff_test_targeting
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
prep_strategy rate_sw_rred_rc

exp_setting_lower_p_vl1000  
external_exp_factor   rate_exp_set_lower_p_vl1000    max_freq_testing  
test_targeting    prob_loss_at_diag   pr_art_init   
rate_lost   prob_lost_art   rate_return   rate_restart   rate_int_choice  
clinic_not_aw_int_frac    rate_loss_persistence   incr_rate_int_low_adh  
fold_change_mut_risk   adh_effect_of_meas_alert   pr_switch_line   prob_vl_meas_done  
red_adh_tb_adc   red_adh_tox_pop   add_eff_adh_nnrti   altered_adh_sec_line_pop  
prob_return_adc   prob_lossdiag_adctb   prob_lossdiag_who3e  higher_newp_less_engagement  
fold_tr   switch_for_tox   adh_pattern_prep    base_rate_sw  lower_future_art_cov

condom_incr_2020     			cascade_care_improvements  incr_test_2020              decr_hard_reach_2020   
decr_prob_loss_at_diag_2020  	decr_rate_lost_2020 		decr_rate_lost_art_2020     incr_rate_return_2020      
incr_rate_restart_2020         incr_rate_init_2020        decr_rate_int_choice_2020  
incr_prob_vl_meas_done_2020  
incr_pr_switch_line_2020     	prep_improvements        	incr_adh_pattern_prep_2020  
inc_r_test_startprep_2020  incr_r_test_restartprep_2020  decr_r_choose_stop_prep_2020  
inc_p_prep_restart_choi_2020 incr_prepuptake_sw_2020    incr_prepuptake_pop_2020   
circ_improvements  			circ_inc_rate_2020  		incr_test_targeting_2020    pop_wide_tld_2020 
incr_max_freq_testing_2020     initial_pr_switch_line     initial_prob_vl_meas_done   sw_test_6mthly_2020  
reg_option_switch_2020      art_mon_drug_levels_2020       ten_is_taf_2020    

eff_max_freq_testing  		eff_rate_restart   		eff_prob_loss_at_diag   		eff_rate_lost   		
eff_prob_lost_art   		eff_rate_return   
eff_pr_art_init   	eff_rate_int_choice   	eff_prob_vl_meas_done   		eff_pr_switch_line   	
eff_rate_test_startprep   	eff_rate_test_restartprep   	
eff_rate_choose_stop_prep   		eff_prob_prep_restart_choice   	
e_decr_hard_reach_2020  eff_test_targeting  prep_strategy 
vmmc_disrup_covid  condom_disrup_covid  prep_disrup_covid  swprog_disrup_covid  
testing_disrup_covid  art_tld_disrup_covid  art_tld_eod_disrup_covid   art_init_disrup_covid   
vl_adh_switch_disrup_covid  cotrim_disrup_covid    no_art_disrup_covid 
inc_adeathr_disrup_covid art_low_adh_disrup_covid  cov_death_risk_mult lower_future_art_cov
 
eff_rate_test_startprep   	eff_rate_test_restartprep   	
eff_rate_choose_stop_prep   		eff_prob_prep_restart_choice   	
n_ageg1519m  n_ageg2024m  n_ageg2529m  n_ageg3034m  n_ageg3539m  n_ageg4044m  n_ageg4549m  n_ageg5054m  n_ageg5559m  n_ageg6064m  n_ageg6569m 
n_ageg7074m  n_ageg7579m  n_ageg8084m  n_ageg85plw  n_ageg1519w n_ageg2024w  n_ageg2529w  n_ageg3034w  n_ageg3539w  n_ageg4044w  n_ageg4549w 
n_ageg5054w  n_ageg5559w  n_ageg6064w n_ageg6569w  n_ageg7074w  n_ageg7579w  n_ageg8084w  n_ageg85plw  n_onart_m1519 
n_onart_m2024  n_onart_m2529 n_onart_m3034  n_onart_m3539  n_onart_m4044  n_onart_m4549  n_onart_m5054  n_onart_m5559  n_onart_m6064  n_onart_m7074 
n_onart_m7074  n_onart_m7579  n_onart_m8084  n_onart_m85pl  n_onart_w1519  n_onart_w2024  n_onart_w2529  n_onart_w3034  n_onart_w3539  n_onart_w4044 
n_onart_w4549 n_onart_w5054 n_onart_w5559 n_onart_w6064 n_onart_w6569 n_onart_w7074 n_onart_w7579 n_onart_w8084 n_onart_w85pl n_mcirc_1014m 		
n_mcirc_1519m  n_mcirc_2024m  n_mcirc_2529m  n_mcirc_3034m  n_mcirc_3539m  n_mcirc_4044m n_mcirc_4549m  n_mcirc_5054m  n_mcirc_5559m  n_mcirc_6064m 
n_mcirc_6569m n_mcirc_7074m n_mcirc_7579m n_mcirc_8084m n_mcirc_85plm n_new_mcirc_1014m n_new_mcirc_1519m n_new_mcirc_2024m n_new_mcirc_2529m 
n_new_mcirc_3034m  n_new_mcirc_3539m  n_new_mcirc_4044m  n_new_mcirc_4549m  n_new_mcirc_5054m n_new_mcirc_5559m n_new_mcirc_6064m  n_new_mcirc_6569m 
n_new_mcirc_7074m  n_new_mcirc_7579m  n_new_mcirc_8084m  n_new_mcirc_85plm  n_new_inf_1519m  n_new_inf_2024m  n_new_inf_2529m  n_new_inf_3034m 
n_new_inf_3539m  n_new_inf_4044m  n_new_inf_4549m  n_new_inf_5054m  n_new_inf_5559m  n_new_inf_6064m  n_new_inf_1519w  n_new_inf_2024w  n_new_inf_2529w 
n_new_inf_3034w  n_new_inf_3539w n_new_inf_4044w n_new_inf_4549w  n_new_inf_5054w  n_new_inf_5559w n_new_inf_6064w  n_hiv1519m  n_hiv2024m n_hiv2529m
n_hiv3034m  n_hiv3539m  n_hiv4044m  n_hiv4549m  n_hiv5054m  n_hiv5559m  n_hiv6064m  n_hiv6569m  n_hiv7074m  n_hiv7579m n_hiv8084m n_hiv85plm 
n_hiv1519w  n_hiv2024w  n_hiv2529w  n_hiv3034w  n_hiv3539w  n_hiv4044w n_hiv4549w n_hiv5054w  n_hiv5559w n_hiv6064w  n_hiv6569w  n_hiv7074w n_hiv7579w 
n_hiv8084w  n_hiv85plw
n_onart n_diag n_start_line2 n_vl_test_done
n_mcirc1549_py  n_mcirc1549_3m  n_vmmc1549_py n_vmmc1549_3m  n_new_vmmc1549_py n_new_vmmc1049_py  n_new_inf1549m  n_new_inf1549 d_n_new_inf1549 d_n_infection
s_sw_newp incidence_sw ddaly ddaly_adults_Op;
proc sort data=y;by run option_new;run;



data a.vmmc_22_11_21_averages; set y;run;
data y; set a.vmmc_22_11_21_averages;run;
