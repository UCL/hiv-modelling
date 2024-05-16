* options user="/folders/myfolders/";


***This file used for the paper;

libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\FSW\";


data a1;
set a.fsw_17_08_23_final;  
if run=. then delete; 

keep cald run option s_alive_m  s_alive_w  s_dead_ddaly  s_live_ddaly s_ddaly_mtct  s_dcost_zdv  s_dcost_ten
s_dcost_3tc   s_dcost_nev  s_dcost_lpr  s_dcost_dar  s_dcost_taz  s_dcost_efa  s_dcost_dol  s_dart_cost  s_dcost_prep_oral
s_dcost_prep_inj  s_dcost_prep_visit  s_dcost_prep_ac_adh  s_dcost_circ  s_dcost_condom_dn  s_dcost_prep_visit_oral s_dcost_prep_visit_inj
s_dvis_cost  s_dart_cost  s_dvl_cost  s_dcd4_cost  s_dadc_cost  s_dnon_tb_who3_cost  s_dtb_cost  s_dtest_cost  s_dcost_test_f_sw 
s_dcot_cost  s_dres_cost  s_d_t_adh_int_cost s_dcost_sw_program  s_dcost_avail_self_test  s_cost_avail_self_test
s_dfull_vis_cost  s_dcost_switch_line  s_dcost_drug_level_test  s_dcost_child_hiv
s_diag_m1549_  s_diag_w1549_  s_diag_m5054_  s_diag_m5559_   s_diag_m6064_   s_diag_w5054_   s_diag_w5559_   s_diag_w6064_
s_hiv1564  s_hiv1564m  s_hiv1564w  s_onart_iicu s_diag  s_onart_m s_diag_m  s_w_newp
s_onart_w  s_diag_w  s_vl1000_art_gt6m_iicu  s_onart_gt6m_iicu  s_vl1000_art_gt6m_iicu_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_w  s_onart_gt6m_iicu_w
s_vg1000  s_alive1549_w  s_alive1549_m  s_hiv1549m  s_hiv1549w  s_primary1549 s_alive1549  s_hiv1549  s_primary1549w  s_primary1549m
s_tested  s_tested_m  s_tested_m_sympt  s_tested_m_circ  s_tested_f  s_tested_f_anc  s_tested_f_sympt  s_tested_f_non_anc
s_tested_at_return  s_pregnant  s_sw_1549 s_sw_1564  s_alive1564_w  s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039 s_ageg1519w
s_ageg2024w  s_ageg2529w  s_sw_2529  s_sw_3039  s_ageg3034w  s_ageg3539w  s_ever_sw  s_age_deb_sw1519_  s_age_deb_sw2024_  s_age_deb_sw2529_
s_age_deb_sw3039_  s_episodes_sw  s_sw_gt1ep s_tot_dur_sw  s_act_dur_sw  s_actdur_sw_0to3  s_actdur_sw_3to5  s_actdur_sw_6to9
s_actdur_sw_10to19  s_totdur_sw_0to3  s_totdur_sw_3to5 s_totdur_sw_6to9  s_totdur_sw_10to19  s_sw_newp_cat1 s_sw_newp_cat2
s_sw_newp_cat3  s_sw_newp_cat4  s_sw_newp_cat5  s_sw_newp s_sw_program_visit  s_tested_sw  s_tested_4p_sw  s_diag_sw
s_prep_any_sw  s_hiv_sw  s_onart_sw  s_vl1000_art_gt6m_iicu_sw  s_onart_gt6m_iicu_sw  s_hiv_sw1549_  s_primary_sw  s_sti_sw
s_linked_diag_sw  s_diag_thisper_sw  s_cost_condom_dn
sw_art_disadv  sw_program  effect_sw_prog_newp   effect_sw_prog_6mtest   effect_sw_prog_int   effect_sw_prog_adh
 effect_sw_prog_lossdiag effect_sw_prog_prep_any  effect_sw_prog_pers_sti  sw_trans_matrix   sw_higher_int   sw_higher_prob_loss_at_diag
effect_sw_prog_newp rate_engage_sw_program/*s_rm_sw remove s_rm_sw when setting one dataset on top of another as the one below doesnt have it*/
;
run;

data res;
set a1;

if s_sw_1564>0 then p_res_sw= s_rm_sw/s_sw_1564;

proc means mean p5 p95;var p_res_sw;where option=0 and cald=2030;run;
proc means mean p5 p95;var p_res_sw;where option=1 and cald=2030;run;
proc means mean p5 p95;var p_res_sw;where option=2 and cald=2030;run;


data a2;
set a.fsw_17_08_23;

if run=. then delete; 

keep cald run option s_alive_m  s_alive_w  s_dead_ddaly  s_live_ddaly s_ddaly_mtct  s_dcost_zdv  s_dcost_ten
s_dcost_3tc   s_dcost_nev  s_dcost_lpr  s_dcost_dar  s_dcost_taz  s_dcost_efa  s_dcost_dol  s_dart_cost  s_dcost_prep_oral
s_dcost_prep_inj  s_dcost_prep_visit  s_dcost_prep_ac_adh  s_dcost_circ  s_dcost_condom_dn  s_dcost_prep_visit_oral s_dcost_prep_visit_inj
s_dvis_cost  s_dart_cost  s_dvl_cost  s_dcd4_cost  s_dadc_cost  s_dnon_tb_who3_cost  s_dtb_cost  s_dtest_cost  s_dcost_test_f_sw 
s_dcot_cost  s_dres_cost  s_d_t_adh_int_cost s_dcost_sw_program  s_dcost_avail_self_test  s_cost_avail_self_test
s_dfull_vis_cost  s_dcost_switch_line  s_dcost_drug_level_test  s_dcost_child_hiv
s_diag_m1549_  s_diag_w1549_  s_diag_m5054_  s_diag_m5559_   s_diag_m6064_   s_diag_w5054_   s_diag_w5559_   s_diag_w6064_
s_hiv1564  s_hiv1564m  s_hiv1564w  s_onart_iicu s_diag  s_onart_m s_diag_m  s_w_newp
s_onart_w  s_diag_w  s_vl1000_art_gt6m_iicu  s_onart_gt6m_iicu  s_vl1000_art_gt6m_iicu_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_w  s_onart_gt6m_iicu_w
s_vg1000  s_alive1549_w  s_alive1549_m  s_hiv1549m  s_hiv1549w  s_primary1549 s_alive1549  s_hiv1549  s_primary1549w  s_primary1549m
s_tested  s_tested_m  s_tested_m_sympt  s_tested_m_circ  s_tested_f  s_tested_f_anc  s_tested_f_sympt  s_tested_f_non_anc
s_tested_at_return  s_pregnant  s_sw_1549 s_sw_1564  s_alive1564_w  s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039 s_ageg1519w
s_ageg2024w  s_ageg2529w  s_sw_2529  s_sw_3039  s_ageg3034w  s_ageg3539w  s_ever_sw  s_age_deb_sw1519_  s_age_deb_sw2024_  s_age_deb_sw2529_
s_age_deb_sw3039_  s_episodes_sw  s_sw_gt1ep s_tot_dur_sw  s_act_dur_sw  s_actdur_sw_0to3  s_actdur_sw_3to5  s_actdur_sw_6to9
s_actdur_sw_10to19  s_totdur_sw_0to3  s_totdur_sw_3to5 s_totdur_sw_6to9  s_totdur_sw_10to19  s_sw_newp_cat1 s_sw_newp_cat2
s_sw_newp_cat3  s_sw_newp_cat4  s_sw_newp_cat5  s_sw_newp s_sw_program_visit  s_tested_sw  s_tested_4p_sw  s_diag_sw
s_prep_any_sw  s_hiv_sw  s_onart_sw  s_vl1000_art_gt6m_iicu_sw  s_onart_gt6m_iicu_sw  s_hiv_sw1549_  s_primary_sw  s_sti_sw
s_linked_diag_sw  s_diag_thisper_sw  s_cost_condom_dn
sw_art_disadv  sw_program  effect_sw_prog_newp   effect_sw_prog_6mtest   effect_sw_prog_int   effect_sw_prog_adh
 effect_sw_prog_lossdiag effect_sw_prog_prep_any  effect_sw_prog_pers_sti  sw_trans_matrix   sw_higher_int   sw_higher_prob_loss_at_diag
effect_sw_prog_newp rate_engage_sw_program
;
run;

data b;
set a1 a2;

proc sort;by run;run;

data a.fsw_17_08_23_final_allruns; set b;run;

data b1; set a.fsw_17_08_23_final_allruns;run;

data b;
set b1;
run;


/*
proc means n p50 p5 p95;var s_tested_sw s_tested  s_cost_test s_dtest_cost s_cost_test_f_sw;where option=0 and cald>2023.5;run;
proc means n p50 p5 p95;var s_tested_sw s_tested  s_cost_test s_dtest_cost s_cost_test_f_sw;where option=2 and cald>2023.5;run;
*/

data sf;
set b;

if cald=2023.25; ***Update as required;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = 10000000 / s_alive; ***If calibrating to a specific setting, change 10000000 to desired 15+ population size;
keep run sf_2023;
proc sort; by run;run;


%let sf=sf_2023;

data y; 
merge b sf;
by run ;


* preparatory code ;


* ================================================================================= ;

* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* note discounting is from start of intervention - no adjustment needed;


%let year_start_disc=2023;
discount_3py = 1/(1.03**(cald-&year_start_disc)); if cald lt 2023 then discount_3py=1; ***This is already calculated in HIV Synthesis;
discount_5py = 1/(1.05**(cald-&year_start_disc));if cald lt 2023 then discount_5py=1;
discount_10py = 1/(1.10**(cald-&year_start_disc));if cald lt 2023 then discount_10py=1;
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;

***remove ab


* ================================================================================= ;

* dalys and life years;

* ================================================================================= ;

s_ddaly = s_dead_ddaly + s_live_ddaly;

***Scaling up to annual discounted DALYs in the whole population;
ddaly = s_ddaly * &sf * 4;


***These are additional potential DALYs to include which have not so far been included;

ddaly_mtct = s_ddaly_mtct * &sf * 4;  ***Crude estimate of number of DALYs incurred in a child born with HIV;


* ================================================================================= ;

* costs ;

* ================================================================================= ;
* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 

***These are scaled up discounted costs;
dzdv_cost = s_dcost_zdv * &sf * 4 / 1000;
dten_cost = s_dcost_ten * &sf * 4 / 1000;
d3tc_cost = s_dcost_3tc * &sf * 4 / 1000; 
dnev_cost = s_dcost_nev * &sf * 4 / 1000;
dlpr_cost = s_dcost_lpr * &sf * 4 / 1000;
ddar_cost = s_dcost_dar * &sf * 4 / 1000;
dtaz_cost = s_dcost_taz * &sf * 4 / 1000;
defa_cost = s_dcost_efa * &sf * 4 / 1000;
ddol_cost = s_dcost_dol * &sf * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_prep_oral=. then s_dcost_prep_oral=0;
if s_dcost_prep_inj=. then s_dcost_prep_inj=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

***Vaginal ring cost will also needed to be added here when used in HIV Synthesis;
s_dcost_prep = s_dcost_prep_oral + s_dcost_prep_inj;
s_dcost_prep_visit = s_dcost_prep_visit_oral + s_dcost_prep_visit_inj;

dvis_cost = s_dvis_cost * &sf * 4 / 1000;
dart_cost = s_dart_cost * &sf * 4 / 1000; ***This should be the same as dart_cost_y below (and is not used);
dvl_cost = s_dvl_cost * &sf * 4 / 1000;
dcd4_cost = s_dcd4_cost * &sf * 4 / 1000;
dadc_cost = s_dadc_cost * &sf * 4 / 1000;
dnon_tb_who3_cost = s_dnon_tb_who3_cost * &sf * 4 / 1000;
dtb_cost = s_dtb_cost * &sf * 4 / 1000;
dtest_cost = s_dtest_cost * &sf * 4 / 1000;
dtest_cost_sw = s_dcost_test_f_sw * &sf * 4 / 1000;
dcot_cost = s_dcot_cost * &sf * 4 / 1000;
dres_cost = s_dres_cost * &sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * &sf * 4 / 1000;  
dcost_prep = s_dcost_prep * &sf * 4 / 1000; 
dcost_prep_inj = s_dcost_prep_inj * &sf * 4 / 1000; 
dcost_prep_oral = s_dcost_prep_oral * &sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * &sf * 4 / 1000; 	
dcost_prep_visit_inj  = s_dcost_prep_visit_inj * &sf * 4 / 1000; 	
dcost_prep_visit_oral  = s_dcost_prep_visit_oral * &sf * 4 / 1000; 	 
dcost_prep_ac_adh = s_dcost_prep_ac_adh * &sf * 4 / 1000; ***PrEP cost taking into account adherence to PrEP;
dcost_sw_program = s_dcost_sw_program  * &sf * 4 / 1000; 

dcost_avail_self_test = s_dcost_avail_self_test * &sf * 4 / 1000; ***not correctly calculated in sum statement;
dcost_avail_self_test = s_cost_avail_self_test * &sf * 4  * &discount / 1000; 

dfullvis_cost = s_dfull_vis_cost * &sf * 4 / 1000;
dcost_circ = s_dcost_circ * &sf * 4 / 1000; 

*dcost_condom_dn = s_dcost_condom_dn * &sf * 4 / 1000; ***not correctly calculated in sum statement;
dcost_condom_dn = s_cost_condom_dn * &sf * 4 * &discount / 1000;

dswitchline_cost = s_dcost_switch_line * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * &sf * 4 / 1000; 

dclin_cost = dadc_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost;

dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

***Assuming a cost of $150 per SW (Email from Frances and Primrose 15may24 - SW program costs $8.5m and reaches 40,000 SW=$212.50/SW. These analyses are across SSA and expect running costs to 
reduce if more SW are reached so assume $150). 
This will be used to determine factors of CE;


if option ge 1 then do;
cost_sw_prog150perSW=0.00015;
s_cost_sw_prog150perSW=0.00015*s_sw_1549;
dcost_sw_prog150perSW = s_cost_sw_prog150perSW * &discount *&sf;
end;

if option=0 then dcost_sw_prog150perSW=0;

***The below method wasn't used in the final analyses;
**Trial and error - at what cost could a SW program be CE?;
if option ge 1 then do;
s_cost_sw_program19=19;*19m;
s_cost_sw_program10=10;
s_cost_sw_program15=15;
s_cost_sw_program20=20;
s_cost_sw_program25=25;
s_cost_sw_program30=30;
s_cost_sw_program35=35;
s_cost_sw_program40=40;
s_cost_sw_program45=45;
s_cost_sw_program50=50;
s_cost_sw_program55=55;
s_cost_sw_program60=60;
s_cost_sw_program65=65;
s_cost_sw_program70=70;
s_cost_sw_program75=75;
s_cost_sw_program80=80;
s_cost_sw_program85=85;
s_cost_sw_program90=90;
s_cost_sw_program95=95;
s_cost_sw_program100=100;
s_cost_sw_program105=105;
s_cost_sw_program110=110;
s_cost_sw_program115=115;
s_cost_sw_program120=120;
s_cost_sw_program125=125;
s_cost_sw_program130=130;
s_cost_sw_program135=135;
s_cost_sw_program140=140;
s_cost_sw_program145=145;
s_cost_sw_program150=150;
s_cost_sw_program155=155;
s_cost_sw_program160=160;
s_cost_sw_program165=165;
s_cost_sw_program170=170;
s_cost_sw_program175=175;
s_cost_sw_program180=180;
s_cost_sw_program185=185;
s_cost_sw_program190=190;
s_cost_sw_program195=195;
s_cost_sw_program200=200;
s_cost_sw_program205=205;
s_cost_sw_program210=210;
s_cost_sw_program215=215;
s_cost_sw_program220=220;
s_cost_sw_program225=225;
s_cost_sw_program230=230;
s_cost_sw_program235=235;
s_cost_sw_program240=240;
s_cost_sw_program245=245;
s_cost_sw_program250=250;

dcost_sw_program19_= s_cost_sw_program19 * &discount;
dcost_sw_program10_= s_cost_sw_program10 * &discount;
dcost_sw_program15_= s_cost_sw_program15 * &discount;
dcost_sw_program20_= s_cost_sw_program20 * &discount;
dcost_sw_program25_= s_cost_sw_program25 * &discount;
dcost_sw_program30_= s_cost_sw_program30 * &discount;
dcost_sw_program35_= s_cost_sw_program35 * &discount;
dcost_sw_program40_= s_cost_sw_program40 * &discount;
dcost_sw_program45_= s_cost_sw_program45 * &discount;
dcost_sw_program50_= s_cost_sw_program50 * &discount;
dcost_sw_program55_= s_cost_sw_program55 * &discount;
dcost_sw_program60_= s_cost_sw_program60 * &discount;
dcost_sw_program65_= s_cost_sw_program65 * &discount;
dcost_sw_program70_= s_cost_sw_program70 * &discount;
dcost_sw_program75_= s_cost_sw_program75 * &discount;
dcost_sw_program80_= s_cost_sw_program80 * &discount;
dcost_sw_program85_= s_cost_sw_program85 * &discount;
dcost_sw_program90_= s_cost_sw_program90 * &discount;
dcost_sw_program95_= s_cost_sw_program95 * &discount;
dcost_sw_program100_= s_cost_sw_program100 * &discount;
dcost_sw_program105_= s_cost_sw_program105 * &discount;
dcost_sw_program110_= s_cost_sw_program110 * &discount;
dcost_sw_program115_= s_cost_sw_program115 * &discount;
dcost_sw_program120_= s_cost_sw_program120 * &discount;
dcost_sw_program125_= s_cost_sw_program125 * &discount;
dcost_sw_program130_= s_cost_sw_program130 * &discount;
dcost_sw_program135_= s_cost_sw_program135 * &discount;
dcost_sw_program140_= s_cost_sw_program140 * &discount;
dcost_sw_program145_= s_cost_sw_program145 * &discount;
dcost_sw_program150_= s_cost_sw_program150 * &discount;
dcost_sw_program155_= s_cost_sw_program155 * &discount;
dcost_sw_program160_= s_cost_sw_program160 * &discount;
dcost_sw_program165_= s_cost_sw_program165 * &discount;
dcost_sw_program170_= s_cost_sw_program170 * &discount;
dcost_sw_program175_= s_cost_sw_program175 * &discount;
dcost_sw_program180_= s_cost_sw_program180 * &discount;
dcost_sw_program185_= s_cost_sw_program185 * &discount;
dcost_sw_program190_= s_cost_sw_program190 * &discount;
dcost_sw_program195_= s_cost_sw_program195 * &discount;
dcost_sw_program200_= s_cost_sw_program200 * &discount;
dcost_sw_program205_= s_cost_sw_program205 * &discount;
dcost_sw_program210_= s_cost_sw_program210 * &discount;
dcost_sw_program215_= s_cost_sw_program215 * &discount;
dcost_sw_program220_= s_cost_sw_program220 * &discount;
dcost_sw_program225_= s_cost_sw_program225 * &discount;
dcost_sw_program230_= s_cost_sw_program230 * &discount;
dcost_sw_program235_= s_cost_sw_program235 * &discount;
dcost_sw_program240_= s_cost_sw_program240 * &discount;
dcost_sw_program245_= s_cost_sw_program245 * &discount;
dcost_sw_program250_= s_cost_sw_program250 * &discount;
end;


if option=0 then do;
s_cost_sw_program19=0;dcost_sw_program19_=0;*19m;
s_cost_sw_program10=0;dcost_sw_program10_=0;
s_cost_sw_program15=0;dcost_sw_program15_=0;
s_cost_sw_program20=0;dcost_sw_program20_=0;
s_cost_sw_program25=0;dcost_sw_program25_=0;
s_cost_sw_program30=0;dcost_sw_program30_=0;
s_cost_sw_program35=0;dcost_sw_program35_=0;
s_cost_sw_program40=0;dcost_sw_program40_=0;
s_cost_sw_program45=0;dcost_sw_program45_=0;
s_cost_sw_program50=0;dcost_sw_program50_=0;
s_cost_sw_program55=0;dcost_sw_program55_=0;
s_cost_sw_program60=0;dcost_sw_program60_=0;
s_cost_sw_program65=0;dcost_sw_program65_=0;
s_cost_sw_program70=0;dcost_sw_program70_=0;
s_cost_sw_program75=0;dcost_sw_program75_=0;
s_cost_sw_program80=0;dcost_sw_program80_=0;
s_cost_sw_program85=0;dcost_sw_program85_=0;
s_cost_sw_program90=0;dcost_sw_program90_=0;
s_cost_sw_program95=0;dcost_sw_program95_=0;
s_cost_sw_program100=0;dcost_sw_program100_=0;
s_cost_sw_program105=0;dcost_sw_program105_=0;
s_cost_sw_program110=0;dcost_sw_program110_=0;
s_cost_sw_program115=0;dcost_sw_program115_=0;
s_cost_sw_program120=0;dcost_sw_program120_=0;
s_cost_sw_program125=0;dcost_sw_program125_=0;
s_cost_sw_program130=0;dcost_sw_program130_=0;
s_cost_sw_program135=0;dcost_sw_program135_=0;
s_cost_sw_program140=0;dcost_sw_program140_=0;
s_cost_sw_program145=0;dcost_sw_program145_=0;
s_cost_sw_program150=0;dcost_sw_program150_=0;
s_cost_sw_program155=0;dcost_sw_program155_=0;
s_cost_sw_program160=0;dcost_sw_program160_=0;
s_cost_sw_program165=0;dcost_sw_program165_=0;
s_cost_sw_program170=0;dcost_sw_program170_=0;
s_cost_sw_program175=0;dcost_sw_program175_=0;
s_cost_sw_program180=0;dcost_sw_program180_=0;
s_cost_sw_program185=0;dcost_sw_program185_=0;
s_cost_sw_program190=0;dcost_sw_program190_=0;
s_cost_sw_program195=0;dcost_sw_program195_=0;
s_cost_sw_program200=0;dcost_sw_program200_=0;
s_cost_sw_program205=0;dcost_sw_program205_=0;
s_cost_sw_program210=0;dcost_sw_program210_=0;
s_cost_sw_program215=0;dcost_sw_program215_=0;
s_cost_sw_program220=0;dcost_sw_program220_=0;
s_cost_sw_program225=0;dcost_sw_program225_=0;
s_cost_sw_program230=0;dcost_sw_program230_=0;
s_cost_sw_program235=0;dcost_sw_program235_=0;
s_cost_sw_program240=0;dcost_sw_program240_=0;
s_cost_sw_program245=0;dcost_sw_program245_=0;
s_cost_sw_program250=0;dcost_sw_program250_=0;
end;

***Will need to add the cost of VG when included in HIV Synthesis;
dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj /*+ 
		dcost_sw_program*/;

dcost_withSWprog = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_prog150perSW;



***The below method isn't used for the final paper;
dcost19_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program19_;

dcost10_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program10_;

dcost15_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program15_;

dcost20_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program20_;

dcost25_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program25_;

dcost30_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program30_;

dcost35_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program35_;

dcost40_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ  + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program40_;

dcost45_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program45_;

dcost50_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program50_;

dcost55_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program55_;

dcost60_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program60_;

dcost65_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program65_;

dcost70_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program70_;

dcost75_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program75_;

dcost80_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program80_;

dcost85_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program85_;

dcost90_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program90_;

dcost95_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program95_;

dcost100_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program100_;

dcost105_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program105_;

dcost110_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program110_;

dcost115_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ  + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program115_;

dcost120_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program120_;

dcost125_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program125_;

dcost130_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program130_;

dcost135_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program135_;

dcost140_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program140_;

dcost145_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program145_;

dcost150_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program150_;

dcost155_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program155_;

dcost160_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program160_;

dcost165_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program165_;

dcost170_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program170_;

dcost175_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program175_;

dcost180_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program180_;

dcost185_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program185_;

dcost190_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ  + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program190_;

dcost195_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program195_;

dcost200_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program200_;

dcost205_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program205_;

dcost210_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program210_;

dcost215_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program215_;

dcost220_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program220_;

dcost225_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program225_;

dcost230_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program230_;

dcost235_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program235_;

dcost240_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program240_;

dcost245_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program245_;

dcost250_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj +
		dcost_sw_program250_;


dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost +
				  dres_cost + d_t_adh_int_cost + dswitchline_cost; 

***This reverses the discount (if needed);
cost_clin_care = dcost_clin_care / &discount;

cost = dcost / &discount;

/*
run;

data y1;
set y;

***undiscounted prep costs have not been outputted so remove all prep costs from total costs for comparison;

if option=1 then delete;

***undiscounted costs;
test_cost_sw = s_cost_test_f_sw * &sf * 4 / 1000;

art_cost = s_art_cost * &sf * 4 / 1000;
adc_cost = s_adc_cost * &sf * 4 / 1000;
cd4_cost = s_cd4_cost * &sf * 4 / 1000;
vl_cost = s_vl_cost * &sf * 4 / 1000;
vis_cost = s_vis_cost * &sf * 4 / 1000;
non_tb_who3_cost = s_non_tb_who3_cost * &sf * 4 / 1000;
cot_cost = s_cot_cost * &sf * 4 / 1000;
tb_cost = s_tb_cost * &sf * 4 / 1000;
res_cost = s_res_cost * &sf * 4 / 1000;
test_cost = s_cost_test * &sf * 4 / 1000;
t_adh_int_cost = s_t_adh_int_cost * &sf * 4 / 1000;
switchline_cost = s_cost_switch_line * &sf * 4 / 1000;
cost_drug_level_test = s_drug_level_test_cost * &sf * 4 / 1000;
cost_circ = s_cost_circ * &sf * 4 / 1000;
cost_condom_dn = s_cost_condom_dn * &sf * 4 / 1000;
cost_avail_self_test = s_cost_avail_self_test * &sf * 4 / 1000;

dcost45_=.;

dcost45_ = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_sw_program45_;
 
cost45_ = art_cost + adc_cost + cd4_cost + vl_cost + vis_cost + non_tb_who3_cost + cot_cost + tb_cost + res_cost +
		test_cost + t_adh_int_cost + switchline_cost + cost_drug_level_test + cost_circ + cost_condom_dn +
		+ cost_avail_self_test + s_cost_sw_program45;

proc sort;by option cald;run;
proc means;var cost45_ dcost45_ s_cost_sw_program45 dcost_sw_program45_ test_cost dtest_cost test_cost_sw dtest_cost_sw
art_cost dart_cost adc_cost dadc_cost cd4_cost dcd4_cost vl_cost dvl_cost vis_cost dvis_cost non_tb_who3_cost dnon_tb_who3_cost
cot_cost dcot_cost tb_cost dtb_cost res_cost dres_cost test_cost dtest_cost t_adh_int_cost d_t_adh_int_cost
switchline_cost dswitchline_cost cost_drug_level_test dcost_drug_level_test cost_circ dcost_circ cost_condom_dn dcost_condom_dn
cost_avail_self_test dcost_avail_self_test ddaly;
by option cald;
output out=b mean=;run;

*Create datasets with ONLY option=0 and another with option=2;
data op0;
set b;
if option=2 then delete;
run;

data op2;
set b;
if option=0 then delete;
run;

*rename the variables in option=2 ready for merge;
proc sql noprint;
select cats(name,"=",name,"_2") 
into :rename_vars separated by " "
from dictionary.columns
where libname="WORK" and memname="OP2";
quit; 

%PUT &rename_vars.;

data op2a;
set WORK.OP2 (rename=(&rename_vars.));
run;

data op2b;
set op2a;
rename cald_2=cald;run;

data all;
merge op0 op2b;by cald;run;

data icer;
set all;

proc means;var dcost45_ dcost45__2 ddaly ddaly_2;where cald ge 2023;run;
*icer=546;

*/
* ================================================================================= ;


s_diag_1564_ = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_m1564_ = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_w1564_ = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 


***general population;
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

* n_tested;						n_tested = s_tested * sf_2023 * 4;

n_tested_m = s_tested_m * sf_2023 * 4;
n_tested_m_sympt = s_tested_m_sympt * sf_2023 * 4;
n_tested_m_circ = s_tested_m_circ * sf_2023 * 4;
n_tested_f = s_tested_f * sf_2023 * 4;
n_tested_f_anc = s_tested_f_anc * sf_2023 * 4;
n_tested_f_sympt = s_tested_f_sympt * sf_2023 * 4;
n_tested_f_non_anc = s_tested_f_non_anc * sf_2023 * 4;
n_tested_at_return = s_tested_at_return * sf_2023 * 4;
n_pregnant = s_pregnant * sf_2023 * 4;

***FSW;
* n_sw_1549;					n_sw_1549_ = s_sw_1549 * sf_2023;
* n_sw_1564;					n_sw_1564_ = s_sw_1564 * sf_2023;


* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_1519_sw;				if s_ageg1519w gt 0 then  p_fsw1519_ = s_sw_1519 / s_ageg1519w;
* prop_w_2024_sw;				if s_ageg2024w gt 0 then  p_fsw2024_ = s_sw_2024 / s_ageg2024w;
* prop_w_2529_sw;				if s_ageg2529w gt 0 then  p_fsw2529_ = s_sw_2529 / s_ageg2529w;
* prop_w_3039_sw;				if s_ageg3034w gt 0 then  p_fsw3039_ = s_sw_3039 / (s_ageg3034w + s_ageg3539w);

* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ; 

**Of FSW, proportion in each age category;
								if s_sw_1564 gt 0 then do; 
* p_sw_age1519_;					p_sw_age1519_=s_sw_1519/s_sw_1564;
* p_sw_age2024_;					p_sw_age2024_=s_sw_2024/s_sw_1564;
* p_sw_age2529_;					p_sw_age2529_=s_sw_2529/s_sw_1564;
* p_sw_age3039_;					p_sw_age3039_=s_sw_3039/s_sw_1564;
								end;

* p_age_deb_sw1519_;			p_age_deb_sw1519_ = s_age_deb_sw1519_ /s_sw_1564;
* p_age_deb_sw2024_;			p_age_deb_sw2024_ = s_age_deb_sw2024_ /s_sw_1564;
* p_age_deb_sw2529_;			p_age_deb_sw2529_ = s_age_deb_sw2529_ /s_sw_1564;
* p_age_deb_sw3039_;			p_age_deb_sw3039_ = s_age_deb_sw3039_ /s_sw_1564;

* sw_episodes;					sw_episodes = s_episodes_sw/s_ever_sw;
* p_sw_gt1ep;					p_sw_gt1ep   = s_sw_gt1ep     / s_ever_sw;

* duration of sw;				tot_dur_sw= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw= s_act_dur_sw/ s_sw_1564;

								if s_sw_1564 ne 0 then do;
								p_actdur_0to3_   =s_actdur_sw_0to3/s_sw_1564;
								p_actdur_3to5_   =s_actdur_sw_3to5/s_sw_1564;
								p_actdur_6to9_   =s_actdur_sw_6to9/s_sw_1564;
								p_actdur_10to19_ =s_actdur_sw_10to19/s_sw_1564;

								p_totdur_0to3_   =s_totdur_sw_0to3/s_sw_1564;
								p_totdur_3to5_   =s_totdur_sw_3to5/s_sw_1564;
								p_totdur_6to9_   =s_totdur_sw_6to9/s_sw_1564;
								p_totdur_10to19_ =s_totdur_sw_10to19/s_sw_1564;
								end;

* p_fsw_newp0;					if s_sw_1564>0 then p_fsw_newp0_ = s_sw_newp_cat1 /s_sw_1564;
* p_fsw_newp1to5;				if s_sw_1564>0 then p_fsw_newp1to5_ = s_sw_newp_cat2 /s_sw_1564;
* p_fsw_newp6to40;				if s_sw_1564>0 then p_fsw_newp6to40_ = s_sw_newp_cat3 /s_sw_1564;
* p_fsw_newp41to130;			if s_sw_1564>0 then p_fsw_newp41to130_ = s_sw_newp_cat4 /s_sw_1564;
* p_fsw_newpov130;				if s_sw_1564>0 then p_fsw_newpov130_ = s_sw_newp_cat5 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp = s_sw_newp/s_sw_1564;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;

* p_sw_prog_vis;				if s_sw_1564 gt 0 then p_sw_prog_vis = s_sw_program_visit / s_sw_1564 ;

* n_tested_sw;					n_tested_sw = s_tested_sw * sf_2023 * 4;
* p_tested_past_year_sw;		if s_sw_1564 - s_diag_sw > 0 then p_tested_past_year_sw = s_tested_4p_sw /  (s_sw_1564 - s_diag_sw) ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw = s_hiv_sw1549_ / s_sw_1549; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw =(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

*sti;							p_sti_sw = s_sti_sw/s_sw_1564;

* linked_diag_sw;				if s_diag_thisper_sw>0 then p_linked_diag_sw = s_linked_diag_sw/s_diag_thisper_sw;

/*
***Small number of FSW so take averages across 4 periods;

**The �lag� function takes the previous value of incidence_sw etc., lag2 takes 2 values before and so on;
lag1_n1549_sw=lag(n_sw_1549_); lag2_n1549_sw=lag2(n_sw_1549_); lag3_n1549_sw=lag3(n_sw_1549_);
lag1_n1564_sw=lag(n_sw_1564_); lag2_n1564_sw=lag2(n_sw_1564_); lag3_n1564_sw=lag3(n_sw_1564_);
lag1_p1549_sw=lag(prop_w_1549_sw); lag2_p1549_sw=lag2(prop_w_1549_sw); lag3_p1549_sw=lag3(prop_w_1549_sw);
lag1_p1564_sw=lag(prop_w_1564_sw); lag2_p1564_sw=lag2(prop_w_1564_sw); lag3_p1564_sw=lag3(prop_w_1564_sw);
lag1_p_ever_sw=lag(prop_w_ever_sw); lag2_p_ever_sw=lag(prop_w_ever_sw); lag3_p_ever_sw=lag(prop_w_ever_sw);

lag1_p1519_sw=lag(p_fsw1519_); lag2_p1519_sw=lag2(p_fsw1519_); lag3_p1519_sw=lag3(p_fsw1519_);
lag1_p2024_sw=lag(p_fsw2024_); lag2_p2024_sw=lag2(p_fsw2024_); lag3_p2024_sw=lag3(p_fsw2024_);
lag1_p2529_sw=lag(p_fsw2529_); lag2_p2529_sw=lag2(p_fsw2529_); lag3_p2529_sw=lag3(p_fsw2529_);
lag1_p3039_sw=lag(p_fsw3039_); lag2_p3039_sw=lag2(p_fsw3039_); lag3_p3039_sw=lag3(p_fsw3039_);

lag1_ep_sw=lag(sw_episodes); lag2_ep_sw=lag2(sw_episodes); lag3_ep_sw=lag3(sw_episodes);
lag1_ep_gt1_sw=lag(p_sw_gt1ep); lag2_ep_gt1_sw=lag2(p_sw_gt1ep); lag3_ep_gt1_sw=lag3(p_sw_gt1ep);

lag1_totdur_sw=lag(tot_dur_sw); lag2_totdur_sw=lag2(tot_dur_sw); lag3_totdur_sw=lag3(tot_dur_sw);
lag1_actdur_sw=lag(act_dur_sw); lag2_actdur_sw=lag2(act_dur_sw); lag3_actdur_sw=lag3(act_dur_sw);

lag1_p_actdur03_sw=lag(p_actdur_0to3_); lag2_p_actdur03_sw=lag2(p_actdur_0to3_); lag3_p_actdur03_sw=lag3(p_actdur_0to3_);
lag1_p_actdur35_sw=lag(p_actdur_3to5_); lag2_p_actdur35_sw=lag2(p_actdur_3to5_); lag3_p_actdur35_sw=lag3(p_actdur_3to5_);
lag1_p_actdur69_sw=lag(p_actdur_6to9_); lag2_p_actdur69_sw=lag2(p_actdur_6to9_); lag3_p_actdur69_sw=lag3(p_actdur_6to9_);
lag1_p_actdur1019_sw=lag(p_actdur_10to19_); lag2_p_actdur1019_sw=lag2(p_actdur_10to19_); lag3_p_actdur1019_sw=lag3(p_actdur_10to19_);
lag1_p_totdur03_sw=lag(p_totdur_0to3_); lag2_p_totdur03_sw=lag2(p_totdur_0to3_); lag3_p_totdur03_sw=lag3(p_totdur_0to3_);
lag1_p_totdur35_sw=lag(p_totdur_3to5_); lag2_p_totdur35_sw=lag2(p_totdur_3to5_); lag3_p_totdur35_sw=lag3(p_totdur_3to5_);
lag1_p_totdur69_sw=lag(p_totdur_6to9_); lag2_p_totdur69_sw=lag2(p_totdur_6to9_); lag3_p_totdur69_sw=lag3(p_totdur_6to9_);
lag1_p_totdur1019_sw=lag(p_totdur_10to19_); lag2_p_totdur1019_sw=lag2(p_totdur_10to19_); lag3_p_totdur1019_sw=lag3(p_totdur_10to19_);

lag1_p_newp0_sw=lag(p_fsw_newp0_); lag2_p_newp0_sw=lag2(p_fsw_newp0_); lag3_p_newp0_sw=lag3(p_fsw_newp0_);
lag1_p_av_newp_sw=lag(av_sw_newp); lag2_p_av_newp_sw=lag2(av_sw_newp); lag3_p_av_newp_sw=lag3(av_sw_newp);

lag1_p_sw_prog_vis=lag(p_sw_prog_vis); lag2_p_sw_prog_vis=lag2(p_sw_prog_vis); lag3_p_sw_prog_vis=lag3(p_sw_prog_vis);

lag1_n_tested_sw=lag(n_tested_sw); lag2_n_tested_sw=lag2(n_tested_sw); lag3_n_tested_sw=lag3(n_tested_sw);
lag1_p_tested_py_sw=lag(p_tested_past_year_sw); lag2_p_tested_py_sw=lag2(p_tested_past_year_sw); lag3_p_tested_py_sw=lag3(p_tested_past_year_sw);
lag1_p_onprep_sw=lag(prop_sw_onprep); lag2_p_onprep_sw=lag2(prop_sw_onprep); lag3_p_onprep_sw=lag3(prop_sw_onprep);

lag1_p_diag_sw=lag(p_diag_sw); lag2_p_diag_sw=lag2(p_diag_sw); lag3_p_diag_sw=lag3(p_diag_sw);
lag1_p_onart_diag_sw=lag(p_onart_diag_sw); lag2_p_onart_diag_sw=lag2(p_onart_diag_sw); lag3_p_onart_diag_sw=lag3(p_onart_diag_sw);
lag1_p_onart_vl1000_sw=lag(p_onart_vl1000_sw); lag2_p_onart_vl1000_sw=lag2(p_onart_vl1000_sw); lag3_p_onart_vl1000_sw=lag3(p_onart_vl1000_sw);

lag1_prev_sw=lag(prevalence_sw); lag2_prev_sw=lag2(prevalence_sw); lag3_prev_sw=lag3(prevalence_sw);
lag1_inc_sw=lag(incidence_sw); lag2_inc_sw=lag2(incidence_sw); lag3_inc_sw=lag3(incidence_sw);

lag1_p_sti_sw=lag(p_sti_sw); lag2_p_sti_sw=lag2(p_sti_sw); lag3_p_sti_sw=lag3(p_sti_sw);


**Now will have 4 columns per period � incidence_sw, lag1_inc_sw, lag2_inc_sw, lag3_inc_sw. Keep rows for each calendar year (rather than period); 
if cald=int(cald) then cald_yr=cald; *cald_yr is 2000,2001,2002 etc;

**Calculate mean across the 4 rows for cald_yr;
if cald_yr ne . then do;
	mean_incidence_sw =(incidence_sw + lag1_inc_sw + lag2_inc_sw + lag3_inc_sw)/4;
	mean_n_sw_1549_ = (n_sw_1549_ + lag1_n1549_sw + lag2_n1549_sw + lag3_n1549_sw)/4;
	mean_n_sw_1564_ = (n_sw_1564_ + lag1_n1564_sw + lag2_n1564_sw + lag3_n1564_sw)/4;
	mean_prop_w_1549_sw = (prop_w_1549_sw + lag1_p1549_sw + lag2_p1549_sw + lag3_p1549_sw)/4;
	mean_prop_w_1564_sw = (prop_w_1564_sw + lag1_p1564_sw + lag2_p1564_sw + lag3_p1549_sw)/4;
	mean_prop_w_ever_sw = (prop_w_ever_sw + lag1_p_ever_sw + lag2_p_ever_sw + lag3_p_ever_sw)/4; 

	mean_p_sw_age1519_ = (p_sw_age1519_ + lag1_p1519_sw + lag2_p1519_sw + lag3_p1519_sw)/4;
	mean_p_sw_age2024_ = (p_sw_age2024_ + lag1_p2024_sw + lag2_p2024_sw + lag3_p2024_sw)/4;
	mean_p_sw_age2529_ = (p_sw_age2529_ + lag1_p2529_sw + lag2_p2529_sw + lag3_p2529_sw)/4;
	mean_p_sw_age3039_ = (p_sw_age3039_ + lag1_p3039_sw + lag2_p3039_sw + lag3_p3039_sw)/4;

	mean_sw_episodes = (sw_episodes + lag1_ep_sw + lag2_ep_sw + lag3_ep_sw)/4;
	mean_p_sw_gt1ep = (p_sw_gt1ep + lag1_ep_gt1_sw + lag2_ep_gt1_sw + lag3_ep_gt1_sw)/4;

	mean_tot_dur_sw = (tot_dur_sw + lag1_totdur_sw+ lag2_totdur_sw + lag3_totdur_sw)/4;
	mean_act_dur_sw = (act_dur_sw + lag1_actdur_sw+ lag2_actdur_sw + lag3_actdur_sw)/4;
	mean_p_actdur_0to3_ = (p_actdur_0to3_ + lag1_p_actdur03_sw + lag2_p_actdur03_sw + lag3_p_actdur03_sw)/4;
	mean_p_actdur_3to5_ = (p_actdur_3to5_ + lag1_p_actdur35_sw + lag2_p_actdur35_sw + lag3_p_actdur35_sw)/4;
	mean_p_actdur_6to9_ = (p_actdur_6to9_ + lag1_p_actdur69_sw + lag2_p_actdur69_sw + lag3_p_actdur69_sw)/4;
	mean_p_actdur_10to19_ = (p_actdur_10to19_ + lag1_p_actdur1019_sw + lag2_p_actdur1019_sw + lag3_p_actdur1019_sw)/4;
	mean_p_totdur_0to3_ = (p_totdur_0to3_ + lag1_p_totdur03_sw + lag2_p_totdur03_sw + lag3_p_totdur03_sw)/4;
	mean_p_totdur_3to5_ = (p_totdur_3to5_ + lag1_p_totdur35_sw + lag2_p_totdur35_sw + lag3_p_totdur35_sw)/4;
	mean_p_totdur_6to9_ = (p_totdur_6to9_ + lag1_p_totdur69_sw + lag2_p_totdur69_sw + lag3_p_totdur69_sw)/4;
	mean_p_totdur_10to19_ = (p_totdur_10to19_ + lag1_p_totdur1019_sw + lag2_p_totdur1019_sw + lag3_p_totdur1019_sw)/4;

	mean_p_fsw_newp0_ = (p_fsw_newp0_ + lag1_p_newp0_sw + lag2_p_newp0_sw + lag3_p_newp0_sw)/4;
	mean_av_sw_newp = (av_sw_newp + lag1_p_av_newp_sw + lag2_p_av_newp_sw + lag3_p_av_newp_sw)/4;
	mean_p_sw_prog_vis = (p_sw_prog_vis + lag1_p_sw_prog_vis + lag2_p_sw_prog_vis + lag3_p_sw_prog_vis)/4;
	mean_n_tested_sw = (n_tested_sw + lag1_n_tested_sw + lag2_n_tested_sw + lag3_n_tested_sw)/4;
	mean_p_tested_past_year_sw = (p_tested_past_year_sw + lag1_p_tested_py_sw + lag2_p_tested_py_sw + lag3_p_tested_py_sw)/4;
	mean_prop_sw_onprep = (prop_sw_onprep + lag1_p_onprep_sw + lag2_p_onprep_sw + lag3_p_onprep_sw)/4;

	mean_p_diag_sw = (p_diag_sw + lag1_p_diag_sw + lag2_p_diag_sw + lag3_p_diag_sw)/4;
	mean_p_onart_diag_sw = (p_onart_diag_sw + lag1_p_onart_diag_sw + lag2_p_onart_diag_sw + lag3_p_onart_diag_sw)/4;
	mean_p_onart_vl1000_sw = (p_onart_vl1000_sw + lag1_p_onart_vl1000_sw + lag2_p_onart_vl1000_sw + lag3_p_onart_vl1000_sw)/4;

	mean_prevalence_sw = (prevalence_sw + lag1_prev_sw + lag2_prev_sw + lag3_prev_sw)/4;
	mean_incidence_sw = (incidence_sw + lag1_inc_sw + lag2_inc_sw + lag3_inc_sw)/4;
	mean_p_sti_sw = (p_sti_sw + lag1_p_sti_sw + lag2_p_sti_sw + lag3_p_sti_sw)/4;
end;
*/

keep run option cald 
prevalence1549m 	 prevalence1549w 	prevalence1549 		incidence1549 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000 			p_vl1000 			prevalence_vg1000
n_tested
n_tested_m
n_tested_m_sympt
n_tested_m_circ
n_tested_f
n_tested_f_anc
n_tested_f_sympt
n_tested_f_non_anc
n_tested_at_return
/*
mean_n_sw_1564_  	 	 mean_n_sw_1549_ 	 	mean_prop_w_1564_sw		mean_prop_w_1549_sw 	 	mean_prop_w_ever_sw  
mean_p_sw_age1519_	  	 mean_p_sw_age2024_	  	mean_p_sw_age2529_ 		mean_p_sw_age3039_
mean_sw_episodes 	  	 mean_p_sw_gt1ep
mean_p_fsw_newp0_   	 mean_av_sw_newp	 		 
mean_tot_dur_sw  		 mean_act_dur_sw  	 
mean_p_actdur_0to3_  	 mean_p_actdur_3to5_    mean_p_actdur_6to9_  	mean_p_actdur_10to19_ 
mean_p_totdur_0to3_  	 mean_p_totdur_3to5_    mean_p_totdur_6to9_  	mean_p_totdur_10to19_ 
mean_p_sw_prog_vis		 mean_n_tested_sw	    mean_prop_sw_onprep		mean_prevalence_sw	  	mean_incidence_sw
mean_p_diag_sw			 mean_p_onart_diag_sw	mean_p_onart_vl1000_sw
mean_p_sti_sw			 mean_p_tested_past_year_sw
*/

n_sw_1564_  	 	 n_sw_1549_ 	 	prop_w_1564_sw		prop_w_1549_sw 	 	prop_w_ever_sw  
p_fsw1519_	  		 p_fsw2024_		  	p_fsw2529_			p_fsw3039_	
p_sw_age1519_	  	 p_sw_age2024_	  	p_sw_age2529_ 		p_sw_age3039_
p_age_deb_sw1519_  	 p_age_deb_sw2024_  p_age_deb_sw2529_   p_age_deb_sw3039_
sw_episodes 	  	 p_sw_gt1ep
p_fsw_newp0_   	 	 p_fsw_newp1to5_    p_fsw_newp6to40_  	p_fsw_newp41to130_  p_fsw_newpov130_
av_sw_newp	 		 p_newp_sw
tot_dur_sw  		 act_dur_sw  	 
p_actdur_0to3_  	 p_actdur_3to5_     p_actdur_6to9_  	p_actdur_10to19_ 
p_totdur_0to3_  	 p_totdur_3to5_     p_totdur_6to9_  	p_totdur_10to19_ 
p_sw_prog_vis		 n_tested_sw	    prop_sw_onprep		prevalence_sw	  	incidence_sw
p_diag_sw			 p_onart_diag_sw	p_onart_vl1000_sw
p_sti_sw			 p_tested_past_year_sw

/*Sampled parameters*/
sw_art_disadv	sw_program	effect_sw_prog_newp		effect_sw_prog_6mtest	effect_sw_prog_int	effect_sw_prog_adh
effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti		sw_trans_matrix
sw_higher_int sw_higher_prob_loss_at_diag

/*Costs*/
dcost_sw_prog150perSW  dcost_withSWprog
dcost ddaly dcost_sw_program  dcost_sw_program45_
dart_cost_y		dadc_cost  			dcd4_cost		  dvl_cost  dvis_cost	dnon_tb_who3_cost	dcot_cost 		 dtb_cost  dres_cost 
dtest_cost		d_t_adh_int_cost  	dswitchline_cost  dcost_drug_level_test dcost_circ  		dcost_condom_dn  dcost_avail_self_test 		
dcost_prep_visit_oral  				dcost_prep_oral   dcost_prep_visit_inj  dcost_prep_inj 		dtest_cost_sw
effect_sw_prog_newp
dcost19_  dcost10_ dcost15_ dcost20_ dcost25_ dcost30_ dcost35_ dcost40_  dcost45_ dcost50_ dcost55_ dcost60_ 
dcost65_  dcost70_ dcost75_ dcost80_ dcost85_ dcost90_ dcost95_ dcost100_ dcost105_ dcost110_ dcost115_ dcost120_
dcost125_ dcost130_ dcost135_ dcost140_ dcost145_  dcost150_ dcost155_ dcost160_ dcost165_ dcost170_ dcost175_ dcost180_
dcost185_ dcost190_ dcost195_ dcost200_ dcost205_  dcost210_ dcost215_ dcost220_ dcost225_ dcost230_ dcost235_ dcost240_
dcost245_ dcost250_

s_tested s_tested_m s_tested_f n_pregnant p_linked_diag_sw
;

proc sort;by run option;run;

proc freq;table p_sw_prog_vis;where option=0 and cald>2023.5;run;
proc freq;table sw_higher_int;run;
proc means n sum p50;var p_fsw_newp0_;where option=0 and sw_trans_matrix=1 and cald=2030;run;

proc freq;table dcost_sw_program;where option=0 and cald=2024;run;

proc means n p50;var 
n_tested  n_tested_m  n_tested_m_sympt  n_tested_m_circ  n_tested_f  n_tested_sw n_tested_f_anc  n_tested_f_sympt  n_tested_f_non_anc
n_tested_at_return n_pregnant; where option=0 and cald>2023;run;
proc means n p50;var 
n_tested  n_tested_m  n_tested_m_sympt  n_tested_m_circ  n_tested_f  n_tested_sw n_tested_f_anc  n_tested_f_sympt  n_tested_f_non_anc
n_tested_at_return n_pregnant; where option=2 and cald>2023;run;

proc freq;table effect_sw_prog_lossdiag;where option=2 and cald=2030;run;

proc print;var cald option effect_sw_prog_lossdiag p_onart_diag_sw;where run =346254;run;

proc means n p50 p5 p95;var dtest_cost dtest_cost_sw;where option=0 and cald>2023.5 ;run;
proc means n p50 p5 p95;var dtest_cost dtest_cost_sw;where option=2 and cald>2023.5  and effect_sw_prog_newp=0.05;run;

proc means n p50 p5 p95;var p_onart_diag_sw;where option=1 and effect_sw_prog_lossdiag=0.3 and cald=2030;run;
proc means n p50 p5 p95;var p_onart_diag_sw;where option=1 and effect_sw_prog_lossdiag=0.5 and cald=2030;run;
proc means n p50 p5 p95;var p_onart_diag_sw;where option=1 and effect_sw_prog_lossdiag=0.7 and cald=2030;run;

proc means n p50 p5 p95;var p_onart_diag_sw;where option=2 and effect_sw_prog_lossdiag=0.1 and cald=2030;run;
proc means n p50 p5 p95;var p_onart_diag_sw;where option=2 and effect_sw_prog_lossdiag=0.25 and cald=2030;run;
proc means n p50 p5 p95;var p_onart_diag_sw;where option=2 and effect_sw_prog_lossdiag=0.35 and cald=2030;run;

proc freq;table effect_sw_prog_lossdiag;where option=2;run;

data a.fsw_17_08_23_final_short; set y;run;

data y; set a.fsw_17_08_23_final_short;run;

proc means mean p5 p95;var p_sw_prog_vis;where option=0 and  2029.0 <= cald < 2030.25;;run;
/*


proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=1;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=2;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=3;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=4;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=5;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=6;run;


proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=1;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=2;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=3;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=4;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=5;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=6;run;


proc glm; class sw_trans_matrix; model p_fsw_newp0_= sw_trans_matrix/solutions;where cald=2022;run;
proc glm; class sw_trans_matrix; model incidence_sw= sw_trans_matrix/solutions;where cald=2022;run;


*/



options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

proc means  noprint data=y; var &v; output out=y_10 mean= &v._10; by run; where 2010.0 <= cald < 2011.0; 
proc means  noprint data=y; var &v; output out=y_15 mean= &v._15; by run; where 2015.0 <= cald < 2016.0; 
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run; where 2020.0 <= cald < 2021.0; 

***baseline outputs in 2022;
proc means  noprint data=y; var &v; output out=y_22 mean= &v._22; by run; where 2022.5 <= cald < 2023.5; 

***outputs in 2030 and 2072 by option;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option; where 2029.0 <= cald < 2030.25; 
proc means noprint data=y; var &v; output out=y_72 mean= &v._72; by run option; where 2022.0 <= cald < 2073; 

**Outputs for CE analyses, 5, 20 and 50 years by option;
proc means noprint data=y; var &v; output out=y_23_24 mean= &v._23_24; by run option ; where 2023.5 <= cald < 2024.50;

proc means noprint data=y; var &v; output out=y_22_27 mean= &v._22_27; by run option ; where 2023.5 <= cald < 2028.50;
proc means noprint data=y; var &v; output out=y_22_42 mean= &v._22_42; by run option ; where 2023.5 <= cald < 2043.50;
proc means noprint data=y; var &v; output out=y_22_72 mean= &v._22_72; by run option ; where 2023.5 <= cald < 2073.50;

proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run;

proc sort data=y_72; by run; proc transpose data=y_72 out=t_72 prefix=&v._72_; var &v._72; by run;

proc sort data=y_23_24; by run; proc transpose data=y_23_24 out=t_23_24 prefix=&v._23_24_; var &v._23_24; by run;
proc sort data=y_22_27; by run; proc transpose data=y_22_27 out=t_22_27 prefix=&v._22_27_; var &v._22_27; by run;
proc sort data=y_22_42; by run; proc transpose data=y_22_42 out=t_22_42 prefix=&v._22_42_; var &v._22_42; by run;
proc sort data=y_22_72; by run; proc transpose data=y_22_72 out=t_22_72 prefix=&v._22_72_; var &v._22_72; by run;

data &v ; merge y_10 y_15 y_20 y_22 t_30 t_72 t_23_24 t_22_27 t_22_42 t_22_72;  



%mend var;

%var(v=prevalence1549m);%var(v=prevalence1549w); 	%var(v=prevalence1549); 	
%var(v=incidence1549); 	%var(v=incidence1549w); 	%var(v=incidence1549m);

%var(v=p_diag);	 		%var(v=p_diag_m);	 		%var(v=p_diag_w);   		%var(v=p_onart_diag);   %var(v=p_onart_diag_w);
%var(v=p_onart_diag_m); %var(v=p_onart_vl1000);		%var(v=p_onart_vl1000_w);   %var(v=p_onart_vl1000_m);
%var(v=p_vg1000); 		%var(v=p_vl1000);			%var(v=prevalence_vg1000);  %var(v=n_tested);	  %var(v=n_tested_f);	%var(v=n_tested_m);	

%var(v=n_sw_1564_);     %var(v=n_sw_1549_);		    %var(v=prop_w_1564_sw);		%var(v=prop_w_1549_sw); %var(v=prop_w_ever_sw);  
%var(v=p_fsw1519_);	  	%var(v=p_fsw2024_);		    %var(v=p_fsw2529_);			%var(v=p_fsw3039_);	

%var(v=p_sw_age1519_);	  %var(v=p_sw_age2024_);	%var(v=p_sw_age2529_); 		%var(v=p_sw_age3039_);
%var(v=p_age_deb_sw1519_);%var(v=p_age_deb_sw2024_);%var(v=p_age_deb_sw2529_)  	%var(v=p_age_deb_sw3039_);

%var(v=sw_episodes); 	%var(v=p_sw_gt1ep);
%var(v=p_fsw_newp0_);   %var(v=p_fsw_newp1to5_);    %var(v=p_fsw_newp6to40_);  	%var(v=p_fsw_newp41to130_);%var(v=p_fsw_newpov130_);
%var(v=av_sw_newp);	 	%var(v=p_newp_sw);

%var(v=tot_dur_sw);  	%var(v=act_dur_sw);  	 
%var(v=p_actdur_0to3_); %var(v=p_actdur_3to5_);     %var(v=p_actdur_6to9_);  	%var(v=p_actdur_10to19_); 
%var(v=p_totdur_0to3_); %var(v=p_totdur_3to5_);     %var(v=p_totdur_6to9_);  	%var(v=p_totdur_10to19_); 

%var(v=p_sw_prog_vis);  %var(v=n_tested_sw);	    %var(v=p_tested_past_year_sw);
%var(v=prop_sw_onprep);	%var(v=prevalence_sw);	    %var(v=incidence_sw);
%var(v=p_diag_sw);		%var(v=p_onart_diag_sw);	%var(v=p_onart_vl1000_sw);	%var(v=p_sti_sw);
/*
%var(v=mean_n_sw_1564_);     %var(v=mean_n_sw_1549_);	%var(v=mean_prop_w_1564_sw);	%var(v=mean_prop_w_1549_sw); 
%var(v=mean_prop_w_ever_sw);  

%var(v=mean_p_sw_age1519_);	   %var(v=mean_p_sw_age2024_);	%var(v=mean_p_sw_age2529_);	%var(v=mean_p_sw_age3039_);

%var(v=mean_sw_episodes); 	%var(v=mean_p_sw_gt1ep);
%var(v=mean_p_fsw_newp0_);  %var(v=mean_av_sw_newp);

%var(v=mean_tot_dur_sw);  	 %var(v=mean_act_dur_sw);  	 
%var(v=mean_p_actdur_0to3_); %var(v=mean_p_actdur_3to5_);     %var(v=mean_p_actdur_6to9_);  	%var(v=mean_p_actdur_10to19_); 
%var(v=mean_p_totdur_0to3_); %var(v=mean_p_totdur_3to5_);     %var(v=mean_p_totdur_6to9_);  	%var(v=mean_p_totdur_10to19_); 

%var(v=mean_p_sw_prog_vis);  %var(v=mean_n_tested_sw);	    %var(v=mean_p_tested_past_year_sw);
%var(v=mean_prop_sw_onprep); %var(v=mean_prevalence_sw);	%var(v=mean_incidence_sw);
%var(v=mean_p_diag_sw);		 %var(v=mean_p_onart_diag_sw);	%var(v=mean_p_onart_vl1000_sw);	%var(v=mean_p_sti_sw);
*/
%var(v=dcost);			%var(v=ddaly);

%var(v=dcost19_);	%var(v=dcost10_);	%var(v=dcost15_);	%var(v=dcost20_);	%var(v=dcost25_);	%var(v=dcost30_);
%var(v=dcost35_);	%var(v=dcost40_);	%var(v=dcost45_);	%var(v=dcost50_);	%var(v=dcost55_);	%var(v=dcost60_);	
%var(v=dcost65_);	%var(v=dcost70_);	%var(v=dcost75_);	%var(v=dcost80_);	%var(v=dcost85_);	%var(v=dcost90_);
%var(v=dcost95_);	%var(v=dcost100_);	%var(v=dcost105_);	%var(v=dcost110_);	%var(v=dcost115_);	%var(v=dcost120_);
%var(v=dcost125_);	%var(v=dcost130_);	%var(v=dcost135_);	%var(v=dcost140_);	%var(v=dcost145_);	%var(v=dcost150_);
%var(v=dcost155_);	%var(v=dcost160_);	%var(v=dcost165_);	%var(v=dcost170_);	%var(v=dcost175_);	%var(v=dcost180_);
%var(v=dcost185_);	%var(v=dcost190_);	%var(v=dcost195_);	%var(v=dcost200_);  %var(v=dcost205_);	%var(v=dcost210_);
%var(v=dcost215_);  %var(v=dcost220_);	%var(v=dcost225_);	%var(v=dcost230_);  %var(v=dcost235_);	%var(v=dcost240_);
%var(v=dcost245_);  %var(v=dcost250_);	

%var(v=dcost_sw_program45_);

%var(v=dart_cost_y);	  %var(v=dadc_cost);		%var(v=dcd4_cost);		%var(v=dvl_cost);  	%var(v=dvis_cost);	
%var(v=dnon_tb_who3_cost);%var(v=dcot_cost);		%var(v=dtb_cost);  		%var(v=dres_cost); 	%var(v=dtest_cost);
%var(v=dtest_cost_sw)     %var(v=d_t_adh_int_cost); %var(v=dswitchline_cost); %var(v=dcost_drug_level_test);
%var(v=dcost_circ); 	  %var(v=dcost_condom_dn);  %var(v=dcost_avail_self_test); 	%var(v=dcost_prep_visit_oral);  	
%var(v=dcost_prep_oral);  %var(v=dcost_prep_visit_inj);  %var(v=dcost_prep_inj); 
%var(v=dcost_sw_prog150perSW); %var(v=dcost_withSWprog);
run;
 

data wide_outputs;merge
prevalence1549m	prevalence1549w 	prevalence1549 		incidence1549 	incidence1549w 	incidence1549m

p_diag	 		p_diag_m	 		p_diag_w   			p_onart_diag  	p_onart_diag_w
p_onart_diag_m 	p_onart_vl1000		p_onart_vl1000_w   	p_onart_vl1000_m  n_tested	 n_tested_f  	n_tested_m	
p_vg1000 		p_vl1000			prevalence_vg1000

n_sw_1564_      n_sw_1549_		    prop_w_1564_sw		prop_w_1549_sw 	prop_w_ever_sw  
p_fsw1519_	  	p_fsw2024_		    p_fsw2529_			p_fsw3039_	

p_sw_age1519_	  p_sw_age2024_		p_sw_age2529_ 		p_sw_age3039_
p_age_deb_sw1519_ p_age_deb_sw2024_ p_age_deb_sw2529_  	p_age_deb_sw3039_

sw_episodes 	p_sw_gt1ep
p_fsw_newp0_   	p_fsw_newp1to5_    p_fsw_newp6to40_  	p_fsw_newp41to130_	p_fsw_newpov130_
av_sw_newp	 	p_newp_sw

tot_dur_sw  	act_dur_sw  	 
p_actdur_0to3_  p_actdur_3to5_     p_actdur_6to9_  	p_actdur_10to19_ 
p_totdur_0to3_  p_totdur_3to5_     p_totdur_6to9_  	p_totdur_10to19_ 

p_sw_prog_vis   n_tested_sw	   	   p_tested_past_year_sw  prop_sw_onprep	prevalence_sw	  incidence_sw
p_diag_sw		p_onart_diag_sw	   p_onart_vl1000_sw	p_sti_sw
/*
mean_n_sw_1564_     mean_n_sw_1549_	mean_prop_w_1564_sw	mean_prop_w_1549_sw 
mean_prop_w_ever_sw  

mean_p_sw_age1519_	   mean_p_sw_age2024_	mean_p_sw_age2529_ 		mean_p_sw_age3039_

mean_sw_episodes 	   mean_p_sw_gt1ep
mean_p_fsw_newp0_  	   mean_av_sw_newp

mean_tot_dur_sw  	mean_act_dur_sw  	 
mean_p_actdur_0to3_ mean_p_actdur_3to5_     mean_p_actdur_6to9_  	mean_p_actdur_10to19_ 
mean_p_totdur_0to3_ mean_p_totdur_3to5_     mean_p_totdur_6to9_  	mean_p_totdur_10to19_ 

mean_p_sw_prog_vis  mean_n_tested_sw	    mean_p_tested_past_year_sw
mean_prop_sw_onprep mean_prevalence_sw		mean_incidence_sw
mean_p_diag_sw		mean_p_onart_diag_sw	mean_p_onart_vl1000_sw	mean_p_sti_sw
*/
dcost			ddaly
dcost19_		dcost10_		dcost15_		dcost20_		dcost25_		dcost30_		dcost35_	dcost40_
dcost45_		dcost50_		dcost55_		dcost60_		dcost65_		dcost70_		dcost75_	dcost80_
dcost85_		dcost90_		dcost95_		dcost100_		dcost105_		dcost110_		dcost115_	dcost120_
dcost125_		dcost130_		dcost135_		dcost140_		dcost145_		dcost150_		dcost155_	dcost160_
dcost165_		dcost170_		dcost175_		dcost180_		dcost185_		dcost190_		dcost195_	dcost200_
dcost205_		dcost210_		dcost215_		dcost220_		dcost225_		dcost230_		dcost235_	dcost240_
dcost245_		dcost250_

dcost_sw_program45_ 
dart_cost_y		dadc_cost		dcd4_cost		dvl_cost  	 	dvis_cost		dnon_tb_who3_cost	
dcot_cost		dtb_cost  		dres_cost 		dtest_cost		dtest_cost_sw	d_t_adh_int_cost  	dswitchline_cost
dcost_drug_level_test			dcost_circ 		dcost_condom_dn	dcost_avail_self_test 	
dcost_prep_visit_oral  			dcost_prep_oral dcost_prep_visit_inj  	dcost_prep_inj
dcost_sw_prog150perSW			dcost_withSWprog

;

proc sort; by run;run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2023.25; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 
%par(p=sw_art_disadv);		%par(p=sw_program);			%par(p=effect_sw_prog_newp);	%par(p=effect_sw_prog_6mtest);	
%par(p=effect_sw_prog_int);	%par(p=effect_sw_prog_adh);	%par(p=effect_sw_prog_lossdiag);%par(p=effect_sw_prog_prep_any);
%par(p=effect_sw_prog_pers_sti); %par(p=sw_trans_matrix); %par(p=sw_higher_int); %par(p=sw_higher_prob_loss_at_diag);

run;

 
data wide_par; merge 
sw_art_disadv		sw_program			effect_sw_prog_newp			effect_sw_prog_6mtest	
effect_sw_prog_int	effect_sw_prog_adh	effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti
sw_trans_matrix  sw_higher_int  sw_higher_prob_loss_at_diag;
;proc sort; by run;run;

data a.wide_fsw_17_08_23_final1;*the 1 here is just including the new sw_program cost assuming $150 pp. Did not want to overwrite original file so just being cautious;
merge   wide_outputs  wide_par ;  
by run;run;




***Use this to identify runs with implausible incidence and delete below;
data a1;
set a.wide_fsw_07_05_23;
proc freq;table run;where incidence1549_22 <0.02;run;


***Graphs for AMETHIST presentation;
data b;set y;
*if run in (19551048, 91209492, 138513405, 226496828, 249057554, 276068418, 408547376, 460121915, 533026231, 597223150, 657900229, 691910826, 789096000, 
821745699, 828958562, 834955556, 953409076, 985359749) then delete;


proc sort;by cald;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 480  ;
proc sort;by cald option ;run;


***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 or option =2 then delete;

%let var =  

n_sw_1564_  n_sw_1549_  prop_w_1564_sw  prop_w_1549_sw  prop_w_ever_sw  p_fsw1519_  p_fsw2024_  p_fsw2529_  p_fsw3039_
p_sw_age1519_  p_sw_age2024_  p_sw_age2529_  p_sw_age3039_ p_age_deb_sw1519_  p_age_deb_sw2024_  p_age_deb_sw2529_  p_age_deb_sw3039_
sw_episodes  p_sw_gt1ep  tot_dur_sw  act_dur_sw
p_actdur_0to3_  p_actdur_3to5_  p_actdur_6to9_  p_actdur_10to19_
p_totdur_0to3_  p_totdur_3to5_  p_totdur_6to9_  p_totdur_10to19_
p_fsw_newp0_  av_sw_newp   p_newp_sw

p_sw_prog_vis  n_tested_sw  prop_sw_onprep p_diag_sw  p_onart_diag_sw  p_onart_vl1000_sw
prevalence_sw  incidence_sw p_sti_sw;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p25_&varb._0  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._0 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;

%option_0;
run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_1;
set b;
if option =0 or option =2 then delete;

%let var =  

n_sw_1564_  n_sw_1549_  prop_w_1564_sw  prop_w_1549_sw  prop_w_ever_sw  p_fsw1519_  p_fsw2024_  p_fsw2529_  p_fsw3039_
p_sw_age1519_  p_sw_age2024_  p_sw_age2529_  p_sw_age3039_ p_age_deb_sw1519_  p_age_deb_sw2024_  p_age_deb_sw2529_  p_age_deb_sw3039_
sw_episodes  p_sw_gt1ep  tot_dur_sw  act_dur_sw
p_actdur_0to3_  p_actdur_3to5_  p_actdur_6to9_  p_actdur_10to19_
p_totdur_0to3_  p_totdur_3to5_  p_totdur_6to9_  p_totdur_10to19_
p_fsw_newp0_  av_sw_newp   p_newp_sw

p_sw_prog_vis  n_tested_sw  prop_sw_onprep p_diag_sw  p_onart_diag_sw  p_onart_vl1000_sw
prevalence_sw  incidence_sw p_sti_sw;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p50_var = median_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p25_&varb._1  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._1 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;

%option_1;
run;


data option_2;
set b;
if option =0 or option=1 then delete;

%let var =  

n_sw_1564_  n_sw_1549_  prop_w_1564_sw  prop_w_1549_sw  prop_w_ever_sw  p_fsw1519_  p_fsw2024_  p_fsw2529_  p_fsw3039_
p_sw_age1519_  p_sw_age2024_  p_sw_age2529_  p_sw_age3039_ p_age_deb_sw1519_  p_age_deb_sw2024_  p_age_deb_sw2529_  p_age_deb_sw3039_
sw_episodes  p_sw_gt1ep  tot_dur_sw  act_dur_sw
p_actdur_0to3_  p_actdur_3to5_  p_actdur_6to9_  p_actdur_10to19_
p_totdur_0to3_  p_totdur_3to5_  p_totdur_6to9_  p_totdur_10to19_
p_fsw_newp0_  av_sw_newp   p_newp_sw

p_sw_prog_vis  n_tested_sw  prop_sw_onprep p_diag_sw  p_onart_diag_sw  p_onart_vl1000_sw
prevalence_sw  incidence_sw p_sti_sw;


*starts with %macro and ends with %mend;
%macro option_2;
%let p25_var = p25_&var_2;
%let p75_var = p75_&var_2;
%let p5_var = p5_&var_2;
%let p95_var = p95_&var_2;
%let p50_var = median_&var_2;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));

      
proc transpose data=option_2 out=i&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data i&count;set i&count;***creates one dataset per variable;
p25_&varb._2  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._2 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._2  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._2 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._2 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._2 p95_&varb._2 p50_&varb._2 p25_&varb._2 p75_&varb._2;
run;

      proc datasets nodetails nowarn nolist; 
      delete  ii&count;quit;run;
%end;
%mend;

%option_2;
run;



data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25  g26 
g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41 /* g42  g43  g44  g45  g46  g47  g48   g49  g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71 g72 g73 g74 g75  g76  g77  g78 
g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100 g101 g102 g103 g104
g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 */

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41 /* h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52 h53   h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72 h73
*/
i1   i2   i3   i4   i5   i6   i7   i8   i9   i10  i11  i12  i13  i14  i15  i16  i17  i18  i19  i20  i21  i22  i23  i24  i25  i26 
i27  i28  i29  i30  i31  i32  i33  i34  i35  i36  i37  i38  i39  i40  i41
;
by cald;
run;


data e;
set d;
%include '"C:\Loveleen\Synthesis model\Zim\Calibration\Observed data_Zimbabwe_LBMMay2017.sas"'; by cald;
run;



data a.fsw_07_05_23_graphs; set e;run;

data e; set a.fsw_07_05_23_graphs;run;


ods graphics / reset imagefmt=jpeg height=5in width=8in; run;
ods rtf file = 'C:\Loveleen\Synthesis model\Zim\FSW\25Apr2023.doc' startpage=never; 

proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 130000)  valueattrs=(size=10);
label p50_n_sw_1549__0	                  = "model age 15-49 (median)";

label o_pop_fsw_1549w_Fearnon			  = "All FSW age 15-49 - Fearon";
series  x=cald y=p50_n_sw_1549__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549__0     upper=p95_n_sw_1549__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearnon / markerattrs = (symbol=circle color=black size = 12)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearnon yerrorupper=o_pop_fsw_ul_1549w_Fearnon errorbarattrs= (color=black thickness = 2);
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of women who are sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) 		valueattrs=(size=10);
label p50_prop_w_1549_sw_0   = "model - median ";

label o_p_fsw_ab1ts6m_1849w_nbcs = "NBCP: >  1 TSP (age 18-49)";
label o_p_fsw_1549w_Fearnon		 = "Fearon 15-49";
label o_p_fsw_ll_1549w_SA		 = "South Africa";
label o_p_fsw_1549w_Cam			 = "Cameroon";
label o_p_fsw_1549w_Ken			 ="Kenya (urban)";

series  x=cald y=p50_prop_w_1549_sw_0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	 upper=p95_prop_w_1549_sw_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=o_p_fsw_ab1ts6m_1849w_nbcs / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_1549w_Fearnon / markerattrs = (symbol=circle       color=green size = 12)
										 yerrorlower=o_p_fsw_ll_1549w_Fearnon yerrorupper=o_p_fsw_ul_1549w_Fearnon errorbarattrs= (color=green thickness = 2);
scatter x=cald y=o_p_fsw_ll_1549w_SA / markerattrs = (symbol=circle       color=orange size =1)
										 yerrorlower=o_p_fsw_ll_1549w_SA yerrorupper=o_p_fsw_ul_1549w_SA errorbarattrs= (color=orange thickness = 2);
scatter x=cald y=o_p_fsw_1549w_Cam / markerattrs = (symbol=circle       color=red size =12)
										 yerrorlower=o_p_fsw_ll_1549w_Cam yerrorupper=o_p_fsw_ul_1549w_Cam errorbarattrs= (color=red thickness = 2);
scatter x=cald y=o_p_fsw_1549w_Ken / markerattrs = (symbol=circle       color=purple size =12)
										 yerrorlower=o_p_fsw_ll_1549w_Ken yerrorupper=o_p_fsw_ul_1549w_Ken errorbarattrs= (color=purple thickness = 2);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Age of sex workers";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_p_sw_age1519__0	              = "15-19 years (median)";
label p50_p_sw_age2024__0	              = "20-24 years (median)";
label p50_p_sw_age2529__0	              = "25-29 years (median)";
label p50_p_sw_age3039__0	              = "30-39 years (median)";

label o_p_1824_fsw_rds				  = "18-24 years Sapphire";
label o_p_2529_fsw_rds				  = "25-29 years Sapphire";
label o_p_3039_fsw_rds				  = "30-39 years Sapphire";
 
label o_p_1824_fsw_AMT				  = "18-24 years Amethist";
label o_p_2529_fsw_AMT				  = "25-29 years Amethist";
label o_p_3039_fsw_AMT				  = "39-39 years Amethist";

series  x=cald y=p50_p_sw_age1519__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_age1519__0      upper=p95_p_sw_age1519__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19y 90% range";
series  x=cald y=p50_p_sw_age2024__0  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_sw_age2024__0      upper=p95_p_sw_age2024__0 / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24yy 90% range";
series  x=cald y=p50_p_sw_age2529__0  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_age2529__0      upper=p95_p_sw_age2529__0 / transparency=0.9 fillattrs = (color=red) legendlabel= "25-29y 90% range";
series  x=cald y=p50_p_sw_age3039__0  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_sw_age3039__0      upper=p95_p_sw_age3039__0 / transparency=0.9 fillattrs = (color=orange) legendlabel= "30-39y 90% range";

scatter x=cald y=o_p_1824_fsw_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_rds / markerattrs = (symbol=circle       color=orange size = 12);

scatter x=cald y=o_p_1824_fsw_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_AMT / markerattrs = (symbol=circle       color=orange size = 12);
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners (including periods of inactive sex work)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_p_fsw_newp0__0 = "Model (median) ";

series  x=cald y=p50_p_fsw_newp0__0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_fsw_newp0__0	 upper=p95_p_fsw_newp0__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers who visited a sex worker programme";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2023 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_p_sw_prog_vis_0 = "Model (median) ";

series  x=cald y=p50_p_sw_prog_vis_0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_0	 upper=p95_p_sw_prog_vis_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Number of tests";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2040 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)   		values = (0 to 150000 by 50000) valueattrs=(size=10);

label p50_n_tested_sw_0 = "No SW program ";
label p50_n_tested_sw_1 = "Low impact SW program ";
label p50_n_tested_sw_2 = "High impact SW program ";

series  x=cald y=p50_n_tested_sw_0  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_0	 upper=p95_n_tested_sw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_n_tested_sw_1  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_sw_1	 upper=p95_n_tested_sw_1 / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

series  x=cald y=p50_n_tested_sw_2  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_2	 upper=p95_n_tested_sw_2 / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

proc print;var p50_n_tested_sw_0 p50_n_tested_sw_1 p50_n_tested_sw_2;run;
proc contents;run;
run;
