

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\";

* debra spreadhseet  * save first as a .xlsx file ;

* "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx" ;



* goals ;

proc import
out=goals_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_SQ"; getnames=n; range="A3:BA43";run;
data goals_sq; set goals_sq_;  model = 1; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_target"; getnames=n; range="A3:BA43";run;
data goals_target; set goals_target_;  model = 1; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_midway"; getnames=n; range="A3:BA43";run;
data goals_midway; set goals_midway_;  model = 1; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int1"; getnames=n; range="A3:BA43";run;
data goals_int1; set goals_int1_;  model = 1; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int2"; getnames=n; range="A3:BA43";run;
data goals_int2; set goals_int2_;  model = 1; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int3"; getnames=n; range="A3:BA43";run;
data goals_int3; set goals_int3_;  model = 1; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int4"; getnames=n; range="A3:BA43";run;
data goals_int4; set goals_int4_;  model = 1; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int5"; getnames=n; range="A3:BA43";run;
data goals_int5; set goals_int5_;  model = 1; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int6"; getnames=n; range="A3:BA43";run;
data goals_int6; set goals_int6_;  model = 1; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int7"; getnames=n; range="A3:BA43";run;
data goals_int7; set goals_int7_;  model = 1; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int8"; getnames=n; range="A3:BA43";run;
data goals_int8; set goals_int8_;  model = 1; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int9"; getnames=n; range="A3:BA43";run;
data goals_int9; set goals_int9_;  model = 1; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int10"; getnames=n; range="A3:BA43";run;
data goals_int10; set goals_int10_;  model = 1; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int11"; getnames=n; range="A3:BA43";run;
data goals_int11; set goals_int11_;  model = 1; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int12"; getnames=n; range="A3:BA43";run;
data goals_int12; set goals_int12_;  model = 1; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int13"; getnames=n; range="A3:BA43";run;
data goals_int13; set goals_int13_;  model = 1; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int14"; getnames=n; range="A3:BA43";run;
data goals_int14; set goals_int14_;  model = 1; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Goals_int15"; getnames=n; range="A3:BA43";run;
data goals_int15; set goals_int15_;  model = 1; scenario = 15;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";



* optima ;


proc import
out=optima_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_SQ"; getnames=n; range="A3:BA43";run;
data optima_sq; set optima_sq_;  model = 2; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_target"; getnames=n; range="A3:BA43";run;
data optima_target; set optima_target_;  model = 2; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_midway"; getnames=n; range="A3:BA43";run;
data optima_midway; set optima_midway_;  model = 2; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int1"; getnames=n; range="A3:BA43";run;
data optima_int1; set optima_int1_;  model = 2; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int2"; getnames=n; range="A3:BA43";run;
data optima_int2; set optima_int2_;  model = 2; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int3"; getnames=n; range="A3:BA43";run;
data optima_int3; set optima_int3_;  model = 2; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int4"; getnames=n; range="A3:BA43";run;
data optima_int4; set optima_int4_;  model = 2; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int5"; getnames=n; range="A3:BA43";run;
data optima_int5; set optima_int5_;  model = 2; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int6"; getnames=n; range="A3:BA43";run;
data optima_int6; set optima_int6_;  model = 2; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int7"; getnames=n; range="A3:BA43";run;
data optima_int7; set optima_int7_;  model = 2; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int8"; getnames=n; range="A3:BA43";run;
data optima_int8; set optima_int8_;  model = 2; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int9"; getnames=n; range="A3:BA43";run;
data optima_int9; set optima_int9_;  model = 2; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int10"; getnames=n; range="A3:BA43";run;
data optima_int10; set optima_int10_;  model = 2; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int11"; getnames=n; range="A3:BA43";run;
data optima_int11; set optima_int11_;  model = 2; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int12"; getnames=n; range="A3:BA43";run;
data optima_int12; set optima_int12_;  model = 2; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int13"; getnames=n; range="A3:BA43";run;
data optima_int13; set optima_int13_;  model = 2; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int14"; getnames=n; range="A3:BA43";run;
data optima_int14; set optima_int14_;  model = 2; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="Optima_int15"; getnames=n; range="A3:BA43";run;
data optima_int15; set optima_int15_;  model = 2; scenario = 15;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";



* hiv synthesis ;

proc import
out=hiv_synthesis_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_SQ"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_sq; set hiv_synthesis_sq_;  model = 3; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_target"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_target; set hiv_synthesis_target_;  model = 3; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_midway"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_midway; set hiv_synthesis_midway_;  model = 3; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int1"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int1; set hiv_synthesis_int1_;  model = 3; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int2"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int2; set hiv_synthesis_int2_;  model = 3; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int3"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int3; set hiv_synthesis_int3_;  model = 3; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int4"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int4; set hiv_synthesis_int4_;  model = 3; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int5"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int5; set hiv_synthesis_int5_;  model = 3; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int6"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int6; set hiv_synthesis_int6_;  model = 3; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int7"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int7; set hiv_synthesis_int7_;  model = 3; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int8"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int8; set hiv_synthesis_int8_;  model = 3; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int9"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int9; set hiv_synthesis_int9_;  model = 3; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int10"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int10; set hiv_synthesis_int10_;  model = 3; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int11"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int11; set hiv_synthesis_int11_;  model = 3; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int12"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int12; set hiv_synthesis_int12_;  model = 3; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int13"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int13; set hiv_synthesis_int13_;  model = 3; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int14"; getnames=n; range="A3:BA43";run;
data hiv_synthesis_int14; set hiv_synthesis_int14_;  model = 3; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_nov24.xlsx"
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




data goals_0 ; set all; if model=1; if scenario = 0 ; new_infection_15pl_0_1 = new_infection_15pl; keep year new_infection_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; new_infection_15pl_0_2 = new_infection_15pl;keep year new_infection_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;new_infection_15pl_0_3 = new_infection_15pl;keep year new_infection_15pl_0_3 ;

data goals_20 ; set all; if model=1;if scenario = 20 ;new_infection_15pl_20_1 = new_infection_15pl;keep year new_infection_15pl_20_1 ;
data optima_20 ; set all; if model=2;if scenario = 20 ;new_infection_15pl_20_2 = new_infection_15pl;keep year new_infection_15pl_20_2 ;
data hiv_synthesis_20 ; set all; if model=3;if scenario = 20 ;new_infection_15pl_20_3 = new_infection_15pl;keep year new_infection_15pl_20_3 ;

data a.new_infection_15pl ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_20 optima_20 hiv_synthesis_20 ;

ods html;

proc sgplot data = a.new_infection_15pl nolegend ; 
Title    height=1.5 justify=center "Number of new infections age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 10000) valueattrs=(size=10);

label new_infection_15pl_0_1 = "Goals - SQ ";
label new_infection_15pl_0_2 = "Optima - SQ ";
label new_infection_15pl_0_3 = "Synthesis - SQ ";
label new_infection_15pl_20_1 = "Goals - int 20 ";
label new_infection_15pl_20_2 = "Optima - int 20 ";
label new_infection_15pl_20_3 = "Synthesis - int 20 ";

series  x=year y=new_infection_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=new_infection_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=new_infection_15pl_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=new_infection_15pl_20_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=new_infection_15pl_20_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=new_infection_15pl_20_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;


* replace mno by model number, intx by scenario ;

/*

proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=mno and scenario=intx and 2024 <= year <= 2040; run;
data out_mno_0; set xx;  drop _TYPE_ _FREQ_; proc print; run;

*/


* template for running graphs comparing with status quo - replace intx with int number and variable with variable name
  remember to change y axis scale and label
;


/*

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
label variable_intx_1 = "Goals - int intx ";
label variable_intx_2 = "Optima - int intx ";
label variable_intx_3 = "Synthesis - int intx ";

series  x=year y=variable_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=variable_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=variable_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=variable_intx_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=variable_intx_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=variable_intx_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;


*/













* ===================================================================================================================================================================;



/*


data goals_0 ; set all; if model=1; if scenario = 0 ; new_infection_15pl_0_1 = new_infection_15pl; keep year new_infection_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; new_infection_15pl_0_2 = new_infection_15pl;keep year new_infection_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;new_infection_15pl_0_3 = new_infection_15pl;keep year new_infection_15pl_0_3 ;

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


/*


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
Title    height=1.5 justify=center "number on prep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000   by 100000) valueattrs=(size=10);

label n_prep_0_1 = "Goals - SQ ";
label n_prep_0_2 = "Optima - SQ ";
label n_prep_0_3 = "Synthesis - SQ ";
label n_prep_9_1 = "Goals - int 9 ";
label n_prep_9_2 = "Optima - int 9 ";
label n_prep_9_3 = "Synthesis - int 9 ";

series  x=year y=n_prep_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=n_prep_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=n_prep_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=n_prep_9_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=n_prep_9_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=n_prep_9_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;


*/




/*

data goals_0 ; set all; if model=1; if scenario = 0 ; p_onart_diag_15pl_0_1 = p_onart_diag_15pl; keep year p_onart_diag_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; p_onart_diag_15pl_0_2 = p_onart_diag_15pl;keep year p_onart_diag_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;p_onart_diag_15pl_0_3 = p_onart_diag_15pl;keep year p_onart_diag_15pl_0_3 ;

data goals_12 ; set all; if model=1;if scenario = 12 ;p_onart_diag_15pl_12_1 = p_onart_diag_15pl;keep year p_onart_diag_15pl_12_1 ;
data optima_12 ; set all; if model=2;if scenario = 12 ;p_onart_diag_15pl_12_2 = p_onart_diag_15pl;keep year p_onart_diag_15pl_12_2 ;
data hiv_synthesis_12 ; set all; if model=3;if scenario = 12 ;p_onart_diag_15pl_12_3 = p_onart_diag_15pl;keep year p_onart_diag_15pl_12_3 ;

data a.p_onart_diag_15pl ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_12 optima_12 hiv_synthesis_12 ;

ods html;

proc sgplot data = a.p_onart_diag_15pl ; 
Title    height=1.5 justify=center "Proportion on ART of those diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2023   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05) valueattrs=(size=10);

label p_onart_diag_15pl_0_1 = "Goals - SQ ";
label p_onart_diag_15pl_0_2 = "Optima - SQ ";
label p_onart_diag_15pl_0_3 = "Synthesis - SQ ";
label p_onart_diag_15pl_12_1 = "Goals - int 12 ";
label p_onart_diag_15pl_12_2 = "Optima - int 12 ";
label p_onart_diag_15pl_12_3 = "Synthesis - int 12 ";

series  x=year y=p_onart_diag_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=p_onart_diag_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=p_onart_diag_15pl_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=p_onart_diag_15pl_12_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=p_onart_diag_15pl_12_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=p_onart_diag_15pl_12_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;


*/




/*

data goals_0 ; set all; if model=1; if scenario = 0 ; p_vl1000_onart_15pl_0_1 = p_vl1000_onart_15pl; keep year p_vl1000_onart_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; p_vl1000_onart_15pl_0_2 = p_vl1000_onart_15pl;keep year p_vl1000_onart_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;p_vl1000_onart_15pl_0_3 = p_vl1000_onart_15pl;keep year p_vl1000_onart_15pl_0_3 ;

data goals_13 ; set all; if model=1;if scenario = 13 ;p_vl1000_onart_15pl_13_1 = p_vl1000_onart_15pl;keep year p_vl1000_onart_15pl_13_1 ;
data optima_13 ; set all; if model=2;if scenario = 13 ;p_vl1000_onart_15pl_13_2 = p_vl1000_onart_15pl;keep year p_vl1000_onart_15pl_13_2 ;
data hiv_synthesis_13 ; set all; if model=3;if scenario = 13 ;p_vl1000_onart_15pl_13_3 = p_vl1000_onart_15pl;keep year p_vl1000_onart_15pl_13_3 ;

data a.p_vl1000_onart_15pl ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_13 optima_13 hiv_synthesis_13 ;

ods html;

proc sgplot data = a.p_vl1000_onart_15pl ; 
Title    height=1.5 justify=center "Proportion of people on ART with VL suppression";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2023   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.8 to 1   by 0.05) valueattrs=(size=10);

label p_vl1000_onart_15pl_0_1 = "Goals - SQ ";
label p_vl1000_onart_15pl_0_2 = "Optima - SQ ";
label p_vl1000_onart_15pl_0_3 = "Synthesis - SQ ";
label p_vl1000_onart_15pl_13_1 = "Goals - int 13 ";
label p_vl1000_onart_15pl_13_2 = "Optima - int 13 ";
label p_vl1000_onart_15pl_13_3 = "Synthesis - int 13 ";

series  x=year y=p_vl1000_onart_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=p_vl1000_onart_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=p_vl1000_onart_15pl_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=p_vl1000_onart_15pl_13_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=p_vl1000_onart_15pl_13_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=p_vl1000_onart_15pl_13_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;

*/




/*


ods html;

proc sgplot data = a.n_hiv_deaths_15pl nolegend; 
Title    height=1.5 justify=center "Number of deaths in age 15 plus";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  80000   by 10000) valueattrs=(size=10);

* label n_hiv_deaths_15pl_0_1 = "Goals - SQ ";
* label n_hiv_deaths_15pl_0_2 = "Optima - SQ ";
* label n_hiv_deaths_15pl_0_3 = "Synthesis - SQ ";
* label n_hiv_deaths_15pl_20_1 = "Goals - int 20 ";
* label n_hiv_deaths_15pl_20_2 = "Optima - int 20 ";
* label n_hiv_deaths_15pl_20_3 = "Synthesis - int 20 ";

series  x=year y=n_hiv_deaths_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=n_hiv_deaths_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=n_hiv_deaths_15pl_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=n_hiv_deaths_15pl_20_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=n_hiv_deaths_15pl_20_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=n_hiv_deaths_15pl_20_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;



*/


/*



ods html;

proc sgplot data = a.new_infection_15pl nolegend ; 
Title    height=1.5 justify=center "Number of new infections age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 10000) valueattrs=(size=10);

label new_infection_15pl_0_1 = "Goals - SQ ";
label new_infection_15pl_0_2 = "Optima - SQ ";
label new_infection_15pl_0_3 = "Synthesis - SQ ";
label new_infection_15pl_20_1 = "Goals - int 20 ";
label new_infection_15pl_20_2 = "Optima - int 20 ";
label new_infection_15pl_20_3 = "Synthesis - int 20 ";

series  x=year y=new_infection_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=new_infection_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=new_infection_15pl_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=new_infection_15pl_20_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
series  x=year y=new_infection_15pl_20_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=new_infection_15pl_20_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;


*/


/*

data goals_0 ; set all; if model=1; if scenario = 0 ; new_infection_15pl_0_1 = new_infection_15pl; keep year new_infection_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; new_infection_15pl_0_2 = new_infection_15pl;keep year new_infection_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;new_infection_15pl_0_3 = new_infection_15pl;keep year new_infection_15pl_0_3 ;

data goals_10 ; set all; if model=1;if scenario = 10 ;new_infection_15pl_10_1 = new_infection_15pl;keep year new_infection_15pl_10_1 ;
data optima_10 ; set all; if model=2;if scenario = 10 ;new_infection_15pl_10_2 = new_infection_15pl;keep year new_infection_15pl_10_2 ;
data hiv_synthesis_10 ; set all; if model=3;if scenario = 10 ;new_infection_15pl_10_3 = new_infection_15pl;keep year new_infection_15pl_10_3 ;

data a.new_infection_15pl ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_10 optima_10 hiv_synthesis_10 ;


ods html;

proc sgplot data = a.new_infection_15pl nolegend ; 
Title    height=1.5 justify=center "Number of new infections age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 10000) valueattrs=(size=10);

label new_infection_15pl_0_1 = "Goals - SQ ";
label new_infection_15pl_0_2 = "Optima - SQ ";
label new_infection_15pl_0_3 = "Synthesis - SQ ";

series  x=year y=new_infection_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=new_infection_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=new_infection_15pl_0_3/	lineattrs = (color=green thickness = 2);

run;

quit;

*/



/*


data goals_0 ; set all; if model=1; if scenario = 0 ; variable_0_1 = variable; keep year variable_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; variable_0_2 = variable;keep year variable_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;variable_0_3 = variable;keep year variable_0_3 ;

ods html;

proc sgplot data = a.n_hiv_deaths_15pl nolegend; 
Title    height=1.5 justify=center "Number of deaths in age 15 plus";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  80000   by 10000) valueattrs=(size=10);

 label n_hiv_deaths_15pl_0_1 = "Goals - SQ ";
 label n_hiv_deaths_15pl_0_2 = "Optima - SQ ";
 label n_hiv_deaths_15pl_0_3 = "Synthesis - SQ ";

series  x=year y=n_hiv_deaths_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=n_hiv_deaths_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=n_hiv_deaths_15pl_0_3/	lineattrs = (color=green thickness = 2);

run;

quit;

*/




/*

data goals_0 ; set all; if model=1; if scenario = 0 ; new_infection_15pl_0_1 = new_infection_15pl; keep year new_infection_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; new_infection_15pl_0_2 = new_infection_15pl;keep year new_infection_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;new_infection_15pl_0_3 = new_infection_15pl;keep year new_infection_15pl_0_3 ;

data goals_10 ; set all; if model=1;if scenario = 10 ;new_infection_15pl_10_1 = new_infection_15pl;keep year new_infection_15pl_10_1 ;
data optima_10 ; set all; if model=2;if scenario = 10 ;new_infection_15pl_10_2 = new_infection_15pl;keep year new_infection_15pl_10_2 ;
data hiv_synthesis_10 ; set all; if model=3;if scenario = 10 ;new_infection_15pl_10_3 = new_infection_15pl;keep year new_infection_15pl_10_3 ;

data a.new_infection_15pl ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_10 optima_10 hiv_synthesis_10 ;

ods html;

proc sgplot data = a.new_infection_15pl nolegend ; 
Title    height=1.5 justify=center "Number of new infections age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 10000) valueattrs=(size=10);

label new_infection_15pl_0_1 = "Goals - SQ ";
label new_infection_15pl_0_2 = "Optima - SQ ";
label new_infection_15pl_0_3 = "Synthesis - SQ ";

series  x=year y=new_infection_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=new_infection_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=new_infection_15pl_0_3/	lineattrs = (color=green thickness = 2);

run;

quit;

*/




/*

* outputs for graph showing effects of all interventions ;

proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=0 and 2024 <= year <= 2040; run;
data out_1_0; set xx; scenario=0; model=1; drop _TYPE_ _FREQ_;
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=1 and 2024 <= year <= 2040; run;
data out_1_1; set xx; scenario=1; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=2 and 2024 <= year <= 2040; run;
data out_1_2; set xx; scenario=2; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=3 and 2024 <= year <= 2040; run;
data out_1_3; set xx; scenario=3; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=4 and 2024 <= year <= 2040; run;
data out_1_4; set xx; scenario=4; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=5 and 2024 <= year <= 2040; run;
data out_1_5; set xx; scenario=5; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=6 and 2024 <= year <= 2040; run;
data out_1_6; set xx; scenario=6; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=7 and 2024 <= year <= 2040; run;
data out_1_7; set xx; scenario=7; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=8 and 2024 <= year <= 2040; run;
data out_1_8; set xx; scenario=8; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=9 and 2024 <= year <= 2040; run;
data out_1_9; set xx; scenario=9; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=10 and 2024 <= year <= 2040; run;
data out_1_10; set xx; scenario=10; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=11 and 2024 <= year <= 2040; run;
data out_1_11; set xx; scenario=11; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=12 and 2024 <= year <= 2040; run;
data out_1_12; set xx; scenario=12; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=13 and 2024 <= year <= 2040; run;
data out_1_13; set xx; scenario=13; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=14 and 2024 <= year <= 2040; run;
data out_1_14; set xx; scenario=14; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=15 and 2024 <= year <= 2040; run;
data out_1_15; set xx; scenario=15; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=200 and 2024 <= year <= 2040; run;
data out_1_200; set xx; scenario=200; model=1;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=1 and scenario=20 and 2024 <= year <= 2040; run;
data out_1_20; set xx; scenario=20; model=1;  drop _TYPE_ _FREQ_; 


proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=0 and 2024 <= year <= 2040; run;
data out_2_0; set xx; scenario=0; model=2; drop _TYPE_ _FREQ_;
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=1 and 2024 <= year <= 2040; run;
data out_2_1; set xx; scenario=1; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=2 and 2024 <= year <= 2040; run;
data out_2_2; set xx; scenario=2; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=3 and 2024 <= year <= 2040; run;
data out_2_3; set xx; scenario=3; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=4 and 2024 <= year <= 2040; run;
data out_2_4; set xx; scenario=4; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=5 and 2024 <= year <= 2040; run;
data out_2_5; set xx; scenario=5; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=6 and 2024 <= year <= 2040; run;
data out_2_6; set xx; scenario=6; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=7 and 2024 <= year <= 2040; run;
data out_2_7; set xx; scenario=7; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=8 and 2024 <= year <= 2040; run;
data out_2_8; set xx; scenario=8; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=9 and 2024 <= year <= 2040; run;
data out_2_9; set xx; scenario=9; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=10 and 2024 <= year <= 2040; run;
data out_2_10; set xx; scenario=10; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=11 and 2024 <= year <= 2040; run;
data out_2_11; set xx; scenario=11; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=12 and 2024 <= year <= 2040; run;
data out_2_12; set xx; scenario=12; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=13 and 2024 <= year <= 2040; run;
data out_2_13; set xx; scenario=13; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=14 and 2024 <= year <= 2040; run;
data out_2_14; set xx; scenario=14; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=15 and 2024 <= year <= 2040; run;
data out_2_15; set xx; scenario=15; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=200 and 2024 <= year <= 2040; run;
data out_2_200; set xx; scenario=200; model=2;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=2 and scenario=20 and 2024 <= year <= 2040; run;
data out_2_20; set xx; scenario=20; model=2;  drop _TYPE_ _FREQ_; 


proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=0 and 2024 <= year <= 2040; run;
data out_3_0; set xx; scenario=0; model=3; drop _TYPE_ _FREQ_;
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=1 and 2024 <= year <= 2040; run;
data out_3_1; set xx; scenario=1; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=2 and 2024 <= year <= 2040; run;
data out_3_2; set xx; scenario=2; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=3 and 2024 <= year <= 2040; run;
data out_3_3; set xx; scenario=3; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=4 and 2024 <= year <= 2040; run;
data out_3_4; set xx; scenario=4; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=5 and 2024 <= year <= 2040; run;
data out_3_5; set xx; scenario=5; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=6 and 2024 <= year <= 2040; run;
data out_3_6; set xx; scenario=6; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=7 and 2024 <= year <= 2040; run;
data out_3_7; set xx; scenario=7; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=8 and 2024 <= year <= 2040; run;
data out_3_8; set xx; scenario=8; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=9 and 2024 <= year <= 2040; run;
data out_3_9; set xx; scenario=9; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=10 and 2024 <= year <= 2040; run;
data out_3_10; set xx; scenario=10; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=11 and 2024 <= year <= 2040; run;
data out_3_11; set xx; scenario=11; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=12 and 2024 <= year <= 2040; run;
data out_3_12; set xx; scenario=12; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=13 and 2024 <= year <= 2040; run;
data out_3_13; set xx; scenario=13; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=14 and 2024 <= year <= 2040; run;
data out_3_14; set xx; scenario=14; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=15 and 2024 <= year <= 2040; run;
data out_3_15; set xx; scenario=15; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=200 and 2024 <= year <= 2040; run;
data out_3_200; set xx; scenario=200; model=3;  drop _TYPE_ _FREQ_; 
proc means noprint data=all; var new_infection_15pl ; output out=xx mean=new_infection_15pl; where model=3 and scenario=20 and 2024 <= year <= 2040; run;
data out_3_20; set xx; scenario=20; model=3;  drop _TYPE_ _FREQ_; 

data all_out; set 
out_1_0 out_1_1 out_1_2 out_1_3 out_1_4 out_1_5 out_1_6 out_1_7 out_1_8 out_1_9 out_1_10 out_1_11 out_1_12 out_1_13 out_1_14 out_1_15 out_1_200 out_1_20
out_2_0 out_2_1 out_2_2 out_2_3 out_2_4 out_2_5 out_2_6 out_2_7 out_2_8 out_2_9 out_2_10 out_2_11 out_2_12 out_2_13 out_2_14 out_2_15 out_2_200 out_2_20
out_3_0 out_3_1 out_3_2 out_3_3 out_3_4 out_3_5 out_3_6 out_3_7 out_3_8 out_3_9 out_3_10 out_3_11 out_3_12 out_3_13 out_3_14 out_3_15 out_3_200 out_3_20
;
run;

proc print; run;

*/

