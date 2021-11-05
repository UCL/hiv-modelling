libname a "C:\Users\ValentinaCambiano\TLO_HMC Dropbox\Valentina Cambiano\hiv synthesis ssa unified program\output files\zimbabwe\mihpsa_zim_2_created20211103\";
data b;set a.l_base_zim;run;
data b;set b;
p_newp_ge1_ = p_newp_ge1 ;run;
proc contents data=a.l_base_zim;run;

proc sort data=b; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  498   ;
*%let year_end = 2022.00 ;
%let year_end = 2042.00 ;
run;

proc sort;by cald option ;run;

/*proc freq data=b;table option;run;*/
***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;

%let var =  p_newp_ge1_;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
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
p25_&varb._0  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._0 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p2p5_&varb._0  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._0 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 p2p5_&varb._0 p97p5_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;

ods html;
proc sgplot data=g1; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0 = "Option 0 (median) ";
label p50_p_newp_ge1__1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
