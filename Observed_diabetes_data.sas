***Calibration data;

*Smoking;
* Source: https://iris.who.int/server/api/core/bitstreams/2eca3aea-b772-4272-a2ae-6fa26f3f9cd5/content;
if cald= 2000 then do; smoking_m_who=28.7;smoking_w=7.0;end;
if cald= 2005 then do; smoking_m_who=25.2;smoking_w=5.6;end;
if cald= 2010 then do; smoking_m_who=22.3;smoking_w=4.4;end;
if cald= 2015 then do; smoking_m_who=20.0;smoking_w=3.6;end;
if cald= 2020 then do; smoking_m_who=18.0;smoking_w=2.9;end;
if cald= 2025 then do; smoking_m_who=16.6;smoking_w=2.5;end;


***Waist-hip ratio;

* Source: Kamadjeu 2006, Anthropometry measures and prevalence of obesity in the urban adult population of Cameroon;
if cald = 2003 then do;
	whr_cam1534m = 0.83; whr_cam1534w = 0.80;
	whr_cam3544m = 0.89; whr_cam3544w = 0.83; 
	whr_cam4554m = 0.91; whr_cam4554w = 0.86; 
	whr_cam55plus_m = 0.92; whr_cam55plus_w = 0.88;
	whr_cam15plus_m = 0.86; whr_cam15plus_w = 0.82;

end;

* Source: Haregu 2016, Measurement of overweight and obesity an urban slum setting in sub-Saharan Africa;
if cald = 2008.5 then do;
	whr_kenya45m = 0.88; whr_kenya45w = 0.86; whr_kenya45_ = 0.87; 
	whr_kenya4560m = 0.91; whr_kenya4560w = 0.88; whr_kenya4560_ = 0.89; 
	whr_kenya4560plus_m = 0.93; whr_kenya4560plus_w = 0.90; whr_kenya4560_plus = 0.92; 
	whr_kenya_m = 0.89; whr_kenya_w = 0.87; whr_kenya_ = 0.88;
end;

* Source: Ghana Steps Report 2023, page 103;
if cald = 2023 then do;
	whr_ghana1829m = 0.8; whr_ghana1829w = 0.8; 
	whr_ghana3044m = 0.9; whr_ghana3044w = 0.9;
	whr_ghana4559m = 0.9; whr_ghana4559w = 0.9; 
	whr_ghana6069m = 0.9; whr_ghana6069w = 0.9;
	whr_ghana18plus_m = 0.9; whr_ghana18plus_w = 0.9;

end;

* Source:Ekoru 2017, Deriving an optimal threshold of waist circumference for detecting cardiometabolic risk in sub-Saharan Africa;
if cald= 2014 then do;
	whr_ssa_m=0.89;whr_ssa_w=0.85;whr_ssa_all=0.87;
end;
