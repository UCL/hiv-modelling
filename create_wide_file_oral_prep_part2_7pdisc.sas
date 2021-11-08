


  libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\oral_prep";
* libname a '/home/rmjlaph/';

data y; 

  set a.oral_prep_13_7pdisc    ;  


  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

/* proc means  noprint data=y; var &v; output out=y_19 mean= &v._19; by run ; where 2019.25 <= cald <= 2019.5; */
proc means  noprint data=y; var &v; output out=y_17 mean= &v._17; by run ; where 2016.5 <= cald < 2017.5; 
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run ; where 2019.5 <= cald < 2020.5; 
proc means  noprint data=y; var &v; output out=y_21 mean= &v._21; by run ; where 2020.5 <= cald < 2021.5; 

/* proc means noprint data=y; var &v; output out=y_20b   mean= &v._20b; by run option ; where 2020.25 <= cald < 2020.5; */
/* proc means noprint data=y; var &v; output out=y_20_21 mean= &v._20_21; by run option ; where 2020.25 <= cald < 2021.25;*/   
/* proc means noprint data=y; var &v; output out=y_21 mean= &v._21; by run option ; where cald = 2021.50; */
 proc means noprint data=y; var &v; output out=y_21_22 mean= &v._21_22; by run option ; where 2021.5 <= cald < 2022.50;
 proc means noprint data=y; var &v; output out=y_21_26 mean= &v._21_26; by run option ; where 2021.5 <= cald < 2026.50;
 proc means noprint data=y; var &v; output out=y_41 mean= &v._41; by run option ; where 2040.5 <= cald < 2041.50;
 proc means noprint data=y; var &v; output out=y_70 mean= &v._70; by run option ; where 2070.0 <= cald < 2071.00;
/* proc means noprint data=y; var &v; output out=y_20_30 mean= &v._20_30; by run option ; where 2020.5 <= cald < 2030.50;*/
/* proc means noprint data=y; var &v; output out=y_20_40 mean= &v._20_40; by run option ; where 2020.5 <= cald < 2040.50; */

 proc means noprint data=y; var &v; output out=y_21_71 mean= &v._21_71; by run option ; where 2021.5 <= cald < 2071.00; * deliberate to choose 2071 ;
 proc means noprint data=y; var &v; output out=y_21_41 mean= &v._21_41; by run option ; where 2021.5 <= cald < 2041.50;
 
  
/* proc sort data=y_20b; by run; proc transpose data=y_20b out=t_20b prefix=&v._20b_; var &v._20b; by run; */ 
/* proc sort data=y_21; by run; proc transpose data=y_21 out=t_21 prefix=&v._21_; var &v._21; by run; */
/*   proc sort data=y_20_21; by run; proc transpose data=y_20_21 out=t_20_21 prefix=&v._20_21_; var &v._20_21; by run;  */
 proc sort data=y_21_22; by run; proc transpose data=y_21_22 out=t_21_22 prefix=&v._21_22_; var &v._21_22; by run; 
 proc sort data=y_21_26; by run; proc transpose data=y_21_26 out=t_21_26 prefix=&v._21_26_; var &v._21_26; by run; 
 proc sort data=y_41; by run; proc transpose data=y_41 out=t_41 prefix=&v._41_; var &v._41; by run; 
 proc sort data=y_70; by run; proc transpose data=y_70 out=t_70 prefix=&v._70_; var &v._70; by run; 
/* proc sort data=y_20_30; by run; proc transpose data=y_20_30 out=t_20_30 prefix=&v._20_30_; var &v._20_30; by run; */
/* proc sort data=y_20_40; by run; proc transpose data=y_20_40 out=t_20_40 prefix=&v._20_40_; var &v._20_40; by run; */

 proc sort data=y_21_71; by run; proc transpose data=y_21_71 out=t_21_71 prefix=&v._21_71_; var &v._21_71; by run;  
 proc sort data=y_21_41; by run; proc transpose data=y_21_41 out=t_21_41 prefix=&v._21_41_; var &v._21_41; by run;  

data &v ; merge y_17 y_20 y_21 t_21_26 t_21_22 t_21_41 t_21_71 t_41  t_70 ;
drop _NAME_ _TYPE_ _FREQ_;

%mend var;

%var(v=ddaly_all);  %var(v=dcost); ; 


data   wide_outputs; merge 
ddaly_all  dcost ;

proc contents; run;

proc sort; by run; run;


* To get one row per run;

  data a.wide_oral_prep_13_7pdisc   ;

  set   wide_outputs  ;  
  by run;

proc print  data = a.wide_oral_prep_13_7pdisc; run;


