
ods html close;

* options user="/folders/myfolders/";

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\cioa\cioa_y_out\";

footnote;

proc printto ;

* ods html close;

data b;
set a.l_cioa_y ;


* for this program, variable names cannot end on a number;
n_k65m = p_k65m * n_hiv;
p_vl1000_ = p_vl1000;
incidence1549_ = incidence1549;
prevalence1549_ = prevalence1549 ;
p_onart_vl1000_ = p_onart_vl1000;
prevalence_vg1000_ = prevalence_vg1000;
p_vl1000_ = p_vl1000;
n_vg1000_ = n_vg1000;
p_newp_ge1_age1549_=p_newp_ge1_age1549;
prop_prep_any = (n_prep_any / n_alive) * 100;
p_len_1524_ = p_len_1524;
p_onart_vl1000_m_1524_ = p_onart_vl1000_m_1524;
p_diag_vl1000_ = p_diag_vl1000 ;
p_diag_vlg1000_ = (1 - p_diag_vl1000) * 100;
p_diag_vl1000_  = p_diag_vl1000;
n_cd4_lt200_ = n_cd4_lt200 ;
p_onartvisit0_ = p_onartvisit0;
p_onartvisit0_vl1000_ = p_onartvisit0_vl1000; 
hiv_death_rate = rate_dead_hivpos_cause1;
cost_per_adult = (cost / n_alive) * 1000000; 
p_newp_ge1_ = p_newp_ge1;

n_tested_incl_self = n_self_tested + n_tested; 


%let single_var =   n_mtct                                                  ;



if run in (

4665414 
6150187 
10463489 
10927095 
12607656 
12799146 
15194652 
19210667 
21261654 
22615920 
29533612 
32149852 
35110756 
35395882 
39497768 
42081021 
43040972 
43309068 
44114091 
47212530 
48896807 
52260136 
52476964 
54300532 
54894038 
55103738 
55637983 
55780958 
56810764 
57445980 
58140555 
60538533 
60562069 
61665094 
61905834 
69076567 
70140976 
70467225 
75668640 
79051952 
79988323 
80417424 
82740578 
83584724 
86434542 
89654760 
89845070 
95048736 
96259159 
98033441 
105466403 
105775316 
105867411 
112091247 
117114279 
119713678 
121613892 
122312898 
125450033 
125786708 
126264092 
127174211 
129228586 
131583226 
133955597 
134379436 
137077785 
140048419 
143096050 
146788676 
148313391 
149412641 
150906960 
151061750 
151635359 
152576187 
156412511 
156915815 
157149213 
157413280 
158641051 
159581583 
163009097 
168349527 
168509838 
175421704 
180493900 
182267767 
182521930 
182643365 
184004165 
186916556 
189369590 
196916477 
197357563 
202768259 
203244247 
203411885 
203646452 
204613224 
206521605 
208633326 
208677892 
209100896 
210471753 
211050821 
211729645 
213197894 
214864408 
217417710 
223035034 
224547507 
227078049 
227343352 
229395604 
230971994 
231876469 
232889210 
236803201 
237907474 
240571402 
243837387 
244307795 
246022019 
247610070 
248269254 
248826283 
249052685 
249506076 
249561777 
251995974 
252918398 
254254709 
255711475 
256260582 
256287036 
259800695 
260604443 
260941915 
261053466 
264225135 
266426535 
267378451 
267781471 
269350800 
273951802 
275256867 
276521607 
277117219 
278023467 
278261435 
285843559 
286745034 
288317503 
289234656 
289265110 
290256947 
290546755 
291360260 
296499909 
300950073 
302411046 
303541096 
307863207 
309290115 
310986872 
312807444 
314551430 
317214297 
324748777 
324926006 
328048579 
328473037 
328523421 
329077959 
332358095 
335563347 
340202801 
341189845 
341376503 
342679844 
344373716 
345668901 
346113507 
350255303 
351641155 
352137661 
355675609 
356790023 
358601489 
360006504 
360104929 
360258969 
360535961 
363544069 
364719140 
368791865 
369068024 
370937441 
371769885 
374143448 
375459495 
375622699 
379345641 
381373192 
383290468 
384027785 
384474800 
385415450 
386336873 
390524628 
391291121 
393249159 
395323577 
399232459 
400509800 
401289151 
405438789 
408325498 
408869556 
414740990 
417376883 
417962532 
418930765 
419545762 
419819223 
419998749 
422232364 
423122998 
424849198 
426120181 
431429595 
432105217 
434397126 
436096312 
438093433 
438604889 
438885878 
439776231 
439849756 
443502111 
443755216 
448143585 
448652753 
449158835 
450792441 
455461572 
458873204 
459672666 
463878148 
464458653 
464483846 
465961545 
466141732 
468833165 
472684664 
477510102 
478072133 
479192676 
485162905 
487918907 
492018761 
492613672 
493112171 
495711320 
496011558 
496422419 
498211237 
498505406 
504209554 
505763787 
511656152 
513016554 
515601573 
516754097 
518986877 
523151477 
524622781 
532537555 
532603273 
534779135 
536456881 
538400245 
540548636 
540777151 
546427557 
546951085 
548605158 
551645601 
553480940 
553755234 
557706964 
558886620 
563282158 
564972655 
565995702 
566720867 
567052840 
568057508 
569036864 
569374441 
576492847 
578281855 
578335634 
580854237 
581669712 
581870587 
582513388 
583165110 
587714912 
589396479 
591445406 
592671004 
593131882 
594182570 
609151139 
610109798 
612948677 
614007110 
615437302 
625453008 
625505889 
626437660 
630753082 
632340786 
632390976 
633935253 
636538283 
637068116 
637952457 
637969626 
638696108 
644229764 
644654448 
645665980 
646560797 
647268096 
648888390 
653942799 
654807674 
664554039 
665548269 
665868129 
666185791 
667869161 
668122687 
668316549 
669985317 
676523794 
678417556 
683958191 
685277815 
686844867 
686896911 
689477387 
690451162 
691053989 
691115362 
691813230 
691873676 
693510548 
694300520 
695365825 
696975907 
697480352 
698639752 
700742990 
706396986 
708522341 
708811141 
711432392 
712321234 
714440046 
714801026 
715059914 
715335769 
717754907 
717938428 
721267046 
722833707 
723600627 
725847330 
725923806 
727686953 
734692193 
741530031 
744294374 
747720775 
749268461 
751546124 
756765415 
764642023 
764749242 
766921572 
769434466 
770012537 
771838262 
777414843 
780155503 
782398126 
784054032 
784170222 
784755634 
785091223 
789679817 
791314022 
793546941 
793714004 
797411021 
808172529 
808698393 
810150174 
811944891 
814331224 
814898431 
815833241 
816826605 
818609292 
818678007 
819154687 
821651159 
823895561 
824516410 
830601597 
833537998 
839459040 
839498348 
839866598 
840595777 
842183977 
842446272 
844324342 
847696050 
851547891 
863590950 
865961472 
869695916 
870985791 
873430003 
875049119 
880716901 
880873124 
881485678 
881542962 
881978078 
885942756 
888570450 
889857322 
890353975 
890867178 
891398192 
894034717 
896590406 
899836705 
900350298 
903282496 
903439113 
905300093 
907666825 
908722402 
912270257 
914578250 
916884776 
920109009 
924069039 
924345748 
926074057 
928225435 
935150232 
937855420 
938999094 
940958739 
942767868 
945678428 
946807703 
948512146 
950096746 
957955592 
961245052 
961345050 
963943992 
964728751 
965317779 
966648654 
966886056 
969336929 
971299008 
971787569 
974055127 
978684685 
981054920 
981785629 
988265099 
992745730 

);


* p_agege15_ever_vaccinated n_death_hiv  ddaly  p_cur_any_vac_e_1564_  deathr_dol_r_first_uvl2 p_first_uvl2_dol_r
p_cur_full_vac_e_1564_ prop_elig_on_prep  prop_1564_hivneg_onprep  n_tested  p_diag  p_onart_diag  p_onart_vl1000_  incidence1549_;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;

%let nfit = 1482 ;

%let year_end = 2076.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =  0 ;

%let var = &single_var   ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;
%let mean_var = mean_&var_0;

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
p50_&varb._0 = median(of &varb.1-&varb.&nfit);
mean_&varb._0 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 mean_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;

%option_0;
run;



data option_1;
set b;
if option =  1 ;

%let var = &single_var    ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p50_var = median_&var_1;
%let mean_var = mean_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));


proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p25_&varb._1  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._1 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);
mean_&varb._1 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1 mean_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;




data option_2;
set b;
if option =  2 ;

%let var = &single_var    ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_2;
%let p25_var = p25_&var_2;
%let p75_var = p75_&var_2;
%let p5_var = p5_&var_2;
%let p95_var = p95_&var_2;
%let p50_var = median_&var_2;
%let mean_var = mean_&var_2;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));


proc transpose data=option_2 out=i&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data i&count;set i&count;***creates one dataset per variable;
p25_&varb._2  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._2 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._2  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._2 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._2 = median(of &varb.1-&varb.&nfit);
mean_&varb._2 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._2 p95_&varb._2 p50_&varb._2 p25_&varb._2 p75_&varb._2 mean_&varb._2;
run;

      proc datasets nodetails nowarn nolist; 
      delete  ii&count;quit;run;
%end;
%mend;


%option_2;
run;




data d; * this is number of variables in %let var = above ;
merge g1 h1 i1     ;
by cald;


* proc print; 
* run;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods html ;



/*

ods html;
proc sgplot data=d nolegend; 
* Title '';    Title    height=1.5 justify=center "undiscounted cost (p50 90% range)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'cost'		labelattrs=(size=12)  values = (0 to  300         by 50    ) valueattrs=(size=10);

series  x=cald y=p50_cost_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_cost_0 upper=p95_cost_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_cost_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_cost_1 upper=p95_cost_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_cost_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_cost_2 upper=p95_cost_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/ 

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n_infection_incl_mtct (p50 90% range)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000        by 10000 ) valueattrs=(size=10);

series  x=cald y=p50_n_infection_incl_mtct_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_infection_incl_mtct_0 upper=p95_n_infection_incl_mtct_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_infection_incl_mtct_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_infection_incl_mtct_1 upper=p95_n_infection_incl_mtct_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_infection_incl_mtct_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_infection_incl_mtct_2 upper=p95_n_infection_incl_mtct_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  *  Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  0.5       by 0.1     ) valueattrs=(size=10);

series  x=cald y=p50_incidence1549__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_incidence1549__0 upper=p95_incidence1549__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_incidence1549__1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_incidence1549__1 upper=p95_incidence1549__1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_incidence1549__2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_incidence1549__2 upper=p95_incidence1549__2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

* ods html close;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title ''; * * Title    height=1.5 justify=center "prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'prevalence'		labelattrs=(size=12)  values = (0 to  0.16      by 0.02    ) valueattrs=(size=10);

series  x=cald y=p50_prevalence1549__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prevalence1549__0 upper=p95_prevalence1549__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prevalence1549__1 / lineattrs = (color=darkblue      thickness = 4);
band    x=cald lower=p5_prevalence1549__1 upper=p95_prevalence1549__1 / transparency=0.9 fillattrs = (color=darkblue     ) legendlabel= "90% range";

series  x=cald y=p50_prevalence1549__2 / lineattrs = (color=darkred     thickness = 4);
band    x=cald lower=p5_prevalence1549__2 upper=p95_prevalence1549__2 / transparency=0.9 fillattrs = (color=darkred    ) legendlabel= "90% range";

run;quit;

* ods html close;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  2000000     by 200000 ) valueattrs=(size=10);

series  x=cald y=mean_n_hiv_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_hiv_0 upper=p95_n_hiv_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=mean_n_hiv_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_hiv_1 upper=p95_n_hiv_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=mean_n_hiv_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_hiv_2 upper=p95_n_hiv_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/


/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n prep_any";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1000000     by 100000 ) valueattrs=(size=10);

series  x=cald y=p50_n_prep_any_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_prep_any_0 upper=p95_n_prep_any_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_prep_any_1 / lineattrs = (color=darkblue      thickness = 4);
band    x=cald lower=p5_n_prep_any_1 upper=p95_n_prep_any_1 / transparency=0.9 fillattrs = (color=darkblue     ) legendlabel= "90% range";

series  x=cald y=p50_n_prep_any_2 / lineattrs = (color=darkred     thickness = 4);
band    x=cald lower=p5_n_prep_any_2 upper=p95_n_prep_any_2 / transparency=0.9 fillattrs = (color=darkred    ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';    Title    height=1.5 justify=center "n onart";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_onart'		labelattrs=(size=12)  values = (0 to  2000000     by 200000 ) valueattrs=(size=10);

series  x=cald y=mean_n_onart_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_onart_0 upper=p95_n_onart_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=mean_n_onart_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_onart_1 upper=p95_n_onart_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=mean_n_onart_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_onart_2 upper=p95_n_onart_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "p_vl1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'p_vl1000_'		labelattrs=(size=12)  values = (0.5 to  1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_vl1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_vl1000__0 upper=p95_p_vl1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_vl1000__1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_p_vl1000__1 upper=p95_p_vl1000__1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_p_vl1000__2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_p_vl1000__2 upper=p95_p_vl1000__2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_p_vl1000__3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_vl1000__3 upper=p95_p_vl1000__3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_vl1000__4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_vl1000__4 upper=p95_p_vl1000__4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0   to  0.04       by 0.01     ) valueattrs=(size=10);

series  x=cald y=p50_prevalence_vg1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prevalence_vg1000__0 upper=p95_prevalence_vg1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prevalence_vg1000__1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_prevalence_vg1000__1 upper=p95_prevalence_vg1000__1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_prevalence_vg1000__2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_prevalence_vg1000__2 upper=p95_prevalence_vg1000__2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "p_onart_vl1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.85 to  1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_onart_vl1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_vl1000__0 upper=p95_p_onart_vl1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000__1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_onart_vl1000__1 upper=p95_p_onart_vl1000__1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000__2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_onart_vl1000__2 upper=p95_p_onart_vl1000__2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/


/*

ods html;
proc sgplot data=d nolegend; 
* Title ''; *  Title    height=1.5 justify=center "p_onart_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.85 to  1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_onart_diag_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_diag_0 upper=p95_p_onart_diag_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_diag_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_onart_diag_1 upper=p95_p_onart_diag_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_onart_diag_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_onart_diag_2 upper=p95_p_onart_diag_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;


*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'p_tested_past_year_1549w'		labelattrs=(size=12)  values = (0   to  0.5     by 0.1  ) valueattrs=(size=10);

series  x=cald y=p50_p_tested_past_year_1549w_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_tested_past_year_1549w_0 upper=p95_p_tested_past_year_1549w_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_tested_past_year_1549w_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_p_tested_past_year_1549w_1 upper=p95_p_tested_past_year_1549w_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_p_tested_past_year_1549w_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_p_tested_past_year_1549w_2 upper=p95_p_tested_past_year_1549w_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_p_tested_past_year_1549w_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_tested_past_year_1549w_3 upper=p95_p_tested_past_year_1549w_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_tested_past_year_1549w_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_tested_past_year_1549w_4 upper=p95_p_tested_past_year_1549w_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "p_mcirc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'percentage'		labelattrs=(size=12)  values = (0.3 to  1       by 0.1  ) valueattrs=(size=10);

series  x=cald y=p50_p_mcirc_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_mcirc_0 upper=p95_p_mcirc_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_mcirc_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_mcirc_3 upper=p95_p_mcirc_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_mcirc_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_mcirc_4 upper=p95_p_mcirc_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "p_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.70 to  1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_diag_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_diag_0 upper=p95_p_diag_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_diag_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_diag_1 upper=p95_p_diag_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_diag_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_diag_2 upper=p95_p_diag_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'p_newp_ge1_'		labelattrs=(size=12)  values = (0   to 0.2     by 0.05 ) valueattrs=(size=10);

series  x=cald y=p50_p_newp_ge1__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_newp_ge1__0 upper=p95_p_newp_ge1__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_newp_ge1__1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_p_newp_ge1__1 upper=p95_p_newp_ge1__1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_p_newp_ge1__2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_p_newp_ge1__2 upper=p95_p_newp_ge1__2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_p_newp_ge1__3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_newp_ge1__3 upper=p95_p_newp_ge1__3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_newp_ge1__4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_newp_ge1__4 upper=p95_p_newp_ge1__4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n death";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_death'		labelattrs=(size=12)  values = (100000 to   330000     by 10000 ) valueattrs=(size=10);

series  x=cald y=mean_n_death_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_death_0 upper=p95_n_death_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=mean_n_death_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_n_death_1 upper=p95_n_death_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=mean_n_death_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_n_death_2 upper=p95_n_death_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=mean_n_death_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_death_3 upper=p95_n_death_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=mean_n_death_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_death_4 upper=p95_n_death_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "rate hiv death in people with hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'hiv_death_rate'		labelattrs=(size=12)  values = (0 to  2           by 0.5   ) valueattrs=(size=10);

series  x=cald y=p50_hiv_death_rate_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_hiv_death_rate_0 upper=p95_hiv_death_rate_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_hiv_death_rate_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_hiv_death_rate_1 upper=p95_hiv_death_rate_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_hiv_death_rate_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_hiv_death_rate_2 upper=p95_hiv_death_rate_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  *  Title    height=1.5 justify=center "n death hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  20000       by 5000  ) valueattrs=(size=10);

series  x=cald y=p50_n_death_hiv_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_death_hiv_0 upper=p95_n_death_hiv_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_death_hiv_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_death_hiv_1 upper=p95_n_death_hiv_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_death_hiv_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_death_hiv_2 upper=p95_n_death_hiv_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n adc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_adc'		labelattrs=(size=12)  values = (0 to  100000       by 10000  ) valueattrs=(size=10);

series  x=cald y=p50_n_adc_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_adc_0 upper=p95_n_adc_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_adc_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_n_adc_1 upper=p95_n_adc_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_n_adc_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_n_adc_2 upper=p95_n_adc_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_n_adc_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_adc_3 upper=p95_n_adc_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_adc_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_adc_4 upper=p95_n_adc_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n with cd4 < 200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_cd4_lt200'		labelattrs=(size=12)  values = (0 to  200000     by 20000 )  valueattrs=(size=10);

series  x=cald y=p50_n_cd4_lt200__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_cd4_lt200__0 upper=p95_n_cd4_lt200__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_cd4_lt200__1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_n_cd4_lt200__1 upper=p95_n_cd4_lt200__1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_n_cd4_lt200__2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_n_cd4_lt200__2 upper=p95_n_cd4_lt200__2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_n_cd4_lt200__3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_cd4_lt200__3 upper=p95_n_cd4_lt200__3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_cd4_lt200__4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_cd4_lt200__4 upper=p95_n_cd4_lt200__4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n pcp proph";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_cd4_lt200'		labelattrs=(size=12)  values = (0 to  1000000     by 200000 )  valueattrs=(size=10);

series  x=cald y=p50_n_pcp_p_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_pcp_p_0 upper=p95_n_pcp_p_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_pcp_p_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_n_pcp_p_1 upper=p95_n_pcp_p_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_n_pcp_p_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_n_pcp_p_2 upper=p95_n_pcp_p_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_n_pcp_p_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_pcp_p_3 upper=p95_n_pcp_p_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_pcp_p_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_pcp_p_4 upper=p95_n_pcp_p_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n tested per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_tested'		labelattrs=(size=12)  values = (0 to  1500000     by 500000 )  valueattrs=(size=10);

series  x=cald y=p50_n_tested_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_tested_0 upper=p95_n_tested_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_tested_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_n_tested_1 upper=p95_n_tested_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_n_tested_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_n_tested_2 upper=p95_n_tested_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_n_tested_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_tested_3 upper=p95_n_tested_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_tested_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_tested_4 upper=p95_n_tested_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';   Title    height=1.5 justify=center "n self_tested per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000     by 1000000 )  valueattrs=(size=10);

series  x=cald y=p50_n_self_tested_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_self_tested_0 upper=p95_n_self_tested_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_self_tested_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_self_tested_1 upper=p95_n_self_tested_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_self_tested_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_self_tested_2 upper=p95_n_self_tested_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title ''; *  Title    height=1.5 justify=center "n tested_incl_self per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  7000000     by 1000000 )  valueattrs=(size=10);

series  x=cald y=p50_n_tested_incl_self_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_tested_incl_self_0 upper=p95_n_tested_incl_self_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_tested_incl_self_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_tested_incl_self_1 upper=p95_n_tested_incl_self_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_tested_incl_self_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_tested_incl_self_2 upper=p95_n_tested_incl_self_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/




ods html;
proc sgplot data=d nolegend; 
* Title ''; *   height=1.5 justify=center "Number of children newly infected with HIV per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to  8000   by 1000     ) valueattrs=(size=10);

series  x=cald y=p50_n_mtct_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_mtct_0 upper=p95_n_mtct_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_mtct_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_mtct_1 upper=p95_n_mtct_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_mtct_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_mtct_2 upper=p95_n_mtct_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;



/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "n alive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  25000000    by 5000000 )  valueattrs=(size=10);

series  x=cald y=p50_n_alive_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_alive_0 upper=p95_n_alive_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_alive_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_alive_1 upper=p95_n_alive_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_alive_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_alive_2 upper=p95_n_alive_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "Discounted cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'dcost'		labelattrs=(size=12)  values = (0 to  300         by 50    ) valueattrs=(size=10);

series  x=cald y=p50_dcost_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_dcost_0 upper=p95_dcost_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_dcost_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_dcost_1 upper=p95_dcost_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_dcost_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_dcost_2 upper=p95_dcost_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_dcost_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_dcost_3 upper=p95_dcost_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_dcost_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_dcost_4 upper=p95_dcost_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "Undiscounted cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'cost'		labelattrs=(size=12)  values = (0 to  300         by 50    ) valueattrs=(size=10);

series  x=cald y=p50_cost_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_cost_0 upper=p95_cost_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_cost_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_cost_1 upper=p95_cost_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_cost_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_cost_2 upper=p95_cost_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_cost_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_cost_3 upper=p95_cost_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_cost_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_cost_4 upper=p95_cost_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "Undiscounted cost_per_adult per year ($)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'cost_per_adult'		labelattrs=(size=12)  values = (0 to  50         by 10    ) valueattrs=(size=10);

series  x=cald y=p50_cost_per_adult_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_cost_per_adult_0 upper=p95_cost_per_adult_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_cost_per_adult_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_cost_per_adult_1 upper=p95_cost_per_adult_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_cost_per_adult_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_cost_per_adult_2 upper=p95_cost_per_adult_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_cost_per_adult_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_cost_per_adult_3 upper=p95_cost_per_adult_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_cost_per_adult_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_cost_per_adult_4 upper=p95_cost_per_adult_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "proportion of people with a prep/pep indication taking prep/pep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  0.7       by 0.1     ) valueattrs=(size=10);

series  x=cald y=p50_p_tested_incl_self_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_tested_incl_self_0 upper=p95_p_tested_incl_self_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_tested_incl_self_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_tested_incl_self_1 upper=p95_p_tested_incl_self_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_tested_incl_self_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_tested_incl_self_2 upper=p95_p_tested_incl_self_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "proportion of people with a prep/pep indication taking prep/pep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  1         by 0.1     ) valueattrs=(size=10);

series  x=cald y=p50_prop_elig_on_prep_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_0 upper=p95_prop_elig_on_prep_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prop_elig_on_prep_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_1 upper=p95_prop_elig_on_prep_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_prop_elig_on_prep_2 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_2 upper=p95_prop_elig_on_prep_2 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title ''; * * Title    height=1.5 justify=center "n_prep_oral";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_prep_oral'		labelattrs=(size=12)  values = (0 to  1000000    by 100000  ) valueattrs=(size=10);

series  x=cald y=p50_n_prep_oral_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_prep_oral_0 upper=p95_n_prep_oral_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_prep_oral_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_n_prep_oral_1 upper=p95_n_prep_oral_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_n_prep_oral_2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_n_prep_oral_2 upper=p95_n_prep_oral_2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_n_prep_oral_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_prep_oral_3 upper=p95_n_prep_oral_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_prep_oral_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_prep_oral_4 upper=p95_n_prep_oral_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "number taking prep or pep (p50 90% range)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_prep_any'		labelattrs=(size=12)  values = (0 to  500000    by 100000  ) valueattrs=(size=10);

series  x=cald y=p50_n_prep_any_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_prep_any_0 upper=p95_n_prep_any_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_prep_any_3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_prep_any_3 upper=p95_n_prep_any_3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_n_prep_any_4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_n_prep_any_4 upper=p95_n_prep_any_4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "p_onartvisit0_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'p_onartvisit0_'		labelattrs=(size=12)  values = (0 to 0.3       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_onartvisit0__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onartvisit0__0 upper=p95_p_onartvisit0__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onartvisit0__1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_p_onartvisit0__1 upper=p95_p_onartvisit0__1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_p_onartvisit0__2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_p_onartvisit0__2 upper=p95_p_onartvisit0__2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_p_onartvisit0__3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_onartvisit0__3 upper=p95_p_onartvisit0__3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_onartvisit0__4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_onartvisit0__4 upper=p95_p_onartvisit0__4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "p_onartvisit0_vl1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'p_onartvisit0_vl1000_'		labelattrs=(size=12)  values = (0.8 to 1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_onartvisit0_vl1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onartvisit0_vl1000__0 upper=p95_p_onartvisit0_vl1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onartvisit0_vl1000__1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_p_onartvisit0_vl1000__1 upper=p95_p_onartvisit0_vl1000__1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

series  x=cald y=p50_p_onartvisit0_vl1000__2 / lineattrs = (color=green     thickness = 4);
band    x=cald lower=p5_p_onartvisit0_vl1000__2 upper=p95_p_onartvisit0_vl1000__2 / transparency=0.9 fillattrs = (color=green    ) legendlabel= "90% range";

series  x=cald y=p50_p_onartvisit0_vl1000__3 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_onartvisit0_vl1000__3 upper=p95_p_onartvisit0_vl1000__3 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

series  x=cald y=p50_p_onartvisit0_vl1000__4 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_p_onartvisit0_vl1000__4 upper=p95_p_onartvisit0_vl1000__4 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/






/*

ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "n_prep_any";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  300000  by  50000  ) valueattrs=(size=10);

label p50_n_prep_any_0 = "status quo";
label p50_n_prep_any_1 = "len-cab";


series  x=cald y=p50_n_prep_any_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_prep_any_0 upper=p95_n_prep_any_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_prep_any_1 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_n_prep_any_1 upper=p95_n_prep_any_1 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d nolegend ; 
* * Title    height=1.5 justify=center "Number of HIV-related deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  20000   by 5000    ) valueattrs=(size=10);

* label p50_n_death_hiv_0 = "status quo";
* label p50_n_death_hiv_1 = "len-cab";

series  x=cald y=p50_n_death_hiv_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_death_hiv_0 upper=p95_n_death_hiv_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_death_hiv_1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_n_death_hiv_1 upper=p95_n_death_hiv_1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d nolegend ; 
* * Title    height=1.5 justify=center "Number of HIV-related deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  14000   by 2000    ) valueattrs=(size=10);

* label p50_n_death_hiv_0 = "status quo";
* label p50_n_death_hiv_1 = "len-cab";

series  x=cald y=p50_n_death_hiv_w_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_death_hiv_w_0 upper=p95_n_death_hiv_w_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_death_hiv_w_1 / lineattrs = (color=darkred thickness = 4);
band    x=cald lower=p5_n_death_hiv_w_1 upper=p95_n_death_hiv_w_1 / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d nolegend; 
* Title '';
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage'		labelattrs=(size=12)  values = (0  to 14       by  2    ) valueattrs=(size=10);

series  x=cald y=p50_p_diag_vlg1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_diag_vlg1000__0 upper=p95_p_diag_vlg1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_diag_vlg1000__1 / lineattrs = (color=darkred  thickness = 4);
band    x=cald lower=p5_p_diag_vlg1000__1 upper=p95_p_diag_vlg1000__1 / transparency=0.9 fillattrs = (color=darkred ) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d nolegend; 
* Title '';
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage'		labelattrs=(size=12)  values = (0.7  to 1       by  0.05    ) valueattrs=(size=10);

series  x=cald y=p50_p_diag_vl1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_diag_vl1000__0 upper=p95_p_diag_vl1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_diag_vl1000__1 / lineattrs = (color=darkred  thickness = 4);
band    x=cald lower=p5_p_diag_vl1000__1 upper=p95_p_diag_vl1000__1 / transparency=0.9 fillattrs = (color=darkred ) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Of all 15-24 year olds on ART, mean proportion on lenacapavir for aged 15-24";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.5 to  1     by 0.05    ) valueattrs=(size=10);

label p50_p_len_1524__0 = "no len/cab";
label p50_p_len_1524__1 = "len/cab for age 15_24";

series  x=cald y=p50_p_len_1524__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_len_1524__0 upper=p95_p_len_1524__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_len_1524__1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_len_1524__1 upper=p95_p_len_1524__1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "p_onart_vl1000_m_1524";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.5 to  1     by 0.05    ) valueattrs=(size=10);

label p50_p_onart_vl1000_m_1524__0 = "no len/cab";
label p50_p_onart_vl1000_m_1524__1 = "len/cab for age 15_24";

series  x=cald y=p50_p_onart_vl1000_m_1524__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_vl1000_m_1524__0 upper=p95_p_onart_vl1000_m_1524__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000_m_1524__1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_onart_vl1000_m_1524__1 upper=p95_p_onart_vl1000_m_1524__1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;







ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "p_dol";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0   to  1     by 0.05    ) valueattrs=(size=10);

label p50_p_dol_0 = "no len/cab";
label p50_p_dol_3 = "len/cab";

series  x=cald y=p50_p_dol_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_dol_0 upper=p95_p_dol_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_dol_3 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_dol_3 upper=p95_p_dol_3 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d nolegend ; 
* Title ''; 
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0   to  1     by 0.1    ) valueattrs=(size=10);

* label p50_p_len_0 = "No lenacapavir + cabotegravir";
* label p50_p_len_1 = "Lenacapavir + cabotegravir";

series  x=cald y=p50_p_len_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_len_0 upper=p95_p_len_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_len_1 / lineattrs = (color=darkred  thickness = 4);
band    x=cald lower=p5_p_len_1 upper=p95_p_len_1 / transparency=0.9 fillattrs = (color=darkred ) legendlabel= "90% range";

run; quit;




ods html;
proc sgplot data=d nolegend ; 
* Title ''; 
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.75 to  1     by 0.05   ) valueattrs=(size=10);

* label p50_p_onart_0 = "No lenacapavir + cabotegravir";
* label p50_p_onart_1 = "Lenacapavir + cabotegravir";

series  x=cald y=p50_p_onart_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_0 upper=p95_p_onart_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_1 / lineattrs = (color=darkred  thickness = 4);
band    x=cald lower=p5_p_onart_1 upper=p95_p_onart_1 / transparency=0.9 fillattrs = (color=darkred ) legendlabel= "90% range";

run; quit;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "p_dar";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2024 to 2027 by 0.25)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0   to  1     by 0.05    ) valueattrs=(size=10);

label p50_p_dar_0 = "no len/cab";
label p50_p_dar_0 = "len/cab";

series  x=cald y=p50_p_dar_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_dar_0 upper=p95_p_dar_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_dar_3 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_dar_3 upper=p95_p_dar_3 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;





ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "p_onart";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.5   to  1     by 0.05    ) valueattrs=(size=10);

label p50_p_onart_0 = "no len/cab";
label p50_p_onart_1 = "len/cab";

series  x=cald y=p50_p_onart_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_0 upper=p95_p_onart_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_onart_1 upper=p95_p_onart_1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "p_vl1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.5 to  1     by 0.05    ) valueattrs=(size=10);

label p50_p_vl1000__0 = "no len/cab";
label p50_p_vl1000__1 = "len/cab";

series  x=cald y=p50_p_vl1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_vl1000__0 upper=p95_p_vl1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_vl1000__1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_vl1000__1 upper=p95_p_vl1000__1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;





ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Of those on ART, proportion with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5   )	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  1       by 0.05     ) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "no len/cab";
label p50_p_onart_vl1000__1 = "len/cab";


series  x=cald y=p50_p_onart_vl1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_vl1000__0 upper=p95_p_onart_vl1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000__1 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_p_onart_vl1000__1 upper=p95_p_onart_vl1000__1 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;

* ods html close;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title ''; * * Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  0.5       by 0.1     ) valueattrs=(size=10);

series  x=cald y=p50_incidence1549w_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_incidence1549w_0 upper=p95_incidence1549w_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_incidence1549w_1 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_incidence1549w_1 upper=p95_incidence1549w_1 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title ''; * * Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  0.5       by 0.1     ) valueattrs=(size=10);

series  x=cald y=p50_incidence1549m_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_incidence1549m_0 upper=p95_incidence1549m_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_incidence1549m_1 / lineattrs = (color=darkred       thickness = 4);
band    x=cald lower=p5_incidence1549m_1 upper=p95_incidence1549m_1 / transparency=0.9 fillattrs = (color=darkred      ) legendlabel= "90% range";

run;quit;

* ods html close;

*/

/*

ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2070 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'prevalence'		labelattrs=(size=12)  values = (0 to 0.3        by 0.05    ) valueattrs=(size=10);

label p50_prevalence1549__0 = "option 0";
label p50_prevalence1549__3 = "option 3";

series  x=cald y=p50_prevalence1549__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prevalence1549__0 upper=p95_prevalence1549__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prevalence1549__3 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_prevalence1549__3 upper=p95_prevalence1549__3 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;

* ods html close;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "prevalence vlg1000)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2070 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'prevalence'		labelattrs=(size=12)  values = (0 to 0.05       by 0.01    ) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "option 0";
label p50_prevalence_vg1000__1 = "option 1";

series  x=cald y=p50_prevalence_vg1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prevalence_vg1000__0 upper=p95_prevalence_vg1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prevalence_vg1000__1 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_prevalence_vg1000__1 upper=p95_prevalence_vg1000__1 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;

* ods html close;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "p_adh_hi_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2018 by 0.5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'prevalence'		labelattrs=(size=12)  values = (0 to 1          by 0.1     ) valueattrs=(size=10);

label p50_p_adh_hi_0 = "option 0";
label p50_p_adh_hi_3 = "option 3";

series  x=cald y=p50_p_adh_hi_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_adh_hi_0 upper=p95_p_adh_hi_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_adh_hi_3 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_p_adh_hi_3 upper=p95_p_adh_hi_3 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;



















/*



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage'		labelattrs=(size=12)  values = (0 to 15        by    5    ) valueattrs=(size=10);

label p50_prevalence1549__0 = "no vaccine";
label p50_prevalence1549__1 = "vaccine 1";
label p50_prevalence1549__2 = "vaccine 2";
label p50_prevalence1549__3 = "vaccine 3";

series  x=cald y=p50_prevalence1549__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prevalence1549__0 upper=p95_prevalence1549__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prevalence1549__1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_prevalence1549__1 upper=p95_prevalence1549__1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

series  x=cald y=p50_prevalence1549__2 / lineattrs = (color=blue thickness = 4);
band    x=cald lower=p5_prevalence1549__2 upper=p95_prevalence1549__2 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

series  x=cald y=p50_prevalence1549__3 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_prevalence1549__3 upper=p95_prevalence1549__3 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;

* ods html close;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Proportion of adults age 15+ ever vaccinated";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  0.9       by 0.1     ) valueattrs=(size=10);

label p50_p_agege15_ever_vaccinated_0 = "no vaccine";
label p50_p_agege15_ever_vaccinated_1 = "vaccine 1";
label p50_p_agege15_ever_vaccinated_2 = "vaccine 2";
label p50_p_agege15_ever_vaccinated_3 = "vaccine 3";

series  x=cald y=p50_p_agege15_ever_vaccinated_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_agege15_ever_vaccinated_0 upper=p95_p_agege15_ever_vaccinated_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_agege15_ever_vaccinated_1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_agege15_ever_vaccinated_1 upper=p95_p_agege15_ever_vaccinated_1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

series  x=cald y=p50_p_agege15_ever_vaccinated_2 / lineattrs = (color=blue thickness = 4);
band    x=cald lower=p5_p_agege15_ever_vaccinated_2 upper=p95_p_agege15_ever_vaccinated_2 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

series  x=cald y=p50_p_agege15_ever_vaccinated_3 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_p_agege15_ever_vaccinated_3 upper=p95_p_agege15_ever_vaccinated_3 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;





ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Proportion of adults age 15-64 with any current vaccine efficacy";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  0.9       by 0.1     ) valueattrs=(size=10);

label p50_p_cur_any_vac_e_1564__0 = "no vaccine";
label p50_p_cur_any_vac_e_1564__1 = "vaccine 1";
label p50_p_cur_any_vac_e_1564__2 = "vaccine 2";
label p50_p_cur_any_vac_e_1564__3 = "vaccine 3";

series  x=cald y=p50_p_cur_any_vac_e_1564__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_cur_any_vac_e_1564__0 upper=p95_p_cur_any_vac_e_1564__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_cur_any_vac_e_1564__1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_cur_any_vac_e_1564__1 upper=p95_p_cur_any_vac_e_1564__1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

series  x=cald y=p50_p_cur_any_vac_e_1564__2 / lineattrs = (color=blue thickness = 4);
band    x=cald lower=p5_p_cur_any_vac_e_1564__2 upper=p95_p_cur_any_vac_e_1564__2 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

series  x=cald y=p50_p_cur_any_vac_e_1564__3 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_p_cur_any_vac_e_1564__3 upper=p95_p_cur_any_vac_e_1564__3 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;

*


ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Discounted DALYs";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  5000000   by 1000000    ) valueattrs=(size=10);

label p50_ddaly_0 = "no vaccine";
label p50_ddaly_1 = "vaccine 1";
label p50_ddaly_2 = "vaccine 2";
label p50_ddaly_3 = "vaccine 3";

series  x=cald y=p50_ddaly_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_ddaly_0 upper=p95_ddaly_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_ddaly_1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_ddaly_1 upper=p95_ddaly_1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

series  x=cald y=p50_ddaly_2 / lineattrs = (color=blue thickness = 4);
band    x=cald lower=p5_ddaly_2 upper=p95_ddaly_2 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

series  x=cald y=p50_ddaly_3 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_ddaly_3 upper=p95_ddaly_3 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Proportion of people with a PrEP indication taking PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  0.4       by 0.05    ) valueattrs=(size=10);

label p50_prop_elig_on_prep_0 = "no vaccine";
label p50_prop_elig_on_prep_1 = "vaccine 1";
label p50_prop_elig_on_prep_2 = "vaccine 2";
label p50_prop_elig_on_prep_3 = "vaccine 3";

series  x=cald y=p50_prop_elig_on_prep_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_0 upper=p95_prop_elig_on_prep_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prop_elig_on_prep_1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_1 upper=p95_prop_elig_on_prep_1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

series  x=cald y=p50_prop_elig_on_prep_2 / lineattrs = (color=blue thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_2 upper=p95_prop_elig_on_prep_2 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

series  x=cald y=p50_prop_elig_on_prep_3 / lineattrs = (color=lightblue thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_3 upper=p95_prop_elig_on_prep_3 / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Percent of all PLHIV diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.5 to  1       by 0.05    ) valueattrs=(size=10);

label p50_p_diag_0 = "status quo";
label p50_p_diag_1 = "len-cab";

series  x=cald y=p50_p_diag_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_diag_0 upper=p95_p_diag_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_diag_1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_diag_1 upper=p95_p_diag_1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Of those diagnosed, proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.5 to  1     by 0.05    ) valueattrs=(size=10);

label p50_p_onart_diag_0 = "no vaccine";
label p50_p_onart_diag_1 = "len-cab";

series  x=cald y=p50_p_onart_diag_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_diag_0 upper=p95_p_onart_diag_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_diag_1 / lineattrs = (color=stlg thickness = 4);
band    x=cald lower=p5_p_onart_diag_1 upper=p95_p_onart_diag_1 / transparency=0.9 fillattrs = (color=stlg) legendlabel= "90% range";

run;quit;


*/













/*



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Number of living adults age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  30000000   by 10000000 ) valueattrs=(size=10);

label p50_n_alive_0 = "no vaccine";
label p50_n_alive_1 = "vaccine";


 series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_1/	lineattrs = (color=violet thickness = 4);
  band    x=cald lower=p5_n_alive_1 	upper=p95_n_alive_1  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;





ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Proportion of adults age 15-64 taking PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1  by 0.01 ) valueattrs=(size=10);

label p50_prop_1564_hivneg_onprep_0 = "no vaccine";
label p50_prop_1564_hivneg_onprep_1 = "vaccine";

 series  x=cald y=p50_prop_1564_hivneg_onprep_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_1564_hivneg_onprep_0 	upper=p95_prop_1564_hivneg_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_1564_hivneg_onprep_1/	lineattrs = (color=violet thickness = 4);
  band    x=cald lower=p5_prop_1564_hivneg_onprep_1 	upper=p95_prop_1564_hivneg_onprep_1  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Number of HIV tests done per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000   by 100000 ) valueattrs=(size=10);

label p50_n_tested_0 = "status quo";
label p50_n_tested_1 = "len-cab";

 series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_1/	lineattrs = (color=violet thickness = 4);
  band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;





ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Proportion of all PLHIV (diagnosed or undiagnosed) with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.7 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_vl1000__0 = "no vaccine";
label p50_p_vl1000__1 = "vaccine";

 series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=violet thickness = 4);
  band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2070 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  1.0       by 0.1     ) valueattrs=(size=10);

label mean_incidence1549__0 = "no vaccine";
label mean_incidence1549__1 = "vaccine";

 series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=mean_incidence1549__1/	lineattrs = (color=violet thickness = 4);
  band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

* ods html close;



ods html;
proc sgplot data=d ; 
* Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percent'		labelattrs=(size=12)  values = (0 to  20       by 1     ) valueattrs=(size=10);

label p50_prevalence1549__0 = "no vaccine";
label p50_prevalence1549__1 = "vaccine";

 series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=violet thickness = 4);
  band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;





"n_prep_any";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000  by 100000 ) valueattrs=(size=10);
label p50_n_prep_any_0 = "status quo";


"Proportion on ART";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);
label p50_p_onart_0 = "option 0";

"Proportion with adhav >80%";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);
label p50_p_adhav_hi_onart_0 = "option 0";



"prop_inf_w_sw";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1     by 0.05 ) valueattrs=(size=10);
label mean_prop_inf_w_sw_0 = "option 0";


"prevalence (age 15-49)";
yaxis grid label	= 'proportion'		labelattrs=(size=12)  values = (0 to  0.2       by  0.01     ) valueattrs=(size=10);
label p50_prevalence1549__0 = "status quo";


"prevalence_vg1000";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.05  by 0.005 ) valueattrs=(size=10);
label p50_prevalence_vg1000__0 = "option 0";


"n_infected_primary";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000 by 100000 ) valueattrs=(size=10);
label p50_n_infected_primary_0 = "option 0";


"n_vg1000";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000 ) valueattrs=(size=10);
label p50_n_vg1000__0 = "option 0";


"prop_w_1549_sw";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.05 by 0.005 ) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "option 0";


"p_inf_diag";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1    by 0.1   ) valueattrs=(size=10);
label p50_p_inf_diag_0 = "option 0";


"p_newp_ge1_age1549";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.05 by 0.005 ) valueattrs=(size=10);
label p50_p_newp_ge1_age1549__0 = "option 0";


"Of sw on ART, proportion with vl < 1000";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.9 to 1   by 0.01 ) valueattrs=(size=10);
label p50_p_onart_vl1000_sw_0 = "option 0";
  
 
"test_prop_positive";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.025  by 0.005  ) valueattrs=(size=10);
label p50_test_prop_positive_0 = "option 0";


"n_undiag";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000  by  5000 ) valueattrs=(size=10);
label p50_n_undiag_0 = "option 0";


"n_vg1000_np";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 150000  by 10000 ) valueattrs=(size=10);
label p50_n_vg1000_np_0 = "option 0";

"p mcirc";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1   by 0.1  ) valueattrs=(size=10);
label p50_p_mcirc_0 = "option 0";





"n_hiv";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000  by  100000 ) valueattrs=(size=10);
label p50_n_hiv_0 = "option 0";


"n_onart";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000  by  100000 ) valueattrs=(size=10);
label p50_n_onart_0 = "option 0";


"cost";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 300   by  50    ) valueattrs=(size=10);
label p50_cost_0 = "option 0";


"prop_w_vlg1";
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1   by 0.1  ) valueattrs=(size=10);
label p50_prop_w_vlg1_0 = "option 0";

*/
