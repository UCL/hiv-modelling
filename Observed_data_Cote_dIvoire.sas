*COTE dIVOIRE observed data;

***********************
POPULATION;
***********************
*Source: https://worldpopulationreview.com/countries/ivory-coast-population
		 https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=CI&view=chart
	    -->41% of the population are under 15 so multiply World Population numbers by 59%;
		
if cald=1990 then o_pop15plus=11.9*0.59;
if cald=1995 then o_pop15plus=14.3*0.59;
if cald=2000 then o_pop15plus=16.8*0.59;
if cald=2005 then o_pop15plus=19.0*0.59;
if cald=2010 then o_pop15plus=21.1*0.59;
if cald=2015 then o_pop15plus=23.6*0.59;
if cald=2020 then o_pop15plus=26.8*0.59;
if cald=2025 then o_pop15plus=30.3*0.59;
if cald=2030 then o_pop15plus=34.8*0.59;
if cald=2035 then o_pop15plus=38.3*0.59;
if cald=2040 then o_pop15plus=42.6*0.59;
if cald=2045 then o_pop15plus=46.9*0.59;
if cald=2050 then o_pop15plus=51.4*0.59;

*Source: https://countrymeters.info/en/Cote_D%27ivoire;
o_pop15plus_m=o_pop15plus*0.509;
o_pop15plus_w=o_pop15plus*0.491;

***2024 population = 29m * 0.59 = 17.1m;

***********************
START OF EPIDEMIC;
***********************
* Source: Rapid emergence of AIDS in Abidjan, Ivory Coast;
o_epidemic_start=1988;

***********************
HIV PREVALENCE;
***********************
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

