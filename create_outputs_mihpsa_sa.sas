

libname a "C:\Users\Toshiba\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\c2021ds_sa\";

data g; set  a.base_sa_32 ;

if run <= 147946637
;


proc sort data=g; 
by run cald option;run;


* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;

set g ;

if cald=2021.5;
s_alive = s_alive_m + s_alive_w ;
sf_2021 = 58500000 / s_alive;
keep run sf_2021;
proc sort; by run;
*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2021;

data y; 
merge g sf;
by run ;

s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15 = s_hivge15m + s_hivge15w ;
s_alive = s_alive_m + s_alive_w ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence_hiv_preg;			prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* n_onart_w;					n_onart_w = s_onart_w * &sf;
* n_onart_m;					n_onart_m = s_onart_m * &sf;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ;  p_diag_w = p_diag_w * 100;
* p_onart_vl1000_;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* n_new_inf1549m; 				n_new_inf1549m = s_primary1549m * &sf * 4;
* n_new_inf1549w;				n_new_inf1549w = s_primary1549w * &sf * 4;
* n_death_hiv_m;				n_death_hiv_m = s_death_hiv_m * &sf * 4;
* n_death_hiv_w;				n_death_hiv_w = s_death_hiv_w * &sf * 4;
* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
* n_tested_m;					n_tested_m = s_tested_m * &sf * 4;
* n_tested_w;					n_tested_w = s_tested_w * &sf * 4;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;




keep run option cald 

prevalence1549m prevalence1549w prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m p_mcirc_1549m p_diag_w p_diag_m p_onart_vl1000_
incidence1549w incidence1549m n_new_inf1549m n_new_inf1549w n_death_hiv_m n_death_hiv_w n_death_2059_w n_death_2059_m n_tested_m n_tested_w
test_prop_positive

;

  options nomprint;
  option nospool;

proc print; run;  


***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

proc means  noprint data=y; var &v; output out=y_95 mean= &v._95; by run ; where 1994.5 <= cald < 1995.5; 
proc means  noprint data=y; var &v; output out=y_00 mean= &v._00; by run ; where 1999.5 <= cald < 2000.5; 
proc means  noprint data=y; var &v; output out=y_05 mean= &v._05; by run ; where 2004.5 <= cald < 2005.5; 
proc means  noprint data=y; var &v; output out=y_10 mean= &v._10; by run ; where 2009.5 <= cald < 2010.5; 
proc means  noprint data=y; var &v; output out=y_15 mean= &v._15; by run ; where 2014.5 <= cald < 2015.5; 
proc means  noprint data=y; var &v; output out=y_17 mean= &v._17; by run ; where 2016.5 <= cald < 2017.5; 
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run ; where 2019.5 <= cald < 2020.5; 
proc means  noprint data=y; var &v; output out=y_21 mean= &v._21; by run ; where 2020.5 <= cald < 2021.5; 
proc means  noprint data=y; var &v; output out=y_40 mean= &v._40; by run ; where 2039.5 <= cald < 2040.5; 
proc means  noprint data=y; var &v; output out=y_70 mean= &v._70; by run ; where 2069.5 <= cald < 2070.5; 

proc means noprint data=y; var &v; output out=y_21_22 mean= &v._21_22; by run option ; where 2021.5 <= cald < 2022.50;
proc means noprint data=y; var &v; output out=y_21_26 mean= &v._21_26; by run option ; where 2021.5 <= cald < 2026.50;

proc means noprint data=y; var &v; output out=y_21_71 mean= &v._21_71; by run option ; where 2021.5 <= cald < 2071.00; 
																													   
proc sort data=y_21_22; by run; proc transpose data=y_21_22 out=t_21_22 prefix=&v._21_22_; var &v._21_22; by run; 
proc sort data=y_21_26; by run; proc transpose data=y_21_26 out=t_21_26 prefix=&v._21_26_; var &v._21_26; by run; 

proc sort data=y_21_71; by run; proc transpose data=y_21_71 out=t_21_71 prefix=&v._21_71_; var &v._21_71; by run;  

data &v ; merge y_95 y_00 y_05 y_10 y_15 y_17 y_20 y_21 y_40 y_70 t_21_26 t_21_22 t_21_71 ;  
drop _NAME_ _TYPE_ _FREQ_;



%mend var;

prevalence1549m prevalence1549w prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m p_mcirc_1549m p_diag_w p_diag_m p_onart_vl1000_
incidence1549w incidence1549m n_new_inf1549m n_new_inf1549w n_death_hiv_m n_death_hiv_w n_death_2059_w n_death_2059_m n_tested_m n_tested_w
test_prop_positive

%var(v=prevalence_hiv_preg); %var(v=p_onart_w); %var(v=p_onart_m); %var(v=n_onart_w); %var(v=n_onart_m);  %var(v=p_diag_w); %var(v=p_diag_m); 
%var(v=p_onart_vl1000);  %var(v=n_new_inf1549m); %var(v=n_new_inf1549w); %var(v=n_death_hiv_m); %var(v=n_death_hiv_w); %var(v=n_tested_m); 
%var(v=n_tested_w); %var(v=test_prop_positive);


data   wide_outputs; merge 
prevalence1549m prevalence1549w prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m p_mcirc_1549m p_diag_w p_diag_m p_onart_vl1000_
incidence1549w incidence1549m n_new_inf1549m n_new_inf1549w n_death_hiv_m n_death_hiv_w n_death_2059_w n_death_2059_m n_tested_m n_tested_w
test_prop_positive
;


/*



proc export 
data=a.wide_misc_ex dbms=xlsx outfile="C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\unaids\unaids_synthesis_misc_all_ex_3" replace; run;



*/



/*


data b;
  set a.l_base;
* set a.l_base_keep;


p_onart_vl1000_ = p_onart_vl1000;


proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 100   ;
%let year_end = 2021.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;

*

Proportion of adult HIV tests with positive results (ages 15+)  m+f together ---- not yet in create wide file
;

%let var =  

prevalence1549m prevalence1549w prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m p_mcirc_1549m p_diag_w p_diag_m p_onart_vl1000_
incidence1549w incidence1549m n_new_inf1549m n_new_inf1549w n_death_hiv_m n_death_hiv_w n_death_2059_w n_death_2059_m n_tested_m n_tested_w
test_prop_positive

;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p2p5_var = p2p5_&var_0;
%let p97p5_var = p97p5_&var_0;
%let p50_var = median_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p2p5_&varb._0  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._0 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option_  p50_&varb._0  p2p5_&varb._0 p97p5_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;




data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14 g15 g16 g17 g18 g19 g20 g21 g22 

;
by cald;


proc print; run;

*/




