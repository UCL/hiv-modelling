***MALAWI OBSERVATIONAL DATA;

***UPDATED JAN 2026 BY LBM;

* 1. POPULATION;
* 2. PLHIV;
* 3. HIV TESTING;




**************************************************************************************************************************
													POPULATION
**************************************************************************************************************************
*Source: World Bank https://data.worldbank.org/indicator/SP.POP.1564.TO?locations=MW&name_desc=false&utm_;
*Accessed Jan 2026;
if cald=1990 then do; o_pop_1564_wb=4800000;o_pop_1564m_wb=2300000;o_pop_1564w_wb=2500000;
if cald=1995 then do; o_pop_1564_wb=5100000;o_pop_1564m_wb=2500000;o_pop_1564w_wb=2700000;
if cald=2000 then do; o_pop_1564_wb=5700000;o_pop_1564m_wb=3700000;o_pop_1564w_wb=3000000;
if cald=2005 then do; o_pop_1564_wb=6400000;o_pop_1564m_wb=3100000;o_pop_1564w_wb=3300000;
if cald=2010 then do; o_pop_1564_wb=7400000;o_pop_1564m_wb=3600000;o_pop_1564w_wb=3900000;
if cald=2015 then do; o_pop_1564_wb=8800000;o_pop_1564m_wb=4200000;o_pop_1564w_wb=4600000;
if cald=2020 then do; o_pop_1564_wb=10600000;o_pop_1564m_wb=5100000;o_pop_1564w_wb=5500000;
if cald=2024 then do; o_pop_1564_wb=12300000;o_pop_1564m_wb=5900000;o_pop_1564w_wb=6400000;

**************************************************************************************************************************
													PLHIV
**************************************************************************************************************************

*Source: (MODELLED DATA) https://www.unaids.org/sites/default/files/media_asset/data-book-2024_en.pdf;
if cald=2010.5 then do;
	o_livingHIV_15plus_UNAIDS=810000;
	o_livingHIV_15plus_m_UNAIDS=330000;
	o_livingHIV_15plus_w_UNAIDS=480000;
end;

if cald=2015.5 then do;
	o_livingHIV_15plus_UNAIDS=900000;
	o_livingHIV_15plus_m_UNAIDS=360000;
	o_livingHIV_15plus_w_UNAIDS=540000;
end;

if cald=2023.5 then do;
	o_livingHIV_15plus_UNAIDS=940000;
	o_livingHIV_15plus_m_UNAIDS=590000;
	o_livingHIV_15plus_w_UNAIDS=350000;
end;


*Source: (MODELLED DATA)https://www.aidsmalawi.org.mw/wp-content/uploads/2025/08/Malawi-HIV-Factsheet-2025.pdf;
if cald=2025 then o_livingHIV_15plus_nac=938000;


**************************************************************************************************************************
													HIV TESTS
**************************************************************************************************************************


*Source: Report of a Country-Wide Survey of HIV / AIDS services in Malawi;
*https://assets.publishing.service.gov.uk/media/57a08bfae5274a31e0000efa/malawi-rep.pdf  page 52;

if cald=2002.5 then do; n_tests_obs_mlw = 149540; n_tests_f_anc_obs_mlw = 5059;end;
if cald=2003.5 then do; n_tests_obs_mlw = 215269; n_tests_f_anc_obs_mlw = 26791;end;
if cald=2004.5 then do; n_tests_obs_mlw = 283467; n_tests_f_anc_obs_mlw = 43345;end;
if cald=2005.5 then do; n_tests_obs_mlw = 482364; n_tests_f_anc_obs_mlw = 52904;end;
if cald=2006.5 then do; n_tests_obs_mlw = 661400; n_tests_f_anc_obs_mlw = 137996;end;


*Source: Malawi integrated program reports (by quarter) https://dms.hiv.health.gov.mw/group/publication;
*e.g. https://dms.hiv.health.gov.mw/dataset/malawi-art-htc-program-report-2008-q1/resource/5c2a2a1c-0d23-421b-b655-9e8412d3ed41;
if cald=2008.0 then n_tests_obs_mlw = 166786 * 4;
if cald=2008.25 then n_tests_obs_mlw = 171648 * 4 ;
if cald=2008.5 then n_tests_obs_mlw = 196710  * 4;
if cald=2008.75 then do;
n_tests_m_obs_mlw= 72025 *4; n_tests_f_non_anc_obs_mlw= 82983 *4; n_tests_f_anc_obs_mlw= 56248 *4; n_tests_obs_mlw= 211256 * 4;
end;

if cald=2009.0 then do;
n_tests_m_obs_mlw= 76694 *4; n_tests_f_non_anc_obs_mlw= 91381 *4; n_tests_f_anc_obs_mlw= 63636 *4; n_tests_obs_mlw= 231711 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
if cald=2009.25 then do;
n_tests_m_obs_mlw= 68043 *4; n_tests_f_non_anc_obs_mlw= 80174 *4; n_tests_f_anc_obs_mlw= 59082 *4; n_tests_obs_mlw= 207299 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
if cald=2009.5 then do;
n_tests_m_obs_mlw= 72669 *4; n_tests_f_non_anc_obs_mlw= 79359 *4; n_tests_f_anc_obs_mlw= 70309 *4; n_tests_obs_mlw= 222337 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
***No data on testing in 2009.75;

if cald=2010.0 then do;
n_tests_m_obs_mlw= 139163 *4; n_tests_f_non_anc_obs_mlw= 158986 *4; n_tests_f_anc_obs_mlw= 118221 *4; n_tests_obs_mlw= 416370 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
if cald=2010.25 then do;
n_tests_m_obs_mlw= 160607 *4; n_tests_f_non_anc_obs_mlw= 181889 *4; n_tests_f_anc_obs_mlw= 141456 *4; n_tests_obs_mlw= 483952 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
if cald=2010.5 then do;
n_tests_m_obs_mlw= 147851 *4; n_tests_f_non_anc_obs_mlw= 163961 *4; n_tests_f_anc_obs_mlw= 144024 *4; n_tests_obs_mlw= 455836 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
if cald=2010.75 then do;
n_tests_m_obs_mlw= 123606 *4; n_tests_f_non_anc_obs_mlw= 131846 *4; n_tests_f_anc_obs_mlw= 115152 *4; n_tests_obs_mlw= 370604* 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;

if cald=2011.0 then do;
n_tests_m_obs_mlw= 143914 *4; n_tests_f_non_anc_obs_mlw= 163385 *4; n_tests_f_anc_obs_mlw= 129883 *4; n_tests_obs_mlw= 437182 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
if cald=2011.25 then do;
n_tests_m_obs_mlw= 167057 *4; n_tests_f_non_anc_obs_mlw= 185690 *4; n_tests_f_anc_obs_mlw= 156898 *4; n_tests_obs_mlw= 509645 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
if cald=2011.5 then do;
n_tests_m_obs_mlw= 127451 *4; n_tests_f_non_anc_obs_mlw= 133479 *4; n_tests_f_anc_obs_mlw= 120886 *4; n_tests_obs_mlw= 381816 * 4;
n_tests_w_obs_mlw= n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;
end;
if cald=2011.75 then do;*non ANC women reported (can deduce but don't think it's needed);
n_tests_obs_mlw= 299017* 4; n_tests_m_obs_mlw= 0.33 *299017 *4;n_tests_w_obs_mlw= 0.67 *299017 *4; n_tests_f_anc_obs_mlw= 134909 *4;
end;

if cald=2012.0 then do;
n_tests_obs_mlw= 299017* 4; n_tests_m_obs_mlw= 0.33 *299017 *4;n_tests_w_obs_mlw= 0.67 *299017 *4;n_tests_f_anc_obs_mlw= 128959 *4; 
end;
***No 2012.25 report;
if cald=2012.5 then do;
n_tests_obs_mlw= 579509* 4; n_tests_m_obs_mlw= 0.33 *579509 *4;n_tests_w_obs_mlw= 0.67 *579509 *4;n_tests_f_anc_obs_mlw= 119587 *4; 
end;
if cald=2012.75 then do;
n_tests_obs_mlw= 378560* 4; n_tests_m_obs_mlw= 0.33 *378560 *4;n_tests_w_obs_mlw= 0.67 *378560 *4;n_tests_f_anc_obs_mlw= 111503*4; 
end;

if cald=2013.0 then do;
n_tests_obs_mlw= 460559* 4; n_tests_m_obs_mlw= 0.32 *460559 *4;n_tests_w_obs_mlw= 0.68 *460559 *4;n_tests_f_anc_obs_mlw= 128959 *4; 
end;
if cald=2013.25 then do;
n_tests_obs_mlw= 462334* 4; n_tests_m_obs_mlw= 0.33 *462334 *4;n_tests_w_obs_mlw= 0.67 *462334 *4;n_tests_f_anc_obs_mlw= 113061 *4; 
end;
if cald=2013.5 then do;
n_tests_obs_mlw= 405278* 4; n_tests_m_obs_mlw= 0.34 *405278 *4;n_tests_w_obs_mlw= 0.66 *405278 *4;n_tests_f_anc_obs_mlw= 128022 *4; 
end;
if cald=2013.75 then do;
n_tests_obs_mlw= 374456* 4; n_tests_m_obs_mlw= 0.32 *374456 *4;n_tests_w_obs_mlw= 0.68 *374456 *4;n_tests_f_anc_obs_mlw= 144897 *4; 
end;

if cald=2014.0 then do;
n_tests_obs_mlw= 444365 * 4; n_tests_m_obs_mlw= 0.32 *444365 *4;n_tests_w_obs_mlw= 0.68 * 444365 *4;n_tests_f_anc_obs_mlw= 130257 *4; 
end;
if cald=2014.25 then do;
n_tests_obs_mlw= 435976* 4; n_tests_m_obs_mlw= 0.34 *435976 *4;n_tests_w_obs_mlw= 0.66 *435976 *4;n_tests_f_anc_obs_mlw= 120022 *4; 
end;
if cald=2014.5 then do;
n_tests_obs_mlw= 550425* 4; n_tests_m_obs_mlw= 0.36 *550425 *4;n_tests_w_obs_mlw= 0.64 *550425 *4;n_tests_f_anc_obs_mlw= 135958 *4; 
end;
if cald=2014.75 then do;
n_tests_obs_mlw= 464292* 4; n_tests_m_obs_mlw= 0.34 *464292 *4;n_tests_w_obs_mlw= 0.66 *464292 *4;n_tests_f_anc_obs_mlw= 134985 *4; 
end;

if cald=2015.0 then do;
n_tests_obs_mlw= 500086 * 4; n_tests_m_obs_mlw= 0.33 *500086 *4;n_tests_w_obs_mlw= 0.67 * 500086 *4;n_tests_f_anc_obs_mlw= 148838 *4; 
end;
if cald=2015.25 then do;
n_tests_obs_mlw= 493567* 4; n_tests_m_obs_mlw= 0.35 *493567 *4;n_tests_w_obs_mlw= 0.65 *493567 *4;n_tests_f_anc_obs_mlw= 141212 *4; 
end;
if cald=2015.5 then do;
n_tests_obs_mlw= 625803* 4; n_tests_m_obs_mlw= 0.37 *625803 *4;n_tests_w_obs_mlw= 0.63 *625803 *4;n_tests_f_anc_obs_mlw= 129887 *4; 
end;
if cald=2015.75 then do;
n_tests_obs_mlw= 606558* 4; n_tests_m_obs_mlw= 0.34 *606558 *4;n_tests_w_obs_mlw= 0.66 *606558 *4;n_tests_f_anc_obs_mlw= 137958 *4; 
end;

if cald=2016.0 then do;
n_tests_obs_mlw= 862157* 4; n_tests_m_obs_mlw= 0.34 *862157 *4;n_tests_w_obs_mlw= 0.66 *862157 *4;n_tests_f_anc_obs_mlw= 147765 *4; 
end;
if cald=2016.25 then do;
n_tests_obs_mlw= 876337* 4; n_tests_m_obs_mlw= 0.34 *876337 *4;n_tests_w_obs_mlw= 0.66 *876337 *4;n_tests_f_anc_obs_mlw= 140475 *4; 
end;
if cald=2016.5 then do;
n_tests_obs_mlw= 872393* 4; n_tests_m_obs_mlw= 0.37 *872393 *4;n_tests_w_obs_mlw= 0.63 *872393 *4;n_tests_f_anc_obs_mlw= 146596 *4; 
end;
if cald=2016.75 then do;
n_tests_obs_mlw= 788275* 4; n_tests_m_obs_mlw= 0.35 *788275 *4;n_tests_w_obs_mlw= 0.65 *788275 *4;n_tests_f_anc_obs_mlw= 149150 *4; 
end;

if cald=2017.0 then do;
n_tests_obs_mlw= 982561* 4; n_tests_m_obs_mlw= 0.35 *982561 *4;n_tests_w_obs_mlw= 0.65 *982561 *4;n_tests_f_anc_obs_mlw= 151227 *4; 
end;
if cald=2017.25 then do;
n_tests_obs_mlw= 1018328*4; n_tests_m_obs_mlw= 0.37*1018328 *4;n_tests_w_obs_mlw= 0.63*1018328 *4;n_tests_f_anc_obs_mlw= 148638 *4; 
end;
if cald=2017.5 then do;
n_tests_obs_mlw= 1186676*4; n_tests_m_obs_mlw= 0.40*1186676 *4;n_tests_w_obs_mlw= 0.60*1186676 *4;n_tests_f_anc_obs_mlw= 159751 *4; 
end;
if cald=2017.75 then do;
n_tests_obs_mlw= 977745* 4; n_tests_m_obs_mlw= 0.35 *977745 *4;n_tests_w_obs_mlw= 0.65 *977745 *4;n_tests_f_anc_obs_mlw= 146974 *4; 
end;

if cald=2018.0 then do;
n_tests_obs_mlw= 1185792 * 4; n_tests_m_obs_mlw= 0.36*1185792 *4;n_tests_w_obs_mlw= 0.64*1185792 *4;n_tests_f_anc_obs_mlw= 161570 *4; 
end;
if cald=2018.25 then do;
n_tests_obs_mlw=1133277* 4; n_tests_m_obs_mlw= 0.36*1133277 *4;n_tests_w_obs_mlw= 0.64*1133277 *4;n_tests_f_anc_obs_mlw= 157822 *4; 
end;
if cald=2018.5 then do;
n_tests_obs_mlw= 1210048* 4; n_tests_m_obs_mlw= 0.36*1210048 *4;n_tests_w_obs_mlw= 0.64*1210048 *4;n_tests_f_anc_obs_mlw= 171922 *4; 
end;
if cald=2018.75 then do;
n_tests_obs_mlw= 1106090* 4; n_tests_m_obs_mlw= 0.36*1106090 *4;n_tests_w_obs_mlw= 0.64*1106090 *4;n_tests_f_anc_obs_mlw= 156321 *4; 
end;

if cald=2019.0 then do;
n_tests_obs_mlw= 1117587* 4; n_tests_m_obs_mlw= 0.34*1117587 *4;n_tests_w_obs_mlw= 0.66*1117587 *4;n_tests_f_anc_obs_mlw= 129256 *4; 
end;
if cald=2019.25 then do;
n_tests_obs_mlw= 1007296* 4; n_tests_m_obs_mlw= 0.34*1007296 *4;n_tests_w_obs_mlw= 0.66*1007296 *4;n_tests_f_anc_obs_mlw= 160860 *4; 
end;
if cald=2019.5 then do;
n_tests_obs_mlw= 1019610* 4; n_tests_m_obs_mlw= 0.35*1019610 *4;n_tests_w_obs_mlw= 0.65*1019610 *4;n_tests_f_anc_obs_mlw= 168033 *4; 
end;
if cald=2019.75 then do;
n_tests_obs_mlw= 922473* 4; n_tests_m_obs_mlw= 0.34 *922473 *4;n_tests_w_obs_mlw= 0.66 *922473 *4;n_tests_f_anc_obs_mlw= 157171 *4; 
end;

*No report for 2020.0;
if cald=2020.25 then do;
n_tests_obs_mlw= 634564* 4; n_tests_m_obs_mlw= 0.31 *634564 *4;n_tests_w_obs_mlw= 0.69 *634564 *4;n_tests_f_anc_obs_mlw= 162127 *4; 
end;
if cald=2020.5 then do;
n_tests_obs_mlw= 697991* 4; n_tests_m_obs_mlw= 0.31 *697991 *4;n_tests_w_obs_mlw= 0.69 *697991 *4;n_tests_f_anc_obs_mlw= 155128 *4; 
end;
if cald=2020.75 then do;
n_tests_obs_mlw= 768126* 4; n_tests_m_obs_mlw= 0.33 *788275 *4;n_tests_w_obs_mlw= 0.67 *788275 *4;n_tests_f_anc_obs_mlw= 150492 *4; 
end;

if cald=2021.0 then do;
n_tests_obs_mlw= 670567* 4; n_tests_m_obs_mlw= 0.33 *670567 *4;n_tests_w_obs_mlw= 0.67 *670567 *4;n_tests_f_anc_obs_mlw= 155575 *4; 
end;
if cald=2021.25 then do;
n_tests_obs_mlw= 655092* 4; n_tests_m_obs_mlw= 0.33 *655092 *4;n_tests_w_obs_mlw= 0.67 *655092 *4;n_tests_f_anc_obs_mlw= 150647 *4; 
end;
if cald=2021.5 then do;
n_tests_obs_mlw= 642325* 4; n_tests_m_obs_mlw= 0.33 *642325 *4;n_tests_w_obs_mlw= 0.67 *642325 *4;n_tests_f_anc_obs_mlw= 156552 *4; 
end;
if cald=2021.75 then do;
n_tests_obs_mlw= 684267* 4; n_tests_m_obs_mlw= 0.33 *684267 *4;n_tests_w_obs_mlw= 0.67 *684267 *4;n_tests_f_anc_obs_mlw= 157139 *4; 
end;

if cald=2022.0 then do;
n_tests_obs_mlw= 717316 * 4; n_tests_m_obs_mlw= 0.32 *717316 *4;n_tests_w_obs_mlw= 0.68 *717316 *4;n_tests_f_anc_obs_mlw= 167127 *4; 
end;
***From this point there are no reports available, only raw Excel sheets which I have used to calculate the numbers;
***HTS Site Report Sheet, columns L, M and N;
if cald=2022.25 then do;
n_tests_obs_mlw= 743686* 4; n_tests_m_obs_mlw= 239513 *4;n_tests_w_obs_mlw= 504173 *4;n_tests_f_anc_obs_mlw= 182824 *4; 
end;
if cald=2022.5 then do;
n_tests_obs_mlw=1019610* 4; n_tests_m_obs_mlw= 355091 *4;n_tests_w_obs_mlw= 664519 *4;n_tests_f_anc_obs_mlw= 216054 *4; 
end;
if cald=2022.75 then do;
n_tests_obs_mlw= 740631* 4; n_tests_m_obs_mlw= 235936 *4;n_tests_w_obs_mlw= 504675 *4;n_tests_f_anc_obs_mlw= 192521 *4; 
end;

if cald=2023.0 then do;
n_tests_obs_mlw= 799051 * 4; n_tests_m_obs_mlw= 248835 *4;n_tests_w_obs_mlw= 550216 *4;n_tests_f_anc_obs_mlw= 204435 *4; 
end;
if cald=2023.25 then do;
n_tests_obs_mlw= 828974* 4; n_tests_m_obs_mlw= 258904 *4;n_tests_w_obs_mlw= 570070 *4;n_tests_f_anc_obs_mlw= 197016 *4; 
end;
if cald=2023.5 then do;
n_tests_obs_mlw=870741* 4; n_tests_m_obs_mlw= 277603 *4;n_tests_w_obs_mlw= 593138 *4;n_tests_f_anc_obs_mlw= 192923*4; 
end;
if cald=2023.75 then do;
n_tests_obs_mlw= 907999* 4; n_tests_m_obs_mlw= 284697 *4;n_tests_w_obs_mlw= 623302 *4;n_tests_f_anc_obs_mlw= 203475 *4; 
end;

if cald=2024.0 then do;
n_tests_obs_mlw= 1060797 * 4; n_tests_m_obs_mlw= 346623 *4;n_tests_w_obs_mlw= 714174 *4;n_tests_f_anc_obs_mlw= 211041 *4; 
end;
if cald=2024.25 then do;
n_tests_obs_mlw= 1034109* 4; n_tests_m_obs_mlw= 340701 *4;n_tests_w_obs_mlw= 693408 *4;n_tests_f_anc_obs_mlw= 195075 *4; 
end;
if cald=2024.5 then do;
n_tests_obs_mlw=1071342* 4; n_tests_m_obs_mlw= 360657 *4;n_tests_w_obs_mlw= 710685 *4;n_tests_f_anc_obs_mlw= 206720*4; 
end;
if cald=2024.75 then do;
n_tests_obs_mlw= 1008762* 4; n_tests_m_obs_mlw= 326413 *4;n_tests_w_obs_mlw= 682349 *4;n_tests_f_anc_obs_mlw= 205360 *4; 
end;

if cald=2025.0 then do;
n_tests_obs_mlw= 814386 * 4; n_tests_m_obs_mlw= 256909 *4;n_tests_w_obs_mlw= 557477 *4;n_tests_f_anc_obs_mlw= 194991 *4; 
end;
if cald=2025.25 then do;
n_tests_obs_mlw= 890254* 4; n_tests_m_obs_mlw= 282119 *4;n_tests_w_obs_mlw= 608135 *4;n_tests_f_anc_obs_mlw= 197502 *4; 
end;




***Where are these data from - looks similar to above -  suggest removing as replaced by the above?;
if cald=2011.5 then do; n_tests_m_obs_mlw= 489100; n_tests_f_non_anc_obs_mlw= 488583; n_tests_f_anc_obs_mlw= 503264;
						n_tests_obs_mlw= n_tests_m_obs_mlw + n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw ;end;
if cald=2014.5 then do; n_tests_m_obs_mlw= 539486; n_tests_f_non_anc_obs_mlw= 475691; n_tests_f_anc_obs_mlw=604001;
						n_tests_obs_mlw= n_tests_m_obs_mlw + n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw;end;
if cald=2015.5 then do; n_tests_m_obs_mlw= 701041; n_tests_f_non_anc_obs_mlw= 715458; n_tests_f_anc_obs_mlw= 595720;
						n_tests_obs_mlw= n_tests_m_obs_mlw + n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw ;end;
if cald=2016.5 then do; n_tests_m_obs_mlw= 993028; n_tests_f_non_anc_obs_mlw= 1291520 ;n_tests_f_anc_obs_mlw= 636122 ;
						n_tests_obs_mlw= n_tests_m_obs_mlw + n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw ;end;

*** Where are these data from? Again, possibly rounded up from the quartely reports in which case remove as replaced by
	exact numbers above?;
if cald=2016.0 then n_tests_obs_mlw = 832000 * 4;
if cald=2016.25 then n_tests_obs_mlw = 838000 * 4 ;
if cald=2016.5 then n_tests_obs_mlw = 832000  * 4;
if cald=2016.75 then n_tests_obs_mlw = 750000 * 4 ;

if cald=2017.0 then n_tests_obs_mlw =  936000 * 4 ;
if cald=2017.25 then n_tests_obs_mlw =  974000 * 4 ;
if cald=2017.5 then n_tests_obs_mlw = 1142000  * 4;
if cald=2017.75 then n_tests_obs_mlw =  939000 * 4 ;

if cald=2018.00 then n_tests_obs_mlw = 1098000 * 4 ;
if cald=2018.25 then n_tests_obs_mlw = 1094000 * 4 ;
if cald=2018.50 then n_tests_obs_mlw = 1170000 * 4 ;
if cald=2018.75 then n_tests_obs_mlw = 1071000 * 4 ;

if cald=2019.00 then n_tests_obs_mlw = 1082000 * 4 ;
if cald=2019.25 then n_tests_obs_mlw =  974000 * 4 ;
if cald=2019.50 then n_tests_obs_mlw =  987000 * 4 ;
if cald=2019.75 then n_tests_obs_mlw =  992000 * 4 ;

if cald=2020.00 then n_tests_obs_mlw =  941000 * 4 ;
if cald=2020.25 then n_tests_obs_mlw =  613000 * 4 ;
if cald=2020.50 then n_tests_obs_mlw =  675000 * 4 ;
if cald=2020.75 then n_tests_obs_mlw =  743000 * 4 ;

if cald=2021.00 then n_tests_obs_mlw= 670567 * 4 ;
if cald=2021.00 then n_tests_m_obs_mlw= 670567 * 0.33 * 4;
if cald=2021.00 then n_tests_f_obs_mlw= 670567 * 0.67 * 4;


***Replace with above?;
if cald=2022.50 then n_tests_obs_mlw= 3000000    ;  * this is the number of tests in the whole year ;
if cald=2022.50 then n_tests_obs_mlw= 3400000    ;  * this is the number of tests in the whole year ;
if cald=2022.50 then n_tests_f_anc_obs_mlw = 630000           ; * this is the annual number of tests;
if cald=2023.50 then n_tests_f_anc_obs_mlw = 690000           ; * this is the annual number of tests;




***EVER TESTED - where are these data from? ; 
if cald=2004 then ever_tested_w_1549_obs_mlw= 0.17;
if cald=2004 then ever_tested_m_1549_obs_mlw= 0.17;
if cald=2010 then ever_tested_w_1549_obs_mlw= 0.716;
if cald=2010 then ever_tested_m_1549_obs_mlw= 0.509; *15-54;



**************************stop here;





* these are annual totals, put at 0.5 through the year;
if cald=2004.5 then n_diag_obs_mlw= 64000 ;
if cald=2005.5 then n_diag_obs_mlw= 59041 ;
if cald=2006.5 then n_diag_obs_mlw= 91382 ;
if cald=2007.5 then n_diag_obs_mlw= 110204 ;
if cald=2008.5 then n_diag_obs_mlw= 124458 ;
if cald=2009.5 then n_diag_obs_mlw= 125614 ;
if cald=2010.5 then n_diag_obs_mlw= 179115 ;
if cald=2011.5 then n_diag_obs_mlw= 166705 ;
if cald=2012.5 then n_diag_obs_mlw= 146210 ;
if cald=2013.5 then n_diag_obs_mlw= 136743 ;
if cald=2014.5 then n_diag_obs_mlw= 116959 ;
if cald=2015.5 then n_diag_obs_mlw= 124280 ;

* these below are multiplied by 4 so expressed as annual number at each time point;
if cald=2016.00 then n_diag_obs_mlw= 41901 * 4     ;
if cald=2016.25 then n_diag_obs_mlw= 39176 * 4      ;
if cald=2016.50 then n_diag_obs_mlw= 36253 * 4      ;
if cald=2016.75 then n_diag_obs_mlw= 32987 * 4      ; 

if cald=2017.00 then n_diag_obs_mlw= 41113 * 4      ;
if cald=2017.25 then n_diag_obs_mlw= 37562 * 4      ;
if cald=2017.50 then n_diag_obs_mlw= 36886 * 4      ;
if cald=2017.75 then n_diag_obs_mlw= 32052 * 4      ; 

if cald=2018.00 then n_diag_obs_mlw= 38048 * 4      ;
if cald=2018.25 then n_diag_obs_mlw= 34414 * 4      ;
if cald=2018.50 then n_diag_obs_mlw= 36052 * 4      ;
if cald=2018.75 then n_diag_obs_mlw= 31089 * 4      ; 

if cald=2019.00 then n_diag_obs_mlw= 32313 * 4      ;
if cald=2019.25 then n_diag_obs_mlw= 28912 * 4      ;
if cald=2019.50 then n_diag_obs_mlw= 28376 * 4      ;
if cald=2019.75 then n_diag_obs_mlw= 26276 * 4      ; 

if cald=2020.00 then n_diag_obs_mlw= 28852 * 4      ;
if cald=2020.25 then n_diag_obs_mlw= 18882 * 4      ;
if cald=2020.50 then n_diag_obs_mlw= 20206 * 4      ;
if cald=2020.75 then n_diag_obs_mlw= 22634 * 4      ; 

if cald=2021.00 then n_diag_obs_mlw= 20078 * 4; * note reports say multiply this by about 0.5 
due to correction of testing in people previously diagnosed ;

* this is number at end of year;

if cald=2005.75 then n_onart_obs_mlw= 26705 ;
if cald=2008.75 then n_onart_obs_mlw= 135681 ;
if cald=2011.75 then n_onart_obs_mlw= 294585 ;
if cald=2014.75 then n_onart_obs_mlw= 489775 ;
if cald=2015.75 then n_onart_obs_mlw= 540071 ;
if cald=2016.75 then n_onart_obs_mlw= 625689      ;  
if cald=2017.75 then n_onart_obs_mlw= 700360   ;  
if cald=2018.75 then n_onart_obs_mlw= 759782  ;
if cald=2019.75 then n_onart_obs_mlw= 787609  ;
if cald=2020.75 then n_onart_obs_mlw= 818218  ; 
if cald=2021.75 then n_onart_obs_mlw= 826138 ; * adults ;

/*

from spectrum aims file

2004	2005	2006	2007	2008	2009	2010	2011	2012	2013	2014	2015	2016	2017	2018	2019	2020
																
3,801	9,873	19,491	32,147	51,998	67,694	85,570	106,407	127,612	146,657	167,260	185,256	212,117	241,127	262,449	267,830	275,935   men
6,192	17,222	35,090	59,139	91,352	119,024	149,650	196,873	252,412	296,740	339,462	374,506	425,914	464,023	506,730	517,118	542,294   women
9,993	27,095	54,581	91,286	143,350	186,718	235,220	303,280	380,024	443,397	506,722	559,762	638,031	705,150	769,179	784,948	818,229   all adults

*/

if cald=2005.50 then n_art_start_m_obs_mlw= 9505 ;
if cald=2005.50 then n_art_start_f_obs_mlw= 14836 ;
if cald=2008.50 then n_art_start_m_obs_mlw= 26482 ;
if cald=2008.50 then n_art_start_f_obs_mlw= 38237 ;
if cald=2011.50 then n_art_start_m_obs_mlw= 30244 ;
if cald=2011.50 then n_art_start_f_obs_mlw= 58641 ;
if cald=2014.50 then n_art_start_m_obs_mlw= 35792 ;
if cald=2014.50 then n_art_start_f_obs_mlw= 65018 ;
if cald=2015.50 then n_art_start_m_obs_mlw= 32919 ;
if cald=2015.50 then n_art_start_f_obs_mlw= 58259 ;

* note below include children so adult figure ~ 90%; * * 4 so expressed as number per year ;

if cald=2016.00 then n_art_start_obs_mlw= 28052 * 4     ;
if cald=2016.25 then n_art_start_obs_mlw= 28657 * 4     ;
if cald=2016.50 then n_art_start_obs_mlw= 41994 * 4     ;
if cald=2016.75 then n_art_start_obs_mlw= 30221 * 4     ;

if cald=2017.00 then n_art_start_obs_mlw= 35762 * 4     ;
if cald=2017.25 then n_art_start_obs_mlw= 32573 * 4     ;
if cald=2017.50 then n_art_start_obs_mlw= 31968 * 4     ;
if cald=2017.75 then n_art_start_obs_mlw= 29245 * 4     ;

if cald=2018.00 then n_art_start_obs_mlw= 35277 * 4     ;
if cald=2018.25 then n_art_start_obs_mlw= 31371 * 4     ;
if cald=2018.50 then n_art_start_obs_mlw= 32315 * 4     ;
if cald=2018.75 then n_art_start_obs_mlw= 28858 * 4     ;

if cald=2019.00 then n_art_start_obs_mlw= 41868 * 4     ;
if cald=2019.25 then n_art_start_obs_mlw= 28318 * 4     ;
if cald=2019.50 then n_art_start_obs_mlw= 27624 * 4     ;
if cald=2019.75 then n_art_start_obs_mlw= 25354 * 4     ;

if cald=2020.00 then n_art_start_obs_mlw= 27737 * 4     ;
if cald=2020.25 then n_art_start_obs_mlw= 18804 * 4     ;
if cald=2020.50 then n_art_start_obs_mlw= 19384 * 4     ;
if cald=2020.75 then n_art_start_obs_mlw= 21655 * 4     ;

if cald=2021.25 then n_art_start_obs_mlw= 19682 * 4;

if cald=2004.5 then prevalence1549_obs_mlw= 0.127;
if cald=2004.5 then prevalence1549m_obs_mlw= 0.108;
if cald=2004.5 then prevalence1549w_obs_mlw= 0.144;

if cald=2010.5 then prevalence1549_obs_mlw= 0.106;
if cald=2010.5 then prevalence1549m_obs_mlw= 0.081;
if cald=2010.5 then prevalence1549w_obs_mlw= 0.129;

if cald=2016.0 then prevalence1549_obs_mlw= 0.094; *between phia and dhs;
if cald=2016.0 then prevalence1549m_obs_mlw= 0.071; *between phia and dhs;
if cald=2016.0 then prevalence1549w_obs_mlw= 0.115; *between phia and dhs;


if cald=2016.5 then incidence1549_obs_mlw= 0.32;

if cald=2010.5 then prevalence1525w_obs_mlw= 0.052;
if cald=2010.5 then prevalence2535w_obs_mlw= 0.164;
if cald=2010.5 then prevalence3545w_obs_mlw= 0.224;

if cald=2010.5 then prevalence1525m_obs_mlw= 0.019;
if cald=2010.5 then prevalence2535m_obs_mlw= 0.087;
if cald=2010.5 then prevalence3545m_obs_mlw= 0.192;
if cald=2010.5 then prevalence4555m_obs_mlw= 0.141;

* if cald=1999.5 then prevalence1549_obs_mlw = 0.164;

if cald=1992.5 then prevalence1549_obs_mlw = 0.108;  * spectrum aim outputs ;  * current median = 0.095 ;
if cald=1995.5 then prevalence1549_obs_mlw = 0.140;  * spectrum aim outputs ;  * current median = 0.147 ;
if cald=1998.5 then prevalence1549_obs_mlw = 0.152;  * spectrum aim outputs ;  * current median = 0.175 ;


if cald=2014.5 then p_onart_vl1000_obs_mlw= 0.84;
if cald=2015.5 then p_onart_vl1000_obs_mlw= 0.86;
if cald=2016.5 then p_onart_vl1000_obs_mlw= 0.90;

if cald=2021.00 then p_onart_vl1000_obs_mlw= 0.96;

if cald=2014.5 then n_secondline_obs_mlw= 5700 ;
if cald=2015.5 then n_secondline_obs_mlw= 6758 ; * 2nd  quarter of 2015;
if cald=2016.5 then n_secondline_obs_mlw= 8811 ; * 2nd  quarter of 2016;

* Population size;
* merged pop_size_obs_mw into d;

* Calibration thresholds;
if cald=1998.5 then do; prevalence1549_threshold_lower=0.08; prevalence1549_threshold_higher=0.19; end;
if cald=1999.5 then do; prevalence1549_threshold_lower=0.08; prevalence1549_threshold_higher=0.19; end;
if cald=2004.5 then do; prevalence1549_threshold_lower=0.07; prevalence1549_threshold_higher=0.20; end;
if cald=2016.5 then do; prevalence1549_threshold_lower=0.07; prevalence1549_threshold_higher=0.13; end;
if cald=2020 then p_vl1000_threshold=0.75;

prevalence1549_threshold=prevalence1549_threshold_lower+0.5*(prevalence1549_threshold_higher-prevalence1549_threshold_lower);


if cald = 2021.5 then n_prep_obs_mlw = 3200 ;  * from data in template - from implementing partners;
if cald = 2022.5 then n_prep_obs_mlw = 9600 ;  * from data in template - from implementing partners;
if cald = 2023.5 then n_prep_obs_mlw = 36000 ;  * from data in template - from implementing partners;


if cald = 2019.5 then n_self_tested_obs_mlw = 101000; * this is annual number;  
if cald = 2020.5 then n_self_tested_obs_mlw = 561000; * this is annual number;  
if cald = 2021.5 then n_self_tested_obs_mlw = 827000; * this is annual number;  
if cald = 2022.5 then n_self_tested_obs_mlw = 750000; * this is annual number;  
if cald = 2023.5 then n_self_tested_obs_mlw = 802000; * this is annual number;  

if cald = 2019.5 then n_vmmc_obs_mlw = 141000; * this is annual number;  
if cald = 2020.5 then n_vmmc_obs_mlw = 69000; * this is annual number;  
if cald = 2021.5 then n_vmmc_obs_mlw = 142000; * this is annual number;  
if cald = 2022.5 then n_vmmc_obs_mlw = 135000; * this is annual number;  
if cald = 2023.5 then n_vmmc_obs_mlw = 95000; * this is annual number;  

if cald = 2019.5 then n_vm_obs_mlw = 410000; * this is annual number;  
if cald = 2020.5 then n_vm_obs_mlw = 403000; * this is annual number;  
if cald = 2021.5 then n_vm_obs_mlw = 455000; * this is annual number;  
if cald = 2022.5 then n_vm_obs_mlw = 351000; * this is annual number;  
if cald = 2023.5 then n_vm_obs_mlw = 458000; * this is annual number;  
