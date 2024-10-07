*COTE d'IVOIRE observed data;

***********************
POPULATION
***********************;
*Source:  https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=CI&view=chart
		  Use exact figures for 15-64 population as given
	    -->~41% of the population are under 15 in 2022. Multiply World Population numbers by given % for each year;

*https://population.un.org/dataportal/data/indicators/70/locations/384/start/1990/end/2023/line/linetimeplot?df=fedb2c36-7339-4cea-982e-6339bd045666;	
if cald=1990 then do;o_pop1564=6.0;o_pop1564m=3.1;o_pop1564w=2.9;o_pop15plus=11.9*0.53;end;
if cald=1995 then do;o_pop1564=7.4;o_pop1564m=3.8;o_pop1564w=3.6;o_pop15plus=14.3*0.55;end;
if cald=2000 then do;o_pop1564=8.8;o_pop1564m=4.4;o_pop1564w=4.4;o_pop15plus=16.8*0.55;end;
if cald=2005 then do;o_pop1564=9.9;o_pop1564m=5.0;o_pop1564w=4.9;o_pop15plus=19.0*0.55;end;
if cald=2010 then do;o_pop1564=11.3;o_pop1564m=5.7;o_pop1564w=5.6;o_pop15plus=21.1*0.56;end;
if cald=2015 then do;o_pop1564=12.7;o_pop1564m=6.5;o_pop1564w=6.3;o_pop15plus=23.6*0.56;end;
if cald=2020 then do;o_pop1564=14.9;o_pop1564m=7.5;o_pop1564w=7.3;o_pop15plus=26.8*0.58;end;

***For future population projections, use https://worldpopulationreview.com/countries/ivory-coast-population;
if cald=2024 then do;o_pop15plus=29.6*0.58;end;*58% comes from 2020 estimates above;
if cald=2030 then do;o_pop15plus=34.2*0.58;end;
if cald=2040 then do;o_pop15plus=42.6*0.58;end;
if cald=2050 then do;o_pop15plus=51.4*0.58;end;
if cald=2060 then do;o_pop15plus=60.3*0.58;end;
if cald=2070 then do;o_pop15plus=68.9*0.58;end;

o_pop1564=o_pop1564*1000000;o_pop1564m=o_pop1564m*1000000;o_pop1564w=o_pop1564w*1000000;o_pop15plus=o_pop15plus*1000000;

*Calibrated to World Population prospectus;


***********************
*PLHIV
***********************;
* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire;
if cald=1990 then o_plhiv_UNAIDS=350000;
if cald=1995 then o_plhiv_UNAIDS=670000;
if cald=2000 then o_plhiv_UNAIDS=740000;
if cald=2005 then o_plhiv_UNAIDS=620000;
if cald=2010 then o_plhiv_UNAIDS=520000;
if cald=2015 then o_plhiv_UNAIDS=460000;
if cald=2020 then o_plhiv_UNAIDS=420000;
if cald=2022 then o_plhiv_UNAIDS=390000; 
if cald=2023 then o_plhiv_UNAIDS=386614;*MoH Donnees SPectrum 2023; 

***********************
*SEXUAL BEHAVIOUR;
***********************;
*% of people with condomless partners at last sex;
*Source: PHIA 2017 Table 14B (% of men who reported using a condom at last sex in last year);
if cald=2018 then do;
	o_p_cls_m_PHIA1564=0.507;
	o_p_cls_w_PHIA1564=0.631;
end;	

*Source DHS 2021 Table 13.4.2 (Using Optima notes in Teams spreadsheet);
if cald=2021 then do;
	o_p_cls_m_DHS1549=0.525;
	o_p_cls_w_DHS1549=0.764;
end;	

***********************
*HIV PREVALENCE
***********************;
***DHS are all in French!

*Source: PHIA https://www.cdc.gov/globalhivtb/what-we-do/phia/cote-divoire-phia-summary-sheet-2020.pdf;
if cald=2018 then do; 
	o_prev1549_phia = 0.025;o_prev1549m_phia = 0.014;o_prev1549w_phia = 0.036;
	o_prev1564_phia = 0.029;o_prev1564m_phia = 0.017;o_prev1564w_phia = 0.041;

	o_prev1519m_phia = 0.004;o_prev1519w_phia = 0.006;
	o_prev2024m_phia = 0.002;o_prev2024w_phia = 0.013;
	o_prev2529m_phia = 0.002;o_prev2529w_phia = 0.032;
	o_prev3034m_phia = 0.025;o_prev3034w_phia = 0.034;
	o_prev3539m_phia = 0.023;o_prev3539w_phia = 0.075;
	o_prev4044m_phia = 0.035;o_prev4044w_phia = 0.087;
	o_prev4549m_phia = 0.032;o_prev4549w_phia = 0.074;
end;

* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire;
if cald=2022 then do;
	o_prev1549_UNAIDS=0.018; o_prev1549m_UNAIDS=0.011; o_prev1549w_UNAIDS=0.026;
end;

***DHS data;
* Source: https://dhsprogram.com/pubs/pdf/HF14/CotedIvoire_HIV_factsheet_eng.pdf (table 13.5 and 13.7 in DHS);
if cald=2005 then do;
		o_prev1549_dhs=0.047; o_prev1549m_dhs=0.029; o_prev1549w_dhs=0.064;
		o_prev1519_dhs=0.003; o_prev1519m_dhs=0.002; o_prev1519w_dhs=0.004;
		o_prev2024_dhs=0.025; o_prev2024m_dhs=0.003; o_prev2024w_dhs=0.045;
end;

* Source: https://dhsprogram.com/pubs/pdf/FR272/FR272.pdf (table 14.3 in DHS);
if cald=2012 then do;
		o_prev1549_dhs=0.037; o_prev1549m_dhs=0.027; o_prev1549w_dhs=0.046;
		o_prev1519_dhs=0.005; o_prev1519m_dhs=0.001; o_prev1519w_dhs=0.008;
		o_prev2024_dhs=0.022; o_prev2024m_dhs=0.005; o_prev2024w_dhs=0.036;
		o_prev2529_dhs=0.037; o_prev2529m_dhs=0.013; o_prev2529w_dhs=0.056;
		o_prev3034_dhs=0.047; o_prev3034m_dhs=0.026; o_prev3034w_dhs=0.068;
		o_prev3539_dhs=0.051; o_prev3539m_dhs=0.049; o_prev3539w_dhs=0.054;
		o_prev4044_dhs=0.075; o_prev4044m_dhs=0.077; o_prev4044w_dhs=0.073;
		o_prev4549_dhs=0.078; o_prev4549m_dhs=0.079; o_prev4549w_dhs=0.077;
end;



* Source: Seroprevalence of HIV infection in the general population of the Côte d'Ivoire, West Africa
		  Benoit, 1990, JAIDS;
if cald=1989 then do;
	o_prev_m_urb_Benoit=0.09;o_prev_w_urb_Benoit=0.06;
	o_prev_m_rur_Benoit=0.064;o_prev_w_rur_Benoit=0.036;
end;

***********************
*HIV INCIDENCE
***********************;
*Source: PHIA https://www.cdc.gov/globalhivtb/what-we-do/phia/cote-divoire-phia-summary-sheet-2020.pdf;
if cald=2018 then do; 
	o_Incid1549_phia = 0.03;o_Incid1549m_phia = 0.03;o_Incid1549w_phia = 0.03;
end;

* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire;
if cald=2022 then do;
	o_Incid1549_UNAIDS=0.045; 
end;

***********************
*NEW INFECTIONS;
***********************;

* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026) Page 89 Table 10;;
if cald=2021 then do;
	o_newinf_m_UNAIDS=1611;	o_newinf_w_UNAIDS=2513;
end;

if cald=2022 then do;
	o_newinf_m_UNAIDS=3094;	o_newinf_w_UNAIDS=4825;
end;
	
* Source: MoH Donnees Spectrum 2023 ;
if cald=2023 then do;
	o_newinf_UNAIDS=7340; o_newinf_m_UNAIDS=2513; o_newinf_w_UNAIDS=4827;
end;



***********************
*HIV TESTING
***********************;
*Source: PHIA Full report Table 7.A;
if cald=2018 then do;
	o_evertested_m_PHIA=0.31;	o_evertested_w_PHIA=0.53;
end;

***********************
*NUMBER OF HIV TESTS
***********************;
*Source: John Stover, data used in Shiny 90 for UNAIDS estimates;
if cald=2010 then o_n_tests_JS=1032084;
if cald=2011 then o_n_tests_JS=863137;
if cald=2012 then o_n_tests_JS=1588431;
if cald=2013 then o_n_tests_JS=1952542;
if cald=2014 then o_n_tests_JS=1685281;
if cald=2015 then o_n_tests_JS=2094382;
if cald=2016 then o_n_tests_JS=2380506;
if cald=2017 then o_n_tests_JS=2445133;
if cald=2018 then o_n_tests_JS=2712569;
if cald=2019 then o_n_tests_JS=2807089;
if cald=2020 then o_n_tests_JS=2073676;
if cald=2021 then o_n_tests_JS=2415909;
if cald=2022 then o_n_tests_JS=2572224;

***********************
*CIRCUMCISION;
***********************;
*Source: PHIA https://www.cdc.gov/globalhivtb/what-we-do/phia/cote-divoire-phia-summary-sheet-2020.pdf;
if cald=2018 then do; 
	o_trad_circ1549_phia = 0.509; o_vmmc1549_phia = 0.283; o_circ1549_phia = 0.792;
end;

*Source: DHS 2005 table 13.10, DHS 2015 table, DHS 2021 table 13.10 ;

if cald=2005 then o_circ1549_dhs=0.96;
if cald=2016 then o_circ1549_dhs=0.967;
if cald=2021 then o_circ1549_dhs=0.97;

***********************
*CARE CASCADE;
***********************;
*Source: PHIA https://www.cdc.gov/globalhivtb/what-we-do/phia/cote-divoire-phia-summary-sheet-2020.pdf;
if cald=2018 then do; 
	o_diag1564_phia = 0.498; o_diag1564m_phia = 0.404; o_diag1564w_phia = 0.540; 
	o_diag_onart1564_phia = 0.920; o_diag_onart1564m_phia = 0.850; o_diag_onart1564w_phia = 0.944; 
	o_art_vs1564_phia = 0.737; o_art_vs1564m_phia = 0.628; o_art_vs1564w_phia = 0.769; 
end;

* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire;
if cald=2022 then do;
	o_diag1564_UNAIDS = 0.82; 
	o_n_plhiv15plus_UNAIDS=390000;
	o_onart15plus_UNAIDS = 0.73; o_onart15plus_m_UNAIDS = 0.61;o_onart15plus_w_UNAIDS = 0.79;  *of PLHIV (NOT of those diag);
	o_vs1564_UNAIDS = 0.62; 	*of PLHIV (NOT of those on ART);
end;

* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026) Page 102 Table 10;
***Diag;
if cald=2022 then do; o_diag_NSPm=0.74; o_diag_NSPw=0.85;end;

***Diag on ART;
if cald=2021 then o_p_onartdiag_nsp=0.96;
if cald=2022 then o_p_onartdiag_nsp=0.87;

***********************
*NUMBER ON ART;
***********************;
if cald=2022 then do;
	o_n_onart_m_UNAIDS=77428;
	o_n_onart_w_UNAIDS=205939;
end;

* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026);
if cald=2019 then o_n_onart_UNAIDS=257805;
if cald=2020 then o_n_onart_UNAIDS=270515;
if cald=2021 then o_n_onart_UNAIDS=279404;
if cald=2022 then o_n_onart_UNAIDS=283367;

*Proportion on DTG;
* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026) Page 35 Table 10;
if cald=2021 then o_p_dtg_nsp=0.829;
if cald=2022 then o_p_dtg_nsp=0.91;

*Proportion on ART of PLHIV;
* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026) Page 35 Table 10;;
if cald=2019 then o_p_onart_nsp=0.65;
if cald=2020 then o_p_onart_nsp=0.68;
if cald=2021 then o_p_onart_nsp=0.78;
if cald=2022 then o_p_onart_nsp=0.79;

***********************
*PREP;
***********************;

*Number who ever started PrEP;
* Source: Donnees Prevention PEPFAR 2023_Modelisation_PrEP;
if cald=2023 then do;
	o_prepstart_pepfar=14264;o_prepstart_pepfar_m=5959; o_prepstart_pepfar_w=8305;
end;


***********************
*AIDS deaths
***********************;
* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire;
if cald=2022 then do;
	o_AIDSdeaths_UNAIDS=8900; o_AIDSdeaths_ll_UNAIDS=6900; o_AIDSdeaths_ul_UNAIDS=12000;
end;

if cald=1990 then o_AIDSdeaths_UNAIDS=15000;
if cald=1995 then o_AIDSdeaths_UNAIDS=36000;
if cald=2000 then o_AIDSdeaths_UNAIDS=62000;
if cald=2005 then o_AIDSdeaths_UNAIDS=58000;
if cald=2010 then o_AIDSdeaths_UNAIDS=34000;
if cald=2015 then o_AIDSdeaths_UNAIDS=22000;
if cald=2020 then o_AIDSdeaths_UNAIDS=11000;

if cald=2022 then o_AIDSdeaths_UNAIDS=9952;*NSP;

* Source: MoH Donnees Spectrum 2023 ;
if cald=2023 then o_AIDSdeaths_UNAIDS=8875;

***********************
*PrEP
***********************;
* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire;
if cald=2022 then o_prep_UNAIDS=15773;

***********************
*PREGNANT WOMEN;
***********************;

*Number pregnant;
* Source: MoH Donnees Spectrum 2023 ;
if cald=2021 then o_preg_unaids=15207;
if cald=2022 then o_preg_unaids=14094;
if cald=2023 then o_preg_unaids=15077;

*Proportion seen in ANC;
* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026);
if cald=2023 then o_p_anc_nsp=0.35;*In first trimester;

*Positivity rate amongst pregnant women;
* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026);
if cald=2014 then preg_hiv_UNAIDS=0.02;
if cald=2015 then preg_hiv_UNAIDS=0.016;
if cald=2016 then preg_hiv_UNAIDS=0.012;
if cald=2017 then preg_hiv_UNAIDS=0.001;
if cald=2018 then preg_hiv_UNAIDS=0.009;
if cald=2019 then preg_hiv_UNAIDS=0.007;
if cald=2020 then preg_hiv_UNAIDS=0.006;
if cald=2021 then preg_hiv_UNAIDS=0.0053;
if cald=2022 then preg_hiv_UNAIDS=0.0047;

*MTCT;
* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026) via SPECTRUM;

if cald=2017 then o_p_mtct_nsp=0.1423;
if cald=2023 then o_p_mtct_nsp=0.1087;

***********************
*FSW
***********************;

*Population (just under 1%);
* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire - 66,600;
* Source: https://www.populationpyramid.net/c%C3%B4te-divoire/2022/ for 15-49 female population in 2022
		  24.5% of total population of 28,000,000 =6,860,000 females aged 15-49
		  66,600/6,860,000=	0.97%;

* FSW Prevalence;

if cald=2022 then do;
	o_pop_fsw_UNAIDS=66600;o_p_fsw_UNAIDS=0.0097; 
	o_prev_fsw_UNAIDS=0.048;
end;

* Source: Rapid Spread of HIV Infections in Abidjan, Ivory Coast, 1987-1990, Koffi 1992, Eur J Clin Microbiol Infect Dis; 
if cald=1986 then o_prev_fsw_abid_kof=0.376;
if cald=1987 then o_prev_fsw_abid_kof=0.397;
if cald=1989 then o_prev_fsw_abid_kof=0.483;
if cald=1990 then o_prev_fsw_abid_kof=0.694;

* Condom use at last sex;
* Source: Increase in condom use and decline in HIV and sexually transmitted diseases among female sex workers in Abidjan, 
		  Côte d'Ivoire, 1991–1998, Ghys, AIDS 2002; 
*(condom use source is from the report below);
if cald=1992 then do; o_prev_fsw_abid_ghys=0.89;o_condom_lastsex=0.20;end;
if cald=1993 then do; o_prev_fsw_abid_ghys=0.79;o_condom_lastsex=0.22;end;
if cald=1994 then do; o_prev_fsw_abid_ghys=0.68;o_condom_lastsex=0.40;end;
if cald=1995 then do; o_prev_fsw_abid_ghys=0.53;o_condom_lastsex=0.45;end;
if cald=1996 then do; o_prev_fsw_abid_ghys=0.52;o_condom_lastsex=0.59;end;
if cald=1997 then do; o_prev_fsw_abid_ghys=0.52;o_condom_lastsex=0.80;end;
if cald=1998 then do; o_prev_fsw_abid_ghys=0.32;o_condom_lastsex=0.85;end;

* Source: Innovative Positive Outcomes of Associations Fight against HIV/ Trust Area Sexual health-oriented services 
 Innovative measures of associations Fight against HIV/AIDS in West Africa, 2013, Page 15;
if cald=1999 then do; o_prev_fsw_abid_ghys=0.32; o_condom_lastsex=0.85;end;
if cald=2000 then do; o_prev_fsw_abid_ghys=0.28; o_condom_lastsex=0.84;end;
if cald=2001 then do; o_prev_fsw_abid_ghys=0.29; o_condom_lastsex=0.85;end;
if cald=2002 then do; o_prev_fsw_abid_ghys=0.28; o_condom_lastsex=0.85;end;
if cald=2003 then do; o_prev_fsw_abid_ghys=0.31; o_condom_lastsex=0.85;end;
if cald=2004 then do; o_prev_fsw_abid_ghys=0.28; o_condom_lastsex=0.85;end;
if cald=2005 then do; o_prev_fsw_abid_ghys=0.18; o_condom_lastsex=0.90;end;
if cald=2006 then do; o_prev_fsw_abid_ghys=0.19; o_condom_lastsex=0.90;end;
if cald=2007 then do; o_prev_fsw_abid_ghys=0.20; o_condom_lastsex=0.90;end;
if cald=2008 then do; o_prev_fsw_abid_ghys=0.19; o_condom_lastsex=0.90;end;
if cald=2009 then do; o_prev_fsw_abid_ghys=0.19; o_condom_lastsex=0.90;end;
if cald=2010 then do; o_prev_fsw_abid_ghys=0.20; o_condom_lastsex=0.90;end;

* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026) Page 94;
if cald=2021 then o_condom_lastsex_nsp=0.92;
if cald=2022 then o_condom_lastsex_nsp=0.91;

* FSW Incidence;
*Source: HIV incidence among women engaging in sex work in sub-Saharan Africa: a systematic review and meta-analysis (HJones);
*Incidence;
if cald=1996 then o_Incid_fsw1539_HJ=16.3;
if cald=1998 then o_Incid_fsw1539_HJ=7.4;
if cald=2017 then do; o_Incid_fsw1539_SP=3.3;*San Pedro;Incid_fsw1539_A=1.6;*Abidjan;end;

* FSW attending a program;
* Source: Revue et extension CIV_VIH_PSN_2021-2026_CORRIGEE_VFF_National strategiv plan (NSP 2021-2026) Page 90;

if cald=2021 then o_sw_in_prog_nsp=0.615;
if cald=2022 then o_sw_in_prog_nsp=0.507;
if cald=2023 then o_sw_in_prog_nsp=0.618;
if cald=2024 then o_sw_in_prog_nsp=0.729;

* FSW started PrEP;
* Source: Donnees Prevention PEPFAR 2023_Modelisation_PrEP;
if cald=2023 then o_fsw_start_prep_PEPFAR=1701;


***********************
*MSM
***********************;

***All MSM observed data taken from Anna Bowring Model Comparison sheet;
*https://worldhealthorg.sharepoint.com/:x:/r/sites/HIVModeling/_layouts/15/Doc.aspx?sourcedoc=%7B20200680-A390-4D27-8D93-692306FEDD3F%7D&file=CdI_WHO%20Model%20comparison.xlsx&action=default&mobileredirect=true;

* MSM Prevalence;
if cald=2012 then o_prev_msm=0.18;
if cald=2017 then o_prev_msm=0.123;
if cald=2020 then o_prev_msm=0.064;
if cald=2023 then o_prev_msm=0.11;

* % of men aged 15-49 who are MSM;
if cald=2020 then o_prop_msm=0.0084;
if cald=2023 then o_prop_msm= 0.0036;

