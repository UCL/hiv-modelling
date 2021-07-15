

libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\base\";

***************************************************;
*Macro to set up data that will be outputted in Word;
***************************************************;

%macro setup(yr=);

	s_alive = s_alive_&yr; p_w_giv_birth_this_per = p_w_giv_birth_this_per_&yr;
	prevalence1549 = prevalence1549_&yr;  prevalence1549m = prevalence1549m_&yr; prevalence1549w = prevalence1549w_&yr; 
	incidence1549 = incidence1549_&yr; incidence1549w = incidence1549w_&yr; incidence1549m = incidence1549m_&yr; incidence_sw = incidence_sw_&yr;
	p_diag = p_diag_&yr; p_diag_m = p_diag_m_&yr; p_diag_w = p_diag_w_&yr;
	p_onart_diag = p_onart_diag_&yr;	p_onart_vl1000 = p_onart_vl1000_&yr; p_onart_vl1000_w = p_onart_vl1000_w_&yr;	p_onart_vl1000_m = p_onart_vl1000_m_&yr;
	p_vl1000 = p_vl1000_&yr;	prevalence_vg1000 = prevalence_vg1000_&yr;
	prop_w_1549_sw = prop_w_1549_sw_&yr; prop_sw_newp0 = prop_sw_newp0_&yr; p_newp_sw = p_newp_sw_&yr; prop_sw_hiv = prop_sw_hiv_&yr;
	p_ai_no_arv_c_nnm = p_ai_no_arv_c_nnm_&yr; mtct_prop = mtct_prop_&yr; prop_1564_onprep = prop_1564_onprep_&yr;
	p_onart_cd4_l500 = p_onart_cd4_l500_&yr; p_onart_m_age50pl = p_onart_m_age50pl_&yr;p_onart_w_age50pl = p_onart_w_age50pl_&yr;
	p_onart_cd4_l200 = p_onart_cd4_l200_&yr; p_startedline2 = p_startedline2_&yr;
	p_newp_ge1 = p_newp_ge1_&yr; p_newp_ge5 = p_newp_ge5_&yr; p_iime =  p_iime_&yr;

	rate_dead_cvd = rate_dead_cvd_&yr; rate_dead_tb = rate_dead_tb_&yr;
	rate_dead_hivpos_sbi = rate_dead_hivpos_sbi_&yr; rate_dead_hivpos_oth_adc = rate_dead_hivpos_oth_adc_&yr;
	rate_dead_hivpos_tb = rate_dead_hivpos_tb_&yr; rate_dead_hivpos_crypm = rate_dead_hivpos_crypm_&yr ;
	rate_dead_hivpos_cause1 = rate_dead_hivpos_cause1_&yr; rate_dead_hivpos_cause2 = rate_dead_hivpos_cause2_&yr; 
	rate_dead_hivpos_cause3 = rate_dead_hivpos_cause3_&yr; rate_dead_hivpos_cause4 = rate_dead_hivpos_cause4_&yr;
	rate_dead_hivpos_cvd = rate_dead_hivpos_cvd_&yr; rate_dead_hivpos_anycause = rate_dead_hivpos_anycause_&yr;
    rate_dead_hivneg_cvd = rate_dead_hivneg_cvd_&yr; rate_dead_hivneg_tb = rate_dead_hivneg_tb_&yr;  
	rate_dead_hivneg_cause2 = rate_dead_hivneg_cause2_&yr; rate_dead_hivneg_cause3 = rate_dead_hivneg_cause3_&yr;
	rate_dead_hivneg_cause4 = rate_dead_hivneg_cause4_&yr; rate_dead_hivneg_cause5 = rate_dead_hivneg_cause5_&yr;
	rate_dead_allage = rate_dead_allage_&yr; rate_dead_hivneg_anycause = rate_dead_hivneg_anycause_&yr; 
	
	incidence1524w = incidence1524w_&yr; incidence1524m = incidence1524m_&yr; incidence2534w = incidence2534w_&yr;  
	incidence2534m = incidence2534m_&yr; incidence3544w = incidence3544w_&yr; incidence3544m = incidence3544m_&yr;
	incidence4554w = incidence4554w_&yr; incidence4554m = incidence4554m_&yr; incidence5564w = incidence5564w_&yr;  
	incidence5564m = incidence5564m_&yr; 

	prevalence1519w = prevalence1519w_&yr; prevalence1519m = prevalence1519m_&yr; prevalence2024w = prevalence2024w_&yr; 
	prevalence2024m = prevalence2024m_&yr; prevalence2529w = prevalence2529w_&yr; prevalence2529m = prevalence2529m_&yr;
	prevalence3034w = prevalence3034w_&yr; prevalence3034m = prevalence3034m_&yr; prevalence3539w = prevalence3539w_&yr;
	prevalence3539m = prevalence3539m_&yr; prevalence4044w = prevalence4044w_&yr; prevalence4044m = prevalence4044m_&yr;
	prevalence4549w = prevalence4549w_&yr; prevalence4549m = prevalence4549m_&yr; prevalence5054w = prevalence5054w_&yr; 
	prevalence5054m = prevalence5054m_&yr; prevalence5054w = prevalence5054w_&yr;	prevalence5054m = prevalence5054m_&yr;
	prevalence5559w = prevalence5559w_&yr; prevalence5559m = prevalence5559m_&yr; prevalence6064w = prevalence6064w_&yr;
	prevalence6064m = prevalence6064m_&yr; prevalence65plw = prevalence65plw_&yr; prevalence65plm = prevalence65plm_&yr;

	r_prev_1519w_4549w = r_prev_1519w_4549w_&yr; r_prev_2024w_4549w = r_prev_2024w_4549w_&yr; r_prev_2529w_4549w = r_prev_2529w_4549w_&yr;
	r_prev_3034w_4549w = r_prev_3034w_4549w_&yr; r_prev_3539w_4549w = r_prev_3539w_4549w_&yr; r_prev_4044w_4549w = r_prev_4044w_4549w_&yr;
	r_prev_5054w_4549w = r_prev_5054w_4549w_&yr; r_prev_5559w_4549w = r_prev_5559w_4549w_&yr; r_prev_6064w_4549w = r_prev_6064w_4549w_&yr;
	r_prev_65plw_4549w = r_prev_65plw_4549w_&yr; r_prev_1519m_4549w = r_prev_1519m_4549w_&yr; r_prev_2024m_4549w = r_prev_2024m_4549w_&yr;
	r_prev_2529m_4549w = r_prev_2529m_4549w_&yr; r_prev_3034m_4549w = r_prev_3034m_4549w_&yr; r_prev_3539m_4549w = r_prev_3539m_4549w_&yr;
	r_prev_4044m_4549w = r_prev_4044m_4549w_&yr; r_prev_4549m_4549w = r_prev_4549m_4549w_&yr; r_prev_5054m_4549w = r_prev_5054m_4549w_&yr;
	r_prev_5559m_4549w = r_prev_5559m_4549w_&yr; r_prev_6064m_4549w = r_prev_6064m_4549w_&yr; r_prev_65plm_4549w = r_prev_65plm_4549w_&yr;
	p_hivneg_age1549 = p_hivneg_age1549_&yr; p_hiv_age1549 = p_hiv_age1549_&yr;

	m15r = m15r_&yr; m25r = m25r_&yr; m35r = m35r_&yr; m45r = m45r_&yr; m55r = m55r_&yr;
	w15r = w15r_&yr; w25r = w25r_&yr; w35r = w35r_&yr; w45r = w45r_&yr; w55r = w55r_&yr;
%mend setup;  


***Read in SAS file;
data indata2;
  set a.w_base;  

subgp = 1;*this refers to the columns we want - one column per each year of interest, starting with 1995;
%setup(yr=95); ***Using above macro to add on '_95' suffix to each output;
output;

subgp = 2;
%setup(yr=05);
output;

subgp = 3;
%setup(yr=05);
output;

subgp = 4;
%setup(yr=05);
output;



  keep

	s_alive p_w_giv_birth_this_per
	prevalence1549  prevalence1549m  prevalence1549w 
	incidence1549   incidence1549w  incidence1549m  incidence_sw 
	p_diag  p_diag_m  p_diag_w 	p_onart_diag  p_onart_vl1000  p_onart_vl1000_w 	p_onart_vl1000_m  p_vl1000 	prevalence_vg1000
	prop_w_1549_sw  prop_sw_newp0  p_newp_sw  prop_sw_hiv 
	p_ai_no_arv_c_nnm  mtct_prop  prop_1564_onprep 
	p_onart_cd4_l500  p_onart_m_age50pl  p_onart_w_age50pl 	p_onart_cd4_l200  p_startedline2 
	p_newp_ge1  p_newp_ge5  p_iime

	rate_dead_cvd rate_dead_tb 
	rate_dead_hivpos_sbi  rate_dead_hivpos_oth_adc 	rate_dead_hivpos_tb  rate_dead_hivpos_crypm rate_dead_hivpos_cause1
	rate_dead_hivpos_cause2  rate_dead_hivpos_cause3  rate_dead_hivpos_cause4  rate_dead_hivpos_cvd  rate_dead_hivpos_anycause 
    rate_dead_hivneg_cvd  rate_dead_hivneg_tb  rate_dead_hivneg_cause2  rate_dead_hivneg_cause3  rate_dead_hivneg_cause4 
	rate_dead_hivneg_cause5  rate_dead_allage  rate_dead_hivneg_anycause 
	
	incidence1524w  incidence1524m  incidence2534w 	incidence2534m  incidence3544w  incidence3544m 	incidence4554w 
	incidence4554m  incidence5564w 	incidence5564m 

	prevalence1519w  prevalence1519m  prevalence2024w  prevalence2024m  prevalence2529w  prevalence2529m  prevalence3034w 
	prevalence3034m  prevalence3539w  prevalence3539m  prevalence4044w  prevalence4044m  prevalence4549w  prevalence4549m
	prevalence5054w  prevalence5054m  prevalence5054w  prevalence5054m 	prevalence5559w  prevalence5559m  prevalence6064w
	prevalence6064m  prevalence65plw  prevalence65plm 

	r_prev_1519w_4549w  r_prev_2024w_4549w  r_prev_2529w_4549w 	r_prev_3034w_4549w  r_prev_3539w_4549w  r_prev_4044w_4549w
	r_prev_5054w_4549w  r_prev_5559w_4549w  r_prev_6064w_4549w 	r_prev_65plw_4549w  r_prev_1519m_4549w  r_prev_2024m_4549w
	r_prev_2529m_4549w  r_prev_3034m_4549w  r_prev_3539m_4549w 	r_prev_4044m_4549w  r_prev_4549m_4549w  r_prev_5054m_4549w 
	r_prev_5559m_4549w  r_prev_6064m_4549w  r_prev_65plm_4549w 	p_hivneg_age1549  p_hiv_age1549 

	m15r  m25r  m35r  m45r  m55r w15r  w25r  w35r  w45r  w55r subgp;
run;


proc sort data = indata2;
  by subgp;
run;

***************************************************;
*Set up macros for summary stats;
***************************************************;
*Macro (s) for summary stats for continuous variables (median and 90% range);
%macro s (var=, grpord=, label=, fmt=);
  
  proc summary data=indata2;
    output out=n_&var p5=p5 median=median p95=p95 n=num;
    var &var;
    by subgp;
  run;
  
  data n_&grpord;
    set n_&var;

    *Create group order;
    grpord =&grpord; 

    *Define the row label when you call up the macro;
    length catlbl $200;
    catlbl=&label; 

    *Create a character variable to store the median and range in brackets (from PROC SUMMARY)
    We want this to appear in the same columns as for the count and percent so name the variable npcnt;
    median=round(median,0.01);
    p5=round(p5,0.01);
    p95=round(p95,0.01);
    length npcnt $50;
    npcnt =compress(put(median,&fmt))!!' ('!!compress(put(p5,&fmt))!!', '!!compress(put(p95,&fmt))!!')';
    
    *Create a character variable for the N;
    numc=compress(put(num,6.));
    
    keep grpord catlbl subgp npcnt numc;
  run;
  
%mend s;


***************************************************;
*Call the macros;
***************************************************;

*Summary stats for numerical vars;	
%s(var=s_alive, grpord=1, label="Number alive", fmt=10.0); 
%s(var=p_w_giv_birth_this_per, grpord=2, label="Proportion women giving birth/year", fmt=10.2);
%s(var=prevalence1549, grpord=3, label="Prevalence (age 15-49)", fmt=10.2); 
%s(var=prevalence1549m, grpord=4, label="Prevalence (men aged 15-49)", fmt=10.2);
%s(var=prevalence1549w, grpord=5, label="Prevalence (women aged 15-49)", fmt=10.2);
%s(var=incidence1549, grpord=6, label="Incidence (age 15-49)", fmt=10.2);
%s(var=incidence1549m, grpord=7, label="Incidence (men aged 15-49)", fmt=10.2);
%s(var=incidence1549w, grpord=8, label="Incidence (women aged 15-49)", fmt=10.2);
%s(var=incidence_sw, grpord=9, label="Incidence (sex workers)", fmt=10.2);
%s(var=p_diag, grpord=10, label="Proportion diagnosed ", fmt=10.2);
%s(var=p_diag_m, grpord=11, label="Proportion diagnosed (men)", fmt=10.2);
%s(var=p_diag_w, grpord=12, label="Proportion diagnosed (women)", fmt=10.2);
%s(var=p_onart_diag, grpord=13, label="Of those diagnosed, proportion on ART", fmt=10.2);
%s(var=p_onart_vl1000, grpord=14, label="Of those on ART, proportion virally suppressed", fmt=10.2);
%s(var=p_onart_vl1000_m, grpord=15, label="Of thos on ART, proportion virally suppressed (men)", fmt=10.2);
%s(var=p_onart_vl1000_w, grpord=16, label="Of those on ART, proportion virally suppressed (women)", fmt=10.2);
%s(var=p_vl1000, grpord=17, label="Proportion of HIV+ people with VL<1000 ", fmt=10.2);
%s(var=prevalence_vg1000, grpord=18, label="Prevalence of VL>1000 in population", fmt=10.2);
%s(var=, grpord=19, label=" ", fmt=10.2);*spare;
%s(var=prop_w_1549_sw, grpord=20, label="Proportion of women who are sex workers (age 15-49)", fmt=10.2);
%s(var=prop_sw_newp0, grpord=21, label="Proportion of SW with newp >0 ", fmt=10.2);
%s(var=p_newp_sw, grpord=22, label="Proportion of newp amongst sex workers", fmt=10.2);
%s(var=prop_sw_hiv, grpord=23, label="Proportion of sex workers with HIV", fmt=10.2);
%s(var=p_ai_no_arv_c_nnm, grpord=24, label="p_ai_no_arv_c_nnm", fmt=10.2);
%s(var=mtct_prop, grpord=25, label="mtct_prop", fmt=10.2);
%s(var=p_onart_cd4_l500, grpord=26, label="p_onart_cd4_l500", fmt=10.2);
%s(var=prop_1564_onprep, grpord=27, label="prop_1564_onprep", fmt=10.2);
%s(var=p_onart_m_age50pl, grpord=28, label="p_onart_m_age50pl", fmt=10.2);
%s(var=p_onart_w_age50pl, grpord=29, label="p_onart_w_age50pl", fmt=10.2);
%s(var=p_onart_cd4_l200, grpord=30, label="p_onart_cd4_l200", fmt=10.2);
%s(var=p_startedline2, grpord=31, label="p_startedline2", fmt=10.2);
%s(var=p_newp_ge1, grpord=32, label="p_newp_ge1", fmt=10.2);
%s(var=p_newp_ge5, grpord=33, label="p_newp_ge5", fmt=10.2);
%s(var=p_iime, grpord=34, label="p_iime", fmt=10.2);
%s(var=rate_dead_cvd, grpord=35, label="rate_dead_cvd", fmt=10.2);
%s(var=rate_dead_tb , grpord=36, label="rate_dead_tb", fmt=10.2);
%s(var=rate_dead_hivpos_sbi, grpord=37, label="rate_dead_hivpos_sbi", fmt=10.2);
%s(var=rate_dead_hivpos_oth_adc, grpord=38, label="rate_dead_hivpos_oth_adc", fmt=10.2);
%s(var=rate_dead_hivpos_tb, grpord=39, label="rate_dead_hivpos_tb", fmt=10.2); 
%s(var=rate_dead_hivpos_crypm, grpord=40, label="rate_dead_hivpos_crypm", fmt=10.2);
%s(var=rate_dead_hivpos_cause1, grpord=41, label="rate_dead_hivpos_cause1", fmt=10.2);
%s(var=rate_dead_hivpos_cause2, grpord=42, label="rate_dead_hivpos_cause2", fmt=10.2);
%s(var=rate_dead_hivpos_cause3, grpord=43, label="rate_dead_hivpos_cause3", fmt=10.2);
%s(var=rate_dead_hivpos_cause4, grpord=44, label="rate_dead_hivpos_cause4", fmt=10.2);
%s(var=rate_dead_hivpos_cvd, grpord=45, label="rate_dead_hivpos_cvd", fmt=10.2);
%s(var=rate_dead_hivpos_anycause , grpord=46, label="rate_dead_hivpos_anycause", fmt=10.2);
%s(var=rate_dead_hivneg_cvd, grpord=47, label="rate_dead_hivneg_cvd", fmt=10.2);
%s(var=rate_dead_hivneg_tb, grpord=48, label="rate_dead_hivneg_tb", fmt=10.2);
%s(var=rate_dead_hivneg_cause2, grpord=49, label="rate_dead_hivneg_cause2", fmt=10.2);
%s(var=rate_dead_hivneg_cause3, grpord=50, label="rate_dead_hivneg_cause3", fmt=10.2);
%s(var=rate_dead_hivneg_cause4, grpord=51, label="rate_dead_hivneg_cause4", fmt=10.2);
%s(var=rate_dead_hivneg_cause5, grpord=52, label="rate_dead_hivneg_cause5", fmt=10.2);
%s(var=rate_dead_allage, grpord=53, label="rate_dead_allage", fmt=10.2);
%s(var=rate_dead_hivneg_anycause, grpord=54, label="rate_dead_hivneg_anycause", fmt=10.2);
%s(var=incidence1524m, grpord=55, label="incidence1524m", fmt=10.2);
%s(var=incidence1524w, grpord=56, label="incidence1524w", fmt=10.2);
%s(var=incidence2534m, grpord=57, label="incidence2534m", fmt=10.2);
%s(var=incidence2534w, grpord=58, label="incidence2534w", fmt=10.2);
%s(var=incidence3544m, grpord=59, label="incidence3544m", fmt=10.2);
%s(var=incidence3544w, grpord=60, label="incidence3544w", fmt=10.2);
%s(var=incidence4554m, grpord=61, label="incidence4554m", fmt=10.2);
%s(var=incidence4554w, grpord=62, label="incidence4554w", fmt=10.2);
%s(var=incidence5564m, grpord=63, label="incidence5564m", fmt=10.2);
%s(var=incidence5564w, grpord=64, label="incidence5564w", fmt=10.2);
%s(var=prevalence1519m, grpord=65, label="prevalence1519m", fmt=10.2);
%s(var=prevalence1519w, grpord=66, label="prevalence1519w", fmt=10.2);
%s(var=prevalence2024m, grpord=67, label="prevalence2024m", fmt=10.2);
%s(var=prevalence2024w, grpord=68, label="prevalence2024w", fmt=10.2);
%s(var=prevalence2529m, grpord=69, label="prevalence2529m", fmt=10.2);
%s(var=prevalence2529w, grpord=70, label="prevalence2529w", fmt=10.2);
%s(var=prevalence3034m, grpord=71, label="prevalence3034m", fmt=10.2);
%s(var=prevalence3034w, grpord=72, label="prevalence3034w", fmt=10.2);
%s(var=prevalence3539m, grpord=73, label="prevalence3539m", fmt=10.2);
%s(var=prevalence3539w, grpord=74, label="prevalence3539w", fmt=10.2);
%s(var=prevalence4044m, grpord=75, label="prevalence4044m", fmt=10.2);
%s(var=prevalence4044w, grpord=76, label="prevalence4044w", fmt=10.2);
%s(var=prevalence4549m, grpord=77, label="prevalence4549m", fmt=10.2);
%s(var=prevalence4549w, grpord=78, label="prevalence4549w", fmt=10.2);
%s(var=prevalence5054m, grpord=79, label="prevalence5054m", fmt=10.2);
%s(var=prevalence5054w, grpord=80, label="prevalence5054w", fmt=10.2);
%s(var=prevalence5559m, grpord=81, label="prevalence5559m", fmt=10.2);
%s(var=prevalence5559w, grpord=82, label="prevalence5559w", fmt=10.2);
%s(var=prevalence6064m, grpord=83, label="prevalence6064m", fmt=10.2);
%s(var=prevalence6064w, grpord=84, label="prevalence6064w", fmt=10.2);
%s(var=prevalence65plm, grpord=85, label="prevalence65plm", fmt=10.2);
%s(var=prevalence65plw, grpord=86, label="prevalence65plw", fmt=10.2);
%s(var=r_prev_1519w_4549w, grpord=87, label="r_prev_1519w_4549w", fmt=10.2);
%s(var=r_prev_2024w_4549w, grpord=88, label="r_prev_2024w_4549w", fmt=10.2);
%s(var=r_prev_2529w_4549w, grpord=89, label="r_prev_2529w_4549w", fmt=10.2);
%s(var=r_prev_3034w_4549w, grpord=90, label="r_prev_3034w_4549w", fmt=10.2);
%s(var=r_prev_3539w_4549w, grpord=91, label="r_prev_3539w_4549w", fmt=10.2);
%s(var=r_prev_4044w_4549w, grpord=92, label="r_prev_4044w_4549w", fmt=10.2);
%s(var=r_prev_5054w_4549w, grpord=93, label="r_prev_5054w_4549w", fmt=10.2);
%s(var=r_prev_5559w_4549w, grpord=94, label="r_prev_5559w_4549w", fmt=10.2);
%s(var=r_prev_6064w_4549w, grpord=95, label="r_prev_6064w_4549w", fmt=10.2);
%s(var=r_prev_65plw_4549w, grpord=96, label="r_prev_65plw_4549w", fmt=10.2);
%s(var=r_prev_1519m_4549w, grpord=97, label="r_prev_1519m_4549w", fmt=10.2);
%s(var=r_prev_2024m_4549w, grpord=98, label="r_prev_2024m_4549w", fmt=10.2);
%s(var=r_prev_2529m_4549w, grpord=99, label="r_prev_2529m_4549w", fmt=10.2);
%s(var=r_prev_3034m_4549w, grpord=100, label="r_prev_3034m_4549w", fmt=10.2);
%s(var=r_prev_3539m_4549w, grpord=101, label="r_prev_3539m_4549w", fmt=10.2);
%s(var=r_prev_4044m_4549w, grpord=102, label="r_prev_4044m_4549w", fmt=10.2);
%s(var=r_prev_4549m_4549w, grpord=103, label="r_prev_4549m_4549w", fmt=10.2);
%s(var=r_prev_5054m_4549w, grpord=104, label="r_prev_5054m_4549w", fmt=10.2);
%s(var=r_prev_5559m_4549w, grpord=105, label="r_prev_5559m_4549w", fmt=10.2);
%s(var=r_prev_6064m_4549w, grpord=106, label="r_prev_6064m_4549w", fmt=10.2);
%s(var=r_prev_65plm_4549w, grpord=107, label="r_prev_65plm_4549w", fmt=10.2);
%s(var=p_hivneg_age1549, grpord=108, label="p_hivneg_age1549", fmt=10.2);
%s(var=p_hiv_age1549, grpord=109, label="p_hiv_age1549", fmt=10.2);
%s(var=m15r, grpord=110, label="m15r", fmt=10.2);
%s(var=m25r, grpord=111, label="m25r", fmt=10.2);
%s(var=m35r, grpord=112, label="m35r", fmt=10.2);
%s(var=m45r, grpord=113, label="m45r", fmt=10.2);
%s(var=w15r, grpord=114, label="w15r", fmt=10.2);
%s(var=w25r, grpord=115, label="w15r", fmt=10.2);
%s(var=w45r, grpord=116, label="w15r", fmt=10.2);
%s(var=w55r, grpord=117, label="w15r", fmt=10.2);

***************************************************;
*Append and transpose data;
***************************************************;
*Append all the datasets;
data allstats;
  set n_1 - n_117; 
run;


proc sort data=allstats;
  by grpord catlbl;
run;

*Transpose so one column per comparison group (the prefix labels them col1 - col4);  
proc transpose data=allstats out=tfinal1(drop=_:) prefix=col;
  by grpord catlbl;
  var npcnt;
  id subgp;
run;
*Transpose the N as well;
proc transpose data=allstats out=tfinal2(drop=_:) prefix=num;
  by grpord catlbl;
  var numc;
  id subgp;
run;

*Merge - N is the same for all years so only keep num1;
data final;
  merge tfinal1
        tfinal2 (keep=grpord catlbl num1);
  by grpord catlbl;
run;

*Final data - will contain all data in rows/columns for the table plus ordering variables;
proc sort data=final;
  by grpord catlbl;
run;

***************************************************;
*Produce RTF output;
***************************************************;
options nodate nonumber orientation=landscape;

*Output destination - saving as an rtf file and have specified Journal style (there are others to choose from);
ods listing close;
ods rtf file = "C:\Loveleen\Synthesis model\loveleen_test10.rtf" style=journal; *Can add BODYTITLE option to get this in body of RTF document;
 
title1 "Table 1: Key summary statistics 3rd July 2021";

*This code appears on the rtf as Page x of y. Can be placed as footnote or title and justified as left, centre or right (in this example, j=r);
*footnote1 j=r "{Page \field {\*\fldinst PAGE \\*MERGEFORMAT}} { of \field{\*\fldinst NUMPAGES \\*MERGEFORMAT}}";


*Include all ordering variables and the column variables;
*Width of columns can be set (here set as a percentage of the area);
*SPLIT assigns a character (*) to start a new row - in this example, it is used to put the N= for each column under the column title; 
*ASIS=ON preserves blank spaces at start of text - so allows indenting for row titles;
proc report data=final split='*'; 
  columns (grpord catlbl num1 ("Median (90% range)" col1 col2 col3 col4));
  define grpord      / order noprint;
  define catlbl      / "Variable" flow style(column) = [width = 25% textalign = left asis=on] style(header) =[textalign = left]; 
  define num1        / "N" flow style(column) = [width = 10% textalign = center] style(header) =[textalign = center]; 
  define col1        / "1995" flow style(column) = [width = 15% textalign = center] style(header) =[textalign = center];
  define col2        / "2005" flow style(column) = [width = 15% textalign = center] style(header) =[textalign = center];
  define col3        / "2015" flow style(column) = [width = 15% textalign = center] style(header) =[textalign = center];
  define col4        / "2021" flow style(column) = [width = 15% textalign = center fontweight=bold] style(header) =[textalign = center fontweight=bold];

/*  compute before grpord;  *This inserts a blank line before each change in the variable, grpord, to give a gap between sections;
    line " ";
  endcomp;*/ 
run;  

ods rtf close;
ods listing;

