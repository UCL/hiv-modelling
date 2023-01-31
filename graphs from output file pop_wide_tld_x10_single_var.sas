
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\pop_wide_tld\";

  proc printto ; * log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\pop_wide_tld\log1";

data b;
 set a.l_pwt_x10a  a.l_pwt_x10b  a.l_pwt_x10c   ;

* for the 1000 setting scenarios;
if run in (
2798600 
6067731 
6735648 
7746417 
9506444 
13720777 
16264074 
19713314 
20425815 
22614227 
25336543 
26140109 
29171988 
34180684 
34774078 
40276952 
42866169 
46735890 
48943992 
50553927 
51941622 
56175471 
62841381 
65510975 
66647458 
74537481 
74869514 
76504087 
82107791 
82157258 
83192485 
91239277 
96017992 
97141217 
98502734 
102816970 
103769835 
108085157 
108097865 
123080767 
125158365 
128678360 
130871979 
146502299 
147501100 
150172205 
162992154 
166168308 
170349040 
173147982 
175488576 
176022459 
184572500 
186414382 
188316021 
193195018 
195895952 
200454473 
209003474 
212186439 
213570130 
215825964 
216388215 
218188494 
221495617 
223466598 
224598960 
226072064 
229141063 
233617699 
238947628 
240324762 
241857762 
242464527 
242660032 
247065439 
249182657 
249302104 
266989697 
271365438 
275358327 
283726851 
284267218 
284813058 
291605003 
298435431 
299593288 
307631651 
310472933 
314424159 
314946205 
315966468 
317156153 
320510032 
320613438 
322472940 
323388641 
323823530 
334400038 
335359383 
337908242 
346994932 
350951286 
350982208 
351842900 
354463061 
355981119 
359627658 
361749701 
363745239 
367607962 
369488611 
370118709 
370274933 
371214848 
374019784 
376035807 
376718018 
382990193 
384266143 
387452986 
388611681 
389661873 
391195318 
398472882 
402533894 
404244258 
404522518 
405759374 
412510407 
417459622 
425290323 
427304769 
428513244 
429688715 
432439320 
432897278 
433775576 
434861531 
438736225 
444553241 
447079407 
447237910 
450724839 
454881011 
456402194 
456893829 
458279378 
459372609 
464420316 
466024180 
467373636 
467934429 
470733624 
483321367 
485948976 
488231467 
490986783 
491009956 
496137012 
498448408 
499197167 
500347503 
500607524 
500786425 
502000388 
506267516 
506685331 
506983097 
508309384 
514926865 
524591981 
531860771 
532915612 
533011956 
534198585 
536405434 
537365694 
537488169 
538243436 
538931030 
539969923 
543536521 
546717382 
556167078 
559046400 
559447094 
565058567 
565502913 
567404555 
572481699 
573143552 
580028202 
585248120 
585630924 
585902249 
586295114 
589928738 
590421018 
590888437 
595959606 
600444431 
601361413 
604068890 
608420442 
608911949 
609972026 
610442522 
610973738 
618395535 
623580961 
623901053 
628590852 
629192897 
633760832 
635750382 
639554546 
651494799 
653423019 
660794049 
662420100 
666804712 
670842998 
671549908 
673414080 
674233506 
676197428 
676302366 
676421629 
678600193 
683063152 
683693332 
684417970 
685687341 
686758458 
688203897 
689231646 
696450254 
701162067 
702195520 
710875429 
714073024 
714334870 
715128312 
724714322 
725213138 
725580564 
728756930 
730452125 
731826911 
732408571 
741699015 
743901624 
748179081 
752687211 
753072133 
754896979 
759737181 
760931392 
765332263 
765612509 
767373596 
767879493 
770388593 
770576204 
770768722 
773110569 
774057811 
774940725 
775210854 
780058072 
781959392 
782110595 
786784748 
787396938 
788427953 
791172281 
791413540 
792870749 
793143488 
793806630 
797674865 
803149019 
805079939 
805844615 
807654492 
807786898 
808093618 
810749508 
811357318 
821416384 
821838323 
823657974 
827055969 
829398888 
831769023 
843560182 
851920399 
861736224 
865796942 
866304008 
868162830 
870811971 
871105383 
877664410 
878351749 
879216683 
880959318 
881082746 
882738190 
883240530 
885913332 
886761149 
892318925 
892476728 
892574572 
892836750 
893057296 
898578681 
903033142 
906765468 
907381393 
910330617 
910413262 
911829794 
912879766 
914546891 
918852087 
922779139 
924961156 
927596613 
932539131 
935937215 
936911181 
937311532 
940015610 
944463080 
946997331 
949111499 
950972569 
951653694 
955521952 
2312550 
5098465 
6080101 
6278049 
8003684 
10273015 
11326229 
12077866 
12253917 
12422082 
16128570 
16838158 
18120617 
20654193 
24554562 
28277201 
32325200 
33522266 
34289855 
35431098 
37986864 
41602326 
47273816 
51513435 
54257435 
54306553 
56004338 
58858718 
59658633 
60627242 
66128059 
66475183 
68952443 
69219516 
72933770 
73151782 
76354162 
78098743 
78973629 
86444320 
90494982 
92209611 
92424904 
97475068 
101317016 
104488522 
109562403 
111274186 
112861901 
115872970 
117338571 
118456734 
119765878 
123192642 
127059732 
127731735 
130145342 
133321556 
142602687 
145650589 
149949007 
151433404 
153366648 
155539633 
159004101 
162923444 
163651600 
174093140 
174928818 
180998240 
181176228 
181829148 
184363346 
188390051 
188634960 
194194215 
194508373 
196709963 
199098282 
199736564 
203058359 
210525949 
212571522 
216468208 
218602633 
221592108 
230140409 
231236564 
232592918 
233300559 
234799392 
235016385 
235293351 
236131024 
237545003 
240669595 
242462945 
242643882 
244026518 
244429022 
244626141 
248294261 
250032931 
252842609 
255010820 
255673078 
257408798 
258281541 
260441499 
260604627 
263220004 
263325815 
264150835 
268534861 
270098592 
270392942 
270886517 
278664764 
287503317 
292301184 
296095260 
296701368 
296991650 
297758104 
299649408 
302641807 
309982007 
314030185 
314882588 
318695060 
319803252 
324086271 
324557515 
325631852 
326581771 
331933538 
333886347 
334144338 
334585928 
335626965 
336266018 
338743520 
347765496 
348042936 
349222689 
349334111 
352974023 
353747748 
358194874 
358602603 
358842370 
361145599 
362049273 
362222343 
363796975 
366037464 
367470577 
367805557 
373894101 
373912894 
380914928 
381779111 
382050709 
383186436 
383539811 
386795544 
387390916 
388022052 
388815831 
389121973 
391326229 
391503924 
393268384 
394339607 
400849244 
404186526 
407315358 
408156957 
409193908 
410914118 
414319903 
417045323 
417266372 
417605471 
418207516 
419417632 
421090451 
425398931 
427956383 
428334227 
429298358 
433508574 
434506825 
435729746 
439357233 
440076259 
450614339 
452156767 
454960294 
455010296 
460047065 
461718764 
462311149 
462377368 
463931066 
468401301 
468703360 
468992014 
470324544 
471663083 
472249288 
472445847 
476073457 
476428747 
477031148 
478166482 
483122036 
487800565 
489393690 
489496820 
490024626 
494798610 
494828509 
495721155 
496097177 
496262955 
497306237 
498232769 
500130285 
501533364 
506372581 
507850584 
509757176 
510762961 
512575751 
516691401 
518987389 
522446810 
523689734 
525077106 
526519149 
529839502 
532725628 
533097861 
533960148 
534601561 
538838514 
538901000 
541065715 
542396311 
544587584 
545609649 
550059816 
551395935 
553016077 
554065093 
554878834 
556031922 
566004351 
566351838 
571944846 
574848567 
578562211 
580912767 
583621629 
585577180 
586869114 
588172728 
591935325 
594326184 
597913559 
602787154 
603728001 
605286497 
615229146 
621405738 
623997103 
624098506 
624718606 
625492478 
625540827 
627133803 
631216144 
631686474 
632816788 
634284837 
636324021 
639330147 
647419184 
648197828 
648203310 
649629961 
650533292 
655828264 
656183446 
658315874 
658477217 
660014366 
661543228 
661564353 
661591803 
665741364 
667993987 
668670946 
670411138 
672182870 
672894431 
673427420 
673864870 
675506614 
681421348 
696770181 
698471021 
699326756 
700270647 
705215225 
707816948 
709821264 
710043565 
717269961 
720365600 
728439377 
730468078 
732335849 
747418500 
754813471 
756869528 
761275831 
761296425 
763227968 
763245999 
763787856 
764016575 
767801926 
768340478 
768392678 
769047977 
770267348 
773461507 
773965560 
776339761 
776489612 
777918623 
778128576 
780001020 
783179868 
786157012 
786200590 
791604817 
791748091 
792742982 
793876305 
794680404 
795930459 
796501831 
796893152 
800897897 
802143207 
802212087 
806433492 
811631802 
813216233 
819667878 
821063717 
825609183 
825875583 
827028407 
830706735 
832135815 
836072359 
836283033 
842042700 
850593808 
851070907 
853705391 
857474843 
860850321 
862969093 
863052130 
864640909 
866204391 
869818620 
871862949 
873783259 
876835338 
876963753 
879577428 
882493141 
882838423 
884824898 
885542143 
891936786 
897600738 
900031341 
902059817 
906589122 
908409989 
908769521 
913905600 
914348664 
915378809 
917870810 
919727487 
920121946 
922227865 
922472782 
922614947 
930805365 
934184993 
938346402 
939449094 
939883695 
942342316 
942755659 
945831377 
947128791 
947189710 
949063342 
959661645 
960786067 
961560602 
967956116 
969446436 
970846732 
970914843 
4253362 
6326094 
6983864 
8045006 
11918085 
14891150 
17289339 
17345656 
19573530 
25373659 
29628144 
34474368 
34728089 
37293831 
43763092 
46762879 
48716083 
48937355 
52763855 
63235331 
64282239 
69359002 
72311996 
85335830 
86358719 
89330951 
93210704 
97017881 
100101127 
100164734 
100695712 
101193026 
111418529 
114667716 
118501530 
124796204 
128950746 
145181589 
146276759 
167156193 
168509091 
171580567 
176750577 
177846575 
185000987 
191578178 
196102426 
196217119 
196499113 
203551560 
207673790 
212869809 
218223489 
218744842 
219476779 
224391598 
224801132 
225167249 
226988202 
228586876 
229877562 
230129104 
230432934 
232213713 
234343415 
237819334 
241178486 
245519185 
247294011 
248228492 
252105281 
257553533 
261412664 
264252402 
266343185 
267007832 
267859324 
280950514 
281147262 
285647255 
291908329 
296724343 
306895723 
308272948 
310481770 
310981584 
311379899 
311466832 
313422859 
314626112 
319463355 
319850389 
322469600 
322651183 
326312732 
345647417 
349840940 
351246070 
354805178 
355760531 
355894168 
356168447 
359224362 
360611746 
365313437 
367307337 
371925733 
372957393 
380416227 
380886254 
385905618 
386193677 
390730045 
393770551 
398179827 
398958548 
412276561 
415331691 
417732263 
421508270 
424043106 
431633927 
434307742 
437267839 
437745609 
442714205 
446907067 
447605341 
447692279 
449630731 
452170464 
455514166 
462647431 
463362675 
470022593 
475289032 
481407115 
485217928 
487039025 
487090126 
487430564 
497369835 
497998726 
501295226 
516228318 
531019269 
537608674 
541540282 
546718953 
558894028 
560151801 
564769056 
573661549 
576147639 
581663072 
583124320 
585531442 
590237987 
590904726 
600613239 
603260397 
607228123 
614627529 
624916057 
625586859 
638590836 
640056022 
644175528 
644690632 
644998923 
645707516 
649642533 
652508433 
653112823 
653851206 
666787259 
669383114 
674312348 
682056186 
685200129 
686514953 
692939685 
696153696 
698681114 
704656004 
705125009 
717448747 
726469565 
727337758 
728958770 
731278272 
734504289 
738204002 
740351025 
746840615 
765398391 
767712385 
770284412 
770521211 
774976896 
789977218 
790053925 
795135881 
804669312 
806323891 
813325142 
817621708 
829699643 
830615747 
830939168 
835874780 
837955625 
838639313 
840325891 
843814033 
850488881 
873615582 
880860871 
880947959 
883615710 
886882377 
886921281 
888791741 
898435752 
921382392 
924050609 
925662081 
929585898 
958765519 
959644295 
964645751 
967552463 
972534905 
);

if prop_elig_on_prep = . then prop_elig_on_prep = 0;
n_k65m = p_k65m * n_hiv;
p_vl1000_ = p_vl1000;
incidence1549_ = incidence1549;
prevalence1549_ = prevalence1549;
prevalence_vg1000_ = prevalence_vg1000;
p_onart_vl1000_ = p_onart_vl1000;
n_cd4_lt200_ = n_cd4_lt200;
n_dead_hivpos_cause1_ = n_dead_hivpos_cause1;
n_hiv_undiag = (1 - (p_diag/100)) * n_hiv ;
prev_vg1000_1549_ = prev_vg1000_1549;

/*
ods html;
title 'Scatter plot of prevalence of population viraemia and incidence - population viraemia range to 15%'; 
proc sgplot;
xaxis label	= 'Population viraemia (proportion of adult population with VL > 1000)'		; 
yaxis label	= 'HIV Incidence (per 100 person years)' ;
scatter x=prevalence_vg1000 y=incidence1549;
where 2020 <= cald < 2023 and prevalence_vg1000 < 0.15  and option=0;
run;
title 'Scatter plot of prevalence of population viraemia and incidence - population viraemia range to 10%'; 
proc sgplot;
xaxis label	= 'Population viraemia (proportion of adult population with VL > 1000)'		; 
yaxis label	= 'HIV Incidence (per 100 person years)' ;
scatter x=prevalence_vg1000 y=incidence1549;
where 2020 <= cald < 2023 and prevalence_vg1000 < 0.1  and option=0;
run;
title 'Scatter plot of prevalence of population viraemia and incidence - population viraemia range to 5%'; 
proc sgplot;
xaxis label	= 'Population viraemia (proportion of adult population with VL > 1000)'		; 
yaxis label	= 'HIV Incidence (per 100 person years)' ;
scatter x=prevalence_vg1000 y=incidence1549;
where 2020 <= cald < 2023 and prevalence_vg1000 < 0.05  and option=0;
run;
title 'Scatter plot of prevalence of population viraemia and incidence - population viraemia range to 2%'; 
proc sgplot;
xaxis label	= 'Population viraemia (proportion of adult population with VL > 1000)'		; 
yaxis label	= 'HIV Incidence (per 100 person years)' ;
scatter x=prevalence_vg1000 y=incidence1549;
where 2020 <= cald < 2023 and prevalence_vg1000 < 0.02  and option=0;
run;
title 'Scatter plot of prevalence of population viraemia and incidence - population viraemia range to 1%'; 
proc sgplot;
xaxis label	= 'Population viraemia (proportion of adult population with VL > 1000)'		; 
yaxis label	= 'HIV Incidence (per 100 person years)' ;
scatter x=prevalence_vg1000 y=incidence1549;
where 2020 <= cald < 2023 and prevalence_vg1000 < 0.01  and option=0;
run;
ods html close;
*/

* n_death_hiv = n_death_hiv_inf_pre_year_interv + n_death_hiv_inf_post_year_interv;

%let single_var =  incidence1549_   ; * p_elig_hivneg_onprep s_pop_wide_tld_neg_prep_inelig  s_pop_wide_tld_prep  n_death_hiv_inf_post_year_interv  n_death_hiv_inf_pre_year_interv ;


* if prep_dependent_prev_vg1000 = 1 and prep_vlg1000_threshold = 0.01;
* if prep_dependent_prev_vg1000 = 0 ;
* if rate_choose_stop_prep_oral = 0.30; 
* if artvis0_lower_adh ne 1 ;
* if rate_int_choice = 0.002 ;
* if pop_wide_tld_selective_hiv = 5 ;
* if low_prep_inj_uptake = 1;
* if prob_prep_pop_wide_tld = 0.5 ;


/*

proc genmod; 
class run;
model prop_hivneg_onprep = 
prevalence1549
prob_tld_prep_if_untested an_lin_incr_test date_test_rate_plateau
p_hard_reach_w hard_reach_higher_in_men  pref_prep_oral_beta_s1 rate_choose_stop_prep_oral prob_prep_any_restart_choice  ;
where 2023 <= cald and option=3; 
repeated subject=run;
run;

*/

proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 1200   ;
%let year_end = 2070.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option ge 1 then delete;

%let var =  &single_var ; 

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
if option =1;

%let var = &single_var ; 
run;


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
merge g1  h1   ;
by cald;

ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods html ;


/*
* p_pop_wide_tld_hiv ;			p_pop_wide_tld_hiv = s_pop_wide_tld_hiv / s_pop_wide_tld_prep ;
* n_pop_wide_tld_hiv ;			n_pop_wide_tld_hiv = n_pop_wide_tld_hiv * &sf ;
* p_pop_wide_tld_prep_elig ;	p_pop_wide_tld_prep_elig = s_pop_wide_tld_prep_elig / s_pop_wide_tld_prep ;
* n_pop_wide_tld_prep_elig ;	n_pop_wide_tld_prep_elig = s_pop_wide_tld_prep_elig * &sf ;
* p_pop_tld_neg_prep_inel;	p_pop_tld_neg_prep_inel = s_pop_wide_tld_neg_prep_inelig / s_pop_wide_tld_prep ;
* n_pop_tld_neg_prep_inel;	n_pop_tld_neg_prep_inel = s_pop_wide_tld_neg_prep_inelig * &sf ;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "of hiv negative people taking tld, proportion without a prevention indication (so no indication)" ;
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1 ) valueattrs=(size=10);

  label p50_p_pop_tld_neg_prep_inel_0 = "No community TLD/PEP (median)";
  label p50_p_pop_tld_neg_prep_inel_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_pop_tld_neg_prep_inel_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_pop_tld_neg_prep_inel_0 	upper=p95_p_pop_tld_neg_prep_inel_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_pop_tld_neg_prep_inel_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_pop_tld_neg_prep_inel_1 	upper=p95_p_pop_tld_neg_prep_inel_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "of people without an hiv diagnosis taking tld, proportion with a prevention indication";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1 ) valueattrs=(size=10);

  label p50_p_pop_wide_tld_prep_elig_0 = "No community TLD/PEP (median)";
  label p50_p_pop_wide_tld_prep_elig_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_pop_wide_tld_prep_elig_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_pop_wide_tld_prep_elig_0 	upper=p95_p_pop_wide_tld_prep_elig_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_pop_wide_tld_prep_elig_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_pop_wide_tld_prep_elig_1 	upper=p95_p_pop_wide_tld_prep_elig_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "........";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n'		labelattrs=(size=12)  values = (0 to 3000     by 1000 ) valueattrs=(size=10);

  label p50_s_pop_wide_tld_prep_0 = "No community TLD/PEP (median)";
  label p50_s_pop_wide_tld_prep_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_s_pop_wide_tld_prep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_s_pop_wide_tld_prep_0 	upper=p95_s_pop_wide_tld_prep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_s_pop_wide_tld_prep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_s_pop_wide_tld_prep_1 	upper=p95_s_pop_wide_tld_prep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "........";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n'		labelattrs=(size=12)  values = (0 to 3000     by 1000 ) valueattrs=(size=10);

  label p50_s_pop_wide_tld_prep_elig_0 = "No community TLD/PEP (median)";
  label p50_s_pop_wide_tld_prep_elig_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_s_pop_wide_tld_prep_elig_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_s_pop_wide_tld_prep_elig_0 	upper=p95_s_pop_wide_tld_prep_elig_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_s_pop_wide_tld_prep_elig_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_s_pop_wide_tld_prep_elig_1 	upper=p95_s_pop_wide_tld_prep_elig_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_pop_wide_tld_prep_elig";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1000000  by 100000) valueattrs=(size=10);

  label p50_n_pop_wide_tld_prep_elig_0 = "No community TLD/PEP (median)";
  label p50_n_pop_wide_tld_prep_elig_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_pop_wide_tld_prep_elig_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_prep_elig_0 	upper=p95_n_pop_wide_tld_prep_elig_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_pop_wide_tld_prep_elig_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_prep_elig_1 	upper=p95_n_pop_wide_tld_prep_elig_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_oral_willing";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 20000000  by 1000000) valueattrs=(size=10);

  label p50_n_prep_oral_willing_0 = "No community TLD/PEP (median)";
  label p50_n_prep_oral_willing_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_prep_oral_willing_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_prep_oral_willing_0 	upper=p95_n_prep_oral_willing_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_oral_willing_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_prep_oral_willing_1 	upper=p95_n_prep_oral_willing_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

  

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "s_alive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 20000000  by 1000000) valueattrs=(size=10);

  label p50_s_alive_0 = "No community TLD/PEP (median)";
  label p50_s_alive_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_s_alive_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_s_alive_0 	upper=p95_s_alive_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_s_alive_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_s_alive_1 	upper=p95_s_alive_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

 
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "of people without an hiv diagnosis taking tld, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.10  by 0.01) valueattrs=(size=10);

  label p50_p_pop_wide_tld_hiv_0 = "No community TLD/PEP (median)";
  label p50_p_pop_wide_tld_hiv_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_pop_wide_tld_hiv_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_pop_wide_tld_hiv_0 	upper=p95_p_pop_wide_tld_hiv_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_pop_wide_tld_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_pop_wide_tld_hiv_1 	upper=p95_p_pop_wide_tld_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

 


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV negative adults taking ARVs";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15  by 0.05) valueattrs=(size=10);

  label p50_prop_hivneg_onprep_0 = "No community TLD/PEP (median)";
  label p50_prop_hivneg_onprep_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_prop_hivneg_onprep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_prop_hivneg_onprep_0 	upper=p95_prop_hivneg_onprep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prop_hivneg_onprep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prop_hivneg_onprep_1 	upper=p95_prop_hivneg_onprep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV negative adults (age 1564) taking PrEP/PEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15  by 0.05) valueattrs=(size=10);

  label p50_prop_1564_hivneg_onprep_0 = "No community TLD/PEP (median)";
  label p50_prop_1564_hivneg_onprep_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_prop_1564_hivneg_onprep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_prop_1564_hivneg_onprep_0 	upper=p95_prop_1564_hivneg_onprep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prop_1564_hivneg_onprep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prop_1564_hivneg_onprep_1 	upper=p95_prop_1564_hivneg_onprep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



* p_elig_all_prep_criteria  p_elig_all_prep_cri_hivneg  p_elig_hivneg_onprep  p_prep_elig_onprep_inj ;

  

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of HIV negative people who have an indication for PrEP and are taking PrEP, proportion on cab-la";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1  ) valueattrs=(size=10);

  label p50_p_prep_elig_onprep_inj_0 = "No community TLD/PEP (median)";
  label p50_p_prep_elig_onprep_inj_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_prep_elig_onprep_inj_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_prep_elig_onprep_inj_0 	upper=p95_p_prep_elig_onprep_inj_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_prep_elig_onprep_inj_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_prep_elig_onprep_inj_1 	upper=p95_p_prep_elig_onprep_inj_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of HIV negative people who have an indication for PrEP, proportion on PREP/PEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1  ) valueattrs=(size=10);

  label mean_p_elig_hivneg_onprep_0 = "No community TLD/PEP (median)";
  label mean_p_elig_hivneg_onprep_1 = "Community TLD/PEP (median)";
  
  series  x=cald y=mean_p_elig_hivneg_onprep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_elig_hivneg_onprep_0 	upper=p95_p_elig_hivneg_onprep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=mean_p_elig_hivneg_onprep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_elig_hivneg_onprep_1 	upper=p95_p_elig_hivneg_onprep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people who have an indication for PrEP, proportion on PREP/PEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1  ) valueattrs=(size=10);

  label p50_prop_elig_on_prep_0 = "No community TLD/PEP (median)";
  label p50_prop_elig_on_prep_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_prop_elig_on_prep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_on_prep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prop_elig_on_prep_1 	upper=p95_prop_elig_on_prep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_prep_hivneg";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1  ) valueattrs=(size=10);

  label p50_p_newp_prep_hivneg_0 = "No community TLD/PEP (median)";
  label p50_p_newp_prep_hivneg_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_newp_prep_hivneg_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_newp_prep_hivneg_0 	upper=p95_p_newp_prep_hivneg_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_prep_hivneg_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_newp_prep_hivneg_1 	upper=p95_p_newp_prep_hivneg_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "dcost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '$m per year' 	labelattrs=(size=12)  values = (0 to 250   by  50  ) valueattrs=(size=10);

  label p50_dcost_0 = "No community TLD/PEP (median)";
  label p50_dcost_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_dcost_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_dcost_0 	upper=p95_dcost_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_dcost_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_dcost_1 	upper=p95_dcost_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "daly";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '$m per year' 	labelattrs=(size=12)  values = (0 to 7000000   by  100000  ) valueattrs=(size=10);

  label p50_daly_0 = "No community TLD/PEP (median)";
  label p50_daly_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_daly_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_daly_0 	upper=p95_daly_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_daly_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_daly_1 	upper=p95_daly_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

  

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "ddaly";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '$m per year' 	labelattrs=(size=12)  values = (1000000 to 3000000   by  500000  ) valueattrs=(size=10);

  label p50_ddaly_0 = "No community TLD/PEP (median)";
  label p50_ddaly_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_ddaly_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_ddaly_0 	upper=p95_ddaly_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_ddaly_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_ddaly_1 	upper=p95_ddaly_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '$m per year' 	labelattrs=(size=12)  values = (0 to 500   by  50  ) valueattrs=(size=10);

  label p50_cost_0 = "No community TLD/PEP (median)";
  label p50_cost_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_cost_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_cost_0 	upper=p95_cost_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_cost_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_cost_1 	upper=p95_cost_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = (50 to 100   by  5  ) valueattrs=(size=10);

  label p50_p_diag_0 = "No community TLD/PEP (median)";
  label p50_p_diag_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_diag_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV diagnosed people on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0.5 to 1   by  0.05  ) valueattrs=(size=10);

  label p50_p_onart_diag_0 = "No community TLD/PEP (median)";
  label p50_p_onart_diag_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_onart_diag_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_onart_diag_0 	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_onart_diag_1 	upper=p95_p_onart_diag_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0.5 to 1   by  0.05  ) valueattrs=(size=10);

  label p50_p_onart_0 = "No community TLD/PEP (median)";
  label p50_p_onart_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_onart_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_onart_0 	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_onart_1 	upper=p95_p_onart_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

  

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of all people with HIV, proportion with integrase inhibitor resistance";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0   to 0.3 by  0.05  ) valueattrs=(size=10);

  label p50_p_iime_0 = "No community TLD/PEP (median)";
  label p50_p_iime_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_iime_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_iime_0 	upper=p95_p_iime_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_iime_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_iime_1 	upper=p95_p_iime_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Total number of people with integrase inhibitor resistant HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0   to 300000 by  10000  ) valueattrs=(size=10);

  label p50_n_cur_res_cab_0 = "No community TLD/PEP (median)";
  label p50_n_cur_res_cab_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_cur_res_cab_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_cur_res_cab_0 	upper=p95_n_cur_res_cab_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_cur_res_cab_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_cur_res_cab_1 	upper=p95_n_cur_res_cab_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

 run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0  to 1   by  0.05  ) valueattrs=(size=10);

  label p50_p_vl1000__0 = "No community TLD/PEP (median)";
  label p50_p_vl1000__1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;

*/

title '';
ods html;
proc sgplot data=d; 
* Title    height=1.5 justify=center "HIV incidence in people aged 1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2042 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Rate per 100 person years' 	labelattrs=(size=12)  values = ( 0 to 0.8     by  0.1  ) valueattrs=(size=10);

  label p50_incidence1549__0 = "No community TLD (median)";
  label p50_incidence1549__1 = "Community TLD (median)";

  series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black   thickness = 3);
  band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color= black  ) legendlabel= "90% range";
  series  x=cald y=p50_incidence1549__1/	lineattrs = (color=verydarkred thickness = 3);
  band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=verydarkred) legendlabel= "90% range";

run;

/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "HIV prevalence in people aged 1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 0.20     by  0.01  ) valueattrs=(size=10);

  label p50_prevalence1549__0 = "No community TLD/PEP (median)";
  label p50_prevalence1549__1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence of VL > 1000 in whole adult population (HIV+ and HIV-)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	  valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 0.1      by  0.01  ) valueattrs=(size=10);

  label p50_prevalence_vg1000__0 = "No community TLD/PEP (median)";
  label p50_prevalence_vg1000__1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence of VL > 1000 in whole adult population 15-49 (HIV+ and HIV-)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	  valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 0.1      by  0.01  ) valueattrs=(size=10);

  label p50_prev_vg1000_1549__0 = "No community TLD/PEP (median)";
  label p50_prev_vg1000_1549__1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_prev_vg1000_1549__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_prev_vg1000_1549__0 	upper=p95_prev_vg1000_1549__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prev_vg1000_1549__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prev_vg1000_1549__1 	upper=p95_prev_vg1000_1549__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number' 	labelattrs=(size=12)  values = ( 0 to 100000    by  5000  ) valueattrs=(size=10);

  label p50_n_death_hiv_0 = "No community TLD/PEP (median)";
  label p50_n_death_hiv_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;



* n_cd4_lt200 aids_death_rate  death_rate_onart  death_rate_artexp  death_rate_hiv death_rate_hiv_all ;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 200000    by  50000  ) valueattrs=(size=10);

  label p50_n_cd4_lt200__0 = "No community TLD/PEP (median)";
  label p50_n_cd4_lt200__1 = "Community TLD/PEP (median)";
 
   series  x=cald y=p50_n_cd4_lt200__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_cd4_lt200__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_cd4_lt200__1 	upper=p95_n_cd4_lt200__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "aids_death_rate";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2028      by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 3.5  by  0.5  ) valueattrs=(size=10);

  label mean_aids_death_rate_0 = "No community TLD/PEP (median)";
  label mean_aids_death_rate_1 = "Community TLD/PEP (median)";

 
  series  x=cald y=mean_aids_death_rate_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_aids_death_rate_0 	upper=p95_aids_death_rate_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=mean_aids_death_rate_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_aids_death_rate_1 	upper=p95_aids_death_rate_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
 run;

  

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "death_rate_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 5    by  0.5  ) valueattrs=(size=10);

  label p50_death_rate_hiv_0 = "No community TLD/PEP (median)";
  label p50_death_rate_hiv_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_death_rate_hiv_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_0 	upper=p95_death_rate_hiv_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_death_rate_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_1 	upper=p95_death_rate_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "death_rate_hiv_all";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 0.5  by  0.1  ) valueattrs=(size=10);

  label p50_death_rate_hiv_all_0 = "No community TLD/PEP (median)";
  label p50_death_rate_hiv_all_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_death_rate_hiv_all_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_all_0 	upper=p95_death_rate_hiv_all_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_death_rate_hiv_all_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_all_1 	upper=p95_death_rate_hiv_all_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "number of hiv negative or hiv positive undiagnosed taking prep/pep/tld";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000   by 100000 ) valueattrs=(size=10);

  label p50_n_pop_wide_tld_prep_0 = "No community TLD/PEP (median)";
  label p50_n_pop_wide_tld_prep_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_pop_wide_tld_prep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_prep_0 	upper=p95_n_pop_wide_tld_prep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_pop_wide_tld_prep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_prep_1 	upper=p95_n_pop_wide_tld_prep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "number of hiv negative or hiv positive undiagnosed taking prep/pep/tld";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000   by 100000 ) valueattrs=(size=10);

  label p50_n_prep_any_0 = "No community TLD/PEP (median)";
  label p50_n_prep_any_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_prep_any_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_prep_any_0 	upper=p95_n_prep_any_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_prep_any_1 	upper=p95_n_prep_any_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_onart";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000   by 100000 ) valueattrs=(size=10);

  label p50_n_onart_0 = "No community TLD/PEP (median)";
  label p50_n_onart_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_onart_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_onart_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "number living with undiagnosed hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 300000   by 100000 ) valueattrs=(size=10);

  label p50_n_hiv_undiag_0 = "No community TLD/PEP (median)";
  label p50_n_hiv_undiag_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_hiv_undiag_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_hiv_undiag_0 	upper=p95_n_hiv_undiag_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_undiag_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_hiv_undiag_1 	upper=p95_n_hiv_undiag_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "number living with hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1300000   by 100000 ) valueattrs=(size=10);

  label p50_n_hiv_0 = "No community TLD/PEP (median)";
  label p50_n_hiv_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_hiv_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_hiv_1 	upper=p95_n_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of adult population taking ARVs for prevention or treatment";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.25  by 0.05) valueattrs=(size=10);

  label p50_prop_art_or_prep_0 = "No community TLD/PEP (median)";
  label p50_prop_art_or_prep_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_prop_art_or_prep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_prop_art_or_prep_0 	upper=p95_prop_art_or_prep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prop_art_or_prep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prop_art_or_prep_1 	upper=p95_prop_art_or_prep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_art_or_prep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 3000000  by 1000000 ) valueattrs=(size=10);

  label p50_n_art_or_prep_0 = "No community TLD/PEP (median)";
  label p50_n_art_or_prep_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_art_or_prep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_art_or_prep_0 	upper=p95_n_art_or_prep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_art_or_prep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_art_or_prep_1 	upper=p95_n_art_or_prep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;



ods html close;


 
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on cab-la";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000   by 100000 ) valueattrs=(size=10);

  label p50_n_prep_inj_0 = "No community TLD/PEP (median)";
  label p50_n_prep_inj_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_prep_inj_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_prep_inj_0 	upper=p95_n_prep_inj_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_inj_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_prep_inj_1 	upper=p95_n_prep_inj_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

ods html close;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_hivneg_anycause";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 320000    by  10000  ) valueattrs=(size=10);

  label p50_n_death_hivneg_anycause_0 = "No community TLD/PEP (median)";
  label p50_n_death_hivneg_anycause_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_death_hivneg_anycause_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_death_hivneg_anycause_0 	upper=p95_n_death_hivneg_anycause_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hivneg_anycause_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_death_hivneg_anycause_1 	upper=p95_n_death_hivneg_anycause_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;

  



proc sgplot data=d; 
Title    height=1.5 justify=center "Number who started cab-la PrEP while having HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number' 	labelattrs=(size=12)  values = ( 0 to 1000    by  100    ) valueattrs=(size=10);

  label mean_n_started_prep_inj_hiv_0 = "No community TLD/PEP (median)";
  label mean_n_started_prep_inj_hiv_1 = "Community TLD/PEP (median)";

  series  x=cald y=mean_n_started_prep_inj_hiv_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_started_prep_inj_hiv_0 	upper=p95_n_started_prep_inj_hiv_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=mean_n_started_prep_inj_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_started_prep_inj_hiv_1 	upper=p95_n_started_prep_inj_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number who started any PrEP/PEP while having HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number' 	labelattrs=(size=12)  values = ( 0 to 10000   by  1000   ) valueattrs=(size=10);

  label mean_n_started_prep_any_hiv_0 = "No community TLD/PEP (median)";
  label mean_n_started_prep_any_hiv_1 = "Community TLD/PEP (median)";

  series  x=cald y=mean_n_started_prep_any_hiv_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_started_prep_any_hiv_0 	upper=p95_n_started_prep_any_hiv_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=mean_n_started_prep_any_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_started_prep_any_hiv_1 	upper=p95_n_started_prep_any_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;


proc sgplot data=d; 
Title    height=1.5 justify=center "Numnber of HIV positive people taking TLD without having been diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number' 	labelattrs=(size=12)  values = ( 0 to 500000   by  50000 ) valueattrs=(size=10);

  label p50_n_pop_wide_tld_hiv_0 = "No community TLD/PEP (median)";
  label p50_n_pop_wide_tld_hiv_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_n_pop_wide_tld_hiv_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_hiv_0 	upper=p95_n_pop_wide_tld_hiv_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_pop_wide_tld_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_hiv_1 	upper=p95_n_pop_wide_tld_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of people taking TLD who are HIV negative or HIV+ and undiagnosed, proportion HIV+ and undiagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number' 	labelattrs=(size=12)  values = ( 0 to 1        by  0.1    ) valueattrs=(size=10);

  label p50_p_pop_wide_tld_hiv_0 = "No community TLD/PEP (median)";
  label p50_p_pop_wide_tld_hiv_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_pop_wide_tld_hiv_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_pop_wide_tld_hiv_0 	upper=p95_p_pop_wide_tld_hiv_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_pop_wide_tld_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_pop_wide_tld_hiv_1 	upper=p95_p_pop_wide_tld_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of people taking TLD who are HIV negative or HIV+ and undiagnosed, proportion HIV- and have an indication for PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number' 	labelattrs=(size=12)  values = ( 0 to 1        by  0.1   ) valueattrs=(size=10);

  label p50_p_pop_wide_tld_prep_elig_0 = "No community TLD/PEP (median)";
  label p50_p_pop_wide_tld_prep_elig_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_pop_wide_tld_prep_elig_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_pop_wide_tld_prep_elig_0 	upper=p95_p_pop_wide_tld_prep_elig_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_pop_wide_tld_prep_elig_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_pop_wide_tld_prep_elig_1 	upper=p95_p_pop_wide_tld_prep_elig_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of people taking TLD who are HIV negative or HIV+ and undiagnosed, proportion HIV- and not having an indication for PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number' 	labelattrs=(size=12)  values = (0 to 1        by  0.1   ) valueattrs=(size=10);

  label p50_p_popwidetld_prep_inelig_0 = "No community TLD/PEP (median)";
  label p50_p_popwidetld_prep_inelig_1 = "Community TLD/PEP (median)";

  series  x=cald y=p50_p_popwidetld_prep_inelig_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_popwidetld_prep_inelig_0 	upper=p95_p_popwidetld_prep_inelig_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_popwidetld_prep_inelig_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_popwidetld_prep_inelig_1 	upper=p95_p_popwidetld_prep_inelig_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;

*/

*
ods html close;

