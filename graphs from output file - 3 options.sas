

* used for submitted manuscript;


***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;


libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\dcp_cab\dcp_cab_ae_out\";

proc printto ;

* ods html close;

data b;
set a.l_dcp_cab_ae_y;

n_k65m = p_k65m * n_hiv;
p_vl1000_ = p_vl1000;
incidence1549_ = incidence1549;
incidence1564_ = incidence1564;
prevalence1549_ = prevalence1549;
p_onart_vl1000_ = p_onart_vl1000;
prevalence_vg1000_ = prevalence_vg1000;
p_vl1000_ = p_vl1000;
p_onart_vl1000_ = p_onart_vl1000;
n_vg1000_ = n_vg1000;
p_newp_ge1_age1549_=p_newp_ge1_age1549;
prop_prep_any = (n_prep_any / n_alive) * 100;


if run in (

670877 
1366220 
1630766 
2579594 
2996556 
3128968 
3464390 
3609246 
4663072 
5211993 
7642161 
9567699 
9617117 
10635887 
11259323 
11845065 
12652108 
14943160 
15084254 
15784503 
16577469 
18942346 
19556549 
20136736 
20391333 
23804715 
24145353 
24579209 
26467638 
28027427 
29185994 
32169674 
32290444 
34692494 
38614257 
38639238 
39623686 
40972091 
41405135 
42312345 
44430120 
44521407 
45073940 
46175577 
48196927 
48469620 
48490799 
48624414 
48692954 
50275141 
51404763 
51556577 
51679634 
53570774 
55632560 
55769135 
56250103 
57551876 
58937785 
59264134 
59359299 
59609244 
59975201 
61070663 
64354166 
66414512 
66968617 
67032701 
67998315 
68082633 
69748242 
70014543 
72142802 
72399350 
72438767 
72588583 
72829669 
73666611 
75386850 
75542615 
76076491 
76541986 
77504307 
77517835 
77937778 
78213364 
78279801 
78875395 
79264747 
79420771 
79933301 
80018503 
80932341 
81774507 
82102487 
83823089 
83863641 
84150083 
85206718 
85219009 
86367292 
88732500 
89152546 
90394638 
91435282 
91786323 
93098625 
93315817 
95912716 
96964906 
97222641 
98941840 
99500271 
100738719 
101048866 
101327616 
101488074 
101588357 
101757027 
101790042 
102248189 
105027674 
105835545 
106514656 
106738769 
109186955 
110580829 
112843760 
113267381 
114883287 
114971098 
115002923 
115261563 
115465374 
115743206 
117748218 
117807122 
118080752 
119237433 
120662600 
120920110 
124811635 
125440202 
126130304 
131167058 
132923417 
132981674 
133752218 
135859647 
138262315 
138998209 
140904773 
141205598 
141710711 
142068426 
142679621 
144014238 
145038912 
145938151 
146097900 
148717914 
149493521 
149589562 
149692815 
149767370 
149949743 
150002884 
150088289 
150695184 
152690891 
152906377 
153608163 
154088525 
154204991 
157047767 
160177357 
161931104 
163340750 
163639575 
164159481 
164476017 
164786335 
165524771 
165606575 
166053790 
166314367 
169804148 
169857211 
170526234 
170841540 
172065499 
172799015 
173620648 
173654471 
176720990 
177997904 
178131641 
178841145 
180384055 
180462536 
181065726 
183908731 
185048197 
185479740 
185786351 
185821050 
186850610 
186992375 
189131906 
190187016 
190759723 
192267127 
193191690 
194473059 
196493300 
197235281 
198575376 
199679229 
202024333 
202403594 
203819120 
204138760 
204500642 
205177056 
206845468 
207440401 
207555755 
207571696 
207743799 
208204449 
208253298 
209027459 
209828745 
210143730 
216093844 
216306859 
217077048 
217654381 
218489372 
218499669 
218849433 
218933162 
220996991 
223064995 
223135462 
224198837 
224252295 
224638221 
225490582 
225633896 
226392956 
227630870 
228473639 
228873443 
229057353 
229359738 
230064114 
231314477 
231614364 
232518953 
234416532 
236831312 
240239906 
241379610 
243339901 
243895992 
245861259 
245958354 
246196368 
246231163 
246426221 
246627641 
247352177 
247566281 
250584443 
253527889 
254696380 
255351311 
257178796 
258033195 
258828338 
260209752 
263639424 
263701556 
263953938 
264602211 
266445366 
266755608 
267132465 
267211543 
267408506 
267489381 
267981691 
268264971 
269123044 
269641483 
273447236 
273612734 
275230738 
275602667 
275928377 
276051036 
276699543 
276771290 
277281868 
277449818 
277622757 
277644489 
278154762 
279140386 
279336288 
280000041 
280383766 
280886753 
281217703 
281502763 
282915338 
284844992 
284845900 
286145402 
288567181 
288611179 
292380128 
293264969 
295650434 
297312839 
298290995 
299176847 
299415482 
301937297 
302648733 
305249249 
306347748 
307240533 
308071837 
308353286 
309889191 
309998834 
310017125 
310571767 
311039154 
311550488 
312873602 
314328150 
314654285 
315259606 
317381445 
318529329 
320394320 
321105813 
321717321 
321809667 
321844851 
322450086 
322466556 
323544534 
324149178 
327557763 
327758334 
328188234 
328389206 
329368203 
330659753 
332339265 
332844776 
332989126 
335444580 
336154255 
336201862 
339125759 
339149000 
339935573 
340247995 
344923465 
345971506 
346773536 
348460625 
348890970 
349928041 
350038638 
352545292 
352843081 
353241013 
357116724 
357715909 
361290887 
362464971 
362814881 
363340961 
363402910 
365095399 
365709699 
366403957 
367315697 
367381131 
368982752 
370636725 
371593813 
372517715 
373653163 
373980962 
376101522 
376712308 
377235660 
377315070 
378292283 
379082483 
381349066 
382049649 
384618559 
385040652 
385184068 
386682849 
386709482 
386875040 
387425733 
387516758 
388098599 
388601884 
388868007 
390047041 
390129572 
390483869 
391655878 
392951396 
393332430 
394952874 
395041761 
396255403 
396359580 
396502001 
397124982 
397479323 
397779903 
399414360 
399749639 
399775307 
399819083 
400168294 
401825221 
402391008 
402654724 
402988793 
403120825 
404044541 
404064795 
407648677 
408692709 
412260358 
412627594 
413392206 
413428964 
414283762 
415042063 
415795228 
416429753 
416574738 
417227918 
418525592 
418869924 
418890789 
422506896 
422923838 
423483876 
424253646 
424299751 
424901542 
426608267 
427048476 
430128610 
430774512 
432587042 
433159340 
433203203 
433212708 
434651286 
436266520 
437014868 
437094470 
437458571 
437643404 
439322713 
439427981 
439982417 
441801625 
442159949 
444917647 
445224688 
445660433 
446725725 
447641194 
447656348 
449052751 
451295390 
451364731 
451588976 
452436025 
452487504 
454074466 
454571521 
455908878 
457226229 
457764063 
458795425 
458982232 
460196236 
460962097 
461039361 
461059664 
461234820 
464659345 
464668305 
465781520 
465859829 
466319179 
466666519 
469096937 
470583455 
470660205 
470976152 
472042269 
472227065 
475503273 
476021642 
476646756 
477017066 
477686742 
477693302 
478250945 
478391687 
479011366 
480929313 
481890592 
481963855 
482021069 
482156519 
482348607 
482576041 
482910877 
483267609 
484235720 
485149540 
485944613 
487522367 
487867346 
490056037 
490317461 
490377118 
490572559 
490765052 
491022647 
492152154 
493606356 
493813615 
494733189 
495524833 
495549927 
495990487 
496648677 
497025574 
497139037 
497509766 
499225375 
501062421 
501428328 
501620097 
503507370 
504056194 
504110377 
505209312 
506205403 
506298647 
509850007 
510516482 
511829162 
511869740 
513790890 
515953155 
516702938 
517057511 
517390566 
519042392 
523058465 
525240209 
526115789 
528222816 
528472995 
531293259 
531353548 
532211434 
532966534 
533781042 
533807536 
534171733 
534348293 
535169388 
535385096 
537234027 
538063246 
538433975 
539578985 
539652025 
539756324 
540052781 
540650914 
541366985 
542209537 
542236956 
543028345 
543146223 
543545253 
543754859 
544517034 
544895425 
545129132 
545946635 
546455997 
548324437 
550152466 
550535813 
551280613 
552666676 
553917226 
555466492 
556011541 
556367576 
557296440 
557417263 
558679265 
559360099 
559430073 
560285185 
562056539 
562062177 
563088974 
563938672 
565367671 
565646078 
566069514 
566640862 
566982452 
567252246 
567996115 
568044133 
568535474 
568762094 
570081479 
570137914 
570338741 
571372373 
571446067 
572367462 
573825613 
574116104 
574637132 
575780740 
575784687 
576288779 
576301711 
577208817 
578543248 
578833261 
578838563 
579056990 
579962852 
580228782 
580392267 
581039149 
581334593 
581802082 
581858908 
582423403 
584893903 
587183463 
587354628 
588621125 
589145699 
590488541 
590747503 
591306912 
591543460 
591602215 
591842477 
592676049 
595391646 
596068341 
596902844 
598262584 
602355117 
603473450 
603967391 
605178741 
605802756 
607556060 
611069936 
611697215 
613496448 
615629125 
615996407 
617377670 
621051145 
622012893 
622809282 
624108854 
625212469 
625566071 
626042204 
626535648 
627235974 
627251636 
628398970 
630426332 
630697468 
631613921 
632227548 
633312477 
633540823 
634091969 
634763525 
635575313 
635969382 
636617413 
636922438 
637168537 
638175021 
638895864 
639032674 
639992077 
640052432 
640139502 
640162955 
642393632 
642440993 
642507659 
644596218 
644840368 
647653732 
647707768 
649577463 
649822061 
650975451 
651304830 
652156827 
652320672 
652394953 
652435266 
653378266 
654286810 
654305193 
654451219 
654751294 
654806213 
655737229 
657919597 
659614285 
660103006 
663653964 
663822852 
664564840 
664654021 
665322239 
665404576 
665806848 
667651911 
667806889 
668355518 
668373217 
668895898 
669356886 
670256664 
670830812 
671153326 
671199831 
671741094 
672318782 
673798908 
674833980 
674914744 
676026852 
676293574 
676363394 
676395208 
677835223 
677854246 
678072205 
680068256 
680134276 
680495863 
680652550 
680908474 
680908956 
681698142 
683873862 
684757081 
686714703 
687916038 
688942377 
689748500 
692302107 
693087711 
694504172 
695411295 
695608175 
696448680 
696665979 
697088956 
697323644 
697525790 
698848310 
699982650 
700270192 
700470896 
701527823 
701545046 
701700178 
704621111 
705388946 
706176667 
706469633 
706728086 
706749844 
707624504 
708282740 
709175353 
710375344 
710932169 
714120544 
716471935 
716518613 
716648254 
718422194 
719157681 
719623420 
720009069 
721014725 
721047869 
721399669 
722235913 
722737063 
722792289 
722801026 
726932683 
727348632 
731134491 
732057993 
734534081 
735104379 
735116667 
737537972 
739440111 
739901966 
740907761 
741326200 
742433715 
743903997 
746476710 
747046187 
747207033 
747342913 
749479025 
749575608 
752941726 
755171781 
755485586 
756178735 
757348041 
757696135 
760869817 
761136174 
761366278 
761548645 
762597360 
764717352 
765451569 
765918537 
767019307 
768474052 
769630325 
770209967 
771058701 
772293151 
773747442 
773820906 
775814128 
776000921 
776548957 
776916492 
777962372 
777989048 
778163658 
778540009 
778954458 
779298155 
780545845 
780911583 
782000649 
782052081 
782446722 
784973107 
785716400 
787488919 
787948319 
788009689 
788130894 
788158174 
788312769 
788741064 
789794249 
791360170 
791392240 
791617879 
791924578 
792834876 
794032945 
795330657 
795662424 
797366420 
799306099 
799585160 
803336641 
803828842 
804866048 
805267604 
805598288 
806250772 
808317148 
809808040 
811779031 
812002636 
813221471 
813553992 
814442781 
814661368 
819066540 
820141540 
820820773 
822484370 
823616520 
823938477 
824555341 
826846497 
826858151 
827921393 
827941020 
828076831 
829559039 
829667761 
830738044 
830890048 
831122105 
831290444 
831398649 
831519232 
832859094 
834923512 
835060455 
835799328 
835953976 
836054810 
836294849 
837888028 
838129611 
838228074 
838563735 
839319112 
840174167 
842886574 
843405926 
843912490 
845714974 
845797085 
848254551 
848893399 
848987726 
849001441 
850069066 
850578820 
850586056 
850778830 
851240297 
851450207 
852442145 
853274334 
853893696 
856595371 
856956369 
857710543 
857938742 
858660382 
859003710 
859538459 
859729515 
861503921 
862038050 
862733368 
863505040 
865009013 
865067878 
866706608 
867937948 

);







%let single_var = dcost             ;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;

%let nfit = 3000    ;

%let year_end = 2070.00 ;
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
merge g1  h1 i1  ;
by cald;


* proc print; 
* run;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods html ;





ods html;

proc sgplot data=d nolegend;
Title    height=1.5 justify=center "Annual costs ($m discounted)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2025 to 2074 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= '$m'		labelattrs=(size=12)  values = (  0      to 500       by 100      ) valueattrs=(size=10);

  series  x=cald y=mean_dcost_0/	lineattrs = (color=black thickness = 2);
  series  x=cald y=mean_dcost_1/	lineattrs = (color=darkblue thickness = 2);
  series  x=cald y=mean_dcost_2/	lineattrs = (color=darkred   thickness = 2);

run;quit;

ods html close;


/*

ods html;

proc sgplot data=d nolegend;
Title    height=1.5 justify=center "Number of DALYs per year (discounted)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2025 to 2074 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (1000000  to 3500000   by 500000   ) valueattrs=(size=10);

  series  x=cald y=mean_ddaly_0/	lineattrs = (color=black thickness = 2);
  series  x=cald y=mean_ddaly_1/	lineattrs = (color=darkblue thickness = 2);
  series  x=cald y=mean_ddaly_2/	lineattrs = (color=darkred   thickness = 2);

run;quit;

ods html close;

*/

/*


  ods html;
proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1995 to 2074 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  3         by 0.1     ) valueattrs=(size=10);

 series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_incidence1549__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_incidence1549__2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

  ods html close;

*/

/*

proc sgplot data=d ; 
Title    height=1.5 justify=center "Incidence (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  3         by 0.1     ) valueattrs=(size=10);

label p50_incidence1564__0 = "status quo";
label p50_incidence1564__1 = "dcp";
label p50_incidence1564__2 = "dcp + cab";

 series  x=cald y=p50_incidence1564__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_incidence1564__0 	upper=p95_incidence1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_incidence1564__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_incidence1564__1 	upper=p95_incidence1564__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_incidence1564__2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_incidence1564__2 	upper=p95_incidence1564__2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

ods html close;

*/


/*

ods html;
proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "HIV prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1995 to 2074 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'prevalence'		labelattrs=(size=12)  values = (0 to  0.20      by 0.02    ) valueattrs=(size=10);

 series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_prevalence1549__2 	upper=p95_prevalence1549__2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

ods html close;

*/

/*

ods html;
title;
proc sgplot data=d  noautolegend ; 
* Title    height=1.5 justify=center "HIV prevalence (age 15+)";  
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2073 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to  0.20      by 0.05    ) valueattrs=(size=10);

label p50_prevalence15pl_0 = "status quo";
label p50_prevalence15pl_1 = "dcp";
label p50_prevalence15pl_2 = "dcp + cab";

 series  x=cald y=p50_prevalence15pl_0/	lineattrs = (color=grey thickness = 4);
   band    x=cald lower=p5_prevalence15pl_0 	upper=p95_prevalence15pl_0  / transparency=0.95 fillattrs = (color=lightgrey) legendlabel= "90% range";
  series  x=cald y=p50_prevalence15pl_1/	lineattrs = (color=red thickness = 4);
   band    x=cald lower=p5_prevalence15pl_1 	upper=p95_prevalence15pl_1  / transparency=0.95 fillattrs = (color=lightred) legendlabel= "90% range";
  series  x=cald y=p50_prevalence15pl_2/	lineattrs = (color=darkorange   thickness = 4);
   band    x=cald lower=p5_prevalence15pl_2 	upper=p95_prevalence15pl_2  / transparency=0.95 fillattrs = (color=lightorange) legendlabel= "90% range";

run;quit;

* ods html close;

*/

/*

* ods html;

proc sgplot data=d nolegend;
Title    height=1.5 justify=center "Number of HIV-related deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1995 to 2074 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0  to 100000   by 10000   ) valueattrs=(size=10);

  series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_n_death_hiv_2 	upper=p95_n_death_hiv_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

* ods html close;

*/

/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to 2074 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5000000  by  100000 ) valueattrs=(size=10);

  series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_hiv_1 	upper=p95_n_hiv_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_2/	lineattrs = (color=darkred    thickness = 4);
  band    x=cald lower=p5_n_hiv_2 	upper=p95_n_hiv_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

ods html close;

*/


/*

ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "Number of living adults age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to 2075 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  30000000   by 10000000 ) valueattrs=(size=10);

label p50_n_alive_0 = "status quo";
label p50_n_alive_1 = "dcp";
label p50_n_alive_2 = "dcp + cab";


 series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_alive_1 	upper=p95_n_alive_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_n_alive_2 	upper=p95_n_alive_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

ods html close;

*/


/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_infection";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1995 to 2074 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000  by  10000 ) valueattrs=(size=10);

label p50_n_infection_0 = "option 0";
label p50_n_infection_1 = "option_1";
label p50_n_infection_2 = "option_2";

  series  x=cald y=p50_n_infection_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_infection_0 	upper=p95_n_infection_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_infection_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_infection_1 	upper=p95_n_infection_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_infection_2/	lineattrs = (color=darkred    thickness = 4);
  band    x=cald lower=p5_n_infection_2 	upper=p95_n_infection_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

ods html close;

*/


/*


ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "Number of HIV tests done per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  6000000   by 1000000 ) valueattrs=(size=10);

label p50_n_tested_0 = "status quo";
label p50_n_tested_1 = "dcp";
label p50_n_tested_2 = "cab";
label p50_n_tested_3 = "dcp + cab";


 series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_n_tested_2 	upper=p95_n_tested_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
 series  x=cald y=p50_n_tested_3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_n_tested_3 	upper=p95_n_tested_3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_onart_0 = "option 0";
label p50_p_onart_1 = "option_1";
label p50_p_onart_2 = "option_2";

  series  x=cald y=p50_p_onart_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_0 	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_onart_1 	upper=p95_p_onart_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_2/	lineattrs = (color=darkred  thickness = 4);
  band    x=cald lower=p5_p_onart_2 	upper=p95_p_onart_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all PLHIV (diagnosed or undiagnosed) with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.7 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_vl1000__0 = "status quo";
label p50_p_vl1000__1 = "dcp";
label p50_p_vl1000__2 = "cab";
label p50_p_vl1000__3 = "dcp + cab";


 series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_p_vl1000__2 	upper=p95_p_vl1000__2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
 series  x=cald y=p50_p_vl1000__3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_p_vl1000__3 	upper=p95_p_vl1000__3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion with adhav >80%";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_adhav_hi_onart_0 = "option 0";
label p50_p_adhav_hi_onart_1 = "option_1";
label p50_p_adhav_hi_onart_2 = "option_2";
label p50_p_adhav_hi_onart_3 = "option_3";
label p50_p_adhav_hi_onart_4 = "option_4";
label p50_p_adhav_hi_onart_5 = "option_5";

  series  x=cald y=p50_p_adhav_hi_onart_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_0 	upper=p95_p_adhav_hi_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_1 	upper=p95_p_adhav_hi_onart_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_2 	upper=p95_p_adhav_hi_onart_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_3 	upper=p95_p_adhav_hi_onart_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_4/	lineattrs = (color=darkred  thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_4 	upper=p95_p_adhav_hi_onart_4  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_5 	upper=p95_p_adhav_hi_onart_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prop_inf_w_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1     by 0.05 ) valueattrs=(size=10);

label mean_prop_inf_w_sw_0 = "option 0";
label mean_prop_inf_w_sw_1 = "option_1";

  series  x=cald y=mean_prop_inf_w_sw_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_inf_w_sw_0 	upper=p95_prop_inf_w_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=mean_prop_inf_w_sw_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prop_inf_w_sw_1 	upper=p95_prop_inf_w_sw_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'proportion'		labelattrs=(size=12)  values = (0 to  0.2       by  0.01     ) valueattrs=(size=10);

label p50_prevalence1549__0 = "status quo";
label p50_prevalence1549__1 = "dcp";
label p50_prevalence1549__2 = "cab";
label p50_prevalence1549__3 = "dcp + cab";


 series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_prevalence1549__2 	upper=p95_prevalence1549__2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
 series  x=cald y=p50_prevalence1549__3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_prevalence1549__3 	upper=p95_prevalence1549__3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;

*/

/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence of unsuppressed HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.05  by 0.005 ) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "option 0";
label p50_prevalence_vg1000__1 = "option_1";
label p50_prevalence_vg1000__2 = "option_2";

  series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__2 	upper=p95_prevalence_vg1000__2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "90% range";

run;quit;

ods html close;

*/


/*


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_infected_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000 by 100000 ) valueattrs=(size=10);

label p50_n_infected_primary_0 = "option 0";
label p50_n_infected_primary_1 = "option_1";
label p50_n_infected_primary_2 = "option_2";

  series  x=cald y=p50_n_infected_primary_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_infected_primary_0 	upper=p95_n_infected_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_infected_primary_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_infected_primary_1 	upper=p95_n_infected_primary_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_infected_primary_2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_n_infected_primary_2 	upper=p95_n_infected_primary_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_vg1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000 ) valueattrs=(size=10);

label p50_n_vg1000__0 = "option 0";
label p50_n_vg1000__1 = "option_1";
label p50_n_vg1000__2 = "option_2";

  series  x=cald y=p50_n_vg1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_vg1000__0 	upper=p95_n_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_vg1000__1 	upper=p95_n_vg1000__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000__2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_n_vg1000__2 	upper=p95_n_vg1000__2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "90% range";

run;quit;

ods html close;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_any";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000  by 100000 ) valueattrs=(size=10);

label p50_n_prep_any_0 = "status quo";
label p50_n_prep_any_1 = "dcp";
label p50_n_prep_any_2 = "cab";
label p50_n_prep_any_3 = "dcp + cab";

  series  x=cald y=p50_n_prep_any_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_prep_any_0 	upper=p95_n_prep_any_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_prep_any_1 	upper=p95_n_prep_any_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_n_prep_any_2 	upper=p95_n_prep_any_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_n_prep_any_3 	upper=p95_n_prep_any_3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;





ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of adults eligible for PrEP / DCP (eligibility criteria are the same for both)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percent'		labelattrs=(size=12)  values = (0 to 0.2  by 0.05 ) valueattrs=(size=10);

label p50_p_elig_prep_0 = "status quo";
label p50_p_elig_prep_1 = "dcp";
label p50_p_elig_prep_2 = "cab";
label p50_p_elig_prep_3 = "dcp + cab";

  series  x=cald y=p50_p_elig_prep_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_elig_prep_0 	upper=p95_p_elig_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_elig_prep_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_elig_prep_1 	upper=p95_p_elig_prep_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_elig_prep_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_p_elig_prep_2 	upper=p95_p_elig_prep_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_p_elig_prep_3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_p_elig_prep_3 	upper=p95_p_elig_prep_3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people eligible for DCP who are under DCP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percent'		labelattrs=(size=12)  values = (0 to 0.2  by 0.05 ) valueattrs=(size=10);

label p50_prop_elig_dcp_0 = "status quo";
label p50_prop_elig_dcp_1 = "dcp";
label p50_prop_elig_dcp_2 = "cab";
label p50_prop_elig_dcp_3 = "dcp + cab";

  series  x=cald y=p50_prop_elig_dcp_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_elig_dcp_0 	upper=p95_prop_elig_dcp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_dcp_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prop_elig_dcp_1 	upper=p95_prop_elig_dcp_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_dcp_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_prop_elig_dcp_2 	upper=p95_prop_elig_dcp_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_dcp_3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_prop_elig_dcp_3 	upper=p95_prop_elig_dcp_3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;





ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Percentage of adults taking PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percent'		labelattrs=(size=12)  values = (0 to 7  by 1 ) valueattrs=(size=10);

label p50_prop_prep_any_0 = "status quo";
label p50_prop_prep_any_1 = "dcp";
label p50_prop_prep_any_2 = "cab";
label p50_prop_prep_any_3 = "dcp + cab";

  series  x=cald y=p50_prop_prep_any_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_prep_any_0 	upper=p95_prop_prep_any_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_prep_any_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prop_prep_any_1 	upper=p95_prop_prep_any_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prop_prep_any_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_prop_prep_any_2 	upper=p95_prop_prep_any_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_prop_prep_any_3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_prop_prep_any_3 	upper=p95_prop_prep_any_3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion under DCP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.05 ) valueattrs=(size=10);

label p50_prop_1564_ondcp_0 = "status quo";
label p50_prop_1564_ondcp_1 = "dcp";
label p50_prop_1564_ondcp_2 = "cab";
label p50_prop_1564_ondcp_3 = "dcp + cab";

  series  x=cald y=p50_prop_1564_ondcp_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_1564_ondcp_0 	upper=p95_prop_1564_ondcp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_1564_ondcp_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prop_1564_ondcp_1 	upper=p95_prop_1564_ondcp_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prop_1564_ondcp_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_prop_1564_ondcp_2 	upper=p95_prop_1564_ondcp_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_prop_1564_ondcp_3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_prop_1564_ondcp_3 	upper=p95_prop_1564_ondcp_3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;

*/

/*

ods html;
proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Proportion people with a PrEP indication taking PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1995 to 2074 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1       by 0.1    ) valueattrs=(size=10);

  series  x=cald y=p50_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_on_prep_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prop_elig_on_prep_1 	upper=p95_prop_elig_on_prep_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_on_prep_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_prop_elig_on_prep_2 	upper=p95_prop_elig_on_prep_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;
ods html close;

*/



/*


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Percent of all PLHIV diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percent'		labelattrs=(size=12)  values = (70 to 100     by 10     ) valueattrs=(size=10);

label p50_p_diag_0 = "status quo";
label p50_p_diag_1 = "dcp";
label p50_p_diag_2 = "cab";
label p50_p_diag_3 = "dcp + cab";

  series  x=cald y=p50_p_diag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_p_diag_2 	upper=p95_p_diag_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_3/	lineattrs = (color=violet  thickness = 4);
  band    x=cald lower=p5_p_diag_3 	upper=p95_p_diag_3  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.7 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_onart_diag_0 = "option 0";
label p50_p_onart_diag_1 = "option_1";
label p50_p_onart_diag_2 = "option_2";

  series  x=cald y=p50_p_onart_diag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_diag_0 	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_onart_diag_1 	upper=p95_p_onart_diag_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_onart_diag_2 	upper=p95_p_onart_diag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prop_w_1549_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.05 by 0.005 ) valueattrs=(size=10);

label p50_prop_w_1549_sw_0 = "option 0";
label p50_prop_w_1549_sw_1 = "option_1";
label p50_prop_w_1549_sw_2 = "option_2";

  series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_1549_sw_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_prop_w_1549_sw_2 	upper=p95_prop_w_1549_sw_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1    by 0.1   ) valueattrs=(size=10);

label p50_p_inf_diag_0 = "option 0";
label p50_p_inf_diag_1 = "option_1";
label p50_p_inf_diag_2 = "option_2";

  series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_diag_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_diag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_inf_diag_2 	upper=p95_p_inf_diag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_age1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.05 by 0.005 ) valueattrs=(size=10);

label p50_p_newp_ge1_age1549__0 = "option 0";
label p50_p_newp_ge1_age1549__1 = "option_1";
label p50_p_newp_ge1_age1549__2 = "option_2";

  series  x=cald y=p50_p_newp_ge1_age1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_newp_ge1_age1549__0 	upper=p95_p_newp_ge1_age1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_ge1_age1549__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_newp_ge1_age1549__1 	upper=p95_p_newp_ge1_age1549__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_ge1_age1549__2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_p_newp_ge1_age1549__2 	upper=p95_p_newp_ge1_age1549__2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_ge1_age1549__3/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_newp_ge1_age1549__3 	upper=p95_p_newp_ge1_age1549__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of those on ART, proportion with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2030 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.80 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "option 0";
label p50_p_onart_vl1000__1 = "option_1";
label p50_p_onart_vl1000__2 = "option_2";
label p50_p_onart_vl1000__3 = "option_3";

  series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__2 	upper=p95_p_onart_vl1000__2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__3/	lineattrs = (color=orange   thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__3 	upper=p95_p_onart_vl1000__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of sw on ART, proportion with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2030 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.9 to 1   by 0.01 ) valueattrs=(size=10);

label p50_p_onart_vl1000_sw_0 = "option 0";
label p50_p_onart_vl1000_sw_1 = "option_1";
label p50_p_onart_vl1000_sw_2 = "option_2";
label p50_p_onart_vl1000_sw_3 = "option_3";
label p50_p_onart_vl1000_sw_4 = "option_4";
label p50_p_onart_vl1000_sw_5 = "option_5";

  series  x=cald y=p50_p_onart_vl1000_sw_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_0 	upper=p95_p_onart_vl1000_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_1 	upper=p95_p_onart_vl1000_sw_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_2 	upper=p95_p_onart_vl1000_sw_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_3 	upper=p95_p_onart_vl1000_sw_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_4/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_4 	upper=p95_p_onart_vl1000_sw_4  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_5 	upper=p95_p_onart_vl1000_sw_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;

  
 
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "test_prop_positive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.025  by 0.005  ) valueattrs=(size=10);

label p50_test_prop_positive_0 = "option 0";
label p50_test_prop_positive_1 = "option_1";
label p50_test_prop_positive_2 = "option_2";
label p50_test_prop_positive_3 = "option_3";

  series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_test_prop_positive_1 	upper=p95_test_prop_positive_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_2/	lineattrs = (color=darkred    thickness = 4);
  band    x=cald lower=p5_test_prop_positive_2 	upper=p95_test_prop_positive_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_3/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_test_prop_positive_3 	upper=p95_test_prop_positive_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_undiag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000  by  5000 ) valueattrs=(size=10);

label p50_n_undiag_0 = "option 0";
label p50_n_undiag_1 = "option_1";
label p50_n_undiag_2 = "option_2";

  series  x=cald y=p50_n_undiag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_undiag_0 	upper=p95_n_undiag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_undiag_1 	upper=p95_n_undiag_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_n_undiag_2 	upper=p95_n_undiag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

ods html close;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_vg1000_np";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 150000  by 10000 ) valueattrs=(size=10);

label p50_n_vg1000_np_0 = "option 0";
label p50_n_vg1000_np_1 = "option_1";
label p50_n_vg1000_np_2 = "option_2";
label p50_n_vg1000_np_3 = "option_3";

  series  x=cald y=p50_n_vg1000_np_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_vg1000_np_0 	upper=p95_n_vg1000_np_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000_np_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_vg1000_np_1 	upper=p95_n_vg1000_np_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000_np_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_n_vg1000_np_2 	upper=p95_n_vg1000_np_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000_np_3/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_n_vg1000_np_3 	upper=p95_n_vg1000_np_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p mcirc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1   by 0.1  ) valueattrs=(size=10);

label p50_p_mcirc_0 = "option 0";
label p50_p_mcirc_1 = "option_1";
label p50_p_mcirc_2 = "option_2";
label p50_p_mcirc_3 = "option_3";

  series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_p_mcirc_1 	upper=p95_p_mcirc_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_2/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_p_mcirc_2 	upper=p95_p_mcirc_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_3/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_mcirc_3 	upper=p95_p_mcirc_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;











ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_onart";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000  by  100000 ) valueattrs=(size=10);

label p50_n_onart_0 = "option 0";
label p50_n_onart_1 = "option_1";
label p50_n_onart_2 = "option_2";

  series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_onart_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_n_onart_2/	lineattrs = (color=darkred    thickness = 4);
  band    x=cald lower=p5_n_onart_2 	upper=p95_n_onart_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 300   by  50    ) valueattrs=(size=10);

label p50_cost_0 = "option 0";
label p50_cost_1 = "option_1";
label p50_cost_2 = "option_2";

  series  x=cald y=p50_cost_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_cost_0 	upper=p95_cost_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_cost_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_cost_1 	upper=p95_cost_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_cost_2/	lineattrs = (color=darkred    thickness = 4);
  band    x=cald lower=p5_cost_2 	upper=p95_cost_2  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prop_w_vlg1";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1   by 0.1  ) valueattrs=(size=10);

label p50_prop_w_vlg1_0 = "option 0";
label p50_prop_w_vlg1_1 = "option_1";
label p50_prop_w_vlg1_2 = "option_2";
label p50_prop_w_vlg1_3 = "option_3";
label p50_prop_w_vlg1_4 = "option_4";
label p50_prop_w_vlg1_5 = "option_5";

  series  x=cald y=p50_prop_w_vlg1_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_0 	upper=p95_prop_w_vlg1_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_1/	lineattrs = (color=darkblue thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_1 	upper=p95_prop_w_vlg1_1  / transparency=0.9 fillattrs = (color=darkblue) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_2 	upper=p95_prop_w_vlg1_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_3 	upper=p95_prop_w_vlg1_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_4/	lineattrs = (color=darkred   thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_4 	upper=p95_prop_w_vlg1_4  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_5 	upper=p95_prop_w_vlg1_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;

*/
