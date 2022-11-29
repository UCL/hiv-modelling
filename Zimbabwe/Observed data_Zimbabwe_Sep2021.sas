***Observed data, numbers updated by Loveleen Sep 2016, AFTER?;
*starting from "Observed data_Zimbabwe_LBMMay2017.sas
*update in July 2017 and then March 2021;


*CHECK
	- Cowan F. HIV care cascade among female sex workers in zimbabwe: Baseline results of the sAPPH-iRe trial. 
	*********CAREFUL CHECK WHETHER IT IS AWARE OUT OF THOSE POSITIVE,
		O WHETHER IT IS BASICALLY RECENT TESTING (it refers to Sisters with a voice progframme for the period 2009-2013)
		if cald=2011.55 then obs_p_diag_fsw_rds=0.67;




*To export in the program:
	- Proportion of FSW with >=16 newp/3m (oe_p_newple16_fsw_fc), 
							16-54 newp/3m (oe_p_newp1654_fsw_fc=0.41),
							>54   newp/3m (oe_p_newpgt54_fsw_fc=0.23)

	- number of FSW who tested in the last year to compare to the number of FSW attending Sisters with a Voice Clinic 
	 (o_nfsw_sistclin_fc & o_nfsw_sistclin1st_fc)

	- # of HIV+ FSW aged 15-24, # of HIV+ FSW aged >=25, # of HIV+ FSW aged 15-24 diagnosed with HIV, # of HIV+ FSW aged >=25 
	  diagnosed with HIV to be able to calculate proportion diagnosed with HIV for these 2 groups and compare to 
	  obs_p_diag_fsw1524_clsfsw & obs_p_diag_fswge25_clsfsw

	- # of HIV+ FSW aged 15-24 on ART, # of HIV+ FSW aged >=25 on ART to be able to calculate proportion on ART of those diagnosed
	  for these 2 groups and compare to o_p_onart_fsw1524diag_clsfsw & o_p_onart_fswge25diag_clsfsw & o_s_fsw_onart_fc
	- # of HIV+ FSW aged 15-24 VL suppressed on ART, # of HIV+ FSW aged >=25 VL suppressed on ART to be able to calculate 
	  proportion suppressed of those on ART for these 2 groups and compare to o_p_vlsupp_FSW1524onart_clsfsw & 
	  o_p_vlsupp_FSWge25onart_clsfsw;

	*17June2017:
	- # of men on ART, # of women on ART
	- proportion on ART out of all positive 
	- number of people 15-19, 20-24, 25+ (I can obtain this has a difference), male 15+ and female 15+ living with HIV
	- number of people 15-19, 20-24, 25+ (I can obtain this has a difference), male 15+ and female 15+  on ART
	- hiv positive people in care who have had tb and then calculate the proportion out of those positive in care
	- number of people diagnosed in the last year
	- number of people diagnosed & initiated on ART in the last year (in the same year)
	- number of diagnoses in men 15-65 and in women 15-65, number separately of men and women diagnosed in hospital, vct anc, 
	  and because of tb
	- number of people at stage 3 a month ago and number of people staged 3m and now on ART, the same for 12m
	- number of pregnant women who initiate on ART/PMTCT within 3m
	- proportion on 2nd line at 12m since ART init
	- I have renamed o_s_rec_vct_Z_GF_w_ly with o_s_rec_htc_Z_GF_w_ly, I have added the following observed data - 
	  o_s_rec_htc_Z_all_ly_PSI   o_s_rec_comhtc_Z_all_ly_PSI=425000
	- the proportion of tests conducted in circumcision should be less than 20%
	- the prop of tests conducted in ANC should be around 40%, based on the fact that Karin said that most tests done by 
	  government are done in ANC;
*Look for 17June2016;


*******************************************************************************************
************************************     CONTENT   ************************************
*******************************************************************************************
1.  Population...................................Line 77
2.  Fertility....................................Line 343
3.  Mortality....................................Line 439
4.  Prevalence...................................Line 615
5.  Incidence....................................Line 1027
6.  Number living with HIV ......................Line 1179
7.  Sexual behaviour.............................Line 1239
8.  Testing......................................Line 1416
9.  Linkage from testing to ART Uptake...........Line 1942
10. On ART: In need, started, on ART.............Line 1975
11. Median CD4 at diagnosis and ART initiation...Line 2324
12. Virological outcomes on 1st line.............Line 2383
13. Retention on ART.............................Line 2493
14. Resistance...................................Line 2661
15. Male circumcision............................Line 2729
16. PrEP.........................................Line 2840
17. Sexually transmitted infections..............Line 2855
18. Tubercolosis.................................Line 2865

*******************************************************************************************
*********************************     1. Population    ************************************
*******************************************************************************************

***Overall;

***LBM update Sep2016 - 2002 rounded numbers replaced by exact and 2012 preliminary numbers replaced by confirmed;
 
*Source: Zimbabwe Census in 2002;
*http://catalog.ihsn.org/index.php/catalog/4123;

if cald=2002.5 then do;
	o_pop_all_Zi_cens   =11631657;
	o_pop_allm_Zi_cens  = 5634180;
	o_pop_allw_Zi_cens  = 5997477;
end;

*Source: Zimbabwe Census 2012;
*http://www.zimstat.co.zw/sites/default/files/img/National_Report.pdf;
*Using Table 1.3 Page 18, 49.9% of total are aged 15-49. 24.7% men and 25.2% women;
if cald=2012.5 then do;
	o_pop_all_Zi_cens   =13061239;
	o_pop_allm_Zi_cens  =6282456;
	o_pop_allw_Zi_cens  =6778783;
	o_pop_1549_Zi_cens	=6517558;
	o_pop_1549m_Zi_cens	=3226126;
	o_pop_1549w_Zi_cens	=3291432;
end;

*Compare to:
- s_alive1549_w  
- s_alive1549_m  
t_alive1549_
t_alive1565_
- s_age_1549
t_alive1565m_  t_alive1565w_
t_ageg1m  t_ageg6m
  t_ageg1w  t_ageg6w;

*Source: "Zimbabwe data.xls" sent by David Wilson;
if cald=2002.5 then do;
	o_pop_1524m_dw=1300419;
	o_pop_1524w_dw=1424878;
	o_pop_2549m_dw=1438836;
	o_pop_2549w_dw=1573763;
	o_pop_50plm_dw=537383;
	o_pop_50plw_dw=632762;
end;
if cald=2012.5 then do;
	o_pop_1524m_dw=1253879;
	o_pop_1524w_dw=1371430;
	o_pop_2549m_dw=1763267;
	o_pop_2549w_dw=1920002;
	o_pop_50plm_dw=587756;
	o_pop_50plw_dw=796736;
end;
o_pop_1549m_dw = o_pop_1524m_dw+o_pop_2549m_dw;
o_pop_1549w_dw = o_pop_1524w_dw+o_pop_2549w_dw;


*Source:USIDB, from Halteres report;
if cald=2013.5 then do;
	o_pop_1549_Zi_USIDB=6700000;
	o_pop_w1549_Zi_USIDB=3300000;
	o_pop_m1549_Zi_USIDB=3400000;
end;


*Source CIA: https://www.cia.gov/library/publications/the-world-factbook/geos/zi.html (accessed 19/05/2013) (no longer available);
if cald=2013.5 then do;
	o_pop_all_Zi_CIA  =13182908;
	o_pop_1565_Zi_CIA = 7514258;*13182908-(0.394*13182908)-(0.036*13182908);
	o_pop_1524_Zi_CIA = 2966154;*22.5% of total;
	o_pop_1524m_Zi_CIA= 1472186;
	o_pop_1524W_Zi_CIA= 1493816;
	o_pop_2554_Zi_CIA = 4060335;*30.8%;
	o_pop_2554m_Zi_CIA= 2039943;
	o_pop_2554W_Zi_CIA= 2018589;
	o_pop_5564_Zi_CIA =  487767;*3.7%;
	o_pop_5564m_Zi_CIA=  176951;
	o_pop_5564W_Zi_CIA=  311113;

	o_pop_1564m_Zi_CIA=  3512129;

	*From graph;
	o_pop_4064_Zi_CIA = 1506814;*55-64 176951, 50-54 100,000 45-49 185,000, 40-45 233750;
	o_pop_4064m_Zi_CIA=  695701;*55-64 176951, 50-54 100,000 45-49 185,000, 40-45 233750;
	o_pop_4064w_Zi_CIA=  811113;*55-64 311113, 50-54 170,000 45-49 160,000  40-44 170,000 ;
end;

*0-14 years: 39.4% (male 2,623,606/female 2,570,028)
 65 years and over: 3.6% (male 193,147/female 283,529) (2013 est.) ;


***LBM update Sep2016 - CIA website updated in Sep 2016;
*Source CIA: https://www.cia.gov/library/publications/the-world-factbook/geos/zi.html (Accessed Sep 2016);
if cald=2016.75 then do;
	o_pop_all_Zi_CIA  =14546961;
	o_pop_1565_Zi_CIA = 8538412;
	o_pop_1524_Zi_CIA = 3096943;
	o_pop_1524m_Zi_CIA= 1560833;
	o_pop_1524W_Zi_CIA= 1536110;
	o_pop_2554_Zi_CIA = 4925135;
	o_pop_2554m_Zi_CIA= 2578142;
	o_pop_2554W_Zi_CIA= 2346993;
	o_pop_5564_Zi_CIA =  516334;
	o_pop_5564m_Zi_CIA=  188851;
	o_pop_5564W_Zi_CIA=  327483;

	o_pop_1564m_Zi_CIA=  4327826;
end;

*0-14 years: 37.8% (male 2778806/female 2720033)
 65 years and over: 3.5% (male 194933/female 314777) (2016 est.) ;

*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021); 
*"according to the 2017 Inter -Censual Demographic Projections Report";
if cald=2019.5 then o_pop_all_Zi=15800000;





*** Female sex workers (FSW) population;

*Source: "Zimbabwe data.xls" sent by David Wilson;
if cald=2002.5 then do; o_pop_fsw_dw=80963; o_pop_fsw_ll_dw=29986; o_pop_fsw_ul_dw=239891;end;
if cald=2012.5 then do; o_pop_fsw_dw=88869; o_pop_fsw_ll_dw=32914; o_pop_fsw_ul_dw=263315;end;

***LBM May 2017 -  Need to set lower and upper limits on FSW population for calibration runs;
*Source: Estimates of the number of female sex workers in different regions of the world, Vandepitte 2006
 Lower and upper bounds taken for SSA: 0.4% and 4.3%. These are applied to Census 2012 figures (1549w=3291432);
if cald=2006 then do;o_pop_fsw_ll_van=13166;o_pop_fsw_ul_van=141532;end;


***LBM Update Sep2016 - updated Census figures now used;
*** >=1 TS partner in last 6 months;

*Source: NBCP Presentation by Frances Cowan, Slide 15, 10.7% in 2011
		 Estimated by multiplying % with >=1 TS partner in the last 6m by the female population aged 15-49 in the 2012 Census
		 (Using Table 1.3: 25.2%*13061239 =3291432);
if cald=2012.5 then do; o_pop_fsw_nbcs=349826; end;

*** >1 TS partner in last 6 months;

*Source: Presentation by Frances Cowan, Slide 15, 1.2% in 2011
		 Estimated as above - 1.2% * 3291432;
if cald=2012.5 then do; o_pop_ab1ts6m_nbcs=39497; end;

***LBM update Sep 2016 - NBCP paper now published;
*** >=1 TS partner in last 12 months (Notes made by VC (Notes_CEA_meeting_28Jan2016_final (002)_LBM) state 1 TSP should not be 
	considered as FSW);

*Source: Population-Level Impact of Zimbabwe's National Behavioural Change Programme, Buzdugan, Cowan 2015,5.1%+3.8%=8.9% in 2011
		 Estimated as above - 8.9% * 3291432;
if cald=2012.5 then do; o_pop_fsw_1ts12m_nbcs=292937; end;

***LBM update Sep2016 - NBCP numbers updated so values below recalculated;

***Female sex workers who consistently use condom
*Source: clsfsw at end of Sapphire trial 2013 - 59.3% (36.4-83.3) 

***LBM May 2017 - cannot find above estimate. Replace with 41% - 
*Source:  RDS 2016 - Sapphire endline results, 776/1311 (0.59 [0.45 - 0.73]) reported having CONDOMLESS sex, 
		  implying 41% CCU in 2016


Numbers below are estimated by multiplying 67.7% with David Wilson's and NBCP estimates above
(In Document “Sisters numbers v4” circulated in Mar 2016 55% used condom at last sex);

/* these numbers were calculated using the 59.3% which we are now unable to find;
if cald=2002.5 then do; o_pop_fswccu_dw=48011; o_pop_fswccu_ll_dw= 10915; o_pop_fswccu_ul_dw=199829;end;
if cald=2012.5 then do; 
	o_pop_fswccu_dw=52699; 		 o_pop_fswccu_ll_dw=11981; 		  o_pop_fswccu_ul_dw=219341;

	o_pop_fswccu_nbcs=207447; 	 o_pop_fswccu_ll_nbcs=127337;	  o_pop_fswccu_ul_nbcs=291405;
	o_pop_ccuab1ts6m_nbcs=23264; o_pop_ccuab1ts6m_ll_nbcs=14281;  o_pop_ccuab1ts6m_ul_nbcs=32681;
	o_pop_ccu1ts12m_nbcs=172549; o_pop_ccu1ts12m_ll_nbcs=105916;  o_pop_ccu1ts12m_ul_nbcs=242384;
end;

*/


if cald=2002.5 then do; o_pop_fswccu_dw=33195; o_pop_fswccu_ll_dw= 12294; o_pop_fswccu_ul_dw=98355;end;
if cald=2012.5 then do; o_pop_fswccu_dw=36436; o_pop_fswccu_ll_dw=13495;  o_pop_fswccu_ul_dw=107959;

						o_pop_fswccu_nbcs=143429; 	 
						o_pop_ccuab1ts6m_nbcs=16194; 
						o_pop_ccu1ts12m_nbcs=120104; 
end;

if cald=2006 then do;o_pop_fswccu_ll_van=8913;o_pop_fsw_ul_van=95817;end;

***Female sex workers who DO NOT USE condom consistently
   Calculated as the difference between the total # of FSW and those who do use condom consistently;
if cald=2002.5 then do; o_pop_fswcls_dw=47768; o_pop_fswcls_ll_dw=17692; o_pop_fswcls_ul_dw=141536;end;
if cald=2012.5 then do; o_pop_fswcls_dw=52433; o_pop_fswcls_ll_dw=19419; o_pop_fswcls_ul_dw=155356;

						o_pop_fswcls_nbcs=206397;	 
						o_pop_clsab1ts6m_nbcs=23303; 
						o_pop_cls1ts12m_nbcs=142833;  
end;

***Use this to restrict runs during calibration;
if cald=2006 then do;o_pop_fswcls_ll_van=4253;o_pop_fswcls_ul_van=45715;end;

*Compare to:
s_whr_1565_;

*** Number of FSW seen in the programme over 5 years (2009-2013) is more than 17800;
*Source: Frances Cowan  presentation at AIDS Conference 2014;
if cald=2011.5 then o_fsw_seen_py_cowan=3560;


*** Proportion of the population who are FSW;

*Source: NBCP Presentation by Frances Cowan, Slide 15;
*Sex worker definition: 
	- o_p_fsw_ab1ts6m_1849w_nbcs: >=2 transactional sex partners in the last 6 months
	- o_p_fsw_1ts6m_1849w_nbcs:   1 transactional sex partners in the last 6 months;

***LBM update Sep2016;
*Source: Population-Level Impact of Zimbabwe's National Behavioural Change Programme, Cowan 2015,5.1%+3.8%=8.9% in 2011
	- o_p_fsw_1ts12m_1849w_nbcs:   >=1 transactional sex partners in the last 12 months;

if cald=2011.5 then do;
	o_p_fsw_ab1ts6m_1849w_nbcs=0.012;
	o_p_fsw_1ts6m_1849w_nbcs  =0.095;
	o_p_fsw_ts6m_1849w_nbcs   =0.107;
	o_p_fsw_1ts12m_1849w_nbcs =0.089;
end;

*Source: email from Debra tenBrink on 22/12/2021 reporting as source 2016 Respondent Driven Sampling Survey;
if cald=2016.5 then o_p_fsw_1549w_rdss=0.012;
*In Goals 1.2% of women 15-49 are FSW based on 45,000 FSW from UNAIDS Key Population Atlas and a 15-49 female population of 3,634,000 from World Population Prospects 2019;


*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021); 
*Note1: the denominator is female adults (18-49?);
*Note2: the calendar year was not indictaed;
if cald=2019.5 then do;
	o_p_fsw_1849_Zim_garpr=0.013;
	o_p_fsw_1849_Bulaw_garpr=0.033;
	o_p_fsw_1849_Harare_garpr=0.019;
end;


*** Proportion of the population who have ever been FSW;
*Source:  NBCP Presentation by Frances Cowan, Slide 15;
*Sex worker definition: ever had transactional sex;
if cald=2011.5 then o_p_ever_fsw_1ts_1849w_nbcs=0.144;


*** Age distribution among FSW;
*Source: clsfsw survey last quarter 2013;
if cald=2013.75 then do;
	o_p_1824_fsw_rds= 0.268; o_p_1824_fsw_ll_rds= 0.162; o_p_1824_fsw_ul_rds= 0.373;
	o_p_2529_fsw_rds= 0.221; o_p_2529_fsw_ll_rds= 0.197; o_p_2529_fsw_ul_rds= 0.247;
	o_p_3039_fsw_rds= 0.360; o_p_3039_fsw_ll_rds= 0.286; o_p_3039_fsw_ul_rds= 0.417;
	o_p_ab40_fsw_rds= 0.151; o_p_ab40_fsw_ll_rds= 0.090; o_p_ab40_fsw_ul_rds= 0.198;
end;



*******************************************************************************************
************************************     Fertility     ************************************
*******************************************************************************************

***Total births per woman;

*Source: World Bank Fetility Rate. Website accessed Sep 2016 "http://data.worldbank.org/indicator/SP.DYN.TFRT.IN?locations=ZW";
if cald=1990 then o_s_fertility_wb=5.18;
if cald=1995 then o_s_fertility_wb=4.43;
if cald=2000 then o_s_fertility_wb=4.07;
if cald=2002 then o_s_fertility_wb=4.02;
if cald=2004 then o_s_fertility_wb=4.01;
if cald=2006 then o_s_fertility_wb=4.01;
if cald=2008 then o_s_fertility_wb=4.03;
if cald=2010 then o_s_fertility_wb=4.05;
if cald=2012 then o_s_fertility_wb=4.02;
if cald=2014 then o_s_fertility_wb=3.92;

*Source: Trading economics. Website accessed Sep 2016 "http://www.tradingeconomics.com/zimbabwe/fertility-rate-total-births-per-woman-wb-data.html;
if cald=1990 then o_s_fertility_te=5.2;
if cald=2000 then o_s_fertility_te=3.9;
if cald=2010 then o_s_fertility_te=3.3;

*Source: YAS 2001-2002, MOH. Survery performed 1999-2001;
if cald=2000 then o_s_fertility_1529=2.4;

*Source: Zimbabwe Census 2002 and 2012;
if cald=2002 then o_s_fertility_cens=3.6;
if cald=2012 then o_s_fertility_cens=3.8;

*Source: DHS 1994, 1999, 2005-6, 2010-11, 2015;
if cald=1994 then o_s_fertility_dhs=4.3; *survey 1991-1994;
if cald=1999 then o_s_fertility_dhs=4.0; *survey 1996-1999;
if cald=2005 then o_s_fertility_dhs=3.8; *survey 2003-2005;
if cald=2011 then o_s_fertility_dhs=4.1; *survey 2010-2011;
if cald=2015 then o_s_fertility_dhs=4.0;

*Source: Unicef Multiple Indicator Monitoring Survey MIMS 2009;
if cald=2009 then o_s_fertility_mims=3.7; 
if cald=2014 then o_s_fertility_mims=4.3; 

*Source: CIA website, accessed Sep 2016 "https://www.cia.gov/library/publications/the-world-factbook/geos/zi.html";
if cald=2016 then o_s_fertility_cia=3.5;
if cald=2014 then o_s_fertility_cia=3.56; *(page no longer active, number reported from Vale's Zimbabwe Summary data file);

*Source: United Nations World Population Prospects, 2012 revision
         "https://esa.un.org/unpd/wpp/Publications/Files/WPP2012_Volume-I_Comprehensive-Tables.pdf";
if cald=2000 then o_s_fertility_un2012=4.20; 
if cald=2005 then o_s_fertility_un2012=4.01; 
if cald=2010 then o_s_fertility_un2012=3.90;  
if cald=2015 then o_s_fertility_un2012=3.51;  
if cald=2020 then o_s_fertility_un2012=3.20;

*Source: United Nations World Population Prospects, 2015 revision
         "https://esa.un.org/unpd/wpp/Publications/Files/WPP2015_Volume-I_Comprehensive-Tables.pdf";
if cald=2000 then o_s_fertility_un2015=4.20; 
if cald=2005 then o_s_fertility_un2015=4.02; 
if cald=2010 then o_s_fertility_un2015=4.02;  
if cald=2015 then o_s_fertility_un2015=4.02;  
if cald=2020 then o_s_fertility_un2015=3.65;





***Number of expected live births;
*Source:“Zimbabwe_PMTCT_surveillance_protocol_231215” at page 16 where it is cited "Health Information, Ministry of Health and Child Care, Zimbabwe";
*In an email by Frances Cowan on 4/11/2016 she confirmed aroun 400,000 deliveries a year;
*Update VC Nov 2016;
if cald=2011.5 then o_s_livebirths_MoH=412122;

***Number of live births;
*Source: comment by Loveleen on document "Issue_with_testing_in_ANC" mentioning WHO;
*Update VC Nov 2016;
if cald=2013.5 then o_s_allbirths_WHO=398474;


***Number of expected pregnancies;
*Source: "Maternal PMTCT Cascade Jan-Jun 2016.ppt" sent by Mutsa Mhangara (Zimbabwe MoH) on 5th November 2016;
*Update VC Nov 2016;
if cald=2016.5 then o_s_exppregn_MoH=433914;


*Source: Census 2012 - Fertility rates by age, Page 111;
if cald=2012 then do;
	o_fert_1519_cens=0.08;
	o_fert_2024_cens=0.195;
	o_fert_2529_cens=0.19;
	o_fert_3034_cens=0.155;
	o_fert_3539_cens=0.105;
	o_fert_4044_cens=0.04;
	o_fert_4549_cens=0.01;
end;



*******************************************************************************************
************************************     Mortality     ************************************
*******************************************************************************************

***HIV Deaths Adults and Children;

*Source: UNAIDS Global report 2010, page 185;
if cald=2009 then o_s_deaths_aduchild_UNAIDS_09=83000;

***LBM update Sep2016;
*Source: UNAIDS Global report 2012, page 130;
if cald=2011 then o_s_deaths_aduchild_UNAIDS_11=58000; *53000-65000 range

* Source: Gregson: death rates per 100 person years in adults;
if cald=1990 then do; 
	o_r_death_all_Harare=0.475;*Harare regsitered deaths;
	o_r_death_all_Reg=0.65;*estimated from vital registration data;
end;
if cald=1995 then do; 
	o_r_death_all_Harare=0.975;*Harare regsitered deaths;
	o_r_death_all_Reg=1.5;*estimated from vital registration data;
end;
if cald=2000 then do; 
	o_r_death_all_Harare=1.1;*Harare regsitered deaths;
	o_r_death_all_Reg=1.7;*estimated from vital registration data;
end;
if cald=2001 then o_r_death_all_Manicaland=3;
if cald=2005 then o_r_death_all_Manicaland=3;



*Age specific mortality among men and women aged 15-49 (from graphs) per 100 person years;
*Source: DHS 2005-6, page 238;
if cald=1994.5 then do;
	o_r_death_1519m_Zim=0.05;  o_r_death_1519w_Zim=0.15; 
	o_r_death_2024m_Zim=0.20;  o_r_death_2024w_Zim=0.2;
    o_r_death_2529m_Zim=0.35;  o_r_death_2529w_Zim=0.35; 
	o_r_death_3034m_Zim=0.5;   o_r_death_3034w_Zim=0.4;
	o_r_death_3539m_Zim=0.6;   o_r_death_3539w_Zim=0.5;
    o_r_death_4044m_Zim=0.95;  o_r_death_4044w_Zim=0.55; 
	o_r_death_4549m_Zim=1.15;  o_r_death_4549w_Zim=0.6;
end;
if cald=1999.5 then do;
	o_r_death_1519m_Zim=0.05; o_r_death_1519w_Zim=0.25; 
	o_r_death_2024m_Zim=0.5;  o_r_death_2024w_Zim=0.5; 
	o_r_death_2529m_Zim=0.95; o_r_death_2529w_Zim=1.1; 
	o_r_death_3034m_Zim=2.0;  o_r_death_3034w_Zim=1.5;
	o_r_death_3539m_Zim=2.2;  o_r_death_3539w_Zim=1.65; 
	o_r_death_4044m_Zim=2.35; o_r_death_4044w_Zim=1.2;
    o_r_death_4549m_Zim=2.95; o_r_death_4549w_Zim=1.25; 
end;

***LBM update Sep 2016 using DHS 2010-2011, page 277 (actual numbers presented whereas were read of graphs in DHS 2005-6);
if cald=2006 then do;
	o_r_death_1519m_Zim=0.07; o_r_death_1519w_Zim=0.27; 
	o_r_death_2024m_Zim=0.34; o_r_death_2024w_Zim=0.55; 
	o_r_death_2529m_Zim=0.90; o_r_death_2529w_Zim=1.23; 
	o_r_death_3034m_Zim=2.01;  o_r_death_3034w_Zim=2.04;
	o_r_death_3539m_Zim=2.77;  o_r_death_3539w_Zim=2.50; 
	o_r_death_4044m_Zim=3.71;  o_r_death_4044w_Zim=2.52; 
	o_r_death_4549m_Zim=3.65; o_r_death_4549w_Zim=2.65;
end;

***LBM update Sep 2016;
* Source: DHS 2010-2011, page 277;
if cald=2011 then do;
	o_r_death_1519m_Zim=0.23; o_r_death_1519w_Zim=0.25; 
	o_r_death_2024m_Zim=0.34; o_r_death_2024w_Zim=0.52; 
	o_r_death_2529m_Zim=0.64; o_r_death_2529w_Zim=0.96; 
	o_r_death_3034m_Zim=1.4;  o_r_death_3034w_Zim=1.64;
	o_r_death_3539m_Zim=2.3;  o_r_death_3539w_Zim=2.07; 
	o_r_death_4044m_Zim=3.0;  o_r_death_4044w_Zim=2.33; 
	o_r_death_4549m_Zim=3.2;  o_r_death_4549w_Zim=2.26;
end;
*Compare to:
death_rate1519m_all  death_rate2024m_all  death_rate2529m_all  death_rate3034m_all 	death_rate3539m_all  death_rate4044m_all  death_rate4549m_all
death_rate1519w_all  death_rate2024w_all  death_rate2529w_all  death_rate3034w_all  death_rate3539w_all  death_rate4044w_all  death_rate4549w_all 
;

*Crude death rate, expressed in 100 person-years;	
*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021,;
*The following are for all ages;
if cald=1992.5 then o_r_death_cens=0.95;
if cald=1993.5 then do;                     o_r_death_m_dhs=0.442;o_r_death_w_dhs=0.413;end;
if cald=1999.5 then do;                     o_r_death_m_dhs=1.335;o_r_death_w_dhs=0.940;end;
if cald=2002.5 then o_r_death_cens=1.72;
if cald=2006   then do;                     o_r_death_m_dhs=1.330;o_r_death_w_dhs=1.270;end;
if cald=2011   then do;                     o_r_death_m_dhs=1.150;o_r_death_w_dhs=1.140;end;
if cald=2002.5 then o_r_death_cens=1.02;

*2012 Census Age Specific deaths, expressed in 100 perosn-years;
*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021;
if cald=2012   then do;
	o_r_death_1519m_cens=0.204;o_r_death_1519w_cens=0.224;
	o_r_death_2024m_cens=0.412;o_r_death_2024w_cens=0.426;
	o_r_death_2529m_cens=0.651;o_r_death_2529w_cens=0.683;
	o_r_death_3034m_cens=1.003;o_r_death_3034w_cens=0.960;
	o_r_death_3539m_cens=1.343;o_r_death_3539w_cens=1.180;
	o_r_death_4044m_cens=1.618;o_r_death_4044w_cens=1.222;
	o_r_death_4549m_cens=1.909;o_r_death_4549w_cens=1.262;
	o_r_death_5054m_cens=1.937;o_r_death_5054w_cens=1.061;
	o_r_death_5559m_cens=1.944;o_r_death_5559w_cens=1.135;
	o_r_death_6064m_cens=2.661;o_r_death_6064w_cens=1.568;
	o_r_death_6569m_cens=2.915;o_r_death_6569w_cens=1.775;
	o_r_death_7074m_cens=3.842;o_r_death_7074w_cens=2.489;
	o_r_death_7579m_cens=5.447;o_r_death_7579w_cens=3.231;
	o_r_death_80plm_cens=9.535;o_r_death_80plw_cens=7.129;

	o_r_death_15plm_cens=1.215;o_r_death_15plw_cens=0.984;

end;

*** HIV related deaths;

*0+;
*Estimated number of HIV-related deaths 
*Source (indicated in an email on 11 Nov 2015 by David Wilson);
if cald=2000.5 then o_s_deaths_HIVrel_GARPR = 66663;	
if cald=2001.5 then o_s_deaths_HIVrel_GARPR = 70977;
if cald=2002.5 then o_s_deaths_HIVrel_GARPR = 73778;
if cald=2003.5 then o_s_deaths_HIVrel_GARPR = 75133;
if cald=2004.5 then o_s_deaths_HIVrel_GARPR = 74965;
if cald=2005.5 then o_s_deaths_HIVrel_GARPR = 71551;
if cald=2006.5 then o_s_deaths_HIVrel_GARPR = 66721;
if cald=2007.5 then o_s_deaths_HIVrel_GARPR = 59934;
if cald=2008.5 then o_s_deaths_HIVrel_GARPR = 49855;
if cald=2009.5 then o_s_deaths_HIVrel_GARPR = 33776;

if cald=2010.5 then o_s_deaths_HIVrel_GARPR = 41455;
if cald=2011.5 then o_s_deaths_HIVrel_GARPR = 27135;
if cald=2012.5 then o_s_deaths_HIVrel_GARPR = 23550;
if cald=2013.5 then o_s_deaths_HIVrel_GARPR = 21018;
if cald=2014.5 then o_s_deaths_HIVrel_GARPR = 18942;

*0+;
*Source: Spectrum (indicated in an email on 11 Nov 2015 by David Wilson);
if cald=2014.5 then o_s_deaths_HIVrel_Spectrum = 39000;
*Compare to s_death_hivrel;

***LBM update Sep2016;
*Source: Global AIDS Response Country Progress Report Zimbabwe 2016. 
http://www.unaids.org/sites/default/files/country/documents/ZWE_narrative_report_2016.pdf;

if cald=2011.5 then      o_s_deaths_HIVrel_GARCPR = 115117;
if cald=2012.5 then      o_s_deaths_HIVrel_GARCPR =  87335;
if cald=2013.5 then      o_s_deaths_HIVrel_GARCPR =  61476;
if cald=2014.5 then      o_s_deaths_HIVrel_GARCPR =  54994; 
if cald=2015.5 then      o_s_deaths_HIVrel_GARCPR =  31217;

*adults;
if cald=2010.5 then      o_s_deaths_HIVrel_adults_GARCPR = 71299;* reported on Zimbabwe National HIV and AIDS strategic plan 2011-2015;
if cald=2010.5 then      o_s_deaths_HIVrel_adults_GARCPR = 63765;* LBM SEP2016 GARCPR 2012;

*Source: draft paper by Tsitsi Mutasa-Apollo entitled "Proposal_v1_25 Nov_15"
 She references "2013 Zimbabwe HIV Size estimates";
if cald=2011.5 then      e_s_deaths_HIVrel_Mutasa = 76000;
if cald=2015.5 then      t_s_deaths_HIVrel_Mutasa = 27000;



*** AIDS-related cause mortality;
*Source: Global AIDS Response Country Progress Report Zimbabwe 2020, page 12;
if cald=2010.5 then do;o_r_aidsdeath_Zim_GARPR=0.004094;o_ll_r_aidsdeath_Zim_GARPR=0.00330;o_ul_r_aidsdeath_Zim_GARPR=0.00500;end;
if cald=2011.5 then do;o_r_aidsdeath_Zim_GARPR=0.00320;o_ll_r_aidsdeath_Zim_GARPR=0.00250;o_ul_r_aidsdeath_Zim_GARPR=0.00370;end;
if cald=2012.5 then do;o_r_aidsdeath_Zim_GARPR=0.00245;o_ll_r_aidsdeath_Zim_GARPR=0.00200;o_ul_r_aidsdeath_Zim_GARPR=0.00300;end;
if cald=2013.5 then do;o_r_aidsdeath_Zim_GARPR=0.00205;o_ll_r_aidsdeath_Zim_GARPR=0.00170;o_ul_r_aidsdeath_Zim_GARPR=0.00250;end;
if cald=2014.5 then do;o_r_aidsdeath_Zim_GARPR=0.00180;o_ll_r_aidsdeath_Zim_GARPR=0.00150;o_ul_r_aidsdeath_Zim_GARPR=0.00225;end;
if cald=2015.5 then do;o_r_aidsdeath_Zim_GARPR=0.00165;o_ll_r_aidsdeath_Zim_GARPR=0.00130;o_ul_r_aidsdeath_Zim_GARPR=0.00200;end;
if cald=2016.5 then do;o_r_aidsdeath_Zim_GARPR=0.00155;o_ll_r_aidsdeath_Zim_GARPR=0.00125;o_ul_r_aidsdeath_Zim_GARPR=0.00190;end;

if cald=2017.5 then do;o_r_aidsdeath_Zim_GARPR=0.00152;o_ll_r_aidsdeath_Zim_GARPR=0.00122;o_ul_r_aidsdeath_Zim_GARPR=0.00185;end;
if cald=2018.5 then do;o_r_aidsdeath_Zim_GARPR=0.00140;o_ll_r_aidsdeath_Zim_GARPR=0.00115;o_ul_r_aidsdeath_Zim_GARPR=0.00165;end;
if cald=2019.5 then do;o_r_aidsdeath_Zim_GARPR=0.001267;o_ll_r_aidsdeath_Zim_GARPR=0.00105;o_ul_r_aidsdeath_Zim_GARPR=0.00155;end;



*******************************************************************************************
************************************    Prevalence     ************************************
*******************************************************************************************

*** Antenatal clinics;
*Prevalence for individual ANC sites;
*Source: UNAIDS "Evidence for HIV decline in Zimbabwe", Page 11, Figure 2;
if cald=1995.5 then do; o_prev1549w_Z_anc_unaids=0.25; o_prev1549w_Z_anc_ll_unaids=0.15; o_prev1549w_Z_anc_ul_unaids=0.33; end;

*Source: Mahomwa STI 2006 & ANC sentinel sites, cited by Global AIDS Response Progress Country Report 2012, Page 14
		(Mahomva A, Greby S, Dube S, et al. HIV prevalence and trends from data in Zimbabwe, 1997-2004. 
		 Sex Transm Infect 2006 Apr, 82 Suppl 1:i42-i47.);
if cald=2002.5 then do; o_prev1549w_Z_anc=0.258; o_prev1524w_Z_anc=0.208; end;
if cald=2004.5 then do; o_prev1549w_Z_anc=0.213; o_prev1524w_Z_anc=0.174; end;
if cald=2006.5 then do; o_prev1549w_Z_anc=0.177; o_prev1524w_Z_anc=0.125; end;
if cald=2009.5 then do; o_prev1549w_Z_anc=0.161; o_prev1524w_Z_anc=0.116; end;

*Source: Global AIDS Response Progress Country Report (Pregnant women 15-24), page 5 2014;
if cald=2011.5 then do;                          o_prev1524w_Z_anc_garcpr=0.125; end;
if cald=2012.5 then do;                          o_prev1524w_Z_anc_garcpr=0.116; end;
if cald=2013.5 then do;                          o_prev1524w_Z_anc_garcpr=0.098; end;

***LBM Sep 2016 update - no further ANC estimates in subsequent GARPCR 2015 or 2016 Key Indicators reports;

*Source: "Policy brief_Option A IE (3).doc" sent by Frances Cowan on 4th November 2016;
*Update VC Nov 2016;
if cald=2012.5 then o_prev_Z_anc_Cowan=0.126;
if cald=2014.5 then o_prev_Z_anc_Cowan=0.136;

*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021,;
if cald=2000.5 then do; o_prev1519w_Z_anc=0.256; o_prev2024w_Z_anc=0.322; o_prev2529w_Z_anc=0.371; 
						o_prev3034w_Z_anc=0.414; o_prev3539w_Z_anc=0.295; o_prev4044w_Z_anc=0.119;
						o_prev4549w_Z_anc=.; 
						o_prev1549w_Z_anc=0.325;end;
if cald=2001.5 then do; o_prev1519w_Z_anc=0.196; o_prev2024w_Z_anc=0.290; o_prev2529w_Z_anc=0.366; 
						o_prev3034w_Z_anc=0.402; o_prev3539w_Z_anc=0.310; o_prev4044w_Z_anc=0.231;
						o_prev4549w_Z_anc=0.182; 
						o_prev1549w_Z_anc=0.295;end;
if cald=2002.5 then do; o_prev1519w_Z_anc=0.191; o_prev2024w_Z_anc=0.290; o_prev2529w_Z_anc=0.385; 
						o_prev3034w_Z_anc=0.374; o_prev3539w_Z_anc=0.364; o_prev4044w_Z_anc=0.239;
						o_prev4549w_Z_anc=0.143; 
						o_prev1549w_Z_anc=0.296;end;
if cald=2004.5 then do; o_prev1519w_Z_anc=0.137; o_prev2024w_Z_anc=0.241; o_prev2529w_Z_anc=0.308; 
						o_prev3034w_Z_anc=0.304; o_prev3539w_Z_anc=0.284; o_prev4044w_Z_anc=0.172;
						o_prev4549w_Z_anc=0.318; 
						o_prev1549w_Z_anc=0.239;end;
if cald=2006.5 then do; o_prev1519w_Z_anc=0.085; o_prev2024w_Z_anc=0.156; o_prev2529w_Z_anc=0.249; 
						o_prev3034w_Z_anc=0.256; o_prev3539w_Z_anc=0.230; o_prev4044w_Z_anc=0.190;
						o_prev4549w_Z_anc=0.187; 
						o_prev1549w_Z_anc=0.181;end;
if cald=2009.5 then do; o_prev1519w_Z_anc=0.07; o_prev2024w_Z_anc=0.141; o_prev2529w_Z_anc=0.203; 
						o_prev3034w_Z_anc=0.250; o_prev3539w_Z_anc=0.249; o_prev4044w_Z_anc=0.203;
						o_prev4549w_Z_anc=0.2; 
						o_prev1549w_Z_anc=0.164;end;
if cald=2012.5 then do; o_prev1519w_Z_anc=0.041; o_prev2024w_Z_anc=0.053; o_prev2529w_Z_anc=0.667; 
						o_prev3034w_Z_anc=0.736; o_prev3539w_Z_anc=0.740; o_prev4044w_Z_anc=0.595;
						o_prev4549w_Z_anc=0.12; 
						o_prev1549w_Z_anc=0.059;end;



*** General population;
*Source for 2010 estimates: UNAIDS Epidemiological Factsheet 2010, Zimbabwe Ministry of Health and Child Welfare, Graph Page 1. Assume data modelled. 
*Source for 2014 estimates: UNAIDS AIDSInfo Interactive page 2014. Website no longer available in 2016;	 				

if cald=1990.5 then do; m_prev1549_2010unaids=0.10; m_prev1549_2014unaids=0.116; m_prev1524m_2014unaids=0.057; m_prev1524w_2014unaids=0.096; end;
if cald=1992.5 then do; m_prev1549_2010unaids=0.18; m_prev1549_2014unaids=0.186; m_prev1524m_2014unaids=0.085; m_prev1524w_2014unaids=0.148;  end;
if cald=1994.5 then do; m_prev1549_2010unaids=0.23; m_prev1549_2014unaids=0.247; m_prev1524m_2014unaids=0.104; m_prev1524w_2014unaids=0.185;  end;
if cald=1996.5 then do; m_prev1549_2010unaids=0.28; m_prev1549_2014unaids=0.281; m_prev1524m_2014unaids=0.107; m_prev1524w_2014unaids=0.195;  end;
if cald=1998.5 then do; m_prev1549_2010unaids=0.28; m_prev1549_2014unaids=0.286; m_prev1524m_2014unaids=0.096; m_prev1524w_2014unaids=0.178;  end;
if cald=2000.5 then do; m_prev1549_2010unaids=0.25; m_prev1549_2014unaids=0.269; m_prev1524m_2014unaids=0.078; m_prev1524w_2014unaids=0.148;  end;
if cald=2002.5 then do; m_prev1549_2010unaids=0.22; m_prev1549_2014unaids=0.242; m_prev1524m_2014unaids=0.061; m_prev1524w_2014unaids=0.116;  end;
if cald=2004.5 then do; m_prev1549_2010unaids=0.20; m_prev1549_2014unaids=0.212; m_prev1524m_2014unaids=0.049; m_prev1524w_2014unaids=0.093;  end;
if cald=2006.5 then do; m_prev1549_2010unaids=0.18; m_prev1549_2014unaids=0.186; m_prev1524m_2014unaids=0.043; m_prev1524w_2014unaids=0.079;  end;
if cald=2008.5 then do; m_prev1549_2010unaids=0.15; m_prev1549_2014unaids=0.170; m_prev1524m_2014unaids=0.041; m_prev1524w_2014unaids=0.072;  end;
if cald=2010.5 then do; m_prev1549_2010unaids=0.136;m_prev1549_2014unaids=0.160; m_prev1524m_2014unaids=0.041; m_prev1524w_2014unaids=0.070;  end;
if cald=2012.5 then do;                             m_prev1549_2014unaids=0.154; m_prev1524m_2014unaids=0.041; m_prev1524w_2014unaids=0.067;  end;


 *Source: Operational and Service Delivery Manual for the Prevention, Care and Treatment of HIV in Zimbabwe Operational 2015, page 5 
  (not 100% sure it is unaids);
if cald=2013.5 then do;                             m_prev1549_2014unaids=0.149; m_prev1524_2014unaids=0.053;  end;


***LBM Update Sep 2016;
*Source: UNAIDS AIDSInfo Graphs, interactive webpage 2016 (//aidsinfo.unaids.org/#). Modelled data
(C:\Loveleen\Synthesis model\Zim\Observed data\UNAIDS2016_ZimbabweEstimates.pdf);

if cald=1990.5 then do; m_prev1549_2016unaids=0.150; m_prev1549_ll_2016unaids=0.128; m_prev1549_ul_2016unaids=0.177;m_prev1524m_2016unaids=0.070; m_prev1524w_2016unaids=0.115;  end;
if cald=1992.5 then do; m_prev1549_2016unaids=0.203; m_prev1549_ll_2016unaids=0.203; m_prev1549_ul_2016unaids=0.229;m_prev1524m_2016unaids=0.084; m_prev1524w_2016unaids=0.145;   end;
if cald=1994.5 then do; m_prev1549_2016unaids=0.242; m_prev1549_ll_2016unaids=0.242; m_prev1549_ul_2016unaids=0.267;m_prev1524m_2016unaids=0.090; m_prev1524w_2016unaids=0.161;   end;
if cald=1996.5 then do; m_prev1549_2016unaids=0.260; m_prev1549_ll_2016unaids=0.238; m_prev1549_ul_2016unaids=0.281;m_prev1524m_2016unaids=0.087; m_prev1524w_2016unaids=0.159;   end;
if cald=1998.5 then do; m_prev1549_2016unaids=0.257; m_prev1549_ll_2016unaids=0.238; m_prev1549_ul_2016unaids=0.275;m_prev1524m_2016unaids=0.074; m_prev1524w_2016unaids=0.140;   end;
if cald=2000.5 then do; m_prev1549_2016unaids=0.240; m_prev1549_ll_2016unaids=0.222; m_prev1549_ul_2016unaids=0.256;m_prev1524m_2016unaids=0.059; m_prev1524w_2016unaids=0.114;   end;
if cald=2002.5 then do; m_prev1549_2016unaids=0.216; m_prev1549_ll_2016unaids=0.197; m_prev1549_ul_2016unaids=0.233;m_prev1524m_2016unaids=0.047; m_prev1524w_2016unaids=0.091;   end;
if cald=2004.5 then do; m_prev1549_2016unaids=0.192; m_prev1549_ll_2016unaids=0.171; m_prev1549_ul_2016unaids=0.208;m_prev1524m_2016unaids=0.040; m_prev1524w_2016unaids=0.075;   end;
if cald=2006.5 then do; m_prev1549_2016unaids=0.172; m_prev1549_ll_2016unaids=0.152; m_prev1549_ul_2016unaids=0.188;m_prev1524m_2016unaids=0.038; m_prev1524w_2016unaids=0.068;   end;
if cald=2008.5 then do; m_prev1549_2016unaids=0.160; m_prev1549_ll_2016unaids=0.140; m_prev1549_ul_2016unaids=0.175;m_prev1524m_2016unaids=0.038; m_prev1524w_2016unaids=0.066;   end;
if cald=2010.5 then do; m_prev1549_2016unaids=0.155; m_prev1549_ll_2016unaids=0.137; m_prev1549_ul_2016unaids=0.168;m_prev1524m_2016unaids=0.040; m_prev1524w_2016unaids=0.066;   end;
if cald=2012.5 then do; m_prev1549_2016unaids=0.152; m_prev1549_ll_2016unaids=0.136; m_prev1549_ul_2016unaids=0.164;m_prev1524m_2016unaids=0.039; m_prev1524w_2016unaids=0.064;   end;
if cald=2014.5 then do; m_prev1549_2016unaids=0.149; m_prev1549_ll_2016unaids=0.135; m_prev1549_ul_2016unaids=0.162;m_prev1524m_2016unaids=0.038; m_prev1524w_2016unaids=0.061;   end;
if cald=2015.5 then do; m_prev1549_2016unaids=0.147; m_prev1549_ll_2016unaids=0.133; m_prev1549_ul_2016unaids=0.160;m_prev1524m_2014unaids=0.038; m_prev1524w_2014unaids=0.059;   end;


*Source: Zimbabwe Young Adult Survey (YAS), Ministry of Health and Child Welfare (Zimbabwe), Page 25
         Available from: URL: http://stacks.cdc.gov/view/cdc/8237;
if cald=2002 then do;
	o_prev1529m_yas=0.10; o_prev1529w_yas=0.22;
	o_prev1524m_yas=0.05; o_prev1524w_yas=0.17;
end;
 
*Source: DHS 2005-2006, Page 222;

*The lower and upper limits for the prev 15-49 are the confidence intervals, taking into account selection bias, 
reported in Hogan et al. 2012 for HIV prevalence age 15-49 in 2006.

***LBM Update Sep 2016 - Discussion with Vale - do not use Hogan estimates, use DHS which are universally accepted.

For 2011 and for the prevalence 15-24, we applied the same relative increase/decrease as for the estimate for 
prevalence 15-49 in 2005-06;


if cald=2006 then do; 
***Lower and upper limits reported in DHS 2010-2011, page 218;
	o_prev1549_Z_DHS=0.181; o_prev1549_ll_Z_DHS=0.169; o_prev1549_ul_Z_DHS=0.193; 
	o_prev1549m_Z_DHS=0.145;o_prev1549m_ll_Z_DHS=0.132;o_prev1549m_ul_Z_DHS=0.159; 
	o_prev1549w_Z_DHS=0.211;o_prev1549w_ll_Z_DHS=0.196;o_prev1549w_ul_Z_DHS=0.226;

	o_prev1519_Z_DHS=0.046; o_prev1519m_Z_DHS=0.031; o_prev1519w_Z_DHS=0.062;
	o_prev2024_Z_DHS=0.116; o_prev2024m_Z_DHS=0.058; o_prev2024w_Z_DHS=0.163;
	o_prev2529_Z_DHS=0.218; o_prev2529m_Z_DHS=0.131; o_prev2529w_Z_DHS=0.288;
	o_prev3034_Z_DHS=0.329; o_prev3034m_Z_DHS=0.295; o_prev3034w_Z_DHS=0.355;
	o_prev3539_Z_DHS=0.334; o_prev3539m_Z_DHS=0.321; o_prev3539w_Z_DHS=0.345;
	o_prev4044_Z_DHS=0.289; o_prev4044m_Z_DHS=0.329; o_prev4044w_Z_DHS=0.257;
	o_prev4549_Z_DHS=0.214; o_prev4549m_Z_DHS=0.260; o_prev4549w_Z_DHS=0.180;
							o_prev5054m_Z_DHS=0.200;
							o_prev1554m_Z_DHS=0.148;
* Page 230;
	o_prev1524m_Z_DHS=0.042; *The following are based on Hogan 2012;o_prev1524m_ll_Z_Hog=0.033;o_prev1524m_ul_Z_Hog=0.073;
	o_prev1524w_Z_DHS=0.11;  *The following are based on Hogan 2012;o_prev1524w_ll_Z_Hog=0.069;o_prev1524w_ul_Z_Hog=0.172;


*The following are from Hogan 2012;o_prev1549m_ll_Z_Hog=0.113;o_prev1549m_ul_Z_Hog=0.253; 
*The following are from Hogan 2012;o_prev1549w_ll_Z_Hog=0.133;o_prev1549w_ul_Z_Hog=0.333; 

*Source: David Wilson's estimates;
	o_prev2549m_Z_DHS=0.233; o_prev2549w_Z_DHS=0.325;
	o_prev50plm_Z_DHS=0.20;  o_prev50plw_Z_DHS=0.28;

end;




*Source: DHS 2010-2011, Page 218;

if cald=2011 then do; 
	o_prev1549_Z_DHS=0.152;o_prev1549_ll_Z_DHS=0.143; o_prev1549_ul_Z_DHS=0.161; 
	o_prev1549m_Z_DHS=0.123;o_prev1549w_ll_Z_DHS=0.113;o_prev1549w_ul_Z_DHS=0.133;
	o_prev1549w_Z_DHS=0.177;o_prev1549w_ll_Z_DHS=0.166;o_prev1549w_ul_Z_DHS=0.188;

	o_prev1519_Z_DHS=0.038; o_prev1519m_Z_DHS=0.033;*0.034; o_prev1519w_Z_DHS=0.042;
	o_prev2024_Z_DHS=0.075; o_prev2024m_Z_DHS=0.038; o_prev2024w_Z_DHS=0.106;
	o_prev2529_Z_DHS=0.158; o_prev2529m_Z_DHS=0.103; o_prev2529w_Z_DHS=0.201;
	o_prev3034_Z_DHS=0.237; o_prev3034m_Z_DHS=0.173; o_prev3034w_Z_DHS=0.290;
	o_prev3539_Z_DHS=0.273; o_prev3539m_Z_DHS=0.252; o_prev3539w_Z_DHS=0.291;
	o_prev4044_Z_DHS=0.259; o_prev4044m_Z_DHS=0.262; o_prev4044w_Z_DHS=0.257;
	o_prev4549_Z_DHS=0.255; o_prev4549m_Z_DHS=0.299; o_prev4549w_Z_DHS=0.225;
							o_prev5054m_Z_DHS=0.195;
							o_prev1554m_Z_DHS=0.127;
*Page 225;
	o_prev1524m_Z_DHS=0.036; *The following are based on Hogan 2012;o_prev1524m_ll_Z_Hog=0.028;o_prev1524m_ul_Z_Hog=0.063;
	o_prev1524w_Z_DHS=0.073; *The following are based on Hogan 2012;o_prev1524w_ll_Z_Hog=0.046;o_prev1524w_ul_Z_Hog=0.114;

*The following are based on Hogan 2012; o_prev1549w_ll_Z_Hog=0.112;o_prev1549w_ul_Z_Hog=0.276;
*The following are based on Hogan 2012; o_prev1549m_ll_Z_Hog=0.096;o_prev1549m_ul_Z_Hog=0.214; 


*Source: David Wilson's estimates;
	o_prev2549m_Z_DHS=0.166; o_prev2549w_Z_DHS=0.253;
	o_prev50plm_Z_DHS=0.194; o_prev50plw_Z_DHS=0.296;
end;


***LBM Update Jan 2017 - DHS 2015;
if cald=2015.75 then do; 
	o_prev1549_Z_DHS=0.138;
	o_prev1549m_Z_DHS=0.105;
	o_prev1549w_Z_DHS=0.167;

	o_prev1519_Z_DHS=0.032; o_prev1519m_Z_DHS=0.025; o_prev1519w_Z_DHS=0.04;
	o_prev2024_Z_DHS=0.073; o_prev2024m_Z_DHS=0.037; o_prev2024w_Z_DHS=0.103;
	o_prev2529_Z_DHS=0.121; o_prev2529m_Z_DHS=0.075; o_prev2529w_Z_DHS=0.155;
	o_prev3034_Z_DHS=0.182; o_prev3034m_Z_DHS=0.131; o_prev3034w_Z_DHS=0.219;
	o_prev3539_Z_DHS=0.236; o_prev3539m_Z_DHS=0.180; o_prev3539w_Z_DHS=0.280;
	o_prev4044_Z_DHS=0.293; o_prev4044m_Z_DHS=0.270; o_prev4044w_Z_DHS=0.313;
	o_prev4549_Z_DHS=0.237; o_prev4549m_Z_DHS=0.232; o_prev4549w_Z_DHS=0.243;
							o_prev5054m_Z_DHS=0.289;
*Page 289;
	o_prev1524m_Z_DHS=0.029; 
	o_prev1524w_Z_DHS=0.067;
end;


***LBM Update Sep 2016;
*Source: 2009 CIA World Factbook (15-49), copied from Haltares report
 https://www.cia.gov/library/publications/the-world-factbook/geos/zi.html (website accessed in Sep 2016. 2009 page no longer exists.);
if cald=2009 then o_prev1549_CIA=0.143;
if cald=2015 then o_prev1549_CIA=0.147;


***LBM Update Jan2017;
*Zimphia 2015-2016;
if cald=2016.25 then do;
o_prev_1549_zimphia=0.134;*0.140;o_prev_1549_ll_zimphia=0.133;o_prev_1549_ul_zimphia=0.147;*Modified based on Isac;
o_prev_1549m_zimphia=0.107;*0.112;o_prev_1549m_ll_zimphia=0.104;o_prev_1549m_ul_zimphia=0.121;
o_prev_1549w_zimphia=0.159;*0.166;o_prev_1549w_ll_zimphia=0.158;o_prev_1549w_ul_zimphia=0.174;
o_prev_1564m_zimphia=0.124;o_prev_1564m_ll_zimphia=0.115;o_prev_1564m_ul_zimphia=0.132;
o_prev_1564w_zimphia=0.167;o_prev_1564f_ll_zimphia=0.160;o_prev_1564f_ul_zimphia=0.174;
*Source: file:///C:/Users/ValentinaCambiano/Downloads/Progress_Toward_the_90_90_90_HIV_Targets_in.7.pdf;
o_prev_1564_zimphia=0.141;
end;


***LBM Update Jan2017;
*Age-gender-specific rates
*Source:	PHIV-age-specific-prevalence-viralsuppression_2016-12-08;
*I have not checked the CI using data from Isaac;
if cald=2016.25 then do;
o_prev_1519m_zimphia=0.032;o_prev_1519m_ll_zimphia=0.02;o_prev_1519m_ul_zimphia=0.04;
o_prev_2024m_zimphia=0.027;o_prev_2024m_ll_zimphia=0.02;o_prev_2024m_ul_zimphia=0.04;
o_prev_2529m_zimphia=0.066;o_prev_2529m_ll_zimphia=0.05;o_prev_2529m_ul_zimphia=0.08;
o_prev_3034m_zimphia=0.122;o_prev_3034m_ll_zimphia=0.10;o_prev_3034m_ul_zimphia=0.15;
o_prev_3539m_zimphia=0.194;o_prev_3539m_ll_zimphia=0.17;o_prev_3539m_ul_zimphia=0.23;
o_prev_4044m_zimphia=0.254;o_prev_4044m_ll_zimphia=0.23;o_prev_4044m_ul_zimphia=0.30;
o_prev_4549m_zimphia=0.281;o_prev_4549m_ll_zimphia=0.24;o_prev_4549m_ul_zimphia=0.33;

o_prev_5054m_zimphia=0.28;
o_prev_5559m_zimphia=0.244;


o_prev_1519w_zimphia=0.039;o_prev_1519w_ll_zimphia=0.03;o_prev_1519w_ul_zimphia=0.05;
o_prev_2024w_zimphia=0.081;o_prev_2024w_ll_zimphia=0.07;o_prev_2024w_ul_zimphia=0.10;
o_prev_2529w_zimphia=0.143;o_prev_2529w_ll_zimphia=0.13;o_prev_2529w_ul_zimphia=0.17;
o_prev_3034w_zimphia=0.22;o_prev_3034w_ll_zimphia=0.20;o_prev_3034w_ul_zimphia=0.24;
o_prev_3539w_zimphia=0.266;o_prev_3539w_ll_zimphia=0.24;o_prev_3539w_ul_zimphia=0.29;
o_prev_4044w_zimphia=0.296;o_prev_4044w_ll_zimphia=0.27;o_prev_4044w_ul_zimphia=0.33;
o_prev_4549w_zimphia=0.289;o_prev_4549w_ll_zimphia=0.26;o_prev_4549w_ul_zimphia=0.32;
o_prev_5054w_zimphia=0.21;
o_prev_5559w_zimphia=0.17;
end;

*source: Summary sheet December 2020 Zimbabwe population-based HIV impact assessment;
if cald=2020 then do;
o_prev_1549_zimphia=0.118; o_prev_1549_ll_zimphia=0.111; o_prev_1549_ul_zimphia=0.125;
o_prev_1549m_zimphia=0.086;o_prev_1549m_ll_zimphia=0.078;o_prev_1549m_ul_zimphia=0.093;
o_prev_1549w_zimphia=0.148;o_prev_1549w_ll_zimphia=0.139;o_prev_1549w_ul_zimphia=0.157;

o_prev_15pl_zimphia=0.129; o_prev_15pl_ll_zimphia=0.123; o_prev_15pl_ul_zimphia=0.135;
o_prev_15plm_zimphia=0.102;o_prev_15plm_ll_zimphia=0.095;o_prev_15plm_ul_zimphia=0.11;
o_prev_15plw_zimphia=0.153;o_prev_15plw_ll_zimphia=0.144;o_prev_15plw_ul_zimphia=0.161;

o_prev_1519m_zimphia=0.021;
o_prev_2024m_zimphia=0.028;
o_prev_2529m_zimphia=0.040;
o_prev_3034m_zimphia=0.093;
o_prev_3539m_zimphia=0.156;
o_prev_4044m_zimphia=0.208;
o_prev_4549m_zimphia=0.260;
o_prev_5054m_zimphia=0.309;
o_prev_5559m_zimphia=0.256;
o_prev_6064m_zimphia=0.187;
o_prev_65plm_zimphia=0.075;

o_prev_1519w_zimphia=0.038;
o_prev_2024w_zimphia=0.064;
o_prev_2529w_zimphia=0.106;
o_prev_3034w_zimphia=0.184;
o_prev_3539w_zimphia=0.233;
o_prev_4044w_zimphia=0.318;
o_prev_4549w_zimphia=0.333;
o_prev_5054w_zimphia=0.302;
o_prev_5559w_zimphia=0.245;
o_prev_6064w_zimphia=0.202;
o_prev_65plw_zimphia=0.066;
end;

***LBM Update Jan 2017;
*Prevalence in women;
*Source:	HIV decline in Zimbabwe due to reductions in risky sex? Gregson, 2010;
if cald=1997 then o_prev_1549w_gregson=0.293;

*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021); 
if cald=2010.5 then o_prev_1549_garpr=0.151;
if cald=2019.5 then o_prev_1549_garpr=0.128;
if cald=2025.5 then o_prev_1549_garpr=0.104;*less than 10.4%;


*Essential & optional data for MIHPSA;
if cald in (2006 2011) then do;
o_prev1549_Z_ess=o_prev1549_Z_DHS;   o_prev1549_ll_Z_ess=o_prev1549_ll_Z_DHS;   o_prev1549_ul_Z_ess=o_prev1549_ul_Z_DHS; 
o_prev1549m_Z_ess=o_prev1549m_Z_DHS; o_prev1549m_ll_Z_ess=o_prev1549m_ll_Z_DHS; o_prev1549m_ul_Z_ess=o_prev1549m_ul_Z_DHS; 
o_prev1549w_Z_ess=o_prev1549w_Z_DHS; o_prev1549w_ll_Z_ess=o_prev1549w_ll_Z_DHS; o_prev1549w_ul_Z_ess=o_prev1549w_ul_Z_DHS; 

o_prev1519m_Z_ess=o_prev1519m_Z_DHS; o_prev1519w_Z_ess=o_prev1519w_Z_DHS;
o_prev2024m_Z_ess=o_prev2024m_Z_DHS; o_prev2024w_Z_ess=o_prev2024w_Z_DHS;

o_prev2529m_Z_ess=o_prev2529m_Z_DHS; o_prev2529w_Z_ess=o_prev2529w_Z_DHS;
o_prev3034m_Z_ess=o_prev3034m_Z_DHS; o_prev3034w_Z_ess=o_prev3034w_Z_DHS;
o_prev3539m_Z_ess=o_prev3539m_Z_DHS; o_prev3539w_Z_ess=o_prev3539w_Z_DHS;
o_prev4044m_Z_ess=o_prev4044m_Z_DHS; o_prev4044w_Z_ess=o_prev4044w_Z_DHS;
o_prev4549m_Z_ess=o_prev4549m_Z_DHS; o_prev4549w_Z_ess=o_prev4549w_Z_DHS;

o_prev5054m_Z_ess=o_prev5054m_Z_DHS;
end;
if cald in (2016.25 2020) then do;
o_prev1549_Z_ess=o_prev_1549_zimphia;   o_prev_1549_ll_ess=o_prev_1549_ll_zimphia; o_prev_1549_ul_ess=o_prev_1549_ul_zimphia;
o_prev1549m_Z_ess=o_prev_1549m_zimphia; o_prev_1549m_ll_ess=o_prev_1549m_ll_zimphia; o_prev_1549m_ul_ess=o_prev_1549m_ul_zimphia;
o_prev1549w_Z_ess=o_prev_1549w_zimphia; o_prev_1549w_ll_ess=o_prev_1549w_ll_zimphia; o_prev_1549w_ul_ess=o_prev_1549w_ul_zimphia;

o_prev_1519m_ess=o_prev_1519m_zimphia; o_prev_1519m_ll_ess=o_prev_1519m_ll_zimphia; o_prev_1519m_ul_ess=o_prev_1519m_ul_zimphia;
o_prev_2024m_ess=o_prev_2024m_zimphia; o_prev_2024m_ll_ess=o_prev_2024m_ll_zimphia; o_prev_2024m_ul_ess=o_prev_2024m_ul_zimphia;
o_prev_2529m_ess=o_prev_2529m_zimphia; o_prev_2529m_ll_ess=o_prev_2529m_ll_zimphia; o_prev_2529m_ul_ess=o_prev_2529m_ul_zimphia;
o_prev_3034m_ess=o_prev_3034m_zimphia; o_prev_3034m_ll_ess=o_prev_3034m_ll_zimphia; o_prev_3034m_ul_ess=o_prev_3034m_ul_zimphia;
o_prev_3539m_ess=o_prev_3539m_zimphia; o_prev_3539m_ll_ess=o_prev_3539m_ll_zimphia; o_prev_3539m_ul_ess=o_prev_3539m_ul_zimphia;
o_prev_4044m_ess=o_prev_4044m_zimphia; o_prev_4044m_ll_ess=o_prev_4044m_ll_zimphia; o_prev_4044m_ul_ess=o_prev_4044m_ul_zimphia;
o_prev_4549m_ess=o_prev_4549m_zimphia; o_prev_4549m_ll_ess=o_prev_4549m_ll_zimphia; o_prev_4549m_ul_ess=o_prev_4549m_ul_zimphia;

o_prev_5054m_ess=o_prev_5054m_zimphia;
o_prev_5559m_ess=o_prev_5559m_zimphia;

o_prev_1519w_ess=o_prev_1519w_zimphia; o_prev_1519w_ll_ess=o_prev_1519w_ll_zimphia; o_prev_1519w_ul_ess=o_prev_1519w_ul_zimphia;
o_prev_2024w_ess=o_prev_2024w_zimphia; o_prev_2024w_ll_ess=o_prev_2024w_ll_zimphia; o_prev_2024w_ul_ess=o_prev_2024w_ul_zimphia;
o_prev_2529w_ess=o_prev_2529w_zimphia; o_prev_2529w_ll_ess=o_prev_2529w_ll_zimphia; o_prev_2529w_ul_ess=o_prev_2529w_ul_zimphia;
o_prev_3034w_ess=o_prev_3034w_zimphia; o_prev_3034w_ll_ess=o_prev_3034w_ll_zimphia; o_prev_3034w_ul_ess=o_prev_3034w_ul_zimphia;
o_prev_3539w_ess=o_prev_3539w_zimphia; o_prev_3539w_ll_ess=o_prev_3539w_ll_zimphia; o_prev_3539w_ul_ess=o_prev_3539w_ul_zimphia;
o_prev_4044w_ess=o_prev_4044w_zimphia; o_prev_4044w_ll_ess=o_prev_4044w_ll_zimphia; o_prev_4044w_ul_ess=o_prev_4044w_ul_zimphia;
o_prev_4549w_ess=o_prev_4549w_zimphia; o_prev_4549w_ll_ess=o_prev_4549w_ll_zimphia; o_prev_4549w_ul_ess=o_prev_4549w_ul_zimphia;

o_prev_5054w_ess=o_prev_5054w_zimphia;
o_prev_5559w_ess=o_prev_5559w_zimphia;

end;






*** Female sex workers;

*Source: "Zimbabwe data.xls" sent by David Wilson;
if cald=2000.5 then o_prev_fsw_dw=0.522;
if cald=2005.5 then o_prev_fsw_dw=0.557;
if cald=2010.5 then o_prev_fsw_dw=0.66;
if cald=2013.5 then do; o_prev_fsw_dw=0.615; o_prev_fsw_ll_dw=0.55; o_prev_fsw_ul_dw=0.68; end;
if cald=2014.5 then o_prev_fsw_dw=0.58;

*Source: RDS performed in 2011/12 - Engagement with HIV Prevention, Cowan 2013;
if cald=2012 then do; o_prev_fsw_rdshm=0.506; o_prev_fsw_rdsvf=0.69; end;

*Source: Sisters with a voice programme;
if cald=2012.5 then o_prev_fsw_tested_swvp=0.56;

*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021)
page 24
howvere not clear whether they took these estimates from; 
*Source: based on email from John Stover up to 2017 the source of these estimtaes is
COWAN F. ET AL. STRENGTHENING THE SCALE-UP AND UPTAKE OF EFFECTIVE INTERVENTIONS FOR SEX WORKERS FOR POPULATION IMPACT;
if cald=2011.5 then o_prev_fsw_garpr=0.50;
if cald=2012.5 then o_prev_fsw_garpr=0.44;
if cald=2014.5 then o_prev_fsw_garpr=0.46;
if cald=2015.5 then o_prev_fsw_garpr=0.57;
if cald=2016.5 then o_prev_fsw_garpr=0.59;
if cald=2017.5 then o_prev_fsw_garpr=0.56;*used by Optima, Source: email from Debra tenBrink on 22/12/2021 reporting as source 2017 Respondent Driven Sampling Survey;
if cald=2018.5 then o_prev_fsw_garpr=0.41;
if cald=2019.5 then o_prev_fsw_garpr=0.422;*used by Optima, Source: email from Debra tenBrink on 22/12/2021 reporting as source 2019 Special Study;

*Source: RDS in last quarter 2013 (The mean HIV prevalence was 57.5% (https://pubmed.ncbi.nlm.nih.gov/27930599/);
if cald=2013.75 then do;
	o_prev_1824fsw_rds=0.36; o_prev_1824fsw_ll_rds=0.26; o_prev_1824fsw_ul_rds=0.46;
	o_prev_2529fsw_rds=0.55; o_prev_2529fsw_ll_rds=0.48; o_prev_2529fsw_ul_rds=0.62;
	o_prev_3039fsw_rds=0.69; o_prev_3039fsw_ll_rds=0.60; o_prev_3039fsw_ul_rds=0.73;
	o_prev_40abfsw_rds=0.77; o_prev_40abfsw_ll_rds=0.71; o_prev_40abfsw_ul_rds=0.82;
	o_prev_fsw_rds    = 0.575;o_prev_fsw_ll_rds =0.408 ;*0.428; o_prev_fsw_ul_rds =0.812;*0.792;
	*The confidence  interval for o_prev_fsw_rds is 0.428-0.792, this has been expanded to take into account of bias;
end;






***LBM Feb 2017;
***Prevalence stratified by age and duration of FSW;
*Source: Draft Paper  - 'How can programmes better support female sex workers to avoid HIV infection in Zimbabwe' (Cowen 2017)? ;
if cald=2013.5 then do;
	o_prev_1824fsw_0_2_rds=0.31;	o_prev_2529fsw_0_2_rds=0.53;	o_prev_3039fsw_0_2_rds=0.63;	o_prev_ov40fsw_0_2_rds=0.80;
	o_prev_1824fsw_3_4_rds=0.43;	o_prev_2529fsw_3_4_rds=0.54;	o_prev_3039fsw_3_4_rds=0.63;	o_prev_ov40fsw_3_4_rds=0.67;
	o_prev_1824fsw_5_8_rds=0.35;	o_prev_2529fsw_5_8_rds=0.55;	o_prev_3039fsw_5_8_rds=0.66;	o_prev_ov40fsw_5_8_rds=0.76;
	o_prev_1824fsw_ov9_rds=0.57;	o_prev_2529fsw_ov9_rds=0.62;	o_prev_3039fsw_ov9_rds=0.75;	o_prev_ov40fsw_ov9_rds=0.81;
end;

***Prevalence stratified by age of FSW;
if cald=2013.5 then do;
	o_prev_1824fsw_rds=0.39;		o_prev_2529fsw_rds=0.62;		o_prev_3039fsw_rds=0.76;		o_prev_ov40fsw_rds=0.78;
end;



*******************************************************************************************
************************************     Incidence     ************************************
*******************************************************************************************

*** Pregnant women;
*Source: Mbizvo 2001
		 (Mbizvo MT, Kasule J, Mahomed K, Nathoo K. HIV-1 seroconversion incidence following pregnancy and delivery among women seronegative at recruitment in Harare, Zimbabwe. Cent Afr J Med 2001 May, 47(5):115-8.;
if cald=1992.5 then do; o_HIVIncid_preg_Mbizvo  =0.048*100; o_HIVIncid_preg_ll_Mbizvo=0.031*100; o_HIVIncid_preg_ul_Mbizvo=0.065*100;end;
*Source: Humphrey 2006
		 (Humphrey JH, Hargrove JW, Malaba LC, et al. HIV incidence among post-partum women in Zimbabwe: risk factors and the effect of vitamin A supplementation. AIDS 2006 Jun 26, 20(10):1437-46.;
if cald=1999.5 then     o_HIVIncid_preg_Humphrey=0.034*100;


*** Male workers (as they are male workers I assumed 15-49);
*Source: Mbizvo 2001 
		 (Mbizvo MT, Machekano R, McFarland W, et al. HIV seroincidence and correlates of seroconversion in a cohort of male factory workers in Harare, Zimbabwe. AIDS 1996 Jul, 10(8):895-901.;
if cald=1995 then do; o_HIVIncid_1549m_Mbizvo  =0.03*100; o_HIVIncid_1549m_ll_Mbizvo =0.025*100; o_HIVIncid_1549m_ul_Mbizvo =0.035*100; end;
*Source: Corbett
		 (Corbett EL, Makamure B, Cheung YB, et al. HIV incidence during a cluster-randomized trial of two strategies providing voluntary counselling and testing at the workplace, Zimbabwe. AIDS 2007 Feb 19, 21(4):483-9.;
if cald=2003 then do; o_HIVIncid_1549m_Corbett =0.013*100;o_HIVIncid_1549m_ll_Corbett=0.010*100; o_HIVIncid_1549m_ul_Corbett=0.018*100; end;



*** General population;

*Source: UNAIDS 2011, copied from Haltares document;
if cald=2011 then m_HIVIncid_1549_UNAIDS=1.05;

*Source: UNAIDS 2014
		 (UNAIDS. HIV estimates with uncertainty bounds. http://www unaids org/en/dataanalysis/knowyourepidemic/epidemiologypublications/ 2014 July 22 [cited 2014 Oct 2];
***LBM Update Sep 2016 - Above page no longer found, updated with 2016 estimates as below;
if cald=1990 then do; m_HIVIncid_1549_2014UNAIDS=0.0425*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0403*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0447*100; end;
if cald=1992 then do; m_HIVIncid_1549_2014UNAIDS=0.0565*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0537*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0595*100; end;
if cald=1994 then do; m_HIVIncid_1549_2014UNAIDS=0.0592*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0560*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0624*100; end;
if cald=1996 then do; m_HIVIncid_1549_2014UNAIDS=0.0505*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0481*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0527*100; end;
if cald=1998 then do; m_HIVIncid_1549_2014UNAIDS=0.0373*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0355*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0390*100; end;
if cald=2000 then do; m_HIVIncid_1549_2014UNAIDS=0.0263*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0246*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0281*100; end;
if cald=2002 then do; m_HIVIncid_1549_2014UNAIDS=0.0197*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0183*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0211*100; end;
if cald=2004 then do; m_HIVIncid_1549_2014UNAIDS=0.0165*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0154*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0175*100; end;
if cald=2006 then do; m_HIVIncid_1549_2014UNAIDS=0.0149*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0140*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0159*100; end;
if cald=2008 then do; m_HIVIncid_1549_2014UNAIDS=0.0141*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0130*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0151*100; end;
if cald=2010 then do; m_HIVIncid_1549_2014UNAIDS=0.0130*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0118*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0142*100; end;
if cald=2012 then do; m_HIVIncid_1549_2014UNAIDS=0.0110*100; m_HIVIncid_1549_ll_2014UNAIDS=0.0099*100; m_HIVIncid_1549_ul_2014UNAIDS=0.0122*100; end;

*Source: UNAIDS 2016 - HIV estimates with uncertainty bounds;
if cald=1990 then do; m_HIVIncid_1549_2016UNAIDS=0.0418*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0363*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0481*100; end;
if cald=1992 then do; m_HIVIncid_1549_2016UNAIDS=0.0478*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0422*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0538*100; end;
if cald=1994 then do; m_HIVIncid_1549_2016UNAIDS=0.0459*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0407*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0506*100; end;
if cald=1996 then do; m_HIVIncid_1549_2016UNAIDS=0.0374*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0334*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0410*100; end;
if cald=1998 then do; m_HIVIncid_1549_2016UNAIDS=0.0271*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0244*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0294*100; end;
if cald=2000 then do; m_HIVIncid_1549_2016UNAIDS=0.0198*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0179*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0214*100; end;
if cald=2002 then do; m_HIVIncid_1549_2016UNAIDS=0.0156*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0140*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0169*100; end;
if cald=2004 then do; m_HIVIncid_1549_2016UNAIDS=0.0137*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0122*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0150*100; end;
if cald=2006 then do; m_HIVIncid_1549_2016UNAIDS=0.0134*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0119*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0148*100; end;
if cald=2008 then do; m_HIVIncid_1549_2016UNAIDS=0.0134*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0118*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0149*100; end;
if cald=2010 then do; m_HIVIncid_1549_2016UNAIDS=0.0122*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0101*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0140*100; end;
if cald=2012 then do; m_HIVIncid_1549_2016UNAIDS=0.0109*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0090*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0127*100; end;
if cald=2014 then do; m_HIVIncid_1549_2016UNAIDS=0.0095*100; m_HIVIncid_1549_ll_2016UNAIDS=0.0077*100; m_HIVIncid_1549_ul_2016UNAIDS=0.0114*100; end;

*Source: Zimbabwe National HIV and AIDS strategic plan 2011-2015;
if cald=2006.5 then m_HIVIncid_adults_NHASP=0.0114*100;
if cald=2009.5 then m_HIVIncid_adults_NHASP=0.0085*100;

*Source: draft paper by Tsitsi Mutasa-Apollo entitled "Proposal_v1_25 Nov_15 "
(The year is not indicated and nor is a reference, the estimates indicated below are the extremes in the country; 
if cald=2013.5 then do;
	m_HIVIncid_Bulawayo_Apo=0.025;
	m_HIVIncid_MatabelelandS_Apo=0.014; 
	m_HIVIncid_rest_Apo=0.005; 
end;


*Source Global AIDS Response Progress Report 2016;
*** LBM Updated Sep2016;

*Age group not specified;
if cald=2011.5 then m_HIVIncid_GARPR=0.0129*100;
if cald=2012.5 then m_HIVIncid_GARPR=0.0125*100;
if cald=2013.5 then m_HIVIncid_GARPR=0.0098*100;
if cald=2014.5 then m_HIVIncid_GARPR=0.0092*100; 
if cald=2015.5 then m_HIVIncid_GARPR=0.0074*100;

*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021); 
*page 11;
if cald=2010.5 then do; m_HIVIncid_Zim_GARPR=0.00639*100;m_ll_HIVIncid_Zim_GARPR=0.0045*100;m_ul_HIVIncid_Zim_GARPR=0.0088*100;end;
if cald=2011.5 then do; m_HIVIncid_Zim_GARPR=0.0056*100;m_ll_HIVIncid_Zim_GARPR=0.0040*100;m_ul_HIVIncid_Zim_GARPR=0.0078*100;end;
if cald=2012.5 then do; m_HIVIncid_Zim_GARPR=0.0049*100;m_ll_HIVIncid_Zim_GARPR=0.0034*100;m_ul_HIVIncid_Zim_GARPR=0.0067*100;end;
if cald=2013.5 then do; m_HIVIncid_Zim_GARPR=0.0046*100;m_ll_HIVIncid_Zim_GARPR=0.0032*100;m_ul_HIVIncid_Zim_GARPR=0.0064*100;end;
if cald=2014.5 then do; m_HIVIncid_Zim_GARPR=0.0042*100;m_ll_HIVIncid_Zim_GARPR=0.0030*100;m_ul_HIVIncid_Zim_GARPR=0.0058*100;end;
if cald=2015.5 then do; m_HIVIncid_Zim_GARPR=0.0039*100;m_ll_HIVIncid_Zim_GARPR=0.0027*100;m_ul_HIVIncid_Zim_GARPR=0.0055*100;end;
if cald=2016.5 then do; m_HIVIncid_Zim_GARPR=0.0036*100;m_ll_HIVIncid_Zim_GARPR=0.0025*100;m_ul_HIVIncid_Zim_GARPR=0.00495*100;end;
if cald=2017.5 then do; m_HIVIncid_Zim_GARPR=0.0033*100;m_ll_HIVIncid_Zim_GARPR=0.0023*100;m_ul_HIVIncid_Zim_GARPR=0.0045*100;end;
if cald=2018.5 then do; m_HIVIncid_Zim_GARPR=0.0029*100;m_ll_HIVIncid_Zim_GARPR=0.00205*100;m_ul_HIVIncid_Zim_GARPR=0.0040*100;end;
if cald=2019.5 then do;
	m_HIVIncid_Zim_GARPR=0.00281*100;m_ll_HIVIncid_Zim_GARPR=0.002*100;m_ul_HIVIncid_Zim_GARPR=0.0038*100;
	*The following are from page 9;
	m_HIVIncid1549_Zim_GARPR=0.0049*100;
	m_HIVIncid1549_MatS_GARPR=0.0098*100;*Matabeleland South having the highest incidence;
	m_HIVIncid1549_MasC_GARPR=0.0025*100;*Mashonaland Central having the lowest incidence;
end;




*** LBM Updated Jan2017;
*Zimphia 2015-2016;
if cald=2016.25 then do;
o_HIVincid_1549m_Zimphia=0.28;	o_HIVincid_1549m_ll_Zimphia=0.06;	o_HIVincid_1549m_ul_Zimphia=0.50;
o_HIVincid_1549w_Zimphia=0.67;	o_HIVincid_1549w_ll_Zimphia=0.37;	o_HIVincid_1549w_ul_Zimphia=0.97;
o_HIVincid_1549_Zimphia= 0.48;	o_HIVincid_1549_ll_Zimphia= 0.29;	o_HIVincid_1549_ul_Zimphia= 0.66;
o_HIVincid_1564m_Zimphia=0.31;	o_HIVincid_1564m_ll_Zimphia=0.09;	o_HIVincid_1564m_ul_Zimphia=0.52;
o_HIVincid_1564w_Zimphia=0.59;	o_HIVincid_1564w_ll_Zimphia=0.32;	o_HIVincid_1564w_ul_Zimphia=0.85;
o_HIVincid_1564_Zimphia= 0.45;	o_HIVincid_1564_ll_Zimphia= 0.28;	o_HIVincid_1564_ul_Zimphia= 0.62;

o_HIVincid_1524m_Zimphia=0.14;	o_HIVincid_1524m_ll_Zimphia=0.00;	o_HIVincid_1524m_ul_Zimphia=0.37;
o_HIVincid_1524w_Zimphia=0.46;	o_HIVincid_1524w_ll_Zimphia=0.09;	o_HIVincid_1524w_ul_Zimphia=0.82;
o_HIVincid_1524_Zimphia= 0.30;	o_HIVincid_1524_ll_Zimphia= 0.08;	o_HIVincid_1524_ul_Zimphia= 0.52;

o_HIVincid_2534m_Zimphia=0.48;	o_HIVincid_2534m_ll_Zimphia=0.00;	o_HIVincid_2534m_ul_Zimphia=1.05;
o_HIVincid_2534w_Zimphia=0.95;	o_HIVincid_2534w_ll_Zimphia=0.30;	o_HIVincid_2534w_ul_Zimphia=1.61;
o_HIVincid_2534_Zimphia= 0.72;	o_HIVincid_2534_ll_Zimphia= 0.28;	o_HIVincid_2534_ul_Zimphia= 1.16;

o_HIVincid_3549m_Zimphia=0.38;	o_HIVincid_3549m_ll_Zimphia=0.00;	o_HIVincid_3549m_ul_Zimphia=0.91;
o_HIVincid_3549w_Zimphia=0.27;	o_HIVincid_3549w_ll_Zimphia=0.00;	o_HIVincid_3549w_ul_Zimphia=0.68;
o_HIVincid_3549_Zimphia= 0.32;	o_HIVincid_3549_ll_Zimphia= 0.00;	o_HIVincid_3549_ul_Zimphia= 0.66;

end;
*source: Summary sheet December 2020 Zimbabwe population-based HIV impact assessment;
if cald=2020 then do;
o_HIVincid_1549m_Zimphia=0.23;	o_HIVincid_1549m_ll_Zimphia=0.01;	o_HIVincid_1549m_ul_Zimphia=0.44;
o_HIVincid_1549w_Zimphia=0.67;	o_HIVincid_1549w_ll_Zimphia=0.34;	o_HIVincid_1549w_ul_Zimphia=0.99;
o_HIVincid_1549_Zimphia= 0.45;	o_HIVincid_1549_ll_Zimphia= 0.24;	o_HIVincid_1549_ul_Zimphia= 0.65;

o_HIVincid_15plm_Zimphia=0.20;	o_HIVincid_15plm_ll_Zimphia=0.02;	o_HIVincid_15plm_ul_Zimphia=0.37;
o_HIVincid_15plw_Zimphia=0.54;	o_HIVincid_15plw_ll_Zimphia=0.28;	o_HIVincid_15plw_ul_Zimphia=0.81;
o_HIVincid_15pl_Zimphia= 0.38;	o_HIVincid_15pl_ll_Zimphia= 0.20;	o_HIVincid_15pl_ul_Zimphia= 0.55;

end;

*** Sex workers;
*Source: J Acquir Immune Defic Syndr. 2015 Dec 15. [Epub ahead of print]
		Cohort analysis of programme data to estimate HIV incidence and uptake of HIV-related services among female sex workers in Zimbabwe, 2009-14.
		Hargreaves JR1, Mtetwa S, Davey C, Dirawo J, Chidiya S, Benedikt C, Naperiela MS, Wong-Gruenwald R, Hanisch D, Magure T, Mugurungi O, Cowan FM.
		It is for the period 2009-2013, it says more than 10%;
if cald=2011.5 then o_HIVIncid_fsw=0.10*100;

*Sisters with a Voice Programme cited by Global AIDS Response Progress Report 2015 also says around 10% but year not indicated;




*******************************************************************************************
******************************     Number living with HIV     *****************************
*******************************************************************************************

*Source: Avert 2009;
if cald=2009 then o_livingHIV_1549=1200000;

***LBM update Sep 2006;
*Source: Avert 2015;
if cald=2015 then o_livingHIV_all=1400000;


*Source: UNAIDS (Section “Country overview") http://www.unaids.org/en/regionscountries/countries/zimbabwe/#5
Rough estimates(from graphs) on	entire population (0+) 
Accessed on 11th Feb 2013, Estimated by UNAIDS model. Site no longer exists in Sep 2016;

if cald=1990.5 then o_livingHIV_1549=800000;
if cald=1995.5 then o_livingHIV_1549=1600000;
if cald=2000.5 then o_livingHIV_1549=1900000;
if cald=2005.5 then o_livingHIV_1549=1500000;
if cald=2011.5 then o_livingHIV_1549=1200000;*(1.2-1.3)	2011	Estimated by UNAIDS model, exact;


***LBM Update Sep 2016;
*Source: UNAIDS (Section “Country overview") http://www.unaids.org/en/regionscountries/countries/zimbabwe/#5;
if cald=2015 then do; o_livingHIV_all=1300000;o_livingHIV_ll_all=1200000;o_livingHIV_ul_all=1500000;end;

*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo. (Slide 13 in Zim_ePMS Data Completeness.ppt)
		Senior Monitoring and Evaluation Officer, AIDS and TB National Programme, Zimbabwe, 23 November 2015;
if 2015.5 then do;
	e_hiv1519_nac=59630;
	e_hiv2024_nac=115631;
	e_hiv25ov_nac=1274581;
end;

*Source: AIDS 2016, Durban - 2015 Zimbabwe National HIV estimates cited in "Zimbabwe HIV treatment cascade_15.07.2016.ppt, Tsitsi Apollo;
if cald=2016.5 then e_livingHIV_1549=1413000;*It is not clear whether 2015 or 2016;


***Number of women 15 years old or more living with HIV 
*Source: UNAIDS (Section “Country overview) http://www.unaids.org/en/regionscountries/countries/zimbabwe/#5 (Accessed on 11th Feb 2013);
if cald=2011.5 then o_livingHIV_ov15w=600000;*(570-640);

***LBM Update Sep 2016;
if cald=2015.5 then o_livingHIV_ov15w=790000;*(720-860); *Accessed Sep 2016;

/*
I am aiming for prevalence in 15-45 women to increase to around 28% by 1995, stabilising at 
about 29%-30% then decreasing from about 99 to around 20% or below by 2006, matching with the DHS data (fig 14.1) 
for 2005 and 2011 by gender.  If you run again I suggest you save both my long file and your long file.
*/


*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021); 
if cald=2019.5 then o_livingHIV_all=1400000;




*******************************************************************************************
******************************     7. Sexual behaviour     ********************************
*******************************************************************************************


*** Percentage reporting having ever had sex (NB this is not condomless sex);

*Source: DHS 2010-2011, Page 54 (1-% never had sex);
if cald=1994 then do; o_p_ge1npever_1519m_dhs=0.33; o_p_ge1npever_1519w_dhs=0.297; end;
if cald=2011 then do; o_p_ge1npever_1519m_dhs=0.247; o_p_ge1npever_1519w_dhs=0.34; end;

***LBM update Sep 2016 - DHS 2015 is Key Indicators only and does not contain above info;


*** Percentage of people aged 15-29 reporting at least one non-regular sexual partner in past 12 months;
*Source: DHS (Estimated from graph in Gregson S, Gonese E, Hallett TB, et al. HIV decline in Zimbabwe due to reductions in risky sex? Evidence from a comprehensive epidemiological review. Int J Epidemiol 2010 Apr 20.);
if cald=1999.5 then do; o_p_ge1newp_ly_1529m_dhs=0.57; o_p_ge1newp_ly_1529w_dhs=0.17; end;
if cald=2006 then do; o_p_ge1newp_ly_1529m_dhs=0.48; o_p_ge1newp_ly_1529w_dhs=0.16; end;
*Source: Population Services International (Estimated from graph in Gregson S, Gonese E, Hallett TB, et al. HIV decline in Zimbabwe due to reductions in risky sex? Evidence from a comprehensive epidemiological review. Int J Epidemiol 2010 Apr 20.);
if cald=2001 then do; o_p_ge1newp_ly_1529m_psi=0.32;  o_p_ge1newp_ly_1529w_psi=0.18; end;
if cald=2003 then do; o_p_ge1newp_ly_1529m_psi=0.205; o_p_ge1newp_ly_1529w_psi=0.09; end;
if cald=2005 then do; o_p_ge1newp_ly_1529m_psi=0.202; o_p_ge1newp_ly_1529w_psi=0.12; end;
if cald=2007 then do; o_p_ge1newp_ly_1529m_psi=0.19;  o_p_ge1newp_ly_1529w_psi=0.05; end;



*** CONCURRENCY: Percentage of people aged 15-24 reporting more than one sexual partner at the same time in the past 12 months;

*Source: DHS 2010-2011;
if cald=2011 then do; o_p_gt1cnp_ly_1524m_dhs=0.048; o_p_gt1cnp_ly_1524w_dhs=0.006; end;
***LBM Update Sep 2016 - DHS 2015 is Key Indicators only and does not contain above info;


*Source: Eaton et al 2014 JID 
		 (5 rounds of survey from 1998 to 2011 (1998/2000, 2001/03, 2003/05, 2006/07, 2009/11) in a population-based open cohort in Manicaland - 
		  Except for the baseline the other values are estimated from the graph);
if cald=1999.5 then do; 
	o_p_gt1cnp_now_1754m_manica=0.119; o_p_gt1cnp_now_1754m_ll_manica=0.109; o_p_gt1cnp_now_1754m_ul_manica=0.129;
	o_p_gt1cnp_now_1549w_manica=0.018; o_p_gt1cnp_now_1549w_ll_manica=0.015; o_p_gt1cnp_now_1549w_ul_manica=0.022;

	o_p_gt1cnp_now_1719_manica =0.120; o_p_gt1cnp_now_1719_ll_manica =0.100; o_p_gt1cnp_now_1719_ul_manica =0.140;
	o_p_gt1cnp_now_2024_manica =0.200; o_p_gt1cnp_now_1719_ll_manica =0.175; o_p_gt1cnp_now_1719_ul_manica =0.225;
	o_p_gt1cnp_now_2529_manica =0.135; o_p_gt1cnp_now_1719_ll_manica =0.110; o_p_gt1cnp_now_1719_ul_manica =0.160;
	o_p_gt1cnp_now_3034_manica =0.145; o_p_gt1cnp_now_1719_ll_manica =0.105; o_p_gt1cnp_now_1719_ul_manica =0.180;
	o_p_gt1cnp_now_3539_manica =0.165; o_p_gt1cnp_now_1719_ll_manica =0.125; o_p_gt1cnp_now_1719_ul_manica =0.210;
	o_p_gt1cnp_now_4044_manica =0.150; o_p_gt1cnp_now_1719_ll_manica =0.110; o_p_gt1cnp_now_1719_ul_manica =0.190;
	o_p_gt1cnp_now_4549_manica =0.205; o_p_gt1cnp_now_1719_ll_manica =0.140; o_p_gt1cnp_now_1719_ul_manica =0.270;
	o_p_gt1cnp_now_5054_manica =0.155; o_p_gt1cnp_now_1719_ll_manica =0.110; o_p_gt1cnp_now_1719_ul_manica =0.220;
end;
if cald=2002.5 then do; 
	o_p_gt1cnp_now_1754m_manica=0.060; o_p_gt1cnp_now_1754m_ll_manica=0.055; o_p_gt1cnp_now_1754m_ul_manica=0.070;
	o_p_gt1cnp_now_1549w_manica=0.010; o_p_gt1cnp_now_1549w_ll_manica=0.009; o_p_gt1cnp_now_1549w_ul_manica=0.011;
end;
if cald=2004.5 then do; 
	o_p_gt1cnp_now_1754m_manica=0.055; o_p_gt1cnp_now_1754m_ll_manica=0.050; o_p_gt1cnp_now_1754m_ul_manica=0.060;
	o_p_gt1cnp_now_1549w_manica=0.007; o_p_gt1cnp_now_1549w_ll_manica=0.005; o_p_gt1cnp_now_1549w_ul_manica=0.009;
end;
if cald=2007.5 then do; 
	o_p_gt1cnp_now_1754m_manica=0.048; o_p_gt1cnp_now_1754m_ll_manica=0.040; o_p_gt1cnp_now_1754m_ul_manica=0.055;
	o_p_gt1cnp_now_1549w_manica=0.009; o_p_gt1cnp_now_1549w_ll_manica=0.007; o_p_gt1cnp_now_1549w_ul_manica=0.010;
end;
if cald=2010.5 then do; 
	o_p_gt1cnp_now_1754m_manica=0.038; o_p_gt1cnp_now_1754m_ll_manica=0.036; o_p_gt1cnp_now_1754m_ul_manica=0.040;
	o_p_gt1cnp_now_1549w_manica=0.009; o_p_gt1cnp_now_1549w_ll_manica=0.007; o_p_gt1cnp_now_1549w_ul_manica=0.010;

	o_p_gt1cnp_now_1719_manica =0.005; o_p_gt1cnp_now_1719_ll_manica =0.000; o_p_gt1cnp_now_1719_ul_manica =0.010;
	o_p_gt1cnp_now_2024_manica =0.035; o_p_gt1cnp_now_2024_ll_manica =0.025; o_p_gt1cnp_now_2024_ul_manica =0.045;
	o_p_gt1cnp_now_2529_manica =0.080; o_p_gt1cnp_now_2529_ll_manica =0.060; o_p_gt1cnp_now_2529_ul_manica =0.100;
	o_p_gt1cnp_now_3034_manica =0.070; o_p_gt1cnp_now_3034_ll_manica =0.050; o_p_gt1cnp_now_3034_ul_manica =0.090;
	o_p_gt1cnp_now_3539_manica =0.080; o_p_gt1cnp_now_3539_ll_manica =0.060; o_p_gt1cnp_now_3539_ul_manica =0.100;
	o_p_gt1cnp_now_4044_manica =0.070; o_p_gt1cnp_now_4044_ll_manica =0.045; o_p_gt1cnp_now_4044_ul_manica =0.099;
	o_p_gt1cnp_now_4549_manica =0.060; o_p_gt1cnp_now_4549_ll_manica =0.035; o_p_gt1cnp_now_4549_ul_manica =0.085;
	o_p_gt1cnp_now_5054_manica =0.055; o_p_gt1cnp_now_5054_ll_manica =0.030; o_p_gt1cnp_now_5054_ul_manica =0.085;
end;

*** Proportion reporting 2 partners or more in the last 12 months in people 18-44;
*Source: Evaluation of Zimbabwe National Behavioural Change Program , Tambashe B, Buzdugan R, Watadzaushe C, et al. 
         AIDS 2012 Conference, 22 Washington,DC 2012. (http://pag.aids2012.org/Abstracts.aspx?AID=21494);
if cald=2007 then do; o_p_ge2np_ly_1844m_znbcp=0.291; o_p_ge2np_ly_1844w_znbcp=0.074; end;
if cald=2011 then do; o_p_ge2np_ly_1844m_znbcp=0.244; o_p_ge2np_ly_1844w_znbcp=0.051; end;

*** Proportion reporting sexual intercourse  with more than 1 partner in the last 12 months;
*Source: Country progress report submitted to UNAIDS in 2010;
***LBM Update Sep 2016 - unable to find these %s, website may have been removed;
if cald=2010 then do; 
	o_p_gt1np_ly_1519m_cpr=0.025; o_p_gt1np_ly_1519w_cpr=0.009;
	o_p_gt1np_ly_2024m_cpr=0.142; o_p_gt1np_ly_2024w_cpr=0.017;
	o_p_gt1np_ly_2549m_cpr=0.128; o_p_gt1np_ly_2549w_cpr=0.01;
end;

*Source: DHS 2010-2011, Page 192 (LBM Update Sep 2016 - these numbers have been updated from the preliminary report, orignally 
 they were 1.7, 2.9, 2.0. 1.8 3.4 respectively);
if cald=2010 then do; 
	o_p_gt1np_ly_1519w_dhs=0.009;
	o_p_gt1np_ly_2024w_dhs=0.017;
	o_p_gt1np_ly_2529w_dhs=0.012;
	o_p_gt1np_ly_3039w_dhs=0.007;
	o_p_gt1np_ly_4049w_dhs=0.012;
end;

*LBM Update Sep 2016;
*Source DHS Key Indicators 2015, Page 36;
if cald=2015.5 then do; 
	o_p_gt1np_ly_1519w_dhs=0.008;
	o_p_gt1np_ly_2024w_dhs=0.020;
	o_p_gt1np_ly_2529w_dhs=0.012;
	o_p_gt1np_ly_3039w_dhs=0.011;
	o_p_gt1np_ly_4049w_dhs=0.005;
end;

*Source: Eaton et al 2014 JID 
		 (5 rounds of survey from 1998 to 2011 (1998/2000, 2001/03, 2003/05, 2006/07, 2009/11) in a population-based open cohort in Manicaland - 
		  Except for the baseline the other values are estimated from the graph);
if cald=1999.5 then do; 
	o_p_gt1np_ly_1754m_manica=0.342; o_p_gt1np_ly_1754m_ll_manica=0.328; o_p_gt1np_ly_1754m_ul_manica=0.357;
	o_p_gt1np_ly_1549w_manica=0.046; o_p_gt1np_ly_1549w_ll_manica=0.041; o_p_gt1np_ly_1549w_ul_manica=0.052;
end;
if cald=2002.5 then do; 
	o_p_gt1np_ly_1754m_manica=0.202; o_p_gt1np_ly_1754m_ll_manica=0.190; o_p_gt1np_ly_1754m_ul_manica=0.215;
	o_p_gt1np_ly_1549w_manica=0.030; o_p_gt1np_ly_1549w_ll_manica=0.025; o_p_gt1np_ly_1549w_ul_manica=0.035;
end;
if cald=2004.5 then do; 
	o_p_gt1np_ly_1754m_manica=0.210; o_p_gt1np_ly_1754m_ll_manica=0.198; o_p_gt1np_ly_1754m_ul_manica=0.228;
	o_p_gt1np_ly_1549w_manica=0.022; o_p_gt1np_ly_1549w_ll_manica=0.020; o_p_gt1np_ly_1549w_ul_manica=0.025;
end;
if cald=2007.5 then do; 
	o_p_gt1np_ly_1754m_manica=0.140; o_p_gt1np_ly_1754m_ll_manica=0.125; o_p_gt1np_ly_1754m_ul_manica=0.150;
	o_p_gt1np_ly_1549w_manica=0.020; o_p_gt1np_ly_1549w_ll_manica=0.017; o_p_gt1np_ly_1549w_ul_manica=0.024;
end;
if cald=2010.5 then do; 
	o_p_gt1np_ly_1754m_manica=0.107; o_p_gt1np_ly_1754m_ll_manica=0.100; o_p_gt1np_ly_1754m_ul_manica=0.120;
	o_p_gt1np_ly_1549w_manica=0.015; o_p_gt1np_ly_1549w_ll_manica=0.013; o_p_gt1np_ly_1549w_ul_manica=0.019;
end;


***Proportion of men reporting paying for sex (and NOT using condom at last paid sexual intercourse);
*Source DHS 1994, Page 162;
if cald=1994.5 then do; o_p_paidsex_ly_1554m_dhs=0.069; o_p_paidsex_ly_1519m_dhs=0.076; end;
*Source DHS 1999, Page 186;
if cald=1999.5 then do; o_p_paidsex_ly_1554m_dhs=0.07;  o_p_paidsex_ly_1519m_dhs=0.03; 
					*Assuming that if they never used a condom at last paid sex they never used a condom when having paid sex;
						o_p_clspsex_ly_1554m_dhs=0.013; *(0.07*(1-% using a condom)=0.07*(1-0.815); o_p_clspsex_ly_1519m_dhs=0.008; end;
*Source DHS 2005-6, Page 199;
if cald=2006  then do; o_p_paidsex_ly_1554m_dhs=0.039;  o_p_paidsex_ly_1519m_dhs=0.011; 
					  o_p_clspsex_ly_1554m_dhs=0.010;  o_p_clspsex_ly_1519m_dhs=0.0026; end;
*Source DHS 2010-11, Page 196;
if cald=2011  then do; o_p_paidsex_ly_1554m_dhs=0.030;  o_p_paidsex_ly_1519m_dhs=0.012; 
					  o_p_clspsex_ly_1554m_dhs=0.0037;  o_p_clspsex_ly_1519m_dhs=0.0012; end;

***LBM Update Sep 2016 - no further updates in DHS Key Indicators Report 2015;



***Number of clients per week
 Source: Document “Sisters numbers v4” circulated in Mar2016, not sure whether the data are form the Sisters with a Voice programme or RDS
36% 0-3  clients/week, 
41% 4-10 clients/week, 
23% >10, 
if we convert it in 3 month period  and assume they have the same number of clients every week (so multiply by 12 week)
and multiply by the % who did not use condom at last sex  (multiply by 0.45);
if cald=2014.5 then do;
	oe_p_newple16_fsw_fc=0.36;
	oe_p_newp1654_fsw_fc=0.41;
	oe_p_newpgt54_fsw_fc=0.23;
end;


*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021;
*The data reported in this spreadhseet was Proportion of youth (aged 15-24) who report having used a condom the last time they had sex,
I am reporting 1-this proportion so we can compare to CLS;
if cald=2006 then do; o_p_cls_last_1524w_zdhs=0.58;o_p_cls_last_1524m_zdhs=0.32;end;
if cald=2011 then do; o_p_cls_last_1524w_zdhs=0.61;o_p_cls_last_1524m_zdhs=0.49;end;
if cald=2016 then do; o_p_cls_last_1524w_zdhs=0.56;o_p_cls_last_1524m_zdhs=0.34;end;
*Zimphia in 2016 the same as DHS except for o_p_cls_last_1524m_zimphia=0.38;



*******************************************************************************************
**********************************     8. Testing     *************************************
*******************************************************************************************


*** Proportion ever tested for HIV and tested in the last year;

*I did not use "Percentage of population tested for HIV in the last 12 months" in
male 15-24, female 15-24, male 25-49, female 25-49, male 50+, female 50+ from David Wilson 
as not always consistent with DHS estimates below; 

*Source: DHS 1999;
if cald=1999 then do; 
	o_p_evertested_1554m_zdhs=0.092;o_p_evertested_1554m_ll_zdhs=0.042;o_p_evertested_1554m_ul_zdhs=0.142;
	o_p_evertested_1549w_zdhs=0.118;o_p_evertested_1549w_ll_zdhs=0.068;o_p_evertested_1549w_ul_zdhs=0.168;
	o_p_evertested_1519m_zdhs=0.028;o_p_evertested_1519w_zdhs=0.061;
	***LBM Update Sep 2016;
	o_p_evertested_2024m_zdhs=0.073;o_p_evertested_2024w_zdhs=0.140;
	o_p_evertested_2529m_zdhs=0.120;o_p_evertested_2529w_zdhs=0.166;
	o_p_evertested_3039m_zdhs=0.133;o_p_evertested_3039w_zdhs=0.148;
	o_p_evertested_4049m_zdhs=0.157;o_p_evertested_4049w_zdhs=0.073;
end;

*Source: DHS 2006, Page 202: 
*The lower and upper limits for the % ever tested 15-49 are 0.05 absolute increase and decrease,
as I could not find the confidence intervals;

if cald=2006 then do; 
	o_p_evertested_1549m_zdhs=0.186;o_p_evertested_1549m_ll_zdhs=0.136;o_p_evertested_1549m_ul_zdhs=0.236;
	o_p_evertested_1549w_zdhs=0.258;o_p_evertested_1549w_ll_zdhs=0.208;o_p_evertested_1549w_ul_zdhs=0.308;
	o_p_evertested_1554m_zdhs=0.186;
	o_p_evertested_1519m_zdhs=0.084;o_p_evertested_1519w_zdhs=0.147;
	o_p_evertested_2024m_zdhs=0.205;o_p_evertested_2024w_zdhs=0.348;
	o_p_evertested_2529m_zdhs=0.248;o_p_evertested_2529w_zdhs=0.339;
	o_p_evertested_3039m_zdhs=0.230;o_p_evertested_3039w_zdhs=0.286;
	o_p_evertested_4049m_zdhs=0.221;o_p_evertested_4049w_zdhs=0.174;
	*o_p_evertested_5054m_zdhs= not reported in 2006 DHS;
	
	o_p_testedly_1549m_zdhs=0.067;o_p_testedly_1549w_zdhs=0.066;
	o_p_testedly_1519m_zdhs=0.029;o_p_testedly_1519w_zdhs=0.048;
	o_p_testedly_2024m_zdhs=0.086;o_p_testedly_2024w_zdhs=0.090;
	o_p_testedly_2529m_zdhs=0.098;o_p_testedly_2529w_zdhs=0.075;
	o_p_testedly_3039m_zdhs=0.073;o_p_testedly_3039w_zdhs=0.068;
	o_p_testedly_4049m_zdhs=0.066;o_p_testedly_4049w_zdhs=0.046;
	*o_p_testedly_5054m_zdhs= not reported;
	o_p_testedly_1554m_zdhs=0.066;
end;

*Source: DHS 2010-11, Page 198;
*The lower and upper limits for the % ever tested 15-49 are 0.05 absolute increase and decrease,
as I could not find the confidence intervals;
if cald=2011 then do; 
	o_p_evertested_1549m_zdhs=0.383;o_p_evertested_1549m_ll_zdhs=0.333;o_p_evertested_1549m_ul_zdhs=0.433;
	o_p_evertested_1549w_zdhs=0.597;o_p_evertested_1549w_ll_zdhs=0.547;o_p_evertested_1549w_ul_zdhs=0.647;
	o_p_evertested_1554m_zdhs=0.386;
	o_p_evertested_1519m_zdhs=0.116;o_p_evertested_1519w_zdhs=0.265;
	o_p_evertested_2024m_zdhs=0.356;o_p_evertested_2024w_zdhs=0.687;
	o_p_evertested_1524m_zdhs=0.222;o_p_evertested_1524w_zdhs=0.47;
	o_p_evertested_2529m_zdhs=0.506;o_p_evertested_2529w_zdhs=0.780;
	o_p_evertested_3039m_zdhs=0.506;o_p_evertested_3039w_zdhs=0.700;
	o_p_evertested_4049m_zdhs=0.513;o_p_evertested_4049w_zdhs=0.546;
	o_p_evertested_5054m_zdhs=0.448;

	o_p_testedly_1549m_zdhs=0.204;o_p_testedly_1549w_zdhs=0.336;
	o_p_testedly_1519m_zdhs=0.070;o_p_testedly_1519w_zdhs=0.184;
	o_p_testedly_2024m_zdhs=0.221;o_p_testedly_2024w_zdhs=0.422;
	o_p_testedly_2529m_zdhs=0.280;o_p_testedly_2529w_zdhs=0.441;
	o_p_testedly_3039m_zdhs=0.257;o_p_testedly_3039w_zdhs=0.361;
	o_p_testedly_4049m_zdhs=0.231;o_p_testedly_4049w_zdhs=0.264;
	o_p_testedly_5054m_zdhs=0.197;
end;

***LBM Update Sep 2016;
*Source: DHS Key Indicators 2015, Page 39;

if cald=2015.5 then do; 
	o_p_evertested_1549m_zdhs=0.641;o_p_evertested_1549m_ll_zdhs=0.591;o_p_evertested_1549m_ul_zdhs=0.691;
	o_p_evertested_1549w_zdhs=0.806;o_p_evertested_1549w_ll_zdhs=0.756;o_p_evertested_1549w_ul_zdhs=0.856;
	o_p_evertested_1554m_zdhs=0.647;

	o_p_evertested_1519m_zdhs=0.376;o_p_evertested_1519w_zdhs=0.479;
	o_p_evertested_2024m_zdhs=0.632;o_p_evertested_2024w_zdhs=0.848;
	o_p_evertested_1524m_zdhs=0.475;o_p_evertested_1524w_zdhs=0.639;
	o_p_evertested_2529m_zdhs=0.754;o_p_evertested_2529w_zdhs=0.921;
	o_p_evertested_3039m_zdhs=0.783;o_p_evertested_3039w_zdhs=0.934;
	o_p_evertested_4049m_zdhs=0.751;o_p_evertested_4049w_zdhs=0.868;

	o_p_testedly_1549m_zdhs=0.359;o_p_testedly_1549w_zdhs=0.488;
	o_p_testedly_1519m_zdhs=0.194;o_p_testedly_1519w_zdhs=0.298;
	o_p_testedly_2024m_zdhs=0.377;o_p_testedly_2024w_zdhs=0.578;
	o_p_testedly_2529m_zdhs=0.501;o_p_testedly_2529w_zdhs=0.607;
	o_p_testedly_3039m_zdhs=0.427;o_p_testedly_3039w_zdhs=0.541;
	o_p_testedly_4049m_zdhs=0.377;o_p_testedly_4049w_zdhs=0.434;
end;


*Source: National Behavioural Change Programme, AIDS 2010 Conference
		(Langhaug L, Buzdugan R, Dirawo J, et al. An evaluation of Zimbabwe's national behaviour change programme: results of the mid-term evaluation survey. 2010 Jul, Vienna, Austria 2010.);
if cald=2010.5 then do; o_p_evertested_1844_i_nbcp=0.5; o_p_evertested_1844_c_nbcp=0.36; end;

*Source: National Behavioural Change Programme 2013 
		(Cowan F. Evaluation of National Behavioural Change programme . 2013.);

if cald=2011.5 then do; o_p_evertested_1844m_nbcp=0.5; o_p_evertested_1844w_nbcp=0.75; end;

***LBM Update Sep 2016;
*Source: Population-Level Impact of Zimbabwe’s National Behavioural Change Programme, Buzdugan, Benedikt et al;

if cald=2011.5 then do; o_p_evertested_1844m_nbcp=0.588; o_p_evertested_1844w_nbcp=0.763; end;



*** Number of HIV tests performed & positivity rate;

*Source: Global AIDS response country  progress report Zimbabwe 2015;
if cald=2010.5 then o_s_tested_1549_py_garcpr =1653603;
if cald=2011.5 then o_s_tested_1549_py_garcpr =1943694;
if cald=2016.5 then m_s_tested_1549_py_garcpr =2777000; *target;

***LBM Update Sep 2016 
*Source: Global AIDS response country  progress report Zimbabwe 2016;
if cald=2007.5 then o_s_tested_1549_py_garcpr = 579767;
if cald=2009.5 then o_s_tested_1549_py_garcpr =1108264;
if cald=2012.5 then o_s_tested_1549_py_garcpr =2240344;
*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021)
15-49 are from page
At page 15 the age range is not indicated, not sure whether it refers to all ages or whether these are updated numbers,
for 2017-2019 they are the same values; 
if cald=2013.5 then o_s_tested_1549_py_garcpr =2274328;
if cald=2014.5 then do; o_s_tested_1549_py_garcpr =1755179;o_s_tested_py_garcpr =1795179;end;
if cald=2015.5 then do; o_s_tested_1549_py_garcpr =2201246;o_s_tested_py_garcpr =1952278;end;*how can alla ges be higher than 15-49?;
if cald=2016.5 then do; o_s_tested_1549_py_garcpr =2664844;o_s_tested_py_garcpr =2580766;end;
if cald=2017.5 then o_s_tested_1549_py_garcpr =2851049;
if cald=2018.5 then o_s_tested_1549_py_garcpr =3011027;
if cald=2019.5 then o_s_tested_1549_py_garcpr =2382768;

*HIV tests performed in adults (15+) in the public health sector, including first antenatal tests but not second antenatal tests;
*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021;
if cald=2011.75 then do;o_s_test_15ov_py_z=1656719; o_pos_rate_15ov_z=0.2; end;
if cald=2012.75 then do;o_s_test_15ov_py_z=1868842; o_pos_rate_15ov_z=0.16; end;
if cald=2013.75 then do;o_s_test_15ov_py_z=1430246; o_pos_rate_15ov_z=0.13; end;
if cald=2014.75 then do;o_s_test_15ov_py_z=1756524; o_pos_rate_15ov_z=0.11; end;
if cald=2015.75 then do;o_s_test_15ov_py_z=2201250; o_pos_rate_15ov_z=0.09; end;
if cald=2016.75 then do;o_s_test_15ov_py_z=2664844; o_pos_rate_15ov_z=0.07; end;
if cald=2017.75 then do;o_s_test_15ov_py_z=3174630; o_pos_rate_15ov_z=0.06; end;
if cald=2018.75 then do;o_s_test_15ov_py_z=3011027; o_pos_rate_15ov_z=0.06; end;
if cald=2019.75 then do;o_s_test_15ov_py_z=2382768; o_pos_rate_15ov_z=0.05; end;
if cald=2020.75 then do;o_s_test_15ov_py_z=1521942; o_pos_rate_15ov_z=0.06; end;



*Source: Global fund reports - sent by Trevor 
Number people who received HIV counseling and testing and received their results (it includes children),
and tests conducted by MoH in OI/ART, PMTCT and VCT monthly returns and by PSI.
The cald refers to the end of the trimester, when stratified by sex it includes only people tested by MOH, not by PSI;

*(GFR8_Narrative_Report-2010_Annual_fina_TAl[1], Page 6);
if cald=2010.25 then     o_s_rec_htc_Z_GF_all=195183;
if cald=2010.5  then     o_s_rec_htc_Z_GF_all=208211;
*In the Annex 1 achievement it is reported 437,254, which is the cumulative # of test from Jan 2010 to June 2010,
in the annual report the cumulative number is 403394;
if cald=2010.75 then     o_s_rec_htc_Z_GF_all=491445;*Cumulative reported 894,839;
if cald=2011    then     do; o_s_rec_htc_Z_GF_all=487052;**Cumulative reported 1,381,891, in the Q4 reported 314964;
							 o_s_rec_htc_Z_GF_all_ly=1381891;end;

*(GFR8_Narrative_Report-Q5_Final, Page 4);
if cald=2011.25 then do; o_s_rec_htc_Z_GF_all=443950; o_s_rec_htc_Z_GF_m_moh=102883; o_s_rec_htc_Z_GF_w_moh=246238;end;
*(GFR8_Narrative_Report-Q6_draft[1 edits TA, Page 5 - cumulative numbers reported (826929) - minus 1st quarter);
if cald=2011.5  then do; o_s_rec_htc_Z_GF_all=382980; o_s_rec_htc_Z_GF_m_moh=83416; o_s_rec_htc_Z_GF_w_moh=205353; end;
*(GFR8_Narrative_Report-Q7 final-1, Page 3, cumulative 1360350 - minus first two quarters);
if cald=2011.75 then do; o_s_rec_htc_Z_GF_all=533420; o_s_rec_htc_Z_GF_m_moh=129024; o_s_rec_htc_Z_GF_w_moh=305577;
												o_s_rec_htc_Z_GF_m_moh_ly=315323; o_s_rec_htc_Z_GF_w_moh_ly=757168;end;

*from MOHCW National HIV indicator database (02/11/2011), reporting rate is 79%
Since April 2011, PCs were now allowed to do HIV testing which contributed to the high uptake in HIV testing;


***LBM: I have commented out below and replaced with numbers from GFR8 report as could not calculate numbers below;
/*if cald=2012    then do; o_s_rec_htc_Z_GF_all=377410; */

***LBM Update Sep 2016;
*(GFR8_Narrative_Report-Q8_draft_chris, Page 4, 1605975-1st three quarters above);
if cald=2012    then do; o_s_rec_htc_Z_GF_all=245625;o_s_rec_htc_Z_GF_m_moh=80181; o_s_rec_htc_Z_GF_w_moh=169173;

***LBM: I have commented out below and replaced with numbers from GFR8 report as could not calculate numbers below;
   /*Cumulative for 2011; o_s_rec_htc_Z_GF_all_ly =1705637;o_s_rec_htc_Z_GF_m_ly =579296;o_s_rec_htc_Z_GF_w_ly =1125393;
                         o_s_rec_htc_Z_GF_all_ly =1943694; *reported in GF Q13;*/
   *Cumulative for 2011; o_s_rec_htc_Z_GF_all_ly =1605975;o_s_rec_htc_Z_GF_m_moh_ly =395504;o_s_rec_htc_Z_GF_w_ly =926341;
                         o_s_rec_htc_Z_GF_all_ly =1943694; *reported in GF Q13;

end;


*(GFATM Quarterly Reporting Zim_Q10, page 11);
*Quarter 9 and 10, first 6 months of 2012 not much happened because of delays in receiving money from Global Fund;
if cald=2012.25    then o_s_rec_htc_Z_GF_all=385004; 
if cald=2012.5     then o_s_rec_htc_Z_GF_all=926461;*reporting rate 62.4%;	

*from the National HIV Indicator database (12/08/12);
*(GF PUDR Q13 Final report submitted, Page 16);
if cald=2013    then do; o_s_rec_htc_Z_GF_all    =  622832;
   *Cumulative for 2012; o_s_rec_htc_Z_GF_all_ly = 2240344;*reported in GF Q13, Total M+Total W is more than overall total;
                         o_s_rec_htc_Z_GF_m_ly   =  974478;
                         o_s_rec_htc_Z_GF_w_ly   = 1634464;
end;
if cald=2013.25 then do; o_s_rec_htc_Z_GF_all    = 535963;*84% reporting rate, it does not add up;
						 o_s_rec_htc_Z_GF_m      = 303539;
						 o_s_rec_htc_Z_GF_w      = 328834;
end;

*Email from Karin Hatzold on 2nd May 2016 and 28/06/2016; 
if cald=2015.75 then do; 
*total number of HIV tests conducted in Zimbabwe;
		o_s_rec_htc_Z_all_ly_PSI    = 2100000;
*total number of HIV tests conducted in Zimbabwe by PSI (excluding test conducted by PSI pre-circumcision) is 425,000
		(21% of the total number of tests):
		conducted 65% at community level and 35% at fixed sites;
		o_s_rec_comhtc_Z_PSI_ly_PSI=276250; *so 0.21*0.65 are community tests: 14%;
		o_s_rec_fixhtc_Z_PSI_ly_PSI=148750; 
		o_s_rec_htc_Z_PSI_ly_PSI=425000; 

*PSI performs ~85% of all test conducted pre-circumcision (~200000) so the total number of test conducted pre-circumcision;
		o_s_htc_precirc_Z_all_ly_PSI=250000;
*Number of tests conducted in ANC (it should be around 40%, based on the fact that Karin said that most tests done by government are done in ANC);
*Update VC Nov 2016;
		o_s_htc_anc_Z_ly_PSI=840000;
end;


*17June2016;
*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		Senior Monitoring and Evaluation Officer, AIDS and TB National Programme, Zimbabwe, 23 November 2015
		(Slide 23 in Zim_ePMS Data Completeness.ppt);
*#Of PLHIV who were tested and enrolled into HIV care at ePMS sites in 2013 (by government), prop who were diagnosed in hospital, etc...;
if cald=2015 then do;
	p_hosp_m_newdiag=0.513; p_hosp_w_newdiag=0.440;
	p_vct_m_newdiag =0.322; p_vct_w_newdiag=0.264;
	p_anc_m_newdiag =0.028; p_anc_w_newdiag=0.197;
	p_tb_m_newdiag  =0.061; p_tb_w_newdiag=0.032;
	p_oth_m_newdiag=0.019; p_oth_w_newdiag=0.017;
end;
*
Q1 - Are people diagnosed in hospital symptomatic people or are they due to PITC?
	 Reply from Tsitsi on 5th July 2016: 
	 "Although we have guidelines for PITC, the practice is still limited and implementation varies across sites. 
	 However, there is a bias to test more among the symptomatic patients at the health facilities.
	 PITC is implemented very well in the ANC settings for PMTCT and in the TB clinics. But needs strengthening in the other areas."
Q2 - Would most people who develop WHO4 or WHO3 disease present in the hospital?
	 Reply from Tsitsi on 5th July 2016: "yes, this is true"
Q3 - I know that circumcision is rolled out in Zim, if a person is diagnosed at the test pre-circumcision to which of the “reasons” it belongs? 
	 Reply from Tsitsi on 5th July 2016: It could be classified as either as  'hospital/illness' where VMMC is offered at the hospital or 'Other'. 
	 We are revising the Green book so there is need to specifiy VMMC."
Q4 - What is the denominator?
	 Reply from Tsitsi on 11th July 2016: 
     The denominator is the number of PLHIV who were tested and enrolled into HIV care at ePMS sites in 2013. 
	 While reporting ePMS sites are now about 410, they were way fewer back then when this analysis was done.
	 - The denominator excludes individuals who tested HIV positive but did not enrol into HIV care.
	 - Those tested at PSI sites are excluded since those sites never had ePMS at the time;



*** Female sex workers;

*3Nov2015;
*Source: "Zimbabwe data.xls" sent by David Wilson;
if cald=2006 then o_p_testedly_fsw_dw=0.07;
if cald=2011 then o_p_testedly_fsw_dw=0.34;
if cald=2014 then o_p_testedly_fsw_dw=0.5;

***LBM Update Sep 2016 - Numbers below have been updated with numbers from manuscripts (previusly were extracted from slides);
*Source: Sisters with A Voice 
		 Cohort  Analysis of Program Data to Estimate HIV Incidence and uptake of HIV related services among FSW in Zim 2009-14, Hargreaves 2015;
if cald=2012.5 then o_p_evertested_fsw_swv=0.72;

*Source: Baseline RDS
		 The HIV care cascade among female sex workers in Zimbabwe: results of a population-based survey from the Sisters Antiretroviral therapy
		 Programme for Prevention of HIV, an Integrated Response (SAPPH-IRe) Trial, Cowan 2016;
*The lower and upper limits have been arbitrarely chosen.
The upper limit is based on the fact that on the RDS the point estimate found was 0.922. 
The lower limit is based on the fact that the point estimate in the Sisters with a voice demonstration project was 0.72;
if cald=2013.75 then do;
	o_p_evertested_fsw_rds=0.922;o_p_evertested_fsw_ll_rds=0.69;o_p_evertested_fsw_rds=0.97;
end;

*Number of FSW who attended Sisters clinics
Source: Document “Sisters numbers v4”;
if cald=2014.75 then do;
	o_nfsw_sistclin_fc   =13168;
	o_nfsw_sistclin1st_fc=10019;
end;
if cald=2015.75 then do;
	o_nfsw_sistclin_fc   =16904;
	o_nfsw_sistclin1st_fc=11391;
end;



***Diagnosed with HIV;
*Source: DHS 2010-11
		 Table 14.10 page 227 "Percent distribution of women and men age 15-49 who tested HIV positive...");
if cald=2011 then do;
	o_p_diag_1549_dhs =0.637;
	o_p_diag_m1549_dhs=0.514;
	o_p_diag_w1549_dhs=0.71;
end;

***LBM Update Sep 2016 - No further results reported in DHS 2015 Key Indicators report;		

***LBM Update Jan 2017;
*Zimphia 2015-2016;
if cald=2016.25 then do;
	o_p_diag_1564_zimphia=0.742;
	o_p_diag_1564m_zimphia=0.697;	
	o_p_diag_1564w_zimphia=0.771;
	*Source: file:///C:/Users/ValentinaCambiano/Downloads/Progress_Toward_the_90_90_90_HIV_Targets_in.7.pdf
	"we aware of their HIV status or had detectable antiretroviral levels";
	o_p_diag_1564_zimphia=0.768; o_p_diag_1564_ll_zimphia=0.749;o_p_diag_1564_ul_zimphia=0.787;
	o_p_diag_1564m_zimphia=0.721;o_p_diag_1564m_ll_zimphia=0.689;o_p_diag_1564m_ul_zimphia=0.753;
	o_p_diag_1564w_zimphia=0.801;o_p_diag_1564w_ll_zimphia=0.781;o_p_diag_1564w_ul_zimphia=0.820;

end;
* Source: Summary sheet December 2020 Zimbabwe population-based HIV impact assessment;
if cald=2020 then do;
	o_p_diag_15pl_zimphia=0.868;
	o_p_diag_15plm_zimphia=0.843;	
	o_p_diag_15plw_zimphia=0.883;
end;


*Source: RDS last quarter 2013 (reported in Document “Sisters numbers v4” & in cascade manuscript);
if cald=2013.75 then do;
	o_p_diag_fsw_rds=0.64;*0.67 reported in the manuscript of trial citing
*Source: AIDS 2014 Conference, Cowan F. HIV care cascade among female sex workers in zimbabwe: Baseline results of the sAPPH-iRe trial;
	o_p_diag_fsw1524_rds=0.39;
	o_p_diag_fswge25_rds=0.69;
end;

*Source: RDS endline 2016 (reported in "Cowan SAPPH-IRe IAS Results 2016 - 5", slide 17 control arm);
if cald=2016.25 then o_p_diag_fsw_rds=0.80;
*Source: Global AIDS response country  progress report 2020, page 25,
Note: not clear where these estimates come from;
if cald=2016.5 then o_p_diag_fsw_garpr=0.94;
if cald=2017.5 then o_p_diag_fsw_garpr=0.91;
if cald=2018.5 then o_p_diag_fsw_garpr=0.93;
if cald=2019.5 then o_p_diag_fsw_garpr=0.81;


*Source: excel spreadsheet entitled "Testing yield 2013-2015_HIV_ stats_18_02_16" sent by Frances on 8July2016
Note: I sent an email to Frances double checking whether  it is within the Sisters with a Voice program and whether it is a sample 
 or are all tests done within Sister with a Voice (with yield I mean positivity rate);
if cald=2013 then do;o_n_test_fsw_sister=1475;o_yield_fsw=0.332;end;
if cald=2014 then do;o_n_test_fsw_sister=3526;o_yield_fsw=0.303;end;
if cald=2015 then do;o_n_test_fsw_sister=5677;o_yield_fsw=0.224;end;




******* Pregnant women;
*Source:  'Issues_with_testing_in_anc_20161107'. Document produced by VC to explore discrepancies in anc data;
***Number of pregnant women;
if cald=2011.5 then o_s_pregnant_MoH=412122;
if cald=2013.5 then o_s_pregnant_WHO=398474;
if cald=2016.5 then o_s_pregnant_Mhangara=433914; *expected;


*** Proportion of pregnant women attending ANC (irrespective of HIV status) ;
*Source: Figure 6 in "Policy brief_Option A IE (3).doc" sent by Frances Cowan on 4th November 2016;
*Update VC Nov 2016;
if cald=2012.5 then o_p_anc_pregnant_Cowan=0.94;
if cald=2014.5 then o_p_anc_pregnant_Cowan=0.95;



*** Proportion of pregnant women tested in ANC;

*Source: DHS 2005-2006, page 203;
if cald=2006 then do;
	o_p_testedanc_1549_zdhs = 0.226;
	o_p_testedanc_1519_zdhs = 0.202;
	o_p_testedanc_2024_zdhs = 0.257;
	o_p_testedanc_2529_zdhs = 0.208;
	o_p_testedanc_3039_zdhs = 0.225;
	o_p_testedanc_4049_zdhs = 0.119;
end;

*Source: DHS 2010-2011, Page 201;
if cald=2011 then do;
	o_p_testedanc_1549_zdhs = 0.591;
	o_p_testedanc_1519_zdhs = 0.449;
	o_p_testedanc_2024_zdhs = 0.596;
	o_p_testedanc_2529_zdhs = 0.665;
	o_p_testedanc_3039_zdhs = 0.588;
	o_p_testedanc_4049_zdhs = 0.491;
end;

***LBM Update Sep 2016 - No further information in DHS 2015 Key Indicators Report;

*Source: Multiple Indicator Monitoring (MIM) survey 2009, Page 4 and 135
		 (Zimbabwe National Statistical Agency, UNICEF. Zimbabwe Multiple indicator monitoring survey (MIMS) 2009. UNICEF 2010 May [cited 2014 Mar 23] 
		  Available from: URL: http://www.childinfo.org/files/MICS3_Zimbabwe_FinalReport_2009_Eng.pdf);
if cald=2009.5 then do;
	o_p_evertested_1549w_mim=0.449;
	*Proportion of pregant women tested in ANC;
	o_p_testedanc_1549_mim = 0.581;
end;

*Source: Multiple Indicator Monitoring (MIM) survey 2014, Page 259 and 263
***LBM Update Sep 2016;
if cald=2014.5 then do;
	o_p_evertested_1549w_mim=0.816;
	*Proportion of pregant women tested in ANC;
	o_p_testedanc_1549_mim = 0.902;
end;

***LBM Update Sep 2016;
*Source: Global AIDS response country  progress report 2016;
if cald=2007.5 then o_p_testedanc_garcpr = 0.71;
if cald=2009.5 then o_p_testedanc_garcpr = 0.85;
if cald=2011.5 then o_p_testedanc_garcpr = 0.96;
if cald=2012.5 then o_p_testedanc_garcpr = 0.97;
if cald=2013.5 then o_p_testedanc_garcpr = 0.99;
if cald=2014.5 then o_p_testedanc_garcpr = 0.99;
if cald=2015.5 then o_p_testedanc_garcpr = 0.99;

*** Proportion of pregnant women tested for HIV in ANC;
*Source: email by Frnaces Cowan on 4th Nov 2016;
*Update VC Nov 2016;
if cald=2014.5 then o_p_testedanc_preg_Cowan = 0.923;



*** Proportion of pregnant women tested for HIV in ANC or who knew their HIV positive status;

*Source: Figure 6 in "Policy brief_Option A IE (3).doc" sent by Frances Cowan on 4th November 2016;
*Update VC Nov 2016;
if cald=2012.5 then o_p_TESTorAW_preg_Cowan=0.90;
if cald=2014.5 then o_p_TESTorAW_preg_Cowan=0.94;

*Source: "Maternal PMTCT Cascade Jan-Jun 2016.ppt" sent by Mutsa Mhangara (Zimbabwe MoH) on 5th November 2016;
*Update VC Nov 2016;
if cald=2016.5 then o_p_TESTEDorAW_anc_MoH = 0.98;

*** Awareness status of HIV+ women only, 3.3% had not tested before pregnancy, 32.7% tested negative, and 63.9% tested positive (so they knew their positive status already).

Proportion of pregnant women attending ANC (irrespective of HIV status) ;
*Source: Figure 6 in "Policy brief_Option A IE (3).doc" sent by Frances Cowan on 4th November 2016;
*Update VC Nov 2016;
if cald=2014.5 then do;
	o_p_newdiag_pospreg=0.033;
end;



*** Number of pregnant women who were given PMTCT prophylaxis in the 3 months period;

*Source: Global fund reports - sent by Trevor;
if cald=2010.25 then o_s_pregnant_pmtct_Z_GF=7508;
if cald=2010.5  then o_s_pregnant_pmtct_Z_GF=5426;*Cumulative 14,134 (30% of the target).
*MOHCW National indicator database is incomplete (Mutare, Buhera, Mt Darwin, Shamva, Rushinga, Guruve, Chegutu, Binga, Umzingwane, Mangwe, Bulilima, Bubi, Gweru, Zaka data not available). 
*% of HIV-infected pregnant women who received  ARV prophylaxis to reduce the risk of mother-to-child transmission of HIV;
if cald=2010.75 then o_s_pregnant_pmtct_Z_GF=6430;*Cumulative 26,767 (56% of the target);
if cald=2011    then o_s_pregnant_pmtct_Z_GF=11642;*(66% REPORTING RATE) - Cumulative total is now 44,444 (93.6% of target);
if cald=2011.25 then o_s_pregnant_pmtct_Z_GF=8899;*(66% REPORTING RATE);
if cald=2011.5  then o_s_pregnant_pmtct_Z_GF=7565;*(77.5% REPORTING RATE);
if cald=2011.75 then o_s_pregnant_pmtct_Z_GF=25472;*(79% REPORTING RATE);
if cald=2012    then do; o_s_pregnant_pmtct_Z_GF=12932;*(68% REPORTING RATE); 
            *Cumulative; o_s_pregnant_pmtct_Z_GF_ly=44770;end;

if cald=2012.25 then     o_s_pregnant_pmtct_Z_GF=18698;*(% REPORTING RATE); 
if cald=2012.5  then     o_s_pregnant_pmtct_Z_GF=11626;*(62% REPORTING RATE); 
if cald=2012.75 then     o_s_pregnant_pmtct_Z_GF=14450;*(83% REPORTING RATE); 
if cald=2013.00 then do; o_s_pregnant_pmtct_Z_GF=14450;*(83% REPORTING RATE);
			*Cumulative; o_s_pregnant_pmtct_Z_GF_ly=59224; end;

if cald=2013.25 then     o_s_pregnant_pmtct_Z_GF=13444;*(84% REPORTING RATE); 


*** % HIV+ pregnant women receiving PMTCT;

if cald=2010.25 then o_P_hivpospreg_pmtct_Z_GF=0.16;
if cald=2010.5  then o_P_hivpospreg_pmtct_Z_GF=0.20;
if cald=2010.75 then o_P_hivpospreg_pmtct_Z_GF=0.56;
if cald=2011    then o_P_hivpospreg_pmtct_Z_GF=0.94;*end of 2010;
if cald=2012    then o_P_hivpospreg_pmtct_Z_GF=0.955;*end of 2011;
if cald=2013    then o_P_hivpospreg_pmtct_Z_GF=0.975;*end of 2012;
if cald=2013.25 then o_P_hivpospreg_pmtct_Z_GF=0.905;

*% of women on PMTCT (Option B/B+);
*Source: "Zimbabwe data.xls" sent by David Wilson;
*Not sure about these data;
if cald=2012.75 then o_P_hivpospreg_pmtct_dw = 0.93;
if cald=2013.75 then o_P_hivpospreg_pmtct_dw = 0.82;	
if cald=2014.75 then o_P_hivpospreg_pmtct_dw = 0.66;


***LBM update;
*Source: Global AIDS response country  progress report 2016;
if cald=2007.5 then o_P_hivpospreg_pmtct_garcpr = 0.22;
if cald=2009.5 then o_P_hivpospreg_pmtct_garcpr = 0.59;
if cald=2011.5 then o_P_hivpospreg_pmtct_garcpr = 0.86;
if cald=2012.5 then o_P_hivpospreg_pmtct_garcpr = 0.85;
if cald=2013.5 then o_P_hivpospreg_pmtct_garcpr = 0.82; 
if cald=2014.5 then o_P_hivpospreg_pmtct_garcpr = 0.79;
if cald=2015.5 then o_P_hivpospreg_pmtct_garcpr = 0.85;
*Source: Global AIDS response country  progress report 2020;
if cald=2016.5 then o_P_hivpospreg_pmtct_garcpr = 0.921;
if cald=2017.5 then o_P_hivpospreg_pmtct_garcpr = 0.955;
if cald=2018.5 then o_P_hivpospreg_pmtct_garcpr = 0.8998;
if cald=2019.5 then o_P_hivpospreg_pmtct_garcpr = 0.908;

*** Proportion of HIV-postive pregnant women who received PMTCT or were on ART;
*Source: Figure 7 in "Policy brief_Option A IE (3).doc" sent by Frances Cowan on 4th November 2016;
*Update VC Nov 2016;
if cald=2012.5 then o_p_PMTCTorART_pospreg_Cowan=0.59;
if cald=2014.5 then o_p_PMTCTorART_pospreg_Cowan=0.65;


***Repeat testing;
*Source: Increases in HIV Testing and Case Detection from NIMH Project Accept (HPTN 043) among 16–32 Year Olds;
if cald=2011 then o_rct_max_p_repeat_test=0.28;





*******************************************************************************************
************************     9. Linkage from testing to ART Uptake     ***********************
*******************************************************************************************


*** Percentage of HIV infected pregnant women assessed for ART eligibility through either clinical staging or CD4 testing;

*Source: Global AIDS response country progress report 2014
(Available: http://www.unaids.org/en/dataanalysis/knowyourresponse/countryprogressreports/2014countries/ZWE_narrative_report_2014.pdf)
(PMTCT database);
if cald=2009.5 then o_p_staged_garcpr=0.07;
if cald=2011.5 then o_p_staged_garcpr=0.71;
if cald=2012.5 then o_p_staged_garcpr=0.78;
if cald=2013.5 then o_p_staged_garcpr=0.66;

***LBM Update Sep 2016 - No further updates in 2015 or 2016 reports;


*17June2016;
*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		Senior Monitoring and Evaluation Officer, AIDS and TB National Programme, Zimbabwe, 23 November 2015
		(Slide 22 in Zim_ePMS Data Completeness.ppt);
****CAREFUL: "This presentation is based on data extracted from 77 ePMS sites across the country’s 10 provinces in March 2015. 
				At the time, there were only 83 ePMS sites in the country.
			n=22,800 for the national sample using an ART cohort of all clients initiated on ART in 2013 in the ePMS sites"
			proportion who were diagnosed and initiated on ART in the same calendar year;
if cald=2013.5 then o_p_inonart_diagsamecaly_nac=0.721;






*******************************************************************************************
*********************     10. On ART: In need, started, on ART     ************************
*******************************************************************************************



*** Number of people on ART or 1st line or 2nd line;

*Source: Global AIDS Response Progress Report 2012, Page 31. Error limits are respectively a 5% relative increase and decrease;
***LBM update Sep2016, still using GARPCR 2012 report. Old figures were a mistake;
if cald=2010.5 then do; o_s_onart_adults_garpr = 298092; o_s_onart_adults_ll = 283187;o_s_onart_adults_ul = 312997;end;
if cald=2011.5 then do; o_s_onart_adults_garpr = 396041; o_s_onart_adults_ll = 376239;o_s_onart_adults_ul = 415843;end;

*Source: Global Funds Reports sent by Trevor;
if cald=2011.5 then     o_s_onart_adults_garpr = 440000;
if cald=2012.5 then do; o_s_onart_adults_garpr = 514700; o_s_onart_adults_ll = 488965;o_s_onart_adults_ul = 540435; end;
if cald=2013.5 then do; o_s_onart_adults_garpr = 544200; o_s_onart_adults_ll = 516990;o_s_onart_adults_ul = 571431; 
						o_s_onart_adultsm_garpr = 199400; 
						o_s_onart_adultsw_garpr = 344800; end;

***LBM Update Sep2016
*Source: Global AIDS Response Progress Report 2015, page 20;
if cald=2014.75 then do;o_s_onart_adults_garpr = 732919; o_s_onart_adults_ll = 696273;o_s_onart_adults_ul = 769565; end;
*Source: Global AIDS Response Progress Report 2016, page 15. 93% of 879271;
if cald=2015.75 then do;o_s_onart_adults_garpr = 817722; o_s_onart_adults_ll = 776836;o_s_onart_adults_ul = 858608; end;
*Source: Global AIDS Response Progress Report 2020, page 16;
if cald=2019.75 then do;o_s_onart_adults_garpr = 1149191;end;




*Source: "Zimbabwe data.xls" sent by David Wilson
		  Also reported in "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
         (Slide 4&5 in Zim_ePMS Data Completeness.ppt);

*In this presentation they reported "Private ART Study (2014) revealed that private sector Pharmacies reported a total of 
96,607 ART clients  whilst Surgeries and Clinics reported 4,524 active ART clients";

*NOTE: David wilson indicated the number of people on 2nd line as subsequent lines but on the presentation these are indicated as number of people on 2nd line
and it says "Number of Patients on 3rd-line ART are will be collected (from Parirenyatwa Group of Hospitals, Harare Hospital, Newlands Clinic & Mpilo Central Hospital) and shared in the next presentation. ";

if cald=2004.75 then do; o_s_all_on1stline_NAC = 10890;  o_s_all_2ndline_NAC = 110;   o_s_all_onart_MoH = 11000;  end;
if cald=2005.75 then do; o_s_all_on1stline_NAC = 25608;  o_s_all_2ndline_NAC = 259;   o_s_all_onart_NAC = 25867;  end;

if cald=2006.75 then do; o_s_all_on1stline_NAC = 59705;  o_s_all_2ndline_NAC = 603;   o_s_all_onart_NAC = 60308;  end;
if cald=2007.75 then do; o_s_all_on1stline_NAC = 98911;  o_s_all_2ndline_NAC = 999;   o_s_all_onart_NAC = 99910;  end;
if cald=2008.75 then do; o_s_all_on1stline_NAC = 147720; o_s_all_2ndline_NAC = 1493;  o_s_all_onart_NAC = 149213; end;
if cald=2009.75 then do; o_s_all_on1stline_NAC = 219056; o_s_all_2ndline_NAC = 2213;  o_s_all_onart_NAC = 221269; end;
if cald=2010.75 then do; o_s_all_on1stline_NAC = 359628; o_s_all_2ndline_NAC = 3633;  o_s_all_onart_NAC = 363261; end;
if cald=2011.75 then do; o_s_all_on1stline_NAC = 474962; o_s_all_2ndline_NAC = 9693;  o_s_all_onart_NAC = 484655; end;
if cald=2012.75 then do; o_s_all_on1stline_NAC = 554362; o_s_all_2ndline_NAC = 11313; o_s_all_onart_NAC = 565675; end;
if cald=2013.75 then do; o_s_all_on1stline_NAC = 647601; o_s_all_2ndline_NAC = 17598; o_s_all_onart_NAC = 665199; end;
if cald=2014.75 then do; o_s_all_on1stline_NAC = 767134; o_s_all_2ndline_NAC = 20846; o_s_all_onart_NAC = 787980; end;
if cald=2015.5  then do; o_s_all_on1stline_NAC = 831584; o_s_all_2ndline_NAC = 22597; o_s_all_onart_NAC = 854181; end;*Up to Sept 2015;



***LBM Update Mar 2017;
*  Tsitsi Apollo, received 23rd Feb 2017 'Zim_Adults on ART by gender';
* "all refers to adults";
if cald=2004.75 then do;	o_s_allmale_onart_NAC = 4857;   o_s_allfemale_onart_NAC = 6143; 	o_s_all_onart_NAC=11000; end;
if cald=2005.75 then do;	o_s_allmale_onart_NAC = 11305;  o_s_allfemale_onart_NAC = 14562;	o_s_all_onart_NAC=25867; end;
if cald=2006.75 then do;	o_s_allmale_onart_NAC = 25184;  o_s_allfemale_onart_NAC = 28448;	o_s_all_onart_NAC=53632; end;
if cald=2007.75 then do;	o_s_allmale_onart_NAC = 33235;  o_s_allfemale_onart_NAC = 56854;	o_s_all_onart_NAC=90089; end;
if cald=2008.75 then do;	o_s_allmale_onart_NAC = 47210;  o_s_allfemale_onart_NAC = 87513;	o_s_all_onart_NAC=134723;end;
if cald=2009.75 then do;	o_s_allmale_onart_NAC = 72571;  o_s_allfemale_onart_NAC = 127059; 	o_s_all_onart_NAC=199630;end;
if cald=2010.75 then do;	o_s_allmale_onart_NAC = 117261; o_s_allfemale_onart_NAC = 213118;	o_s_all_onart_NAC=330379;end;
if cald=2011.75 then do;	o_s_allmale_onart_NAC = 161627; o_s_allfemale_onart_NAC = 283036;	o_s_all_onart_NAC=444663;end;

if cald=2012.75 then do;	o_s_allmale_onart_NAC = 188595; o_s_allfemale_onart_NAC = 330206;	o_s_all_onart_NAC=518801;end;
if cald=2013.75 then do;	o_s_allmale_onart_NAC = 226291; o_s_allfemale_onart_NAC = 392589;	o_s_all_onart_NAC=618880;end;
if cald=2014.75 then do;	o_s_allmale_onart_NAC = 264614; o_s_allfemale_onart_NAC = 468305; 	o_s_all_onart_NAC=732919;end;
if cald=2015.75 then do;	o_s_allmale_onart_NAC = 301650; o_s_allfemale_onart_NAC = 516557;	o_s_all_onart_NAC=818207;end;

*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021,
from 2012 they are listed as well in this excel spreadhsett and they correspond;
if cald=2016.75 then o_s_all_onart_NAC=909508;
if cald=2017.75 then o_s_all_onart_NAC=1051790;
if cald=2018.75 then o_s_all_onart_NAC=1086674;
if cald=2019.75 then o_s_all_onart_NAC=1087360;
if cald=2020.75 then o_s_all_onart_NAC=1128432;


*Source: Operational and Service Delivery Manual for the Prevention, Care and Treatment of HIV in Zimbabwe 
		 by AIDS & TB programme, Ministry of Health and Child Care, Zimbabwe – June 2015;
if cald=2013.75 then o_s_onart_adults_osdm = 620867; ***LBM Update Sep 2016 - changed from 544200;

*Global fund reports - sent by Trevor:
Number of people (adults and children) with advanced HIV infection receiving (ART),
it includes ONLY patients initiated in public sector on appropriate 1st line regimen according to national ART guideline;

if cald=2010.25 then o_s_all_onart_adv = 224630;
if cald=2010.5  then o_s_all_onart_adv = 243683;
*from ART May 2010 Progress Report by Province, MOHCW, updated 14-07-2010 with 41.71% reporting rate
it does not include 10,000 estimate for number of ART patients in the private sector;
if cald=2010.75 then o_s_all_onart_adv = 282916;
*from HIV Indicator Database September 2010 Report 03-11-2010 at 4:14pm with 70% reporting rate. 
This number does not include 10,000 estimate for number of ART patients in the private sector;
if cald=2011    then o_s_all_onart_adv = 326241;
*from HIV Indicator Database December 2010 Report 31-01-2010 at 2:27pm with 84% (293/348) reporting rate
This number does not include 10,000 estimate for number of ART patients in the private sector;
if cald=2011.25    then o_s_all_onart_adv = 347349;
*from HIV Indicator Database 05/05/ 2011 report and 80% (354/443) report rate . 
Total only for reports submitted Janaury-March 2011. 
This number does not include 10,000 estimate for number of ART patients in the private sector;
if cald=2011.5 then o_s_all_onart_adv = 416021;
*from HIV Indicator Database 29/07/2011 report and 80% report rate. 
This number does not include 10,000 estimate for number of ART patients in the private sector;
if cald=2011.75 then o_s_all_onart_adv = 373507;
*From HIV Indicator Database 02/11/2011 report and 69% report rate. 
This number does not include 10,000 estimate for number of ART patients in the private sector;
if cald=2012    then do; o_s_all_onart_adv = 401370;o_s_adults_onart_adv = 440000;*? from report Q13;end;
*from HIV Indicator Database 02/02/2012  report and 80% report rate. 
This number does not include 10,000 estimate for number of ART patients in the private sector
Eight districts did not report namely Chimanimani, Mutasa, Centenary, Zvimba, Kariba, Gwanda, Shurugwi, Masvingo;
if cald=2012.25    then     o_s_all_onart_adv = 436024;
if cald=2012.5     then do; o_s_all_onart_adv = 419724;*Decline due to people not reporting nto to actual decline. 549,812 in GF Q11-Q12;
							o_s_adults_onart_adv = 385622;*504,124 in GF report Q11-Q12;
end;
if cald=2013       then do; o_s_all_onart_adv = 558488;*565,675 in GF Q11-Q12, but in Q13 value reported, probably corrected;
							o_s_adults_onart_adv = 514679;
end;*518801 in GF report Q11-Q12;
if cald=2013.25    then do; *reporting rate 94%;
							o_s_all_onart_adv = 593157;
							o_s_adults_onart_adv = 544158;o_s_adults_onart_adv_m = 199391;o_s_adults_onart_adv_w = 344767;
							o_coverage=0.84; end;


*Source: Travor Mabugu personal comuunication by email on 30/07/2013;
*It refers to the period between Jan 2012 to Dec 2012;
if cald=2013 then do;
		o_s_started_art_ly=138842;*patients newly initiated on first line ART, not specified  whether all or only adults;
		o_s_swicth_2nd_line=2193; *patients switched to second line;
end;


***LBM Update Sep 2016;
*Source: Email from Joseph Murungu to AP 29/10/2016, numbers quoted from the MOHCC half year performance report (not published yet);
if cald=2016.5 then  o_s_onart_adults_jm=853544;


***Total number of people living with HIV receiving ART (Jan 2004-Sept2015)
   Number of people on first-line and on second line;


***Number of adults on second line ART;
*Source: Email on 19June2015 to Andrew Phillips from Joseph Murungu referencing National Logistics Management Information System
		 Error limits are respectively a 20% relative increase and decrease;
if cald=2014.75 then do; o_s_adu_on2ndline_jm =10580; o_s_adu_on2ndline_ll = 8464; o_s_adu_on2ndline_ul = 12696;end;

***Number on ART, disaggregated by sex;
*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
         (Slide 6 in Zim_ePMS Data Completeness.ppt);

if cald=2006.75 then do; o_s_allmale_onart_NAC = 28660; o_s_allfemale_onart_NAC = 31648; end;
if cald=2007.75 then do; o_s_allmale_onart_NAC = 37870; o_s_allfemale_onart_NAC = 62040; end;
if cald=2008.75 then do; o_s_allmale_onart_NAC = 54523; o_s_allfemale_onart_NAC = 94690; end;
if cald=2009.75 then do; o_s_allmale_onart_NAC = 83178; o_s_allfemale_onart_NAC = 138091; end;
if cald=2010.75 then do; o_s_allmale_onart_NAC = 133335; o_s_allfemale_onart_NAC = 229926; end;
if cald=2011.75 then do; o_s_allmale_onart_NAC = 180978; o_s_allfemale_onart_NAC = 303677; end;

if cald=2012.75 then do; o_s_allmale_onart_NAC = 211270; o_s_allfemale_onart_NAC = 354405; end;
if cald=2013.75 then do; o_s_allmale_onart_NAC = 248764; o_s_allfemale_onart_NAC = 416435; end;
if cald=2014.75 then do; o_s_allmale_onart_NAC = 291607; o_s_allfemale_onart_NAC = 496373; end;
if cald=2015.5  then do; o_s_allmale_onart_NAC = 319307; o_s_allfemale_onart_NAC = 534874; end;*Up to Sept 2015;




***Number on ART and proportion on ART out of those positive;
*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		 (Slide 13 in Zim_ePMS Data Completeness.ppt);
if 2015.75 then do;
	e_onart1519_nac=37719; 
	e_onart2024_nac=78988;
	e_onart25ov_nac=677884;
end;


***Proportion on 2nd line ART;
*Source: NAC "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		Senior Monitoring and Evaluation Officer, AIDS and TB National Programme, Zimbabwe, 23 November 2015
		(Slide 5&28 in Zim_ePMS Data Completeness.ppt);
if cald=2010.75 then o_p_2ndline_art_NAC=0.01;
if cald=2012.75 then o_p_2ndline_art_NAC=0.02;
if cald=2015.5  then o_p_2ndline_art_NAC=0.0265;*Sept 2015;

***At 12m since ART initiation;
if cald=2013.5  then o_p_2ndline_12mart_NAC=0.013;


***Number of adults on ART;
*Source: NATIONAL ART Q3 SUMMARY 2014-2;
IF cald=2014.75 then do;
	o_s_1524m_onart_zim =  33661; o_s_1524w_onart_zim =  71272;
	o_s_2549m_onart_zim = 166340; o_s_2549w_onart_zim = 307849;
	o_s_15plm_onart_zim = 250516; o_s_15plw_onart_zim = 442858;
	o_s_15pl_onart_zim = o_s_15plm_onart_zim + o_s_15plw_onart_zim;
end;

***Number of children, adolescents and adults receiving ART;
*Source Mutasa-Apollo draft paper "Proposal_v1_25 Nov_15", Page 2, June 2015;
if cald=2015.5 then do;
	o_s_0pl_onart_zim_Mutasa     = 842372; 
	o_s_0plw_onart_zim_Mutasa    = 522271;*She reported it was 0.62 of total;  
	o_s_0pl_on1stline_Zim_Mutasa = 825525;*She reported it was 0.98 of total; 
	o_s_0pl_subsline_Zim_Mutasa  = 16847;
end;


*** Proportion on ART of those eligible;
*Source: Global AIDS Response Progress Report 2015 for years 2004 (Page 14), 2007, 2009, 2012 2013 2014;

*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		 (Slide 7 in Zim_ePMS Data Completeness.ppt)
		 The data are available for all years and are the same as those indicated in the doc above

		Note: The denominator is ‘estimated number of adults and children in need of ART’ based on the criteria detailed in the 
		2013 ART Guidelines. The denominator is derived from the Zimbabwe 2014 National and Subnational HIV Estimates Report;
if cald=2004.75 then e_p_onart_cd4200=0.05;
if cald=2005.75 then e_p_onart_cd4200=0.117;
if cald=2006.75 then e_p_onart_cd4200=0.259;
if cald=2007.75 then e_p_onart_cd4200=0.418;*in the GARPR 0.31;
if cald=2008.75 then e_p_onart_cd4200=0.581;
if cald=2009.75 then e_p_onart_cd4200=0.775;*in the GARPR 0.62;
if cald=2010.75 then e_p_onart_cd4200=0.932;
if cald=2011.75 then e_p_onart_cd4350=0.664;
if cald=2012.75 then e_p_onart_cd4350=0.716;*in the GARPR 0.85;
if cald=2013.75 then e_p_onart_cd4350=0.793;*in the GARPR 0.769, Probably due to change in Spectrum estimates;
if cald=2014.75 then e_p_onart_cd4500=0.627;*0.634;*From Jan 2014 CD4 raised to 500;
if cald=2015.5 then  e_p_onart_cd4500=0.641;


***LBM Update Sep 2016
* Source: GARPCR 2016;
if cald=2007.75 then e_p_onart_cd4200=0.31;
if cald=2009.75 then e_p_onart_cd4200=0.62;
if cald=2012.75 then e_p_onart_cd4350=0.85;
* Source: GARPCR 2020;
if cald=2013.75 then e_p_onart_cd4350=0.77;
if cald=2014.75 then e_p_onart_cd4500=0.64;
if cald=2015.75 then e_p_onart_cd4500=0.72;
*I am not sure when the guidelines changed;
if cald=2016.75 then e_p_adults_onart=0.66;
if cald=2017.75 then e_p_adults_onart=0.84;
if cald=2018.75 then e_p_adults_onart=0.89;
if cald=2019.75 then e_p_adults_onart=0.856;


*** Number of adults eligible for ART;
*Source: Operational and Service Delivery Manual – June 2015, Page 5 (unclear to which year it refers to but between Nov 2013 and Dec 2014);
if cald=2014.5 then m_adults_elig_art_osdm=1207175;


***Proportion on ART of those PLHIV;
*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
     	 (Slide 8 in Zim_ePMS Data Completeness.ppt);
if cald=2004.75 then e_p_onart_15ovhivpos_nac=0.007;
if cald=2005.75 then e_p_onart_15ovhivpos_nac=0.017;
if cald=2006.75 then e_p_onart_15ovhivpos_nac=0.041;
if cald=2007.75 then e_p_onart_15ovhivpos_nac=0.071;
if cald=2008.75 then e_p_onart_15ovhivpos_nac=0.110;
if cald=2009.75 then e_p_onart_15ovhivpos_nac=0.164;
if cald=2010.75 then e_p_onart_15ovhivpos_nac=0.267;
if cald=2011.75 then e_p_onart_15ovhivpos_nac=0.349;
if cald=2012.75 then e_p_onart_15ovhivpos_nac=0.394;
if cald=2013.75 then e_p_onart_15ovhivpos_nac=0.455;
if cald=2014.75 then e_p_onart_15ovhivpos_nac=0.522;
if cald=2015.5  then e_p_onart_15ovhivpos_nac=0.548;

***Of HIV+ people who know their status, proportion on ART;
***LBM update Jan2017;
*Source: ZIMPHIA 2015-2016;
if cald=2016.25  then do;
	o_p_onart_1564_diag_zimphia=0.868;
	o_p_onart_1564m_diag_zimphia=0.860;
	o_p_onart_1564f_diag_zimphia=0.873;
	*Source: file:///C:/Users/ValentinaCambiano/Downloads/Progress_Toward_the_90_90_90_HIV_Targets_in.7.pdf;
	o_p_onart_1564_diag_zimphia=0.884; o_p_onart_1564_diag_ll_zimphia=0.871;o_p_onart_1564_diag_ul_zimphia=0.897;
	o_p_onart_1564m_diag_zimphia=0.88;o_p_onart_1564m_diag_ll_zimphia=0.855;o_p_onart_1564m_diag_ul_zimphia=0.905;
	o_p_onart_1564f_diag_zimphia=0.886;o_p_onart_1564f_diag_ll_zimphia=0.870;o_p_onart_1564f_diag_ul_zimphia=0.903;
end;	
* Source: Summary sheet December 2020 Zimbabwe population-based HIV impact assessment;
if cald=2020  then do;
	o_p_onart_15pl_diag_zimphia=0.97;
	o_p_onart_15plm_diag_zimphia=0.959;
	o_p_onart_15plf_diag_zimphia=0.976;
end;


***Proportion on ART out of those positive in different age groups and gender;
*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		 (Slides 13 and 14 in Zim_ePMS Data Completeness.ppt);
if 2015.5 then do;
	e_p_onart_1519hivpos_nac=0.633;
	e_p_onart_2024hivpos_nac=0.683;
	e_p_onart_1524hivpos_nac=0.666;
	e_p_onart_25ovhivpos_nac=0.532;
	e_p_onart_m15ovhivpos_nac=0.483;e_p_onart_f15ovhivpos_nac=0.578;
end;


*** Female-to-male new ART enrollee ratios in Zimbabwe;
*Source: Auld 2015 Lower levels of ART enrollment among men with HIV compared with women 2002-2013	from representative samples;
if cald=2009.5 then do; o_ratiofm_newart_mmwr=1.76; o_ratiofm_newart_ll_mmwr=1.53; o_ratiofm_newart_ul_mmwr=1.99; end;

*Source: Auld 2015 Lower levels of ART enrollment among men with HIV compared with women 2002-2013 UNAIDS estimates;
if cald=2009.5 then e_ratiofm_newart_unaids=1.43;


***Number of FSW on art (this is a minimum estimate);
*Source: Document “Sisters numbers v4”, Page 3;
if cald=2013.75 then o_s_fsw_onart_fc=4500;


*** Proportion on ART of FSW diagnosed;
*Source: RDS survey last quarter 2013: Document “Sisters numbers v4”, Page 6 and 7 (in 7 calculated as (21%/39% & 48%/69%);
if cald=2013.75 then do;
	o_p_onart_fswdiag_rds =0.677;
	o_p_onart_fsw1524diag_rds =0.54;
	o_p_onart_fswge25diag_rds =0.70;
end;
*Source: Global AIDS response country  progress report 2020, page 25;
if cald=2015.5 then o_p_onart_fswdiag_garpr =0.70;
if cald=2015.5 then o_p_onart_fswdiag_garpr =0.69;
if cald=2018.5 then o_p_onart_fswdiag_garpr =0.72;
if cald=2019.5 then o_p_onart_fswdiag_garpr =0.78;




**** Reasons for ART initiation in the following hierarchical order 
     (1. WHO3/4/TB, 2.CD4<=350, 3. B+ pregnant or breastfeeding, 4. CD4 351-500, 5. not known);

*Source: Lablite slides “ZIM_demoproj_v2” and the data are collected from August 2013, Slide 6, eg. denom=tot num females >15
         Banket: hospital (hub – ART since 2005), Mutorashanga & Nyabira (outreach site for Banket since 2010), 
		 Zowa (previously ART-naïve, ART initiation from 2014, only 21 init);

if cald=2014 then do;
	o_p_artinit_whotb_fbanket=0.51; o_p_artinit_cl350_fbanket=0.12; o_p_artinit_pregb_fbanket=0.32; o_p_artinit_c350500_fbanket=0.01;o_p_artinit_Unk_fbanket=0.03;
	o_p_artinit_whotb_mbanket=0.85; o_p_artinit_cl350_mbanket=0.04;	o_p_artinit_c350500_mbanket=0.01;o_p_artinit_Unk_mbanket=0.09;

	o_p_artinit_whotb_Mutoras=0.55; o_p_artinit_cl350_Mutoras=0.12; o_p_artinit_pregb_Mutoras=0.35; o_p_artinit_c350500_Mutoras=0.05;o_p_artinit_Unk_Mutoras=0.03;
	o_p_artinit_whotb_Nyabira=0.23; o_p_artinit_cl350_Nyabira=0.25; o_p_artinit_pregb_Nyabira=0.30; o_p_artinit_c350500_Nyabira=0.08;o_p_artinit_Unk_Nyabira=0.13;
end;




*******************************************************************************************
***************    11. Median CD4 at diagnosis and ART initiation     *******************
*******************************************************************************************

***START HERE;
*** At diagnosis;

* NO ZIM DATA;


*** At ART initiation
Source: Gender-related differences in outcomes and attrition on antiretroviral treatment among an HIV-infected patient 
cohort in Zimbabwe: 2007–2010, Takarinda KC 2014

Retrospective patient record review of 3919 HIV-infected patients aged  15 or more who initiated ART between 2007 and 2009 
in 40 randomly selected ART facilities countrywide;


if cald=2009 then do;
	o_medcd4_artinit_ov15m = 117;
	o_medcd4_artinit_ov15w = 143;
end;

***LBM Update Sep 2016;
*Source: Patient Retention, Clinical Outcomes and Attrition-Associated Factors of HIV-Infected Patients Enrolled in Zimbabwe's
		 National Antiretroviral Therapy Programme, 2007–2010, Mutasa-Apollo 2014;

if cald=2008 then do;
	o_medcd4_artinit=121;
	o_medcd4_artinit_m=104;
	o_medcd4_artinit_f=127;
end;

*Source: Antiretroviral Therapy Outcomes among Adolescents and Youth in Rural Zimbabwe, Bygrave 2012
*ART initiation between 2005-2008, n=898;

if cald=2006.75 then do;
	o_medcd4_artinit1518=102;
	o_medcd4_artinit_m1923=111;
	o_medcd4_artinit_f2430=111;
end;

*DART trial;
if cald=2008.5 then o_median_cd4art_DART=80;

*Source: Pre-treatment drug resistance among patients initiating antiretroviral therapy (ART) in Zimbabwe: 2008–2010, Mungati 2016
n=1610, new ART initiations from 2008-2010;
if cald=2009 then do;
	o_medcd4_artinit=168;
	o_medcd4_artinit_f=180;
	o_medcd4_artinit_m=136;
end;

*Source: Outcomes of antiretroviral treatment programs in rural Southern Africa, Wandeler 2012
 Zaka, Zimbabwe, n=1254;
if cald=2005 then o_medcd4_artinit=91;



*******************************************************************************************
*********************     12. Virological outcomes on 1st line     ************************
*******************************************************************************************
***LBM update Jan 2017;

***Proportion on ART and virologically suppressed;
* Source - Zimphia 2015-2016;
if cald=2016.25 then do;
	o_p_vlsupp_1564_Zimphia=0.865;
	o_p_vlsupp_1564m_Zimphia=0.841;
	o_p_vlsupp_1564w_Zimphia=0.879;
	*Source:file:///C:/Users/ValentinaCambiano/Downloads/Progress_Toward_the_90_90_90_HIV_Targets_in.7.pdf, accessed 22/12/2021;
	o_p_vlsupp_1564_Zimphia=0.853; o_p_vlsupp_1564_ll_Zimphia=0.834;wo_p_vlsupp_1564_Zimphia=0.871;
	o_p_vlsupp_1564m_Zimphia=0.825;o_p_vlsupp_1564m_ll_Zimphia=0.791;o_p_vlsupp_1564m_Zimphia=0.858;
	o_p_vlsupp_1564w_Zimphia=0.87; o_p_vlsupp_1564w_ll_Zimphia=0.851;o_p_vlsupp_1564w_Zimphia=0.888;

end;
* Source: Summary sheet December 2020 Zimbabwe population-based HIV impact assessment;
if cald=2020 then do;
	o_p_vlsupp_15pl_Zimphia=0.903;
	o_p_vlsupp_15plm_Zimphia=0.89;
	o_p_vlsupp_15plw_Zimphia=0.910;
end;



***Proportion of PLHIV and virologically suppressed;
* Source - Zimphia 2015-2016. Slide shown at CROI 2017 by Jessica Justman with updated Zimphia numbers;
if cald=2016.25 then do;
	o_p_vlsupp_hiv_1564_phia=0.591;
	o_p_vlsupp_hiv_1564m_phia=0.525;
	o_p_vlsupp_hiv_1564w_phia=0.635;
end;
* Source: Summary sheet December 2020 Zimbabwe population-based HIV impact assessment;
if cald=2020 then do;
	o_p_vlsupp_hiv_1549_phia=0.738; o_p_vlsupp_hiv_1549_ll_phia=0.714; o_p_vlsupp_hiv_1549_ul_phia=0.762;
	o_p_vlsupp_hiv_1549m_phia=0.681;o_p_vlsupp_hiv_1549m_ll_phia=0.636;o_p_vlsupp_hiv_1549m_ul_phia=0.727;
	o_p_vlsupp_hiv_1549w_phia=0.768;o_p_vlsupp_hiv_1549w_ll_phia=0.742;o_p_vlsupp_hiv_1549w_ul_phia=0.793;

	o_p_vlsupp_hiv_15pl_phia=0.773; o_p_vlsupp_hiv_15pl_ll_phia=0.753; o_p_vlsupp_hiv_15pl_ul_phia=0.792;
	o_p_vlsupp_hiv_15plm_phia=0.73; o_p_vlsupp_hiv_15plm_ll_phia=0.695;o_p_vlsupp_hiv_15plm_ul_phia=0.764;
	o_p_vlsupp_hiv_15plw_phia=0.798;o_p_vlsupp_hiv_15plw_ll_phia=0.777;o_p_vlsupp_hiv_15plw_ul_phia=0.819;
end;


*** % FSW virally suppressed (of those on ART);
*Source: RDS survey last quarter 2013 (& document “Sisters numbers v4”);
if cald=2013.75 then do;
	o_p_vlsupp_FSWonart =0.778;
	o_p_vlsupp_FSW1524onart_rds =0.62;
	o_p_vlsupp_FSWge25onart_rds =0.77;
end;

***Proportion of the population who received viral load monitoring in the public sector in Zimbabwe;
*Source: "Proposal_v1_25 Nov_15", Page 6;
if cald=2015.5 then o_p_accvl_art_mutasa=0.05; 

*** Proportion with treatment failure (clinical/immunological);

*Source: Renaud-Théry F, Duncombe C, Kerr S, Thierry S, Perriens J. Adult antiretroviral therapy in resource limited settings: a systematic review of first-line failure and attrition rates. WHO 2013 [cited 2014 Mar 26], 
		 Available from: URL: http://www.who.int/hiv/topics/treatment/First_Line_ART_failure_RLS_metanalysis.pdf;
*Rate of tretament failure, not specific to zim;
if cald=2010 then do; o_ratecifail_Renaud=0.264; o_ratecifail_ll_Renaud=0.173; o_ratecifail_ul_Renaud=0.356; end;


*** Proportion with treatment failure (based on viral load);

*Source: Report on the National HIV Drug Resistance Monitoring at Sentinel sites (2009–2011)” 2009-2011 (n=1000),
		 cited in 'Patient retention, clinical outcomes and attrition-associated factors of HIV-infected patients enrolled in
		 Zimbabwe's National Antiretroviral Therapy Programme, 2007-2010', Mutasa-Apollo 2014; 

*Treatment failure definition: VL>1000 at 12m;
if cald=2010.5 then o_p_vlab1000_12mart_HDRM=0.104;

*Source: Evolution of drug resistance during 48 weeks of zidovudine/lamivudine/tenofovir in the absence of real-time viral load
		 monitoring. Lyagoba et al, 2010. 300 patiens in DART

*Treatment failure definition: VL>1000 at 6m, 12m;
if cald=2004.5 then do;
	o_p_vlab1000_6mart_DART=0.15;
	o_p_vlab1000_12mart_DART=0.24; ***LBM Update Sep 2016 - this was previously 0.15, I think a typo;
end;


*** Proportion who switched to 2nd line;

*Source: Patient retention, clinical outcomes and attrition-associated factors of HIV-infected patients enrolled in
		 Zimbabwe's National Antiretroviral Therapy Programme, 2007-2010', Mutasa-Apollo 2014, Page 3; 

*Treatment failure definition: switch to 2nd line based on clinical or immunological monitoring;
if cald=2009 then o_p_switch2nd_17mart_Mutasa=0.104;


***Virological success
*% of public sector ART patients who are virally suppressed at a threshold of <1000 RNA copies/ml, 6 months after ART initiation
*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021
referencing https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf;
if cald=2018.5 then o_p_vll1000_6mart_garcpr=0.85;
if cald=2019.5 then o_p_vll1000_6mart_garcpr=0.82;
if cald=2020.5 then o_p_vll1000_6mart_garcpr=0.889;



***Virological rebound
***Virological failure
*Currently no data but check old observed file to see what % to look for;




*******************************************************************************************
*****************************     13. Retention on ART     ********************************
*******************************************************************************************

*** Proportion retained in care since ART initiation;

*At 12 months;

***LBM update Sep 2016;
*Source: Global AIDS response country progress report 2016;
if cald=2007.5 then     o_p_ret_12m_art_garcpr=0.931;
if cald=2009.5 then     o_p_ret_12m_art_garcpr=0.750;
if cald=2012.5 then do; o_p_ret_12m_art_garcpr=0.854; o_p_ret_24m_art_garcpr=0.79; end;
if cald=2013.5 then do; o_p_ret_12m_art_garcpr=0.871; o_p_ret_24m_art_garcpr=0.888; o_p_ret_60m_art_garcpr=0.736; end;
if cald=2014.5 then do; o_p_ret_12m_art_garcpr=0.897; o_p_ret_24m_art_garcpr=0.843; o_p_ret_60m_art_garcpr=0.776;end;
if cald=2015.5 then do; o_p_ret_12m_art_garcpr=0.855;end; *data for 24 and 60m not available;


*Source: NAC "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		(Slide 31 in Zim_ePMS Data Completeness.ppt);
*Proportion alive and on ART at 12m;
if cald=2014.5 then do;
	o_p_ret_12m_art_nac=0.892;
	o_p_retortransf_12m_art_nac=0.978;
end;

*Source: WHO HIV Drug Resistance Report 2012 (The survey in Zim was conducted in 2008) n=230, Page 66;
if cald=2008.5 then o_p_ret_12m_art_WHORes=0.952;*0.939 if exlucing 1.3% people who were transferred;


*At different time points;

*Source: Patient retention, clinical outcomes and attrition-associated factors of HIV-infected patients enrolled in
		 Zimbabwe's National Antiretroviral Therapy Programme, 2007-2010', Mutasa-Apollo 2014;
if cald=2009 then do;
	 o_p_ret_6m_art_mutasa=0.907; o_p_ret_6m_art_ll_mutasa=0.861; o_p_ret_6m_art_ul_mutasa=0.938;
	o_p_ret_12m_art_mutasa=0.781;o_p_ret_12m_art_ll_mutasa=0.697;o_p_ret_12m_art_ul_mutasa=0.847;
	o_p_ret_24m_art_mutasa=0.688;o_p_ret_24m_art_ll_mutasa=0.585;o_p_ret_24m_art_ul_mutasa=0.775;
	o_p_ret_36m_art_mutasa=0.644;o_p_ret_36m_art_ll_mutasa=0.557;o_p_ret_36m_art_ul_mutasa=0.723;
end;


*Source: Antiretroviral therapy outcomes among adolescents and youth in rural Zimbabwe, Bygrave 2012
         25 MSF PHC in rural districts among patients aged 10-30 years old - period 2005-08 (from graph);
if cald=2007 then do;
	 o_p_ret_6m_art_1924_msfb=0.875;
	o_p_ret_12m_art_1924_msfb=0.830;
	o_p_ret_24m_art_1924_msfb=0.750;
end;

*Source: Short and long term retention in antiretroviral care in health facilities in rural Malawi and Zimbabwe, Rasschaert 2012
         2 MSF ART programmes 2003-2008, one where people could be in care always in hospital (aho)  and the other where people 
		 were initiated in hospital and then transferred (hot), Figure 2;
if cald=2006 then do;
	 o_p_ret_6m_art_msfaho=0.98; o_p_ret_6m_art_msfhot=0.78;
	o_p_ret_12m_art_msfaho=0.97;o_p_ret_12m_art_msfhot=0.75;
	o_p_ret_24m_art_msfaho=0.94;o_p_ret_24m_art_msfhot=0.71;
	o_p_ret_30m_art_msfaho=0.92;o_p_ret_30m_art_msfhot=0.66;
end;

*Source: Outcomes of antiretroviral treatment programs in rural Southern Africa, Wandeler 2012
		 6 NGO ART programme, 2 in Zim, part of IEDEA cohort 2005-2010;
if cald=2008 then do;
	o_p_ret_12m_art_wand=0.831; o_p_ret_12m_art_ll_wand=0.817; o_p_ret_12m_art_ul_wand=0.845;
	o_p_ret_24m_art_wand=0.792; o_p_ret_24m_art_ll_wand=0.775; o_p_ret_24m_art_ul_wand=0.808;
	o_p_ret_36m_art_wand=0.751; o_p_ret_36m_art_ll_wand=0.728; o_p_ret_36m_art_ul_wand=0.773;
end;



*** Proportion dead at timepoints since ART initiation;

*Source: Patient retention, clinical outcomes and attrition-associated factors of HIV-infected patients enrolled in
		 Zimbabwe's National Antiretroviral Therapy Programme, 2007-2010', Mutasa-Apollo 2014, Page 5;
if cald=2009 then do;
	 o_p_dead_6m_art_mutasa=0.041; 
	o_p_dead_12m_art_mutasa=0.048;
	o_p_dead_24m_art_mutasa=0.067;
	o_p_dead_36m_art_mutasa=0.085;
end;


*Source: NAC "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		(Slide 31 in Zim_ePMS Data Completeness.ppt);

*Proportion dead at 12m out of all those initiated;
if cald=2014.5 then o_p_dead_12m_art_nac=0.007;


*At different time point (Of those on ART);

*Source: Short and long term retention in antiretroviral care in health facilities in rural Malawi and Zimbabwe, Rasschaert 2012;
if cald=2006 then do;
	 o_p_dead_6m_art_msfaho=0.09; o_p_dead_6m_art_msfhot=0.01;
	o_p_dead_12m_art_msfaho=0.11;o_p_dead_12m_art_msfhot=0.025;
	o_p_dead_24m_art_msfaho=0.12;o_p_dead_24m_art_msfhot=0.04;
	o_p_dead_30m_art_msfaho=0.14;o_p_dead_30m_art_msfhot=0.045;
end;


*Source: Outcomes of antiretroviral treatment programs in rural Southern Africa, Wandeler 2012, Figure 1;
if cald=2008 then do;
	o_p_dead_12m_art_wand=0.064; o_p_dead_12m_art_ll_wand=0.055; o_p_dead_12m_art_ul_wand=0.074;
	o_p_dead_24m_art_wand=0.074; o_p_dead_24m_art_ll_wand=0.064; o_p_dead_24m_art_ul_wand=0.085;
	o_p_dead_36m_art_wand=0.090; o_p_dead_36m_art_ll_wand=0.076; o_p_dead_36m_art_ul_wand=0.105;
end;

*Source: WHO HIV Drug Resistance Report 2012 (The survey in Zim was conducted in 2008) n=230, Page 66;
if cald=2008.5 then o_p_dead_12m_art_WHORes=0.03;

*** Death rate after ART initiation;
*Source: Antiretroviral therapy outcomes among adolescents and youth in rural Zimbabwe, Bygrave 2012, Page 3;
if cald=2007 then do; o_deathrate_art_2430_msfb=0.077; o_deathrate_art_2430_ll_msfb=0.058; o_deathrate_art_2430_ul_msfb=0.104; end;


*** Proportion lost at x months since ART initiation;
*Source: Patient retention, clinical outcomes and attrition-associated factors of HIV-infected patients enrolled in
		 Zimbabwe's National Antiretroviral Therapy Programme, 2007-2010', Mutasa-Apollo 2014, Page 5;

*Definition of lost to follow-up is >90 days late for a scheduled visit with the healthcare provider or pharamcy;
if cald=2009 then do;
	 o_p_lost_6m_art_mutasa=0.049; 
	o_p_lost_12m_art_mutasa=0.161;
	o_p_lost_24m_art_mutasa=0.235;
	o_p_lost_36m_art_mutasa=0.252;
end;


*Source: NAC "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		(Slide 31 in Zim_ePMS Data Completeness.ppt);

*Proportion lost at 12m out of all those initiated;
if cald=2014.5 then o_p_lost_12m_art_nac=0.014;


*At different time points (Of those on ART);

*Source: Short and long term retention in antiretroviral care in health facilities in rural Malawi and Zimbabwe, Rasschaert 2012, Figure 4;
*Definition of lost to follow-up is >=90 days late for a scheduled visit with the healthcare provider or pharamcy;
if cald=2006 then do;
	 o_p_lost_6m_art_msfaho=0.135; o_p_lost_6m_art_msfhot=0.01;
	o_p_lost_12m_art_msfaho=0.18;  o_p_lost_12m_art_msfhot=0.02;
	o_p_lost_24m_art_msfaho=0.23;  o_p_lost_24m_art_msfhot=0.03;
	o_p_lost_30m_art_msfaho=0.24;  o_p_lost_30m_art_msfhot=0.04;
end;

*Source: Outcomes of antiretroviral treatment programs in rural Southern Africa, Wandeler 2012, Page 10;
if cald=2008 then do;
	o_p_lost_12m_art_wand=0.106; o_p_lost_12m_art_ll_wand=0.094; o_p_lost_12m_art_ul_wand=0.118;
	o_p_lost_24m_art_wand=0.134; o_p_lost_24m_art_ll_wand=0.120; o_p_lost_24m_art_ul_wand=0.149;
	o_p_lost_36m_art_wand=0.157; o_p_lost_36m_art_ll_wand=0.139; o_p_lost_36m_art_ul_wand=0.176;
end;

*Source: WHO HIV Drug Resistance Report 2012 (The survey in Zim was conducted in 2008) n=230, Page 66;
if cald=2008.5 then o_p_lost_12m_art_WHORes=0.017;


*** Rate of loss to follow-up after ART initiation;

*Source: Antiretroviral therapy outcomes among adolescents and youth in rural Zimbabwe, Bygrave 2012, Page 3;
*Definition of lost to follow-up is >90 days late since end of last prescription;
if cald=2007 then do; o_ratelfu_art_1924_msfb=0.168; o_ratelfu_art_1924_ll_msfb=0.116; o_ratelfu_art_1924_ul_msfb=0.243; end;






*******************************************************************************************
*********************************     14. Resistance     ***********************************
*******************************************************************************************
***TDR;

*** Proportion of new infections with TDR;

*Source: Surveillance of transmitted antiretroviral drug resistance among HIV-1 infected women attending antenatal clinics
		 in Chitungwiza, Zimbabwe. Tshabalala et al, 2011
		 471 <25 yrs old ART naive HIV positive pregant women, 2006-07;
 
if cald=2007 then o_p_newinf_tdr_1524wanc=0.0042; ***LBM update - was previously 0.042 but 2/471=0.0042;

*** Resistance at ART initiation, indicated among those with no previous exposure;

*Source: WHO HIV Drug Resistance Report 2012 (The survey in Zim was conducted in 2008) n=230, Page 64
* Where more than one row per year is reported (multiple clinics), the median per year is taken and lower/upper WHO limits are the min/max %s reported;
* Error limits are a 50% relative increase and decrease, ;

if cald=2008.5 then do; o_p_res_artstart_WHOres=0.0021;*1 clinic;
						o_p_res_artstart_ll_=0.010; o_p_res_artstart_ul_=0.0314;end;
if cald=2009.5 then do; o_p_res_artstart_WHOres=0.037; o_p_res_artstart_lc_WHOres=0.034; o_p_res_artstart_uc_WHOres=0.075;*3 clinics;
						o_p_res_artstart_ll_=0.018; o_p_res_artstart_ul_=0.055;end;
if cald=2010.5 then do; o_p_res_artstart_WHOres=0.061; o_p_res_artstart_lc_WHOres=0.029; o_p_res_artstart_uc_WHOres=0.222;*8 clinics;
						o_p_res_artstart_ll_=0.030; o_p_res_artstart_ul_=0.091;end;


***LBM Update Sep 2016;
*Source: Pre-treatment drug resistance among patients initiating antiretroviral therapy (ART) in Zimbabwe: 2008–2010, Mungati 2016
n=1610, new ART initiations from 2008-2010;
if cald=2009 then o_p_res_artstart=0.0063;


*** Proportion of virological failure resistance;

*Source: WHO HIV Drug Resistance Report 2012 (The survey in Zim was conducted in 2008) n=230;
if cald=2009.5 then o_p_res_vlfail_WHORes=0.8;
 
*Treatment failure definition: VL>1000 at 6m, 12m;
*Source: Evolution of drug resistance during 48 weeks of zidovudine/lamivudine/tenofovir in the absence of real-time viral load 
 monitoring, Lyagoba et al 2010. 300 patiens in DART;

if cald=2004.5 then do;
	o_p_res_vlfail6m_DART=0.58;
	o_p_res_vlfail12m_DART=0.58;
end;

***LBM Update Sep 2016;

*** Specific mutations;
*Source: WHO HIV Drug Resistance Report 2012 (The survey in Zim was conducted in 2008) n=230;
if cald=2008 then do;
	o_p_m184v_resvfail_1y_WHORes=0.733;
	o_p_k65r_resvfail_1y_WHORes=0.067;

	o_p_d67n_resvfail_1y_WHORes=0.200;
	o_p_k70r_resvfail_1y_WHORes=0.267;
	o_p_t215_resvfail_1y_WHORes=0.067;
	o_p_k219_resvfail_1y_WHORes=0.067;
	o_p_ab2tam_resvfail_1y_WHORes=0.333;
	o_p_nnrti_resvfail_1y_WHORes=0.60;

end;





*******************************************************************************************
*****************************     15. Male circumcision     ********************************
*******************************************************************************************

*** Prevalence;
*Source: "Zimbabwe data.xls" sent by David Wilson;
if cald=2006 then do; o_p_mcirc_1524m_dw = 0.09; o_p_mcirc_2549m_dw = 0.11; o_p_mcirc_50plm_dw = 0.11; end;
if cald=2011 then do; o_p_mcirc_1524m_dw = 0.07; o_p_mcirc_2549m_dw = 0.11; o_p_mcirc_50plm_dw = 0.11; end;
if cald=2014 then do; o_p_mcirc_1524m_dw = 0.24; o_p_mcirc_2549m_dw = 0.11; o_p_mcirc_50plm_dw = 0.11; end;


*** New male circumcisions per year;
*Source: WHO. Progress in scaling up voluntary medical male circumcision for HIV prevention in East and Southern Africa: January-December 2011. WHO 2011 September [cited 2014 Mar 15] 
		      Available from: URL: http://www.malecircumcision.org/country_updates/documents/FINAL%20VMMC%20Progress%20Report%20Jan-Dec%202011%20WHO.pdf;

*(LBM: These reports go up to 2012 but same figures are reported in GARPR reports);
if cald = 2008.5 then o_s_new_mcirc=0;
if cald = 2009.5 then o_s_new_mcirc=2801;
if cald = 2010.5 then o_s_new_mcirc=11176;
if cald = 2011.5 then o_s_new_mcirc=36603;

***LBM Update Sep 2016;
*Source: Global AIDS Response Country Progress Report Zimbabwe 2016. Page 8 Table 3
		 Numbers calcuated by adding up >15 year olds;

*Updated using HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021,
they are reported as 2008-2009, 2009-2010, age range 10-49;
if cald = 2009.5  then o_s_new_mcirc=2784 ;
if cald = 2010.5  then o_s_new_mcirc=9381;*9384;  *slightly updated based on Isaac;
if cald = 2011.5  then o_s_new_mcirc=27973;*27971;*slightly updated based on Isaac;
if cald = 2012.5  then o_s_new_mcirc=29321;*29625;*slightly updated based on Isaac;
if cald = 2013.5  then o_s_new_mcirc=65679;*65613;*slightly updated based on Isaac;

*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021,;
if cald = 2014.5  then o_s_new_mcirc=110163;
if cald = 2015.5  then o_s_new_mcirc=133012;
if cald = 2016.5  then o_s_new_mcirc=136986;
if cald = 2017.5  then o_s_new_mcirc=159476;
if cald = 2018.5  then o_s_new_mcirc=197705;
if cald = 2019.5  then o_s_new_mcirc=207375;
if cald = 2020.5  then o_s_new_mcirc=53743;

*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021); 
*page 22;
*Note: the age range is not indicated so probably all ages;
if cald = 2013.5  then o_s_new_mcirc_all=112084;
if cald = 2014.5  then o_s_new_mcirc_all=209125;
if cald = 2015.5  then o_s_new_mcirc_all=188732;
if cald = 2016.5  then o_s_new_mcirc_all=205784;
if cald = 2017.5  then o_s_new_mcirc_all=301366;
if cald = 2018.5  then o_s_new_mcirc_all=326012;
if cald = 2019.5  then o_s_new_mcirc_all=354819;





*** Cumulative number of males circumcised according to national standards;
*Source: "GLOBAL AIDS RESPONSE PROGRESS REPORT 2020"
https://www.unaids.org/sites/default/files/country/documents/ZWE_2020_countryreport.pdf (accessed 05/03/2021); 
*page 10;
if cald = 2013.5  then o_cum_mcirc=112084; 
if cald = 2014.5  then o_cum_mcirc=400235;
if cald = 2015.5  then o_cum_mcirc=601303;
if cald = 2016.5  then o_cum_mcirc=839681;
if cald = 2017.5  then o_cum_mcirc=1141046;
if cald = 2018.5  then o_cum_mcirc=1466731;
if cald = 2019.5  then o_cum_mcirc=1821550;

*Reply from Tsitsi on 5th July 2016: Circumcisions are performed both in the health facilities (mainly) and also by some NGOs such as PSI;

***Number of <15 year olds circumcised;
*Source: Global AIDS Response Country Progress Report Zimbabwe 2016. Page 8 Table 3;
if cald = 2009.5  then o_s_child1314_mcirc=17;
if cald = 2010.5 then o_s_child1314_mcirc=1792;
if cald = 2011.5  then o_s_child1314_mcirc=8771 ;
if cald = 2012.5 then o_s_child1314_mcirc=11087;
if cald = 2013.5  then o_s_child1314_mcirc=46471 ;
if cald = 2014.5 then o_s_child1314_mcirc=97687;
if cald = 2015.5  then o_s_child1014_mcirc=78623;

 
***LBM Update feb 2017;
***Proportion of males circumcised;
*Source:	DHS 2010/2011 (Page 202), DHS 2015 (page 262);
if cald=2011 then do;
	o_circ_1519m=0.053;
	o_circ_2024m=0.081;
	o_circ_2529m=0.106;
	o_circ_3039m=0.112;
	o_circ_4049m=0.115;
end;

if cald=2015.75 then do;
	o_circ_1519m=0.226;
	o_circ_2024m=0.128;
	o_circ_2529m=0.100;
	o_circ_3039m=0.116;
	o_circ_4049m=0.104;
end;

***Proportion of men aged 15+ who report that they have been circumcised (household surveys) - MIHPSA optional;
*Source: HIVcalibrationData_Zimbabwe.xls sent by Isaac Taramusi in Sept 2021;
if cald=2006   then o_p_circ_15pl_DHIS2_z=0.105;
if cald=2010.5 then o_p_circ_15pl_DHIS2_z=0.091;
if cald=2016   then o_p_circ_15pl_DHIS2_z=0.143;




*******************************************************************************************
*******************************     16. PreP     **********************************
*******************************************************************************************
*Source: https://www.prepwatch.org/country/zimbabwe/, accessed 08/07/2022, updated aRpil 2022;
*Estimated Cumulative Number of People Initiating PrEP:
 	Aggregates numbers reported from:
		- demonstration projects, 
		- PEPFAR dashboard 
		- program/country reports where available. 
This is presented as a range due to difficulty in tracking precise numbers and possible double reporting, I used the midlle number in the range;
if cald=2022.25   then o_n_prep_ever=72500;




*******************************************************************************************
********************     17. Sexually transmitted infections     ********************
*******************************************************************************************

*Source: RDS surveys last quarter 2013;
if cald=2013.75 then do; o_p_ever_sti_fsw_rds=0.374; o_p_ever_sti_fsw_ll_rds=0.173; o_p_ever_sti_fsw_ul_rds=0.591; end;




*******************************************************************************************
*******************************     18. Tubercolosis     **********************************
*******************************************************************************************

*Source: "Program Monitoring for an AIDS-Free Generation in Zimbabwe" by Brilliant Nkomo
		 (Slide 18 in Zim_ePMS Data Completeness.ppt)
          Note: Data from 213 ePMS sites (86.6%), Adds Presumptive TB Cases to those on TB treatment, Only captures those in HIV care;
if cald=2015.5 then o_p_tb_hivposcare_nac=0.046;



*Zimbabwe gross national index per capita of $860 
(Source: World Bnank 2015 cited by Page 1 of "Proposal_v1_25 Nov_15");

