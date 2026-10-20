***Defining a BMI for everyone. 
***Start with a baseline gender specific BMI and then apply risk factors based on age,  smoking, urban/rural, inactivity and diet;


*BMI;
*Estimate of rural BMIs (i.e. in 1985) across 10 representative countries in SSA in those under 30;
*Source: https://ncdrisc.org/data-downloads-adiposity.html;
*base_bmi_m;				base_bmi_m = rand('normal', 20.0, 2.2);
*base_bmi_w;				base_bmi_w = rand('normal', 21.0, 2.2);

*Age specific BMI fold factor;
*Source: (NCD Risk Factor Collaboration (NCD-RisC) Africa Working Group 2017);

*fold_age_bmi1529; 	fold_age_bmi1529 = 1.00;
*fold_age_bmi3039; 	fold_age_bmi3039 = 1.02;
*fold_age_bmi4049; 	fold_age_bmi4049 = 1.03;
*fold_age_bmi5059; 	fold_age_bmi5059 = 1.05;
*fold_age_bmi60pl; 	fold_age_bmi60pl = 1.04;

*Smoking - conditional on age and gender;
*Source: WHO global report on trends in prevalence of tobacco use 2000?2024  and projections 2025?2030;
 
*Smoking status at start of simulation;
*prob_smoke_m;				%sample(prob_smoke_m, 0.30 0.35 0.40); *in men;
*fold_prob_smoke_w;			%sample(fold_prob_smoke_w, 0.20 0.33 0.50);

*prob_start_smoke_m;		%sample(prob_start_smoke_m, 0.0002 0.0003 0.0004); *in men;
*prob_start_smoke;			prob_start_smoke=prob_start_smoke_m * fold_prob_smoke_w;
*prob_stop_smoke;			prob_stop_smoke=%sample(prob_stop_smoke_m, 0.0005 0.001 0.0015);

*Urban/rural;
***Urban/rural - quite a wide range of urban pop but on average 45% in SSA is urban;
*Source: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS?locations=ZG&name_desc=false;

*prob_urban;				prob_urban = 0.30 + (rand('uniform')*0.20);

*******************************************;

***PERSON LEVEL VARIATIONS AT START OF FOLLOW UP IN 1989 - SECTION 2;

*BMI;
if gender=1 then base_bmi = base_bmi_m;
if gender=2 then base_bmi = base_bmi_w;

if 15 le age lt 30 then base_bmi = base_bmi * fold_age_bmi1529;
if 30 le age le 39 then base_bmi = base_bmi * fold_age_bmi3039;
if 40 le age le 49 then base_bmi = base_bmi * fold_age_bmi4049;
if 50 le age le 59 then base_bmi = base_bmi * fold_age_bmi5059;
if age ge 60 	   then base_bmi = base_bmi * fold_age_bmi60pl;


*smoking;;
if gender=1 then prob_smoke = prob_smoke_m;
if gender=2 then prob_smoke = prob_smoke_m * fold_prob_smoke_w;
if (. < age < 25) or (age ge 55) then prob_smoke = prob_smoke * 0.80;*reduced probability for younger and older ages;

a=rand('uniform');
smoke=0;if a < prob_smoke then smoke=1;


***1989;
a=rand('uniform');
urban=0; if a < prob_urban then urban=1;




***In 1989, set BMIs for everyone (leave out diet and physical activity here for simplicity);
*Source for 15-17 years olds:https://ncdrisc.org/data-downloads-adiposity-urban-rural-ado.html - NCD_RisC_Nature_2023_BMI_child_adolescent_region;
*Source for 18+: https://ncdrisc.org/data-downloads-adiposity-urban-rural.html - BMI NCD_RisC_Nature_2019_male_age_specific_countries_calculated averages in 1989;
*Using the NCDRisk data, compute average BMI for all SSA countries and their SD, then apply a within individual estimated SD;
*This was done by filtering the NCD risk sheet by sex and then asking AI to compute means and SD for 1989 across settings;

if urban=1 then do;
  do until (14.0 le bmi le 60.0);
	if gender = 1 then do;
	  
	    if age = 15          then do; bmi = rand('Normal', 17.895, 2.20); end; 
	    if age = 16          then do; bmi = rand('Normal', 18.497, 2.20); end;  
	    if age = 17          then do; bmi = rand('Normal', 19.065, 2.20); end;    
	    if 18 le age le 19   then do; bmi = rand('Normal', 20.244, 2.50); end;
	    if 20 le age lt 25   then do; bmi = rand('Normal', 20.746, 2.50); end;
	    if 25 le age lt 30   then do; bmi = rand('Normal', 21.318, 2.50); end;
	    if 30 le age lt 35   then do; bmi = rand('Normal', 21.738, 2.50); end;
	    if 35 le age lt 40   then do; bmi = rand('Normal', 22.022, 2.50); end;
	    if 40 le age lt 45   then do; bmi = rand('Normal', 22.189, 2.50); end;
	    if 45 le age lt 50   then do; bmi = rand('Normal', 22.256, 2.50); end;
	    if 50 le age lt 55   then do; bmi = rand('Normal', 22.236, 2.50); end;
	    if 55 le age lt 60   then do; bmi = rand('Normal', 22.133, 2.50); end;
	    if 60 le age lt 65   then do; bmi = rand('Normal', 21.953, 2.50); end;
	    if 65 le age lt 70   then do; bmi = rand('Normal', 21.711, 2.50); end;
	    if 70 le age lt 75   then do; bmi = rand('Normal', 21.431, 2.50); end;
	    if 75 le age lt 80   then do; bmi = rand('Normal', 21.137, 2.50); end;
	    if 80 le age lt 85   then do; bmi = rand('Normal', 20.853, 2.50); end;
	    if       85 le age   then do; bmi = rand('Normal', 20.544, 2.50); end;
	end;

	if gender=2 then do;
		if age=15          then do; bmi = rand('Normal', 20.024, 2.20); end; 
	    if age=16          then do; bmi = rand('Normal', 20.598, 2.20); end;  
	    if age=17          then do; bmi = rand('Normal', 21.038, 2.20); end;    
	    if 18 le age le 19 then do; bmi = rand('Normal', 21.560, 2.50); end;
	    if 20 le age lt 25 then do; bmi = rand('Normal', 22.013, 2.50); end;
	    if 25 le age lt 30 then do; bmi = rand('Normal', 22.628, 2.50); end;
	    if 30 le age lt 35 then do; bmi = rand('Normal', 23.174, 2.50); end;
	    if 35 le age lt 40 then do; bmi = rand('Normal', 23.616, 2.50); end;
	    if 40 le age lt 45 then do; bmi = rand('Normal', 23.920, 2.50); end;
	    if 45 le age lt 50 then do; bmi = rand('Normal', 24.053, 2.50); end;
	    if 50 le age lt 55 then do; bmi = rand('Normal', 24.014, 2.50); end;
	    if 55 le age lt 60 then do; bmi = rand('Normal', 23.835, 2.50); end;
	    if 60 le age lt 65 then do; bmi = rand('Normal', 23.547, 2.50); end;
	    if 65 le age lt 70 then do; bmi = rand('Normal', 23.176, 2.50); end;
	    if 70 le age lt 75 then do; bmi = rand('Normal', 22.741, 2.50); end;
	    if 75 le age lt 80 then do; bmi = rand('Normal', 22.260, 2.50); end;
	    if 80 le age lt 85 then do; bmi = rand('Normal', 21.752, 2.50); end;
	    if       85 le age then do; bmi = rand('Normal', 21.092, 2.50); end;
	end;
  end;
end;

if urban = 0 then do;
  do until (14.0 le bmi le 60.0);
	if gender = 1 then do;
    	if age = 15          then do; bmi = rand('Normal', 17.341, 2.20); end; 
    	if age = 16          then do; bmi = rand('Normal', 17.954, 2.20); end;  
    	if age = 17          then do; bmi = rand('Normal', 18.536, 2.20); end;    
    	if 18 le age le 19   then do; bmi = rand('Normal', 19.533, 2.50); end;
    	if 20 le age lt 25   then do; bmi = rand('Normal', 19.865, 2.50); end;
   		if 25 le age lt 30   then do; bmi = rand('Normal', 20.258, 2.50); end;
    	if 30 le age lt 35   then do; bmi = rand('Normal', 20.558, 2.50); end;
    	if 35 le age lt 40   then do; bmi = rand('Normal', 20.764, 2.50); end;
    	if 40 le age lt 45   then do; bmi = rand('Normal', 20.879, 2.50); end;
    	if 45 le age lt 50   then do; bmi = rand('Normal', 20.905, 2.50); end;
    	if 50 le age lt 55   then do; bmi = rand('Normal', 20.846, 2.50); end;
    	if 55 le age lt 60   then do; bmi = rand('Normal', 20.714, 2.50); end;
    	if 60 le age lt 65   then do; bmi = rand('Normal', 20.518, 2.50); end;
    	if 65 le age lt 70   then do; bmi = rand('Normal', 20.277, 2.50); end;
    	if 70 le age lt 75   then do; bmi = rand('Normal', 20.016, 2.50); end;
    	if 75 le age lt 80   then do; bmi = rand('Normal', 19.764, 2.50); end;
    	if 80 le age lt 85   then do; bmi = rand('Normal', 19.546, 2.50); end;
    	if       85 le age   then do; bmi = rand('Normal', 19.359, 2.50); end;
	end;

	if gender = 2 then do;
	    if age = 15          then do; bmi = rand('Normal', 19.115, 2.20); end; 
	    if age = 16          then do; bmi = rand('Normal', 19.705, 2.20); end;  
	    if age = 17          then do; bmi = rand('Normal', 20.156, 2.20); end;    
	    if 18 le age le 19   then do; bmi = rand('Normal', 20.922, 2.50); end;
	    if 20 le age lt 25   then do; bmi = rand('Normal', 20.971, 2.50); end;
	    if 25 le age lt 30   then do; bmi = rand('Normal', 21.125, 2.50); end;
	    if 30 le age lt 35   then do; bmi = rand('Normal', 21.324, 2.50); end;
	    if 35 le age lt 40   then do; bmi = rand('Normal', 21.509, 2.50); end;
	    if 40 le age lt 45   then do; bmi = rand('Normal', 21.619, 2.50); end;
	    if 45 le age lt 50   then do; bmi = rand('Normal', 21.596, 2.50); end;
	    if 50 le age lt 55   then do; bmi = rand('Normal', 21.435, 2.50); end;
	    if 55 le age lt 60   then do; bmi = rand('Normal', 21.187, 2.50); end;
	    if 60 le age lt 65   then do; bmi = rand('Normal', 20.899, 2.50); end;
	    if 65 le age lt 70   then do; bmi = rand('Normal', 20.600, 2.50); end;
	    if 70 le age lt 75   then do; bmi = rand('Normal', 20.292, 2.50); end;
	    if 75 le age lt 80   then do; bmi = rand('Normal', 19.977, 2.50); end;
	    if 80 le age lt 85   then do; bmi = rand('Normal', 19.658, 2.50); end;
	    if       85 le age   then do; bmi = rand('Normal', 19.245, 2.50); end;
	end;
 end;
end;

*Have not included diet or physical activity here for simplicity;
***********;



*BMI for 15 year olds in rural settings, in 1990;

***BMI risk factors
Age
Gender
Urban/rural
Diet
Exercise
Smoking/Alcohol - decided not to include these so far;

**Diabetes risk factors - mostly captured under BMI but may have residual effects, and also consider
Blood pressure
Cholesterol
Family history
Medical conditions;
;

***At age 15;
*I don't think we can define this at the top because using caldate?;

prob_urban = 0.30 + (rand('uniform') * 0.20) + (0.0050 * (caldate&j-1989));*the latter bit here applies a calendar time increase to probability of urban;

a = rand('uniform');
urban = 0; 
if a < prob_urban then urban = 1;

* Source: NCD_RisC_Nature_2023_BMI_child_adolescent_region - same as for 15-18 year olds in Section 2;
* I took the average BMI for a 15 year old in rural SSA in 1990 and added a calendar year effect (since BMI has increased over time even in rural settings);
*Gender;

if gender=1 then do;
do until (14.0 le bmi_15_m le 60.0);
    bmi_15_m = rand('normal', 17.3, 2.2) + (0.005 * (caldate&j - 1989));
end;
end;

if gender=2 then do;
do until (14.0 le bmi_15_w le 60.0);
    bmi_15_w = rand('normal', 19.1, 2.2) + (0.005 * (caldate&j - 1989));
end;
end;

*Urban/rural;

*urban bmi in boys is ~ 0.3 times higher than rural and 0.5 in women;
urban_fold_bmi_m = 1; if urban=1 then urban_fold_bmi_m = 1.03;
urban_fold_bmi_w = 1; if urban=1 then urban_fold_bmi_w = 1.05;

***Diet: 1=low risk, 2=moderate risk, 3-high risk - conditional on urban/rural;
* Source: Westbury 2021;
%sample(diet_urban, 1 2 3, 0.25 0.45 0.30);
%sample(diet_rural 1 2 3, 0.45 0.40 0.15);

%sample(low_risk_diet_fold_bmi, 0.95 0.98);
%sample(mod_risk_diet_fold_bmi, 1.00 1.02);
%sample(hig_risk_diet_fold_bmi, 1.03 1.05);

***Physical activity: 1=low, 2=moderate, 3=high - conditional on urban/rural;
*Source: Assah 2011, Ojiambo 2012;
%sample(phys_act_urban, 1 2 3, 0.50 0.35 0.15);
%sample(phys_act_rural, 1 2 3, 0.15 0.33 0.45);

%sample(low_phys_act_fold_bmi, 1.03 1.05);
%sample(mod_phys_act_fold_bmi, 1.00 1.01);
%sample(hig_phys_act_fold_bmi, 0.95 0.98);

****;

*urban_fold (conditional on gender);
if gender = 1 then urban_fold= urban_fold_bmi_m;
if gender = 2 then urban_fold= urban_fold_bmi_w;

*diet_fold and phys_act_fold (conditional on urban);
if urban = 1 then do;
	diet = diet_urban;
	phys_act = phys_act_urban;
end;

if urban = 0 then do;
	diet = diet_rural;
	phys_act = phys_act_rural;
end;

if diet = 1 then diet_fold_bmi = low_risk_diet_fold_bmi;
if diet = 2 then diet_fold_bmi = mod_risk_diet_fold_bmi;
if diet = 3 then diet_fold_bmi = hig_risk_diet_fold_bmi;

if phys_act = 1 then phys_act_fold_bmi = low_phys_act_fold_bmi;
if phys_act = 2 then phys_act_fold_bmi = mod_phys_act_fold_bmi;
if phys_act = 3 then phys_act_fold_bmi = hig_phys_act_fold_bmi;

***BMI at age 15 when people enter the model;
if age=15 then do;
	if gender=1 then bmi =  bmi_15_m * urban_fold * diet_fold_bmi * phys_act_fold_bmi;
	if gender=2 then bmi =  bmi_15_w * urban_fold * diet_fold_bmi * phys_act_fold_bmi;
end;


***Time updated BMI;

***Account for urban/rural, diet and exercise changing over time;
bmi_tm1 = bmi;
urban_tm1 =	urban;
diet_tm1 = diet;
phsy_act_tm1 = phys_act;

*Setting --> allow movement from rural to urban;
a=rand('uniform');
if urban = 0 and a < 0.0001 then urban=1;

*Diet --> a person may change dietary behaviour;
a=rand('uniform');b=rand('uniform');c=rand('uniform');

if diet_tm1=1 then do;
	if a < 0.80 then diet=1; 
	if 0.80 <= a < 0.98 then diet =2;
	if 0.98 <= a then diet =3;
	if diet_tm1 ne diet then ch_diet=1;
end;

if diet_tm1=2 then do;
	if b < 0.20 then diet=1; 
	if 0.20 <= b < 0.95 then diet =2;
	if 0.95 <= b then diet =3;
	if diet_tm1 ne diet then ch_diet=1;
end;

if diet_tm1=3 then do;
	if c < 0.05 then diet=1; 
	if 0.05 <= c < 0.25 then diet =2;
	if 0.25 <= c then diet =3;
	if diet_tm1 ne diet then ch_diet=1;
end;

*New fold factor based on previous diet;
if diet=diet_tm1 then fold_ch_diet=1.00;
if diet_tm1=1 then do;
	if diet = 2 then fold_ch_diet = 1.02; *from low risk to moderate risk diet;
	if diet = 3 then fold_ch_diet = 1.05; *from low risk to high risk diet;
end;
if diet_tm1=2 then do;
	if diet = 1 then fold_ch_diet = 0.98; *from mod risk to low risk diet;
	if diet = 3 then fold_ch_diet = 1.02; *from mod risk to high risk diet;
end;
if diet_tm1=3 then do;
	if diet = 1 then fold_ch_diet = 0.95; *from high risk to low risk diet;
	if diet = 2 then fold_ch_diet = 0.98; *from high risk to mod risk diet;
end;


*Physical exercise --> a person may change levels of exercise;
a=rand('uniform');b=rand('uniform');c=rand('uniform');

if phys_act_tm1=1 then do;
	if a < 0.80 then phys_act=1; 
	if 0.80 <= a < 0.98 then phys_act =2;
	if 0.98 <= a then phys_act =3;
	if phys_act_tm1 ne phys_act then phys_act_ch=1;
end;

if phys_act_tm1=2 then do;
	if b < 0.20 then phys_act=1; 
	if 0.20 <= b < 0.95 then phys_act =2;
	if 0.95 <= b then phys_act =3;
	if phys_act_tm1 ne phys_act then phys_act_ch=1;
end;

if phys_act_tm1=3 then do;
	if c < 0.05 then phys_act=1; 
	if 0.05 <= c < 0.25 then phys_act =2;
	if 0.25 <= c then phys_act =3;
	if phys_act_tm1 ne phys_act then phys_act_ch=1;
end;

*New fold factor based on previous physical activity;
if phys_act=phys_act_tm1 then fold_ch_phys_act=1.00;

if phys_act_tm1=1 then do;
	if phys_act = 2 then fold_ch_phys_act = 0.98; *from low to moderate phys_act;
	if phys_act = 3 then fold_ch_phys_act = 0.95; *from low to high phys_act;
end;
if phys_act_tm1=2 then do;
	if phys_act = 1 then fold_ch_phys_act = 1.02; *from mod to low phys_act;
	if phys_act = 3 then fold_ch_phys_act = 0.97; *from mod to high phys_act;
end;
if phys_act_tm1=3 then do;
	if phys_act = 1 then fold_ch_phys_act = 1.05; *from high to low phys_act;
	if phys_act = 2 then fold_ch_phys_act = 1.02; *from high to mod phys_act;
end;

*Age;
if 15 le age lt 20 then age_fold_bmi = 1.0050; *This is per quarter and equivalent to 2% increase per year;
if 20 le age lt 40 then age_fold_bmi = 1.0012;
if 40 le age lt 60 then age_fold_bmi = 1.0005;
if age ge 60 then age_fold_bmi = 0.9995;


bmi = bmi_tm1 * age_fold_bmi;
if urban_tm1=0 and urban=1 then bmi = bmi * (urban_fold)^1/4;
if diet_ch=1 then bmi = bmi * fold_ch_diet;
if phys_act_ch=1 then bmi = bmi * fold_ch_phys_act;

*Raised to the power to 1/4 to convert annual increases to quarter;







***Diabetes risk;


*Smoking --> a person can start or stop smoking, dependant on age;
if (. < age < 25) or (age ge 55) then prob_start_smoke = prob_start_smoke * 0.80;*reduced probability for younger and older ages;

a=rand('uniform');b=rand('uniform');
if smoke=0 and a < prob_start_smoke then smoke=1;
if smoke=1 and b < prob_stop_smoke then smoke=0;
