

ods html close;

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\";

* debra spreadhseet  * save first as a .xlsx file ;

* "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx" ;



* goals ;

proc import
out=goals_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_SQ"; getnames=n; range="A3:BC43";run;
data goals_sq; set goals_sq_;  model = 1; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_target"; getnames=n; range="A3:BC43";run;
data goals_target; set goals_target_;  model = 1; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_midway"; getnames=n; range="A3:BC43";run;
data goals_midway; set goals_midway_;  model = 1; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int1"; getnames=n; range="A3:BC43";run;
data goals_int1; set goals_int1_;  model = 1; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int2"; getnames=n; range="A3:BC43";run;
data goals_int2; set goals_int2_;  model = 1; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int3"; getnames=n; range="A3:BC43";run;
data goals_int3; set goals_int3_;  model = 1; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int4"; getnames=n; range="A3:BC43";run;
data goals_int4; set goals_int4_;  model = 1; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int5"; getnames=n; range="A3:BC43";run;
data goals_int5; set goals_int5_;  model = 1; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int6"; getnames=n; range="A3:BC43";run;
data goals_int6; set goals_int6_;  model = 1; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int7"; getnames=n; range="A3:BC43";run;
data goals_int7; set goals_int7_;  model = 1; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int8"; getnames=n; range="A3:BC43";run;
data goals_int8; set goals_int8_;  model = 1; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int9"; getnames=n; range="A3:BC43";run;
data goals_int9; set goals_int9_;  model = 1; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int10"; getnames=n; range="A3:BC43";run;
data goals_int10; set goals_int10_;  model = 1; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int11"; getnames=n; range="A3:BC43";run;
data goals_int11; set goals_int11_;  model = 1; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int12"; getnames=n; range="A3:BC43";run;
data goals_int12; set goals_int12_;  model = 1; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int13"; getnames=n; range="A3:BC43";run;
data goals_int13; set goals_int13_;  model = 1; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int14"; getnames=n; range="A3:BC43";run;
data goals_int14; set goals_int14_;  model = 1; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=goals_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Goals_int15"; getnames=n; range="A3:BC43";run;
data goals_int15; set goals_int15_;  model = 1; scenario = 15;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";



* optima ;


proc import
out=optima_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_SQ"; getnames=n; range="A3:BC43";run;
data optima_sq; set optima_sq_;  model = 2; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_target"; getnames=n; range="A3:BC43";run;
data optima_target; set optima_target_;  model = 2; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_midway"; getnames=n; range="A3:BC43";run;
data optima_midway; set optima_midway_;  model = 2; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int1"; getnames=n; range="A3:BC43";run;
data optima_int1; set optima_int1_;  model = 2; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int2"; getnames=n; range="A3:BC43";run;
data optima_int2; set optima_int2_;  model = 2; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int3"; getnames=n; range="A3:BC43";run;
data optima_int3; set optima_int3_;  model = 2; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int4"; getnames=n; range="A3:BC43";run;
data optima_int4; set optima_int4_;  model = 2; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int5"; getnames=n; range="A3:BC43";run;
data optima_int5; set optima_int5_;  model = 2; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int6"; getnames=n; range="A3:BC43";run;
data optima_int6; set optima_int6_;  model = 2; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int7"; getnames=n; range="A3:BC43";run;
data optima_int7; set optima_int7_;  model = 2; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int8"; getnames=n; range="A3:BC43";run;
data optima_int8; set optima_int8_;  model = 2; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int9"; getnames=n; range="A3:BC43";run;
data optima_int9; set optima_int9_;  model = 2; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int10"; getnames=n; range="A3:BC43";run;
data optima_int10; set optima_int10_;  model = 2; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int11"; getnames=n; range="A3:BC43";run;
data optima_int11; set optima_int11_;  model = 2; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int12"; getnames=n; range="A3:BC43";run;
data optima_int12; set optima_int12_;  model = 2; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int13"; getnames=n; range="A3:BC43";run;
data optima_int13; set optima_int13_;  model = 2; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int14"; getnames=n; range="A3:BC43";run;
data optima_int14; set optima_int14_;  model = 2; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=optima_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="Optima_int15"; getnames=n; range="A3:BC43";run;
data optima_int15; set optima_int15_;  model = 2; scenario = 15;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";



* hiv synthesis ;

proc import
out=hiv_synthesis_sq_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_SQ"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_sq; set hiv_synthesis_sq_;  model = 3; scenario = 0;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_target_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_target"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_target; set hiv_synthesis_target_;  model = 3; scenario = 20;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_midway_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_midway"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_midway; set hiv_synthesis_midway_;  model = 3; scenario = 200;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int1_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int1"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int1; set hiv_synthesis_int1_;  model = 3; scenario = 1;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int2_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int2"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int2; set hiv_synthesis_int2_;  model = 3; scenario = 2;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int3_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int3"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int3; set hiv_synthesis_int3_;  model = 3; scenario = 3;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int4_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int4"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int4; set hiv_synthesis_int4_;  model = 3; scenario = 4;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int5_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int5"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int5; set hiv_synthesis_int5_;  model = 3; scenario = 5;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int6_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int6"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int6; set hiv_synthesis_int6_;  model = 3; scenario = 6;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int7_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int7"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int7; set hiv_synthesis_int7_;  model = 3; scenario = 7;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int8_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int8"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int8; set hiv_synthesis_int8_;  model = 3; scenario = 8;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int9_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int9"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int9; set hiv_synthesis_int9_;  model = 3; scenario = 9;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int10_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int10"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int10; set hiv_synthesis_int10_;  model = 3; scenario = 10;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int11_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int11"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int11; set hiv_synthesis_int11_;  model = 3; scenario = 11;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int12_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int12"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int12; set hiv_synthesis_int12_;  model = 3; scenario = 12;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int13_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int13"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int13; set hiv_synthesis_int13_;  model = 3; scenario = 13;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int14_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int14"; getnames=n; range="A3:BC43";run;
data hiv_synthesis_int14; set hiv_synthesis_int14_;  model = 3; scenario = 14;
%include "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling\kenya_multi_model_variables.sas";

proc import
out=hiv_synthesis_int15_ 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel_dec24.xlsx"
dbms=xlsx replace; sheet="HIV Synthesis_int15"; getnames=n; range="A3:BC43";run;
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

p_onart_15pl = (n_onart_15pl / n_hiv_15pl) * 100 ;
cost = cost / 1000000 ;

dcost = cost / (1.03**(year-2024));
dcost = dcost * 1000000;
ddalys = dalys / (1.03**(year-2024));
dnew_infection = new_infection_15pl / (1.03**(year-2024));











* mean ddalys averted and cost incurred for 2024-2040 - and icer by model and intervention - including mean and range;

data z; set all; 
keep model scenario year ddalys  ;

proc transpose data = z  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;

proc transpose data = z  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;


proc transpose data = z  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;


data z_int1_1; merge d_1_0 d_1_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=1; scenario=1; 
data z_int1_2; merge d_2_0 d_2_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=2; scenario=1; 
data z_int1_3; merge d_3_0 d_3_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=3; scenario=1; 
data z_int1; set z_int1_1 z_int1_2 z_int1_3;  keep scenario model effect_ddalys;

data z_int2_1; merge d_1_0 d_1_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=1; scenario=2; 
data z_int2_2; merge d_2_0 d_2_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=2; scenario=2; 
data z_int2_3; merge d_3_0 d_3_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=3; scenario=2; 
data z_int2; set z_int2_1 z_int2_2 z_int2_3;  keep scenario model effect_ddalys;

data z_int3_1; merge d_1_0 d_1_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=1; scenario=3; 
data z_int3_2; merge d_2_0 d_2_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=2; scenario=3; 
data z_int3_3; merge d_3_0 d_3_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=3; scenario=3; 
data z_int3; set z_int3_1 z_int3_2 z_int3_3;  keep scenario model effect_ddalys;

data z_int4_1; merge d_1_0 d_1_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=1; scenario=4; 
data z_int4_2; merge d_2_0 d_2_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=2; scenario=4; 
data z_int4_3; merge d_3_0 d_3_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=3; scenario=4; 
data z_int4; set z_int4_1 z_int4_2 z_int4_3;  keep scenario model effect_ddalys;

data z_int5_1; merge d_1_0 d_1_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=1; scenario=5; 
data z_int5_2; merge d_2_0 d_2_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=2; scenario=5; 
data z_int5_3; merge d_3_0 d_3_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=3; scenario=5; 
data z_int5; set z_int5_1 z_int5_2 z_int5_3;  keep scenario model effect_ddalys;

data z_int6_1; merge d_1_0 d_1_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=1; scenario=6; 
data z_int6_2; merge d_2_0 d_2_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=2; scenario=6; 
data z_int6_3; merge d_3_0 d_3_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=3; scenario=6; 
data z_int6; set z_int6_1 z_int6_2 z_int6_3;  keep scenario model effect_ddalys;

data z_int7_1; merge d_1_0 d_1_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=1; scenario=7; 
data z_int7_2; merge d_2_0 d_2_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=2; scenario=7; 
data z_int7_3; merge d_3_0 d_3_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=3; scenario=7; 
data z_int7; set z_int7_1 z_int7_2 z_int7_3;  keep scenario model effect_ddalys;

data z_int8_1; merge d_1_0 d_1_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=1; scenario=8; 
data z_int8_2; merge d_2_0 d_2_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=2; scenario=8; 
data z_int8_3; merge d_3_0 d_3_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=3; scenario=8; 
data z_int8; set z_int8_1 z_int8_2 z_int8_3;  keep scenario model effect_ddalys;

data z_int9_1; merge d_1_0 d_1_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=1; scenario=9; 
data z_int9_2; merge d_2_0 d_2_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=2; scenario=9; 
data z_int9_3; merge d_3_0 d_3_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=3; scenario=9; 
data z_int9; set z_int9_1 z_int9_2 z_int9_3;  keep scenario model effect_ddalys;

data z_int10_1; merge d_1_0 d_1_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=1; scenario=10; 
data z_int10_2; merge d_2_0 d_2_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=2; scenario=10; 
data z_int10_3; merge d_3_0 d_3_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=3; scenario=10; 
data z_int10; set z_int10_1 z_int10_2 z_int10_3;  keep scenario model effect_ddalys;

data z_int11_1; merge d_1_0 d_1_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=1; scenario=11; 
data z_int11_2; merge d_2_0 d_2_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=2; scenario=11; 
data z_int11_3; merge d_3_0 d_3_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=3; scenario=11; 
data z_int11; set z_int11_1 z_int11_2 z_int11_3;  keep scenario model effect_ddalys;

data z_int12_1; merge d_1_0 d_1_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=1; scenario=12; 
data z_int12_2; merge d_2_0 d_2_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=2; scenario=12; 
data z_int12_3; merge d_3_0 d_3_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=3; scenario=12; 
data z_int12; set z_int12_1 z_int12_2 z_int12_3;  keep scenario model effect_ddalys;

data z_int13_1; merge d_1_0 d_1_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=1; scenario=13; 
data z_int13_2; merge d_2_0 d_2_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=2; scenario=13; 
data z_int13_3; merge d_3_0 d_3_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=3; scenario=13; 
data z_int13; set z_int13_1 z_int13_2 z_int13_3;  keep scenario model effect_ddalys;

data z_int14_1; merge d_1_0 d_1_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=1; scenario=14; 
data z_int14_2; merge d_2_0 d_2_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=2; scenario=14; 
data z_int14_3; merge d_3_0 d_3_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=3; scenario=14; 
data z_int14; set z_int14_1 z_int14_2 z_int14_3;  keep scenario model effect_ddalys;

data z_int15_1; merge d_1_0 d_1_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=1; scenario=15; 
data z_int15_2; merge d_2_0 d_2_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=2; scenario=15; 
data z_int15_3; merge d_3_0 d_3_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=3; scenario=15; 
data z_int15; set z_int15_1 z_int15_2 z_int15_3;  keep scenario model effect_ddalys;


data ddalys_averted; set z_int1 z_int2 z_int3 z_int4 z_int5 z_int6 z_int7
 z_int8 z_int9 z_int10 z_int11 z_int12 z_int13 z_int14 z_int15; 


data u; set all; 
keep model scenario year dcost  ;

proc transpose data = u  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;

proc transpose data = u  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;


proc transpose data = u  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;



data u_int1_1; merge d_1_0 d_1_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=1; scenario=1; 
data u_int1_2; merge d_2_0 d_2_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=2; scenario=1; 
data u_int1_3; merge d_3_0 d_3_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=3; scenario=1; 
data u_int1; set u_int1_1 u_int1_2 u_int1_3;  keep scenario model effect_dcost;

data u_int2_1; merge d_1_0 d_1_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=1; scenario=2; 
data u_int2_2; merge d_2_0 d_2_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=2; scenario=2; 
data u_int2_3; merge d_3_0 d_3_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=3; scenario=2; 
data u_int2; set u_int2_1 u_int2_2 u_int2_3;  keep scenario model effect_dcost;

data u_int3_1; merge d_1_0 d_1_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=1; scenario=3; 
data u_int3_2; merge d_2_0 d_2_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=2; scenario=3; 
data u_int3_3; merge d_3_0 d_3_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=3; scenario=3; 
data u_int3; set u_int3_1 u_int3_2 u_int3_3;  keep scenario model effect_dcost;

data u_int4_1; merge d_1_0 d_1_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=1; scenario=4; 
data u_int4_2; merge d_2_0 d_2_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=2; scenario=4; 
data u_int4_3; merge d_3_0 d_3_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=3; scenario=4; 
data u_int4; set u_int4_1 u_int4_2 u_int4_3;  keep scenario model effect_dcost;

data u_int5_1; merge d_1_0 d_1_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=1; scenario=5; 
data u_int5_2; merge d_2_0 d_2_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=2; scenario=5; 
data u_int5_3; merge d_3_0 d_3_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=3; scenario=5; 
data u_int5; set u_int5_1 u_int5_2 u_int5_3;  keep scenario model effect_dcost;

data u_int6_1; merge d_1_0 d_1_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=1; scenario=6; 
data u_int6_2; merge d_2_0 d_2_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=2; scenario=6; 
data u_int6_3; merge d_3_0 d_3_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=3; scenario=6; 
data u_int6; set u_int6_1 u_int6_2 u_int6_3;  keep scenario model effect_dcost;

data u_int7_1; merge d_1_0 d_1_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=1; scenario=7; 
data u_int7_2; merge d_2_0 d_2_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=2; scenario=7; 
data u_int7_3; merge d_3_0 d_3_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=3; scenario=7; 
data u_int7; set u_int7_1 u_int7_2 u_int7_3;  keep scenario model effect_dcost;

data u_int8_1; merge d_1_0 d_1_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=1; scenario=8; 
data u_int8_2; merge d_2_0 d_2_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=2; scenario=8; 
data u_int8_3; merge d_3_0 d_3_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=3; scenario=8; 
data u_int8; set u_int8_1 u_int8_2 u_int8_3;  keep scenario model effect_dcost;

data u_int9_1; merge d_1_0 d_1_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=1; scenario=9; 
data u_int9_2; merge d_2_0 d_2_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=2; scenario=9; 
data u_int9_3; merge d_3_0 d_3_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=3; scenario=9; 
data u_int9; set u_int9_1 u_int9_2 u_int9_3;  keep scenario model effect_dcost;

data u_int10_1; merge d_1_0 d_1_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=1; scenario=10; 
data u_int10_2; merge d_2_0 d_2_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=2; scenario=10; 
data u_int10_3; merge d_3_0 d_3_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=3; scenario=10; 
data u_int10; set u_int10_1 u_int10_2 u_int10_3;  keep scenario model effect_dcost;

data u_int11_1; merge d_1_0 d_1_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=1; scenario=11; 
data u_int11_2; merge d_2_0 d_2_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=2; scenario=11; 
data u_int11_3; merge d_3_0 d_3_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=3; scenario=11; 
data u_int11; set u_int11_1 u_int11_2 u_int11_3;  keep scenario model effect_dcost;

data u_int12_1; merge d_1_0 d_1_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=1; scenario=12; 
data u_int12_2; merge d_2_0 d_2_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=2; scenario=12; 
data u_int12_3; merge d_3_0 d_3_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=3; scenario=12; 
data u_int12; set u_int12_1 u_int12_2 u_int12_3;  keep scenario model effect_dcost;

data u_int13_1; merge d_1_0 d_1_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=1; scenario=13; 
data u_int13_2; merge d_2_0 d_2_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=2; scenario=13; 
data u_int13_3; merge d_3_0 d_3_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=3; scenario=13; 
data u_int13; set u_int13_1 u_int13_2 u_int13_3;  keep scenario model effect_dcost;

data u_int14_1; merge d_1_0 d_1_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=1; scenario=14; 
data u_int14_2; merge d_2_0 d_2_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=2; scenario=14; 
data u_int14_3; merge d_3_0 d_3_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=3; scenario=14; 
data u_int14; set u_int14_1 u_int14_2 u_int14_3;  keep scenario model effect_dcost;

data u_int15_1; merge d_1_0 d_1_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=1; scenario=15; 
data u_int15_2; merge d_2_0 d_2_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=2; scenario=15; 
data u_int15_3; merge d_3_0 d_3_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=3; scenario=15; 
data u_int15; set u_int15_1 u_int15_2 u_int15_3;  keep scenario model effect_dcost;


data dcost_incurred; set u_int1 u_int2 u_int3 u_int4 u_int5 u_int6 u_int7
 u_int8 u_int9 u_int10 u_int11 u_int12 u_int13 u_int14 u_int15; 



data cost_ddaly; merge ddalys_averted dcost_incurred ;

icer=.; if effect_dcost > 0 and effect_ddalys < 0 then icer = effect_dcost / (-effect_ddalys);
if . < effect_dcost <= 0 and effect_ddalys < 0 then icer = 0; if effect_ddalys >= 0 then icer=1000000;

icer = log10(icer+1);


* plots of mean and range of icers across models by intervention ;

data icer_s_1;  set cost_ddaly; if scenario=1; proc transpose out=s_1; data v_1; set s_1; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); 
if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;
intervention=1; keep lower upper mean intervention;
data icer_s_2;  set cost_ddaly; if scenario=2; proc transpose out=s_2; data v_2; set s_2; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=2; keep mean lower upper intervention;
data icer_s_3;  set cost_ddaly; if scenario=3; proc transpose out=s_3; data v_3; set s_3; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=3; keep mean lower upper intervention;
data icer_s_4;  set cost_ddaly; if scenario=4; proc transpose out=s_4; data v_4; set s_4; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=4; keep mean lower upper intervention;
data icer_s_5;  set cost_ddaly; if scenario=5; proc transpose out=s_5; data v_5; set s_5; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=5; keep mean lower upper intervention;
data icer_s_6;  set cost_ddaly; if scenario=6; proc transpose out=s_6; data v_6; set s_6; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=6; keep mean lower upper intervention;
data icer_s_7;  set cost_ddaly; if scenario=7; proc transpose out=s_7; data v_7; set s_7; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=7; keep mean lower upper intervention;
data icer_s_8;  set cost_ddaly; if scenario=8; proc transpose out=s_8; data v_8; set s_8; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=8; keep mean lower upper intervention;
data icer_s_9;  set cost_ddaly; if scenario=9; proc transpose out=s_9; data v_9; set s_9; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=9; keep mean lower upper intervention;
data icer_s_10;  set cost_ddaly; if scenario=10; proc transpose out=s_10; data v_10; set s_10; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=10; keep mean lower upper intervention;
data icer_s_11;  set cost_ddaly; if scenario=11; proc transpose out=s_11; data v_11; set s_11; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=11; keep mean lower upper intervention;
data icer_s_12;  set cost_ddaly; if scenario=12; proc transpose out=s_12; data v_12; set s_12; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=12; keep mean lower upper intervention;
data icer_s_13;  set cost_ddaly; if scenario=13; proc transpose out=s_13; data v_13; set s_13; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=13; keep mean lower upper intervention;
data icer_s_14;  set cost_ddaly; if scenario=14; proc transpose out=s_14; data v_14; set s_14; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=14; keep mean lower upper intervention;
data icer_s_15;  set cost_ddaly; if scenario=15; proc transpose out=s_15; data v_15; set s_15; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=15; keep mean lower upper intervention;


data all_icer;
set v_1 v_2 v_3 v_4 v_5 v_6 v_7 v_8 v_9 v_10 v_11 v_12 v_13 v_14 v_15
;

if intervention = 1 then int_name = 'a Testing_community';
if intervention = 2 then int_name = 'b Testing_risk_informed';
if intervention = 3 then int_name = 'c Self_testing_general';
if intervention = 4 then int_name = 'd Self_testing_risk_informed';
if intervention = 5 then int_name = 'e AGYW_testing';
if intervention = 6 then int_name = 'f AGYW_behaviour_change';
if intervention = 7 then int_name = 'g VMMC';
if intervention = 8 then int_name = 'h Oral_PrEP';
if intervention = 9 then int_name = 'i Oral/Cab PrEP';
if intervention = 10 then int_name = 'j Oral/Cab/VR_PrEP';
if intervention = 11 then int_name = 'k Harm_reduction_PWID';
if intervention = 12 then int_name = 'l ART_linkage_retention';
if intervention = 13 then int_name = 'm ART_adherence';
if intervention = 14 then int_name = 'n ART_coverage_PLW';
if intervention = 15 then int_name = 'o AHD_package';

ods html;
proc sgplot data=all_icer nolegend;
   title "ICER by Intervention (mean and range over models)";
   highlow x=int_name low=lower high=upper / type=bar lineattrs=(color=black thickness=2);
   scatter x=int_name y=mean / markerattrs=(symbol=circlefilled size=8 color=red);
   xaxis label="Intervention" type=discrete ;   	
   yaxis label="ICER (log10)" grid;
run;
ods html close;





















* ===================================================================================================================================================================;


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

data goals_0 ; set all; if model=1; if scenario = 0 ; new_infection_15pl_0_1 = new_infection_15pl; keep year new_infection_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; new_infection_15pl_0_2 = new_infection_15pl;keep year new_infection_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;new_infection_15pl_0_3 = new_infection_15pl;keep year new_infection_15pl_0_3 ;

data goals_20 ; set all; if model=1;if scenario = 20 ;new_infection_15pl_20_1 = new_infection_15pl;keep year new_infection_15pl_20_1 ;
data optima_20 ; set all; if model=2;if scenario = 20 ;new_infection_15pl_20_2 = new_infection_15pl;keep year new_infection_15pl_20_2 ;
data hiv_synthesis_20 ; set all; if model=3;if scenario = 20 ;new_infection_15pl_20_3 = new_infection_15pl;keep year new_infection_15pl_20_3 ;

data a.new_infection_15pl ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_20 optima_20 hiv_synthesis_20 ;

ods html;

proc sgplot data = a.new_infection_15pl nolegend; 
Title    height=1.5 justify=center "Annual number of new infections in adults age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  60000   by   5000) valueattrs=(size=10);

* label new_infection_15pl_0_1 = "Goals - SQ ";
* label new_infection_15pl_0_2 = "Optima - SQ ";
* label new_infection_15pl_0_3 = "Synthesis - SQ ";
* label new_infection_15pl_20_1 = "Goals - int 20 ";
* label new_infection_15pl_20_2 = "Optima - int 20 ";
* label new_infection_15pl_20_3 = "Synthesis - int 20 ";

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

* new infections by model and year;

data goals_0 ; set all; if model=1; if scenario = 0 ; new_infection_15pl_0_1 = new_infection_15pl; keep year new_infection_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; new_infection_15pl_0_2 = new_infection_15pl;keep year new_infection_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;new_infection_15pl_0_3 = new_infection_15pl;keep year new_infection_15pl_0_3 ;

data a.new_infection_15pl  ; 
merge goals_0 optima_0 hiv_synthesis_0 ;

ods html;
proc sgplot data = a.new_infection_15pl nolegend; 
Title    height=1.5 justify=center "Annual number of new infections in adults age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 160000   by 20000) valueattrs=(size=10);

series  x=year y=new_infection_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=new_infection_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=new_infection_15pl_0_3/	lineattrs = (color=green thickness = 2);
run;

quit;
ods html close;

*/

/*

* hiv deaths by model and year;

data goals_0 ; set all; if model=1; if scenario = 0 ; n_hiv_deaths_15pl_0_1 = n_hiv_deaths_15pl; keep year n_hiv_deaths_15pl_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; n_hiv_deaths_15pl_0_2 = n_hiv_deaths_15pl;keep year n_hiv_deaths_15pl_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;n_hiv_deaths_15pl_0_3 = n_hiv_deaths_15pl;keep year n_hiv_deaths_15pl_0_3 ;

data a.n_hiv_deaths_15pl  ; 
merge goals_0 optima_0 hiv_synthesis_0 ;

ods html;
proc sgplot data = a.n_hiv_deaths_15pl nolegend; 
Title    height=1.5 justify=center "Annual number of HIV deaths in adults age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 160000   by 20000) valueattrs=(size=10);

series  x=year y=n_hiv_deaths_15pl_0_1/	lineattrs = (color=black thickness = 2);
series  x=year y=n_hiv_deaths_15pl_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=n_hiv_deaths_15pl_0_3/	lineattrs = (color=green thickness = 2);
run;

quit;
ods html close;

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









/*

* effects of interventions at year 3;


data year_3; set all; if year = 2027 ;
keep model scenario year n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_15pl p_vl1000_onart_15pl p_men_15pl_circ ;

p_diagnosed_15pl = p_diagnosed_15pl * 100;
p_onart_diag_15pl = p_onart_diag_15pl * 100;
p_vl1000_onart_15pl = p_vl1000_onart_15pl * 100;
p_men_15pl_circ = p_men_15pl_circ* 100;


data year_3_0; set year_3; if scenario=0;
n_prep_sq = n_prep; n_condoms_sq = n_condoms; p_diagnosed_15pl_sq = p_diagnosed_15pl; p_onart_diag_15pl_sq = p_onart_diag_15pl; 
p_vl1000_onart_15pl_sq = p_vl1000_onart_15pl ; p_men_15pl_circ_sq = p_men_15pl_circ ; p_onart_15pl_sq = p_onart_15pl; 

data year_3_int1; set year_3; if scenario=1;
n_prep_int1 = n_prep; n_condoms_int1 = n_condoms; p_diagnosed_15pl_int1 = p_diagnosed_15pl; p_onart_diag_15pl_int1 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int1 = p_vl1000_onart_15pl ; p_men_15pl_circ_int1 = p_men_15pl_circ ;  p_onart_15pl_int1 = p_onart_15pl; 

data year_3_int2; set year_3; if scenario=2;
n_prep_int2 = n_prep; n_condoms_int2 = n_condoms; p_diagnosed_15pl_int2 = p_diagnosed_15pl; p_onart_diag_15pl_int2 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int2 = p_vl1000_onart_15pl ; p_men_15pl_circ_int2 = p_men_15pl_circ ; p_onart_15pl_int2 = p_onart_15pl;

data year_3_int3; set year_3; if scenario=3;
n_prep_int3 = n_prep; n_condoms_int3 = n_condoms; p_diagnosed_15pl_int3 = p_diagnosed_15pl; p_onart_diag_15pl_int3 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int3 = p_vl1000_onart_15pl ; p_men_15pl_circ_int3 = p_men_15pl_circ ; p_onart_15pl_int3 = p_onart_15pl; 

data year_3_int4; set year_3; if scenario=4;
n_prep_int4 = n_prep; n_condoms_int4 = n_condoms; p_diagnosed_15pl_int4 = p_diagnosed_15pl; p_onart_diag_15pl_int4 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int4 = p_vl1000_onart_15pl ; p_men_15pl_circ_int4 = p_men_15pl_circ ; p_onart_15pl_int4 = p_onart_15pl; 

data year_3_int5; set year_3; if scenario=5;
n_prep_int5 = n_prep; n_condoms_int5 = n_condoms; p_diagnosed_15pl_int5 = p_diagnosed_15pl; p_onart_diag_15pl_int5 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int5 = p_vl1000_onart_15pl ; p_men_15pl_circ_int5 = p_men_15pl_circ ; p_onart_15pl_int5 = p_onart_15pl; 

data year_3_int6; set year_3; if scenario=6;
n_prep_int6 = n_prep; n_condoms_int6 = n_condoms; p_diagnosed_15pl_int6 = p_diagnosed_15pl; p_onart_diag_15pl_int6 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int6 = p_vl1000_onart_15pl ; p_men_15pl_circ_int6 = p_men_15pl_circ ; p_onart_15pl_int6 = p_onart_15pl; 

data year_3_int7; set year_3; if scenario=7;
n_prep_int7 = n_prep; n_condoms_int7 = n_condoms; p_diagnosed_15pl_int7 = p_diagnosed_15pl; p_onart_diag_15pl_int7 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int7 = p_vl1000_onart_15pl ; p_men_15pl_circ_int7 = p_men_15pl_circ ; p_onart_15pl_int7 = p_onart_15pl; 

data year_3_int8; set year_3; if scenario=8;
n_prep_int8 = n_prep; n_condoms_int8 = n_condoms; p_diagnosed_15pl_int8 = p_diagnosed_15pl; p_onart_diag_15pl_int8 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int8 = p_vl1000_onart_15pl ; p_men_15pl_circ_int8 = p_men_15pl_circ ; p_onart_15pl_int8 = p_onart_15pl; 

data year_3_int9; set year_3; if scenario=9;
n_prep_int9 = n_prep; n_condoms_int9 = n_condoms; p_diagnosed_15pl_int9 = p_diagnosed_15pl; p_onart_diag_15pl_int9 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int9 = p_vl1000_onart_15pl ; p_men_15pl_circ_int9 = p_men_15pl_circ ; p_onart_15pl_int9 = p_onart_15pl; 

data year_3_int10; set year_3; if scenario=10;
n_prep_int10 = n_prep; n_condoms_int10 = n_condoms; p_diagnosed_15pl_int10 = p_diagnosed_15pl; p_onart_diag_15pl_int10 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int10 = p_vl1000_onart_15pl ; p_men_15pl_circ_int10 = p_men_15pl_circ ; p_onart_15pl_int10 = p_onart_15pl; 

data year_3_int11; set year_3; if scenario=11;
n_prep_int11 = n_prep; n_condoms_int11 = n_condoms; p_diagnosed_15pl_int11 = p_diagnosed_15pl; p_onart_diag_15pl_int11 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int11 = p_vl1000_onart_15pl ; p_men_15pl_circ_int11 = p_men_15pl_circ ; p_onart_15pl_int11 = p_onart_15pl; 

data year_3_int12; set year_3; if scenario=12;
n_prep_int12 = n_prep; n_condoms_int12 = n_condoms; p_diagnosed_15pl_int12 = p_diagnosed_15pl; p_onart_diag_15pl_int12 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int12 = p_vl1000_onart_15pl ; p_men_15pl_circ_int12 = p_men_15pl_circ ;  p_onart_15pl_int12 = p_onart_15pl; 

data year_3_int13; set year_3; if scenario=13;
n_prep_int13 = n_prep; n_condoms_int13 = n_condoms; p_diagnosed_15pl_int13 = p_diagnosed_15pl; p_onart_diag_15pl_int13 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int13 = p_vl1000_onart_15pl ; p_men_15pl_circ_int13 = p_men_15pl_circ ; p_onart_15pl_int13 = p_onart_15pl; 

data year_3_int14; set year_3; if scenario=14;
n_prep_int14 = n_prep; n_condoms_int14 = n_condoms; p_diagnosed_15pl_int14 = p_diagnosed_15pl; p_onart_diag_15pl_int14 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int14 = p_vl1000_onart_15pl ; p_men_15pl_circ_int14 = p_men_15pl_circ ; p_onart_15pl_int14 = p_onart_15pl; 

data year_3_int15; set year_3; if scenario=15;
n_prep_int15 = n_prep; n_condoms_int15 = n_condoms; p_diagnosed_15pl_int15 = p_diagnosed_15pl; p_onart_diag_15pl_int15 = p_onart_diag_15pl; 
p_vl1000_onart_15pl_int15 = p_vl1000_onart_15pl ; p_men_15pl_circ_int15 = p_men_15pl_circ ; p_onart_15pl_int15 = p_onart_15pl; 



data year_3_effect_int1; merge year_3_0 year_3_int1 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int1 - n_prep_sq;
effect_n_condoms = n_condoms_int1 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int1 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int1 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int1 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int1 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int1 - p_men_15pl_circ_sq;
scenario=1;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int2; merge year_3_0 year_3_int2 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int2 - n_prep_sq;
effect_n_condoms = n_condoms_int2 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int2 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int2 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int2 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int2 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int2 - p_men_15pl_circ_sq;
scenario=2;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int3; merge year_3_0 year_3_int3 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int3 - n_prep_sq;
effect_n_condoms = n_condoms_int3 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int3 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int3 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int3 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int3 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int3 - p_men_15pl_circ_sq;
scenario=3;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int4; merge year_3_0 year_3_int4 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int4 - n_prep_sq;
effect_n_condoms = n_condoms_int4 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int4 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int4 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int4 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int4 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int4 - p_men_15pl_circ_sq;
scenario=4;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int5; merge year_3_0 year_3_int5 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int5 - n_prep_sq;
effect_n_condoms = n_condoms_int5 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int5 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int5 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int5 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int5 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int5 - p_men_15pl_circ_sq;
scenario=5;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int6; merge year_3_0 year_3_int6 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int6 - n_prep_sq;
effect_n_condoms = n_condoms_int6 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int6 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int6 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int6 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int6 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int6 - p_men_15pl_circ_sq;
scenario=6;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int7; merge year_3_0 year_3_int7 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int7 - n_prep_sq;
effect_n_condoms = n_condoms_int7 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int7 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int7 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int7 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int7 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int7 - p_men_15pl_circ_sq;
scenario=7;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int8; merge year_3_0 year_3_int8 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int8 - n_prep_sq;
effect_n_condoms = n_condoms_int8 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int8 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int8 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int8 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int8 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int8 - p_men_15pl_circ_sq;
scenario=8;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int9; merge year_3_0 year_3_int9 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int9 - n_prep_sq;
effect_n_condoms = n_condoms_int9 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int9 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int9 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int9 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int9 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int9 - p_men_15pl_circ_sq;
scenario=9;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int10; merge year_3_0 year_3_int10 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int10 - n_prep_sq;
effect_n_condoms = n_condoms_int10 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int10 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int10 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int10 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int10 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int10 - p_men_15pl_circ_sq;
scenario=10;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int11; merge year_3_0 year_3_int11 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int11 - n_prep_sq;
effect_n_condoms = n_condoms_int11 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int11 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int11 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int11 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int11 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int11 - p_men_15pl_circ_sq;
scenario=11;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int12; merge year_3_0 year_3_int12 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int12 - n_prep_sq;
effect_n_condoms = n_condoms_int12 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int12 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int12 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int12 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int12 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int12 - p_men_15pl_circ_sq;
scenario=12;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int13; merge year_3_0 year_3_int13 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int13 - n_prep_sq;
effect_n_condoms = n_condoms_int13 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int13 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int13 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int13 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int13 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int13 - p_men_15pl_circ_sq;
scenario=13;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int14; merge year_3_0 year_3_int14 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int14 - n_prep_sq;
effect_n_condoms = n_condoms_int14 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int14 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int14 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int14 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int14 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int14 - p_men_15pl_circ_sq;
scenario=14;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;

data year_3_effect_int15; merge year_3_0 year_3_int15 ; drop n_prep n_condoms p_diagnosed_15pl p_onart_diag_15pl p_onart_diag_15pl p_vl1000_onart_15pl p_men_15pl_circ ;
effect_n_prep = n_prep_int15 - n_prep_sq;
effect_n_condoms = n_condoms_int15 - n_condoms_sq;
effect_p_diagnosed_15pl = p_diagnosed_15pl_int15 - p_diagnosed_15pl_sq;
effect_p_onart_diag_15pl = p_onart_diag_15pl_int15 - p_onart_diag_15pl_sq;
effect_p_onart_15pl = p_onart_15pl_int15 - p_onart_15pl_sq;
effect_p_vl1000_onart_15pl = p_vl1000_onart_15pl_int15 - p_vl1000_onart_15pl_sq;
effect_p_men_15pl_circ = p_men_15pl_circ_int15 - p_men_15pl_circ_sq;
scenario=15;
keep model scenario effect_p_onart_15pl effect_n_prep effect_n_condoms effect_p_diagnosed_15pl effect_p_onart_diag_15pl effect_p_vl1000_onart_15pl effect_p_men_15pl_circ ;


data year_3_effect; set year_3_effect_int1 year_3_effect_int2 year_3_effect_int3 year_3_effect_int4 year_3_effect_int5 year_3_effect_int6 year_3_effect_int7
 year_3_effect_int8 year_3_effect_int9 year_3_effect_int10 year_3_effect_int11 year_3_effect_int12 year_3_effect_int13 year_3_effect_int14 year_3_effect_int15; 

if scenario = 1 then int_name = 'Testing_community';
if scenario = 2 then int_name = 'Testing_risk_informed';
if scenario = 3 then int_name = 'Self_testing_general';
if scenario = 4 then int_name = 'Self_testing_risk_informed';
if scenario = 5 then int_name = 'AGYW_testing';
if scenario = 6 then int_name = 'AGYW_behaviour_change';
if scenario = 7 then int_name = 'VMMC';
if scenario = 8 then int_name = 'Oral_PrEP';
if scenario = 9 then int_name = 'Oral/Cab PrEP';
if scenario = 10 then int_name = 'Oral/Cab/VR_PrEP';
if scenario = 11 then int_name = 'Harm_reduction_PWID';
if scenario = 12 then int_name = 'ART_linkage_retention';
if scenario = 13 then int_name = 'ART_adherence';
if scenario = 14 then int_name = 'ART_coverage_PLW';
if scenario = 15 then int_name = 'AHD_package';


ods html;

data x; set year_3_effect; 
if scenario in (8 9 10);
title 'Effect on number on PrEP in 2027';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_n_prep
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  xaxis label="Intervention" display=(noline noticks); 
  yaxis label="Effect on number on PrEP" display=(noline) grid;
run;


data x; set year_3_effect; 
if scenario in (1 2 3 4 5);
title 'Difference in percent of age15+ diagnosed in 2027';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_p_diagnosed_15pl
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  xaxis label="Intervention" display=(noline noticks); 
  yaxis label="Difference in percent of age15+ diagnosed" display=(noline) grid;
run;

data x; set year_3_effect; 
if scenario in (12 14);
title 'Difference in percent of diagnosed age15+ on ART in 2027';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_p_onart_diag_15pl
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  xaxis label="Intervention" display=(noline noticks); 
  yaxis label="Difference in percent of diagnosed age15+ on ART" display=(noline) grid;
run;

data x; set year_3_effect; 
if scenario in (1 2 3 4 5 12 14);
if effect_p_onart_15pl > 500000 then effect_p_onart_15pl = 0;
title 'Difference in percent of PLHIV age 15+ on ART in 2027';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_p_onart_15pl
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  xaxis label="Intervention" display=(noline noticks); 
  yaxis label="Difference in percent of PLHIV age15+ on ART" display=(noline) grid;
run;

data x; set year_3_effect; 
if scenario = 13;
title 'Difference in percent of age15+ on ART with VL suppression in 2027';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_p_vl1000_onart_15pl
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  xaxis label="Intervention" display=(noline noticks); 
  yaxis label="Difference in percent of age15+ on ART with VL suppression" display=(noline) grid;
run;

data x; set year_3_effect; 
if scenario = 7;
title 'Difference in percent of men age15+ circumcised in 2027';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_p_men_15pl_circ
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  xaxis label="Intervention" display=(noline noticks); 
  yaxis label="Difference in percent of men age15+ circumcised" display=(noline) grid;
run;


ods html close;


*/
 


/*

* dalys over time for targets and sq;

data goals_0 ; set all; if model=1; if scenario = 0 ; dalys_0_1 = dalys; keep year dalys_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; dalys_0_2 = dalys;keep year dalys_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;dalys_0_3 = dalys;keep year dalys_0_3 ;

data goals_target ; set all; if model=1;if scenario = 20 ;dalys_target_1 = dalys;keep year dalys_target_1 ;
data optima_target ; set all; if model=2;if scenario = 20 ;dalys_target_2 = dalys;keep year dalys_target_2 ;
data hiv_synthesis_target ; set all; if model=3;if scenario = 20 ;dalys_target_3 = dalys;keep year dalys_target_3 ;

data a.dalys ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_target optima_target hiv_synthesis_target ;

ods html;

proc sgplot data = a.dalys ; 
Title    height=1.5 justify=center "DALYs (undiscounted)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2024   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000   by 100000) valueattrs=(size=10);

label dalys_0_1 = "Goals - SQ ";
* label dalys_0_2 = "Optima - SQ ";
label dalys_0_3 = "Synthesis - SQ ";
label dalys_target_1 = "Goals - int target ";
* label dalys_target_2 = "Optima - int target ";
label dalys_target_3 = "Synthesis - int target ";

series  x=year y=dalys_0_1/	lineattrs = (color=black thickness = 2);
* series  x=year y=dalys_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=dalys_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=dalys_target_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
* series  x=year y=dalys_target_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=dalys_target_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

*/



/*

* costs over time for targets and sq;

data goals_0 ; set all; if model=1; if scenario = 0 ; cost_0_1 = cost; keep year cost_0_1 ;
data optima_0 ; set all; if model=2;if scenario = 0 ; cost_0_2 = cost;keep year cost_0_2 ;
data hiv_synthesis_0 ; set all; if model=3;if scenario = 0 ;cost_0_3 = cost;keep year cost_0_3 ;

data goals_target ; set all; if model=1;if scenario = 20 ;cost_target_1 = cost;keep year cost_target_1 ;
data optima_target ; set all; if model=2;if scenario = 20 ;cost_target_2 = cost;keep year cost_target_2 ;
data hiv_synthesis_target ; set all; if model=3;if scenario = 20 ;cost_target_3 = cost;keep year cost_target_3 ;

data a.cost ; 
merge goals_0 optima_0 hiv_synthesis_0 goals_target optima_target hiv_synthesis_target ;

ods html;

proc sgplot data = a.cost ; 
Title    height=1.5 justify=center "Cost (undiscounted)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2023   to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000   by 100) valueattrs=(size=10);

label cost_0_1 = "Goals - SQ ";
* label cost_0_2 = "Optima - SQ ";
label cost_0_3 = "Synthesis - SQ ";
label cost_target_1 = "Goals - int target ";
* label cost_target_2 = "Optima - int target ";
label cost_target_3 = "Synthesis - int target ";

series  x=year y=cost_0_1/	lineattrs = (color=black thickness = 2);
* series  x=year y=cost_0_2/	lineattrs = (color=red thickness = 2);
series  x=year y=cost_0_3/	lineattrs = (color=green thickness = 2);

series  x=year y=cost_target_1/	lineattrs = (color=black thickness = 2 pattern=shortdash) ;
* series  x=year y=cost_target_2/	lineattrs = (color=red thickness = 2 pattern=shortdash)  ;
series  x=year y=cost_target_3/	lineattrs = (color=green thickness = 2 pattern=shortdash) ;

run;

quit;

*/






/*

* graph of effects of interventions on mean dalys until 2040 ;


data z; set all; 
keep model scenario year dalys  ;

proc transpose data = z  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_sq;
proc transpose data = z  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int1;
proc transpose data = z  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int2;
proc transpose data = z  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int3;
proc transpose data = z  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int4;
proc transpose data = z  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int5;
proc transpose data = z  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int6;
proc transpose data = z  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int7;
proc transpose data = z  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int8;
proc transpose data = z  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int9;
proc transpose data = z  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int10;
proc transpose data = z  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int11;
proc transpose data = z  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int12;
proc transpose data = z  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int13;
proc transpose data = z  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int14;
proc transpose data = z  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int15;

proc transpose data = z  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_sq;
proc transpose data = z  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int1;
proc transpose data = z  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int2;
proc transpose data = z  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int3;
proc transpose data = z  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int4;
proc transpose data = z  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int5;
proc transpose data = z  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int6;
proc transpose data = z  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int7;
proc transpose data = z  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int8;
proc transpose data = z  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int9;
proc transpose data = z  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int10;
proc transpose data = z  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int11;
proc transpose data = z  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int12;
proc transpose data = z  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int13;
proc transpose data = z  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int14;
proc transpose data = z  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int15;


proc transpose data = z  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_sq;
proc transpose data = z  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int1;
proc transpose data = z  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int2;
proc transpose data = z  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int3;
proc transpose data = z  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int4;
proc transpose data = z  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int5;
proc transpose data = z  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int6;
proc transpose data = z  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int7;
proc transpose data = z  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int8;
proc transpose data = z  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int9;
proc transpose data = z  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int10;
proc transpose data = z  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int11;
proc transpose data = z  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int12;
proc transpose data = z  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int13;
proc transpose data = z  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int14;
proc transpose data = z  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'dalys' ; drop _NAME_; 
mean_dalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dalys_int15;


data z_effect_int1_1; merge d_1_0 d_1_1 ; effect_dalys = mean_dalys_int1 - mean_dalys_sq; model=1; scenario=1; 
data z_effect_int1_2; merge d_2_0 d_2_1 ; effect_dalys = mean_dalys_int1 - mean_dalys_sq; model=2; scenario=1; 
data z_effect_int1_3; merge d_3_0 d_3_1 ; effect_dalys = mean_dalys_int1 - mean_dalys_sq; model=3; scenario=1; 
data z_effect_int1; set z_effect_int1_1 z_effect_int1_2 z_effect_int1_3;  keep scenario model effect_dalys;

data z_effect_int2_1; merge d_1_0 d_1_2 ; effect_dalys = mean_dalys_int2 - mean_dalys_sq; model=1; scenario=2; 
data z_effect_int2_2; merge d_2_0 d_2_2 ; effect_dalys = mean_dalys_int2 - mean_dalys_sq; model=2; scenario=2; 
data z_effect_int2_3; merge d_3_0 d_3_2 ; effect_dalys = mean_dalys_int2 - mean_dalys_sq; model=3; scenario=2; 
data z_effect_int2; set z_effect_int2_1 z_effect_int2_2 z_effect_int2_3;  keep scenario model effect_dalys;

data z_effect_int3_1; merge d_1_0 d_1_3 ; effect_dalys = mean_dalys_int3 - mean_dalys_sq; model=1; scenario=3; 
data z_effect_int3_2; merge d_2_0 d_2_3 ; effect_dalys = mean_dalys_int3 - mean_dalys_sq; model=2; scenario=3; 
data z_effect_int3_3; merge d_3_0 d_3_3 ; effect_dalys = mean_dalys_int3 - mean_dalys_sq; model=3; scenario=3; 
data z_effect_int3; set z_effect_int3_1 z_effect_int3_2 z_effect_int3_3;  keep scenario model effect_dalys;

data z_effect_int4_1; merge d_1_0 d_1_4 ; effect_dalys = mean_dalys_int4 - mean_dalys_sq; model=1; scenario=4; 
data z_effect_int4_2; merge d_2_0 d_2_4 ; effect_dalys = mean_dalys_int4 - mean_dalys_sq; model=2; scenario=4; 
data z_effect_int4_3; merge d_3_0 d_3_4 ; effect_dalys = mean_dalys_int4 - mean_dalys_sq; model=3; scenario=4; 
data z_effect_int4; set z_effect_int4_1 z_effect_int4_2 z_effect_int4_3;  keep scenario model effect_dalys;

data z_effect_int5_1; merge d_1_0 d_1_5 ; effect_dalys = mean_dalys_int5 - mean_dalys_sq; model=1; scenario=5; 
data z_effect_int5_2; merge d_2_0 d_2_5 ; effect_dalys = mean_dalys_int5 - mean_dalys_sq; model=2; scenario=5; 
data z_effect_int5_3; merge d_3_0 d_3_5 ; effect_dalys = mean_dalys_int5 - mean_dalys_sq; model=3; scenario=5; 
data z_effect_int5; set z_effect_int5_1 z_effect_int5_2 z_effect_int5_3;  keep scenario model effect_dalys;

data z_effect_int6_1; merge d_1_0 d_1_6 ; effect_dalys = mean_dalys_int6 - mean_dalys_sq; model=1; scenario=6; 
data z_effect_int6_2; merge d_2_0 d_2_6 ; effect_dalys = mean_dalys_int6 - mean_dalys_sq; model=2; scenario=6; 
data z_effect_int6_3; merge d_3_0 d_3_6 ; effect_dalys = mean_dalys_int6 - mean_dalys_sq; model=3; scenario=6; 
data z_effect_int6; set z_effect_int6_1 z_effect_int6_2 z_effect_int6_3;  keep scenario model effect_dalys;

data z_effect_int7_1; merge d_1_0 d_1_7 ; effect_dalys = mean_dalys_int7 - mean_dalys_sq; model=1; scenario=7; 
data z_effect_int7_2; merge d_2_0 d_2_7 ; effect_dalys = mean_dalys_int7 - mean_dalys_sq; model=2; scenario=7; 
data z_effect_int7_3; merge d_3_0 d_3_7 ; effect_dalys = mean_dalys_int7 - mean_dalys_sq; model=3; scenario=7; 
data z_effect_int7; set z_effect_int7_1 z_effect_int7_2 z_effect_int7_3;  keep scenario model effect_dalys;

data z_effect_int8_1; merge d_1_0 d_1_8 ; effect_dalys = mean_dalys_int8 - mean_dalys_sq; model=1; scenario=8; 
data z_effect_int8_2; merge d_2_0 d_2_8 ; effect_dalys = mean_dalys_int8 - mean_dalys_sq; model=2; scenario=8; 
data z_effect_int8_3; merge d_3_0 d_3_8 ; effect_dalys = mean_dalys_int8 - mean_dalys_sq; model=3; scenario=8; 
data z_effect_int8; set z_effect_int8_1 z_effect_int8_2 z_effect_int8_3;  keep scenario model effect_dalys;

data z_effect_int9_1; merge d_1_0 d_1_9 ; effect_dalys = mean_dalys_int9 - mean_dalys_sq; model=1; scenario=9; 
data z_effect_int9_2; merge d_2_0 d_2_9 ; effect_dalys = mean_dalys_int9 - mean_dalys_sq; model=2; scenario=9; 
data z_effect_int9_3; merge d_3_0 d_3_9 ; effect_dalys = mean_dalys_int9 - mean_dalys_sq; model=3; scenario=9; 
data z_effect_int9; set z_effect_int9_1 z_effect_int9_2 z_effect_int9_3;  keep scenario model effect_dalys;

data z_effect_int10_1; merge d_1_0 d_1_10 ; effect_dalys = mean_dalys_int10 - mean_dalys_sq; model=1; scenario=10; 
data z_effect_int10_2; merge d_2_0 d_2_10 ; effect_dalys = mean_dalys_int10 - mean_dalys_sq; model=2; scenario=10; 
data z_effect_int10_3; merge d_3_0 d_3_10 ; effect_dalys = mean_dalys_int10 - mean_dalys_sq; model=3; scenario=10; 
data z_effect_int10; set z_effect_int10_1 z_effect_int10_2 z_effect_int10_3;  keep scenario model effect_dalys;

data z_effect_int11_1; merge d_1_0 d_1_11 ; effect_dalys = mean_dalys_int11 - mean_dalys_sq; model=1; scenario=11; 
data z_effect_int11_2; merge d_2_0 d_2_11 ; effect_dalys = mean_dalys_int11 - mean_dalys_sq; model=2; scenario=11; 
data z_effect_int11_3; merge d_3_0 d_3_11 ; effect_dalys = mean_dalys_int11 - mean_dalys_sq; model=3; scenario=11; 
data z_effect_int11; set z_effect_int11_1 z_effect_int11_2 z_effect_int11_3;  keep scenario model effect_dalys;

data z_effect_int12_1; merge d_1_0 d_1_12 ; effect_dalys = mean_dalys_int12 - mean_dalys_sq; model=1; scenario=12; 
data z_effect_int12_2; merge d_2_0 d_2_12 ; effect_dalys = mean_dalys_int12 - mean_dalys_sq; model=2; scenario=12; 
data z_effect_int12_3; merge d_3_0 d_3_12 ; effect_dalys = mean_dalys_int12 - mean_dalys_sq; model=3; scenario=12; 
data z_effect_int12; set z_effect_int12_1 z_effect_int12_2 z_effect_int12_3;  keep scenario model effect_dalys;

data z_effect_int13_1; merge d_1_0 d_1_13 ; effect_dalys = mean_dalys_int13 - mean_dalys_sq; model=1; scenario=13; 
data z_effect_int13_2; merge d_2_0 d_2_13 ; effect_dalys = mean_dalys_int13 - mean_dalys_sq; model=2; scenario=13; 
data z_effect_int13_3; merge d_3_0 d_3_13 ; effect_dalys = mean_dalys_int13 - mean_dalys_sq; model=3; scenario=13; 
data z_effect_int13; set z_effect_int13_1 z_effect_int13_2 z_effect_int13_3;  keep scenario model effect_dalys;

data z_effect_int14_1; merge d_1_0 d_1_14 ; effect_dalys = mean_dalys_int14 - mean_dalys_sq; model=1; scenario=14; 
data z_effect_int14_2; merge d_2_0 d_2_14 ; effect_dalys = mean_dalys_int14 - mean_dalys_sq; model=2; scenario=14; 
data z_effect_int14_3; merge d_3_0 d_3_14 ; effect_dalys = mean_dalys_int14 - mean_dalys_sq; model=3; scenario=14; 
data z_effect_int14; set z_effect_int14_1 z_effect_int14_2 z_effect_int14_3;  keep scenario model effect_dalys;

data z_effect_int15_1; merge d_1_0 d_1_15 ; effect_dalys = mean_dalys_int15 - mean_dalys_sq; model=1; scenario=15; 
data z_effect_int15_2; merge d_2_0 d_2_15 ; effect_dalys = mean_dalys_int15 - mean_dalys_sq; model=2; scenario=15; 
data z_effect_int15_3; merge d_3_0 d_3_15 ; effect_dalys = mean_dalys_int15 - mean_dalys_sq; model=3; scenario=15; 
data z_effect_int15; set z_effect_int15_1 z_effect_int15_2 z_effect_int15_3;  keep scenario model effect_dalys;


data z_effect; set z_effect_int1 z_effect_int2 z_effect_int3 z_effect_int4 z_effect_int5 z_effect_int6 z_effect_int7
 z_effect_int8 z_effect_int9 z_effect_int10 z_effect_int11 z_effect_int12 z_effect_int13 z_effect_int14 z_effect_int15; 


if scenario = 1 then int_name = 'Testing_community';
if scenario = 2 then int_name = 'Testing_risk_informed';
if scenario = 3 then int_name = 'Self_testing_general';
if scenario = 4 then int_name = 'Self_testing_risk_informed';
if scenario = 5 then int_name = 'AGYW_testing';
if scenario = 6 then int_name = 'AGYW_behaviour_change';
if scenario = 7 then int_name = 'VMMC';
if scenario = 8 then int_name = 'Oral_PrEP';
if scenario = 9 then int_name = 'Oral/Cab PrEP';
if scenario = 10 then int_name = 'Oral/Cab/VR_PrEP';
if scenario = 11 then int_name = 'Harm_reduction_PWID';
if scenario = 12 then int_name = 'ART_linkage_retention';
if scenario = 13 then int_name = 'ART_adherence';
if scenario = 14 then int_name = 'ART_coverage_PLW';
if scenario = 15 then int_name = 'AHD_package';


ods html;

data x; set z_effect; 
title 'Effect on DALYs';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_dalys
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  xaxis label="Intervention" display=(noline noticks); 
  yaxis label="Effect on DALYs" display=(noline) grid;
run;


ods html close;

*/


/*

* graph of effects of interventions on mean cost until 2040 ;


data z; set all; 
keep model scenario year cost  ;

proc transpose data = z  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_sq;
proc transpose data = z  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int1;
proc transpose data = z  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int2;
proc transpose data = z  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int3;
proc transpose data = z  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int4;
proc transpose data = z  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int5;
proc transpose data = z  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int6;
proc transpose data = z  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int7;
proc transpose data = z  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int8;
proc transpose data = z  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int9;
proc transpose data = z  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int10;
proc transpose data = z  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int11;
proc transpose data = z  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int12;
proc transpose data = z  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int13;
proc transpose data = z  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int14;
proc transpose data = z  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int15;

proc transpose data = z  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_sq;
proc transpose data = z  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int1;
proc transpose data = z  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int2;
proc transpose data = z  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int3;
proc transpose data = z  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int4;
proc transpose data = z  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int5;
proc transpose data = z  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int6;
proc transpose data = z  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int7;
proc transpose data = z  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int8;
proc transpose data = z  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int9;
proc transpose data = z  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int10;
proc transpose data = z  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int11;
proc transpose data = z  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int12;
proc transpose data = z  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int13;
proc transpose data = z  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int14;
proc transpose data = z  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int15;


proc transpose data = z  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_sq;
proc transpose data = z  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int1;
proc transpose data = z  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int2;
proc transpose data = z  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int3;
proc transpose data = z  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int4;
proc transpose data = z  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int5;
proc transpose data = z  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int6;
proc transpose data = z  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int7;
proc transpose data = z  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int8;
proc transpose data = z  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int9;
proc transpose data = z  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int10;
proc transpose data = z  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int11;
proc transpose data = z  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int12;
proc transpose data = z  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int13;
proc transpose data = z  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int14;
proc transpose data = z  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'cost' ; drop _NAME_; 
mean_cost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_cost_int15;


data z_effect_int1_1; merge d_1_0 d_1_1 ; effect_cost = mean_cost_int1 - mean_cost_sq; model=1; scenario=1; 
data z_effect_int1_2; merge d_2_0 d_2_1 ; effect_cost = mean_cost_int1 - mean_cost_sq; model=2; scenario=1; 
data z_effect_int1_3; merge d_3_0 d_3_1 ; effect_cost = mean_cost_int1 - mean_cost_sq; model=3; scenario=1; 
data z_effect_int1; set z_effect_int1_1 z_effect_int1_2 z_effect_int1_3;  keep scenario model effect_cost;

data z_effect_int2_1; merge d_1_0 d_1_2 ; effect_cost = mean_cost_int2 - mean_cost_sq; model=1; scenario=2; 
data z_effect_int2_2; merge d_2_0 d_2_2 ; effect_cost = mean_cost_int2 - mean_cost_sq; model=2; scenario=2; 
data z_effect_int2_3; merge d_3_0 d_3_2 ; effect_cost = mean_cost_int2 - mean_cost_sq; model=3; scenario=2; 
data z_effect_int2; set z_effect_int2_1 z_effect_int2_2 z_effect_int2_3;  keep scenario model effect_cost;

data z_effect_int3_1; merge d_1_0 d_1_3 ; effect_cost = mean_cost_int3 - mean_cost_sq; model=1; scenario=3; 
data z_effect_int3_2; merge d_2_0 d_2_3 ; effect_cost = mean_cost_int3 - mean_cost_sq; model=2; scenario=3; 
data z_effect_int3_3; merge d_3_0 d_3_3 ; effect_cost = mean_cost_int3 - mean_cost_sq; model=3; scenario=3; 
data z_effect_int3; set z_effect_int3_1 z_effect_int3_2 z_effect_int3_3;  keep scenario model effect_cost;

data z_effect_int4_1; merge d_1_0 d_1_4 ; effect_cost = mean_cost_int4 - mean_cost_sq; model=1; scenario=4; 
data z_effect_int4_2; merge d_2_0 d_2_4 ; effect_cost = mean_cost_int4 - mean_cost_sq; model=2; scenario=4; 
data z_effect_int4_3; merge d_3_0 d_3_4 ; effect_cost = mean_cost_int4 - mean_cost_sq; model=3; scenario=4; 
data z_effect_int4; set z_effect_int4_1 z_effect_int4_2 z_effect_int4_3;  keep scenario model effect_cost;

data z_effect_int5_1; merge d_1_0 d_1_5 ; effect_cost = mean_cost_int5 - mean_cost_sq; model=1; scenario=5; 
data z_effect_int5_2; merge d_2_0 d_2_5 ; effect_cost = mean_cost_int5 - mean_cost_sq; model=2; scenario=5; 
data z_effect_int5_3; merge d_3_0 d_3_5 ; effect_cost = mean_cost_int5 - mean_cost_sq; model=3; scenario=5; 
data z_effect_int5; set z_effect_int5_1 z_effect_int5_2 z_effect_int5_3;  keep scenario model effect_cost;

data z_effect_int6_1; merge d_1_0 d_1_6 ; effect_cost = mean_cost_int6 - mean_cost_sq; model=1; scenario=6; 
data z_effect_int6_2; merge d_2_0 d_2_6 ; effect_cost = mean_cost_int6 - mean_cost_sq; model=2; scenario=6; 
data z_effect_int6_3; merge d_3_0 d_3_6 ; effect_cost = mean_cost_int6 - mean_cost_sq; model=3; scenario=6; 
data z_effect_int6; set z_effect_int6_1 z_effect_int6_2 z_effect_int6_3;  keep scenario model effect_cost;

data z_effect_int7_1; merge d_1_0 d_1_7 ; effect_cost = mean_cost_int7 - mean_cost_sq; model=1; scenario=7; 
data z_effect_int7_2; merge d_2_0 d_2_7 ; effect_cost = mean_cost_int7 - mean_cost_sq; model=2; scenario=7; 
data z_effect_int7_3; merge d_3_0 d_3_7 ; effect_cost = mean_cost_int7 - mean_cost_sq; model=3; scenario=7; 
data z_effect_int7; set z_effect_int7_1 z_effect_int7_2 z_effect_int7_3;  keep scenario model effect_cost;

data z_effect_int8_1; merge d_1_0 d_1_8 ; effect_cost = mean_cost_int8 - mean_cost_sq; model=1; scenario=8; 
data z_effect_int8_2; merge d_2_0 d_2_8 ; effect_cost = mean_cost_int8 - mean_cost_sq; model=2; scenario=8; 
data z_effect_int8_3; merge d_3_0 d_3_8 ; effect_cost = mean_cost_int8 - mean_cost_sq; model=3; scenario=8; 
data z_effect_int8; set z_effect_int8_1 z_effect_int8_2 z_effect_int8_3;  keep scenario model effect_cost;

data z_effect_int9_1; merge d_1_0 d_1_9 ; effect_cost = mean_cost_int9 - mean_cost_sq; model=1; scenario=9; 
data z_effect_int9_2; merge d_2_0 d_2_9 ; effect_cost = mean_cost_int9 - mean_cost_sq; model=2; scenario=9; 
data z_effect_int9_3; merge d_3_0 d_3_9 ; effect_cost = mean_cost_int9 - mean_cost_sq; model=3; scenario=9; 
data z_effect_int9; set z_effect_int9_1 z_effect_int9_2 z_effect_int9_3;  keep scenario model effect_cost;

data z_effect_int10_1; merge d_1_0 d_1_10 ; effect_cost = mean_cost_int10 - mean_cost_sq; model=1; scenario=10; 
data z_effect_int10_2; merge d_2_0 d_2_10 ; effect_cost = mean_cost_int10 - mean_cost_sq; model=2; scenario=10; 
data z_effect_int10_3; merge d_3_0 d_3_10 ; effect_cost = mean_cost_int10 - mean_cost_sq; model=3; scenario=10; 
data z_effect_int10; set z_effect_int10_1 z_effect_int10_2 z_effect_int10_3;  keep scenario model effect_cost;

data z_effect_int11_1; merge d_1_0 d_1_11 ; effect_cost = mean_cost_int11 - mean_cost_sq; model=1; scenario=11; 
data z_effect_int11_2; merge d_2_0 d_2_11 ; effect_cost = mean_cost_int11 - mean_cost_sq; model=2; scenario=11; 
data z_effect_int11_3; merge d_3_0 d_3_11 ; effect_cost = mean_cost_int11 - mean_cost_sq; model=3; scenario=11; 
data z_effect_int11; set z_effect_int11_1 z_effect_int11_2 z_effect_int11_3;  keep scenario model effect_cost;

data z_effect_int12_1; merge d_1_0 d_1_12 ; effect_cost = mean_cost_int12 - mean_cost_sq; model=1; scenario=12; 
data z_effect_int12_2; merge d_2_0 d_2_12 ; effect_cost = mean_cost_int12 - mean_cost_sq; model=2; scenario=12; 
data z_effect_int12_3; merge d_3_0 d_3_12 ; effect_cost = mean_cost_int12 - mean_cost_sq; model=3; scenario=12; 
data z_effect_int12; set z_effect_int12_1 z_effect_int12_2 z_effect_int12_3;  keep scenario model effect_cost;

data z_effect_int13_1; merge d_1_0 d_1_13 ; effect_cost = mean_cost_int13 - mean_cost_sq; model=1; scenario=13; 
data z_effect_int13_2; merge d_2_0 d_2_13 ; effect_cost = mean_cost_int13 - mean_cost_sq; model=2; scenario=13; 
data z_effect_int13_3; merge d_3_0 d_3_13 ; effect_cost = mean_cost_int13 - mean_cost_sq; model=3; scenario=13; 
data z_effect_int13; set z_effect_int13_1 z_effect_int13_2 z_effect_int13_3;  keep scenario model effect_cost;

data z_effect_int14_1; merge d_1_0 d_1_14 ; effect_cost = mean_cost_int14 - mean_cost_sq; model=1; scenario=14; 
data z_effect_int14_2; merge d_2_0 d_2_14 ; effect_cost = mean_cost_int14 - mean_cost_sq; model=2; scenario=14; 
data z_effect_int14_3; merge d_3_0 d_3_14 ; effect_cost = mean_cost_int14 - mean_cost_sq; model=3; scenario=14; 
data z_effect_int14; set z_effect_int14_1 z_effect_int14_2 z_effect_int14_3;  keep scenario model effect_cost;

data z_effect_int15_1; merge d_1_0 d_1_15 ; effect_cost = mean_cost_int15 - mean_cost_sq; model=1; scenario=15; 
data z_effect_int15_2; merge d_2_0 d_2_15 ; effect_cost = mean_cost_int15 - mean_cost_sq; model=2; scenario=15; 
data z_effect_int15_3; merge d_3_0 d_3_15 ; effect_cost = mean_cost_int15 - mean_cost_sq; model=3; scenario=15; 
data z_effect_int15; set z_effect_int15_1 z_effect_int15_2 z_effect_int15_3;  keep scenario model effect_cost;


data z_effect; set z_effect_int1 z_effect_int2 z_effect_int3 z_effect_int4 z_effect_int5 z_effect_int6 z_effect_int7
 z_effect_int8 z_effect_int9 z_effect_int10 z_effect_int11 z_effect_int12 z_effect_int13 z_effect_int14 z_effect_int15; 


if scenario = 1 then int_name = 'a Testing_community';
if scenario = 2 then int_name = 'b Testing_risk_informed';
if scenario = 3 then int_name = 'c Self_testing_general';
if scenario = 4 then int_name = 'd Self_testing_risk_informed';
if scenario = 5 then int_name = 'e AGYW_testing';
if scenario = 6 then int_name = 'f AGYW_behaviour_change';
if scenario = 7 then int_name = 'g VMMC';
if scenario = 8 then int_name = 'h Oral_PrEP';
if scenario = 9 then int_name = 'i Oral/Cab PrEP';
if scenario = 10 then int_name = 'j Oral/Cab/VR_PrEP';
if scenario = 11 then int_name = 'k Harm_reduction_PWID';
if scenario = 12 then int_name = 'l ART_linkage_retention';
if scenario = 13 then int_name = 'm ART_adherence';
if scenario = 14 then int_name = 'n ART_coverage_PLW';
if scenario = 15 then int_name = 'o AHD_package';


ods html;

data x; set z_effect; 
title 'Effect on Cost ($m)';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_cost
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  xaxis label="Intervention" display=(noline noticks); 
  yaxis label="Effect on Cost ($m)" display=(noline) grid;
run;


ods html close;


*/
 









/*

* mean ddalys averted, d_infections averted and cost incurred for 2024-204 - and icer and cpia - by model and intervention - including range;

data z; set all; 
keep model scenario year ddalys  ;

proc transpose data = z  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;

proc transpose data = z  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;


proc transpose data = z  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;


data z_int1_1; merge d_1_0 d_1_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=1; scenario=1; 
data z_int1_2; merge d_2_0 d_2_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=2; scenario=1; 
data z_int1_3; merge d_3_0 d_3_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=3; scenario=1; 
data z_int1; set z_int1_1 z_int1_2 z_int1_3;  keep scenario model effect_ddalys;

data z_int2_1; merge d_1_0 d_1_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=1; scenario=2; 
data z_int2_2; merge d_2_0 d_2_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=2; scenario=2; 
data z_int2_3; merge d_3_0 d_3_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=3; scenario=2; 
data z_int2; set z_int2_1 z_int2_2 z_int2_3;  keep scenario model effect_ddalys;

data z_int3_1; merge d_1_0 d_1_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=1; scenario=3; 
data z_int3_2; merge d_2_0 d_2_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=2; scenario=3; 
data z_int3_3; merge d_3_0 d_3_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=3; scenario=3; 
data z_int3; set z_int3_1 z_int3_2 z_int3_3;  keep scenario model effect_ddalys;

data z_int4_1; merge d_1_0 d_1_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=1; scenario=4; 
data z_int4_2; merge d_2_0 d_2_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=2; scenario=4; 
data z_int4_3; merge d_3_0 d_3_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=3; scenario=4; 
data z_int4; set z_int4_1 z_int4_2 z_int4_3;  keep scenario model effect_ddalys;

data z_int5_1; merge d_1_0 d_1_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=1; scenario=5; 
data z_int5_2; merge d_2_0 d_2_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=2; scenario=5; 
data z_int5_3; merge d_3_0 d_3_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=3; scenario=5; 
data z_int5; set z_int5_1 z_int5_2 z_int5_3;  keep scenario model effect_ddalys;

data z_int6_1; merge d_1_0 d_1_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=1; scenario=6; 
data z_int6_2; merge d_2_0 d_2_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=2; scenario=6; 
data z_int6_3; merge d_3_0 d_3_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=3; scenario=6; 
data z_int6; set z_int6_1 z_int6_2 z_int6_3;  keep scenario model effect_ddalys;

data z_int7_1; merge d_1_0 d_1_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=1; scenario=7; 
data z_int7_2; merge d_2_0 d_2_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=2; scenario=7; 
data z_int7_3; merge d_3_0 d_3_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=3; scenario=7; 
data z_int7; set z_int7_1 z_int7_2 z_int7_3;  keep scenario model effect_ddalys;

data z_int8_1; merge d_1_0 d_1_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=1; scenario=8; 
data z_int8_2; merge d_2_0 d_2_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=2; scenario=8; 
data z_int8_3; merge d_3_0 d_3_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=3; scenario=8; 
data z_int8; set z_int8_1 z_int8_2 z_int8_3;  keep scenario model effect_ddalys;

data z_int9_1; merge d_1_0 d_1_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=1; scenario=9; 
data z_int9_2; merge d_2_0 d_2_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=2; scenario=9; 
data z_int9_3; merge d_3_0 d_3_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=3; scenario=9; 
data z_int9; set z_int9_1 z_int9_2 z_int9_3;  keep scenario model effect_ddalys;

data z_int10_1; merge d_1_0 d_1_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=1; scenario=10; 
data z_int10_2; merge d_2_0 d_2_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=2; scenario=10; 
data z_int10_3; merge d_3_0 d_3_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=3; scenario=10; 
data z_int10; set z_int10_1 z_int10_2 z_int10_3;  keep scenario model effect_ddalys;

data z_int11_1; merge d_1_0 d_1_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=1; scenario=11; 
data z_int11_2; merge d_2_0 d_2_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=2; scenario=11; 
data z_int11_3; merge d_3_0 d_3_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=3; scenario=11; 
data z_int11; set z_int11_1 z_int11_2 z_int11_3;  keep scenario model effect_ddalys;

data z_int12_1; merge d_1_0 d_1_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=1; scenario=12; 
data z_int12_2; merge d_2_0 d_2_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=2; scenario=12; 
data z_int12_3; merge d_3_0 d_3_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=3; scenario=12; 
data z_int12; set z_int12_1 z_int12_2 z_int12_3;  keep scenario model effect_ddalys;

data z_int13_1; merge d_1_0 d_1_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=1; scenario=13; 
data z_int13_2; merge d_2_0 d_2_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=2; scenario=13; 
data z_int13_3; merge d_3_0 d_3_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=3; scenario=13; 
data z_int13; set z_int13_1 z_int13_2 z_int13_3;  keep scenario model effect_ddalys;

data z_int14_1; merge d_1_0 d_1_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=1; scenario=14; 
data z_int14_2; merge d_2_0 d_2_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=2; scenario=14; 
data z_int14_3; merge d_3_0 d_3_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=3; scenario=14; 
data z_int14; set z_int14_1 z_int14_2 z_int14_3;  keep scenario model effect_ddalys;

data z_int15_1; merge d_1_0 d_1_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=1; scenario=15; 
data z_int15_2; merge d_2_0 d_2_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=2; scenario=15; 
data z_int15_3; merge d_3_0 d_3_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=3; scenario=15; 
data z_int15; set z_int15_1 z_int15_2 z_int15_3;  keep scenario model effect_ddalys;


data ddalys_averted; set z_int1 z_int2 z_int3 z_int4 z_int5 z_int6 z_int7
 z_int8 z_int9 z_int10 z_int11 z_int12 z_int13 z_int14 z_int15; 


data u; set all; 
keep model scenario year dcost  ;

proc transpose data = u  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;

proc transpose data = u  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;


proc transpose data = u  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;



data u_int1_1; merge d_1_0 d_1_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=1; scenario=1; 
data u_int1_2; merge d_2_0 d_2_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=2; scenario=1; 
data u_int1_3; merge d_3_0 d_3_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=3; scenario=1; 
data u_int1; set u_int1_1 u_int1_2 u_int1_3;  keep scenario model effect_dcost;

data u_int2_1; merge d_1_0 d_1_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=1; scenario=2; 
data u_int2_2; merge d_2_0 d_2_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=2; scenario=2; 
data u_int2_3; merge d_3_0 d_3_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=3; scenario=2; 
data u_int2; set u_int2_1 u_int2_2 u_int2_3;  keep scenario model effect_dcost;

data u_int3_1; merge d_1_0 d_1_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=1; scenario=3; 
data u_int3_2; merge d_2_0 d_2_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=2; scenario=3; 
data u_int3_3; merge d_3_0 d_3_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=3; scenario=3; 
data u_int3; set u_int3_1 u_int3_2 u_int3_3;  keep scenario model effect_dcost;

data u_int4_1; merge d_1_0 d_1_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=1; scenario=4; 
data u_int4_2; merge d_2_0 d_2_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=2; scenario=4; 
data u_int4_3; merge d_3_0 d_3_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=3; scenario=4; 
data u_int4; set u_int4_1 u_int4_2 u_int4_3;  keep scenario model effect_dcost;

data u_int5_1; merge d_1_0 d_1_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=1; scenario=5; 
data u_int5_2; merge d_2_0 d_2_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=2; scenario=5; 
data u_int5_3; merge d_3_0 d_3_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=3; scenario=5; 
data u_int5; set u_int5_1 u_int5_2 u_int5_3;  keep scenario model effect_dcost;

data u_int6_1; merge d_1_0 d_1_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=1; scenario=6; 
data u_int6_2; merge d_2_0 d_2_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=2; scenario=6; 
data u_int6_3; merge d_3_0 d_3_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=3; scenario=6; 
data u_int6; set u_int6_1 u_int6_2 u_int6_3;  keep scenario model effect_dcost;

data u_int7_1; merge d_1_0 d_1_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=1; scenario=7; 
data u_int7_2; merge d_2_0 d_2_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=2; scenario=7; 
data u_int7_3; merge d_3_0 d_3_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=3; scenario=7; 
data u_int7; set u_int7_1 u_int7_2 u_int7_3;  keep scenario model effect_dcost;

data u_int8_1; merge d_1_0 d_1_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=1; scenario=8; 
data u_int8_2; merge d_2_0 d_2_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=2; scenario=8; 
data u_int8_3; merge d_3_0 d_3_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=3; scenario=8; 
data u_int8; set u_int8_1 u_int8_2 u_int8_3;  keep scenario model effect_dcost;

data u_int9_1; merge d_1_0 d_1_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=1; scenario=9; 
data u_int9_2; merge d_2_0 d_2_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=2; scenario=9; 
data u_int9_3; merge d_3_0 d_3_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=3; scenario=9; 
data u_int9; set u_int9_1 u_int9_2 u_int9_3;  keep scenario model effect_dcost;

data u_int10_1; merge d_1_0 d_1_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=1; scenario=10; 
data u_int10_2; merge d_2_0 d_2_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=2; scenario=10; 
data u_int10_3; merge d_3_0 d_3_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=3; scenario=10; 
data u_int10; set u_int10_1 u_int10_2 u_int10_3;  keep scenario model effect_dcost;

data u_int11_1; merge d_1_0 d_1_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=1; scenario=11; 
data u_int11_2; merge d_2_0 d_2_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=2; scenario=11; 
data u_int11_3; merge d_3_0 d_3_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=3; scenario=11; 
data u_int11; set u_int11_1 u_int11_2 u_int11_3;  keep scenario model effect_dcost;

data u_int12_1; merge d_1_0 d_1_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=1; scenario=12; 
data u_int12_2; merge d_2_0 d_2_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=2; scenario=12; 
data u_int12_3; merge d_3_0 d_3_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=3; scenario=12; 
data u_int12; set u_int12_1 u_int12_2 u_int12_3;  keep scenario model effect_dcost;

data u_int13_1; merge d_1_0 d_1_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=1; scenario=13; 
data u_int13_2; merge d_2_0 d_2_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=2; scenario=13; 
data u_int13_3; merge d_3_0 d_3_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=3; scenario=13; 
data u_int13; set u_int13_1 u_int13_2 u_int13_3;  keep scenario model effect_dcost;

data u_int14_1; merge d_1_0 d_1_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=1; scenario=14; 
data u_int14_2; merge d_2_0 d_2_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=2; scenario=14; 
data u_int14_3; merge d_3_0 d_3_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=3; scenario=14; 
data u_int14; set u_int14_1 u_int14_2 u_int14_3;  keep scenario model effect_dcost;

data u_int15_1; merge d_1_0 d_1_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=1; scenario=15; 
data u_int15_2; merge d_2_0 d_2_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=2; scenario=15; 
data u_int15_3; merge d_3_0 d_3_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=3; scenario=15; 
data u_int15; set u_int15_1 u_int15_2 u_int15_3;  keep scenario model effect_dcost;


data dcost_incurred; set u_int1 u_int2 u_int3 u_int4 u_int5 u_int6 u_int7
 u_int8 u_int9 u_int10 u_int11 u_int12 u_int13 u_int14 u_int15; 



data w; set all; 
keep model scenario year dnew_infection  ;

proc transpose data = w  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_sq;
proc transpose data = w  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int1;
proc transpose data = w  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int2;
proc transpose data = w  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int3;
proc transpose data = w  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int4;
proc transpose data = w  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int5;
proc transpose data = w  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int6;
proc transpose data = w  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int7;
proc transpose data = w  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int8;
proc transpose data = w  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int9;
proc transpose data = w  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int10;
proc transpose data = w  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int11;
proc transpose data = w  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int12;
proc transpose data = w  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int13;
proc transpose data = w  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int14;
proc transpose data = w  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int15;

proc transpose data = w  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_sq;
proc transpose data = w  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int1;
proc transpose data = w  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int2;
proc transpose data = w  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int3;
proc transpose data = w  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int4;
proc transpose data = w  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int5;
proc transpose data = w  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int6;
proc transpose data = w  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int7;
proc transpose data = w  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int8;
proc transpose data = w  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int9;
proc transpose data = w  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int10;
proc transpose data = w  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int11;
proc transpose data = w  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int12;
proc transpose data = w  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int13;
proc transpose data = w  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int14;
proc transpose data = w  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int15;


proc transpose data = w  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_sq;
proc transpose data = w  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int1;
proc transpose data = w  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int2;
proc transpose data = w  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int3;
proc transpose data = w  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int4;
proc transpose data = w  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int5;
proc transpose data = w  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int6;
proc transpose data = w  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int7;
proc transpose data = w  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int8;
proc transpose data = w  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int9;
proc transpose data = w  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int10;
proc transpose data = w  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int11;
proc transpose data = w  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int12;
proc transpose data = w  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int13;
proc transpose data = w  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int14;
proc transpose data = w  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'dnew_infection' ; drop _NAME_; 
mean_dnew_infection_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dnew_infection_int15;


data w_int1_1; merge d_1_0 d_1_1 ; effect_dnew_infection = mean_dnew_infection_int1 - mean_dnew_infection_sq; model=1; scenario=1; 
data w_int1_2; merge d_2_0 d_2_1 ; effect_dnew_infection = mean_dnew_infection_int1 - mean_dnew_infection_sq; model=2; scenario=1; 
data w_int1_3; merge d_3_0 d_3_1 ; effect_dnew_infection = mean_dnew_infection_int1 - mean_dnew_infection_sq; model=3; scenario=1; 
data w_int1; set w_int1_1 w_int1_2 w_int1_3;  keep scenario model effect_dnew_infection;

data w_int2_1; merge d_1_0 d_1_2 ; effect_dnew_infection = mean_dnew_infection_int2 - mean_dnew_infection_sq; model=1; scenario=2; 
data w_int2_2; merge d_2_0 d_2_2 ; effect_dnew_infection = mean_dnew_infection_int2 - mean_dnew_infection_sq; model=2; scenario=2; 
data w_int2_3; merge d_3_0 d_3_2 ; effect_dnew_infection = mean_dnew_infection_int2 - mean_dnew_infection_sq; model=3; scenario=2; 
data w_int2; set w_int2_1 w_int2_2 w_int2_3;  keep scenario model effect_dnew_infection;

data w_int3_1; merge d_1_0 d_1_3 ; effect_dnew_infection = mean_dnew_infection_int3 - mean_dnew_infection_sq; model=1; scenario=3; 
data w_int3_2; merge d_2_0 d_2_3 ; effect_dnew_infection = mean_dnew_infection_int3 - mean_dnew_infection_sq; model=2; scenario=3; 
data w_int3_3; merge d_3_0 d_3_3 ; effect_dnew_infection = mean_dnew_infection_int3 - mean_dnew_infection_sq; model=3; scenario=3; 
data w_int3; set w_int3_1 w_int3_2 w_int3_3;  keep scenario model effect_dnew_infection;

data w_int4_1; merge d_1_0 d_1_4 ; effect_dnew_infection = mean_dnew_infection_int4 - mean_dnew_infection_sq; model=1; scenario=4; 
data w_int4_2; merge d_2_0 d_2_4 ; effect_dnew_infection = mean_dnew_infection_int4 - mean_dnew_infection_sq; model=2; scenario=4; 
data w_int4_3; merge d_3_0 d_3_4 ; effect_dnew_infection = mean_dnew_infection_int4 - mean_dnew_infection_sq; model=3; scenario=4; 
data w_int4; set w_int4_1 w_int4_2 w_int4_3;  keep scenario model effect_dnew_infection;

data w_int5_1; merge d_1_0 d_1_5 ; effect_dnew_infection = mean_dnew_infection_int5 - mean_dnew_infection_sq; model=1; scenario=5; 
data w_int5_2; merge d_2_0 d_2_5 ; effect_dnew_infection = mean_dnew_infection_int5 - mean_dnew_infection_sq; model=2; scenario=5; 
data w_int5_3; merge d_3_0 d_3_5 ; effect_dnew_infection = mean_dnew_infection_int5 - mean_dnew_infection_sq; model=3; scenario=5; 
data w_int5; set w_int5_1 w_int5_2 w_int5_3;  keep scenario model effect_dnew_infection;

data w_int6_1; merge d_1_0 d_1_6 ; effect_dnew_infection = mean_dnew_infection_int6 - mean_dnew_infection_sq; model=1; scenario=6; 
data w_int6_2; merge d_2_0 d_2_6 ; effect_dnew_infection = mean_dnew_infection_int6 - mean_dnew_infection_sq; model=2; scenario=6; 
data w_int6_3; merge d_3_0 d_3_6 ; effect_dnew_infection = mean_dnew_infection_int6 - mean_dnew_infection_sq; model=3; scenario=6; 
data w_int6; set w_int6_1 w_int6_2 w_int6_3;  keep scenario model effect_dnew_infection;

data w_int7_1; merge d_1_0 d_1_7 ; effect_dnew_infection = mean_dnew_infection_int7 - mean_dnew_infection_sq; model=1; scenario=7; 
data w_int7_2; merge d_2_0 d_2_7 ; effect_dnew_infection = mean_dnew_infection_int7 - mean_dnew_infection_sq; model=2; scenario=7; 
data w_int7_3; merge d_3_0 d_3_7 ; effect_dnew_infection = mean_dnew_infection_int7 - mean_dnew_infection_sq; model=3; scenario=7; 
data w_int7; set w_int7_1 w_int7_2 w_int7_3;  keep scenario model effect_dnew_infection;

data w_int8_1; merge d_1_0 d_1_8 ; effect_dnew_infection = mean_dnew_infection_int8 - mean_dnew_infection_sq; model=1; scenario=8; 
data w_int8_2; merge d_2_0 d_2_8 ; effect_dnew_infection = mean_dnew_infection_int8 - mean_dnew_infection_sq; model=2; scenario=8; 
data w_int8_3; merge d_3_0 d_3_8 ; effect_dnew_infection = mean_dnew_infection_int8 - mean_dnew_infection_sq; model=3; scenario=8; 
data w_int8; set w_int8_1 w_int8_2 w_int8_3;  keep scenario model effect_dnew_infection;

data w_int9_1; merge d_1_0 d_1_9 ; effect_dnew_infection = mean_dnew_infection_int9 - mean_dnew_infection_sq; model=1; scenario=9; 
data w_int9_2; merge d_2_0 d_2_9 ; effect_dnew_infection = mean_dnew_infection_int9 - mean_dnew_infection_sq; model=2; scenario=9; 
data w_int9_3; merge d_3_0 d_3_9 ; effect_dnew_infection = mean_dnew_infection_int9 - mean_dnew_infection_sq; model=3; scenario=9; 
data w_int9; set w_int9_1 w_int9_2 w_int9_3;  keep scenario model effect_dnew_infection;

data w_int10_1; merge d_1_0 d_1_10 ; effect_dnew_infection = mean_dnew_infection_int10 - mean_dnew_infection_sq; model=1; scenario=10; 
data w_int10_2; merge d_2_0 d_2_10 ; effect_dnew_infection = mean_dnew_infection_int10 - mean_dnew_infection_sq; model=2; scenario=10; 
data w_int10_3; merge d_3_0 d_3_10 ; effect_dnew_infection = mean_dnew_infection_int10 - mean_dnew_infection_sq; model=3; scenario=10; 
data w_int10; set w_int10_1 w_int10_2 w_int10_3;  keep scenario model effect_dnew_infection;

data w_int11_1; merge d_1_0 d_1_11 ; effect_dnew_infection = mean_dnew_infection_int11 - mean_dnew_infection_sq; model=1; scenario=11; 
data w_int11_2; merge d_2_0 d_2_11 ; effect_dnew_infection = mean_dnew_infection_int11 - mean_dnew_infection_sq; model=2; scenario=11; 
data w_int11_3; merge d_3_0 d_3_11 ; effect_dnew_infection = mean_dnew_infection_int11 - mean_dnew_infection_sq; model=3; scenario=11; 
data w_int11; set w_int11_1 w_int11_2 w_int11_3;  keep scenario model effect_dnew_infection;

data w_int12_1; merge d_1_0 d_1_12 ; effect_dnew_infection = mean_dnew_infection_int12 - mean_dnew_infection_sq; model=1; scenario=12; 
data w_int12_2; merge d_2_0 d_2_12 ; effect_dnew_infection = mean_dnew_infection_int12 - mean_dnew_infection_sq; model=2; scenario=12; 
data w_int12_3; merge d_3_0 d_3_12 ; effect_dnew_infection = mean_dnew_infection_int12 - mean_dnew_infection_sq; model=3; scenario=12; 
data w_int12; set w_int12_1 w_int12_2 w_int12_3;  keep scenario model effect_dnew_infection;

data w_int13_1; merge d_1_0 d_1_13 ; effect_dnew_infection = mean_dnew_infection_int13 - mean_dnew_infection_sq; model=1; scenario=13; 
data w_int13_2; merge d_2_0 d_2_13 ; effect_dnew_infection = mean_dnew_infection_int13 - mean_dnew_infection_sq; model=2; scenario=13; 
data w_int13_3; merge d_3_0 d_3_13 ; effect_dnew_infection = mean_dnew_infection_int13 - mean_dnew_infection_sq; model=3; scenario=13; 
data w_int13; set w_int13_1 w_int13_2 w_int13_3;  keep scenario model effect_dnew_infection;

data w_int14_1; merge d_1_0 d_1_14 ; effect_dnew_infection = mean_dnew_infection_int14 - mean_dnew_infection_sq; model=1; scenario=14; 
data w_int14_2; merge d_2_0 d_2_14 ; effect_dnew_infection = mean_dnew_infection_int14 - mean_dnew_infection_sq; model=2; scenario=14; 
data w_int14_3; merge d_3_0 d_3_14 ; effect_dnew_infection = mean_dnew_infection_int14 - mean_dnew_infection_sq; model=3; scenario=14; 
data w_int14; set w_int14_1 w_int14_2 w_int14_3;  keep scenario model effect_dnew_infection;

data w_int15_1; merge d_1_0 d_1_15 ; effect_dnew_infection = mean_dnew_infection_int15 - mean_dnew_infection_sq; model=1; scenario=15; 
data w_int15_2; merge d_2_0 d_2_15 ; effect_dnew_infection = mean_dnew_infection_int15 - mean_dnew_infection_sq; model=2; scenario=15; 
data w_int15_3; merge d_3_0 d_3_15 ; effect_dnew_infection = mean_dnew_infection_int15 - mean_dnew_infection_sq; model=3; scenario=15; 
data w_int15; set w_int15_1 w_int15_2 w_int15_3;  keep scenario model effect_dnew_infection;


data dnew_infection; set w_int1 w_int2 w_int3 w_int4 w_int5 w_int6 w_int7
 w_int8 w_int9 w_int10 w_int11 w_int12 w_int13 w_int14 w_int15; 


data cost_ddaly_dnew_infection; merge ddalys_averted dcost_incurred dnew_infection;

icer=.; if effect_dcost > 0 and effect_ddalys < 0 then icer = effect_dcost / (-effect_ddalys);
if . < effect_dcost <= 0 and effect_ddalys < 0 then icer = 0; if effect_ddalys >= 0 then icer=1000000;

icer = log10(icer+1);

cpia=.; if effect_dcost > 0 and effect_dnew_infection < 0 then cpia = effect_dcost / (-effect_dnew_infection);
if . < effect_dcost <= 0 and effect_new_infection < 0 then cpia = 0; if effect_dnew_infection >= 0 then cpia = 1000000; 

cpia = log10(cpia+1);

drop effect_new_infection;

ods html close;
ods html;
proc print; where scenario = 1;
proc print; where scenario = 2;
proc print; where scenario = 3;
proc print; where scenario = 4;
proc print; where scenario = 5;
proc print; where scenario = 6;
proc print; where scenario = 7;
proc print; where scenario = 8;
proc print; where scenario = 9;
proc print; where scenario = 10;
proc print; where scenario = 11;
proc print; where scenario = 12;
proc print; where scenario = 13;
proc print; where scenario = 14;
proc print; where scenario = 15;
run;
ods html close;




* plots of ranges of icers across models by intervention ;

data icer_s_1;  set cost_ddaly_dnew_infection; if scenario=1; proc transpose out=s_1; data v_1; set s_1; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=1; keep lower upper intervention;
data icer_s_2;  set cost_ddaly_dnew_infection; if scenario=2; proc transpose out=s_2; data v_2; set s_2; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=2; keep lower upper intervention;
data icer_s_3;  set cost_ddaly_dnew_infection; if scenario=3; proc transpose out=s_3; data v_3; set s_3; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=3; keep lower upper intervention;
data icer_s_4;  set cost_ddaly_dnew_infection; if scenario=4; proc transpose out=s_4; data v_4; set s_4; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=4; keep lower upper intervention;
data icer_s_5;  set cost_ddaly_dnew_infection; if scenario=5; proc transpose out=s_5; data v_5; set s_5; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=5; keep lower upper intervention;
data icer_s_6;  set cost_ddaly_dnew_infection; if scenario=6; proc transpose out=s_6; data v_6; set s_6; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=6; keep lower upper intervention;
data icer_s_7;  set cost_ddaly_dnew_infection; if scenario=7; proc transpose out=s_7; data v_7; set s_7; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=7; keep lower upper intervention;
data icer_s_8;  set cost_ddaly_dnew_infection; if scenario=8; proc transpose out=s_8; data v_8; set s_8; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=8; keep lower upper intervention;
data icer_s_9;  set cost_ddaly_dnew_infection; if scenario=9; proc transpose out=s_9; data v_9; set s_9; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=9; keep lower upper intervention;
data icer_s_10;  set cost_ddaly_dnew_infection; if scenario=10; proc transpose out=s_10; data v_10; set s_10; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=10; keep lower upper intervention;
data icer_s_11;  set cost_ddaly_dnew_infection; if scenario=11; proc transpose out=s_11; data v_11; set s_11; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=11; keep lower upper intervention;
data icer_s_12;  set cost_ddaly_dnew_infection; if scenario=12; proc transpose out=s_12; data v_12; set s_12; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=12; keep lower upper intervention;
data icer_s_13;  set cost_ddaly_dnew_infection; if scenario=13; proc transpose out=s_13; data v_13; set s_13; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=13; keep lower upper intervention;
data icer_s_14;  set cost_ddaly_dnew_infection; if scenario=14; proc transpose out=s_14; data v_14; set s_14; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=14; keep lower upper intervention;
data icer_s_15;  set cost_ddaly_dnew_infection; if scenario=15; proc transpose out=s_15; data v_15; set s_15; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=15; keep lower upper intervention;


data icer_scen_1_lower; set v_1; lower_or_upper = 1; lower_upper_icer = lower; intervention = 1  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_1_upper; set v_1; lower_or_upper = 2; lower_upper_icer = upper - lower-lower; intervention = 1  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_2_lower; set v_2; lower_or_upper = 1; lower_upper_icer = lower; intervention = 2  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_2_upper; set v_2; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 2  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_3_lower; set v_3; lower_or_upper = 1; lower_upper_icer = lower; intervention = 3  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_3_upper; set v_3; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 3  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_4_lower; set v_4; lower_or_upper = 1; lower_upper_icer = lower; intervention = 4  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_4_upper; set v_4; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 4  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_5_lower; set v_5; lower_or_upper = 1; lower_upper_icer = lower; intervention = 5  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_5_upper; set v_5; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 5  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_6_lower; set v_6; lower_or_upper = 1; lower_upper_icer = lower; intervention = 6  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_6_upper; set v_6; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 6  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_7_lower; set v_7; lower_or_upper = 1; lower_upper_icer = lower; intervention = 7  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_7_upper; set v_7; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 7  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_8_lower; set v_8; lower_or_upper = 1; lower_upper_icer = lower; intervention = 8  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_8_upper; set v_8; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 8  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_9_lower; set v_9; lower_or_upper = 1; lower_upper_icer = lower; intervention = 9  ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_9_upper; set v_9; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 9  ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_10_lower; set v_10; lower_or_upper = 1; lower_upper_icer = lower; intervention = 10 ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_10_upper; set v_10; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 10 ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_11_lower; set v_11; lower_or_upper = 1; lower_upper_icer = lower; intervention = 11 ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_11_upper; set v_11; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 11 ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_12_lower; set v_12; lower_or_upper = 1; lower_upper_icer = lower; intervention = 12 ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_12_upper; set v_12; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 12 ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_13_lower; set v_13; lower_or_upper = 1; lower_upper_icer = lower; intervention = 13 ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_13_upper; set v_13; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 13 ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_14_lower; set v_14; lower_or_upper = 1; lower_upper_icer = lower; intervention = 14 ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_14_upper; set v_14; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 14 ;  keep lower_or_upper lower_upper_icer intervention  ;

data icer_scen_15_lower; set v_15; lower_or_upper = 1; lower_upper_icer = lower; intervention = 15 ;  keep lower_or_upper lower_upper_icer intervention  ;
data icer_scen_15_upper; set v_15; lower_or_upper = 2; lower_upper_icer = upper - lower; intervention = 15 ;  keep lower_or_upper lower_upper_icer intervention  ;



data all_icer; 
set 
icer_scen_1_lower icer_scen_1_upper
icer_scen_2_lower icer_scen_2_upper
icer_scen_3_lower icer_scen_3_upper
icer_scen_4_lower icer_scen_4_upper
icer_scen_5_lower icer_scen_5_upper
icer_scen_6_lower icer_scen_6_upper
icer_scen_7_lower icer_scen_7_upper
icer_scen_8_lower icer_scen_8_upper
icer_scen_9_lower icer_scen_9_upper
icer_scen_10_lower icer_scen_10_upper
icer_scen_11_lower icer_scen_11_upper
icer_scen_12_lower icer_scen_12_upper
icer_scen_13_lower icer_scen_13_upper
icer_scen_14_lower icer_scen_14_upper
icer_scen_15_lower icer_scen_15_upper
;


if intervention = 1 then int_name = 'a Testing_community';
if intervention = 2 then int_name = 'b Testing_risk_informed';
if intervention = 3 then int_name = 'c Self_testing_general';
if intervention = 4 then int_name = 'd Self_testing_risk_informed';
if intervention = 5 then int_name = 'e AGYW_testing';
if intervention = 6 then int_name = 'f AGYW_behaviour_change';
if intervention = 7 then int_name = 'g VMMC';
if intervention = 8 then int_name = 'h Oral_PrEP';
if intervention = 9 then int_name = 'i Oral/Cab PrEP';
if intervention = 10 then int_name = 'j Oral/Cab/VR_PrEP';
if intervention = 11 then int_name = 'k Harm_reduction_PWID';
if intervention = 12 then int_name = 'l ART_linkage_retention';
if intervention = 13 then int_name = 'm ART_adherence';
if intervention = 14 then int_name = 'n ART_coverage_PLW';
if intervention = 15 then int_name = 'o AHD_package';

ods html;

proc sgplot data=all_icer nolegend;
	styleattrs datacolors=(white lightblue);
   	vbar int_name / response=lower_upper_icer group=lower_or_upper groupdisplay=stack outlineattrs=(color=white thickness=3);;
   	xaxis label="Intervention" type=discrete values=('1 Testing_community' '2 Testing_risk_informed' '3 Self_testing_general' '4 Self_testing_risk_informed'
 '5 AGYW_testing' '6 AGYW_behaviour_change' '7 VMMC' '8 Oral_PrEP' '9 Oral/Cab PrEP' '10 Oral/Cab/VR_PrEP' '11 Harm_reduction_PWID' '12 ART_linkage_retention'
 '13 ART_adherence' '14 ART_coverage_PLW' '15 AHD_package');   	yaxis label="Range of ICERS (log10)";
run;

ods html close;

ods html;

proc sgplot data=all_icer nolegend;
	styleattrs datacolors=(white lightblue);
   	vbar int_name / response=lower_upper_icer group=lower_or_upper groupdisplay=stack outlineattrs=(color=white thickness=3);;
   	xaxis label="Intervention" type=discrete ;   	yaxis label="Range of ICERS (log10)";
run;

ods html close;



* plots of ranges of cpias across models by intervention ;

data cpia_s_1;  set cost_ddaly_dnew_infection; if scenario=1; proc transpose out=s_1; data v_1; set s_1; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=1; keep lower upper intervention;
data cpia_s_2;  set cost_ddaly_dnew_infection; if scenario=2; proc transpose out=s_2; data v_2; set s_2; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=2; keep lower upper intervention;
data cpia_s_3;  set cost_ddaly_dnew_infection; if scenario=3; proc transpose out=s_3; data v_3; set s_3; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=3; keep lower upper intervention;
data cpia_s_4;  set cost_ddaly_dnew_infection; if scenario=4; proc transpose out=s_4; data v_4; set s_4; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=4; keep lower upper intervention;
data cpia_s_5;  set cost_ddaly_dnew_infection; if scenario=5; proc transpose out=s_5; data v_5; set s_5; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=5; keep lower upper intervention;
data cpia_s_6;  set cost_ddaly_dnew_infection; if scenario=6; proc transpose out=s_6; data v_6; set s_6; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=6; keep lower upper intervention;
data cpia_s_7;  set cost_ddaly_dnew_infection; if scenario=7; proc transpose out=s_7; data v_7; set s_7; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=7; keep lower upper intervention;
data cpia_s_8;  set cost_ddaly_dnew_infection; if scenario=8; proc transpose out=s_8; data v_8; set s_8; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=8; keep lower upper intervention;
data cpia_s_9;  set cost_ddaly_dnew_infection; if scenario=9; proc transpose out=s_9; data v_9; set s_9; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=9; keep lower upper intervention;
data cpia_s_10;  set cost_ddaly_dnew_infection; if scenario=10; proc transpose out=s_10; data v_10; set s_10; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=10; keep lower upper intervention;
data cpia_s_11;  set cost_ddaly_dnew_infection; if scenario=11; proc transpose out=s_11; data v_11; set s_11; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=11; keep lower upper intervention;
data cpia_s_12;  set cost_ddaly_dnew_infection; if scenario=12; proc transpose out=s_12; data v_12; set s_12; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=12; keep lower upper intervention;
data cpia_s_13;  set cost_ddaly_dnew_infection; if scenario=13; proc transpose out=s_13; data v_13; set s_13; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=13; keep lower upper intervention;
data cpia_s_14;  set cost_ddaly_dnew_infection; if scenario=14; proc transpose out=s_14; data v_14; set s_14; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=14; keep lower upper intervention;
data cpia_s_15;  set cost_ddaly_dnew_infection; if scenario=15; proc transpose out=s_15; data v_15; set s_15; if _NAME_ = 'cpia'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); intervention=15; keep lower upper intervention;


data cpia_scen_1_lower; set v_1; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 1  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_1_upper; set v_1; lower_or_upper = 2; lower_upper_cpia = upper - lower-lower; intervention = 1  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_2_lower; set v_2; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 2  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_2_upper; set v_2; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 2  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_3_lower; set v_3; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 3  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_3_upper; set v_3; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 3  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_4_lower; set v_4; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 4  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_4_upper; set v_4; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 4  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_5_lower; set v_5; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 5  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_5_upper; set v_5; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 5  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_6_lower; set v_6; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 6  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_6_upper; set v_6; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 6  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_7_lower; set v_7; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 7  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_7_upper; set v_7; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 7  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_8_lower; set v_8; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 8  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_8_upper; set v_8; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 8  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_9_lower; set v_9; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 9  ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_9_upper; set v_9; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 9  ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_10_lower; set v_10; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 10 ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_10_upper; set v_10; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 10 ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_11_lower; set v_11; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 11 ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_11_upper; set v_11; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 11 ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_12_lower; set v_12; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 12 ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_12_upper; set v_12; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 12 ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_13_lower; set v_13; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 13 ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_13_upper; set v_13; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 13 ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_14_lower; set v_14; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 14 ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_14_upper; set v_14; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 14 ;  keep lower_or_upper lower_upper_cpia intervention  ;

data cpia_scen_15_lower; set v_15; lower_or_upper = 1; lower_upper_cpia = lower; intervention = 15 ;  keep lower_or_upper lower_upper_cpia intervention  ;
data cpia_scen_15_upper; set v_15; lower_or_upper = 2; lower_upper_cpia = upper - lower; intervention = 15 ;  keep lower_or_upper lower_upper_cpia intervention  ;



data all_cpia; 
set 
cpia_scen_1_lower cpia_scen_1_upper
cpia_scen_2_lower cpia_scen_2_upper
cpia_scen_3_lower cpia_scen_3_upper
cpia_scen_4_lower cpia_scen_4_upper
cpia_scen_5_lower cpia_scen_5_upper
cpia_scen_6_lower cpia_scen_6_upper
cpia_scen_7_lower cpia_scen_7_upper
cpia_scen_8_lower cpia_scen_8_upper
cpia_scen_9_lower cpia_scen_9_upper
cpia_scen_10_lower cpia_scen_10_upper
cpia_scen_11_lower cpia_scen_11_upper
cpia_scen_12_lower cpia_scen_12_upper
cpia_scen_13_lower cpia_scen_13_upper
cpia_scen_14_lower cpia_scen_14_upper
cpia_scen_15_lower cpia_scen_15_upper
;


if intervention = 1 then int_name = 'a Testing_community';
if intervention = 2 then int_name = 'b Testing_risk_informed';
if intervention = 3 then int_name = 'c Self_testing_general';
if intervention = 4 then int_name = 'd Self_testing_risk_informed';
if intervention = 5 then int_name = 'e AGYW_testing';
if intervention = 6 then int_name = 'f AGYW_behaviour_change';
if intervention = 7 then int_name = 'g VMMC';
if intervention = 8 then int_name = 'h Oral_PrEP';
if intervention = 9 then int_name = 'i Oral/Cab PrEP';
if intervention = 10 then int_name = 'j Oral/Cab/VR_PrEP';
if intervention = 11 then int_name = 'k Harm_reduction_PWID';
if intervention = 12 then int_name = 'l ART_linkage_retention';
if intervention = 13 then int_name = 'm ART_adherence';
if intervention = 14 then int_name = 'n ART_coverage_PLW';
if intervention = 15 then int_name = 'o AHD_package';

ods html;

proc sgplot data=all_cpia nolegend;
	styleattrs datacolors=(white lightblue);
   	vbar int_name / response=lower_upper_cpia group=lower_or_upper groupdisplay=stack outlineattrs=(color=white thickness=3);;
   	xaxis label="Intervention" type=discrete values=('1 Testing_community' '2 Testing_risk_informed' '3 Self_testing_general' '4 Self_testing_risk_informed'
 '5 AGYW_testing' '6 AGYW_behaviour_change' '7 VMMC' '8 Oral_PrEP' '9 Oral/Cab PrEP' '10 Oral/Cab/VR_PrEP' '11 Harm_reduction_PWID' '12 ART_linkage_retention'
 '13 ART_adherence' '14 ART_coverage_PLW' '15 AHD_package');   	yaxis label="Range of cpiaS (log10)";
run;

ods html close;

ods html;

proc sgplot data=all_cpia nolegend;
	styleattrs datacolors=(white lightblue);
   	vbar int_name / response=lower_upper_cpia group=lower_or_upper groupdisplay=stack outlineattrs=(color=white thickness=3);;
   	xaxis label="Intervention" type=discrete ;   	yaxis label="Range of cpiaS (log10)";
run;

ods html close;


proc print; run;


*/




/*

* mean ddalys averted and cost incurred for 2024-2040 - and icer by model and intervention - including mean and range;

data z; set all; 
keep model scenario year ddalys  ;

proc transpose data = z  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;

proc transpose data = z  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;


proc transpose data = z  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_sq;
proc transpose data = z  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int1;
proc transpose data = z  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int2;
proc transpose data = z  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int3;
proc transpose data = z  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int4;
proc transpose data = z  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int5;
proc transpose data = z  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int6;
proc transpose data = z  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int7;
proc transpose data = z  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int8;
proc transpose data = z  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int9;
proc transpose data = z  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int10;
proc transpose data = z  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int11;
proc transpose data = z  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int12;
proc transpose data = z  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int13;
proc transpose data = z  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int14;
proc transpose data = z  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'ddalys' ; drop _NAME_; 
mean_ddalys_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep  mean_ddalys_int15;


data z_int1_1; merge d_1_0 d_1_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=1; scenario=1; 
data z_int1_2; merge d_2_0 d_2_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=2; scenario=1; 
data z_int1_3; merge d_3_0 d_3_1 ; effect_ddalys = mean_ddalys_int1 - mean_ddalys_sq; model=3; scenario=1; 
data z_int1; set z_int1_1 z_int1_2 z_int1_3;  keep scenario model effect_ddalys;

data z_int2_1; merge d_1_0 d_1_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=1; scenario=2; 
data z_int2_2; merge d_2_0 d_2_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=2; scenario=2; 
data z_int2_3; merge d_3_0 d_3_2 ; effect_ddalys = mean_ddalys_int2 - mean_ddalys_sq; model=3; scenario=2; 
data z_int2; set z_int2_1 z_int2_2 z_int2_3;  keep scenario model effect_ddalys;

data z_int3_1; merge d_1_0 d_1_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=1; scenario=3; 
data z_int3_2; merge d_2_0 d_2_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=2; scenario=3; 
data z_int3_3; merge d_3_0 d_3_3 ; effect_ddalys = mean_ddalys_int3 - mean_ddalys_sq; model=3; scenario=3; 
data z_int3; set z_int3_1 z_int3_2 z_int3_3;  keep scenario model effect_ddalys;

data z_int4_1; merge d_1_0 d_1_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=1; scenario=4; 
data z_int4_2; merge d_2_0 d_2_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=2; scenario=4; 
data z_int4_3; merge d_3_0 d_3_4 ; effect_ddalys = mean_ddalys_int4 - mean_ddalys_sq; model=3; scenario=4; 
data z_int4; set z_int4_1 z_int4_2 z_int4_3;  keep scenario model effect_ddalys;

data z_int5_1; merge d_1_0 d_1_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=1; scenario=5; 
data z_int5_2; merge d_2_0 d_2_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=2; scenario=5; 
data z_int5_3; merge d_3_0 d_3_5 ; effect_ddalys = mean_ddalys_int5 - mean_ddalys_sq; model=3; scenario=5; 
data z_int5; set z_int5_1 z_int5_2 z_int5_3;  keep scenario model effect_ddalys;

data z_int6_1; merge d_1_0 d_1_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=1; scenario=6; 
data z_int6_2; merge d_2_0 d_2_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=2; scenario=6; 
data z_int6_3; merge d_3_0 d_3_6 ; effect_ddalys = mean_ddalys_int6 - mean_ddalys_sq; model=3; scenario=6; 
data z_int6; set z_int6_1 z_int6_2 z_int6_3;  keep scenario model effect_ddalys;

data z_int7_1; merge d_1_0 d_1_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=1; scenario=7; 
data z_int7_2; merge d_2_0 d_2_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=2; scenario=7; 
data z_int7_3; merge d_3_0 d_3_7 ; effect_ddalys = mean_ddalys_int7 - mean_ddalys_sq; model=3; scenario=7; 
data z_int7; set z_int7_1 z_int7_2 z_int7_3;  keep scenario model effect_ddalys;

data z_int8_1; merge d_1_0 d_1_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=1; scenario=8; 
data z_int8_2; merge d_2_0 d_2_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=2; scenario=8; 
data z_int8_3; merge d_3_0 d_3_8 ; effect_ddalys = mean_ddalys_int8 - mean_ddalys_sq; model=3; scenario=8; 
data z_int8; set z_int8_1 z_int8_2 z_int8_3;  keep scenario model effect_ddalys;

data z_int9_1; merge d_1_0 d_1_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=1; scenario=9; 
data z_int9_2; merge d_2_0 d_2_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=2; scenario=9; 
data z_int9_3; merge d_3_0 d_3_9 ; effect_ddalys = mean_ddalys_int9 - mean_ddalys_sq; model=3; scenario=9; 
data z_int9; set z_int9_1 z_int9_2 z_int9_3;  keep scenario model effect_ddalys;

data z_int10_1; merge d_1_0 d_1_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=1; scenario=10; 
data z_int10_2; merge d_2_0 d_2_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=2; scenario=10; 
data z_int10_3; merge d_3_0 d_3_10 ; effect_ddalys = mean_ddalys_int10 - mean_ddalys_sq; model=3; scenario=10; 
data z_int10; set z_int10_1 z_int10_2 z_int10_3;  keep scenario model effect_ddalys;

data z_int11_1; merge d_1_0 d_1_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=1; scenario=11; 
data z_int11_2; merge d_2_0 d_2_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=2; scenario=11; 
data z_int11_3; merge d_3_0 d_3_11 ; effect_ddalys = mean_ddalys_int11 - mean_ddalys_sq; model=3; scenario=11; 
data z_int11; set z_int11_1 z_int11_2 z_int11_3;  keep scenario model effect_ddalys;

data z_int12_1; merge d_1_0 d_1_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=1; scenario=12; 
data z_int12_2; merge d_2_0 d_2_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=2; scenario=12; 
data z_int12_3; merge d_3_0 d_3_12 ; effect_ddalys = mean_ddalys_int12 - mean_ddalys_sq; model=3; scenario=12; 
data z_int12; set z_int12_1 z_int12_2 z_int12_3;  keep scenario model effect_ddalys;

data z_int13_1; merge d_1_0 d_1_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=1; scenario=13; 
data z_int13_2; merge d_2_0 d_2_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=2; scenario=13; 
data z_int13_3; merge d_3_0 d_3_13 ; effect_ddalys = mean_ddalys_int13 - mean_ddalys_sq; model=3; scenario=13; 
data z_int13; set z_int13_1 z_int13_2 z_int13_3;  keep scenario model effect_ddalys;

data z_int14_1; merge d_1_0 d_1_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=1; scenario=14; 
data z_int14_2; merge d_2_0 d_2_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=2; scenario=14; 
data z_int14_3; merge d_3_0 d_3_14 ; effect_ddalys = mean_ddalys_int14 - mean_ddalys_sq; model=3; scenario=14; 
data z_int14; set z_int14_1 z_int14_2 z_int14_3;  keep scenario model effect_ddalys;

data z_int15_1; merge d_1_0 d_1_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=1; scenario=15; 
data z_int15_2; merge d_2_0 d_2_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=2; scenario=15; 
data z_int15_3; merge d_3_0 d_3_15 ; effect_ddalys = mean_ddalys_int15 - mean_ddalys_sq; model=3; scenario=15; 
data z_int15; set z_int15_1 z_int15_2 z_int15_3;  keep scenario model effect_ddalys;


data ddalys_averted; set z_int1 z_int2 z_int3 z_int4 z_int5 z_int6 z_int7
 z_int8 z_int9 z_int10 z_int11 z_int12 z_int13 z_int14 z_int15; 


data u; set all; 
keep model scenario year dcost  ;

proc transpose data = u  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;

proc transpose data = u  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;


proc transpose data = u  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_sq;
proc transpose data = u  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int1;
proc transpose data = u  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int2;
proc transpose data = u  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int3;
proc transpose data = u  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int4;
proc transpose data = u  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int5;
proc transpose data = u  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int6;
proc transpose data = u  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int7;
proc transpose data = u  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int8;
proc transpose data = u  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int9;
proc transpose data = u  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int10;
proc transpose data = u  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int11;
proc transpose data = u  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int12;
proc transpose data = u  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int13;
proc transpose data = u  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int14;
proc transpose data = u  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'dcost' ; drop _NAME_; 
mean_dcost_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_dcost_int15;



data u_int1_1; merge d_1_0 d_1_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=1; scenario=1; 
data u_int1_2; merge d_2_0 d_2_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=2; scenario=1; 
data u_int1_3; merge d_3_0 d_3_1 ; effect_dcost = mean_dcost_int1 - mean_dcost_sq; model=3; scenario=1; 
data u_int1; set u_int1_1 u_int1_2 u_int1_3;  keep scenario model effect_dcost;

data u_int2_1; merge d_1_0 d_1_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=1; scenario=2; 
data u_int2_2; merge d_2_0 d_2_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=2; scenario=2; 
data u_int2_3; merge d_3_0 d_3_2 ; effect_dcost = mean_dcost_int2 - mean_dcost_sq; model=3; scenario=2; 
data u_int2; set u_int2_1 u_int2_2 u_int2_3;  keep scenario model effect_dcost;

data u_int3_1; merge d_1_0 d_1_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=1; scenario=3; 
data u_int3_2; merge d_2_0 d_2_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=2; scenario=3; 
data u_int3_3; merge d_3_0 d_3_3 ; effect_dcost = mean_dcost_int3 - mean_dcost_sq; model=3; scenario=3; 
data u_int3; set u_int3_1 u_int3_2 u_int3_3;  keep scenario model effect_dcost;

data u_int4_1; merge d_1_0 d_1_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=1; scenario=4; 
data u_int4_2; merge d_2_0 d_2_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=2; scenario=4; 
data u_int4_3; merge d_3_0 d_3_4 ; effect_dcost = mean_dcost_int4 - mean_dcost_sq; model=3; scenario=4; 
data u_int4; set u_int4_1 u_int4_2 u_int4_3;  keep scenario model effect_dcost;

data u_int5_1; merge d_1_0 d_1_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=1; scenario=5; 
data u_int5_2; merge d_2_0 d_2_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=2; scenario=5; 
data u_int5_3; merge d_3_0 d_3_5 ; effect_dcost = mean_dcost_int5 - mean_dcost_sq; model=3; scenario=5; 
data u_int5; set u_int5_1 u_int5_2 u_int5_3;  keep scenario model effect_dcost;

data u_int6_1; merge d_1_0 d_1_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=1; scenario=6; 
data u_int6_2; merge d_2_0 d_2_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=2; scenario=6; 
data u_int6_3; merge d_3_0 d_3_6 ; effect_dcost = mean_dcost_int6 - mean_dcost_sq; model=3; scenario=6; 
data u_int6; set u_int6_1 u_int6_2 u_int6_3;  keep scenario model effect_dcost;

data u_int7_1; merge d_1_0 d_1_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=1; scenario=7; 
data u_int7_2; merge d_2_0 d_2_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=2; scenario=7; 
data u_int7_3; merge d_3_0 d_3_7 ; effect_dcost = mean_dcost_int7 - mean_dcost_sq; model=3; scenario=7; 
data u_int7; set u_int7_1 u_int7_2 u_int7_3;  keep scenario model effect_dcost;

data u_int8_1; merge d_1_0 d_1_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=1; scenario=8; 
data u_int8_2; merge d_2_0 d_2_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=2; scenario=8; 
data u_int8_3; merge d_3_0 d_3_8 ; effect_dcost = mean_dcost_int8 - mean_dcost_sq; model=3; scenario=8; 
data u_int8; set u_int8_1 u_int8_2 u_int8_3;  keep scenario model effect_dcost;

data u_int9_1; merge d_1_0 d_1_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=1; scenario=9; 
data u_int9_2; merge d_2_0 d_2_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=2; scenario=9; 
data u_int9_3; merge d_3_0 d_3_9 ; effect_dcost = mean_dcost_int9 - mean_dcost_sq; model=3; scenario=9; 
data u_int9; set u_int9_1 u_int9_2 u_int9_3;  keep scenario model effect_dcost;

data u_int10_1; merge d_1_0 d_1_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=1; scenario=10; 
data u_int10_2; merge d_2_0 d_2_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=2; scenario=10; 
data u_int10_3; merge d_3_0 d_3_10 ; effect_dcost = mean_dcost_int10 - mean_dcost_sq; model=3; scenario=10; 
data u_int10; set u_int10_1 u_int10_2 u_int10_3;  keep scenario model effect_dcost;

data u_int11_1; merge d_1_0 d_1_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=1; scenario=11; 
data u_int11_2; merge d_2_0 d_2_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=2; scenario=11; 
data u_int11_3; merge d_3_0 d_3_11 ; effect_dcost = mean_dcost_int11 - mean_dcost_sq; model=3; scenario=11; 
data u_int11; set u_int11_1 u_int11_2 u_int11_3;  keep scenario model effect_dcost;

data u_int12_1; merge d_1_0 d_1_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=1; scenario=12; 
data u_int12_2; merge d_2_0 d_2_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=2; scenario=12; 
data u_int12_3; merge d_3_0 d_3_12 ; effect_dcost = mean_dcost_int12 - mean_dcost_sq; model=3; scenario=12; 
data u_int12; set u_int12_1 u_int12_2 u_int12_3;  keep scenario model effect_dcost;

data u_int13_1; merge d_1_0 d_1_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=1; scenario=13; 
data u_int13_2; merge d_2_0 d_2_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=2; scenario=13; 
data u_int13_3; merge d_3_0 d_3_13 ; effect_dcost = mean_dcost_int13 - mean_dcost_sq; model=3; scenario=13; 
data u_int13; set u_int13_1 u_int13_2 u_int13_3;  keep scenario model effect_dcost;

data u_int14_1; merge d_1_0 d_1_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=1; scenario=14; 
data u_int14_2; merge d_2_0 d_2_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=2; scenario=14; 
data u_int14_3; merge d_3_0 d_3_14 ; effect_dcost = mean_dcost_int14 - mean_dcost_sq; model=3; scenario=14; 
data u_int14; set u_int14_1 u_int14_2 u_int14_3;  keep scenario model effect_dcost;

data u_int15_1; merge d_1_0 d_1_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=1; scenario=15; 
data u_int15_2; merge d_2_0 d_2_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=2; scenario=15; 
data u_int15_3; merge d_3_0 d_3_15 ; effect_dcost = mean_dcost_int15 - mean_dcost_sq; model=3; scenario=15; 
data u_int15; set u_int15_1 u_int15_2 u_int15_3;  keep scenario model effect_dcost;


data dcost_incurred; set u_int1 u_int2 u_int3 u_int4 u_int5 u_int6 u_int7
 u_int8 u_int9 u_int10 u_int11 u_int12 u_int13 u_int14 u_int15; 



data cost_ddaly; merge ddalys_averted dcost_incurred ;

icer=.; if effect_dcost > 0 and effect_ddalys < 0 then icer = effect_dcost / (-effect_ddalys);
if . < effect_dcost <= 0 and effect_ddalys < 0 then icer = 0; if effect_ddalys >= 0 then icer=1000000;

icer = log10(icer+1);


* plots of mean and range of icers across models by intervention ;

data icer_s_1;  set cost_ddaly; if scenario=1; proc transpose out=s_1; data v_1; set s_1; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); 
if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;
intervention=1; keep lower upper mean intervention;
data icer_s_2;  set cost_ddaly; if scenario=2; proc transpose out=s_2; data v_2; set s_2; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=2; keep mean lower upper intervention;
data icer_s_3;  set cost_ddaly; if scenario=3; proc transpose out=s_3; data v_3; set s_3; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=3; keep mean lower upper intervention;
data icer_s_4;  set cost_ddaly; if scenario=4; proc transpose out=s_4; data v_4; set s_4; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=4; keep mean lower upper intervention;
data icer_s_5;  set cost_ddaly; if scenario=5; proc transpose out=s_5; data v_5; set s_5; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=5; keep mean lower upper intervention;
data icer_s_6;  set cost_ddaly; if scenario=6; proc transpose out=s_6; data v_6; set s_6; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=6; keep mean lower upper intervention;
data icer_s_7;  set cost_ddaly; if scenario=7; proc transpose out=s_7; data v_7; set s_7; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=7; keep mean lower upper intervention;
data icer_s_8;  set cost_ddaly; if scenario=8; proc transpose out=s_8; data v_8; set s_8; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=8; keep mean lower upper intervention;
data icer_s_9;  set cost_ddaly; if scenario=9; proc transpose out=s_9; data v_9; set s_9; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=9; keep mean lower upper intervention;
data icer_s_10;  set cost_ddaly; if scenario=10; proc transpose out=s_10; data v_10; set s_10; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=10; keep mean lower upper intervention;
data icer_s_11;  set cost_ddaly; if scenario=11; proc transpose out=s_11; data v_11; set s_11; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=11; keep mean lower upper intervention;
data icer_s_12;  set cost_ddaly; if scenario=12; proc transpose out=s_12; data v_12; set s_12; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=12; keep mean lower upper intervention;
data icer_s_13;  set cost_ddaly; if scenario=13; proc transpose out=s_13; data v_13; set s_13; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=13; keep mean lower upper intervention;
data icer_s_14;  set cost_ddaly; if scenario=14; proc transpose out=s_14; data v_14; set s_14; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=14; keep mean lower upper intervention;
data icer_s_15;  set cost_ddaly; if scenario=15; proc transpose out=s_15; data v_15; set s_15; if _NAME_ = 'icer'; 
lower = min(col1, col2, col3);  upper = max(col1, col2, col3); if col1 ne . and col2 ne . and col3 ne . then mean = (col1+col2+col3)/3; if col1 = . and col2 ne . and col3 ne . then mean = (col2+col3)/2; 
if col1 ne . and col2 = . and col3 ne . then mean = (col1+col3)/2; if col2 ne . and col2 ne . and col3 = . then mean = (col1+col2)/2;
if col1 =. and col2=. then mean = col3; if col1 =. and col3=. then mean = col2; if col2 =. and col3=. then mean = col1;intervention=15; keep mean lower upper intervention;


data all_icer;
set v_1 v_2 v_3 v_4 v_5 v_6 v_7 v_8 v_9 v_10 v_11 v_12 v_13 v_14 v_15
;

if intervention = 1 then int_name = 'a Testing_community';
if intervention = 2 then int_name = 'b Testing_risk_informed';
if intervention = 3 then int_name = 'c Self_testing_general';
if intervention = 4 then int_name = 'd Self_testing_risk_informed';
if intervention = 5 then int_name = 'e AGYW_testing';
if intervention = 6 then int_name = 'f AGYW_behaviour_change';
if intervention = 7 then int_name = 'g VMMC';
if intervention = 8 then int_name = 'h Oral_PrEP';
if intervention = 9 then int_name = 'i Oral/Cab PrEP';
if intervention = 10 then int_name = 'j Oral/Cab/VR_PrEP';
if intervention = 11 then int_name = 'k Harm_reduction_PWID';
if intervention = 12 then int_name = 'l ART_linkage_retention';
if intervention = 13 then int_name = 'm ART_adherence';
if intervention = 14 then int_name = 'n ART_coverage_PLW';
if intervention = 15 then int_name = 'o AHD_package';

ods html;
proc sgplot data=all_icer nolegend;
   title "ICER Ranges for Interventions";
   highlow x=int_name low=lower high=upper / type=bar lineattrs=(color=black thickness=2);
   scatter x=int_name y=mean / markerattrs=(symbol=circlefilled size=8 color=red);
   xaxis label="Intervention" type=discrete ;   	
   yaxis label="ICER (log10)" grid;
run;
ods html close;

*/





/*

* graph of effects of interventions on new infections age 15+ over 2024-2040 ;


data z; set all; 
keep model scenario year new_infection_15pl  ;

proc transpose data = z  out= s_1_0; where model = 1 and scenario = 0 and year ge 2024; data d_1_0; set s_1_0; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_sq;
proc transpose data = z  out= s_1_1; where model = 1 and scenario = 1 and year ge 2024; data d_1_1; set s_1_1; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int1;
proc transpose data = z  out= s_1_2; where model = 1 and scenario = 2 and year ge 2024; data d_1_2; set s_1_2; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int2;
proc transpose data = z  out= s_1_3; where model = 1 and scenario = 3 and year ge 2024; data d_1_3; set s_1_3; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int3;
proc transpose data = z  out= s_1_4; where model = 1 and scenario = 4 and year ge 2024; data d_1_4; set s_1_4; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int4;
proc transpose data = z  out= s_1_5; where model = 1 and scenario = 5 and year ge 2024; data d_1_5; set s_1_5; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int5;
proc transpose data = z  out= s_1_6; where model = 1 and scenario = 6 and year ge 2024; data d_1_6; set s_1_6; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int6;
proc transpose data = z  out= s_1_7; where model = 1 and scenario = 7 and year ge 2024; data d_1_7; set s_1_7; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int7;
proc transpose data = z  out= s_1_8; where model = 1 and scenario = 8 and year ge 2024; data d_1_8; set s_1_6; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int8;
proc transpose data = z  out= s_1_9; where model = 1 and scenario = 9 and year ge 2024; data d_1_9; set s_1_9; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int9;
proc transpose data = z  out= s_1_10; where model = 1 and scenario = 10 and year ge 2024; data d_1_10; set s_1_10; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int10;
proc transpose data = z  out= s_1_11; where model = 1 and scenario = 11 and year ge 2024; data d_1_11; set s_1_11; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int11;
proc transpose data = z  out= s_1_12; where model = 1 and scenario = 12 and year ge 2024; data d_1_12; set s_1_12; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int12;
proc transpose data = z  out= s_1_13; where model = 1 and scenario = 13 and year ge 2024; data d_1_13; set s_1_13; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int13;
proc transpose data = z  out= s_1_14; where model = 1 and scenario = 14 and year ge 2024; data d_1_14; set s_1_14; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int14;
proc transpose data = z  out= s_1_15; where model = 1 and scenario = 15 and year ge 2024; data d_1_15; set s_1_15; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int15;

proc transpose data = z  out= s_2_0; where model = 2 and scenario = 0 and year ge 2024; data d_2_0; set s_2_0; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_sq;
proc transpose data = z  out= s_2_1; where model = 2 and scenario = 1 and year ge 2024; data d_2_1; set s_2_1; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int1;
proc transpose data = z  out= s_2_2; where model = 2 and scenario = 2 and year ge 2024; data d_2_2; set s_2_2; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int2;
proc transpose data = z  out= s_2_3; where model = 2 and scenario = 3 and year ge 2024; data d_2_3; set s_2_3; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int3;
proc transpose data = z  out= s_2_4; where model = 2 and scenario = 4 and year ge 2024; data d_2_4; set s_2_4; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int4;
proc transpose data = z  out= s_2_5; where model = 2 and scenario = 5 and year ge 2024; data d_2_5; set s_2_5; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int5;
proc transpose data = z  out= s_2_6; where model = 2 and scenario = 6 and year ge 2024; data d_2_6; set s_2_6; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int6;
proc transpose data = z  out= s_2_7; where model = 2 and scenario = 7 and year ge 2024; data d_2_7; set s_2_7; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int7;
proc transpose data = z  out= s_2_8; where model = 2 and scenario = 8 and year ge 2024; data d_2_8; set s_2_6; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int8;
proc transpose data = z  out= s_2_9; where model = 2 and scenario = 9 and year ge 2024; data d_2_9; set s_2_9; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int9;
proc transpose data = z  out= s_2_10; where model = 2 and scenario = 10 and year ge 2024; data d_2_10; set s_2_10; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int10;
proc transpose data = z  out= s_2_11; where model = 2 and scenario = 11 and year ge 2024; data d_2_11; set s_2_11; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int11;
proc transpose data = z  out= s_2_12; where model = 2 and scenario = 12 and year ge 2024; data d_2_12; set s_2_12; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int12;
proc transpose data = z  out= s_2_13; where model = 2 and scenario = 13 and year ge 2024; data d_2_13; set s_2_13; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int13;
proc transpose data = z  out= s_2_14; where model = 2 and scenario = 14 and year ge 2024; data d_2_14; set s_2_14; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int14;
proc transpose data = z  out= s_2_15; where model = 2 and scenario = 15 and year ge 2024; data d_2_15; set s_2_15; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int15;


proc transpose data = z  out= s_3_0; where model = 3 and scenario = 0 and year ge 2024; data d_3_0; set s_3_0; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_sq = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_sq;
proc transpose data = z  out= s_3_1; where model = 3 and scenario = 1 and year ge 2024; data d_3_1; set s_3_1; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int1 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int1;
proc transpose data = z  out= s_3_2; where model = 3 and scenario = 2 and year ge 2024; data d_3_2; set s_3_2; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int2 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int2;
proc transpose data = z  out= s_3_3; where model = 3 and scenario = 3 and year ge 2024; data d_3_3; set s_3_3; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int3 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int3;
proc transpose data = z  out= s_3_4; where model = 3 and scenario = 4 and year ge 2024; data d_3_4; set s_3_4; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int4 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int4;
proc transpose data = z  out= s_3_5; where model = 3 and scenario = 5 and year ge 2024; data d_3_5; set s_3_5; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int5 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int5;
proc transpose data = z  out= s_3_6; where model = 3 and scenario = 6 and year ge 2024; data d_3_6; set s_3_6; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int6 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int6;
proc transpose data = z  out= s_3_7; where model = 3 and scenario = 7 and year ge 2024; data d_3_7; set s_3_7; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int7 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int7;
proc transpose data = z  out= s_3_8; where model = 3 and scenario = 8 and year ge 2024; data d_3_8; set s_3_6; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int8 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int8;
proc transpose data = z  out= s_3_9; where model = 3 and scenario = 9 and year ge 2024; data d_3_9; set s_3_9; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int9 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int9;
proc transpose data = z  out= s_3_10; where model = 3 and scenario = 10 and year ge 2024; data d_3_10; set s_3_10; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int10 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int10;
proc transpose data = z  out= s_3_11; where model = 3 and scenario = 11 and year ge 2024; data d_3_11; set s_3_11; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int11 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int11;
proc transpose data = z  out= s_3_12; where model = 3 and scenario = 12 and year ge 2024; data d_3_12; set s_3_12; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int12 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int12;
proc transpose data = z  out= s_3_13; where model = 3 and scenario = 13 and year ge 2024; data d_3_13; set s_3_13; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int13 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int13;
proc transpose data = z  out= s_3_14; where model = 3 and scenario = 14 and year ge 2024; data d_3_14; set s_3_14; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int14 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int14;
proc transpose data = z  out= s_3_15; where model = 3 and scenario = 15 and year ge 2024; data d_3_15; set s_3_15; if _NAME_ = 'new_infection_15pl' ; drop _NAME_; 
mean_new_infection_15pl_int15 = (col1+col2+col3+col4+col5+col6+col7+col8+col9+col10+col11+col12+col13+col14+col15+col16+col17) / 17; keep model scenario mean_new_infection_15pl_int15;


data z_effect_int1_1; merge d_1_0 d_1_1 ; effect_new_infection_15pl = mean_new_infection_15pl_int1 - mean_new_infection_15pl_sq; model=1; scenario=1; 
data z_effect_int1_2; merge d_2_0 d_2_1 ; effect_new_infection_15pl = mean_new_infection_15pl_int1 - mean_new_infection_15pl_sq; model=2; scenario=1; 
data z_effect_int1_3; merge d_3_0 d_3_1 ; effect_new_infection_15pl = mean_new_infection_15pl_int1 - mean_new_infection_15pl_sq; model=3; scenario=1; 
data z_effect_int1; set z_effect_int1_1 z_effect_int1_2 z_effect_int1_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int2_1; merge d_1_0 d_1_2 ; effect_new_infection_15pl = mean_new_infection_15pl_int2 - mean_new_infection_15pl_sq; model=1; scenario=2; 
data z_effect_int2_2; merge d_2_0 d_2_2 ; effect_new_infection_15pl = mean_new_infection_15pl_int2 - mean_new_infection_15pl_sq; model=2; scenario=2; 
data z_effect_int2_3; merge d_3_0 d_3_2 ; effect_new_infection_15pl = mean_new_infection_15pl_int2 - mean_new_infection_15pl_sq; model=3; scenario=2; 
data z_effect_int2; set z_effect_int2_1 z_effect_int2_2 z_effect_int2_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int3_1; merge d_1_0 d_1_3 ; effect_new_infection_15pl = mean_new_infection_15pl_int3 - mean_new_infection_15pl_sq; model=1; scenario=3; 
data z_effect_int3_2; merge d_2_0 d_2_3 ; effect_new_infection_15pl = mean_new_infection_15pl_int3 - mean_new_infection_15pl_sq; model=2; scenario=3; 
data z_effect_int3_3; merge d_3_0 d_3_3 ; effect_new_infection_15pl = mean_new_infection_15pl_int3 - mean_new_infection_15pl_sq; model=3; scenario=3; 
data z_effect_int3; set z_effect_int3_1 z_effect_int3_2 z_effect_int3_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int4_1; merge d_1_0 d_1_4 ; effect_new_infection_15pl = mean_new_infection_15pl_int4 - mean_new_infection_15pl_sq; model=1; scenario=4; 
data z_effect_int4_2; merge d_2_0 d_2_4 ; effect_new_infection_15pl = mean_new_infection_15pl_int4 - mean_new_infection_15pl_sq; model=2; scenario=4; 
data z_effect_int4_3; merge d_3_0 d_3_4 ; effect_new_infection_15pl = mean_new_infection_15pl_int4 - mean_new_infection_15pl_sq; model=3; scenario=4; 
data z_effect_int4; set z_effect_int4_1 z_effect_int4_2 z_effect_int4_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int5_1; merge d_1_0 d_1_5 ; effect_new_infection_15pl = mean_new_infection_15pl_int5 - mean_new_infection_15pl_sq; model=1; scenario=5; 
data z_effect_int5_2; merge d_2_0 d_2_5 ; effect_new_infection_15pl = mean_new_infection_15pl_int5 - mean_new_infection_15pl_sq; model=2; scenario=5; 
data z_effect_int5_3; merge d_3_0 d_3_5 ; effect_new_infection_15pl = mean_new_infection_15pl_int5 - mean_new_infection_15pl_sq; model=3; scenario=5; 
data z_effect_int5; set z_effect_int5_1 z_effect_int5_2 z_effect_int5_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int6_1; merge d_1_0 d_1_6 ; effect_new_infection_15pl = mean_new_infection_15pl_int6 - mean_new_infection_15pl_sq; model=1; scenario=6; 
data z_effect_int6_2; merge d_2_0 d_2_6 ; effect_new_infection_15pl = mean_new_infection_15pl_int6 - mean_new_infection_15pl_sq; model=2; scenario=6; 
data z_effect_int6_3; merge d_3_0 d_3_6 ; effect_new_infection_15pl = mean_new_infection_15pl_int6 - mean_new_infection_15pl_sq; model=3; scenario=6; 
data z_effect_int6; set z_effect_int6_1 z_effect_int6_2 z_effect_int6_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int7_1; merge d_1_0 d_1_7 ; effect_new_infection_15pl = mean_new_infection_15pl_int7 - mean_new_infection_15pl_sq; model=1; scenario=7; 
data z_effect_int7_2; merge d_2_0 d_2_7 ; effect_new_infection_15pl = mean_new_infection_15pl_int7 - mean_new_infection_15pl_sq; model=2; scenario=7; 
data z_effect_int7_3; merge d_3_0 d_3_7 ; effect_new_infection_15pl = mean_new_infection_15pl_int7 - mean_new_infection_15pl_sq; model=3; scenario=7; 
data z_effect_int7; set z_effect_int7_1 z_effect_int7_2 z_effect_int7_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int8_1; merge d_1_0 d_1_8 ; effect_new_infection_15pl = mean_new_infection_15pl_int8 - mean_new_infection_15pl_sq; model=1; scenario=8; 
data z_effect_int8_2; merge d_2_0 d_2_8 ; effect_new_infection_15pl = mean_new_infection_15pl_int8 - mean_new_infection_15pl_sq; model=2; scenario=8; 
data z_effect_int8_3; merge d_3_0 d_3_8 ; effect_new_infection_15pl = mean_new_infection_15pl_int8 - mean_new_infection_15pl_sq; model=3; scenario=8; 
data z_effect_int8; set z_effect_int8_1 z_effect_int8_2 z_effect_int8_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int9_1; merge d_1_0 d_1_9 ; effect_new_infection_15pl = mean_new_infection_15pl_int9 - mean_new_infection_15pl_sq; model=1; scenario=9; 
data z_effect_int9_2; merge d_2_0 d_2_9 ; effect_new_infection_15pl = mean_new_infection_15pl_int9 - mean_new_infection_15pl_sq; model=2; scenario=9; 
data z_effect_int9_3; merge d_3_0 d_3_9 ; effect_new_infection_15pl = mean_new_infection_15pl_int9 - mean_new_infection_15pl_sq; model=3; scenario=9; 
data z_effect_int9; set z_effect_int9_1 z_effect_int9_2 z_effect_int9_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int10_1; merge d_1_0 d_1_10 ; effect_new_infection_15pl = mean_new_infection_15pl_int10 - mean_new_infection_15pl_sq; model=1; scenario=10; 
data z_effect_int10_2; merge d_2_0 d_2_10 ; effect_new_infection_15pl = mean_new_infection_15pl_int10 - mean_new_infection_15pl_sq; model=2; scenario=10; 
data z_effect_int10_3; merge d_3_0 d_3_10 ; effect_new_infection_15pl = mean_new_infection_15pl_int10 - mean_new_infection_15pl_sq; model=3; scenario=10; 
data z_effect_int10; set z_effect_int10_1 z_effect_int10_2 z_effect_int10_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int11_1; merge d_1_0 d_1_11 ; effect_new_infection_15pl = mean_new_infection_15pl_int11 - mean_new_infection_15pl_sq; model=1; scenario=11; 
data z_effect_int11_2; merge d_2_0 d_2_11 ; effect_new_infection_15pl = mean_new_infection_15pl_int11 - mean_new_infection_15pl_sq; model=2; scenario=11; 
data z_effect_int11_3; merge d_3_0 d_3_11 ; effect_new_infection_15pl = mean_new_infection_15pl_int11 - mean_new_infection_15pl_sq; model=3; scenario=11; 
data z_effect_int11; set z_effect_int11_1 z_effect_int11_2 z_effect_int11_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int12_1; merge d_1_0 d_1_12 ; effect_new_infection_15pl = mean_new_infection_15pl_int12 - mean_new_infection_15pl_sq; model=1; scenario=12; 
data z_effect_int12_2; merge d_2_0 d_2_12 ; effect_new_infection_15pl = mean_new_infection_15pl_int12 - mean_new_infection_15pl_sq; model=2; scenario=12; 
data z_effect_int12_3; merge d_3_0 d_3_12 ; effect_new_infection_15pl = mean_new_infection_15pl_int12 - mean_new_infection_15pl_sq; model=3; scenario=12; 
data z_effect_int12; set z_effect_int12_1 z_effect_int12_2 z_effect_int12_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int13_1; merge d_1_0 d_1_13 ; effect_new_infection_15pl = mean_new_infection_15pl_int13 - mean_new_infection_15pl_sq; model=1; scenario=13; 
data z_effect_int13_2; merge d_2_0 d_2_13 ; effect_new_infection_15pl = mean_new_infection_15pl_int13 - mean_new_infection_15pl_sq; model=2; scenario=13; 
data z_effect_int13_3; merge d_3_0 d_3_13 ; effect_new_infection_15pl = mean_new_infection_15pl_int13 - mean_new_infection_15pl_sq; model=3; scenario=13; 
data z_effect_int13; set z_effect_int13_1 z_effect_int13_2 z_effect_int13_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int14_1; merge d_1_0 d_1_14 ; effect_new_infection_15pl = mean_new_infection_15pl_int14 - mean_new_infection_15pl_sq; model=1; scenario=14; 
data z_effect_int14_2; merge d_2_0 d_2_14 ; effect_new_infection_15pl = mean_new_infection_15pl_int14 - mean_new_infection_15pl_sq; model=2; scenario=14; 
data z_effect_int14_3; merge d_3_0 d_3_14 ; effect_new_infection_15pl = mean_new_infection_15pl_int14 - mean_new_infection_15pl_sq; model=3; scenario=14; 
data z_effect_int14; set z_effect_int14_1 z_effect_int14_2 z_effect_int14_3;  keep scenario model effect_new_infection_15pl;

data z_effect_int15_1; merge d_1_0 d_1_15 ; effect_new_infection_15pl = mean_new_infection_15pl_int15 - mean_new_infection_15pl_sq; model=1; scenario=15; 
data z_effect_int15_2; merge d_2_0 d_2_15 ; effect_new_infection_15pl = mean_new_infection_15pl_int15 - mean_new_infection_15pl_sq; model=2; scenario=15; 
data z_effect_int15_3; merge d_3_0 d_3_15 ; effect_new_infection_15pl = mean_new_infection_15pl_int15 - mean_new_infection_15pl_sq; model=3; scenario=15; 
data z_effect_int15; set z_effect_int15_1 z_effect_int15_2 z_effect_int15_3;  keep scenario model effect_new_infection_15pl;


data z_effect; set z_effect_int1 z_effect_int2 z_effect_int3 z_effect_int4 z_effect_int5 z_effect_int6 z_effect_int7
 z_effect_int8 z_effect_int9 z_effect_int10 z_effect_int11 z_effect_int12 z_effect_int13 z_effect_int14 z_effect_int15; 


if scenario = 1 then int_name = 'a Testing_community';
if scenario = 2 then int_name = 'b Testing_risk_informed';
if scenario = 3 then int_name = 'c Self_testing_general';
if scenario = 4 then int_name = 'd Self_testing_risk_informed';
if scenario = 5 then int_name = 'e AGYW_testing';
if scenario = 6 then int_name = 'f AGYW_behaviour_change';
if scenario = 7 then int_name = 'g VMMC';
if scenario = 8 then int_name = 'h Oral_PrEP';
if scenario = 9 then int_name = 'i Oral/Cab PrEP';
if scenario = 10 then int_name = 'j Oral/Cab/VR_PrEP';
if scenario = 11 then int_name = 'k Harm_reduction_PWID';
if scenario = 12 then int_name = 'l ART_linkage_retention';
if scenario = 13 then int_name = 'm ART_adherence';
if scenario = 14 then int_name = 'n ART_coverage_PLW';
if scenario = 15 then int_name = 'o AHD_package';


ods html;

data x; set z_effect; 
title 'Reduction in annual number of new infections in adults age 15+ by intervention';
proc sgplot data=x noborder nolegend;
styleattrs datacolors=(black red green);
  vbar int_name / response=effect_new_infection_15pl
          group=model groupdisplay=cluster
     ;
  xaxis display=(nolabel noline noticks);
  yaxis display=(noline) grid;
  * xaxis label="Intervention" display=(noline noticks); 
 * xaxis label="Intervention" type=discrete values=('1 Testing_community' '2 Testing_risk_informed' '3 Self_testing_general' '4 Self_testing_risk_informed'
 '5 AGYW_testing' '6 AGYW_behaviour_change' '7 VMMC' '8 Oral_PrEP' '9 Oral/Cab PrEP' '10 Oral/Cab/VR_PrEP' '11 Harm_reduction_PWID' '12 ART_linkage_retention'
 '13 ART_adherence' '14 ART_coverage_PLW' '15 AHD_package');   	yaxis label="Range of cpiaS (log10)";
  yaxis label="Number" display=(noline) grid;
run;


ods html close;


*/

