
ods html close;

* options user="/folders/myfolders/";

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\cioa\cioa_lgh_rev_out\";

footnote;

proc printto ;

* ods html close;

data b;
set a.l_cioa_lgh_rev ;


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


if option in (0 1);


%let single_var =  incidence1549_                              ;

if run in (
2289 
157680 
421413 
645463 
1468499 
1601730 
2172709 
2569457 
3547283 
4201274 
4793272 
9020600 
9889608 
10145770 
11991353 
13101435 
13529777 
14256157 
14316387 
16118356 
16240244 
17978272 
19114703 
20221195 
20236585 
21550889 
22441638 
23361200 
23711933 
25645503 
26595805 
27186231 
28068266 
28802016 
28895623 
29009011 
30016661 
32276239 
32588592 
33338758 
33676198 
34213088 
34421612 
34936762 
35853332 
36555063 
38709519 
38734249 
38887990 
39581025 
41065624 
42700862 
42705093 
43279246 
43810622 
46019454 
46559846 
46683707 
47250743 
49893049 
51904292 
52499281 
57452158 
58346855 
58968083 
59176657 
63213105 
64079959 
64776336 
64876768 
65484232 
66602748 
67039829 
67208758 
67560010 
67579583 
69960359 
70131483 
70834613 
72917055 
75944953 
78397119 
79816677 
80323319 
81461790 
81857471 
82081883 
83251400 
84020506 
84273376 
84402764 
84575214 
85206038 
85908157 
88559471 
93042558 
94206617 
94532587 
95905330 
96724755 
98664210 
98838341 
99328552 
100809282 
101484334 
101662286 
104474952 
104503014 
104532390 
106327469 
107631502 
108825551 
111064705 
111104596 
111347161 
113316962 
113500944 
114950918 
115018902 
116200925 
116702679 
117801004 
118713515 
119227523 
119344772 
120290719 
121534360 
123634238 
126440851 
127702213 
128963293 
130196238 
130228834 
131524609 
131744822 
133073714 
134589033 
134942921 
135191898 
138476286 
138495153 
138585876 
138602542 
138945393 
139332984 
139592301 
139775159 
139973905 
143135271 
144446301 
145394726 
148051952 
148165344 
148228189 
149089181 
150903710 
152092147 
158153947 
160782680 
161123182 
161789838 
162689316 
163716322 
164512296 
165709767 
168174349 
169072424 
169140456 
170390724 
170497012 
170982371 
171262742 
171318129 
172265335 
172409972 
173005136 
173962914 
174100881 
174532040 
175441201 
176208260 
177725734 
180066068 
181822422 
182124892 
183173152 
183858400 
184398825 
185502084 
186415395 
187866301 
191797702 
194781279 
195121856 
195166015 
195584486 
196977560 
196996191 
197788153 
198334932 
199552271 
199873109 
200050982 
200231856 
202254229 
202758194 
204797064 
204887141 
205275425 
205607139 
206008557 
207965001 
208507037 
209728557 
211036001 
211663581 
212449551 
215404029 
216504292 
216975756 
218121764 
220703291 
220715078 
222198974 
223760996 
225559313 
226520300 
226878031 
227324026 
229613144 
231834587 
232160150 
235987122 
235997326 
236297900 
236345142 
240814428 
246369349 
246812246 
250934271 
251222469 
252185533 
254009461 
258395269 
259363664 
259396122 
259493999 
260211072 
260999436 
261072085 
263879308 
264139792 
264590643 
266516119 
267088364 
268095514 
268748641 
269419512 
270625294 
270766442 
271270828 
271897849 
274717465 
275251741 
276169470 
277400474 
277457341 
278211657 
279159123 
279342937 
281439229 
284136791 
284942367 
285327037 
285742115 
286539505 
286648204 
289711283 
289951379 
290356082 
290732261 
291736725 
293595075 
293821802 
294399544 
294421286 
295069506 
295886717 
296197926 
298001889 
300280517 
301265154 
301919300 
302256110 
303098661 
304044993 
306090942 
307253764 
307306219 
308672805 
309036427 
309345664 
310400717 
310406695 
312727419 
314051966 
314968414 
315205104 
317009967 
317059937 
317279270 
318901170 
319029613 
319371947 
319452686 
322727949 
322833213 
324404036 
326040313 
326627216 
326826590 
326937531 
328983214 
329297178 
329856568 
330023865 
331079258 
332010911 
332928444 
333266007 
335331162 
337477446 
338114326 
338191813 
343626083 
343694179 
343877347 
345302011 
346763985 
347279614 
348672652 
349975970 
351337598 
351384853 
352080206 
352497449 
352661691 
352939200 
353633233 
353807500 
354138069 
354189271 
355145075 
355631583 
356929568 
357669445 
358169325 
358473283 
358693565 
358717068 
359894049 
360033433 
361335472 
362138331 
363180925 
363236211 
364285855 
365064453 
365567654 
366221234 
369759446 
369916386 
371478989 
373121530 
373799668 
374603291 
374952501 
375082397 
375279178 
376167051 
376601012 
378144946 
379680053 
380183466 
381022872 
381292901 
382343206 
382639056 
382807980 
382952529 
383504318 
387267954 
390328893 
392103685 
393047731 
393478115 
394776645 
401348442 
401548565 
402623327 
405210221 
406562036 
406871026 
406890914 
407039656 
408443357 
410475834 
412988819 
413576043 
414917820 
417099622 
417541483 
417678142 
418355238 
418434717 
419469891 
420038431 
421565934 
422193364 
422979896 
424562736 
426136488 
426153644 
426499572 
426525408 
428840212 
429341222 
430810937 
431540516 
432479289 
432490739 
432643416 
433418618 
433673936 
433936255 
435699991 
435734161 
436332620 
437614167 
438648983 
440114902 
440175514 
440663505 
442541492 
442671195 
443088518 
443170047 
443555423 
443888246 
444665073 
444740495 
448062735 
448190274 
449072256 
449796185 
452124699 
452150849 
452783186 
453542924 
454061255 
456205827 
458670386 
458688343 
459611217 
460650834 
462361965 
462480064 
463921373 
464055376 
464747644 
465531166 
465844758 
465844908 
465919948 
466916354 
470755595 
470880524 
473004674 
475668410 
475853245 
477503947 
478882518 
480866433 
482466543 
483345781 
483717310 
483969184 
484262608 
484614588 
485537996 
486963167 
487126393 
487781555 
488154405 
488588582 
489461047 
490874907 
495306466 
495363437 
496099678 
497541001 
498258080 
498780499 
500348106 
500596104 
500632036 
501777074 
502388436 
503003867 
503294236 
503416134 
504148251 
504620105 
505054396 
505317124 
505955331 
506314519 
507880757 
510595831 
510640204 
511503764 
511818514 
514301454 
516547955 
516914067 
519369377 
519842078 
520079823 
520247099 
520900576 
521788338 
522130515 
523751778 
525364639 
528040781 
528151003 
529388816 
530222982 
530338680 
533075027 
534320547 
536854214 
537326123 
538593605 
539489281 
539523317 
539793676 
540642405 
541059120 
541570188 
541653386 
542614172 
542637334 
547151608 
547639651 
547768381 
548985425 
549491057 
550237566 
551513449 
554031180 
554949007 
555094586 
560981547 
561066978 
561341837 
563631920 
564352255 
565607463 
567381463 
568210726 
568436864 
569432687 
569628467 
570989210 
571498313 
571618355 
572684256 
572952577 
573045781 
573733596 
574775406 
575258475 
577593521 
578030992 
578767766 
579325151 
579857904 
580099823 
581048723 
581500019 
581885656 
582791978 
582856334 
583606460 
584169816 
584461612 
585944407 
586312254 
586660149 
586767290 
589871501 
590413515 
591571270 
591618019 
591748343 
592417295 
594045834 
594370143 
597182969 
597545799 
598325200 
600259908 
601152172 
601514664 
602256324 
603003574 
604530981 
607557120 
607818652 
609481295 
609600294 
610865759 
610997874 
611137265 
611553773 
612232160 
613008778 
613152860 
614040858 
614734267 
615083535 
615353550 
616093775 
616527552 
616799895 
620065689 
620702810 
621809651 
622105288 
622362914 
622747850 
622769012 
623071051 
623162687 
623504040 
623745755 
623877025 
625671501 
626030147 
627902508 
628196670 
629627082 
630313421 
631287447 
632642772 
633968489 
634006368 
634391533 
635315393 
635391238 
635935590 
636650165 
637271419 
638497909 
638652991 
638860226 
639563353 
639879501 
641370058 
643033168 
644338809 
644406710 
645780214 
648876789 
649351001 
650371790 
651128462 
651323002 
651373045 
651842196 
652028639 
652923099 
653150782 
653212674 
657457333 
657609789 
658707210 
658799751 
661263706 
661934897 
662347384 
662463601 
663451938 
664021264 
664992832 
665820987 
666470542 
668021769 
669200971 
671977531 
672239560 
672898020 
674973124 
677095112 
677186722 
677789312 
680244268 
681555494 
681902512 
682699399 
682867648 
683235399 
683320422 
683481822 
685687079 
691622340 
691753376 
693704138 
695055627 
695259790 
696331539 
699964473 
700176410 
700572306 
701816198 
703306321 
703597900 
703707294 
706054445 
707647248 
711311918 
711365008 
712237677 
712452044 
712737392 
714702012 
714894671 
717216824 
717675090 
719344765 
720508253 
721107775 
722493009 
724211120 
724999931 
725479244 
726207205 
726279803 
726526908 
726589693 
732026635 
732256594 
732931294 
733503490 
734716919 
737346745 
737588959 
738834230 
741767745 
743396260 
743558488 
744243622 
744501396 
747424355 
747860507 
750850492 
751492066 
752009982 
753107033 
753487135 
754453490 
754747478 
755012025 
755190899 
755493228 
755657777 
756413400 
756755611 
758328140 
759228337 
761083147 
762918315 
763635172 
763809765 
763975467 
764805933 
766037422 
766356313 
767380445 
772428596 
774199665 
774705013 
775277420 
779969682 
780265827 
783835338 
785049160 
789481456 
789513991 
790914199 
791665582 
791755250 
792672371 
792956658 
793097182 
793375473 
794505639 
794909945 
796384080 
796462566 
798866968 
799858776 
800598110 
801523608 
801953583 
802252101 
802347095 
803358210 
803998148 
805841953 
806418674 
807101104 
807336067 
808946460 
809546492 
809726771 
812999647 
814822717 
815516385 
816035221 
817643109 
818133127 
818612698 
820066535 
821527572 
821768092 
822103028 
822200043 
823129234 
825553463 
826478662 
827102839 
828898345 
829690316 
830254902 
831511775 
831851214 
832260205 
832797002 
834183439 
837442294 
837938705 
839207200 
839975306 
841525975 
842297362 
843266616 
844832549 
844951108 
846261138 
848058914 
848761117 
849247104 
849518993 
853677593 
854138644 
854233678 
854282864 
854977732 
855045649 
855299757 
855738735 
856326141 
857310859 
858080843 
858659582 
860669180 
861535969 
863340234 
864168146 
867470391 
867511609 
869427465 
869646765 
871573613 
871628961 
871717914 
872309673 
872699236 
873774262 
874319293 
875440363 
876173461 
876314278 
876637373 
877995707 
878003781 
878686070 
879815642 
880089952 
881333682 
881694369 
882598683 
883391110 
883626445 
885176092 
885306098 
886289850 
887973913 
888095141 
888795901 
888930727 
890220431 
891286846 
894193289 
894996937 
896117333 
896145012 
896522269 
896995228 
897229235 
897543102 
898718515 
899176564 
899504541 
899750163 
900633777 
900956222 
901233789 
901367360 
902335914 
902371456 
905660743 
906223716 
906881620 
907119344 
907175100 
908093815 
912029562 
913900763 
914068519 
914656866 
914928674 
915303685 
917223989 
918434480 
919201719 
919823926 
921127787 
921532152 
923128449 
926094580 
926917398 
929103189 
930964545 
931588277 
931647993 
932059437 
933676836 
933868403 
934214624 
937829674 
938051640 
940291309 
940612292 
941989968 
942424745 
943281232 
943484085 
943562656 
944658737 
944779392 
947007358 
947928599 
948179165 
948754545 
948881704 
953102068 
954416134 
954458795 
955947783 
956133045 
958504256 
959038617 
959084822 
960457741 
962491850 
963093308 
963895458 
963918908 
964374604 
964723483 
965541917 
965605471 
966813005 
967115952 
967929419 
969086403 
970138512 

);





* p_agege15_ever_vaccinated n_death_hiv  ddaly  p_cur_any_vac_e_1564_  deathr_dol_r_first_uvl2 p_first_uvl2_dol_r
p_cur_full_vac_e_1564_ prop_elig_on_prep  prop_1564_hivneg_onprep  n_tested  p_diag  p_onart_diag  p_onart_vl1000_  incidence1549_;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;

%let nfit = 6400 ;

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





data d; * this is number of variables in %let var = above ;
merge g1 h1     ;
by cald;


* proc print; 
* run;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods html ;





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
* Title '';  * Title    height=1.5 justify=center "proportion of people with a prep/pep indication taking prep/pep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  0.5       by 0.1     ) valueattrs=(size=10);

series  x=cald y=p50_p_tested_incl_self_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_tested_incl_self_0 upper=p95_p_tested_incl_self_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_tested_incl_self_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_tested_incl_self_1 upper=p95_p_tested_incl_self_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

run;quit;

*/



ods html;
proc sgplot data=d nolegend; 
* Title '';  *  Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  0.8       by 0.1     ) valueattrs=(size=10);

series  x=cald y=p50_incidence1549__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_incidence1549__0 upper=p95_incidence1549__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_incidence1549__1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_incidence1549__1 upper=p95_incidence1549__1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

run;quit;

* ods html close;



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

run;quit;

* ods html close;




ods html;
proc sgplot data=d nolegend; 
* Title ''; *   height=1.5 justify=center "Number of children newly infected with HIV per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to  8000   by 1000     ) valueattrs=(size=10);

series  x=cald y=p50_n_mtct_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_mtct_0 upper=p95_n_mtct_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_mtct_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_mtct_1 upper=p95_n_mtct_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

run;quit;





ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "proportion of people with a prep/pep indication taking prep/pep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  1         by 0.1     ) valueattrs=(size=10);

series  x=cald y=p50_prop_elig_on_prep_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_0 upper=p95_prop_elig_on_prep_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prop_elig_on_prep_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_prop_elig_on_prep_1 upper=p95_prop_elig_on_prep_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

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

run;quit;

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
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.70 to  1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_onart_diag_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_diag_0 upper=p95_p_onart_diag_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_diag_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_onart_diag_1 upper=p95_p_onart_diag_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

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
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.50 to  1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_diag_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_diag_0 upper=p95_p_diag_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_diag_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_diag_1 upper=p95_p_diag_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

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

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "Discounted cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Discounted Cost $m'		labelattrs=(size=12)  values = (0 to  300         by 50    ) valueattrs=(size=10);

loess   x=cald y=p50_dcost_0 / lineattrs = (color=grey thickness = 4) nomarkers;
band    x=cald lower=p5_dcost_0 upper=p95_dcost_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

loess   x=cald y=p50_dcost_1 / lineattrs = (color=blue      thickness = 4) nomarkers;
band    x=cald lower=p5_dcost_1 upper=p95_dcost_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";

run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "Undiscounted cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'cost'		labelattrs=(size=12)  values = (0 to  300         by 50    ) valueattrs=(size=10);

loess   x=cald y=p50_cost_0 / lineattrs = (color=grey thickness = 4) nomarkers;
band    x=cald lower=p5_cost_0 upper=p95_cost_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

loess   x=cald y=p50_cost_1 / lineattrs = (color=darkblue      thickness = 4) nomarkers;
band    x=cald lower=p5_cost_1 upper=p95_cost_1 / transparency=0.9 fillattrs = (color=darkblue     ) legendlabel= "90% range";

run;quit;

*/


ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "Undiscounted dcost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'dcost'		labelattrs=(size=12)  values = (0 to  300         by 50    ) valueattrs=(size=10);

loess   x=cald y=p50_dcost_0 / lineattrs = (color=grey thickness = 4) nomarkers;
band    x=cald lower=p5_dcost_0 upper=p95_dcost_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

loess   x=cald y=p50_dcost_1 / lineattrs = (color=darkblue      thickness = 4) nomarkers;
band    x=cald lower=p5_dcost_1 upper=p95_dcost_1 / transparency=0.9 fillattrs = (color=darkblue     ) legendlabel= "90% range";

run;quit;


/*


ods html;
proc sgplot data=d nolegend; 
* Title '';  * Title    height=1.5 justify=center "Undiscounted cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'cost'		labelattrs=(size=12)  values = (0 to  300         by 50    ) valueattrs=(size=10);

series   x=cald y=p50_cost_0 / lineattrs = (color=grey thickness = 4) ;
band    x=cald lower=p5_cost_0 upper=p95_cost_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series   x=cald y=p50_cost_1 / lineattrs = (color=darkblue      thickness = 4);
band    x=cald lower=p5_cost_1 upper=p95_cost_1 / transparency=0.9 fillattrs = (color=darkblue     ) legendlabel= "90% range";

run;quit;





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
