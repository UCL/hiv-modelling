
***Program to produce graphs using averages across runs
***Use include statement in analysis program to read the code below in;

*** 20260929 version has options 0, 8 and 99 only;

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20250929_out\";
/*libname a "C:\Users\rmjlja9\Dropbox (UCL)\hiv synthesis ssa unified program\output files\zimbabwe";*/

proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";
proc freq data=a.long_zim_all;table option;run;

%let pth_export_hiv_control= C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe;run;

%let year_start = 1990;
%let year_end = 2050;


data b;
set a.long_zim_all;

* Define new variables;
n_alive_m = n_alive_1524m + n_alive_2549m + n_alive_50plm;
n_alive_w = n_alive_1524w + n_alive_2549w + n_alive_50plw;
n_alive = n_alive_m + n_alive_w;

n_new_inf1549m = n_new_inf1524m + n_new_inf2549m;
n_new_inf1549w = n_new_inf1524w + n_new_inf2549w;
n_new_inf1549_ = n_new_inf1549m + n_new_inf1549w;
n_new_inf1564_ = n_new_inf1549_	+ n_new_inf50plm + n_new_inf50plw;


* Rename variables ending in a number;
n_sw_1564_ = n_sw_1564;
n_diag_m_1524_ = n_diag_m_1524;
n_diag_m_2549_ = n_diag_m_2549;
n_diag_w_1524_ = n_diag_w_1524;
n_diag_w_2549_ = n_diag_w_2549;

incidence1549_ = incidence1549;
incidence1564_ = incidence1564;

p_newp_ge1_ = p_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;
av_newp_ge1_ = av_newp_ge1;

run;




proc sort data=b; by option cald run ;run;
proc freq data=b; table cald option;run;

proc print data=b; var option cald count_csim;run;
*At the moment is the median across all runs by option;
*Note that we need the same number of simulations/runs from each dataset;
data b;set b;count_csim+1;by option cald ;if first.cald then count_csim=1;run;***counts the number of runs;
 ***number of runs - this is manually inputted in nfit in the macros below;

proc means max data=b;var count_csim cald;run;*190;

/*proc freq data=b;table cald;run;*/

proc sort;by cald option ;run;

*INCLUDE ONLY STOCK VARIABLE AND VARIABLES THAT WE WANT TO GRAPH;
%let var =  
/*HIV Control variables*/
n_alive_1524m	n_alive_2549m	n_alive_50plm	n_alive_1524w	n_alive_2549w	n_alive_50plw	n_sw_1564_	n_alive_msm
n_hiv1524m		n_hiv2549m		n_hiv50plm		n_hiv1524w		n_hiv2549w		n_hiv50plw		n_hiv_sw	n_hiv_msm
n_diag_m_1524_	n_diag_m_2549_	n_diag_m_50pl	n_diag_w_1524_	n_diag_w_2549_	n_diag_w_50pl	n_diag_sw	n_diag_msm
n_onart1524_m	n_onart2549_m	n_onart50pl_m	n_onart1524_w	n_onart2549_w	n_onart50pl_w	n_onart_sw	n_onart_msm
n_vl1000_art_1524_m		n_vl1000_art_2549_m		n_vl1000_art_50pl_m		n_vl1000_art_1524_w		n_vl1000_art_2549_w		n_vl1000_art_50pl_w
n_vl1000_art_sw			n_vl1000_art_msm		n_birth					n_give_birth_w_hiv		n_hiv_child
n_dead1524m_all	n_dead2549m_all	n_dead50plm_all	n_dead1524w_all	n_dead2549w_all	n_dead50plw_all
n_new_inf1524m	n_new_inf2549m	n_new_inf50plm	n_new_inf1524w	n_new_inf2549w	n_new_inf50plw	n_new_inf_sw n_new_inf_msm
n_death_hiv_age_1524_m	n_death_hiv_age_2549_m	n_death_hiv_age_50pl_m	n_death_hiv_age_1524_w	n_death_hiv_age_2549_w	n_death_hiv_age_50pl_w
n_onprep_sw		n_onprep_msm	n_onprep_m		n_onprep_w		n_elig_prep		n_new_inf_prep_elig
n_daly			cost			p_mcirc			n_sw_program_visit
n_circumcised_15_24_m			n_onprep_agyw_pg		n_agyw_pg	/* added Sept 2025 */

/*Extra outputs for calibration*/	/* added Sept 2025 */
incidence1549_					incidence1549w					incidence1549m						incidence1564_
p_newp_ge1_						p_newp_ge5_						av_newp_ge1_						p_ep
p_m_npge1_						p_w_npge1_
p_mcirc_1524m
n_onprep_agyw_plw				n_agyw_plw
n_onprep_oral_agyw_pg			n_onprep_len_agyw_pg			n_onprep_oral_agyw_plw				n_onprep_inj_agyw_plw
n_onprep_oral_m					n_onprep_len_m					n_onprep_oral_w						n_onprep_len_w
n_onprep_oral_sw				n_onprep_len_sw					n_onprep_oral_msm					n_onprep_len_msm

n_alive				n_alive_m			n_alive_w
n_new_inf1549m 		n_new_inf1549w 		n_new_inf1549_ 		n_new_inf1564_ 
;
run;

/** Single var;*/
/*%let var =  prevalence_msm;*/


*I created one single macro;
***transpose given name; *starts with %macro and ends with %mend;
%macro option_(s);
data option_&s;set b;
if option=&s;
%let p5_var = p5_&var._&s;
%let p95_var = p95_&var._&s;
%let p50_var = median_&var._&s;
%let mean_var = mean_&var._&s;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_&s out=g&s._&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&s._&count;set g&s._&count;***creates one dataset per variable;
p5_&varb._&s  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._&s = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._&s = median(of &varb.1-&varb.&nfit);
mean_&varb._&s = mean(of &varb.1-&varb.&nfit);

keep cald p5_&varb._&s p95_&varb._&s p50_&varb._&s mean_&varb._&s ;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


*We need the same number of simulations for each option;
%let nfit=74;
%option_(0);
/*%option_(1);*/
/*%option_(2);*/
/*%option_(3);*/
/*%option_(4);*/
/*%option_(5);*/
/*%option_(6);*/
/*%option_(7);*/
%option_(8);
/*%option_(9);*/
/*%option_(10);*/
/*%option_(11);*/
/*%option_(12);*/
/*%option_(13);*/
/*%option_(14);*/
%option_(99);
run;



data d; * this is number of variables in %let var = above ;
merge 
g0_1   g0_2   g0_3   g0_4   g0_5   g0_6   g0_7   g0_8   g0_9   g0_10  g0_11  g0_12  g0_13  g0_14  g0_15  g0_16  g0_17  g0_18  g0_19  g0_20  g0_21  g0_22  g0_23  g0_24  g0_25  
g0_26  g0_27  g0_28  g0_29  g0_30  g0_31  g0_32  g0_33  g0_34  g0_35  g0_36  g0_37  g0_38  g0_39  g0_40  g0_41  g0_42  g0_43  g0_44  g0_45  g0_46  g0_47  g0_48  g0_49  g0_50 
g0_51  g0_52  g0_53  g0_54  g0_55  g0_56  g0_57  g0_58  g0_59  g0_60  g0_61  g0_62  g0_63  g0_64  g0_65  g0_66  g0_67  g0_68  g0_69  g0_70  g0_71  g0_72  g0_73  g0_74  g0_75  
g0_76  g0_77  g0_78  g0_79  g0_80  g0_81  g0_82  g0_83  g0_84  g0_85  g0_86  g0_87  g0_88  g0_89  g0_90  g0_91  g0_92  g0_93  g0_94  g0_95  g0_96  g0_97  g0_98  g0_99  g0_100
g0_101 g0_102 g0_103 g0_104 g0_105 g0_106 g0_107 g0_108

g8_1   g8_2   g8_3   g8_4   g8_5   g8_6   g8_7   g8_8   g8_9   g8_10  g8_11  g8_12  g8_13  g8_14  g8_15  g8_16  g8_17  g8_18  g8_19  g8_20  g8_21  g8_22  g8_23  g8_24  g8_25  
g8_26  g8_27  g8_28  g8_29  g8_30  g8_31  g8_32  g8_33  g8_34  g8_35  g8_36  g8_37  g8_38  g8_39  g8_40  g8_41  g8_42  g8_43  g8_44  g8_45  g8_46  g8_47  g8_48  g8_49  g8_50 
g8_51  g8_52  g8_53  g8_54  g8_55  g8_56  g8_57  g8_58  g8_59  g8_60  g8_61  g8_62  g8_63  g8_64  g8_65  g8_66  g8_67  g8_68  g8_69  g8_70  g8_71  g8_72  g8_73  g8_74  g8_75  
g8_76  g8_77  g8_78  g8_79  g8_80  g8_81  g8_82  g8_83  g8_84  g8_85  g8_86  g8_87  g8_88  g8_89  g8_90  g8_91  g8_92  g8_93  g8_94  g8_95  g8_96  g8_97  g8_98  g8_99  g8_100
g8_101 g8_102 g8_103 g8_104 g8_105 g8_106 g8_107 g8_108

g99_1   g99_2   g99_3   g99_4   g99_5   g99_6   g99_7   g99_8   g99_9   g99_10  g99_11  g99_12  g99_13  g99_14  g99_15  g99_16  g99_17  g99_18  g99_19  g99_20  
g99_21  g99_22  g99_23  g99_24  g99_25  g99_26  g99_27  g99_28  g99_29  g99_30  g99_31  g99_32  g99_33  g99_34  g99_35  g99_36  g99_37  g99_38  g99_39  g99_40  
g99_41  g99_42  g99_43  g99_44  g99_45  g99_46  g99_47  g99_48  g99_49  g99_50  g99_51  g99_52  g99_53  g99_54  g99_55  g99_56  g99_57  g99_58  g99_59  g99_60  
g99_61  g99_62  g99_63  g99_64  g99_65  g99_66  g99_67  g99_68  g99_69  g99_70  g99_71  g99_72  g99_73  g99_74  g99_75  g99_76  g99_77  g99_78  g99_79  g99_80  
g99_81  g99_82  g99_83  g99_84  g99_85  g99_86  g99_87  g99_88  g99_89  g99_90  g99_91  g99_92  g99_93  g99_94  g99_95  g99_96  g99_97  g99_98  g99_99  g99_100
g99_101 g99_102 g99_103 g99_104 g99_105 g99_106 g99_107 g99_108

;
by cald;
%include "C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_Zimbabwe.sas";
run;


/*data a.d;set d;run;*/
/*data d;set a.d;run;*/
ods html close;
ods listing;




***Graphs comparing observed data to outputs for Status quo 1 and 15;
*Taken from Zim graphs in branch Death cascade;
ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = 'C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe\graphs_20250929.doc' startpage=never;


***Options 0, 8 and 29 only;

* Population size;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 25000000 by  5000000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_alive_99 = "status quo";
label p50_n_alive_0 = "minimal (baseline)";
label p50_n_alive_8 = "minimal + condom";
label o_pop_all_Zi_cens = "Census - All ages";
label o_pop_1549_Zi_cens = "Census - 15-49";
label o_pop_all_Zi_CIA = "CIA - All ages";
label o_pop_1565_Zi_CIA = "CIA - All 15-64";
series  x=cald y=p50_n_alive_99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_99 	upper=p95_n_alive_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_alive_8 	upper=p95_n_alive_8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*scatter x=cald y=o_pop_all_Zi_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_pop_1549_Zi_cens / markerattrs = (symbol=square color=green size = 10);
*scatter x=cald y=o_pop_all_Zi_CIA / markerattrs = (symbol=triangle color=grey size = 10);
scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs = (symbol=triangle color=brown size = 10);
run;quit;



* Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);
label mean_incidence1549__99 = "status quo";
label mean_incidence1549__0 = "minimal (baseline)";
label mean_incidence1549__8 = "minimal + condoms";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=mean_incidence1549__99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__99 	upper=p95_incidence1549__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1549__8 	upper=p95_incidence1549__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;

* Number of new infections;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new HIV infections (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000 by  10000) valueattrs=(size=10);*20000000 is stoping in 2023;
label mean_n_new_inf1549__99 = "status quo";
label mean_n_new_inf1549__0 = "minimal (baseline)";
label mean_n_new_inf1549__8 = "minimal + condom";
series  x=cald y=mean_n_new_inf1549__99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_new_inf1549__99 	upper=p95_n_new_inf1549__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_new_inf1549__0 	upper=p95_n_new_inf1549__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_new_inf1549__8 	upper=p95_n_new_inf1549__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;



* p_newp;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.25 /*0.2*/ by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__99  = "status quo";
label p50_p_newp_ge1__0  = "minimal (baseline)";
label p50_p_newp_ge1__8  = "minimal + condom";
series  x=cald y=p50_p_newp_ge1__99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__99 	upper=p95_p_newp_ge1__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_newp_ge1__8 	upper=p95_p_newp_ge1__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__99  = "status quo";
label p50_p_newp_ge5__0  = "minimal (baseline)";
label p50_p_newp_ge5__8  = "minimal + condom";
series  x=cald y=p50_p_newp_ge5__99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__99 	upper=p95_p_newp_ge5__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge5__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_newp_ge5__8 	upper=p95_p_newp_ge5__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;

  
* av_newp_ge1;
proc sgplot data=d; 
Title    height=1.5 justify=center "av_newp_ge1";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_av_newp_ge1__99  = "status quo";
label p50_av_newp_ge1__0  = "minimal (baseline)";
label p50_av_newp_ge1__8  = "minimal + condom";

series  x=cald y=p50_av_newp_ge1__99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_av_newp_ge1__99 	upper=p95_av_newp_ge1__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_av_newp_ge1__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_av_newp_ge1__0 	upper=p95_av_newp_ge1__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_av_newp_ge1__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_av_newp_ge1__8 	upper=p95_av_newp_ge1__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;


* p_ep;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_ep_99  = "status quo";
label p50_p_ep_0  = "minimal (baseline)";
label p50_p_ep_8  = "minimal + condom";
series  x=cald y=p50_p_ep_99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_99 	upper=p95_p_ep_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ep_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ep_8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_ep_8 	upper=p95_p_ep_8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;


* Proportion with condomless sex in past 3 months;
* (can compare this outcome with Goals);
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men with condomless sex in past 3 months - p_m_npge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_m_npge1__99  = "status quo";
label p50_p_m_npge1__0  = "minimal (baseline)";
label p50_p_m_npge1__1  = "minimal + condom";
series  x=cald y=p50_p_m_npge1__99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_m_npge1__99 	upper=p95_p_m_npge1__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_m_npge1__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_m_npge1__0 	upper=p95_p_m_npge1__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_m_npge1__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_m_npge1__8 	upper=p95_p_m_npge1__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women with condomless sex in past 3 months - p_w_npge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_w_npge1__99  = "status quo";
label p50_p_w_npge1__0  = "minimal (baseline)";
label p50_p_w_npge1__1  = "minimal + condom";
series  x=cald y=p50_p_w_npge1__99/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_npge1__99 	upper=p95_p_w_npge1__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_w_npge1__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w_npge1__0 	upper=p95_p_w_npge1__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_w_npge1__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_w_npge1__8 	upper=p95_p_w_npge1__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;




ods html close;

ods rtf close;run;







