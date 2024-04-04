*COTE d'IVOIRE observed data;

***********************
POPULATION
***********************;
*Source:  https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=CI&view=chart
	    -->~41% of the population are under 15 so multiply World Population numbers by 59%;
		
if cald=1990 then do;o_pop1564=6.0;o_pop1564m=3.1;o_pop1564w=2.9;o_pop15plus=11.9*0.53;end;
if cald=1995 then do;o_pop1564=7.4;o_pop1564m=3.8;o_pop1564w=3.6;o_pop15plus=14.3*0.55;end;
if cald=2000 then do;o_pop1564=8.8;o_pop1564m=4.4;o_pop1564w=4.4;o_pop15plus=16.8*0.55;end;
if cald=2005 then do;o_pop1564=9.9;o_pop1564m=5.0;o_pop1564w=4.9;o_pop15plus=19.0*0.55;end;
if cald=2010 then do;o_pop1564=11.3;o_pop1564m=5.7;o_pop1564w=5.6;o_pop15plus=21.1*0.56;end;
if cald=2015 then do;o_pop1564=12.7;o_pop1564m=6.5;o_pop1564w=6.3;o_pop15plus=23.6*0.56;end;
if cald=2020 then do;o_pop1564=14.9;o_pop1564m=7.5;o_pop1564w=7.3;o_pop15plus=26.8*0.58;end;
*https://worldpopulationreview.com/countries/ivory-coast-population;
if cald=2024 then do;o_pop15plus=29.4*0.59;end;

o_pop1564=o_pop1564*1000000;o_pop1564m=o_pop1564m*1000000;o_pop1564w=o_pop1564w*1000000;o_pop15plus=o_pop15plus*1000000;

*Source: https://countrymeters.info/en/Cote_D%27ivoire;
o_pop15plus_m=o_pop15plus*0.509;
o_pop15plus_w=o_pop15plus*0.491;

***2024 population = 29m * 0.59 = 17.1m;




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
*HIV TESTING
***********************;
*Source: PHIA Full report Table 7.A;
if cald=2018 then do;
	o_evertested_m_PHIA=0.31;	o_evertested_w_PHIA=0.53;
end;



***********************
*CIRCUMCISION;
***********************;
*Source: PHIA https://www.cdc.gov/globalhivtb/what-we-do/phia/cote-divoire-phia-summary-sheet-2020.pdf;
if cald=2018 then do; 
	o_trad_circ1549_phia = 0.509; o_vmmc1549_phia = 0.283; o_circ1549_phia = 0.792;
end;


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
	o_onart1564_UNAIDS = 0.72;  *of PLHIV (NOT of those diag);
	o_vs1564_UNAIDS = 0.62; 	*of PLHIV (NOT of those on ART);
end;

***********************
*NUMBER ON ART;
***********************;
if cald=2022 then do;
	o_n_onart_m_UNAIDS=77428;
	o_n_onart_w_UNAIDS=205939;
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

***********************
*PrEP
***********************;
* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire;
if cald=2022 then o_prep_UNAIDS=15773;


***********************
*FSW
***********************;
* Source: UNAIDS https://www.unaids.org/en/regionscountries/countries/ctedivoire;
*Population;
*Prevalence;
if cald=2022 then do;
	o_pop_fsw_UNAIDS=66600;o_p_fsw_UNAIDS=0.0085; *66600(UNAIDS)/7800000=7.8m females aged 15-64 in 2022 according to WorldBank;
	o_prev_fsw_UNAIDS=0.048;
end;

*Source: HIV incidence among women engaging in sex work in sub-Saharan Africa: a systematic review and meta-analysis (HJones);
*Incidence;
if cald=1996 then o_Incid_fsw1539_HJ=16.3;
if cald=1998 then o_Incid_fsw1539_HJ=7.4;
if cald=2017 then do; o_Incid_fsw1539_SP=3.3;*San Pedro;Incid_fsw1539_A=1.6;*Abidjan;end;


