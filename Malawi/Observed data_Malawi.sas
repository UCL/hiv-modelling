***MALAWI OBSERVATIONAL DATA;

***UPDATED JAN 2026 BY LBM;

* POPULATION;
* KEY POPULATIONS
* PLHIV;
* HIV TESTING;
* DIAGNOSIS;
* ART;
* PREVALENCE;



**************************************************************************************************************************
													POPULATION
**************************************************************************************************************************;
*Source: World Bank https://data.worldbank.org/indicator/SP.POP.1564.TO?locations=MW&name_desc=false&utm_;
*Accessed Jan 2026;
if cald=1990 then do; o_pop_1564_wb=4800000;o_pop_1564m_wb=2300000;o_pop_1564w_wb=2500000;end;
if cald=1995 then do; o_pop_1564_wb=5100000;o_pop_1564m_wb=2500000;o_pop_1564w_wb=2700000;end;
if cald=2000 then do; o_pop_1564_wb=5700000;o_pop_1564m_wb=3700000;o_pop_1564w_wb=3000000;end;
if cald=2005 then do; o_pop_1564_wb=6400000;o_pop_1564m_wb=3100000;o_pop_1564w_wb=3300000;end;
if cald=2010 then do; o_pop_1564_wb=7400000;o_pop_1564m_wb=3600000;o_pop_1564w_wb=3900000;end;
if cald=2015 then do; o_pop_1564_wb=8800000;o_pop_1564m_wb=4200000;o_pop_1564w_wb=4600000;end;
if cald=2020 then do; o_pop_1564_wb=10600000;o_pop_1564m_wb=5100000;o_pop_1564w_wb=5500000;end;
if cald=2024 then do; o_pop_1564_wb=12300000;o_pop_1564m_wb=5900000;o_pop_1564w_wb=6400000;end;

*Source: World Population Prospect, file "World Population Prospect 2022.pdf";
*https://population.un.org/wpp/downloads?folder=Standard%20Projections&group=Population
(Excel sheet, population by select age groups);
if cald=1990 then do;o_pop_15plus_WPP=5211000;o_pop1564_WPP=4841000;end;
if cald=1995 then do;o_pop_15plus_WPP=5466000;o_pop1564_WPP=5132000;end;
if cald=2000 then do;o_pop_15plus_WPP=6091000;o_pop1564_WPP=5717000;end;
if cald=2005 then do; o_pop_15plus_WPP=6929000;o_pop1564_WPP=6423000;end;
if cald=2010 then do; o_pop_15plus_WPP=7973000;o_pop1564_WPP=7439000;end;
if cald=2015 then do; o_pop_15plus_WPP=9324000;o_pop1564_WPP=8799000;end;
if cald=2020 then do; o_pop_15plus_WPP=11111000;o_pop1564_WPP=10582000;end;
if cald=2023 then do; o_pop_15plus_WPP=12385000;o_pop1564_WPP=11853000;end;


**************************************************************************************************************************
										KEY POPULATIONS: SEX WORKERS, MSM
**************************************************************************************************************************;

* Source: UNAIDS: https://www.unaids.org/sites/default/files/media_asset/data-book-2024_en.pdf;
if cald=2023 then do;
	m_pop_sw_unaids=39000;
	m_pop_msm_unaids=49800;
end;

**************************************************************************************************************************
													PLHIV
**************************************************************************************************************************;

*Source: (MODELLED DATA) https://www.unaids.org/sites/default/files/media_asset/data-book-2024_en.pdf;
if cald=2010.5 then do;
	m_livingHIV_15plus_UNAIDS=810000;
	m_livingHIV_15plus_m_UNAIDS=330000;
	m_livingHIV_15plus_w_UNAIDS=480000;
end;

if cald=2015.5 then do;
	m_livingHIV_15plus_UNAIDS=900000;
	m_livingHIV_15plus_m_UNAIDS=360000;
	m_livingHIV_15plus_w_UNAIDS=540000;
end;

if cald=2023.5 then do;
	m_livingHIV_15plus_UNAIDS=940000;
	m_livingHIV_15plus_w_UNAIDS=590000;
	m_livingHIV_15plus_m_UNAIDS=350000;
end;

*Source: https://dms.hiv.health.gov.mw/dataset/malawi-hiv-syphilis-sentinel-surveillance-report-2010 Table 20;
* Spectrum used to estimate plhiv;
if cald=2005 then m_livingHIV15plus_unaids=778392;
if cald=2006 then m_livingHIV15plus_unaids=769669;
if cald=2007 then m_livingHIV15plus_unaids=761801;
if cald=2008 then m_livingHIV15plus_unaids=754257;
if cald=2009 then m_livingHIV15plus_unaids=746604;
if cald=2010 then m_livingHIV15plus_unaids=742086;
if cald=2011 then m_livingHIV15plus_unaids=741373;
if cald=2012 then m_livingHIV15plus_unaids=745616;
if cald=2013 then m_livingHIV15plus_unaids=754615;
if cald=2014 then m_livingHIV15plus_unaids=765921;
if cald=2015 then m_livingHIV15plus_unaids=777676;


*Source: (MODELLED DATA)https://www.aidsmalawi.org.mw/wp-content/uploads/2025/08/Malawi-HIV-Factsheet-2025.pdf;
if cald=2022 then m_livingHIV_all_unaids=1006633;
if cald=2025 then m_livingHIV15plus_unaids=938000;

* Source : PHIA https://phia.icap.columbia.edu/wp-content/uploads/2022/12/241122_Mphia_Foreword.pdf;
if cald=2016.25 then o_livingHIV_15pl_phia=946000;
if cald=2020.75 then o_livingHIV_15pl_phia=900000;

**************************************************************************************************************************
													HIV TESTING
**************************************************************************************************************************;

***Number tested;

*Source: Report of a Country-Wide Survey of HIV / AIDS services in Malawi;
*https://assets.publishing.service.gov.uk/media/57a08bfae5274a31e0000efa/malawi-rep.pdf  page 52;

if cald=2002.5 then do; n_tests_obs_mlw_moh = 149540; n_tests_f_anc_obs_mlw_moh = 5059;end;
if cald=2003.5 then do; n_tests_obs_mlw_moh = 215269; n_tests_f_anc_obs_mlw_moh = 26791;end;
if cald=2004.5 then do; n_tests_obs_mlw_moh = 283467; n_tests_f_anc_obs_mlw_moh = 43345;end;
if cald=2005.5 then do; n_tests_obs_mlw_moh = 482364; n_tests_f_anc_obs_mlw_moh = 52904;end;
if cald=2006.5 then do; n_tests_obs_mlw_moh = 661400; n_tests_f_anc_obs_mlw_moh = 137996;end;


*Source: Malawi integrated program reports (by quarter) https://dms.hiv.health.gov.mw/group/publication;
*e.g. https://dms.hiv.health.gov.mw/dataset/malawi-art-htc-program-report-2008-q1/resource/5c2a2a1c-0d23-421b-b655-9e8412d3ed41;
if cald=2008.0 then n_tests_obs_mlw_moh = 166786 * 4;
if cald=2008.25 then n_tests_obs_mlw_moh = 171648 * 4 ;
if cald=2008.5 then n_tests_obs_mlw_moh = 196710  * 4;
if cald=2008.75 then do;
n_tests_m_obs_mlw_moh= 72025 *4; n_tests_f_non_anc_obs_mlw_moh= 82983 *4; n_tests_f_anc_obs_mlw_moh= 56248 *4; n_tests_obs_mlw_moh= 211256 * 4;
end;

if cald=2009.0 then do;
n_tests_m_obs_mlw_moh= 76694 *4; n_tests_f_non_anc_obs_mlw_moh= 91381 *4; n_tests_f_anc_obs_mlw_moh= 63636 *4; n_tests_obs_mlw_moh= 231711 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
if cald=2009.25 then do;
n_tests_m_obs_mlw_moh= 68043 *4; n_tests_f_non_anc_obs_mlw_moh= 80174 *4; n_tests_f_anc_obs_mlw_moh= 59082 *4; n_tests_obs_mlw_moh= 207299 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
if cald=2009.5 then do;
n_tests_m_obs_mlw_moh= 72669 *4; n_tests_f_non_anc_obs_mlw_moh= 79359 *4; n_tests_f_anc_obs_mlw_moh= 70309 *4; n_tests_obs_mlw_moh= 222337 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
***No data on testing in 2009.75;

if cald=2010.0 then do;
n_tests_m_obs_mlw_moh= 139163 *4; n_tests_f_non_anc_obs_mlw_moh= 158986 *4; n_tests_f_anc_obs_mlw_moh= 118221 *4; n_tests_obs_mlw_moh= 416370 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
if cald=2010.25 then do;
n_tests_m_obs_mlw_moh= 160607 *4; n_tests_f_non_anc_obs_mlw_moh= 181889 *4; n_tests_f_anc_obs_mlw_moh= 141456 *4; n_tests_obs_mlw_moh= 483952 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
if cald=2010.5 then do;
n_tests_m_obs_mlw_moh= 147851 *4; n_tests_f_non_anc_obs_mlw_moh= 163961 *4; n_tests_f_anc_obs_mlw_moh= 144024 *4; n_tests_obs_mlw_moh= 455836 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
if cald=2010.75 then do;
n_tests_m_obs_mlw_moh= 123606 *4; n_tests_f_non_anc_obs_mlw_moh= 131846 *4; n_tests_f_anc_obs_mlw_moh= 115152 *4; n_tests_obs_mlw_moh= 370604* 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;

if cald=2011.0 then do;
n_tests_m_obs_mlw_moh= 143914 *4; n_tests_f_non_anc_obs_mlw_moh= 163385 *4; n_tests_f_anc_obs_mlw_moh= 129883 *4; n_tests_obs_mlw_moh= 437182 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
if cald=2011.25 then do;
n_tests_m_obs_mlw_moh= 167057 *4; n_tests_f_non_anc_obs_mlw_moh= 185690 *4; n_tests_f_anc_obs_mlw_moh= 156898 *4; n_tests_obs_mlw_moh= 509645 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
if cald=2011.5 then do;
n_tests_m_obs_mlw_moh= 127451 *4; n_tests_f_non_anc_obs_mlw_moh= 133479 *4; n_tests_f_anc_obs_mlw_moh= 120886 *4; n_tests_obs_mlw_moh= 381816 * 4;
n_tests_w_obs_mlw_moh= n_tests_f_non_anc_obs_mlw_moh + n_tests_f_anc_obs_mlw_moh;
end;
if cald=2011.75 then do;*non ANC women reported (can deduce but don't think it's needed);
n_tests_obs_mlw_moh= 299017* 4; n_tests_m_obs_mlw_moh= 0.33 *299017 *4;n_tests_w_obs_mlw_moh= 0.67 *299017 *4; n_tests_f_anc_obs_mlw_moh= 134909 *4;
end;

if cald=2012.0 then do;
n_tests_obs_mlw_moh= 299017* 4; n_tests_m_obs_mlw_moh= 0.33 *299017 *4;n_tests_w_obs_mlw_moh= 0.67 *299017 *4;n_tests_f_anc_obs_mlw_moh= 128959 *4; 
end;
***No 2012.25 report;
if cald=2012.5 then do;
n_tests_obs_mlw_moh= 579509* 4; n_tests_m_obs_mlw_moh= 0.33 *579509 *4;n_tests_w_obs_mlw_moh= 0.67 *579509 *4;n_tests_f_anc_obs_mlw_moh= 119587 *4; 
end;
if cald=2012.75 then do;
n_tests_obs_mlw_moh= 378560* 4; n_tests_m_obs_mlw_moh= 0.33 *378560 *4;n_tests_w_obs_mlw_moh= 0.67 *378560 *4;n_tests_f_anc_obs_mlw_moh= 111503*4; 
end;

if cald=2013.0 then do;
n_tests_obs_mlw_moh= 460559* 4; n_tests_m_obs_mlw_moh= 0.32 *460559 *4;n_tests_w_obs_mlw_moh= 0.68 *460559 *4;n_tests_f_anc_obs_mlw_moh= 128959 *4; 
end;
if cald=2013.25 then do;
n_tests_obs_mlw_moh= 462334* 4; n_tests_m_obs_mlw_moh= 0.33 *462334 *4;n_tests_w_obs_mlw_moh= 0.67 *462334 *4;n_tests_f_anc_obs_mlw_moh= 113061 *4; 
end;
if cald=2013.5 then do;
n_tests_obs_mlw_moh= 405278* 4; n_tests_m_obs_mlw_moh= 0.34 *405278 *4;n_tests_w_obs_mlw_moh= 0.66 *405278 *4;n_tests_f_anc_obs_mlw_moh= 128022 *4; 
end;
if cald=2013.75 then do;
n_tests_obs_mlw_moh= 374456* 4; n_tests_m_obs_mlw_moh= 0.32 *374456 *4;n_tests_w_obs_mlw_moh= 0.68 *374456 *4;n_tests_f_anc_obs_mlw_moh= 144897 *4; 
end;

if cald=2014.0 then do;
n_tests_obs_mlw_moh= 444365 * 4; n_tests_m_obs_mlw_moh= 0.32 *444365 *4;n_tests_w_obs_mlw_moh= 0.68 * 444365 *4;n_tests_f_anc_obs_mlw_moh= 130257 *4; 
end;
if cald=2014.25 then do;
n_tests_obs_mlw_moh= 435976* 4; n_tests_m_obs_mlw_moh= 0.34 *435976 *4;n_tests_w_obs_mlw_moh= 0.66 *435976 *4;n_tests_f_anc_obs_mlw_moh= 120022 *4; 
end;
if cald=2014.5 then do;
n_tests_obs_mlw_moh= 550425* 4; n_tests_m_obs_mlw_moh= 0.36 *550425 *4;n_tests_w_obs_mlw_moh= 0.64 *550425 *4;n_tests_f_anc_obs_mlw_moh= 135958 *4; 
end;
if cald=2014.75 then do;
n_tests_obs_mlw_moh= 464292* 4; n_tests_m_obs_mlw_moh= 0.34 *464292 *4;n_tests_w_obs_mlw_moh= 0.66 *464292 *4;n_tests_f_anc_obs_mlw_moh= 134985 *4; 
end;

if cald=2015.0 then do;
n_tests_obs_mlw_moh= 500086 * 4; n_tests_m_obs_mlw_moh= 0.33 *500086 *4;n_tests_w_obs_mlw_moh= 0.67 * 500086 *4;n_tests_f_anc_obs_mlw_moh= 148838 *4; 
end;
if cald=2015.25 then do;
n_tests_obs_mlw_moh= 493567* 4; n_tests_m_obs_mlw_moh= 0.35 *493567 *4;n_tests_w_obs_mlw_moh= 0.65 *493567 *4;n_tests_f_anc_obs_mlw_moh= 141212 *4; 
end;
if cald=2015.5 then do;
n_tests_obs_mlw_moh= 625803* 4; n_tests_m_obs_mlw_moh= 0.37 *625803 *4;n_tests_w_obs_mlw_moh= 0.63 *625803 *4;n_tests_f_anc_obs_mlw_moh= 129887 *4; 
end;
if cald=2015.75 then do;
n_tests_obs_mlw_moh= 606558* 4; n_tests_m_obs_mlw_moh= 0.34 *606558 *4;n_tests_w_obs_mlw_moh= 0.66 *606558 *4;n_tests_f_anc_obs_mlw_moh= 137958 *4; 
end;

if cald=2016.0 then do;
n_tests_obs_mlw_moh= 862157* 4; n_tests_m_obs_mlw_moh= 0.34 *862157 *4;n_tests_w_obs_mlw_moh= 0.66 *862157 *4;n_tests_f_anc_obs_mlw_moh= 147765 *4; 
end;
if cald=2016.25 then do;
n_tests_obs_mlw_moh= 876337* 4; n_tests_m_obs_mlw_moh= 0.34 *876337 *4;n_tests_w_obs_mlw_moh= 0.66 *876337 *4;n_tests_f_anc_obs_mlw_moh= 140475 *4; 
end;
if cald=2016.5 then do;
n_tests_obs_mlw_moh= 872393* 4; n_tests_m_obs_mlw_moh= 0.37 *872393 *4;n_tests_w_obs_mlw_moh= 0.63 *872393 *4;n_tests_f_anc_obs_mlw_moh= 146596 *4; 
end;
if cald=2016.75 then do;
n_tests_obs_mlw_moh= 788275* 4; n_tests_m_obs_mlw_moh= 0.35 *788275 *4;n_tests_w_obs_mlw_moh= 0.65 *788275 *4;n_tests_f_anc_obs_mlw_moh= 149150 *4; 
end;

if cald=2017.0 then do;
n_tests_obs_mlw_moh= 982561* 4; n_tests_m_obs_mlw_moh= 0.35 *982561 *4;n_tests_w_obs_mlw_moh= 0.65 *982561 *4;n_tests_f_anc_obs_mlw_moh= 151227 *4; 
end;
if cald=2017.25 then do;
n_tests_obs_mlw_moh= 1018328*4; n_tests_m_obs_mlw_moh= 0.37*1018328 *4;n_tests_w_obs_mlw_moh= 0.63*1018328 *4;n_tests_f_anc_obs_mlw_moh= 148638 *4; 
end;
if cald=2017.5 then do;
n_tests_obs_mlw_moh= 1186676*4; n_tests_m_obs_mlw_moh= 0.40*1186676 *4;n_tests_w_obs_mlw_moh= 0.60*1186676 *4;n_tests_f_anc_obs_mlw_moh= 159751 *4; 
end;
if cald=2017.75 then do;
n_tests_obs_mlw_moh= 977745* 4; n_tests_m_obs_mlw_moh= 0.35 *977745 *4;n_tests_w_obs_mlw_moh= 0.65 *977745 *4;n_tests_f_anc_obs_mlw_moh= 146974 *4; 
end;

if cald=2018.0 then do;
n_tests_obs_mlw_moh= 1185792 * 4; n_tests_m_obs_mlw_moh= 0.36*1185792 *4;n_tests_w_obs_mlw_moh= 0.64*1185792 *4;n_tests_f_anc_obs_mlw_moh= 161570 *4; 
end;
if cald=2018.25 then do;
n_tests_obs_mlw_moh=1133277* 4; n_tests_m_obs_mlw_moh= 0.36*1133277 *4;n_tests_w_obs_mlw_moh= 0.64*1133277 *4;n_tests_f_anc_obs_mlw_moh= 157822 *4; 
end;
if cald=2018.5 then do;
n_tests_obs_mlw_moh= 1210048* 4; n_tests_m_obs_mlw_moh= 0.36*1210048 *4;n_tests_w_obs_mlw_moh= 0.64*1210048 *4;n_tests_f_anc_obs_mlw_moh= 171922 *4; 
end;
if cald=2018.75 then do;
n_tests_obs_mlw_moh= 1106090* 4; n_tests_m_obs_mlw_moh= 0.36*1106090 *4;n_tests_w_obs_mlw_moh= 0.64*1106090 *4;n_tests_f_anc_obs_mlw_moh= 156321 *4; 
end;

if cald=2019.0 then do;
n_tests_obs_mlw_moh= 1117587* 4; n_tests_m_obs_mlw_moh= 0.34*1117587 *4;n_tests_w_obs_mlw_moh= 0.66*1117587 *4;n_tests_f_anc_obs_mlw_moh= 129256 *4; 
end;
if cald=2019.25 then do;
n_tests_obs_mlw_moh= 1007296* 4; n_tests_m_obs_mlw_moh= 0.34*1007296 *4;n_tests_w_obs_mlw_moh= 0.66*1007296 *4;n_tests_f_anc_obs_mlw_moh= 160860 *4; 
end;
if cald=2019.5 then do;
n_tests_obs_mlw_moh= 1019610* 4; n_tests_m_obs_mlw_moh= 0.35*1019610 *4;n_tests_w_obs_mlw_moh= 0.65*1019610 *4;n_tests_f_anc_obs_mlw_moh= 168033 *4; 
end;
if cald=2019.75 then do;
n_tests_obs_mlw_moh= 922473* 4; n_tests_m_obs_mlw_moh= 0.34 *922473 *4;n_tests_w_obs_mlw_moh= 0.66 *922473 *4;n_tests_f_anc_obs_mlw_moh= 157171 *4; 
end;

*No report for 2020.0;
if cald=2020.25 then do;
n_tests_obs_mlw_moh= 634564* 4; n_tests_m_obs_mlw_moh= 0.31 *634564 *4;n_tests_w_obs_mlw_moh= 0.69 *634564 *4;n_tests_f_anc_obs_mlw_moh= 162127 *4; 
end;
if cald=2020.5 then do;
n_tests_obs_mlw_moh= 697991* 4; n_tests_m_obs_mlw_moh= 0.31 *697991 *4;n_tests_w_obs_mlw_moh= 0.69 *697991 *4;n_tests_f_anc_obs_mlw_moh= 155128 *4; 
end;
if cald=2020.75 then do;
n_tests_obs_mlw_moh= 768126* 4; n_tests_m_obs_mlw_moh= 0.33 *788275 *4;n_tests_w_obs_mlw_moh= 0.67 *788275 *4;n_tests_f_anc_obs_mlw_moh= 150492 *4; 
end;

if cald=2021.0 then do;
n_tests_obs_mlw_moh= 670567* 4; n_tests_m_obs_mlw_moh= 0.33 *670567 *4;n_tests_w_obs_mlw_moh= 0.67 *670567 *4;n_tests_f_anc_obs_mlw_moh= 155575 *4; 
end;
if cald=2021.25 then do;
n_tests_obs_mlw_moh= 655092* 4; n_tests_m_obs_mlw_moh= 0.33 *655092 *4;n_tests_w_obs_mlw_moh= 0.67 *655092 *4;n_tests_f_anc_obs_mlw_moh= 150647 *4; 
end;
if cald=2021.5 then do;
n_tests_obs_mlw_moh= 642325* 4; n_tests_m_obs_mlw_moh= 0.33 *642325 *4;n_tests_w_obs_mlw_moh= 0.67 *642325 *4;n_tests_f_anc_obs_mlw_moh= 156552 *4; 
end;
if cald=2021.75 then do;
n_tests_obs_mlw_moh= 684267* 4; n_tests_m_obs_mlw_moh= 0.33 *684267 *4;n_tests_w_obs_mlw_moh= 0.67 *684267 *4;n_tests_f_anc_obs_mlw_moh= 157139 *4; 
end;

if cald=2022.0 then do;
n_tests_obs_mlw_moh= 717316 * 4; n_tests_m_obs_mlw_moh= 0.32 *717316 *4;n_tests_w_obs_mlw_moh= 0.68 *717316 *4;n_tests_f_anc_obs_mlw_moh= 167127 *4; 
end;
***From this point there are no reports available, only raw Excel sheets which I have used to calculate the numbers;
***HTS Site Report Sheet, columns L, M and N;
if cald=2022.25 then do;
n_tests_obs_mlw_moh= 743686* 4; n_tests_m_obs_mlw_moh= 239513 *4;n_tests_w_obs_mlw_moh= 504173 *4;n_tests_f_anc_obs_mlw_moh= 182824 *4; 
end;
if cald=2022.5 then do;
n_tests_obs_mlw_moh=1019610* 4; n_tests_m_obs_mlw_moh= 355091 *4;n_tests_w_obs_mlw_moh= 664519 *4;n_tests_f_anc_obs_mlw_moh= 216054 *4; 
end;
if cald=2022.75 then do;
n_tests_obs_mlw_moh= 740631* 4; n_tests_m_obs_mlw_moh= 235936 *4;n_tests_w_obs_mlw_moh= 504675 *4;n_tests_f_anc_obs_mlw_moh= 192521 *4; 
end;

if cald=2023.0 then do;
n_tests_obs_mlw_moh= 799051 * 4; n_tests_m_obs_mlw_moh= 248835 *4;n_tests_w_obs_mlw_moh= 550216 *4;n_tests_f_anc_obs_mlw_moh= 204435 *4; 
end;
if cald=2023.25 then do;
n_tests_obs_mlw_moh= 828974* 4; n_tests_m_obs_mlw_moh= 258904 *4;n_tests_w_obs_mlw_moh= 570070 *4;n_tests_f_anc_obs_mlw_moh= 197016 *4; 
end;
if cald=2023.5 then do;
n_tests_obs_mlw_moh=870741* 4; n_tests_m_obs_mlw_moh= 277603 *4;n_tests_w_obs_mlw_moh= 593138 *4;n_tests_f_anc_obs_mlw_moh= 192923*4; 
end;
if cald=2023.75 then do;
n_tests_obs_mlw_moh= 907999* 4; n_tests_m_obs_mlw_moh= 284697 *4;n_tests_w_obs_mlw_moh= 623302 *4;n_tests_f_anc_obs_mlw_moh= 203475 *4; 
end;

if cald=2024.0 then do;
n_tests_obs_mlw_moh= 1060797 * 4; n_tests_m_obs_mlw_moh= 346623 *4;n_tests_w_obs_mlw_moh= 714174 *4;n_tests_f_anc_obs_mlw_moh= 211041 *4; 
end;
if cald=2024.25 then do;
n_tests_obs_mlw_moh= 1034109* 4; n_tests_m_obs_mlw_moh= 340701 *4;n_tests_w_obs_mlw_moh= 693408 *4;n_tests_f_anc_obs_mlw_moh= 195075 *4; 
end;
if cald=2024.5 then do;
n_tests_obs_mlw_moh=1071342* 4; n_tests_m_obs_mlw_moh= 360657 *4;n_tests_w_obs_mlw_moh= 710685 *4;n_tests_f_anc_obs_mlw_moh= 206720*4; 
end;
if cald=2024.75 then do;
n_tests_obs_mlw_moh= 1008762* 4; n_tests_m_obs_mlw_moh= 326413 *4;n_tests_w_obs_mlw_moh= 682349 *4;n_tests_f_anc_obs_mlw_moh= 205360 *4; 
end;

if cald=2025.0 then do;
n_tests_obs_mlw_moh= 814386 * 4; n_tests_m_obs_mlw_moh= 256909 *4;n_tests_w_obs_mlw_moh= 557477 *4;n_tests_f_anc_obs_mlw_moh= 194991 *4; 
end;
if cald=2025.25 then do;
n_tests_obs_mlw_moh= 890254* 4; n_tests_m_obs_mlw_moh= 282119 *4;n_tests_w_obs_mlw_moh= 608135 *4;n_tests_f_anc_obs_mlw_moh= 197502 *4; 
end;

* Self testing;

* Source quarterly reports - multiply by 4 to get annual numbers (using number of people given tests rather than number of tests);
if cald = 2019.50 then n_self_tested_obs_mlw_moh = 30619 * 4;
if cald = 2019.75 then n_self_tested_obs_mlw_moh = 31747 * 4; 

if cald = 2020.25 then n_self_tested_obs_mlw_moh = 105211 * 4; 
if cald = 2020.50 then n_self_tested_obs_mlw_moh = 186487 * 4;
if cald = 2020.75 then n_self_tested_obs_mlw_moh = 345411 * 4; 

***Not sure of source of these numbers (from AP file)- quarterly reports not published after 2021 but they look broadly in line with those above;
*if cald = 2019.5 then n_self_tested_obs_mlw = 101000; * this is annual number;  
*if cald = 2020.5 then n_self_tested_obs_mlw = 561000; * this is annual number;  
if cald = 2021.5 then n_self_tested_obs_mlw = 827000; * this is annual number;  
if cald = 2022.5 then n_self_tested_obs_mlw = 750000; * this is annual number;  
if cald = 2023.5 then n_self_tested_obs_mlw = 802000; * this is annual number;  


***Percentage ever tested;

*DHS: https://dhsprogram.com/methodology/survey-search.cfm?pgtype=main&SrvyTp=country&ctry_id=24;
if cald=2004 then do; 
	o_p_evertested_1549w_mdhs= 0.129;*Table 11.11 (ever tested, received results);
	o_p_evertested_1549m_mdhs= 0.151;
end;
if cald=2010 then do;
	o_p_evertested_1549w_mdhs= 0.716;
	o_p_evertested_1549m_mdhs= 0.512;
end;

if cald=2015.75 then do;
	o_p_evertested_1549w_mdhs= 0.820;
	o_p_evertested_1549m_mdhs= 0.683;
end;
*Source: DHS report not yet published, https://www.jointdatacenter.org/2024-malawi-demographic-and-health-survey-mdhs-key-indicators-report/;
if cald=2024 then do;
	o_p_evertested_1549w_mdhs= 0.861;
	o_p_evertested_1549m_mdhs= 0.867;
end;	

**************************************************************************************************************************
													DIAGNOSED
**************************************************************************************************************************;

***Proportion diagnosed;
*Source: DHS: https://dhsprogram.com/pubs/pdf/FR319/FR319.pdf Table 14.10;
if cald=2015.75 then do;
	o_p_diag_1549_mdhs =0.889;
	o_p_diag_m1549_mdhs=0.830;
	o_p_diag_w1549_mdhs=0.919;
end;
*Not reported in earlier DHS, likely will be in DHS 2024 which is not yet published;

*Source: MPHIA https://phia.icap.columbia.edu/wp-content/uploads/2017/11/Final-MPHIA-First-Report_11.15.17.pdf;
*using table 3.4G - self reported only;
if cald=2016.25 then do;
	o_p_diag_m1549_phia=0.655;o_p_diag_w1549_phia=0.754;o_p_diag_1549_phia=0.717;
	o_p_diag_m15pl_phia=0.676;o_p_diag_w15pl_phia=0.759;o_p_diag_15pl_phia=0.727;
end;

*Source: MPHIA: https://phia.icap.columbia.edu/wp-content/uploads/2022/12/241122_Mphia_Foreword.pdf;
*using Table 9.1A which takes into account self-report and biomarker data;
if cald=2020.75 then do;
	o_p_diag_m1549_phia=0.829;o_p_diag_w1549_phia=0.896;o_p_diag_1549_phia=0.873;
	o_p_diag_m15pl_phia=0.850;o_p_diag_w15pl_phia=0.904;o_p_diag_15pl_phia=0.883;
end;


*Source: Quarterly reports;

if cald=2016.75 then o_p_diag_obs_mlw_moh= 0.83;
if cald=2017.75 then o_p_diag_obs_mlw_moh= 0.89;
if cald=2018.75 then o_p_diag_obs_mlw_moh= 0.91;
if cald=2019.75 then o_p_diag_obs_mlw_moh= 0.90;
if cald=2020.75 then o_p_diag_obs_mlw_moh= 0.91;
if cald=2021.75 then o_p_diag_obs_mlw_moh= 0.93;



***Number diagnosed;

*Source: Report of a country-wide survey of HIV in Malawi for 2005;
*  https://dms.hiv.health.gov.mw/dataset/e6202dd3-cf96-4f0a-aae7-876784fe35e8/resource/4d5325dd-aebf-466c-87e4-1ff796a82a84/download/malawi-hiv-services-situation-analysis-2005.pdf;
if cald=2002.5 then n_diag_obs_mlw_moh= 33303 ;
if cald=2003.5 then n_diag_obs_mlw_moh= 50115 ;
if cald=2004.5 then n_diag_obs_mlw_moh= 64635 ;

*Source: Malawi integrated program reports (by quarter) https://dms.hiv.health.gov.mw/group/publication;
* These are annual totals and have been verified by adding up the number of HIV positives in each quarter;
if cald=2005.5 then n_diag_obs_mlw_moh= 59041 ;
if cald=2006.5 then n_diag_obs_mlw_moh= 91382 ;
if cald=2007.5 then n_diag_obs_mlw_moh= 110204 ;
if cald=2008.5 then n_diag_obs_mlw_moh= 124458 ;
if cald=2009.5 then n_diag_obs_mlw_moh= 125614 ;
if cald=2010.5 then n_diag_obs_mlw_moh= 179115 ;
if cald=2011.5 then n_diag_obs_mlw_moh= 166705 ;
if cald=2012.5 then n_diag_obs_mlw_moh= 146210 ;
if cald=2013.5 then n_diag_obs_mlw_moh= 136743 ;
if cald=2014.5 then n_diag_obs_mlw_moh= 116959 ;
if cald=2015.5 then n_diag_obs_mlw_moh= 124280 ;

* these below are multiplied by 4 so expressed as annual number at each time point;
if cald=2016.00 then n_diag_obs_mlw_moh= 41901 * 4 ;
if cald=2016.25 then n_diag_obs_mlw_moh= 39176 * 4;
if cald=2016.50 then n_diag_obs_mlw_moh= 36253 * 4;
if cald=2016.75 then n_diag_obs_mlw_moh= 32987 * 4; 

if cald=2017.00 then n_diag_obs_mlw_moh= 41113 * 4;
if cald=2017.25 then n_diag_obs_mlw_moh= 37562 * 4;
if cald=2017.50 then n_diag_obs_mlw_moh= 36886 * 4;
if cald=2017.75 then n_diag_obs_mlw_moh= 32052 * 4; 

if cald=2018.00 then n_diag_obs_mlw_moh= 38048 * 4;
if cald=2018.25 then n_diag_obs_mlw_moh= 34414 * 4;
if cald=2018.50 then n_diag_obs_mlw_moh= 36052 * 4;
if cald=2018.75 then n_diag_obs_mlw_moh= 31089 * 4; 

if cald=2019.00 then n_diag_obs_mlw_moh= 32313 * 4;
if cald=2019.25 then n_diag_obs_mlw_moh= 28912 * 4;
if cald=2019.50 then n_diag_obs_mlw_moh= 28376 * 4;
if cald=2019.75 then n_diag_obs_mlw_moh= 26276 * 4; 

if cald=2020.00 then n_diag_obs_mlw_moh= 28852 * 4;
if cald=2020.25 then n_diag_obs_mlw_moh= 18882 * 4;
if cald=2020.50 then n_diag_obs_mlw_moh= 20206 * 4;
if cald=2020.75 then n_diag_obs_mlw_moh= 22634 * 4; 

if cald=2021.00 then n_diag_obs_mlw_moh= 20078 * 4;
if cald=2021.25 then n_diag_obs_mlw_moh= 19509 * 4;
if cald=2021.50 then n_diag_obs_mlw_moh= 18568 * 4;
if cald=2021.75 then n_diag_obs_mlw_moh= 19453 * 4; 


***Numbers below are calculated from quarterly excel sheets as reports have not been published;
*Source: e.g. https://dms.hiv.health.gov.mw/dataset/malawi-hiv-program-data-2022-q3/resource/8464d697-7f05-4f4b-a04e-2e629a29adcb;
if cald=2022.00 then n_diag_obs_mlw_moh= 19994 * 4;
if cald=2022.25 then n_diag_obs_mlw_moh= 19310 * 4;
if cald=2022.50 then n_diag_obs_mlw_moh= 19512 * 4;
if cald=2022.75 then n_diag_obs_mlw_moh= 17116 * 4; 

if cald=2023.00 then n_diag_obs_mlw_moh= 18024 * 4;
if cald=2023.25 then n_diag_obs_mlw_moh= 16696 * 4;
if cald=2023.50 then n_diag_obs_mlw_moh= 16536 * 4;
if cald=2023.75 then n_diag_obs_mlw_moh= 16579 * 4; 

if cald=2024.00 then n_diag_obs_mlw_moh= 17984 * 4;
if cald=2024.25 then n_diag_obs_mlw_moh= 15744 * 4;
if cald=2024.50 then n_diag_obs_mlw_moh= 15613 * 4;
if cald=2024.75 then n_diag_obs_mlw_moh= 14938 * 4; 

if cald=2025.00 then n_diag_obs_mlw_moh= 13518 * 4;
if cald=2025.25 then n_diag_obs_mlw_moh= 13936 * 4;


**************************************************************************************************************************
													ART
**************************************************************************************************************************;

* Number on ART and ART coverage (denom=plhiv from Spectrum) at year end;

*Source: UNAIDS report using country progress data;
* https://www.unaids.org/sites/default/files/country/documents/malawi_2010_country_progress_report_en.pdf Table 3.7;
* propoption on ART are based on Spectrum denominators;
if cald=2004.75 then do; n_onart_obs_mlw_all_moh= 10761; p_onart_obs_mlw_all_moh=0.0429;end;
if cald=2005.75 then do; n_onart_obs_mlw_all_moh= 29087; p_onart_obs_mlw_all_moh=0.1126;end;
if cald=2006.75 then do; n_onart_obs_mlw_all_moh= 59980; p_onart_obs_mlw_all_moh=0.2259;end;
if cald=2007.75 then do; n_onart_obs_mlw_all_moh= 100649; p_onart_obs_mlw_all_moh=0.3645;end;
if cald=2008.75 then do; n_onart_obs_mlw_15pl_moh= 135697; p_onart_obs_mlw_all_15pl_moh=0.5153;end;
if cald=2009.75 then do; n_onart_obs_mlw_15pl_moh= 181482; p_onart_obs_mlw_all_15pl_moh=0.6508;end;

* Source: Quarterly reports;
if cald=2010.75 then do; n_onart_obs_mlw_15pl_moh= 228468; p_onart_obs_mlw_all_15pl_moh=0.71;end;
if cald=2011.75 then n_onart_obs_mlw_15pl_moh= 294585 ; *ART eligibility criteria changed, no estimate on coverage;
if cald=2012.75 then n_onart_obs_mlw_15pl_moh= 369229; *ART eligibility criteria changed, no estimate on coverage;
if cald=2013.75 then do; n_onart_obs_mlw_15pl_moh= 430645; p_onart_obs_mlw_all_15pl_moh=0.84;end;
if cald=2014.75 then do; n_onart_obs_mlw_15pl_moh= 489775; p_onart_obs_mlw_all_15pl_moh=0.71;end;
if cald=2015.75 then do; n_onart_obs_mlw_15pl_moh= 540071; p_onart_obs_mlw_all_15pl_moh=0.69;end;
if cald=2016.75 then do; n_onart_obs_mlw_15pl_moh= 625689; p_onart_obs_mlw_all_15pl_moh=0.70;end;
if cald=2017.75 then do; n_onart_obs_mlw_15pl_moh= 700360; p_onart_obs_mlw_all_15pl_moh=0.71;end;  
if cald=2018.75 then do; n_onart_obs_mlw_15pl_moh= 759782; p_onart_obs_mlw_all_15pl_moh=0.76;end;
if cald=2019.75 then do; n_onart_obs_mlw_15pl_moh= 787609; p_onart_obs_mlw_all_15pl_moh=0.78;end;
if cald=2020.75 then do; n_onart_obs_mlw_15pl_moh= 818218; p_onart_obs_mlw_all_15pl_moh=0.80;end; 
if cald=2021.75 then do; n_onart_obs_mlw_15pl_moh= 855361; p_onart_obs_mlw_all_15pl_moh=0.92;end;

* Source: Calculated for all ages from raw data on Excel sheets as quarterly reports are not available after 2021;
if cald=2022.75 then n_onart_obs_mlw_all_moh= 934878;
if cald=2023.75 then n_onart_obs_mlw_all_moh= 951188; 
if cald=2024.75 then n_onart_obs_mlw_all_moh= 957654;

*Source: UNAIDS https://www.aidsmalawi.org.mw/wp-content/uploads/2024/04/Malawi_FactSheet_version-V7.0-FINAL-.pdf;
if cald=2022.75 then do;
	n_onart_obs_mlw_all_unaids= 931916; 
	p_onart_obs_mlw_15pl_unaids=0.93;p_onart_obs_mlw_m15pl_unaids=0.86;p_onart_obs_mlw_w15pl_unaids=0.99;
end;

if cald=2024.75 then do;
	n_onart_obs_mlw_15pl_unaids= 938000;
	p_onart_obs_mlw_15pl_unaids=0.92;p_onart_obs_mlw_m15pl_unaids=0.90;p_onart_obs_mlw_w15pl_unaids=0.93;
end;


***2nd line ART;


***Source: Quarterly reports - using data from Q4. 2022 onwards not published and unable to find numbers in spreadsheets;
if cald=2011.75 then n_secondline_obs_mlw_moh= 1378 ;
if cald=2012.75 then n_secondline_obs_mlw_moh= 2480 ; 
if cald=2013.75 then n_secondline_obs_mlw_moh= 3694 ; 
if cald=2014.75 then n_secondline_obs_mlw_moh= 5700 ; 
if cald=2015.75 then n_secondline_obs_mlw_moh= 7769 ; 
if cald=2016.75 then n_secondline_obs_mlw_moh= 10116 ; 
if cald=2017.75 then n_secondline_obs_mlw_moh= 15014 ; 
if cald=2018.75 then n_secondline_obs_mlw_moh= 22736 ; 
if cald=2019.75 then n_secondline_obs_mlw_moh= 29846 ; 
if cald=2020.75 then n_secondline_obs_mlw_moh= 20313 ; 
if cald=2021.75 then n_secondline_obs_mlw_moh= 2400 ; 


* Of those diagnosed, proportion on ART;

* Source: MPHIA;
* https://phia.icap.columbia.edu/wp-content/uploads/2017/11/Final-MPHIA-First-Report_11.15.17.pdf Table 3.4G;
* https://phia.icap.columbia.edu/wp-content/uploads/2022/12/241122_Mphia_Foreword.pdf Table 9.1B;
if cald=2016.25 then do;
	p_diag_onart_mlw_1549_phia=0.887;p_diag_onart_mlw_15pl_phia=0.896;
	p_diag_onart_mlw_m1549_phia=0.838;p_diag_onart_mlw_m15pl_phia=0.861;
	p_diag_onart_mlw_w1549_phia=0.913;p_diag_onart_mlw_w15pl_phia=0.916;
end;

if cald=2020.75 then do;
	p_diag_onart_mlw_1549_phia=0.979;p_diag_onart_mlw_15pl_phia=0.979;
	p_diag_onart_mlw_m1549_phia=0.974;p_diag_onart_mlw_m15pl_phia=0.974;
	p_diag_onart_mlw_w1549_phia=0.982;p_diag_onart_mlw_w15pl_phia=0.982;
end;

*Source: Quarterly reports;

if cald=2016.75 then p_diag_onart_mlw_all_moh=0.84;
if cald=2017.75 then p_diag_onart_mlw_all_moh=0.80;
if cald=2018.75 then p_diag_onart_mlw_all_moh=0.83;
if cald=2019.75 then p_diag_onart_mlw_all_moh=0.87;
if cald=2020.75 then p_diag_onart_mlw_all_moh=0.88;
if cald=2021.75 then p_diag_onart_mlw_all_moh=0.98;

**************************************************************************************************************************
													PREVALENCE
**************************************************************************************************************************;

* Source: DHS 2004, 2010, 2016 (2024 needs to be added, currently not published);
* https://dhsprogram.com/pubs/pdf/FR175/FR-175-MW04.pdf Table G1;
* https://dhsprogram.com/pubs/pdf/FR247/FR247.pdf Table 14.4 and 14.8;
* https://dhsprogram.com/pubs/pdf/FR319/FR319.pdf Table 14.3;

if cald=2004.5 then do;
	prevalence1549_obs_mlw_mdhs= 0.127;
	prevalence1549m_obs_mlw_mdhs= 0.108;
	prevalence1549w_obs_mlw_mdhs= 0.144;
	prevalence1524_obs_mlw_mdhs= 0.060;
	prevalence1524m_obs_mlw_mdhs= 0.021;
	prevalence1524w_obs_mlw_mdhs= 0.091;
end;

if cald=2010.5 then do;
	prevalence1549_obs_mlw_mdhs= 0.106;
	prevalence1549m_obs_mlw_mdhs= 0.081;
	prevalence1549w_obs_mlw_mdhs= 0.129;
	prevalence1524_obs_mlw_mdhs= 0.036;
	prevalence1524m_obs_mlw_mdhs= 0.019;
	prevalence1524w_obs_mlw_mdhs= 0.052;
end;

if cald=2016.0 then do;
	prevalence1549_obs_mlw_mdhs= 0.108;
	prevalence1549m_obs_mlw_mdhs= 0.064;
	prevalence1549w_obs_mlw_mdhs= 0.088;
	prevalence1524_obs_mlw_mdhs= 0.035;
	prevalence1524m_obs_mlw_mdhs= 0.011;
	prevalence1524w_obs_mlw_mdhs= 0.056;
end;

* Source MPHIA;
* https://phia.icap.columbia.edu/wp-content/uploads/2017/11/Final-MPHIA-First-Report_11.15.17.pdf Table 3.3C;
if cald=2016.25 then prevalence1549_obs_mlw_mphia= 0.100;
if cald=2016.25 then prevalence1549m_obs_mlw_mphia= 0.078;
if cald=2016.25 then prevalence1549w_obs_mlw_mphia= 0.121;

* https://phia.icap.columbia.edu/wp-content/uploads/2022/12/241122_Mphia_Foreword.pdf Table 6.1;
if cald=2020.75 then prevalence1549_obs_mlw_mphia= 0.080;
if cald=2020.75 then prevalence1549m_obs_mlw_mphia= 0.058;
if cald=2020.75 then prevalence1549w_obs_mlw_mphia= 0.100;


*Source: (MODELLED DATA) Spectrum AIMS estimates;
* https://data.worldbank.org/indicator/SH.DYN.AIDS.ZS?locations=MW;
* Only put here selected years but estimates for all years are available);
if cald=1990 then m_prevalence1549_mlw_unaids=0.09;
if cald=1992 then m_prevalence1549_mlw_unaids=0.121;
if cald=1994 then m_prevalence1549_mlw_unaids=0.142;
if cald=1996 then m_prevalence1549_mlw_unaids=0.157;
if cald=1998 then m_prevalence1549_mlw_unaids=0.160;
if cald=2000 then m_prevalence1549_mlw_unaids=0.153;
if cald=2005 then m_prevalence1549_mlw_unaids=0.123;
if cald=2010 then m_prevalence1549_mlw_unaids=0.107;
if cald=2015 then m_prevalence1549_mlw_unaids=0.096;
if cald=2020 then m_prevalence1549_mlw_unaids=0.079;
if cald=2024 then m_prevalence1549_mlw_unaids=0.062;


***PREVALENCE IN FSW;
* Source: UNAIDS: https://www.unaids.org/en/20190402_country_focus_Malawi;
if cald=2017 then m_prevalence_fsw_mlw_unaids=0.60;

* Source: MALAWI BIOLOGICAL AND BEHAVIOURAL SURVEILLANCE SURVEY; 
* https://www.aidsmalawi.org.mw/wp-content/uploads/2024/06/2019-2020_Malawi_BBSS_Report_FINAL.pdf;
if cald=2013.0 then o_prevalence_fsw_mlw_mbbs=0.627;
if cald=2019.5 then o_prevalence_fsw_mlw_mbbs=0.499;


***PREVALENCE IN MSM;
* Source: MALAWI BIOLOGICAL AND BEHAVIOURAL SURVEILLANCE SURVEY; 
* https://www.aidsmalawi.org.mw/wp-content/uploads/2024/06/2019-2020_Malawi_BBSS_Report_FINAL.pdf;
if cald=2019.5 then o_prevalence_msm_mlw_mbbs=0.128;


***PREVALENCE IN AGYW;
* Source: DHS https://dhsprogram.com/pubs/pdf/FR247/FR247.pdf Table 14.8;
if cald=2010 then prevalence_agyw_mlw_dhs=0.052;
if cald=2015.75 then prevalence_agyw_mlw_dhs=0.049;

* Source: PHIA https://phia.icap.columbia.edu/wp-content/uploads/2022/12/241122_Mphia_Foreword.pdf Table 6.3;
if cald=2016.25 then prevalence_agyw_mlw_phia=0.049; 
if cald=2020.75 then prevalence_agyw_mlw_phia=0.049; 
**************************************************************************************************************************
													INCIDENCE
**************************************************************************************************************************;


* Source MPHIA;
* https://phia.icap.columbia.edu/wp-content/uploads/2017/11/Final-MPHIA-First-Report_11.15.17.pdf Table 3.3A;

if cald=2016.25 then do;
	o_incidence1549_obs_mlw_phia= 0.36;
	o_incidence1549m_obs_mlw_phia= 0.26;
	o_incidence1549w_obs_mlw_phia= 0.46;
	o_incidence_agyw_obs_mlw_phia=0.40;
end;

if cald=2020.75 then do;
	o_incidence1549_obs_mlw_phia= 0.23;
	o_incidence1549m_obs_mlw_phia= 0.15;
	o_incidence1549w_obs_mlw_phia= 0.31;
	o_incidence_agyw_obs_mlw_phia=0.42;
	
end;


**************************************************************************************************************************
													VIRAL SUPPRESSION
**************************************************************************************************************************;

* Source: https://www.unaids.org/sites/default/files/country/documents/MWI_narrative_report_2015.pdf Page 39;
if cald=2014.5 then p_onart_vl1000_obs_mlw_unaids= 0.855; *only 17% of people had VL tests;

* Source: https://www.cdc.gov/mmwr/volumes/65/wr/mm6547a2.htm;
if cald=2015.5 then p_onart_vl1000_obs_mlw_moh= 0.82;
if cald=2016.5 then p_onart_vl1000_obs_mlw_moh= 0.89;

* Source: Quarterly reports;
if cald=2016.75 then p_onart_vl1000_obs_mlw_moh=0.88;
if cald=2017.75 then p_onart_vl1000_obs_mlw_moh=0.86;
if cald=2018.75 then p_onart_vl1000_obs_mlw_moh=0.90;
if cald=2019.75 then p_onart_vl1000_obs_mlw_moh=0.93;
if cald=2020.75 then p_onart_vl1000_obs_mlw_moh=0.95;
if cald=2021.75 then p_onart_vl1000_obs_mlw_moh=0.93;

* Source: MPHIA;
* https://phia.icap.columbia.edu/wp-content/uploads/2017/11/Final-MPHIA-First-Report_11.15.17.pdf Table 3.4G;
* https://phia.icap.columbia.edu/wp-content/uploads/2022/12/241122_Mphia_Foreword.pdf Table 9.1B;
if cald=2016.25 then do;
	p_onart_vl1000_mlw_1549_phia=0.887;p_onart_vl1000_mlw_15pl_phia=0.896;
	p_onart_vl1000_mlw_m1549_phia=0.838;p_onart_vl1000_mlw_m15pl_phia=0.861;
	p_onart_vl1000_mlw_w1549_phia=0.913;p_onart_vl1000_mlw_w15pl_phia=0.916;
end;

if cald=2020.75 then do;
	p_onart_vl1000_mlw_1549_phia=0.887;p_onart_vl1000_mlw_15pl_phia=0.896;
	p_onart_vl1000_mlw_m1549_phia=0.838;p_onart_vl1000_mlw_m15pl_phia=0.861;
	p_onart_vl1000_mlw_w1549_phia=0.913;p_onart_vl1000_mlw_w15pl_phia=0.916;
end;


**************************************************************************************************************************
													PREP
**************************************************************************************************************************;


* Source: 2024 Global AIDS Monitoring Report for Malawi and quarterly reports 2021 Q4;
* https://www.aidsmalawi.org.mw/wp-content/uploads/2024/05/2024-Narrative-Draft-GAM-Report-Malawi-Ver-2.pdf;
if cald = 2021.75 then do; n_onprep_obs_mlw_moh = 7631 ; n_everstarted_prep_mlw_moh=11078;end;
if cald = 2022.75 then do; n_onprep_obs_mlw_moh = 20482 ; n_everstarted_prep_mlw_moh=.;end;
if cald = 2023.75 then do; n_onprep_obs_mlw_moh = 50638 ; o_n_onprep_fsw_mlw_moh=3576; o_n_onprep_msm_mlw_moh=2896;end;

* Source: PrEPWATCH;
if cald=2025 then o_n_prepever_mlw_pw=183653;

* Source: Quarterly reports 2021 Q4;
if cald=2021.75 then o_n_everstarted_prep_agyw_moh=3282;
/*
*Not sure where these numbers came from - taken from AP file;
if cald = 2021.5 then n_prep_obs_mlw = 3200 ;  * from data in template - from implementing partners;
if cald = 2022.5 then n_prep_obs_mlw = 9600 ;  * from data in template - from implementing partners;
if cald = 2023.5 then n_prep_obs_mlw = 36000 ;  * from data in template - from implementing partners;
*/

**************************************************************************************************************************
													CIRCUMCISION
**************************************************************************************************************************;
*Source: DHS: https://dhsprogram.com/pubs/pdf/FR175/FR-175-MW04.pdf Table 11.24;
if cald=2004 then o_p_circ_1549_dhs=0.207;
if cald=2010 then o_p_circ_1549_dhs=0.216;
if cald=2016 then do;o_p_circ_1549_dhs=0.28;o_p_vmmc_1549_dhs=0.09;end;
if cald=2024 then do;o_p_circ_1549_dhs=0.379;o_p_vmmc_1549_dhs=0.209;end;

* Source: PHIA https://phia.icap.columbia.edu/wp-content/uploads/2017/11/Final-MPHIA-First-Report_11.15.17.pdf;
if cald=2016.25 then do;o_p_circ_1549_phia=30.1;o_p_vmmc_1549_phia=0.092;end;
if cald=2020.75 then o_p_circ_1549_phia=34.6;o_p_vmmc_1549_phia=0.153;end;

* Source: Global AIDS Monitoring Report for Malawi 2024;
* https://www.aidsmalawi.org.mw/wp-content/uploads/2024/05/2024-Narrative-Draft-GAM-Report-Malawi-Ver-2.pdf;
if cald = 2019.5 then n_new_vmmc_obs_mlw_amr = 141193;  
if cald = 2020.5 then n_new_vmmc_obs_mlw_amr = 69322;  
if cald = 2021.5 then n_new_vmmc_obs_mlw_amr = 141570;  
if cald = 2022.5 then n_new_vmmc_obs_mlw_amr = 132519;  
if cald = 2023.5 then n_new_vmmc_obs_mlw_amr = 119161;  

if cald = 2019.5 then n_vm_obs_mlw = 410000; * this is annual number;  
if cald = 2020.5 then n_vm_obs_mlw = 403000; * this is annual number;  
if cald = 2021.5 then n_vm_obs_mlw = 455000; * this is annual number;  
if cald = 2022.5 then n_vm_obs_mlw = 351000; * this is annual number;  
if cald = 2023.5 then n_vm_obs_mlw = 458000; * this is annual number;  
