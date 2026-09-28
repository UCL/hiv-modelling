***Defining a BMI for everyone based on age, gender, urban/rural, inactivity and diet;

***Age and gender already defined in the model;

***PERSON LEVEL VARIATIONS;


***Urban/rural - quite a wide range of urban pop but on average 45% in SSA is urban;
*Source: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS?locations=ZG&name_desc=false;

prob_urban = 0.40 + (rand('uniform')*0.20);
a=rand('uniform');
urban=0; if a < prob_urban then urban=1;

***Physical activity: 1=low, 2=moderate, 3=high - conditional on urban/rural;
*Source: Assah 2011, Ojiambo 2012;
a=rand('uniform');b=rand('uniform');

if urban=1 then do;
%sample(phys_act, 1 2 3, 0.50 0.35 0.15);
end;

if urban=0 then do;
%sample(phys_act, 1 2 3, 0.15 0.33 0.45);
end;


***Diet: 1=low risk, 2=moderate risk, 3-high risk - conditional on urban/rural;
* Source: Westbury 2021;
if urban=1 then do;
%sample(diet, 1 2 3, 0.25 0.45 0.30);
end;

if urban=0 then do;
%sample(diet, 1 2 3, 0.45 0.40 0.15);
end;

*BMI;
if sex = 1 then base_bmi = rand('normal', 21.0, 2.2);
if sex = 2 then base_bmi = rand('normal', 21.0, 2.2);
