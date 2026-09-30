***Defining a BMI for everyone based on age, gender, urban/rural, inactivity and diet;

***Age and gender already defined in the model;

***PERSON LEVEL VARIATIONS;


***Urban/rural - quite a wide range of urban pop but on average 45% in SSA is urban;
*Source: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS?locations=ZG&name_desc=false;

prob_urban = 0.40 + (rand('uniform')*0.20);
a=rand('uniform');
urban=0; if a < prob_urban then urban=1;

*BMI;
*Estimate of rural BMIs (i.e. in 1985) across 10 representative countries in SSA in those under 30;
*Source: https://ncdrisc.org/data-downloads-adiposity.html;

*Gender;
if sex = 1 then base_bmi = rand('normal', 20.0, 2.2);
if sex = 2 then base_bmi = rand('normal', 21.0, 2.2);

*Age;
*Source: (NCD Risk Factor Collaboration (NCD-RisC) ? Africa Working Group 2017);
if . < age < 30 then fold_age_bmi = 1.00;
else if age < 40 then fold_age_bmi = 1.02;
else if age < 50 then fold_age_bmi = 1.04;
else if age < 60 then fold_age_bmi = 1.05;
else fold_age_bmi = 1.04;

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

if urban=1 then %sample_uniform (fold_urban_bmi, 1.005 1.01); 
if urban=0 then fold_urban_bmi=1;

if diet=1 then fold_diet_bmi=1; *low risk diet;
if diet=2 then %sample_uniform (fold_diet_bmi, 1.01 1.02);
if diet=3 then %sample_uniform (fold_diet_bmi, 1.03 1.04);

if phys_act=3 then %sample_uniform (fold_phys_act_bmi, 0.95 0.97);*high physical activity;
if phys_act=2 then fold_phys_act_bmi=1;
if phys_act=1 then %sample_uniform (fold_phys_act_bmi, 1.03 1.04);

bmi = base_bmi * fold_age_bmi* fold_urban_bmi * fold_diet_bmi * fold_phys_act_bmi;
