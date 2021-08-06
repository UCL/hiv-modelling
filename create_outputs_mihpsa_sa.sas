

libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\c2021ds_sa\";


data b;
  set a.l_base;
* set a.l_base_keep;


p_onart_vl1000_all = .;



* NB: note lines below, because variable names cannot end with a number;
log_gender_r_newp  = log(gender_r_newp);
prevalence1549_ = prevalence1549;
incidence1549_ = incidence1549;
incidence1564_ = incidence1564;

incidence1524w_ = incidence1524w; incidence1524m_ = incidence1524m;
incidence2534w_ = incidence2534w; incidence2534m_ = incidence2534m;
incidence3544w_ = incidence3544w; incidence3544m_ = incidence3544m;
incidence4554w_ = incidence4554w; incidence4554m_ = incidence4554m;
incidence5564w_ = incidence5564w; incidence5564m_ = incidence5564m;

p_onart_vl1000_ = p_onart_vl1000;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
p_newp_ge1_ = p_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;  

loggender_r_newp = log(gender_r_newp+0.0001);

logw15r = log(w15r+0.0001);
logw25r = log(w25r+0.0001);
logw35r = log(w35r+0.0001);
logw45r = log(w45r+0.0001);
logw55r = log(w55r+0.0001);
logm15r = log(m15r+0.0001);
logm25r = log(m25r+0.0001);
logm35r = log(m35r+0.0001);
logm45r = log(m45r+0.0001);
logm55r = log(m55r+0.0001);

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
HIV prevalence in age group 15-49  m  f   ---- prevalence1549m prevalence1549w
HIV prevalence in pregnant women  ---- not to be reported
ART coverage m f 15+  ----  not yet in create wide file
Total number on ART  m f 15+  ---- not yet in create wide file
% of men age 15-49 who have been circumcised (medically or traditionally)  15 - 49 ----  p_mcirc_1549m
% of HIV-positive individuals who have been diagnosed  m f 15+ ---- not yet in create wide file
% of adult ART patients (ages 15+) who are virally suppressed (if possible, at a threshold of <1000) m+f together - not yet in create wide file
HIV incidence in 15-49 year olds  m f ----- incidence1549w incidence1549m 
New HIV infections in 15-49 year olds  m f ---- not yet in create wide file
AIDS deaths m f 15+ ---- n_death_hivrel
Total deaths (all causes) over ages 20-59 - n_death_2059_m
Total HIV tests performed in adults (15+)  m  f  -  n_tested_m n_tested_w
Proportion of adult HIV tests with positive results (ages 15+)  m+f together ---- not yet in create wide file
;

%let var =  

prevalence1549m prevalence1549w


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
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  ;

;
by cald;


proc print; run;


/*



proc export 
data=a.wide_misc_ex dbms=xlsx outfile="C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\unaids\unaids_synthesis_misc_all_ex_3" replace; run;



*/

