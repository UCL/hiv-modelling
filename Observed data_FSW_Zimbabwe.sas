***FSW observed data;
***Updated Jan 24;


*********************************************************************************************************************
POPULATION;
*********************************************************************************************************************


**Zimbabwe;
*Source : Liz Fearon's paper on size estimation 'Estimating the population size of female sex workers in Zimbabwe';
if cald=2016.75 then do;
	o_pop_fsw_1549w_Fearon=40491;o_pop_fsw_ll_1549w_Fearon=28177;o_pop_fsw_ul_1549w_Fearon=58797;
	o_p_fsw_1549w_Fearon=0.012;o_p_fsw_ll_1549w_Fearon=0.009;o_p_fsw_ul_1549w_Fearon=0.018;
end;

* Source: Liz Fearon, Sungai Chabata, Powerpoint -  Getting to precision – Female Sex Worker  population size estimates in Zimbabwe;
if cald=2022 then do;
	o_pop_fsw_1549w_Fearon=70423;o_pop_fsw_ll_1549w_Fearon=59271;o_pop_fsw_ul_1549w_Fearon=79518;
	o_p_fsw_1549w_Fearon=0.016;o_p_fsw_ll_1549w_Fearon=0.013;o_p_fsw_ul_1549w_Fearon=0.018;
end;

**South Africa;* Source: Estimating the number of sex workers in South Africa: rapid population size estimation;
if cald=2014 then do;
	o_pop_fsw_ll_1549w_SA=131000;o_pop_fsw_ul_1549w_SA=182000;
	o_p_fsw_ll_1549w_SA=0.0076;o_p_fsw_ul_1549w_SA=0.01;
end;

**Cameroon *Source:Mapping and size estimates of female sex workers in Cameroon;
if cald=2015 then do;
	o_pop_fsw_1549w_Cam=112580; o_pop_fsw_ll_1549w_Cam=103436;o_pop_fsw_ul_1549w_Cam=121723;
	o_p_fsw_1549w_Cam=0.019;o_p_fsw_ll_1549w_Cam=0.0047;o_p_fsw_ul_1549w_Cam=0.036;
end;

**Kenya *Source:Estimating the Size of the Female Sex Worker Population in Kenya to Inform HIV Prevention Programming;
if cald=2011.5 then do;
	o_pop_fsw_1549w_ken=138420; o_pop_fsw_ll_1549w_Ken=107552;o_pop_fsw_ul_1549w_Ken=169288;
	o_p_fsw_1549w_Ken=0.04;o_p_fsw_ll_1549w_Ken=0.02;o_p_fsw_ul_1549w_Ken=0.09;
end;

**SSA;
*Source: Estimates of the number of female sex workers in different regions of the world, Vandepitte 2006
 Lower and upper bounds taken for SSA: 0.4% and 4.3%. These are applied to Census 2012 figures (1549w=3291432);
if cald=2006 then do;
	o_pop_fsw_ll_van=13166;o_pop_fsw_ul_van=141532;
	o_p_fsw_ll_1549w_Van=0.004;o_p_fsw_ul_1549w_Van=0.043;
end;


*********************************************************************************************************************
AGE;
*********************************************************************************************************************


**Current age;
*Source: The HIV Care Cascade Among Female Sex Workers in Zimbabwe: Results of a Population-Based Survey From the Sisters Antiretroviral Therapy Programme for Prevention of
		 HIV, an Integrated Response (SAPPH-IRe) Trial. Cowan 2017;
if cald=2013.75 then do;
	o_p_1824_fsw_rds= 0.265; o_p_1824_fsw_ll_rds= 0.099; o_p_1824_fsw_ul_rds= 0.384;
	o_p_2529_fsw_rds= 0.236; o_p_2529_fsw_ll_rds= 0.178; o_p_2529_fsw_ul_rds= 0.331;
	o_p_3039_fsw_rds= 0.344; o_p_3039_fsw_ll_rds= 0.227; o_p_3039_fsw_ul_rds= 0.451;
	o_p_ab40_fsw_rds= 0.155; o_p_ab40_fsw_ll_rds= 0.065; o_p_ab40_fsw_ul_rds= 0.223;
end;

*Source: AMETHIST usual care - Slideset from Sanni Ali 'AMETHIST_New Slides20202810jh_SA';
if cald=2022 then do;
	o_p_1819_fsw_AMT= 0.042; 
	o_p_2024_fsw_AMT= 0.174; 
	o_p_2529_fsw_AMT= 0.198; 
	o_p_3039_fsw_AMT= 0.361; 
	o_p_ab40_fsw_AMT= 0.225; 
end;

**Age debut;
*Source: The HIV Care Cascade Among Female Sex Workers in Zimbabwe: Results of a Population-Based Survey From the Sisters Antiretroviral Therapy Programme for Prevention of
HIV, an Integrated Response (SAPPH-IRe) Trial. Cowan 2017;
if cald=2013.75 then do;
	o_p_fsw_agedeb1519_rds= 0.245;
	o_p_fsw_agedeb2024_rds= 0.308;
	o_p_fsw_agedeb2529_rds= 0.239;
	o_p_fsw_agedebge30_rds= 0.209;
end;

*Source: AMETHIST usual care - Slideset from Sanni Ali 'AMETHIST_New Slides20202810jh_SA';
if cald=2022 then do;
	o_p_fsw_agedeb1519_AMT= 0.323;
	o_p_fsw_agedeb2024_AMT= 0.285;
	o_p_fsw_agedeb2529_AMT= 0.196;
	o_p_fsw_agedebge30_AMT= 0.181;
end;


*********************************************************************************************************************
DURATION;
*********************************************************************************************************************


*Source: Targeted combination prevention to support female sex workers in Zimbabwe accessing and adhering to
antiretrovirals for treatment and prevention of HIV (SAPPH-IRe): a cluster-randomised trial;
if cald=2016.25 then do;
	o_p_dur_0to3y_rds=0.221;
	o_p_dur_3to5y_rds=0.287;
	o_p_dur_6to9y_rds=0.243;
	o_p_dur_10to19y_rds=0.193;
	o_p_dur_gt19y_rds=0.056;
end;

*Source: AMETHIST usual care - Slideset from Sanni Ali 'AMETHIST_New Slides20202810jh_SA';
if cald=2022 then do;
	o_p_dur_0to3y_AMT=0.169;
	o_p_dur_3to5y_AMT=0.222;
	o_p_dur_6to9y_AMT=0.207;
	o_p_dur_10to19y_AMT=0.279;
	o_p_dur_gt19y_AMT=0.123;
end;


*********************************************************************************************************************
PREVALENCE;
*********************************************************************************************************************


*Source: "Zimbabwe data.xls" sent by David Wilson;
if cald=2000.5 then o_prev_fsw_dw=0.522;
if cald=2005.5 then o_prev_fsw_dw=0.557;
if cald=2010.5 then o_prev_fsw_dw=0.66;
if cald=2013.5 then do; o_prev_fsw_dw=0.615; o_prev_fsw_ll_dw=0.55; o_prev_fsw_ul_dw=0.68; end;
if cald=2014.5 then o_prev_fsw_dw=0.58;

*Source: RDS performed in 2011/12 - Engagement with HIV Prevention, Cowan 2013 (Mutare, VF & Hwange);
if cald=2012 then do; o_prev_fsw_rds_mut=0.506; o_prev_fsw_rds_vf=0.696; o_prev_fsw_rds_hwa=0.506; end;

*Source: Sisters with a voice programme;
if cald=2012.5 then o_prev_fsw_tested_swvp=0.56;

*Source: HIV Care Cascade Among Female Sex Workers (Cowan 2017);
if cald=2013.75 then do; o_prev_fsw_rds    = 0.575;o_prev_fsw_ll_rds =0.408 ;*0.428; o_prev_fsw_ul_rds =0.812;end;*0.792;
	*The confidence  interval for o_prev_fsw_rds is 0.428-0.792, this has been expanded to take into account of bias;

***LBM Feb 2017;
***Prevalence stratified by age and duration of FSW;
*Source: Draft Paper  - 'How can programmes better support female sex workers to avoid HIV infection in Zimbabwe' (Cowan 2017)? ;
if cald=2013.75 then do;
	o_prev_1824fsw_0_2_rds=0.31;	o_prev_2529fsw_0_2_rds=0.53;	o_prev_3039fsw_0_2_rds=0.63;	o_prev_ov40fsw_0_2_rds=0.80;
	o_prev_1824fsw_3_4_rds=0.43;	o_prev_2529fsw_3_4_rds=0.54;	o_prev_3039fsw_3_4_rds=0.63;	o_prev_ov40fsw_3_4_rds=0.67;
	o_prev_1824fsw_5_8_rds=0.35;	o_prev_2529fsw_5_8_rds=0.55;	o_prev_3039fsw_5_8_rds=0.66;	o_prev_ov40fsw_5_8_rds=0.76;
	o_prev_1824fsw_ov9_rds=0.57;	o_prev_2529fsw_ov9_rds=0.62;	o_prev_3039fsw_ov9_rds=0.75;	o_prev_ov40fsw_ov9_rds=0.81;
end;

***Prevalence stratified by age of FSW;
if cald=2013.75 then do;
	o_prev_fsw_rds = 0.484; o_prev_fsw_ll_rds =0.346 ; o_prev_fsw_ul_rds =0.574;
end;

*Source: AMETHIST Draft Paper  - 'a risk-differentiated, community-led intervention to strengthen uptake and engagement 
		 with HIV prevention and care cascades among female sex workers in Zimbabwe: the results of a cluster randomised
		 trial; 
if cald=2021.75 then do;
	o_prev_fsw_AMT=0.46;/*
	o_prev_1824fsw_amt=0.39;		o_prev_2529fsw_amt=0.62;		o_prev_3039fsw_amt=0.76;		o_prev_ov40fsw_amt=0.78;
*/
	end;


*********************************************************************************************************************
INCIDENCE (/100py);
*********************************************************************************************************************


*Source: Cohort analysis of programme data to estimate HIV incidence and uptake of HIV-related services among 
		 female sex workers in Zimbabwe, 2009-14 (James Hargreaves JAIDS 2016);
if cald=2011.5 then o_HIVIncid_fsw=9.8;

*Source: Estimation of HIV incidence from analysis of HIV prevalence patterns among female sex workers in Zimbabwe 
		 (Sanni Ali, AIDS 2022);
if cald=2014 then do;
	o_HIVIncid1824_fsw=0.063*100;o_HIVIncid1824_ll_fsw=0.053*100;o_HIVIncid1824_ul_fsw=0.076*100;
	o_HIVIncid2539_fsw=0.033*100;o_HIVIncid2539_ll_fsw=0.013*100;o_HIVIncid2539_ul_fsw=0.042*100;
end;

* Source: DREAMS_Zimbabwe_prelim_presn USAID 6 Jan 2020_v2;
if cald=2015 then  do;
	o_HIVIncid_fsw_dreams=3.14;
	o_HIVIncid_fsw_nondreams=5.29;
end;

* Source: HIV incidence among women engaging in sex work in sub-Saharan Africa: a systematic review and meta-analysis
		  (Harriet Jones 2023, preprint);
if cald=2010 then do; o_HIVIncid1539_fsw_hj=5.4; o_HIVIncid1539_fsw_hj_ll=3.2; o_HIVIncid1539_fsw_hj_ul=10.9;end;
if cald=2011 then do; o_HIVIncid1539_fsw_hj=4.3; o_HIVIncid1539_fsw_hj_ll=2.2; o_HIVIncid1539_fsw_hj_ul=14.6;end;
if cald=2012 then do; o_HIVIncid1539_fsw_hj=5.7; o_HIVIncid1539_fsw_hj_ll=1.9; o_HIVIncid1539_fsw_hj_ul=22.8;end;
if cald=2013 then do; o_HIVIncid1539_fsw_hj=2.9; o_HIVIncid1539_fsw_hj_ll=1.5; o_HIVIncid1539_fsw_hj_ul=8.1;end;
if cald=2014 then do; o_HIVIncid1539_fsw_hj=4.5; o_HIVIncid1539_fsw_hj_ll=2.5; o_HIVIncid1539_fsw_hj_ul=8.2;end;
if cald=2015 then do; o_HIVIncid1539_fsw_hj=4.4; o_HIVIncid1539_fsw_hj_ll=3.6; o_HIVIncid1539_fsw_hj_ul=5.4;end;
if cald=2016 then do; o_HIVIncid1539_fsw_hj=3.1; o_HIVIncid1539_fsw_hj_ll=2.5; o_HIVIncid1539_fsw_hj_ul=4.1;end;
if cald=2017 then do; o_HIVIncid1539_fsw_hj=3.9; o_HIVIncid1539_fsw_hj_ll=3.3; o_HIVIncid1539_fsw_hj_ul=4.7;end;
if cald=2018 then do; o_HIVIncid1539_fsw_hj=3.9; o_HIVIncid1539_fsw_hj_ll=3.3; o_HIVIncid1539_fsw_hj_ul=4.7;end;
if cald=2019 then do; o_HIVIncid1539_fsw_hj=3.1; o_HIVIncid1539_fsw_hj_ll=2.1; o_HIVIncid1539_fsw_hj_ul=5.0;end;


*********************************************************************************************************************
CARE CASCADE;
*********************************************************************************************************************

***Diagnosed in SSA;
*Source: https://kpatlas.unaids.org/dashboard;
if cald=2018 then obs_p_diag_fsw_SA=0.81;
if cald=2018 then obs_p_diag_fsw_Les=0.64;
if cald=2019 then obs_p_diag_fsw_Zam=0.56;
if cald=2020 then obs_p_diag_fsw_Rwa=0.77;
if cald=2019 then obs_p_diag_fsw_Uga=0.88;

if cald=2021 then o_p_onart_fswdiag_AMT=0.951;
if cald=2018 then o_p_onart_fswdiag_SA=0.468;
if cald=2019 then o_p_onart_fswdiag_Zam=0.859;
if cald=2016 then o_p_onart_fswdiag_Rwa=0.363;
if cald=2019 then o_p_onart_fswdiag_Uga=0.69;



*Source: HIV Care Cascade Among Female Sex Workers (Baseline RDS, Cowan 2017);
if cald=2013.75 then do;
	obs_p_diag_fsw_rds=0.64;
	obs_p_art_fsw_rds=0.68;
	obs_p_vs_fsw_rds=0.78;
end;

*Source: Targeted combination prevention to support female sex workers in Zimbabwe accessing and adhering to
		 antiretrovirals for treatment and prevention of HIV (SAPPH-IRe): a cluster-randomised trial (Endline RDS);
if cald=2016.25 then do;
	obs_p_diag_fsw_rds=0.78;
	obs_p_art_fsw_rds=0.83;
	obs_p_vs_fsw_rds=0.87;
end;

*Source: Amethist draft paper 'a risk-differentiated, community-led intervention to strengthen uptake and engagement with
		 HIV prevention and care cascades among female sex workers in Zimbabwe: the results of a cluster randomised trial 
		 (Cowan 2023)
		 (Data taken from spreadsheet shared by Sungai Jan 24, 'HIV_treatment_&_PrEP_cascades');
if cald=2022 then do;
	obs_p_diag_fsw_AMT=0.89;
	obs_p_art_fsw_AMT=0.95;
	obs_p_vs_fsw_AMT=0.93;
end;



****GENERAL POPULATION ZIMPHIA RESULTS;
if cald=2016.25 then do;
	o_prev_1549w_zimphia=0.159;o_prev_1549m_zimphia=0.107;o_prev_1549_zimphia=0.134;
	o_inc_1549w_zimphia=0.57;o_inc_1549m_zimphia=0.30;o_inc_1549_zimphia=0.44;
end;


****GENERAL POPULATION ZIMPHIA RESULTS;
if cald=2020.25 then do;
	o_prev_1549w_zimphia=0.148;o_prev_1549m_zimphia=0.086;o_prev_1549_zimphia=0.118;
	o_inc_1549w_zimphia=0.57;o_inc_1549m_zimphia=0.23;o_inc_1549_zimphia=0.45;
end;

