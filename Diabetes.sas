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
*SourceL https://www.ncdrisc.org/data-downloads-adiposity-urban-rural.html;
*Using the NCDRisk data, compute average BMI for all SSA countries and their SD, then apply a within individual estimated SD;
*This was done by filtering the NCD risk sheet by sex and then asking AI to compute means and SD for 1989 across settings;
if urban=1 then do;
	
	if gender=1 then do;
		if      15 le age lt 20 then do; bmi_av_country = rand('Normal', 20.244, 0.698); end;
        else if 20 le age lt 25 then do; bmi_av_country = rand('Normal', 20.746, 0.689); end;
        else if 25 le age lt 30 then do; bmi_av_country = rand('Normal', 21.318, 0.701); end;
        else if 30 le age lt 35 then do; bmi_av_country = rand('Normal', 21.738, 0.724); end;
        else if 35 le age lt 40 then do; bmi_av_country = rand('Normal', 22.022, 0.751); end;
        else if 40 le age lt 45 then do; bmi_av_country = rand('Normal', 22.189, 0.781); end;
        else if 45 le age lt 50 then do; bmi_av_country = rand('Normal', 22.256, 0.821); end;
        else if 50 le age lt 55 then do; bmi_av_country = rand('Normal', 22.236, 0.869); end;
        else if 55 le age lt 60 then do; bmi_av_country = rand('Normal', 22.133, 0.920); end;
        else if 60 le age lt 65 then do; bmi_av_country = rand('Normal', 21.953, 0.965); end;
        else if 65 le age lt 70 then do; bmi_av_country = rand('Normal', 21.711, 1.000); end;
        else if 70 le age lt 75 then do; bmi_av_country = rand('Normal', 21.431, 1.021); end;
        else if 75 le age lt 80 then do; bmi_av_country = rand('Normal', 21.137, 1.028); end;
        else if 80 le age lt 85 then do; bmi_av_country = rand('Normal', 20.853, 1.031); end;
        else if      85 le age  then do; bmi_av_country = rand('Normal', 20.544, 1.071); end;
	end;

	if gender=2 then do;
        if      15 le age lt 20 then do; bmi_av_country = rand('Normal', 21.560, 0.845); end;
        else if 20 le age lt 25 then do; bmi_av_country = rand('Normal', 22.013, 0.996); end;
        else if 25 le age lt 30 then do; bmi_av_country = rand('Normal', 22.628, 1.240); end;
        else if 30 le age lt 35 then do; bmi_av_country = rand('Normal', 23.174, 1.450); end;
        else if 35 le age lt 40 then do; bmi_av_country = rand('Normal', 23.616, 1.616); end;
        else if 40 le age lt 45 then do; bmi_av_country = rand('Normal', 23.920, 1.747); end;
        else if 45 le age lt 50 then do; bmi_av_country = rand('Normal', 24.053, 1.858); end;
        else if 50 le age lt 55 then do; bmi_av_country = rand('Normal', 24.014, 1.950); end;
        else if 55 le age lt 60 then do; bmi_av_country = rand('Normal', 23.835, 2.007); end;
        else if 60 le age lt 65 then do; bmi_av_country = rand('Normal', 23.547, 2.015); end;
        else if 65 le age lt 70 then do; bmi_av_country = rand('Normal', 23.176, 1.974); end;
        else if 70 le age lt 75 then do; bmi_av_country = rand('Normal', 22.741, 1.902); end;
        else if 75 le age lt 80 then do; bmi_av_country = rand('Normal', 22.260, 1.821); end;
        else if 80 le age lt 85 then do; bmi_av_country = rand('Normal', 21.752, 1.761); end;
        else if      85 le age  then do; bmi_av_country = rand('Normal', 21.092, 1.798); end;
	end;
	
        * Truncated to ensure normal BMI - this should resample if implausible values are chosen;
        do until (14.0 le bmi le 60.0);
            bmi = rand('Normal', bmi_av_country, 4.0);
        end;
end;

if urban = 0 then do;
	if gender=1 then do;
	if      15 le age lt 20 then do; bmi_av_country = rand('Normal', 19.533, 0.697); end;
        else if 20 le age lt 25 then do; bmi_av_country = rand('Normal', 19.865, 0.686); end;
        else if 25 le age lt 30 then do; bmi_av_country = rand('Normal', 20.258, 0.693); end;
        else if 30 le age lt 35 then do; bmi_av_country = rand('Normal', 20.558, 0.713); end;
        else if 35 le age lt 40 then do; bmi_av_country = rand('Normal', 20.764, 0.737); end;
        else if 40 le age lt 45 then do; bmi_av_country = rand('Normal', 20.879, 0.766); end;
        else if 45 le age lt 50 then do; bmi_av_country = rand('Normal', 20.905, 0.805); end;
        else if 50 le age lt 55 then do; bmi_av_country = rand('Normal', 20.846, 0.853); end;
        else if 55 le age lt 60 then do; bmi_av_country = rand('Normal', 20.714, 0.902); end;
        else if 60 le age lt 65 then do; bmi_av_country = rand('Normal', 20.518, 0.947); end;
        else if 65 le age lt 70 then do; bmi_av_country = rand('Normal', 20.277, 0.980); end;
        else if 70 le age lt 75 then do; bmi_av_country = rand('Normal', 20.016, 0.998); end;
        else if 75 le age lt 80 then do; bmi_av_country = rand('Normal', 19.764, 1.001); end;
        else if 80 le age lt 85 then do; bmi_av_country = rand('Normal', 19.546, 1.000); end;
        else if      85 le age  then do; bmi_av_country = rand('Normal', 19.359, 1.034); end;
	end;

	if gender=2 then do;
        if      15 le age lt 20 then do; bmi_av_country = rand('Normal', 20.922, 0.859); end;
        else if 20 le age lt 25 then do; bmi_av_country = rand('Normal', 20.971, 1.005); end;
        else if 25 le age lt 30 then do; bmi_av_country = rand('Normal', 21.125, 1.234); end;
        else if 30 le age lt 35 then do; bmi_av_country = rand('Normal', 21.324, 1.430); end;
        else if 35 le age lt 40 then do; bmi_av_country = rand('Normal', 21.509, 1.585); end;
        else if 40 le age lt 45 then do; bmi_av_country = rand('Normal', 21.619, 1.709); end;
        else if 45 le age lt 50 then do; bmi_av_country = rand('Normal', 21.596, 1.815); end;
        else if 50 le age lt 55 then do; bmi_av_country = rand('Normal', 21.435, 1.905); end;
        else if 55 le age lt 60 then do; bmi_av_country = rand('Normal', 21.187, 1.965); end;
        else if 60 le age lt 65 then do; bmi_av_country = rand('Normal', 20.899, 1.978); end;
        else if 65 le age lt 70 then do; bmi_av_country = rand('Normal', 20.600, 1.946); end;
        else if 70 le age lt 75 then do; bmi_av_country = rand('Normal', 20.292, 1.886); end;
        else if 75 le age lt 80 then do; bmi_av_country = rand('Normal', 19.977, 1.816); end;
        else if 80 le age lt 85 then do; bmi_av_country = rand('Normal', 19.658, 1.767); end;
        else if      85 le age  then do; bmi_av_country = rand('Normal', 19.245, 1.812); end;
	end;

        do until (14.0 le bmi le 60.0);
            bmi = rand('Normal', bmi_av_country, 4.0);
        end;
end;

*Have not included diet or physical activity here for simplicity;
But will need to have the correct variables for this formula;
bmi = bmi_tm1 * age_fold_bmi * (urban_fold)^1/4 * (fold_ch_diet)^1/4 * fold_ch_phys_act^1/4;

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

* Source: https://ncdrisc.org/data-downloads-adiposity-urban-rural-ado.html;
* I took the average BMI for SSA in 1990 and added a calendr year effect;
*Gender;
do until (14.0 le bmi_15_m le 60.0);
    bmi_15_m = rand('normal', 17.3, 4.0) + (0.005 * (caldate&j - 1989));
end;

do until (14.0 le bmi_15_w le 60.0);
    bmi_15_w = rand('normal', 19.1, 4.0) + (0.005 * (caldate&j - 1989));
end;


*Urban/rural;

*urban bmi in boys is ~ 0.3 times higher than rural and 0.5 in women;
urban_fold_bmi_m = 1.03;
urban_fold_bmi_w = 1.05;

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

if rural = 1 then do;
	diet = diet_rural;
	phys_act = phys_act_urban;
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
end;

if diet_tm1=2 then do;
	if b < 0.20 then diet=1; 
	if 0.20 <= b < 0.95 then diet =2;
	if 0.95 <= b then diet =3;
end;

if diet_tm1=3 then do;
	if c < 0.05 then diet=1; 
	if 0.05 <= c < 0.25 then diet =2;
	if 0.25 <= c then diet =3;
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
end;

if phys_act_tm1=2 then do;
	if b < 0.20 then phys_act=1; 
	if 0.20 <= b < 0.95 then phys_act =2;
	if 0.95 <= b then phys_act =3;
end;

if phys_act_tm1=3 then do;
	if c < 0.05 then phys_act=1; 
	if 0.05 <= c < 0.25 then phys_act =2;
	if 0.25 <= c then phys_act =3;
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

bmi = bmi_tm1 * age_fold_bmi * (urban_fold)^1/4 * (fold_ch_diet)^1/4 * fold_ch_phys_act^1/4;
*Raised to the power to 1/4 to convert annual increases to quarterly increases;










***Diabetes risk;


*Smoking --> a person can start or stop smoking, dependant on age;
if (. < age < 25) or (age ge 55) then prob_start_smoke = prob_start_smoke * 0.80;*reduced probability for younger and older ages;

a=rand('uniform');b=rand('uniform');
if smoke=0 and a < prob_start_smoke then smoke=1;
if smoke=1 and b < prob_stop_smoke then smoke=0;

*Age;

*Discuss how to include age based on steps survey table 2;

***what about those with normal bmi?;

***NUMBERS NEED THINKING ABOUT;
if bmi <=18.5 then do; *underweight;
	if . < age <=25 then 	fold_inc_age_bmi=1;
	if 25  < age <=35 then 	fold_inc_age_bmi=0.85;
	if 35  < age <=45 then 	fold_inc_age_bmi=0.88;
	if 45  < age <=55 then 	fold_inc_age_bmi=1.01;
	if age gt 55 then		fold_inc_age_bmi=1.26;
end;
if 25.0 < bmi <=29.9 then do; *overweight;
	if . < age <=25 then 	fold_inc_age_bmi=1;
	if 25  < age <=35 then 	fold_inc_age_bmi=5;
	if 35  < age <=45 then 	fold_inc_age_bmi=;
	if 45  < age <=55 then 	fold_inc_age_bmi=;
	if age gt 55 then		fold_inc_age_bmi=;
end;



bmi = bmi_tm1 * fold_urban_bmi * fold_smoke_bmi * fold_diet_bmi * fold_phys_act_bmi;

Normal weight: BMI 18.5?24.9

Overweight: BMI 25?29.9

Obesity: BMI ?30.

