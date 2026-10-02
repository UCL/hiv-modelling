***Defining a BMI for everyone based on age, gender, urban/rural, inactivity and diet;

***Age and gender already defined in the model;

*Age specific BMI fold factor;
*Source: (NCD Risk Factor Collaboration (NCD-RisC) Africa Working Group 2017);

*fold_age_bmi1529; 	fold_age_bmi1529 = 1.00;
*fold_age_bmi3039; 	fold_age_bmi3039 = 1.02;
*fold_age_bmi4049; 	fold_age_bmi4049 = 1.03;
*fold_age_bmi5059; 	fold_age_bmi5059 = 1.05;
*fold_age_bmi60pl; 	fold_age_bmi60pl = 1.04;

*Smoking - conditional on age and gender;
*Source: WHO global report on trends in prevalence of tobacco use 2000?2024  and projections 2025?2030;
 
*prob_start_smoke_m;		%sample(prob_start_smoke_m, 0.0002 0.0003 0.0004); *in men;
*fold_prob_smoke_w;			%sample(fold_prob_smoke_w, 0.20 0.33 0.50);
*prob_start_smoke;			prob_start_smoke=prob_start_smoke_m * fold_prob_smoke_w;




*******************************************;

***PERSON LEVEL VARIATIONS AT START OF FOLLOW UP, 1989;

*I think this goes in the section where age and gender are defined;

*BMI;
*Estimate of rural BMIs (i.e. in 1985) across 10 representative countries in SSA in those under 30;
*Source: https://ncdrisc.org/data-downloads-adiposity.html;

*base_bmi_m;		base_bmi_m = rand('normal', 20.0, 2.2);
*base_bmi_w;		base_bmi_w = rand('normal', 21.0, 2.2);


***Urban/rural - quite a wide range of urban pop but on average 45% in SSA is urban;
*Source: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS?locations=ZG&name_desc=false;

*prob_urban;		prob_urban = 0.40 + (rand('uniform')*0.20);
a=rand('uniform');
urban=0; if a < prob_urban then urban=1;

if (. < age < 30) or (age ge 55) then prob_start_smoke = prob_start_smoke * 0.80;*reduced probability for younger and older ages;
a=rand('uniform');
smoke=0; if a < prob_start_smoke then smoke=1;

***Need to discuss in which section the rest goes;

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
a=rand('uniform');b=rand('uniform');

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

if diet=1 then fold_diet_bmi=1; *low risk diet;
if diet=2 then %sample_uniform (fold_diet_bmi, 1.01 1.02);
if diet=3 then %sample_uniform (fold_diet_bmi, 1.03 1.04);

if phys_act=3 then %sample_uniform (fold_phys_act_bmi, 0.95 0.97);*high physical activity;
if phys_act=2 then fold_phys_act_bmi=1;
if phys_act=1 then %sample_uniform (fold_phys_act_bmi, 1.03 1.04);

if smoke=1 then %sample_uniform (fold_smoke_bmi, );***DISCUSS - I think stopping smoking increases BMI;

bmi = base_bmi * fold_age_bmi* fold_urban_bmi * fold_diet_bmi * fold_phys_act_bmi;




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

*Smoking --> a person can start or stop smoking;
a=rand('uniform');b=rand('uniform');

if smoke_tm1=1 then do;
	if a < 0.85 then smoke=1;
	if a >= 0.85 then smoke=0;
end;

*need to make age depdendnt;
