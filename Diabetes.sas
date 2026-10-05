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
*prob_urban;				prob_urban = 0.40 + (rand('uniform')*0.20);

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

***Urban/rural - quite a wide range of urban pop but on average 45% in SSA is urban;
*Source: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS?locations=ZG&name_desc=false;
a=rand('uniform');
urban=0; if a < prob_urban then urban=1;


*smoking;;
if gender=1 then prob_smoke = prob_smoke_m;
if gender=2 then prob_smoke = prob_smoke_m * fold_prob_smoke_w;
if (. < age < 25) or (age ge 55) then prob_smoke = prob_smoke * 0.80;*reduced probability for younger and older ages;

a=rand('uniform');
smoke=0;if a < prob_smoke then smoke=1;



***Need to discuss in which section diet and activity goes;

***Diet: 1=low risk, 2=moderate risk, 3-high risk - conditional on urban/rural;
* Source: Westbury 2021;
if urban=1 then do;
%sample(diet, 1 2 3, 0.25 0.45 0.30);
end;

if urban=0 then do;
%sample(diet, 1 2 3, 0.45 0.40 0.15);
end;

***Physical activity: 1=low, 2=moderate, 3=high - conditional on urban/rural;
*Source: Assah 2011, Ojiambo 2012;
if urban=1 then do;
%sample(phys_act, 1 2 3, 0.50 0.35 0.15);
end;

if urban=0 then do;
%sample(phys_act, 1 2 3, 0.15 0.33 0.45);
end;



*BMI up to 8% higher amongst those living in urban areas...but diet and physical activity are already conditional 
on region so have lower multipliers for urban;
*Want to include diet/phys act separately as this could form the basis of an intervention (though most diabetes models dont do this);

*Defining increase in BMI risk;
if urban=1 then %sample_uniform (fold_urban_bmi, 1.005 1.01); 
if urban=0 then fold_urban_bmi=1;

if smoke=1 then %sample_uniform (fold_smoke_bmi, );***DISCUSS - I think stopping smoking increases BMI;

if diet=1 then fold_diet_bmi=1; *low risk diet;
if diet=2 then %sample_uniform (fold_diet_bmi, 1.01 1.02);
if diet=3 then %sample_uniform (fold_diet_bmi, 1.03 1.04);

if phys_act=3 then %sample_uniform (fold_phys_act_bmi, 0.95 0.97);*high physical activity;
if phys_act=2 then fold_phys_act_bmi=1;
if phys_act=1 then %sample_uniform (fold_phys_act_bmi, 1.03 1.04);



***Think about bmi distribution at age 15;
bmi = base_bmi * fold_urban_bmi * fold_smoke_bmi * fold_diet_bmi * fold_phys_act_bmi;




****;

***UPDATING VARIABLES - this will be inserted in the section where variables are updated every 3 months;

urban_tm1=urban;
diet_tm1=diet;
phsy_act_tm1=phys_act;
smoke_tm1=smoke;

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

