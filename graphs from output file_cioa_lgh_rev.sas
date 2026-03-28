
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


%let single_var =  cost                                       ;

if run in (

126906 
1486590 
5164603 
6254355 
6716748 
7424271 
8043287 
8713238 
8969884 
9403784 
9403822 
10084943 
10668240 
11357221 
13131001 
13208773 
15561119 
15864206 
17839871 
18505997 
18612188 
22322502 
22589639 
23726978 
25630368 
25825024 
26104657 
27978266 
28325422 
28468698 
28692351 
28972625 
29055567 
29227218 
30298586 
30333014 
30557472 
31389332 
35557308 
35964276 
36317253 
37545351 
38507571 
41362388 
42355992 
42368816 
43576573 
43800904 
46710726 
47207851 
48193645 
48413065 
48969838 
49015369 
49647752 
51528055 
51756922 
52040368 
52744219 
55144871 
57329030 
59373803 
59919354 
61442438 
62292903 
62644045 
64836419 
67099606 
67768063 
68535497 
69067278 
69501419 
69932757 
70462743 
71996791 
73338914 
73762589 
74332519 
74358797 
77639420 
78399799 
79593912 
83429495 
83830473 
84218210 
85005278 
86747866 
88125782 
90414377 
90428502 
92634021 
93993588 
95173753 
96159481 
96189407 
97113853 
100149301 
100544267 
102038801 
102883945 
103218429 
104645430 
105363252 
106413329 
109645416 
110186901 
112457209 
112854620 
114328829 
114426565 
114560901 
114714536 
115722438 
115776970 
115935921 
118776768 
119316068 
120049537 
122322553 
122402456 
123767649 
124370106 
124875969 
127310476 
127723861 
128258008 
128403382 
129395739 
130627555 
131988317 
135107882 
136076816 
136677778 
137107288 
144235919 
144640598 
144802999 
145736657 
146223239 
147718282 
148553389 
149822756 
150056412 
150152215 
150402497 
151157898 
152634581 
153575017 
153979504 
157141459 
158703765 
159246286 
160152081 
160955532 
163583254 
164912143 
165357112 
166181897 
167419789 
168789071 
169173462 
170502881 
174979948 
176394621 
176732837 
177464340 
177539458 
178082170 
178354242 
180072175 
180475238 
182767833 
182806141 
185490405 
187295019 
188531042 
188947405 
189719913 
191409725 
196487913 
196737993 
201441220 
204381008 
207059350 
209431802 
209454489 
209485300 
210031319 
210143025 
210419290 
210798296 
212647357 
216194940 
216875662 
218469528 
218550204 
219423404 
220573240 
221314751 
222090746 
223013981 
223248764 
223916276 
223941677 
225558791 
227133198 
228804457 
228966486 
229488327 
230982022 
231064417 
233462492 
233694986 
234448670 
234984994 
235054913 
236185139 
237160769 
237200709 
237615586 
239130137 
240017970 
240820733 
242267033 
243213632 
244380946 
244953281 
245914469 
248552279 
250509390 
251450010 
254182338 
257975909 
258125615 
258427350 
258593570 
259525295 
260751923 
262878138 
265256208 
265916259 
266935026 
267697976 
268503851 
270787911 
272100999 
272231785 
272943424 
273111978 
273896453 
274330669 
275839530 
276182708 
277016501 
278488912 
282149677 
283097957 
284698265 
286083764 
287364609 
287789376 
288899117 
289067761 
289165458 
290611738 
293474736 
293843030 
293888136 
296057023 
296234016 
296439935 
297738888 
301178747 
302980799 
303308102 
304017248 
305976633 
309029886 
311463217 
311663588 
312260258 
312394668 
312712334 
312977316 
313038905 
313632853 
313858346 
315805207 
316183314 
316568989 
317768211 
317861181 
320209133 
320581726 
321404513 
322563528 
322777261 
322883437 
322891193 
323016603 
323379315 
323511833 
325112479 
325815953 
325911178 
326522509 
328911911 
329048043 
330703287 
331442524 
331481570 
332196774 
333020970 
333753031 
334119023 
336214932 
336806353 
340402411 
340518714 
340745455 
340821141 
341550511 
347369614 
347647445 
348015546 
352385255 
352959170 
353588614 
356313415 
358109018 
358729705 
358906493 
361181643 
361420692 
362546844 
364504649 
365242554 
365540296 
367815013 
368435499 
369070434 
370315872 
372210839 
372644964 
374705053 
375086881 
375889017 
377401616 
378591180 
379589262 
379928944 
380730191 
381026221 
381661785 
381899937 
381952490 
384002905 
384604547 
385024071 
386119653 
387942732 
389738014 
391253413 
393373595 
393783950 
394740019 
395634072 
396080229 
396163163 
398323035 
399411158 
400200311 
400993292 
401047126 
401176628 
402440437 
402492198 
402781269 
404385138 
404738491 
405306707 
406167467 
406429566 
406708744 
407576570 
407589976 
407694158 
408459236 
408847412 
409750495 
410482077 
410503791 
413267400 
415768586 
416193498 
417523754 
418190669 
419676013 
420914657 
422543726 
423532039 
423747131 
423766807 
423897651 
425953044 
425958708 
427929476 
429720222 
430777644 
431436798 
431919066 
432489177 
433284584 
434620812 
435209962 
436767945 
437120269 
441173287 
442156860 
446144765 
446309965 
448082166 
451078162 
451212403 
452930062 
453456112 
454291622 
454403720 
455320388 
456607023 
457030360 
458148033 
458277655 
459163994 
460043164 
461210966 
461266653 
463064182 
463564548 
463797073 
463848283 
464122413 
466319998 
466498240 
467149321 
467300712 
470094999 
471338717 
471664711 
471998114 
475550028 
477060824 
479177578 
479961891 
480475525 
481604097 
483402146 
484185663 
484275538 
484711161 
485162439 
488645178 
492849011 
492853408 
496026115 
499146906 
499457170 
502139541 
503013069 
503186341 
503693056 
503795899 
504199418 
504303089 
504390305 
505112376 
506067039 
507174250 
507296515 
507652354 
507913883 
508252888 
508302092 
508472538 
508650526 
510516944 
510798806 
511743719 
511886655 
513780283 
515871936 
516313439 
516479783 
517294207 
517405392 
517825773 
522455781 
522601195 
524112422 
525063053 
526220182 
528440808 
528506875 
529256384 
530132496 
531617571 
531682390 
532187510 
532783371 
533420087 
535158270 
535601830 
536168721 
537508999 
537936157 
539738402 
544873839 
545163164 
545674192 
548223467 
548395482 
549023787 
550423218 
550435191 
550541713 
551640906 
552423521 
552682993 
553087405 
553386361 
555082966 
558175628 
558528305 
558833707 
563352212 
564646178 
565955722 
566409911 
566749143 
567122241 
568957252 
570216196 
570404291 
571540509 
571832403 
572447018 
572809422 
574892791 
576288462 
580271140 
580391143 
580700132 
581358317 
582412882 
583092563 
583230817 
587227265 
587239131 
588131517 
588327783 
591811007 
591965711 
592132010 
592459987 
593612768 
594046568 
595956618 
597134762 
602149476 
602170484 
602286958 
602338724 
602593523 
603959009 
605568755 
605837049 
607403169 
607606542 
608161462 
609080832 
611117316 
611435024 
611679405 
614108598 
615810151 
616648807 
617546969 
619195988 
619384135 
620365554 
621417075 
622964806 
625449875 
627469854 
628441305 
628464046 
628608315 
629585987 
629879553 
630379022 
630527629 
631674400 
633682111 
634452614 
634897397 
636305365 
636558478 
636567502 
638151881 
638458268 
638690764 
639932933 
640372509 
640424537 
640683067 
640724670 
640864237 
641251831 
641636946 
644908486 
645989445 
646191040 
646232118 
646941836 
647220505 
649135303 
649542957 
651370964 
651473679 
652777932 
653434133 
654538993 
655811076 
659013937 
659510193 
660064314 
660198725 
662434909 
663275936 
664636690 
664704419 
666880756 
667079539 
667432264 
667952647 
668912164 
669508686 
670208264 
670469696 
672314035 
673083617 
675370544 
675456604 
675895095 
676290514 
677724840 
679083922 
680253522 
681245911 
681613159 
683060159 
684039522 
684557011 
686249689 
687678982 
688256681 
688382805 
690719682 
691523477 
691782945 
692037382 
692402560 
693179882 
693587820 
694293096 
694998069 
695384723 
696489863 
698728967 
701386958 
703909996 
705623605 
707535326 
708795303 
709000992 
710592595 
711259244 
711632047 
711893192 
712333409 
712855927 
713343611 
716327774 
716667461 
718684842 
719728403 
720150107 
720529886 
721383784 
721873160 
722779642 
723292010 
724998831 
725401288 
725486422 
726389393 
727457948 
727640055 
728497754 
729114789 
729560523 
732145086 
732564615 
733098200 
733481757 
735256770 
737318263 
737626535 
738416000 
741442443 
741740763 
744432527 
745246971 
745277055 
746675501 
746763949 
746984962 
747466057 
749351420 
749888750 
751125428 
751213089 
751574094 
751596886 
751631352 
751722462 
752250694 
752612139 
753517059 
753572118 
754302949 
755590217 
756817638 
756952681 
757799362 
758023627 
758903501 
760036155 
760270612 
760324084 
760473452 
761298875 
762314114 
762997299 
764410296 
764616206 
765785613 
768315491 
769291083 
769411115 
770105331 
770338253 
771067471 
771808136 
772434539 
773491740 
773492967 
774460982 
777674909 
779236010 
779788007 
780307032 
780528713 
782718437 
783698803 
784383082 
784751214 
785322333 
787234864 
787747171 
789491086 
789874403 
791324721 
791621689 
792804607 
793887579 
794543565 
795139071 
795679095 
796094608 
796259476 
798088757 
800939145 
801995293 
802861137 
803077520 
804733508 
807644750 
808292540 
809786073 
810598472 
811929132 
812825323 
813558623 
813787053 
816444373 
816560836 
817909667 
818223125 
818628872 
819225271 
820030385 
820738794 
822384509 
823358262 
823808136 
824128170 
825881271 
828239124 
828539253 
829108117 
829717100 
832405117 
832836128 
835132046 
835998708 
837153366 
838679796 
839423477 
840438670 
840521293 
840903401 
841941070 
842007310 
844856302 
847014766 
847032200 
847720192 
850494341 
850522965 
853258560 
854190009 
854216692 
854339057 
854712607 
855135700 
855274707 
855524328 
855836410 
856920366 
857289535 
857880563 
859106889 
859127464 
859509093 
859651559 
859860737 
861683856 
861954937 
863894986 
864539081 
864768797 
865359034 
866194421 
866572233 
869276332 
869810150 
871055835 
871097405 
871835964 
872161159 
873842332 
874543527 
874921365 
878439401 
881196922 
881916331 
882142214 
882153057 
884129916 
884156493 
884951080 
885574901 
887200084 
888232592 
890267986 
893947264 
898094999 
899571619 
900500992 
901015211 
901282027 
901284806 
904404278 
905219347 
906362618 
906780870 
908501458 
909109747 
910107543 
910922905 
913236720 
914021220 
914728534 
914896779 
915094828 
915100071 
916074394 
916534309 
918256384 
918504901 
919592562 
920514752 
923747302 
923817209 
923822630 
925065488 
926683495 
926951330 
927981377 
928314718 
928356944 
929134407 
929820949 
929877711 
930330381 
931435757 
932682370 
933336645 
933956202 
934080585 
934089419 
934092761 
934991244 
935111791 
936438248 
937630253 
938010047 
938453988 
938470676 
939342452 
941731647 
942740938 
943215719 
944093571 
944352035 
946117900 
949080295 
949631041 
950099622 
950584459 
950650026 
952209689 
953715298 
953906046 
953951155 
955492194 
955625759 
956076193 
956817742 
957152867 
958369783 
959498417 
960826298 
961481277 
963286814 
963548212 
964079563 
966517060 
968395039 
968727299 
971100906 
971203508 
973482586 
973487872 
974400240 
974847674 
976503126 
977417319 
979582859 
980254121 
981099679 
981654836 
983990952 
984915796 
985504959 
986150043 
986591436 
988114915 
988531490 
989529849 
990789814 
992295697 
992362609 
992733719 
993609353 
993617883 
995190796 
995657559 
996015935 

);





* p_agege15_ever_vaccinated n_death_hiv  ddaly  p_cur_any_vac_e_1564_  deathr_dol_r_first_uvl2 p_first_uvl2_dol_r
p_cur_full_vac_e_1564_ prop_elig_on_prep  prop_1564_hivneg_onprep  n_tested  p_diag  p_onart_diag  p_onart_vl1000_  incidence1549_;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;

%let nfit = 6000 ;

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


/*

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

run;quit;

* ods html close;

*/

/*

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

ods html close;
ods listing gpath="C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\cioa\";
ods graphics / reset imagename="discounted_cost" imagefmt=pdf;

proc sgplot data=d noautolegend;
* Title '';  * Title    height=1.5 justify=center "Discounted cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Discounted Cost $m'		labelattrs=(size=12)  values = (0 to  300         by 50    ) valueattrs=(size=10);

loess   x=cald y=p50_dcost_0 / lineattrs = (color=grey thickness = 4) nomarkers;
band    x=cald lower=p5_dcost_0 upper=p95_dcost_0 /  fillattrs = (color=grey) legendlabel= "90% range";

loess   x=cald y=p50_dcost_1 / lineattrs = (color=blue      thickness = 4) nomarkers;
band    x=cald lower=p5_dcost_1 upper=p95_dcost_1 / fillattrs = (color=blue     ) legendlabel= "90% range";

run;

ods listing close;
ods html close;

*/

  

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

  

/*

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

*/

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
