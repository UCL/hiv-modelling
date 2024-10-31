

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\";

* debra spreadhseet  * save first as a .xlsx file ;

* "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx" ;



* goals ;

proc import
out=goals_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_SQ"; getnames=n; range="A3:BA43";run;
data goals_sq; set goals_sq_;  model = 1; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_target"; getnames=n; range="A3:BA43";run;
data goals_target; set goals_target_;  model = 1; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_midway"; getnames=n; range="A3:BA43";run;
data goals_midway; set goals_midway_;  model = 1; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int1"; getnames=n; range="A3:BA43";run;
data goals_int1; set goals_int1_;  model = 1; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int2"; getnames=n; range="A3:BA43";run;
data goals_int2; set goals_int2_;  model = 1; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int3"; getnames=n; range="A3:BA43";run;
data goals_int3; set goals_int3_;  model = 1; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int4"; getnames=n; range="A3:BA43";run;
data goals_int4; set goals_int4_;  model = 1; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int5"; getnames=n; range="A3:BA43";run;
data goals_int5; set goals_int5_;  model = 1; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int6"; getnames=n; range="A3:BA43";run;
data goals_int6; set goals_int6_;  model = 1; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int7"; getnames=n; range="A3:BA43";run;
data goals_int7; set goals_int7_;  model = 1; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int8"; getnames=n; range="A3:BA43";run;
data goals_int8; set goals_int8_;  model = 1; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int9"; getnames=n; range="A3:BA43";run;
data goals_int9; set goals_int9_;  model = 1; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int10"; getnames=n; range="A3:BA43";run;
data goals_int10; set goals_int10_;  model = 1; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int11"; getnames=n; range="A3:BA43";run;
data goals_int11; set goals_int11_;  model = 1; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int12"; getnames=n; range="A3:BA43";run;
data goals_int12; set goals_int12_;  model = 1; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int13"; getnames=n; range="A3:BA43";run;
data goals_int13; set goals_int13_;  model = 1; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int14"; getnames=n; range="A3:BA43";run;
data goals_int14; set goals_int14_;  model = 1; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_int15"; getnames=n; range="A3:BA43";run;
data goals_int15; set goals_int15_;  model = 1; scenario = 15;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";



* optima ;


proc import
out=optima_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_SQ"; getnames=n; range="A3:BA43";run;
data optima_sq; set optima_sq_;  model = 2; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_target"; getnames=n; range="A3:BA43";run;
data optima_target; set optima_target_;  model = 2; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_midway"; getnames=n; range="A3:BA43";run;
data optima_midway; set optima_midway_;  model = 2; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int1"; getnames=n; range="A3:BA43";run;
data optima_int1; set optima_int1_;  model = 2; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int2"; getnames=n; range="A3:BA43";run;
data optima_int2; set optima_int2_;  model = 2; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int3"; getnames=n; range="A3:BA43";run;
data optima_int3; set optima_int3_;  model = 2; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int4"; getnames=n; range="A3:BA43";run;
data optima_int4; set optima_int4_;  model = 2; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int5"; getnames=n; range="A3:BA43";run;
data optima_int5; set optima_int5_;  model = 2; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int6"; getnames=n; range="A3:BA43";run;
data optima_int6; set optima_int6_;  model = 2; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int7"; getnames=n; range="A3:BA43";run;
data optima_int7; set optima_int7_;  model = 2; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int8"; getnames=n; range="A3:BA43";run;
data optima_int8; set optima_int8_;  model = 2; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int9"; getnames=n; range="A3:BA43";run;
data optima_int9; set optima_int9_;  model = 2; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int10"; getnames=n; range="A3:BA43";run;
data optima_int10; set optima_int10_;  model = 2; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int11"; getnames=n; range="A3:BA43";run;
data optima_int11; set optima_int11_;  model = 2; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int12"; getnames=n; range="A3:BA43";run;
data optima_int12; set optima_int12_;  model = 2; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int13"; getnames=n; range="A3:BA43";run;
data optima_int13; set optima_int13_;  model = 2; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int14"; getnames=n; range="A3:BA43";run;
data optima_int14; set optima_int14_;  model = 2; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Optima_int15"; getnames=n; range="A3:BA43";run;
data optima_int15; set optima_int15_;  model = 2; scenario = 15;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";



* hiv synthesis ;

proc import
out=hiv_synthesis_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_SQ"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_sq; set hiv_synthesis_sq_;  model = 3; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_target"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_target; set hiv_synthesis_target_;  model = 3; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_midway"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_midway; set hiv_synthesis_midway_;  model = 3; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int1"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int1; set hiv_synthesis_int1_;  model = 3; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int2"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int2; set hiv_synthesis_int2_;  model = 3; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int3"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int3; set hiv_synthesis_int3_;  model = 3; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int4"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int4; set hiv_synthesis_int4_;  model = 3; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int5"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int5; set hiv_synthesis_int5_;  model = 3; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int6"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int6; set hiv_synthesis_int6_;  model = 3; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int7"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int7; set hiv_synthesis_int7_;  model = 3; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int8"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int8; set hiv_synthesis_int8_;  model = 3; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int9"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int9; set hiv_synthesis_int9_;  model = 3; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int10"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int10; set hiv_synthesis_int10_;  model = 3; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int11"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int11; set hiv_synthesis_int11_;  model = 3; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int12"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int12; set hiv_synthesis_int12_;  model = 3; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int13"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int13; set hiv_synthesis_int13_;  model = 3; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int14"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int14; set hiv_synthesis_int14_;  model = 3; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int15"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int15; set hiv_synthesis_int15_;  model = 3; scenario = 15;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";


data all;
set 

goals_sq goals_target goals_midway goals_int1 goals_int2 goals_int3 goals_int4 goals_int5  
goals_int6 goals_int7 goals_int8 goals_int9 goals_int10 goals_int11 goals_int12 goals_int13 goals_int14 goals_int15  

optima_sq  optima_target optima_midway optima_int1 optima_int2  optima_int3  optima_int4   optima_int5 
optima_int6 optima_int7 optima_int8 optima_int9 optima_int10 optima_int11 optima_int12 optima_int13 optima_int14 optima_int15  

hiv_synthesis_sq hiv_synthesis_target hiv_synthesis_midway hiv_synthesis_int1 hiv_synthesis_int2 hiv_synthesis_int3 hiv_synthesis_int4 hiv_synthesis_int5  
hiv_synthesis_int6 hiv_synthesis_int7 hiv_synthesis_int8 hiv_synthesis_int9 hiv_synthesis_int10 hiv_synthesis_int11 hiv_synthesis_int12 hiv_synthesis_int13 
hiv_synthesis_int14 hiv_synthesis_int15  

;




* template for running graphs comparing with status quo - replace 9 with int number and n_prep with n_prep name
  remember to change y axis scale and label
;

data goals_0 ; set all; if model=1; if scenario = 0 ; n_prep_0_1 = n_prep; keep year n_prep_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; n_prep_0_2 = n_prep;keep year n_prep_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;n_prep_0_3 = n_prep;keep year n_prep_0_3 ;

data goals_9 ; set all; if model=1;if scenario = 9 ;n_prep_9_1 = n_prep;keep year n_prep_9_1 ;
data optima_9 ; set all; if model=2;if scenario = 9 ;n_prep_9_2 = n_prep;keep year n_prep_9_2 ;
data hiv_synthesis_9 ; set all; if model=3;if scenario = 9 ;n_prep_9_3 = n_prep;keep year n_prep_9_3 ;

data a.n_prep ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_9 optima_9 hiv_synthesis_9 ;

ods html;

proc sgplot data = a.n_prep ; 
Title    height=1.5 justify=center "n_prep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2023   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 10000) valueattrs=(size=10);

label n_prep_0_1 = "Goals - SQ ";
label n_prep_0_2 = "Optima - SQ ";
label n_prep_0_3 = "Synthesis - SQ ";
label n_prep_9_1 = "Goals - all interventions ";
label n_prep_9_2 = "Optima - all interventions ";
label n_prep_9_3 = "Synthesis - all interventions ";

series  x=year y=n_prep_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=n_prep_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=n_prep_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=n_prep_9_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=n_prep_9_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=n_prep_9_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;






/*

* template for running graphs comparing with status quo - replace 9 with int number and n_prep with n_prep name
  remember to change y axis scale and label
;


data goals_0 ; set all; if model=1; if scenario = 0 ; variable_0_1 = variable; keep year variable_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; variable_0_2 = variable;keep year variable_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;variable_0_3 = variable;keep year variable_0_3 ;

data goals_intx ; set all; if model=1;if scenario = intx ;variable_intx_1 = variable;keep year variable_intx_1 ;
data optima_intx ; set all; if model=2;if scenario = intx ;variable_intx_2 = variable;keep year variable_intx_2 ;
data hiv_synthesis_intx ; set all; if model=3;if scenario = intx ;variable_intx_3 = variable;keep year variable_intx_3 ;

data a.variable ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_intx optima_intx hiv_synthesis_intx ;

ods html;

proc sgplot data = a.variable ; 
Title    height=1.5 justify=center "variable";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2023   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 10000) valueattrs=(size=10);

label variable_0_1 = "Goals - SQ ";
label variable_0_2 = "Optima - SQ ";
label variable_0_3 = "Synthesis - SQ ";
label variable_intx_1 = "Goals - all interventions ";
label variable_intx_2 = "Optima - all interventions ";
label variable_intx_3 = "Synthesis - all interventions ";

series  x=year y=variable_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=variable_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=variable_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=variable_intx_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=variable_intx_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=variable_intx_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;


*/













/*

ods html;
proc sgplot data = a.new_infection_15pl; 
Title    height=1.5 justify=center "Number of new infections in adults age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000   by 10000) valueattrs=(size=10);

label new_infection_15pl_1 = "Model 1 ";
label new_infection_15pl_2 = "Model 2 ";
label new_infection_15pl_3 = "Model 3 ";

series  x=year y=new_infection_15pl_1/	lineattrs = (color=black thickness = 2);
series  x=year y=new_infection_15pl_2/	lineattrs = (color=red thickness = 2);
series  x=year y=new_infection_15pl_3/	lineattrs = (color=green thickness = 2);
run;

quit;
ods html close;

*/

