






* this program used for submitted manuscript;








* options user="/folders/myfolders/";

 proc printto ; *  log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";


libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";
libname b "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\pop_wide_tld11_with_lost_out\";

data i1; set b.out1:; data i2; set b.out2:; data i3; set b.out3:; data i4; set b.out4:; data i5; set b.out5:; 
data i6; set b.out6:; data i7; set b.out7:; data i8; set b.out8:; data i9; set b.out9:;  


%let laprv =  pop_wide_tld11_with_lost  ;

data a.k_pop_wide_tld11_with_lost;  set i1 i2 i3 i4 i5 i6 i7 i8 i9 ;

proc sort data=a.k_pop_wide_tld11_with_lost; 
by run cald option;
run;



* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;

set a.k_pop_wide_tld11_with_lost ;

if cald=2021.75;
s_alive = s_alive_m + s_alive_w ;
sf_2022 = 10000000 / s_alive;
incidence1549_2022 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
prevalence1549_2022 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
keep run sf_2022 incidence1549_2022 prevalence1549_2022;


proc sort; by run;
*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2022;



data y; 
merge a.k_pop_wide_tld11_with_lost sf;
by run ;

* if incidence1549_2022 >= 0.15 and prevalence1549_2022 <= 0.3;

if prep_any_strategy = 4 or option=0;

* for pop_wide_tld11_with_lost to get n=1000;
if run in (
519697 
670623 
1560012 
1984641 
2307364 
3013552 
3563590 
4295021 
4527422 
5212730 
5453148 
5640118 
5692381 
6998530 
7141159 
7990699 
8165857 
8632694 
9584024 
11081227 
11252027 
15396710 
16055546 
17286023 
19548698 
20318120 
20823760 
21343907 
23868868 
23957330 
24863285 
25368620 
25468434 
26920973 
26970194 
32020247 
32622315 
34528242 
34623144 
36416514 
36718175 
36796282 
37631029 
37787886 
38158763 
38565638 
39038651 
39189220 
40635239 
41706402 
42184684 
42444040 
44098808 
44828987 
45520989 
45830442 
47344284 
48334867 
49472978 
50466977 
54523531 
56215710 
56282774 
56650802 
58904419 
60783568 
61288637 
63576174 
63890309 
64901928 
66596540 
67790709 
68247761 
68405358 
72054159 
74272447 
75612360 
77683612 
79305643 
80414954 
80645455 
81563153 
82929514 
83135462 
83693951 
84044355 
85139991 
85194923 
85954791 
86756958 
87157330 
87332482 
87627244 
87987432 
88061954 
88802393 
89191460 
90038552 
90547079 
94250685 
94254494 
94571984 
95142460 
95990365 
97598231 
98807270 
99605696 
100817079 
100869725 
101597643 
104176988 
105664365 
106962427 
107327115 
110040206 
110821447 
111588575 
112530375 
113254182 
116313356 
118558188 
119224478 
119323930 
119639779 
120154493 
122493509 
122573868 
122599598 
123019967 
123145499 
123712444 
124059775 
124373928 
128130156 
128684191 
130252862 
130262790 
131741821 
132237707 
134031917 
134272285 
135338067 
135405887 
136457643 
136698801 
137053314 
137202504 
137922516 
138572468 
139828197 
139939684 
140126782 
142791636 
144652995 
144827672 
145445495 
146175718 
146969448 
149210791 
149386041 
149956315 
150333659 
150871831 
150924070 
151768991 
153569769 
155315195 
155663438 
156211271 
156287259 
156695974 
156782447 
158340937 
158576159 
160047869 
161597152 
163531002 
163714809 
164161942 
164665251 
165399952 
166004134 
166939388 
167662236 
167877170 
169878370 
172479612 
173732992 
174870780 
175284369 
176488989 
178627893 
180925660 
181438807 
181751047 
182120505 
183835144 
184309851 
184494362 
184585182 
188240227 
188400188 
189901640 
191265865 
194293723 
194643237 
195389846 
196075225 
197839036 
199727805 
201003843 
203185586 
204688378 
205290879 
205417416 
206717121 
206890420 
207448822 
208067720 
208072376 
209131436 
212452413 
212719626 
215341809 
216200301 
218909407 
218919154 
219428912 
221689648 
221809885 
223311988 
224522773 
225851399 
226312720 
226691575 
226858964 
227585584 
228223143 
228316123 
229730809 
232897076 
234343137 
234894887 
235199951 
238811878 
241391758 
242630102 
244732708 
245127754 
246165132 
246375778 
247465375 
247483104 
247845009 
248519625 
249568630 
249621778 
250442833 
252010990 
253604880 
256417428 
256794504 
257998273 
258117738 
258233028 
260265915 
261913972 
263440091 
264634839 
264933421 
265350668 
266860085 
272297073 
272811836 
273277608 
274436849 
275718081 
275752947 
276221227 
276223119 
276829462 
276984664 
277298151 
277828516 
278072440 
278962588 
279026815 
282159995 
283088282 
283768132 
285837712 
286920299 
288336659 
290446736 
290934607 
294535779 
296611030 
299906952 
303160955 
305730145 
306620708 
307116747 
307896112 
311153240 
311963051 
312365271 
313275678 
313549798 
314596987 
317006824 
317203014 
317768921 
318702590 
320535272 
321251849 
322209396 
322684725 
323185760 
326169655 
328041565 
330495580 
330640636 
330807157 
330857803 
331486162 
331793349 
332630258 
335771060 
336695312 
336866576 
337662021 
339186468 
342330375 
343495109 
344156184 
346309560 
347781593 
351579223 
352358567 
352626925 
353978242 
355097829 
355119529 
356428453 
356524027 
357234597 
358039940 
358432682 
358482447 
359019000 
359586964 
360377730 
363625912 
363931088 
365142801 
366242729 
366496325 
367157764 
368170862 
373088953 
373215053 
373846177 
376781069 
378455007 
379773337 
380565021 
381997863 
382638082 
383752487 
384179362 
384939003 
385635758 
385660002 
386522253 
386930663 
386977055 
388788653 
388885340 
389067144 
389336315 
389366047 
390312792 
391749100 
392047331 
392110697 
393612928 
393738665 
393826702 
394141169 
394217436 
394681589 
394749528 
398585012 
399500545 
399796878 
401050189 
401088450 
401701848 
403112051 
403220397 
403361015 
404088429 
404106850 
406348699 
406389911 
406966172 
407504955 
411475562 
412498911 
412773268 
412784399 
413389829 
413528594 
414145740 
415053401 
415752050 
417835118 
420524754 
421022729 
421283677 
421520642 
421966677 
423553648 
425593000 
426436478 
427510764 
428800702 
429129435 
429899264 
430363550 
431355494 
433315404 
433576519 
433826556 
435974444 
436113127 
436366960 
436563106 
438869092 
440805294 
441190801 
441399804 
443185098 
445253227 
445954897 
446508883 
446523694 
446638350 
447297559 
448313541 
449528179 
451715855 
452076753 
452671011 
453793045 
453858063 
454732544 
456487360 
458357924 
459011393 
460975539 
461148953 
461412426 
463638699 
464849744 
465989511 
466005126 
467613247 
468665493 
469182298 
469682989 
470111608 
471067131 
471339163 
473037226 
473293095 
473504660 
474550054 
475339451 
475420438 
482617369 
483313432 
483399560 
485024217 
486217674 
487871189 
487983312 
489426594 
491576812 
492978751 
493051403 
494898543 
496499514 
496560184 
497364387 
497526900 
497575966 
497631719 
498162493 
498487038 
498789103 
499704660 
500415248 
500688291 
501044256 
502410857 
502594018 
503947298 
504258773 
505189544 
506914027 
508476604 
508779851 
510506661 
510807462 
512386494 
512898318 
514997170 
515127493 
515243797 
515414879 
515647761 
517013299 
517529774 
519418000 
520252532 
520624997 
520752145 
521304669 
521851382 
522607071 
524260030 
526485579 
526723795 
527790683 
528474394 
530359613 
532886670 
532980494 
533067433 
533904847 
534244269 
536355641 
537788217 
538349801 
541753777 
542067065 
542409130 
542842644 
543328720 
543806510 
544032391 
544575186 
545100040 
546009465 
546678466 
547168619 
548001394 
548018029 
548433819 
549336727 
550168765 
551529699 
551715508 
553399832 
555038730 
556161190 
556294373 
556976944 
557388969 
557467042 
557706711 
557842602 
557881024 
558696039 
558884392 
559622303 
560176716 
560535999 
560930603 
561060927 
561923560 
562427248 
562520224 
563653508 
564982299 
565283622 
565388881 
565566025 
565656048 
566331706 
567028279 
567288948 
567726563 
568241705 
569638543 
570029815 
570149140 
572195721 
572729532 
573205709 
573389582 
574114416 
574374232 
574972239 
576000215 
576778549 
577979482 
579603164 
580700411 
580706709 
580914473 
581117803 
581593985 
581603565 
584262413 
587500160 
587858808 
588257925 
588553193 
589351649 
590158503 
591526802 
591623305 
591664668 
592969870 
593168404 
594470966 
595541756 
596213507 
596533676 
597379890 
597402272 
597857870 
598073660 
598867789 
599085941 
599774193 
600321731 
601516433 
605341565 
605903443 
607612246 
607676345 
607898686 
610594023 
611775213 
612225016 
612296067 
613772383 
616037866 
617434115 
617555309 
619118113 
619448122 
620011618 
620309187 
620917868 
622977889 
623721709 
624780354 
629306423 
629893641 
630464716 
630987285 
631741836 
632246919 
632586450 
633250248 
633923744 
634481905 
636092548 
636234276 
636678778 
637189816 
639962680 
641218188 
641765455 
642179562 
642373330 
643418902 
643732106 
644401100 
648901732 
650122244 
650446409 
651224545 
653175493 
654441441 
655136191 
655428041 
656043063 
657366359 
658801130 
661009013 
661954284 
663240796 
664406463 
665027477 
665739620 
668187312 
669897319 
670396285 
673703573 
674318647 
674395413 
675895262 
675984194 
676099569 
677306959 
677818705 
678263139 
679219778 
680400899 
681002853 
681279865 
681334592 
681439276 
683788618 
685508539 
685847430 
686635489 
686783406 
686954524 
687096466 
687388048 
687479656 
693508537 
693641895 
701830092 
702618140 
702850660 
703720496 
704118675 
704695401 
705886838 
705929387 
706578813 
707075678 
707239636 
708037915 
708438383 
711494520 
712718518 
714860102 
717193394 
717994577 
718135583 
719988268 
724175218 
724505140 
724600720 
726572886 
727174109 
729684253 
730020188 
730624140 
730849382 
731087106 
732050027 
733052504 
733064623 
733188106 
734673841 
735028309 
736079021 
736970529 
737451143 
742976209 
743445111 
744723065 
744881331 
745863826 
748088708 
749046928 
749114546 
751214296 
751293801 
751376615 
751405360 
752101219 
752632708 
754281317 
754567483 
756369366 
757347320 
757365318 
757524465 
758422258 
759168672 
760136470 
760672282 
760919743 
761318594 
761384860 
761918158 
762010785 
765001104 
766600747 
768275538 
769307437 
769442653 
769931060 
770565973 
770856224 
770985182 
771695449 
771803657 
772367959 
773455718 
774060033 
774135106 
775090920 
775305846 
775578293 
775835499 
775984082 
778934684 
780207365 
781403588 
782170246 
784489253 
784875280 
788065351 
789635373 
790056109 
790812778 
792391181 
797119837 
797123962 
798009584 
798992563 
801310508 
801919185 
803345097 
804774838 
805784470 
808174803 
808735187 
808918795 
809416832 
809820601 
809845308 
810560456 
811000730 
812143801 
812674661 
815606451 
815946508 
816858656 
816910170 
817920500 
819233072 
821724899 
824851707 
826205437 
826443494 
826984713 
827268034 
827315605 
829290561 
829717676 
831752815 
833124022 
833367759 
833948614 
836392721 
836547338 
837350928 
837814454 
838434887 
838569160 
839009432 
839335234 
839482681 
841969250 
843102466 
843210237 
843498707 
844181201 
845045007 
845181036 
845589537 
848555954 
848977616 
850034460 
850507368 
850728625 
850969472 
851000051 
852158993 
852355141 
853169620 
853201757 
853574155 
854448027 
854555774 
854562248 
855885302 
858796318 
859139421 
859460518 
860026542 
861414961 
861596943 
862243756 
863956783 
864702191 
864903801 
866863315 
870919343 
871378289 
871383409 
871505440 
871556822 
872740695 
873808309 
873942868 
874153245 
874940288 
876079758 
877296866 
877799088 
879559524 
879600986 
884277310 
884885433 
885238862 
885293488 
886676363 
886704613 
887397731 
887980871 
895991549 
897593919 
897864852 
898749550 
900006522 
901859347 
903149216 
905670637 
907129338 
908014750 
908052682 
908328220 
909703046 
913070973 
914229693 
914952312 
916322647 
916437610 
917100760 
918641741 
918748273 
919041260 
919465773 
921456760 
922908677 
923032467 
923627299 
926840357 
927074870 
927852529 
928388448 
928534034 
928534061 
929330896 
930625233 
930627052 
932080234 
933249564 
933435896 
935172210 
935916830 
935950047 
937657170 
938669213 
938919097 
938969284 
941427092 
941728331 
943258673 
944921733 
945410624 
945944006 
946082247 
946668612 
946995727 
950421829 
950847796 
951604993 
952898986 
953151547 
953379113 
954341920 
956547466 
956751388 
957946533 
958041730 
958425156 );


* preparatory code ;

* ================================================================================= ;

if s_pregnant_oth_dol_adv_birth_e = . then s_pregnant_oth_dol_adv_birth_e = 0;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

*r_bir_w_infected_child_ = rate_birth_with_infected_child_;

* ================================================================================= ;


* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* note discounting is from 2022 - no adjustment needed;
* ts1m - this code needs to change for ts1m;

* %let year_start_disc=2023.5;
* discount_10py = 1/(1.10**(cald-&year_start_disc));
* The following can be changed if we want instead 10% discount rate;
* %let discount=discount_3py;


* ================================================================================= ;





* dalys and life years;

* ================================================================================= ;

ly = s_ly * &sf;
dly = s_dly * &sf;

s_ddaly = s_dead_ddaly + s_live_ddaly;

dead_ddaly_ntd = s_dead_ddaly_ntd * &sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * &sf * 4;


* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 


dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * &sf * 4; * odabe ;

ddaly_mtct = s_ddaly_mtct * &sf * 4;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * &sf * 4; * napd;

ddaly_ac_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ac_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;



* ================================================================================= ;



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 

dzdv_cost = s_dcost_zdv * &sf * 4 / 1000;
dten_cost = s_dcost_ten * &sf * 4 / 1000;
d3tc_cost = s_dcost_3tc * &sf * 4 / 1000; 
dnev_cost = s_dcost_nev * &sf * 4 / 1000;
dlpr_cost = s_dcost_lpr * &sf * 4 / 1000;
ddar_cost = s_dcost_dar * &sf * 4 / 1000;
dtaz_cost = s_dcost_taz * &sf * 4 / 1000;
defa_cost = s_dcost_efa * &sf * 4 / 1000;
ddol_cost = s_dcost_dol * &sf * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_prep_oral=. then s_dcost_prep_oral=0;
if s_dcost_prep_inj=. then s_dcost_prep_inj=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

s_dcost_prep = s_dcost_prep_oral + s_dcost_prep_inj;
s_dcost_prep_visit = s_dcost_prep_visit_oral + s_dcost_prep_visit_inj;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * &sf * 4 / 1000;
dart_1_cost = s_dart_1_cost * &sf * 4 / 1000;
dart_2_cost = s_dart_2_cost * &sf * 4 / 1000;
dart_3_cost = s_dart_3_cost * &sf * 4 / 1000;
dart_cost = s_dart_cost * &sf * 4 / 1000;
dvl_cost = s_dvl_cost * &sf * 4 / 1000;
dcd4_cost = s_dcd4_cost * &sf * 4 / 1000;
dadc_cost = s_dadc_cost * &sf * 4 / 1000;
dnon_tb_who3_cost = s_dnon_tb_who3_cost * &sf * 4 / 1000;
dtb_cost = s_dtb_cost * &sf * 4 / 1000;
dtest_cost = s_dtest_cost * &sf * 4 / 1000;
dcot_cost = s_dcot_cost * &sf * 4 / 1000;
dres_cost = s_dres_cost * &sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * &sf * 4 / 1000;  
dcost_prep = s_dcost_prep * &sf * 4 / 1000; 
dcost_prep_inj = s_dcost_prep_inj * &sf * 4 / 1000; 
dcost_prep_oral = s_dcost_prep_oral * &sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * &sf * 4 / 1000; 	
dcost_prep_visit_inj  = s_dcost_prep_visit_inj * &sf * 4 / 1000; 	
dcost_prep_visit_oral  = s_dcost_prep_visit_oral * &sf * 4 / 1000; 	 
dcost_prep_ac_adh = s_dcost_prep_ac_adh * &sf * 4 / 1000; 

if option=3 then do; * tld_prep ;

	dcost_prep_oral = dcost_prep_oral * ( 85 / 60 ) ; * to reflect additional cost of dolutegravir ;
	dcost_prep_visit_oral = 0;
	dcost_prep_visit = dcost_prep_visit_inj;
	dcost_prep = dcost_prep_inj + dcost_prep_visit_inj + dcost_prep_oral ;

	dvis_cost = dvis_cost - (discount * (s_onartvisit0 * 0.010)) ; * remove visit cost for when onartvisit0=1;

end;

* note this below can be used if outputs are from program beyond 1-1-20;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * &sf * 4 / 1000;
dcost_circ = s_dcost_circ * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * &sf * 4 / 1000; 

dclin_cost = dadc_cost+dnon_tb_who3_cost+dcot_cost+dtb_cost;

* sens analysis;

* ;


dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost+dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 

cost_clin_care = dcost_clin_care / discount;

cost = dcost / discount;


* checks;

* proc print; 
* var run cald option dcost_prep_inj  dcost_prep_oral   dcost_prep  dcost_prep_visit;

* ================================================================================= ;

* derived variables relating to population, not only those with hiv ;

if s_ai_naive_no_pmtct_c_nnm_ = . then s_ai_naive_no_pmtct_c_nnm_ = 0; 
if s_ai_naive_no_pmtct_c_pim_ = . then s_ai_naive_no_pmtct_c_pim_ = 0;
if s_ai_naive_no_pmtct_e_inm_ = . then s_ai_naive_no_pmtct_e_inm_ = 0;
if s_ai_naive_no_pmtct_c_rt184m_ = . then s_ai_naive_no_pmtct_c_rt184m_ = 0;
if s_ai_naive_no_pmtct_c_rt65m_ = . then s_ai_naive_no_pmtct_c_rt65m_ = 0;
if s_ai_naive_no_pmtct_c_rttams_ = . then s_ai_naive_no_pmtct_c_rttams_ = 0;

s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
s_mcirc_3039m = s_mcirc_3034m + s_mcirc_3539m;
s_mcirc_4049m = s_mcirc_4044m + s_mcirc_4549m;

s_vmmc1549m = s_vmmc1519m + s_vmmc2024m + s_vmmc2529m + s_vmmc3034m + s_vmmc3539m + s_vmmc4044m + s_vmmc4549m ;
s_vmmc3039m = s_vmmc3034m + s_vmmc3539m;
s_vmmc4049m = s_vmmc4044m + s_vmmc4549m;

s_hiv1524m = s_hiv1519m + s_hiv2024m ;
s_hiv1524w = s_hiv1519w + s_hiv2024w ;

s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15 = s_hivge15m + s_hivge15w ;

s_hiv65plm = s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hiv65plw = s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;

s_ageg65plm = s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg8084m + s_ageg85plm ;
s_ageg65plw = s_ageg6569w + s_ageg7074w + s_ageg7579w + s_ageg8084w + s_ageg85plw ;

s_onart_m50pl = s_onart_m5054_ + s_onart_m5559_ + s_onart_m6064_ + s_onart_m6569_	+ s_onart_m7074_ + s_onart_m7579_ + s_onart_m8084_ + s_onart_m85pl_	;
s_onart_w50pl = s_onart_w5054_ + s_onart_w5559_ + s_onart_w6064_ + s_onart_w6569_	+ s_onart_w7074_ + s_onart_w7579_ + s_onart_w8084_ + s_onart_w85pl_	;

s_hiv = s_hivge15 ;


* p_age1549_hiv ; 				p_age1549_hiv = (s_hiv1549m + s_hiv1549w) / s_hivge15 ;
* p_age1549_hivneg ;			p_age1549_hivneg = ((s_alive1549_w + s_alive1549_m) - (s_hiv1549m + s_hiv1549w)) / ((s_alive_m + s_alive_w) - s_hivge15);

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* av_newp_ge1;					av_newp_ge1 = s_newp / s_newp_ge1 ;

* av number of newp amongst people with newp ge 1, exlcuding sw;
* av_newp_ge1_non_sw;			av_newp_ge1_non_sw = (s_newp - s_newp_sw) / (s_newp_ge1 - (s_sw_newp_cat2 + s_sw_newp_cat3 +s_sw_newp_cat4 +s_sw_newp_cat5));


* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* p_m_newp_ge1_age1549;			p_m_newp_ge1_age1549 = (s_m1549_newp_ge1) / (s_alive1549_m) ;
* p_w_newp_ge1_age1549;			p_w_newp_ge1_age1549 = (s_w1549_newp_ge1) / (s_alive1549_w) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_m1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* p_ep;							p_ep = s_ep / s_alive1564 ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;


* n_sw_1564;					n_sw_1564 = s_sw_1564 * &sf;
* n_sw_1549;					n_sw_1549 = s_sw_1549 * &sf;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;

* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;

* n_tested_m;					n_tested_m = s_tested_m * &sf * 4;
* n_tested_w;					n_tested_w = s_tested_f * &sf * 4;
* n_tested_sw;					n_tested_sw = s_tested_sw * &sf * 4;
* n_tested;						n_tested = s_tested * &sf * 4;

* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* of people alive and within 1 year of infection, proportion diagnosed ;
* prop_diag_infection_1yr;		prop_diag_infection_1yr = s_year_1_infection_diag / s_year_1_infection ;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3034m;				p_mcirc_3034m = s_mcirc_3034m / s_ageg3034m ;
* p_mcirc_3539m;				p_mcirc_3539m = s_mcirc_3539m / s_ageg3539m ;
* p_mcirc_4044m;				p_mcirc_4044m = s_mcirc_4044m / s_ageg4044m ;
* p_mcirc_4549m;				p_mcirc_4549m = s_mcirc_4549m / s_ageg4549m ;
* p_mcirc_5064m;				p_mcirc_5064m = s_mcirc_5064m / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;

* p_vmmc;						p_vmmc = s_vmmc / s_alive_m ;
* p_vmmc_1519m;					p_vmmc_1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc_2024m;					p_vmmc_2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc_2529m;					p_vmmc_2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc_3039m;					p_vmmc_3039m = s_vmmc3039m / (s_ageg3034m + s_ageg3539m) ;
* p_vmmc_4049m;					p_vmmc_4049m = s_vmmc4049m / (s_ageg4044m + s_ageg4549m) ;
* p_vmmc_5064m;					p_vmmc_5064m = s_vmmc5064m / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_vmmc_1549m;					p_vmmc_1549m = s_vmmc1549m / s_ageg1549m ;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then  
								prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp = s_sw_newp/s_sw_1564;

* prep;

s_hiv_cab = s_hiv_cab_3m + s_hiv_cab_6m + s_hiv_cab_9m + s_hiv_cab_ge12m;

* proportion of those on prep who have ge 1 newp in the period ;
* p_prep_newp ;					if s_prep_any > 0 then p_prep_newp = (s_newp_this_per_hivneg_m_prep + s_newp_this_per_hivneg_w_prep) / s_prep_any ; 

* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;

* p_prep_elig_past_year;		p_prep_elig_past_year = s_prep_any_elig_past_year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* p_prep_elig_past_5year;		p_prep_elig_past_5year = s_prep_any_elig_past_5year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);

* mean_newp_ppers_prep;			if s_prep_any > 0 then mean_newp_ppers_prep = s_prep_newp / s_prep_any ;

* prop_onprep_newpge1;			if s_prep_any > 0 then prop_onprep_newpge1 = (s_prep_newpg1 + s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;
* prop_onprep_newpge2;			if s_prep_any > 0 then prop_onprep_newpge2 = (s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;
* prop_onprep_newpge3;			if s_prep_any > 0 then prop_onprep_newpge3 = (s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;

* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;

* prop_elig_on_prep;			if s_prep_any_elig > 0 then prop_elig_on_prep = s_prep_any / s_prep_any_elig ;
								if s_prep_any_elig = 0 then prop_elig_on_prep = 0;
								if option = 3 then prop_elig_on_prep = s_pop_wide_tld_prep_elig / s_prep_any_elig;


* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;

* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;


* p_elig_all_prep_criteria;		p_elig_all_prep_criteria = s_all_prep_criteria / s_prep_any_elig;

* p_elig_all_prep_cri_hivneg;	p_elig_all_prep_cri_hivneg = s_all_prep_criteria_hivneg / s_prep_elig_hivneg;

* p_elig_hivneg_onprep;			p_elig_hivneg_onprep = s_prep_elig_hivneg_onprep / s_prep_elig_hivneg;

* p_prep_elig_onprep_inj;		p_prep_elig_onprep_inj = s_prep_elig_onprep_inj / s_prep_elig_hivneg_onprep ;

* prop_1564_hivneg_onprep;		prop_1564_hivneg_onprep =   max((s_prep_any -s_hiv1_prep_any), 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;
* prop_hivneg_onprep;			prop_hivneg_onprep =   max((s_prep_any -s_hiv1_prep_any), 0) / (s_alive - s_hiv) ;

* p_elig_prep;   				p_elig_prep = s_prep_any_elig / (s_alive1564 - s_hiv1564);

* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_any, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_onprep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* n_prep_any;					n_prep_any = s_prep_any * &sf;
* n_prep_oral;					n_prep_oral = s_prep_oral * &sf;
* n_prep_inj;					n_prep_inj = s_prep_inj * &sf;

* n_pop_wide_tld_prep;			n_pop_wide_tld_prep = s_pop_wide_tld_prep * &sf;

* n_prep_ever;					n_prep_ever = s_prep_any_ever * &sf;
* p_prep_any_ever;				p_prep_any_ever = s_prep_any_ever / s_alive;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_any_w_1524  * &sf;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_any_w_2534  * &sf;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_any_w_3544  * &sf;

* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_any_w_1524       * &sf;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_any_w_2534       * &sf;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_any_w_3544  * &sf;

* av_prep_oral_eff_non_res_v;  	if s_prep_oral > 0 then av_prep_oral_eff_non_res_v = s_prep_oral_effect_non_res_v  / s_prep_oral;								  
																	 
* prop_art_or_prep;				prop_art_or_prep =  ( s_prep_any + s_onart - max(s_onart_as_tld_prep,0)) / s_alive ;

* n_art_or_prep;				n_art_or_prep = ( s_prep_any + s_onart - max(s_onart_as_tld_prep,0)) * &sf;

* p_prep_adhg80 ;				if s_prep_oral gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep_oral ;

* prop_prep_inj ; 				if s_prep_any > 0 then prop_prep_inj = s_prep_inj / s_prep_any ;

* ratio_inj_prep_on_tail;		if s_prep_inj > 0 then ratio_inj_prep_on_tail = s_currently_in_prep_inj_tail / s_prep_inj ;

* pr_ever_prep_inj_res_cab;		pr_ever_prep_inj_res_cab = (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail) / s_prep_inj_ever ;
* pr_ev_prep_inj_res_cab_hiv;	pr_ev_prep_inj_res_cab_hiv = (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  / s_prep_inj_ever_hiv ; 

* of people with resistance emerging on cab-la or tail, proportion on cab-la;  
* prop_cab_res_o_cab;			prop_cab_res_o_cab = s_em_inm_res_o_cab_off_3m / (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  ;
* of people with resistance emerging on cab-la or tail, proportion in tail;
* prop_cab_res_tail;			prop_cab_res_tail = s_emerge_inm_res_cab_tail / (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  ;

* of people with resistance emerging on cab-la or tail, proportion in whom it emerges in primary infection; 
* prop_cab_res_primary	;		prop_cab_res_primary = (s_em_inm_res_o_cab_off_3m_pr + s_emerge_inm_res_cab_tail_pr) / 
								(s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail) ;

* of people who initiate prep_inj in same period as primary infection, proportion developing insti resistance in the period; 
* p_prep_inj_init_prim_res;		p_prep_inj_init_prim_res = s_prep_inj_reinit_prim_res / s_prep_inj_init_prim;
* as above but including also all reinitiations of prep;
* p_prep_inj_reinit_prim_res;	p_prep_inj_reinit_prim_res = (s_prep_inj_reinit_prim_res + s_prep_inj_init_prim_res) / 
															(s_prep_inj_reinit_prim + s_prep_inj_init_prim);
* of people with hiv on cab who do not have resistance, proportion developing resistance in given period; 
* p_emerge_inm_res_cab ;		p_emerge_inm_res_cab = s_em_inm_res_o_cab_off_3m /  s_o_cab_or_o_cab_tm1_no_r;
* as above but not including people in primary infection ;
* p_emerge_inm_res_cab_notpr ; 	p_emerge_inm_res_cab_notpr = s_em_inm_res_o_cab_off_3m_npr /  
															 (s_o_cab_or_o_cab_tm1_no_r - s_o_cab_or_o_cab_tm1_no_r_prim);

* p_cab_res_emerge_primary;		p_cab_res_emerge_primary = s_cab_res_emerge_primary / s_o_cab_or_o_cab_tm1_no_r_prim ;

* p_emerge_inm_res_cab_tail_pr; p_emerge_inm_res_cab_tail_pr = s_emerge_inm_res_cab_tail_pr / s_cur_in_prep_inj_tail_prim  ; 

* number of people developing insti drug resistance when in primary infection and in the period of prep initiation or re-initiation ;
* n_prep_inj_init_reinit_prim_res;  n_prep_inj_reinit_prim_res = (s_prep_inj_reinit_prim_res + s_prep_inj_init_prim_res) * &sf;


* of people with hiv in cab tail period who do not have resistance, proportion developing resistance in given period; 
* p_emerge_inm_res_cab_tail ;	p_emerge_inm_res_cab_tail = s_emerge_inm_res_cab_tail / s_cur_in_prep_inj_tail_no_r; 

* of people on cab at time of infection, proportion developing resistance in primary infection period;
* p_emerge_inm_res_cab_prim;	p_emerge_inm_res_cab_prim = s_cab_res_prep_inj_primary / s_prep_inj_inf_or_off_3m;

* n_infected_inm;				n_infected_inm = s_infected_inm * &sf ;

* proportion of incident infections for which prep initiation or re-initiation was prevented due to positive hiv test;
* p_primary_prep_use_prevented;	p_primary_prep_use_prevented = s_prep_primary_prevented / s_primary;

* proportion of primary infections in which inm is present or arises due to cab ;
* p_cab_res_primary	;			p_cab_res_primary = s_cab_res_primary / s_primary;

***** ^^^^^ ******;
* n_prep_any_start;				n_prep_any_start = s_prep_any_start * &sf; 
* n_prep_oral_start;			n_prep_oral_start = s_prep_oral_start * &sf; 
* n_prep_inj_start;				n_prep_inj_start = s_prep_inj_start * &sf; 
* n_prep_vr_start;				n_prep_vr_start = s_prep_vr_start * &sf; 

* n_start_restart_prep_inj; 		n_start_restart_prep_inj = s_start_restart_prep_inj * &sf ;
* n_start_restart_prep_inj_prim; 	n_start_restart_prep_inj_prim = s_start_restart_prep_inj_prim * &sf ;
* n_start_rest_prep_inj_hiv; 	n_start_rest_prep_inj_hiv = s_start_restart_prep_inj_hiv * &sf ;

* n_start_rest_prep_inj_hiv_cabr; 	n_start_rest_prep_inj_hiv_cabr = s_start_rest_prep_inj_hiv_cabr * &sf ;
* n_start_rest_prep_inj_prim_cabr; 	n_start_rest_prep_inj_prim_cabr = s_start_rest_prep_inj_prim_cabr * &sf ;
* n_em_inm_res_o_cab;				n_em_inm_res_o_cab = s_em_inm_res_o_cab * &sf;

* n_hiv1_prep;						n_hiv1_prep = s_hiv1_prep_any * &sf;
* n_hiv1_prep_oral;					n_hiv1_prep_oral = s_hiv1_prep_oral * &sf;
* n_hiv1_prep_inj;					n_hiv1_prep_inj = s_hiv1_prep_inj * &sf;
* p_hiv1_prep;						if s_prep_any gt 0 then p_hiv1_prep = s_hiv1_prep_any / s_prep_any ;
* p_hiv1_prep_inj;					if s_prep_inj gt 0 then p_hiv1_prep_inj = s_hiv1_prep_inj / s_prep_inj ;
* p_hiv1_prep_oral;					if s_prep_inj gt 0 then p_hiv1_prep_oral = s_hiv1_prep_oral / s_prep_oral ;

* n_infected_on_prep_inj; 			n_infected_on_prep_inj = s_infected_on_prep_inj * &sf ;
* n_em_inm_res_o_cab;				n_s_em_inm_res_o_cab = s_em_inm_res_o_cab * &sf;

* p_cabr_start_rest_prep_inj;		p_cabr_start_rest_prep_inj = s_start_rest_prep_inj_hiv_cabr / s_em_inm_res_o_cab_off_3m ;

* n_started_prep_inj_hiv;			n_started_prep_inj_hiv = s_started_prep_inj_hiv * 4 * &sf ;
* n_started_prep_any_hiv;			n_started_prep_any_hiv = s_started_prep_any_hiv * 4 * &sf ;
 
* prop_prep_tot5yrs;				prop_prep_tot5yrs = (s_tot_yrs_prep_oral_gt_5 + s_tot_yrs_prep_inj_gt_5) / (s_prep_oral_ever + s_prep_inj_ever) ;   


* for text in results for cab-la ms ;

/*

proc means noprint data = y;  
var	 n_em_inm_res_o_cab ; 
* n_start_rest_prep_inj_hiv ; * n_em_inm_res_o_cab ; * n_start_restart_prep_inj; * p_prep_adhg80;
* p_cab_res_emerge_primary ; * p_emerge_inm_res_cab_tail; * p_emerge_inm_res_cab;
by run;
  where cald ge 2022.75 and option = 3 and hivtest_type_1_init_prep_inj ne 1 ; 
* where cald ge 2022.75 and option = 3 and hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj =  1;
output out=mean;
run;
data r; set mean; 
if _STAT_ = 'MEAN';
proc univariate; var n_em_inm_res_o_cab ; 
* n_start_rest_prep_inj_hiv ; * n_em_inm_res_o_cab ; * n_start_restart_prep_inj; * p_prep_adhg80;
* p_cab_res_emerge_primary ; * p_emerge_inm_res_cab_tail; * p_emerge_inm_res_cab;
run;


proc means data=y; var p_prep_adhg80; where option=1 and cald ge 2023; run;
proc means data=y; var p_prep_adhg80; where option=2 and cald ge 2023; run;

*/


* n_prep_primary_prevented;		n_prep_primary_prevented = s_prep_primary_prevented * &sf;

* p_prep_primary_prevented ; 	p_prep_primary_prevented = s_prep_primary_prevented /(s_prep_reinit_primary + s_prep_init_primary + s_prep_primary_prevented);


* prop_cab_dol_res_attr_cab ;	prop_cab_dol_res_attr_cab = (s_cab_res_o_cab + s_cab_res_tail + s_cab_res_primary) / s_cur_res_cab ;

* prop_prep_inj_at_inf_diag;	if s_prep_inj_at_infection + s_diagprim_prep_inj > 0 then prop_prep_inj_at_inf_diag =  s_diagprim_prep_inj /  (s_prep_inj_at_infection + s_diagprim_prep_inj);

* n_o_cab_at_3m;				n_o_cab_at_3m = s_hiv_cab_3m * &sf;  
* n_o_cab_at_6m;				n_o_cab_at_6m = s_hiv_cab_6m * &sf;  
* n_o_cab_at_9m;				n_o_cab_at_9m = s_hiv_cab_9m * &sf;  
* n_o_cab_at_ge12m;				n_o_cab_at_ge12m = s_hiv_cab_ge12m * &sf;  

* of_all_o_cab_prop_dur_3m ;    if s_hiv_cab > 0 then of_all_o_cab_prop_dur_3m = s_hiv_cab_3m / s_hiv_cab ;
* of_all_o_cab_prop_dur_6m ;    if s_hiv_cab > 0 then of_all_o_cab_prop_dur_6m = s_hiv_cab_6m / s_hiv_cab ;
* of_all_o_cab_prop_dur_9m;  	if s_hiv_cab > 0 then of_all_o_cab_prop_dur_9m = s_hiv_cab_9m / s_hiv_cab ;
* of_all_o_cab_prop_dur_ge12m ; if s_hiv_cab > 0 then of_all_o_cab_prop_dur_ge12m = s_hiv_cab_ge12m / s_hiv_cab ;

* p_prep_inj_hiv;				if s_prep_inj > 0 then p_prep_inj_hiv = s_hiv_cab / s_prep_inj ; 
								  
* n_emerge_inm_res_cab ;		n_emerge_inm_res_cab = s_emerge_inm_res_cab * &sf;
* p_em_inm_res_ever_prep_inj ;	p_em_inm_res_ever_prep_inj = s_emerge_inm_res_cab / s_prep_inj_ever ;

* n_switch_prep_from_oral ; 	n_switch_prep_from_oral = s_switch_prep_from_oral  * &sf;
* n_switch_prep_from_inj ;		n_switch_prep_from_inj = s_switch_prep_from_inj * &sf ;
* n_switch_prep_to_oral ; 		n_switch_prep_to_oral = s_switch_prep_to_oral * &sf ;
* n_switch_prep_to_inj ;		n_switch_prep_to_inj = s_switch_prep_to_inj * &sf ;

* n_cur_res_cab;				n_cur_res_cab = s_cur_res_cab * &sf ;
* n_cur_res_dol;				n_cur_res_dol = s_iime_ * &sf ;

* p_pop_wide_tld_hiv ;			p_pop_wide_tld_hiv = s_pop_wide_tld_hiv / s_pop_wide_tld_prep ;
* n_pop_wide_tld_hiv ;			n_pop_wide_tld_hiv = n_pop_wide_tld_hiv * &sf ;
* p_pop_wide_tld_prep_elig ;	p_pop_wide_tld_prep_elig = s_pop_wide_tld_prep_elig / s_pop_wide_tld_prep ;
* n_pop_wide_tld_prep_elig ;	n_pop_wide_tld_prep_elig = s_pop_wide_tld_prep_elig * &sf ;
* p_pop_wide_tld_neg_prep_inelig;	p_pop_wide_tld_neg_prep_inelig = s_pop_wide_tld_neg_prep_inelig / s_pop_wide_tld_prep ;
* n_pop_wide_tld_neg_prep_inelig;	n_pop_wide_tld_neg_prep_inelig = s_pop_wide_tld_neg_prep_inelig * &sf ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* prevalence_hiv_preg;			prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;

* ts1m - below change 4 to 12;

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* incidence1564;                incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
* incidence1524w;				incidence1524w = ((s_primary1519w + s_primary2024w) * 4 * 100) / 
									(s_ageg1519w + s_ageg2024w - s_hiv1519w - s_hiv2024w + s_primary1519w + s_primary2024w);
* incidence1524m;				incidence1524m = ((s_primary1519m + s_primary2024m) * 4 * 100) / 
									(s_ageg1519m + s_ageg2024m - s_hiv1519m - s_hiv2024m + s_primary1519m + s_primary2024m);
* incidence2534w;				incidence2534w = ((s_primary2529w + s_primary3034w) * 4 * 100) / 
									(s_ageg2529w + s_ageg3034w - s_hiv2529w - s_hiv3034w + s_primary2529w + s_primary3034w);
* incidence2534m;				incidence2534m = ((s_primary2529m + s_primary3034m) * 4 * 100) / 
									(s_ageg2529m + s_ageg3034m - s_hiv2529m - s_hiv3034m + s_primary2529m + s_primary3034m);
* incidence3544w;				incidence3544w = ((s_primary3539w + s_primary4044w) * 4 * 100) / 
									(s_ageg3539w + s_ageg4044w - s_hiv3539w - s_hiv4044w + s_primary3539w + s_primary4044w);
* incidence3544m;				incidence3544m = ((s_primary3539m + s_primary4044m) * 4 * 100) / 
									(s_ageg3539m + s_ageg4044m - s_hiv3539m - s_hiv4044m + s_primary3539m + s_primary4044m);
* incidence4554w;				incidence4554w = ((s_primary4549w + s_primary5054w) * 4 * 100) / 
									(s_ageg4549w + s_ageg5054w - s_hiv4549w - s_hiv5054w + s_primary4549w + s_primary5054w);
* incidence4554m;				incidence4554m = ((s_primary4549m + s_primary5054m) * 4 * 100) / 
									(s_ageg4549m + s_ageg5054m - s_hiv4549m - s_hiv5054m + s_primary4549m + s_primary5054m);
* incidence5564w;				incidence5564w = ((s_primary5559w + s_primary6064w) * 4 * 100) / 
									(s_ageg5559w + s_ageg6064w - s_hiv5559w - s_hiv6064w + s_primary5559w + s_primary6064w);
* incidence5564m;				incidence5564m = ((s_primary5559m + s_primary6064m) * 4 * 100) / 
									(s_ageg5559m + s_ageg6064m - s_hiv5559m - s_hiv6064m + s_primary5559m + s_primary6064m);

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* incidence_onprep ; 			if s_prep_any > 0 then incidence_onprep  = (s_primary_prep * 4 * 100) / s_prep_any ;

* prevalence1519w;				prevalence1519w = s_hiv1519w  / s_ageg1519w ;
* prevalence1519m;				prevalence1519m = s_hiv1519m  / s_ageg1519m ;
* prevalence2024w;				prevalence2024w = s_hiv2024w  / s_ageg2024w ;
* prevalence2024m;				prevalence2024m = s_hiv2024m  / s_ageg2024m ;
* prevalence2529w;				prevalence2529w = s_hiv2529w  / s_ageg2529w ;
* prevalence2529m;				prevalence2529m = s_hiv2529m  / s_ageg2529m ;
* prevalence3034w;				prevalence3034w = s_hiv3034w  / s_ageg3034w ;
* prevalence3034m;				prevalence3034m = s_hiv3034m  / s_ageg3034m ;
* prevalence3539w;				prevalence3539w = s_hiv3539w  / s_ageg3539w ;
* prevalence3539m;				prevalence3539m = s_hiv3539m  / s_ageg3539m ;
* prevalence4044w;				prevalence4044w = s_hiv4044w  / s_ageg4044w ;
* prevalence4044m;				prevalence4044m = s_hiv4044m  / s_ageg4044m ;
* prevalence4549w;				prevalence4549w = s_hiv4549w  / s_ageg4549w ;
* prevalence4549m;				prevalence4549m = s_hiv4549m  / s_ageg4549m ;
* prevalence5054w;				prevalence5054w = s_hiv5054w  / s_ageg5054w ;
* prevalence5054m;				prevalence5054m = s_hiv5054m  / s_ageg5054m ;
* prevalence5559w;				prevalence5559w = s_hiv5559w  / s_ageg5559w ;
* prevalence5559m;				prevalence5559m = s_hiv5559m  / s_ageg5559m ;
* prevalence6064w;				prevalence6064w = s_hiv6064w  / s_ageg6064w ;
* prevalence6064m;				prevalence6064m = s_hiv6064m  / s_ageg6064m ;
* prevalence65plw;				prevalence65plw = s_hiv65plw  / s_ageg65plw ;
* prevalence65plm;				prevalence65plm = s_hiv65plm  / s_ageg65plm ;

* prevalence1524w;				prevalence1524w =  s_hiv1524w  / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m =  s_hiv1524m  / (s_ageg1519m + s_ageg2024m) ;

* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

* r_prev_1519w_4549w;			r_prev_1519w_4549w = prevalence1519w / prevalence4549w ;
* r_prev_2024w_4549w;			r_prev_2024w_4549w = prevalence2024w / prevalence4549w ;
* r_prev_2529w_4549w;			r_prev_2529w_4549w = prevalence2529w / prevalence4549w ;
* r_prev_3034w_4549w;			r_prev_3034w_4549w = prevalence3034w / prevalence4549w ;
* r_prev_3539w_4549w;			r_prev_3539w_4549w = prevalence3539w / prevalence4549w ;
* r_prev_4044w_4549w;			r_prev_4044w_4549w = prevalence4044w / prevalence4549w ;
* r_prev_5054w_4549w;			r_prev_5054w_4549w = prevalence5054w / prevalence4549w ;
* r_prev_5559w_4549w;			r_prev_5559w_4549w = prevalence5559w / prevalence4549w ;
* r_prev_6064w_4549w;			r_prev_6064w_4549w = prevalence6064w / prevalence4549w ;
* r_prev_65plw_4549w;			r_prev_65plw_4549w = prevalence65plw / prevalence4549w ;
* r_prev_1519m_4549w;			r_prev_1519m_4549w = prevalence1519m / prevalence4549w ;
* r_prev_2024m_4549w;			r_prev_2024m_4549w = prevalence2024m / prevalence4549w ;
* r_prev_2529m_4549w;			r_prev_2529m_4549w = prevalence2529m / prevalence4549w ;
* r_prev_3034m_4549w;			r_prev_3034m_4549w = prevalence3034m / prevalence4549w ;
* r_prev_3539m_4549w;			r_prev_3539m_4549w = prevalence3539m / prevalence4549w ;
* r_prev_4044m_4549w;			r_prev_4044m_4549w = prevalence4044m / prevalence4549w ;
* r_prev_4549m_4549w;			r_prev_4549m_4549w = prevalence4549m / prevalence4549w ;
* r_prev_5054m_4549w;			r_prev_5054m_4549w = prevalence5054m / prevalence4549w ;
* r_prev_5559m_4549w;			r_prev_5559m_4549w = prevalence5559m / prevalence4549w ;
* r_prev_6064m_4549w;			r_prev_6064m_4549w = prevalence6064m / prevalence4549w ;
* r_prev_65plm_4549w;			r_prev_65plm_4549w = prevalence65plm / prevalence4549w ;

* r_prev_sex_1549 ;				r_prev_sex_1549 = prevalence1549w / prevalence1549m ;


* derived variables relating to people with hiv ;
								if s_primary gt 0 then do;
* p_inf_vlsupp ;				p_inf_vlsupp = s_inf_vlsupp   / s_primary;
* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;

*The meaning of the following is: among newly infected people, which proportion are SW, etc..;
* p_sw_newinf;				    p_sw_newinf = s_primary_sw / s_primary;		
* p_w1524_newinf;				p_w1524_newinf = sum(s_primary1519w,s_primary2024w) / s_primary;
* p_w25ov_newinf;				p_w25ov_newinf = sum(s_primary2529w,s_primary3034w,s_primary3539w,s_primary4044w,s_primary4549w,s_primary5054w,s_primary5559w,s_primary6064w) / s_primary;		
* p_m1524_newinf;				p_m1524_newinf = sum(s_primary1519m,s_primary2024m) / s_primary;
* p_m25ov_newinf;				p_m25ov_newinf = sum(s_primary2529m,s_primary3034m,s_primary3539m,s_primary4044m,s_primary4549m,s_primary5054m,s_primary5559m,s_primary6064m) / s_primary;		
								end;

* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hiv     ;  p_diag = p_diag * 100;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ;  p_diag_w = p_diag_w * 100;

* p_diag_m1524;					if s_hiv1524m > 0 then p_diag_m1524 = (s_diag_m1519_+s_diag_m2024_)/(s_hiv1524m);
* p_diag_w1524;					if s_hiv1524w > 0 then p_diag_w1524 = (s_diag_w1519_+s_diag_w2024_)/(s_hiv1524w);

* p_diag_sw;					if s_sw_1564 > 0 then p_diag_sw = s_diag_sw / s_sw_1564; 

* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_pim;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_pim = s_ai_naive_no_pmtct_c_pim_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt184m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt184m = s_ai_naive_no_pmtct_c_rt184m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt65m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt65m = s_ai_naive_no_pmtct_c_rt65m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rttams;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rttams = s_ai_naive_no_pmtct_c_rttams_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_e_inm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_e_inm = s_ai_naive_no_pmtct_e_inm_ / s_ai_naive_no_pmtct_;
* n_ai_naive_no_pmtct_e_inm;    n_ai_naive_no_pmtct_e_inm = s_ai_naive_no_pmtct_e_inm_ * &sf;


/*

proc sort; by option;
proc means; var p_ai_no_arv_e_inm ; by option;
where cald ge 2043 and res_trans_factor_ii=1;
run;

*/

* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;

* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* p_onart;						if s_hivge15 gt 0 then p_onart = s_onart / s_hivge15; 

* n_onart_w;					n_onart_w = s_onart_w * &sf;
* n_onart_m;					n_onart_m = s_onart_m * &sf;
* n_onart  ;					n_onart   = s_onart   * &sf;

* p_nactive_art_start_lt2;		if s_art_start > 0 then p_nactive_art_start_lt2 = s_nactive_art_start_lt2 / s_art_start ; 
* p_nactive_art_start_lt3;		if s_art_start > 0 then p_nactive_art_start_lt3 = s_nactive_art_start_lt3 / s_art_start ; 
* p_nactive_art_start_lt1p5;	if s_art_start > 0 then p_nactive_art_start_lt1p5 = s_nactive_art_start_lt1p5 / s_art_start ; 

* p_efa;						if s_onart > 0 then p_efa = s_efa / s_onart ;
* p_taz;						if s_onart > 0 then p_taz = s_taz / s_onart ;
* p_ten;						if s_onart > 0 then p_ten = s_ten / s_onart ;
* p_zdv;						if s_onart > 0 then p_zdv = s_zdv / s_onart ;
* p_dol; 						if s_onart > 0 then p_dol = s_dol / s_onart ;
* p_3tc;						if s_onart > 0 then p_3tc = s_3tc / s_onart ;
* p_lpr; 						if s_onart > 0 then p_lpr = s_lpr / s_onart ;
* p_nev;						if s_onart > 0 then p_nev = s_nev / s_onart ;

* p_tle;						if s_onart > 0 then p_tle = s_tle / s_onart ;
* p_tld;						if s_onart > 0 then p_tld = s_tld / s_onart ;
* p_zld;						if s_onart > 0 then p_zld = s_zld / s_onart ;
* p_zla;						if s_onart > 0 then p_zla = s_zla / s_onart ;
* p_otherreg;					if s_onart > 0 then p_otherreg = s_otherreg / s_onart ;

* p_o_zdv_tox;					if s_zdv gt 0 then p_o_zdv_tox = s_o_zdv_tox / s_zdv ;
* p_o_3tc_tox;					if s_3tc gt 0 then p_o_3tc_tox = s_o_3tc_tox / s_3tc ;
* p_o_ten_tox;					if s_ten gt 0 then p_o_ten_tox = s_o_ten_tox / s_ten ;
* p_o_taz_tox;					if s_taz gt 0 then p_o_taz_tox = s_o_taz_tox / s_taz ;
* p_o_lpr_tox;					if s_lpr gt 0 then p_o_lpr_tox = s_o_lpr_tox / s_lpr ;
* p_o_efa_tox;					if s_efa gt 0 then p_o_efa_tox = s_o_efa_tox / s_efa ;
* p_o_nev_tox;					if s_nev gt 0 then p_o_nev_tox = s_o_nev_tox / s_nev ;
* p_o_dol_tox;					if s_dol gt 0 then p_o_dol_tox = s_o_dol_tox / s_dol ;

* p_o_tle_tox;					if s_tle gt 0 then p_o_tle_tox = s_o_tle_tox / s_tle ;
* p_o_tld_tox;					if s_tld gt 0 then p_o_tld_tox = s_o_tld_tox / s_tld ;
* p_o_zld_tox;					if s_zld gt 0 then p_o_zld_tox = s_o_zld_tox / s_zld ;
* p_o_zla_tox;					if s_zla gt 0 then p_o_zla_tox = s_o_zla_tox / s_zla ;

* p_o_zdv_adh_hi;				if s_zdv gt 0 then p_o_zdv_adh_hi = s_o_zdv_adh_hi / s_zdv ;
* p_o_3tc_adh_hi;				if s_3tc gt 0 then p_o_3tc_adh_hi = s_o_3tc_adh_hi / s_3tc ;
* p_o_ten_adh_hi;				if s_ten gt 0 then p_o_ten_adh_hi = s_o_ten_adh_hi / s_ten ;
* p_o_taz_adh_hi;				if s_taz gt 0 then p_o_taz_adh_hi = s_o_taz_adh_hi / s_taz ;
* p_o_lpr_adh_hi;				if s_lpr gt 0 then p_o_lpr_adh_hi = s_o_lpr_adh_hi / s_lpr ;
* p_o_efa_adh_hi;				if s_efa gt 0 then p_o_efa_adh_hi = s_o_efa_adh_hi / s_efa ;
* p_o_nev_adh_hi;				if s_nev gt 0 then p_o_nev_adh_hi = s_o_nev_adh_hi / s_nev ;
* p_o_dol_adh_hi;				if s_dol gt 0 then p_o_dol_adh_hi = s_o_dol_adh_hi / s_dol ;

* p_o_tle_adh_hi;				if s_tle gt 0 then p_o_tle_adh_hi = s_o_tle_adh_hi / s_tle ;
* p_o_tld_adh_hi;				if s_tld gt 0 then p_o_tld_adh_hi = s_o_tld_adh_hi / s_tld ;
* p_o_zld_adh_hi;				if s_zld gt 0 then p_o_zld_adh_hi = s_o_zld_adh_hi / s_zld ;
* p_o_zla_adh_hi;				if s_zla gt 0 then p_o_zla_adh_hi = s_o_zla_adh_hi / s_zla ;

* p_adh_hi;						if s_onart gt 0 then p_adh_hi = s_adh_hi / s_onart;

* p_u_vfail1_this_period;		p_u_vfail1_this_period = s_u_vfail1_this_period / (s_onart - s_u_vfail1);

* p_k65m;						if s_hivge15 gt 0 then p_k65m = s_k65m_ / s_hivge15 ;
* p_m184m;						if s_hivge15 gt 0 then p_m184m = s_m184m_ / s_hivge15 ;

* p_k65m_all;					p_k65m_all = s_k65m_ / (s_alive_w + s_alive_m) ;
* p_m184m_all;					p_m184m_all = s_m184m_ / (s_alive_w + s_alive_m) ;
* n_k65m;						n_k65m = s_k65m_ * &sf;

* p_vlg1000_184m;				if s_vg1000 > 0 then p_vlg1000_184m = s_vlg1000_184m / s_vg1000 ;
* p_vlg1000_65m;				if s_vg1000 > 0 then p_vlg1000_65m = s_vlg1000_65m / s_vg1000 ;

* p_vlg1000_184m_hiv;			if s_hivge15 > 0 then p_vlg1000_184m_hiv = s_vlg1000_184m / s_hivge15  ;
* p_vlg1000_65m_hiv;			if s_hivge15 > 0 then p_vlg1000_65m_hiv = s_vlg1000_65m / s_hivge15  ;

* p_vlg1000_onart_65m;			if s_vlg1000_onart > 0 then p_vlg1000_onart_65m = s_vlg1000_onart_65m / s_vlg1000_onart ;
* p_vlg1000_onart_184m;			if s_vlg1000_onart > 0 then p_vlg1000_onart_184m = s_vlg1000_onart_184m / s_vlg1000_onart ;

* p_184m_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_184m_ontle_vlg1000 = s_vlg1000_184m_ontle / s_vlg1000_ontle ;
* p_tams_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_tams_ontle_vlg1000 = s_vlg1000_tams_ontle / s_vlg1000_ontle ;
* p_65m_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_65m_ontle_vlg1000 = s_vlg1000_65m_ontle / s_vlg1000_ontle ;
* p_nnm_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_nnm_ontle_vlg1000 = s_vlg1000_nnm_ontle / s_vlg1000_ontle ;

* p_184m_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_184m_ontld_vlg1000 = s_vlg1000_184m_ontld / s_vlg1000_ontld ;
* p_tams_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_tams_ontld_vlg1000 = s_vlg1000_tams_ontld / s_vlg1000_ontld ;
* p_65m_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_65m_ontld_vlg1000 = s_vlg1000_65m_ontld / s_vlg1000_ontld ;
* p_nnm_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_nnm_ontld_vlg1000 = s_vlg1000_nnm_ontld / s_vlg1000_ontld ;
* p_inm_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_inm_ontld_vlg1000 = s_vlg1000_inm_ontld / s_vlg1000_ontld ;

								if s_onart_start_zld_if_reg_op_116 gt 0 then do;
* p_nactive_ge2p75_xyz;			p_nactive_ge2p75_xyz = s_nac_ge2p75_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge2p00_xyz;			p_nactive_ge2p00_xyz = s_nac_ge2p00_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge1p50_xyz;			p_nactive_ge1p50_xyz = s_nac_ge1p50_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
								end;

* p_adh_hi_xyz_ot1;				if s_a_zld_if_reg_op_116 gt 0 then p_adh_hi_xyz_ot1 = s_adh_hi_a_zld_if_reg_op_116 / s_a_zld_if_reg_op_116;
* p_adh_hi_xyz_ot2;				if s_onart_start_zld_if_reg_op_116 gt 0 then p_adh_hi_xyz_ot2 = s_adh_hi_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_adh_hi_xyz_itt;				if s_x_n_zld_if_reg_op_116 gt 0 then  p_adh_hi_xyz_itt = s_adh_hi_a_zld_if_reg_op_116 / s_x_n_zld_if_reg_op_116;

* p_e_rt65m_xyz; 				if s_onart_start_zld_if_reg_op_116 gt 0 then p_e_rt65m_xyz = s_e_rt65m_st_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116 ;

* p_startedline2;				if s_artexp > 0 then do; p_startedline2 = s_startedline2 / s_artexp; end;
* Of people on ART, percent with CD4 < 500;	
								if  s_onart_iicu > 0 then  p_onart_cd4_l500 = 1 - (s_onart_cd4_g500 / s_onart_iicu) ;
* Of people on ART, percent with CD4 < 200;	
								if s_onart_iicu > 0 then  p_onart_cd4_l200 = s_onart_cl200 / s_onart_iicu ;
* p_drug_level_test;			if s_onart > 0 then p_drug_level_test = s_drug_level_test / s_onart ;

* p_linefail_ge1;				if s_artexp > 0 then p_linefail_ge1 = s_linefail_ge1 / s_artexp;
* p_startedline2;				if s_artexp > 0 then p_startedline2 = s_startedline2 / s_artexp; 
* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_artexp_vl1000;				if s_artexp > 0 then p_artexp_vl1000 = s_vl1000_art_gt6m_iicu / s_artexp ;

* p_vg1000, p_vl1000;			if s_hivge15  > 0 then p_vg1000 = s_vg1000 / s_hivge15 ;  p_vl1000 = 1- p_vg1000 ;
* p_vg1000_m, p_vl1000_m;		if s_hivge15m  > 0 then p_vg1000_m = s_vg1000_m / s_hivge15m ;  p_vl1000_m = 1- p_vg1000_m ;
* p_vg1000_w, p_vl1000_w;		if s_hivge15w  > 0 then p_vg1000_w = s_vg1000_w / s_hivge15w ;  p_vl1000_w = 1- p_vg1000_w ;
* p_vg1000_m_1524;				if s_hiv1524m  > 0 then p_vg1000_m_1524 = s_vg1000_m_1524 / s_hiv1524m ;
* p_vg1000_w_1524;				if s_hiv1524w  > 0 then p_vg1000_w_1524 = s_vg1000_w_1524 / s_hiv1524w ;
* p_vl1000_m_1524;				p_vl1000_m_1524 = 1 - p_vg1000_m_1524 ;
* p_vl1000_w_1524;				p_vl1000_w_1524 = 1 - p_vg1000_w_1524 ;

* p_onart_m;					if s_hivge15m > 0 then p_onart_m = s_onart_m / s_hivge15m  ;
* p_onart_w;					if s_hivge15w  > 0 then p_onart_w = s_onart_w / s_hivge15w  ;  
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_1524;			if s_onart_gt6m_iicu_1524_ > 0 then p_onart_vl1000_1524 = s_vl1000_art_gt6m_iicu_1524_ / s_onart_gt6m_iicu_1524_ ;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* p_vl1000_art_12m;				if s_art_12m > 0 then p_vl1000_art_12m = s_vl1000_art_12m / s_art_12m ;
* p_vl1000_art_12m_onart;		if s_art_12m_onart > 0 then p_vl1000_art_12m_onart = s_vl1000_art_12m_onart / s_art_12m_onart ;

* p_onart_m_age50pl;			p_onart_m_age50pl = s_onart_m50pl / (s_onart_m1549_ + s_onart_m50pl);
* p_onart_w_age50pl;			p_onart_w_age50pl = s_onart_w50pl / (s_onart_w1549_ + s_onart_w50pl);

* prevalence_vg1000;			if s_alive > 0 then prevalence_vg1000 = s_vg1000 / s_alive;
* prev_vg1000_newp_m;			prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_m_newp;
* prev_vg1000_newp_w;			prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_w_newp;
* r_efa_hiv;					if s_hivge15 > 0 then r_efa_hiv = s_r_efa / s_hivge15 ;
* p_dol_2vg1000_dolr1_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh0 = s_o_dol_2nd_vlg1000_dolr1_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr1_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh1 = s_o_dol_2nd_vlg1000_dolr1_adh1 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh0 = s_o_dol_2nd_vlg1000_dolr0_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh1 = s_o_dol_2nd_vlg1000_dolr0_adh1 / s_o_dol_2nd_vlg1000 ;

* p_iime;						p_iime = s_iime_ / s_hivge15 ;
* p_pime;						p_pime = s_pime_ / s_hivge15 ;
* p_nnme;						p_nnme = s_nnme_ / s_hivge15 ;

* blood pressure;

* p_hypert_1549 ;			p_hypert_1549 = s_hypertension_1549 / s_alive1549 ;
* p_hypert_5059 ;			p_hypert_5059 = s_hypertension_5059 / (s_ageg5054m + s_ageg5559m + s_ageg5054w + s_ageg5559w) ;
* p_hypert_6069 ;			p_hypert_6069 = s_hypertension_6069 / (s_ageg6064m + s_ageg6569m + s_ageg6064w + s_ageg6569w) ;
* p_hypert_7079 ;			p_hypert_7079 = s_hypertension_7079 / (s_ageg7074m + s_ageg7579m + s_ageg7074w + s_ageg7579w) ;
* p_hypert_ge80 ;			p_hypert_ge80 = s_hypertension_ge80 / (s_ageg8084m + s_ageg85plm + s_ageg8084w + s_ageg85plw) ;
* p_hypert_1549m ;			p_hypert_1549m = s_hypertension_1549m / s_alive1549_m ;
* p_hypert_5059m ;			p_hypert_5059m = s_hypertension_5059m / (s_ageg5054m + s_ageg5559m ) ;
* p_hypert_6069m ;			p_hypert_6069m = s_hypertension_6069m / (s_ageg6064m + s_ageg6569m ) ;
* p_hypert_7079m ;			p_hypert_7079m = s_hypertension_7079m / (s_ageg7074m + s_ageg7579m ) ;
* p_hypert_ge80m ;			p_hypert_ge80m = s_hypertension_ge80m / (s_ageg8084m + s_ageg85plm ) ;
* p_hypert_1549w ;			p_hypert_1549w = s_hypertension_1549w / s_alive1549_w ;
* p_hypert_5059w ;			p_hypert_5059w = s_hypertension_5059w / (s_ageg5054w + s_ageg5559w ) ;
* p_hypert_6069w ;			p_hypert_6069w = s_hypertension_6069w / (s_ageg6064w + s_ageg6569w ) ;
* p_hypert_7079w ;			p_hypert_7079w = s_hypertension_7079w / (s_ageg7074w + s_ageg7579w ) ;
* p_hypert_ge80w ;			p_hypert_ge80w = s_hypertension_ge80w / (s_ageg8084w + s_ageg85plw ) ;
* p_hypert180_1549 ;		p_hypert180_1549 = s_hypertens180_1549 / s_alive1549 ;
* p_hypert180_5059 ;		p_hypert180_5059 = s_hypertens180_5059 / (s_ageg5054m + s_ageg5559m + s_ageg5054w + s_ageg5559w) ;
* p_hypert180_6069 ;		p_hypert180_6069 = s_hypertens180_6069 / (s_ageg6064m + s_ageg6569m + s_ageg6064w + s_ageg6569w) ;
* p_hypert180_7079 ;		p_hypert180_7079 = s_hypertens180_7079 / (s_ageg7074m + s_ageg7579m + s_ageg7074w + s_ageg7579w) ;
* p_hypert180_ge80 ;		p_hypert180_ge80 = s_hypertens180_ge80 / (s_ageg8084m + s_ageg85plm + s_ageg8084w + s_ageg85plw) ;
* p_diagnosed_hypert_1549 ;	p_diagnosed_hypert_1549 = s_diagnosed_hypertension_1549 / s_hypertension_1549 ;
* p_diagnosed_hypert_5059 ;	p_diagnosed_hypert_5059 = s_diagnosed_hypertension_5059 / s_hypertension_5059 ;
* p_diagnosed_hypert_6069 ;	p_diagnosed_hypert_6069 = s_diagnosed_hypertension_6069 / s_hypertension_6069 ;
* p_diagnosed_hypert_7079 ;	p_diagnosed_hypert_7079 = s_diagnosed_hypertension_7079 / s_hypertension_7079 ;
* p_diagnosed_hypert_ge80 ;	p_diagnosed_hypert_ge80 = s_diagnosed_hypertension_ge80 / s_hypertension_ge80 ;
* p_diagnosed_hypert_1549m ;	p_diagnosed_hypert_1549m = s_diagnosed_hypertension_1549m / s_hypertension_1549m ;
* p_diagnosed_hypert_5059m ;	p_diagnosed_hypert_5059m = s_diagnosed_hypertension_5059m / s_hypertension_5059m ;
* p_diagnosed_hypert_6069m ;	p_diagnosed_hypert_6069m = s_diagnosed_hypertension_6069m / s_hypertension_6069m ;
* p_diagnosed_hypert_7079m ;	p_diagnosed_hypert_7079m = s_diagnosed_hypertension_7079m / s_hypertension_7079m ;
* p_diagnosed_hypert_ge80m ;	p_diagnosed_hypert_ge80m = s_diagnosed_hypertension_ge80m / s_hypertension_ge80m ;
* p_diagnosed_hypert_1549w ;	p_diagnosed_hypert_1549w = s_diagnosed_hypertension_1549w / s_hypertension_1549w ;
* p_diagnosed_hypert_5059w ;	p_diagnosed_hypert_5059w = s_diagnosed_hypertension_5059w / s_hypertension_5059w ;
* p_diagnosed_hypert_6069w ;	p_diagnosed_hypert_6069w = s_diagnosed_hypertension_6069w / s_hypertension_6069w ;
* p_diagnosed_hypert_7079w ;	p_diagnosed_hypert_7079w = s_diagnosed_hypertension_7079w / s_hypertension_7079w ;
* p_diagnosed_hypert_ge80w ;	p_diagnosed_hypert_ge80w = s_diagnosed_hypertension_ge80w / s_hypertension_ge80w ;
* p_on_anti_hypert_1549 ;		p_on_anti_hypert_1549 = s_on_anti_hypertensive_1549 / s_hypertension_1549 ;
* p_on_anti_hypert_5059 ;		p_on_anti_hypert_5059 = s_on_anti_hypertensive_5059 / s_hypertension_5059 ;
* p_on_anti_hypert_6069 ;		p_on_anti_hypert_6069 = s_on_anti_hypertensive_6069 / s_hypertension_6069 ;
* p_on_anti_hypert_7079 ;		p_on_anti_hypert_7079 = s_on_anti_hypertensive_7079 / s_hypertension_7079 ;
* p_on_anti_hypert_ge80 ;		p_on_anti_hypert_ge80 = s_on_anti_hypertensive_ge80 / s_hypertension_ge80 ;
* p_on_anti_hypert_1549m ;		p_on_anti_hypert_1549m = s_on_anti_hypertensive_1549m / s_hypertension_1549m ;
* p_on_anti_hypert_5059m ;		p_on_anti_hypert_5059m = s_on_anti_hypertensive_5059m / s_hypertension_5059m ;
* p_on_anti_hypert_6069m ;		p_on_anti_hypert_6069m = s_on_anti_hypertensive_6069m / s_hypertension_6069m ;
* p_on_anti_hypert_7079m ;		p_on_anti_hypert_7079m = s_on_anti_hypertensive_7079m / s_hypertension_7079m ;
* p_on_anti_hypert_ge80m ;		p_on_anti_hypert_ge80m = s_on_anti_hypertensive_ge80m / s_hypertension_ge80m ;
* p_on_anti_hypert_1549w ;		p_on_anti_hypert_1549w = s_on_anti_hypertensive_1549w / s_hypertension_1549w ;
* p_on_anti_hypert_5059w ;		p_on_anti_hypert_5059w = s_on_anti_hypertensive_5059w / s_hypertension_5059w ;
* p_on_anti_hypert_6069w ;		p_on_anti_hypert_6069w = s_on_anti_hypertensive_6069w / s_hypertension_6069w ;
* p_on_anti_hypert_7079w ;		p_on_anti_hypert_7079w = s_on_anti_hypertensive_7079w / s_hypertension_7079w ;
* p_on_anti_hypert_ge80w ;		p_on_anti_hypert_ge80w = s_on_anti_hypertensive_ge80w / s_hypertension_ge80w ;
* p_on1drug_antihyp_1549 ;		p_on1drug_antihyp_1549 = s_on1drug_antihyp_1549 / (s_on1drug_antihyp_1549 + s_on2drug_antihyp_1549 + s_on3drug_antihyp_1549);
* p_on2drug_antihyp_1549 ;		p_on2drug_antihyp_1549 = s_on2drug_antihyp_1549 / (s_on1drug_antihyp_1549 + s_on2drug_antihyp_1549 + s_on3drug_antihyp_1549);
* p_on3drug_antihyp_1549 ;		p_on3drug_antihyp_1549 = s_on3drug_antihyp_1549 / (s_on1drug_antihyp_1549 + s_on2drug_antihyp_1549 + s_on3drug_antihyp_1549);
* p_on1drug_antihyp_5059 ;		p_on1drug_antihyp_5059 = s_on1drug_antihyp_5059 / (s_on1drug_antihyp_5059 + s_on2drug_antihyp_5059 + s_on3drug_antihyp_5059);
* p_on2drug_antihyp_5059 ;		p_on2drug_antihyp_5059 = s_on2drug_antihyp_5059 / (s_on1drug_antihyp_5059 + s_on2drug_antihyp_5059 + s_on3drug_antihyp_5059);
* p_on3drug_antihyp_5059 ;		p_on3drug_antihyp_5059 = s_on3drug_antihyp_5059 / (s_on1drug_antihyp_5059 + s_on2drug_antihyp_5059 + s_on3drug_antihyp_5059);
* p_on1drug_antihyp_6069 ;		p_on1drug_antihyp_6069 = s_on1drug_antihyp_6069 / (s_on1drug_antihyp_6069 + s_on2drug_antihyp_6069 + s_on3drug_antihyp_6069);
* p_on2drug_antihyp_6069 ;		p_on2drug_antihyp_6069 = s_on2drug_antihyp_6069 / (s_on1drug_antihyp_6069 + s_on2drug_antihyp_6069 + s_on3drug_antihyp_6069);
* p_on3drug_antihyp_6069 ;		p_on3drug_antihyp_6069 = s_on3drug_antihyp_6069 / (s_on1drug_antihyp_6069 + s_on2drug_antihyp_6069 + s_on3drug_antihyp_6069);
* p_on1drug_antihyp_7079 ;		p_on1drug_antihyp_7079 = s_on1drug_antihyp_7079 / (s_on1drug_antihyp_7079 + s_on2drug_antihyp_7079 + s_on3drug_antihyp_7079);
* p_on2drug_antihyp_7079 ;		p_on2drug_antihyp_7079 = s_on2drug_antihyp_7079 / (s_on1drug_antihyp_7079 + s_on2drug_antihyp_7079 + s_on3drug_antihyp_7079);
* p_on3drug_antihyp_7079 ;		p_on3drug_antihyp_7079 = s_on3drug_antihyp_7079 / (s_on1drug_antihyp_7079 + s_on2drug_antihyp_7079 + s_on3drug_antihyp_7079);
* p_on1drug_antihyp_ge80 ;		p_on1drug_antihyp_ge80 = s_on1drug_antihyp_ge80 / (s_on1drug_antihyp_ge80 + s_on2drug_antihyp_ge80 + s_on3drug_antihyp_ge80);
* p_on2drug_antihyp_ge80 ;		p_on2drug_antihyp_ge80 = s_on2drug_antihyp_ge80 / (s_on1drug_antihyp_ge80 + s_on2drug_antihyp_ge80 + s_on3drug_antihyp_ge80);
* p_on3drug_antihyp_ge80 ;		p_on3drug_antihyp_ge80 = s_on3drug_antihyp_ge80 / (s_on1drug_antihyp_ge80 + s_on2drug_antihyp_ge80 + s_on3drug_antihyp_ge80);

* p_ahd_re_enter_care_100;		p_ahd_re_enter_care_100 = s_ahd_re_enter_care_100 / s_re_enter_care;
* p_ahd_re_enter_care_200;		p_ahd_re_enter_care_200 = s_ahd_re_enter_care_200 / s_re_enter_care;

* ts1m - below change 4 to 12;
* aids_death_rate;				if s_hivge15 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hivge15 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;
* death_rate_artexp;			if s_artexp gt 0 then death_rate_artexp = (4 * 100 * s_dead_artexp / s_artexp);

* death_rate_hiv; 				if s_hivge15 > 0 then death_rate_hiv = (4 * 100 * s_death_hiv) / s_hivge15;
				 				if s_hivge15m > 0 then death_rate_hiv_m = (4 * 100 * s_death_hiv_m) / s_hivge15m;
								if s_hivge15w > 0 then death_rate_hiv_w = (4 * 100 * s_death_hiv_w) / s_hivge15w;
* death_rate_hiv_all;			if s_alive > 0 then death_rate_hiv_all = (4 * 100 * s_death_hiv) / s_alive ;
				 				if s_alive_m > 0 then death_rate_hiv_all_m = (4 * 100 * s_death_hiv_m) / s_alive_m;
								if s_alive_w > 0 then death_rate_hiv_all_w = (4 * 100 * s_death_hiv_w) / s_alive_w;




* n deaths and death rate by cause and hiv status - age 15+ ;

			n_dead_hivpos_cause1 = s_dead_hivpos_cause1 * 4 * &sf; 
			rate_dead_hivpos_cause1 = (s_dead_hivpos_cause1 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_tb = s_dead_hivpos_tb  * 4* &sf; 
			rate_dead_hivpos_tb = (s_dead_hivpos_tb * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause4 = s_dead_hivpos_cause4  * 4* &sf; 
			rate_dead_hivpos_cause4 = (s_dead_hivpos_cause4 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_crypm = s_dead_hivpos_crypm  * 4* &sf; 
			rate_dead_hivpos_crypm = (s_dead_hivpos_crypm * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_sbi = s_dead_hivpos_sbi  * 4* &sf; 
			rate_dead_hivpos_sbi = (s_dead_hivpos_sbi * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_oth_adc = s_dead_hivpos_oth_adc  * 4* &sf; 
			rate_dead_hivpos_oth_adc = (s_dead_hivpos_oth_adc * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause2 = s_dead_hivpos_cause2  * 4* &sf; 
			rate_dead_hivpos_cause2 = (s_dead_hivpos_cause2 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause3 = s_dead_hivpos_cause3  * 4* &sf; 
			rate_dead_hivpos_cause3 = (s_dead_hivpos_cause3 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cvd = s_dead_hivpos_cvd  * 4* &sf; 
			rate_dead_hivpos_cvd = (s_dead_hivpos_cvd * 4 * 100) / s_hivge15 ;
			n_dead_cvd = s_dead_cvd  * 4* &sf; 
			rate_dead_cvd = (s_dead_cvd * 4 * 100) / s_alive ;
			n_dead_tb = s_dead_tb  * 4* &sf; 
			rate_dead_tb = (s_dead_tb * 4 * 100) / s_alive ;
			n_dead_hivneg_cvd = s_dead_hivneg_cvd  * 4* &sf; 
			rate_dead_hivneg_cvd = (s_dead_hivneg_cvd * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_tb = s_dead_hivneg_tb  * 4* &sf; 
			rate_dead_hivneg_tb = (s_dead_hivneg_tb * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause2 = s_dead_hivneg_cause2  * 4* &sf; 
			rate_dead_hivneg_cause2 = (s_dead_hivneg_cause2 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause3 = s_dead_hivneg_cause3  * 4* &sf; 
			rate_dead_hivneg_cause3 = (s_dead_hivneg_cause3 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause4 = s_dead_hivneg_cause4  * 4* &sf; 
			rate_dead_hivneg_cause4 = (s_dead_hivneg_cause4 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause5 = s_dead_hivneg_cause5  * 4* &sf; 
			rate_dead_hivneg_cause5 = (s_dead_hivneg_cause5 * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead_allage = (s_dead_allage * 4 * 100) / s_alive ;
			rate_dead_hivneg_anycause = (s_dead_hivneg_anycause * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead_hivpos_anycause = (s_dead_hivpos_anycause * 4 * 100) / s_hivge15 ;

			rate_dead_cvd_3039m = (s_dead_cvd_3039m * 4 * 100) / (s_ageg3034m + s_ageg3539m) ;
			rate_dead_cvd_4049m = (s_dead_cvd_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
			rate_dead_cvd_5059m = (s_dead_cvd_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
			rate_dead_cvd_6069m = (s_dead_cvd_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
			rate_dead_cvd_7079m = (s_dead_cvd_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
			rate_dead_cvd_ge80m = (s_dead_cvd_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
			rate_dead_cvd_3039w = (s_dead_cvd_3039w * 4 * 100) / (s_ageg3034w + s_ageg3539w) ;
			rate_dead_cvd_4049w = (s_dead_cvd_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
			rate_dead_cvd_5059w = (s_dead_cvd_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
			rate_dead_cvd_6069w = (s_dead_cvd_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
			rate_dead_cvd_7079w = (s_dead_cvd_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
			rate_dead_cvd_ge80w = (s_dead_cvd_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;


* n_death_hiv;					n_death_hiv = s_death_hiv  * 4* &sf;
* n_death_covid;				n_death_covid = s_death_dcause3_allage  * 4* &sf;
* n_death;						n_death = s_dead  * 4 * &sf;
* n_covid;						n_covid = s_covid  * 4 * &sf;
* n_death_hivneg_anycause;		n_death_hivneg_anycause = s_dead_hivneg_anycause  * 4 * &sf;
* n_death_hivpos_anycause;		n_death_hivpos_anycause = s_dead_hivpos_anycause  * 4 * &sf;

* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
													
* n_cd4_lt200;					n_cd4_lt200 = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * &sf; 

* n_cd4_lt50;					n_cd4_lt50 = s_cd4_g1 * &sf; 
* n_hiv;						n_hiv = s_hivge15 * &sf;
* n_alive;						n_alive = s_alive * &sf;

* n_art_initiation;				n_art_initiation = s_art_initiation * 4 * &sf;
* n_restart;					n_restart = s_restart * 4 * &sf;
* n_line1_fail_this_period;		n_line1_fail_this_period = s_line1_fail_this_period * 4 * &sf;

* n_need_cd4m;					n_need_cd4m = n_art_initiation + n_restart + n_line1_fail_this_period;
 
inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* number of women with hiv giving birth per year;

n_give_birth_w_hiv = s_give_birth_with_hiv * &sf * 4;
n_birth_with_inf_child = s_birth_with_inf_child * &sf * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * &sf * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * &sf * 4;  * annual number;
n_mcirc1549_ = s_mcirc_1549m * &sf * 4;
n_mcirc1549_3m = s_mcirc_1549m * &sf;
n_vmmc1549_ = s_vmmc1549m * &sf * 4;
n_vmmc1549_3m = s_vmmc1549m * &sf;
n_new_inf1549m = s_primary1549m * &sf * 4;
n_new_inf1549w = s_primary1549w * &sf * 4;
n_new_inf1549 = s_primary1549 * &sf * 4;
n_infection  = s_primary     * &sf * 4;


keep 

run cald option
s_alive p_w_giv_birth_this_per p_newp_ge1 p_newp_ge5   gender_r_newp p_newp_sw prop_sw_newp0  p_newp_prep  dcost  dart_cost_y
dcost_prep_visit dres_cost     dtest_cost    d_t_adh_int_cost    dswitchline_cost   dtaz_cost   dclin_cost  dcost_circ dcost_condom_dn 
dcost_prep_visit_oral dcost_prep_visit_inj   dcost_prep  dcost_clin_care  dcost_non_aids_pre_death  dcost_child_hiv  dnon_tb_who3_cost
dadc_cost       dcd4_cost       dvl_cost       dvis_cost        dcot_cost       dtb_cost    n_hiv
n_tested_m p_tested_past_year_1549m   p_tested_past_year_1549w  p_mcirc  prop_w_1549_sw prop_w_1564_sw prop_w_ever_sw prop_sw_hiv 
prop_sw_program_visit prop_w_1524_onprep prop_1564_onprep prop_sw_onprep prevalence1549m prevalence1549w prevalence1549 
prevalence_vg1000 incidence1549  incidence1564  prevalence1524w prevalence_sw incidence1549w  incidence1549m  incidence_sw incidence_onprep
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary mtct_prop p_diag p_diag_m p_diag_w p_diag_sw
p_ai_no_arv_c_nnm p_ai_no_arv_c_pim p_ai_no_arv_c_rt184m p_ai_no_arv_c_rt65m p_ai_no_arv_c_rttams  p_k65m  p_m184m
p_ai_no_arv_e_inm p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw p_efa p_taz
p_ten p_zdv p_dol p_3tc p_lpr p_nev p_onart_vl1000  p_artexp_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m p_vl1000_art_12m_onart  p_onart_vl1000_w p_onart_vl1000_m  p_startedline2 p_linefail_ge1 m15r  m25r  m35r  m45r  m55r  w15r  
w25r  w35r  w45r  w55r p_onart_cd4_l500  prop_art_or_prep  prop_prep_tot5yrs prop_sw_onprep   p_onart p_nactive_ge2p00_xyz   p_nactive_ge1p50_xyz death_rate_hiv 
death_rate_hiv_m death_rate_hiv_w death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w p_iime n_infected_inm 
n_tested n_tested_sw test_prop_positive p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  
p_prep_any_ever p_hiv1_prep  p_hiv1_prep_inj p_hiv1_prep_oral   incidence1524w  incidence_sw p_onart_w p_onart_m  p_diag_w p_diag_m p_onart_vl1000 n_tested_w test_prop_positive
prop_prep_inj   ratio_inj_prep_on_tail    pr_ever_prep_inj_res_cab    pr_ev_prep_inj_res_cab_hiv prop_cab_res_o_cab    prop_cab_res_tail    
prop_prep_inj_at_inf_diag   of_all_o_cab_prop_dur_3m of_all_o_cab_prop_dur_6m   p_prep_inj_hiv  prop_cab_dol_res_attr_cab   
n_cur_res_cab  n_cur_res_dol  n_emerge_inm_res_cab  n_switch_prep_from_oral n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_any_start n_prep_oral_start  n_prep_inj_start n_prep_vr_start n_prep_any prop_elig_on_prep p_elig_prep  p_hiv1_prep  prop_onprep_newpge1 
p_prep_elig_past_year p_prep_newp prop_sw_onprep  p_em_inm_res_ever_prep_inj n_o_cab_at_3m    n_o_cab_at_6m    n_o_cab_at_9m   n_o_cab_at_ge12m 
ddaly  p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail of_all_o_cab_prop_dur_9m of_all_o_cab_prop_dur_ge12m
s_em_inm_res_o_cab_off_3m  s_o_cab_or_o_cab_tm1_no_r   s_emerge_inm_res_cab_tail   s_cur_in_prep_inj_tail_no_r  p_emerge_inm_res_cab 
p_cabr_start_rest_prep_inj p_emerge_inm_res_cab_tail  n_death_hiv death_rate_onart n_birth_with_inf_child  p_u_vfail1_this_period n_infection
p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented ddaly_ac_ntd_mtct
dcost_prep  n_art_initiation  n_restart  dcost_prep_oral  dcost_prep_inj  n_line1_fail_this_period  n_need_cd4m

prop_1564_hivneg_onprep  p_newp_prep_hivneg cost n_cd4_lt200 n_cd4_lt200 aids_death_rate  death_rate_onart  death_rate_artexp  
death_rate_hiv death_rate_hiv_all  n_onart n_pop_wide_tld_prep  n_art_or_prep n_prep_inj n_death_hivneg_anycause

p_elig_all_prep_criteria  p_elig_all_prep_cri_hivneg  p_elig_hivneg_onprep  p_prep_elig_onprep_inj n_start_rest_prep_inj_hiv  prop_hivneg_onprep
n_started_prep_inj_hiv n_started_prep_any_hiv  p_pop_wide_tld_hiv  p_pop_wide_tld_prep_elig  p_pop_wide_tld_neg_prep_inelig
n_pop_wide_tld_hiv  n_pop_wide_tld_prep_elig  n_pop_wide_tld_neg_prep_inelig  p_prep_adhg80  n_em_inm_res_o_cab

p_nactive_art_start_lt1p5 p_nactive_art_start_lt2  p_nactive_art_start_lt3  n_ai_naive_no_pmtct_e_inm

&sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection_pop  super_inf_res  an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr fold_tr_newp switch_for_tox  
circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph

effect_sw_prog_prep_any  prob_prep_any_restart_choice 
adh_pattern_prep_oral   rate_test_startprep_any    rate_choose_stop_prep_oral
prep_any_strategy   prob_prep_any_visit_counsel  rate_test_onprep_any  prep_willingness_threshold  
prob_prep_any_restart_choice  
pr_prep_oral_b  rel_prep_oral_adh_younger prep_oral_efficacy    
higher_future_prep_oral_cov  pr_prep_inj_b  prep_inj_efficacy
rate_choose_stop_prep_inj   prep_inj_effect_inm_partner  res_trans_factor_ii
rel_pr_inm_inj_prep_tail_primary      rr_res_cab_dol  hivtest_type_1_init_prep_inj   hivtest_type_1_prep_inj
sens_ttype1_prep_inj_primary sens_ttype1_prep_inj_inf3m sens_ttype1_prep_inj_infge6m
sens_ttype3_prep_inj_primary sens_ttype3_prep_inj_inf3m sens_ttype3_prep_inj_infge6m

effect_sw_prog_prep_any prob_prep_any_restart_choice dol_higher_potency  cab_time_to_lower_threshold_g
sens_tests_prep_inj  pr_inm_inj_prep_primary
pref_prep_inj_beta_s1  testt1_prep_inj_eff_on_res_prim  incr_res_risk_cab_inf_3m  reg_option_107_after_cab

p_emerge_inm_res_cab_notpr

rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_0_to_1 prob_onartvis_1_to_0

pref_prep_oral_beta_s1  res_level_dol_cab_mut  pr_res_dol
;


proc sort data=y;by run option;run;

* l.base is the long file after adding in newly defined variables and selecting only variables of interest - will read this in to graph program;

data    a.l_pop_wide_tld11_with_lost_y; set y;  

proc freq; tables run; where cald = 2020;

run;

data y ; set a.l_pop_wide_tld11_with_lost_y; 


  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

data e; set y; keep &v run cald option ;

proc means  noprint data=e; var &v; output out=y_22 mean= &v._22; by run ; where 2021.5 <= cald < 2022.5; 

proc means noprint data=e; var &v; output out=y_20y mean= &v._20y; by run option ; where 2022.5 <= cald < 2042.50;   

proc means noprint data=e; var &v; output out=y_50y mean= &v._50y; by run option ; where 2022.5 <= cald < 2072.50;
/*
proc means noprint data=e; var &v; output out=y_32 mean= &v._32; by run option ; where 2031.5 <= cald < 2032.50;
*/
proc means noprint data=e; var &v; output out=y_42 mean= &v._42; by run option ; where 2038.5 <= cald < 2045.50;
																				   
proc sort data=y_50y    ; by run; proc transpose data=y_50y     out=t_50y     prefix=&v._50y_  ; var &v._50y    ; by run; 																														
proc sort data=y_20y    ; by run; proc transpose data=y_20y     out=t_20y     prefix=&v._20y_  ; var &v._20y    ; by run; 																														
/* proc sort data=y_32; by run; proc transpose data=y_32 out=t_32 prefix=&v._32_; var &v._32; by run; */																														
proc sort data=y_42; by run; proc transpose data=y_42 out=t_42 prefix=&v._42_; var &v._42; by run; 																														


data &v ; merge y_22 t_20y /* t_32 */ t_42 t_50y ;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var; 

%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=p_newp_sw); %var(v=prop_sw_newp0);  %var(v=p_newp_prep);
%var(v=n_tested_m);
%var(v=p_tested_past_year_1549m)  ; %var(v=p_tested_past_year_1549w)  ;
%var(v=p_mcirc) ; * %var(v=p_mcirc_1519m); * %var(v=p_mcirc_2024m);* %var(v=p_mcirc_2529m);
* %var(v=p_mcirc_3034m);* %var(v=p_mcirc_3539m);* %var(v=p_mcirc_4044m);* %var(v=p_mcirc_4549m); 
* %var(v=p_mcirc_5064m); * %var(v=p_mcirc_1549m);
* %var(v=p_vmmc); * %var(v=p_vmmc_1519m); * %var(v=p_vmmc_2024m);* %var(v=p_vmmc_2529m); * %var(v=p_vmmc_3039m);*  %var(v=p_vmmc_4049m);
* %var(v=p_vmmc_5064m); *  %var(v=p_vmmc_1549m);
%var(v=prop_w_1549_sw); %var(v=prop_w_1564_sw); %var(v=prop_w_ever_sw); %var(v=prop_sw_hiv); %var(v=prop_sw_program_visit); 
%var(v=prop_w_1524_onprep); %var(v=prop_1564_onprep);
%var(v=prop_sw_onprep); %var(v=prevalence1549m); %var(v=prevalence1549w); %var(v=prevalence1549); 
* %var(v=prevalence1519w); * %var(v=prevalence1519m); * %var(v=prevalence2024w); * %var(v=prevalence2024m); * %var(v=prevalence2529w);  	  
* %var(v=prevalence2529m); * %var(v=prevalence3034w);*  %var(v=prevalence3034m);* %var(v=prevalence3539w); * %var(v=prevalence3539m);  	  
* %var(v=prevalence4044w); *  %var(v=prevalence4044m); *  %var(v=prevalence4549w); *  %var(v=prevalence4549m);  
%var(v=prevalence_vg1000); %var(v=incidence1549);  %var(v=incidence1564);  %var(v=n_infection);  %var(v=incidence_onprep);
%var(v=prevalence1524w); *  %var(v=prevalence1524m); %var(v=prevalence_sw);
* %var(v=prevalence5054w); * %var(v=prevalence5054m); * %var(v=prevalence5559w); * %var(v=prevalence5559m); * %var(v=prevalence6064w); * %var(v=prevalence6064m); 
* %var(v=prevalence65plw); * %var(v=prevalence65plm); * %var(v=r_prev_sex_1549); * %var(v=prevalence_hiv_preg);
* %var(v=r_prev_1519w_4549w );  * %var(v=r_prev_2024w_4549w  );  * %var(v=r_prev_2529w_4549w );  * %var(v=r_prev_3034w_4549w  ); 
* %var(v=r_prev_3539w_4549w );  * %var(v=r_prev_4044w_4549w  );  * %var(v=r_prev_5054w_4549w );  * %var(v=r_prev_5559w_4549w );
* %var(v=r_prev_6064w_4549w );  * %var(v=r_prev_65plw_4549w  );  * %var(v=r_prev_1519m_4549w );  * %var(v=r_prev_2024m_4549w  );  * %var(v=r_prev_2529m_4549w );
* %var(v=r_prev_3034m_4549w );  * %var(v=r_prev_3539m_4549w  );  * %var(v=r_prev_4044m_4549w );  * %var(v=r_prev_4549m_4549w  );  * %var(v=r_prev_5054m_4549w );
* %var(v=r_prev_5559m_4549w );  * %var(v=r_prev_6064m_4549w );  * %var(v=r_prev_65plm_4549w );
%var(v=incidence1549w);  %var(v=incidence1549m);  %var(v=incidence_sw); 
%var(v=p_inf_vlsupp);  %var(v=p_inf_newp);  %var(v=p_inf_ep);  %var(v=p_inf_diag);  %var(v=p_inf_naive);   %var(v=p_inf_primary); 
%var(v=mtct_prop); %var(v=p_diag); %var(v=p_diag_m); %var(v=p_diag_w); %var(v=p_diag_sw);
* %var(v=p_diag_m1524); * %var(v=p_diag_w1524);
%var(v=p_ai_no_arv_c_nnm); %var(v=p_ai_no_arv_c_pim); %var(v=p_ai_no_arv_c_rt184m); %var(v=p_ai_no_arv_c_rt65m); %var(v=p_ai_no_arv_c_rttams); 
%var(v=p_ai_no_arv_e_inm); 
%var(v=p_artexp_diag); %var(v=p_onart_diag); %var(v=p_onart_diag_w); %var(v=p_onart_diag_m); %var(v=p_onart_diag_sw); %var(v=p_efa); %var(v=p_taz);
%var(v=p_ten); %var(v=p_zdv); %var(v=p_dol); %var(v=p_3tc); %var(v=p_lpr); %var(v=p_nev); %var(v=p_onart_vl1000);  %var(v=p_artexp_vl1000);
%var(v=p_vl1000); %var(v=p_vg1000); %var(v=p_vl1000_m);  %var(v=p_vl1000_w);  %var(v=p_vl1000_m_1524);  %var(v=p_vl1000_w_1524);  
%var(v=p_vl1000_art_12m); %var(v=p_vl1000_art_12m_onart); 
* %var(v=p_onart_m); * %var(v=p_onart_w); 
%var(v=p_onart_vl1000_w); %var(v=p_onart_vl1000_m); * %var(v= p_onart_vl1000_1524); * %var(v=p_onart_vl1000_sw);
* %var(v=prev_vg1000_newp_m); * %var(v=prev_vg1000_newp_w);  %var(v= p_startedline2) ;
* %var(v=p_tle);  * %var(v=p_tld);  * %var(v=p_zld);  * %var(v=p_zla);  * %var(v=p_otherreg);  * %var(v=p_drug_level_test); %var(v=p_linefail_ge1);
* %var(v=aids_death_rate);    %var(v=death_rate_onart);     %var(v=dcost);    %var(v= dart_cost_y);
  %var(v=dadc_cost);     %var(v=dcd4_cost);     %var(v=dvl_cost);     %var(v=dvis_cost);      %var(v=dcot_cost);     %var(v=dtb_cost);   
  %var(v=dres_cost);    %var(v=dtest_cost);     %var(v=d_t_adh_int_cost);     %var(v=dswitchline_cost);    %var(v=dtaz_cost);     %var(v=dcost_drug_level_test);
  %var(v=dclin_cost );  %var(v=dnon_tb_who3_cost); 
  %var(v=dcost_circ );    %var(v=dcost_condom_dn);
   %var(v=dcost_prep_oral);   %var(v=dcost_prep_inj);
 %var(v=dcost_prep_visit );   %var(v=dcost_prep_visit_oral );   %var(v=dcost_prep_visit_inj );     %var(v=dcost_prep );   * %var(v=dcost_drug_level_test ); 
  %var(v=dcost_clin_care );    %var(v=dcost_non_aids_pre_death );    %var(v=dcost_child_hiv );    %var(v=dzdv_cost );     %var(v=dten_cost );     %var(v=d3tc_cost );   
  %var(v=dnev_cost );     %var(v=dlpr_cost );     %var(v=ddar_cost );     %var(v=dtaz_cost );      %var(v=defa_cost );     %var(v=ddol_cost );
%var(v=m15r);  %var(v=m25r);  %var(v=m35r);  %var(v=m45r);  %var(v=m55r);  %var(v=w15r);  %var(v=w25r);  %var(v=w35r);  %var(v=w45r);  %var(v=w55r)
* %var(v=r_efa_hiv); * %var(v=p_onart_cd4_l200);
* %var(v=p_dol_2vg1000_dolr1_adh0); * %var(v=p_dol_2vg1000_dolr1_adh1); * %var(v=p_dol_2vg1000_dolr0_adh0); * %var(v=p_dol_2vg1000_dolr0_adh1);
%var(v=p_onart_cd4_l500);  %var(v=prop_art_or_prep);  * %var(v=n_sw_1564); * %var(v=n_sw_1549);   %var(v=prop_sw_onprep);   %var(v=p_onart);
* %var(v=p_o_zdv_tox);   * %var(v=p_o_3tc_tox);   * %var(v=p_o_ten_tox);   * %var(v=p_o_taz_tox);   * %var(v=p_o_lpr_tox);   * %var(v=p_o_efa_tox);   
* %var(v=p_o_nev_tox);  * %var(v=p_o_dol_tox);   * %var(v=p_o_zdv_adh_hi);   * %var(v=p_o_3tc_adh_hi);   * %var(v=p_o_ten_adh_hi);  
* %var(v=p_o_taz_adh_hi);   * %var(v=p_o_lpr_adh_hi);   * %var(v=p_o_efa_adh_hi);   * %var(v=p_o_nev_adh_hi);   * %var(v=p_o_dol_adh_hi);  
* %var(v= p_o_tle_tox);   * %var(v=p_o_tld_tox);   * %var(v=p_o_zla_tox);   * %var(v=p_o_zld_tox);    * %var(v=p_o_tle_adh_hi);   * %var(v=p_o_tld_adh_hi);   
* %var(v=p_o_zla_adh_hi);   * %var(v=p_o_zld_adh_hi);   * %var(v=p_adh_hi);    * %var(v=s_a_zld_if_reg_op_116);
* %var(v=p_nactive_ge2p75_xyz);  * %var(v=p_adh_hi_xyz_ot1);   * %var(v=p_adh_hi_xyz_ot2);   * %var(v=p_adh_hi_xyz_itt);   * %var(v=p_e_rt65m_xyz);   
%var(v=p_nactive_ge2p00_xyz);   %var(v=p_nactive_ge1p50_xyz); 
* %var(v=p_184m_ontle_vlg1000);  * %var(v=p_65m_ontle_vlg1000);  * %var(v=p_nnm_ontle_vlg1000);   * %var(v=p_184m_ontld_vlg1000);   * %var(v=p_65m_ontld_vlg1000);  
* %var(v=p_nnm_ontld_vlg1000);   * %var(v=p_inm_ontld_vlg1000);   * %var(v=p_inm_ontld_vlg1000);   
* %var(v=p_tams_ontle_vlg1000);  * %var(v=p_tams_ontld_vlg1000);    %var(v=p_k65m);   %var(v=p_m184m);
%var(v=death_rate_hiv); %var(v=death_rate_hiv_m); %var(v=death_rate_hiv_w);
%var(v=death_rate_hiv_all);%var(v=death_rate_hiv_all_m);%var(v=death_rate_hiv_all_w);
%var(v=p_iime); %var(v=n_infected_inm); * %var(v=p_pime); * %var(v=p_nnme);   *  %var(v=n_pregnant_ntd); *  %var(v=n_preg_odabe);
  %var(v=n_birth_with_inf_child);  %var(v=n_tested); %var(v=n_tested_sw); %var(v=test_prop_positive);
%var(v=p_vlg1000_onart_65m);   %var(v=p_vlg1000_onart_184m);   %var(v=p_elig_prep); %var(v=prop_elig_on_prep);   * %var(v= n_hiv1_prep);
* %var(v= n_hiv1_prep_inj); * %var(v= n_hiv1_prep_oral);
  %var(v= n_prep_any); * %var(v=n_covid); * %var(v=n_death_covid);  * %var(v=n_death);   %var(v=n_death_hiv);   %var(v= n_hiv);
%var(v=p_prep_any_ever); %var(v=p_hiv1_prep);  %var(v=p_hiv1_prep_inj); %var(v=p_hiv1_prep_oral); %var(v=incidence1524w);   * %var(v=incidence1524m) ;
* %var(v=incidence2534w);   * %var(v=incidence2534m) ; * %var(v=incidence3544w);   * %var(v=incidence3544m) ;* %var(v=incidence4554w);   * %var(v=incidence4554m) ;
* %var(v=incidence5564w);   * %var(v=incidence5564m) ;  %var(v=incidence_sw);  * %var (v=n_mcirc1549_3m) ;* %var (v=n_vmmc1549_3m); 
* %var(v=n_new_inf1549m); * %var(v=n_new_inf1549w); * %var(v=n_new_inf1549);* %var(v=t_sw_newp) ;
* %var(v=p_hypert_1549); * %var(v=p_hypert_5059); * %var(v=p_hypert_6069); * %var(v=p_hypert_7079); * %var(v=p_hypert_ge80);
* %var(v=p_diagnosed_hypert_1549); * %var(v=p_diagnosed_hypert_5059); * %var(v=p_diagnosed_hypert_6069); * %var(v=p_diagnosed_hypert_7079); 
* %var(v=p_diagnosed_hypert_ge80);  * %var(v=p_on_anti_hypert_1549); * %var(v=p_on_anti_hypert_5059); * %var(v=p_on_anti_hypert_6069); 
* %var(v=p_on_anti_hypert_7079); * %var(v=p_on_anti_hypert_ge80); 
* %var(v=p_hypert180_1549);  * %var(v=p_hypert180_5059);  * %var(v=p_hypert180_6069);  * %var(v=p_hypert180_7079);  * %var(v=p_hypert180_ge80); 
* %var(v=p_on1drug_antihyp_1549);   * %var(v=p_on2drug_antihyp_1549);   * %var(v=p_on3drug_antihyp_1549);    * %var(v=p_on1drug_antihyp_5059);   
* %var(v=p_on2drug_antihyp_5059); 
* %var(v=p_on3drug_antihyp_5059);    * %var(v=p_on1drug_antihyp_6069);    * %var(v=p_on2drug_antihyp_6069);    * %var(v=p_on3drug_antihyp_6069);   
* %var(v=p_on1drug_antihyp_7079);    * %var(v=p_on2drug_antihyp_7079); 
* %var(v=p_on3drug_antihyp_7079);    * %var(v=p_on1drug_antihyp_ge80);    * %var(v=p_on2drug_antihyp_ge80);    * %var(v=p_on3drug_antihyp_ge80); 
* %var(v=p_ahd_re_enter_care_100);   * %var(v=p_ahd_re_enter_care_200); 
* %var(v=p_hypert_1549m);  * %var(v=p_hypert_5059m); * %var(v=p_hypert_6069m);  * %var(v=p_hypert_7079m);  * %var(v=p_hypert_ge80m);  
* %var(v=p_diagnosed_hypert_1549m); 
* %var(v=p_diagnosed_hypert_5059m);  * %var(v=p_diagnosed_hypert_6069m);  * %var(v=p_diagnosed_hypert_7079m);  * %var(v=p_diagnosed_hypert_ge80m);  
* %var(v=p_on_anti_hypert_1549m); * %var(v=p_on_anti_hypert_5059m);  * %var(v=p_on_anti_hypert_6069m);  * %var(v=p_on_anti_hypert_7079m);  
* %var(v=p_on_anti_hypert_ge80m);
* %var(v=p_hypert_1549w);  * %var(v=p_hypert_5059w); * %var(v=p_hypert_6069w);  * %var(v=p_hypert_7079w);  * %var(v=p_hypert_ge80w);  
* %var(v=p_diagnosed_hypert_1549w); 
* %var(v=p_diagnosed_hypert_5059w);  * %var(v=p_diagnosed_hypert_6069w);  * %var(v=p_diagnosed_hypert_7079w);  * %var(v=p_diagnosed_hypert_ge80w);  
* %var(v=p_on_anti_hypert_1549w); * %var(v=p_on_anti_hypert_5059w);  * %var(v=p_on_anti_hypert_6069w);  * %var(v=p_on_anti_hypert_7079w);  
* %var(v=p_on_anti_hypert_ge80w);
* %var(v=n_dead_hivpos_cause1 ); %var(v=rate_dead_hivpos_cause1); * %var(v=n_dead_hivpos_tb ); * %var(v=rate_dead_hivpos_tb); * %var(v=n_dead_hivpos_cause4 ); 
* %var(v=rate_dead_hivpos_cause4 );* %var(v=n_dead_hivpos_crypm ); * %var(v=rate_dead_hivpos_crypm); * %var(v=n_dead_hivpos_sbi ); * %var(v=rate_dead_hivpos_sbi);
* %var(v=n_dead_hivpos_oth_adc ); * %var(v=rate_dead_hivpos_oth_adc );* %var(v=n_dead_hivpos_cause2 ); * %var(v=rate_dead_hivpos_cause2 );
* %var(v=n_dead_hivpos_cause3 ); * %var(v=rate_dead_hivpos_cause3 );	* %var(v=n_dead_hivpos_cvd ); * %var(v=rate_dead_hivpos_cvd );
* %var(v=n_dead_cvd ); * %var(v=rate_dead_cvd );	* %var(v=n_dead_tb ); * %var(v=rate_dead_tb ); * %var(v=n_dead_hivneg_cvd ); * %var(v=rate_dead_hivneg_cvd);
* %var(v=n_dead_hivneg_tb ); * %var(v=rate_dead_hivneg_tb); * %var(v=n_dead_hivneg_cause2); * %var(v=rate_dead_hivneg_cause2 ); * %var(v=n_dead_hivneg_cause3 ); 
* %var(v=rate_dead_hivneg_cause3 );	* %var(v=n_dead_hivneg_cause4 ); * %var(v=rate_dead_hivneg_cause4 ); * %var(v=n_dead_hivneg_cause5 ); 
* %var(v=n_cd4_lt50); * %var(v=n_cd4_lt200);
* %var(v=rate_dead_hivneg_cause5 );  * %var(v=rate_dead_allage); * %var(v=rate_dead_hivneg_anycause); * %var(v=rate_dead_hivpos_anycause); 
* %var(v=rate_dead_cvd_3039m);	* %var(v=rate_dead_cvd_4049m); * %var(v=rate_dead_cvd_5059m); * %var(v=rate_dead_cvd_6069m); * %var(v=rate_dead_cvd_7079m); 
* %var(v=rate_dead_cvd_ge80m); * %var(v=rate_dead_cvd_3039w); 
* %var(v=rate_dead_cvd_4049w); * %var(v=rate_dead_cvd_5059w); * %var(v=rate_dead_cvd_6069w); * %var(v=rate_dead_cvd_7079w); * %var(v=rate_dead_cvd_ge80w); 
* %var(v=n_death_hivpos_anycause); * %var(v= n_death_2059_m);  * %var(v=n_death_2059_w);
* %var(v=p_age1549_hivneg );  * %var(v=p_age1549_hiv ); * %var(v=p_onart_m_age50pl ); * %var(v=p_onart_w_age50pl ); * %var(v=n_onart);
* %var(v=prevalence_hiv_preg); %var(v=p_onart_w); %var(v=p_onart_m); * %var(v=n_onart_w); * %var(v=n_onart_m);  %var(v=p_diag_w); %var(v=p_diag_m); 
%var(v=p_onart_vl1000);  * %var(v=n_new_inf1549m); * %var(v=n_new_inf1549w); 
%var(v=n_tested_w); %var(v=test_prop_positive);
%var(v=prop_prep_inj);   %var(v=ratio_inj_prep_on_tail);    %var(v=pr_ever_prep_inj_res_cab);    %var(v=pr_ev_prep_inj_res_cab_hiv);
%var(v=prop_cab_res_o_cab);    %var(v=prop_cab_res_tail);      %var(v=prop_prep_inj_at_inf_diag);   
%var(v=of_all_o_cab_prop_dur_3m);
%var(v=of_all_o_cab_prop_dur_6m);   %var(v=p_prep_inj_hiv);  %var(v=prop_cab_dol_res_attr_cab);   %var(v=n_cur_res_cab);  %var(v=n_cur_res_dol);  
%var(v=n_emerge_inm_res_cab);  %var(v=n_switch_prep_from_oral); %var(v=n_switch_prep_from_inj);  %var(v=n_switch_prep_to_oral);  
%var(v=n_switch_prep_to_inj);  %var(v=n_prep_any_start); %var(v=n_prep_oral_start);  %var(v=n_prep_inj_start); %var(v=n_prep_vr_start);
%var(v=n_prep_any); %var(v=prop_elig_on_prep); %var(v=p_elig_prep);  %var(v=prop_onprep_newpge1); %var(v=p_prep_elig_past_year); 
%var(v=p_prep_newp); %var(v=prop_sw_onprep);  %var(v=p_em_inm_res_ever_prep_inj);  %var(v=p_cabr_start_rest_prep_inj);
%var(v=n_o_cab_at_3m);    %var(v=n_o_cab_at_6m);    %var(v=n_o_cab_at_9m);   %var(v=n_o_cab_at_ge12m); 
%var(v=ddaly); %var(v=p_emerge_inm_res_cab);  %var(v=p_emerge_inm_res_cab_tail); %var(v=ddaly_ac_ntd_mtct);
%var(v=of_all_o_cab_prop_dur_9m); %var(v=of_all_o_cab_prop_dur_ge12m);
%var(v=s_em_inm_res_o_cab_off_3m);  %var(v=s_o_cab_or_o_cab_tm1_no_r);   %var(v=s_emerge_inm_res_cab_tail);   %var(v=s_cur_in_prep_inj_tail_no_r);
%var(v=p_emerge_inm_res_cab); %var(v=p_emerge_inm_res_cab_tail);
%var(v=p_prep_init_primary_res); %var(v=p_prep_reinit_primary_res);   %var(v=p_emerge_inm_res_cab_prim);  %var(v=n_prep_primary_prevented);   
%var(v=p_prep_primary_prevented); %var(v=p_u_vfail1_this_period); 
%var(v=n_art_initiation);  %var(v=n_restart);     %var(v=n_line1_fail_this_period);    %var(v=n_need_cd4m);
%var(v=p_elig_all_prep_criteria);  %var(v=p_elig_all_prep_cri_hivneg);  %var(v=p_elig_hivneg_onprep);  %var(v=p_prep_elig_onprep_inj);
%var(v=prop_1564_hivneg_onprep); %var(v=prop_hivneg_onprep); %var(v=pref_prep_oral_beta_s1);
%var(v=n_started_prep_inj_hiv); %var(v=n_started_prep_any_hiv);   %var(v=p_pop_wide_tld_hiv);   %var(v=p_pop_wide_tld_prep_elig);   
%var(v=p_pop_wide_tld_neg_prep_inelig); %var(v=n_pop_wide_tld_hiv);   %var(v=n_pop_wide_tld_prep_elig);   %var(v=n_pop_wide_tld_neg_prep_inelig); 
%var(v=prop_prep_tot5yrs); %var(v=n_start_rest_prep_inj_hiv); %var(v=n_prep_inj);%var(v=p_prep_adhg80);
%var(v=p_nactive_art_start_lt1p5);   %var(v=p_nactive_art_start_lt2);   %var(v=p_nactive_art_start_lt3); 
%var(v=n_ai_naive_no_pmtct_e_inm);


data   a.wide_outputs; merge 
s_alive p_w_giv_birth_this_per p_newp_ge1 p_newp_ge5   gender_r_newp p_newp_sw prop_sw_newp0  p_newp_prep  dcost  dart_cost_y
dcost_prep_visit dres_cost     dtest_cost    d_t_adh_int_cost    dswitchline_cost   dtaz_cost   dclin_cost  dcost_circ dcost_condom_dn 
dcost_prep_visit_oral dcost_prep_visit_inj   dcost_prep  dcost_clin_care  dcost_non_aids_pre_death  dcost_child_hiv  dnon_tb_who3_cost
dadc_cost       dcd4_cost       dvl_cost       dvis_cost        dcot_cost       dtb_cost    n_hiv
n_tested_m p_tested_past_year_1549m   p_tested_past_year_1549w  p_mcirc  prop_w_1549_sw prop_w_1564_sw prop_w_ever_sw prop_sw_hiv 
prop_sw_program_visit prop_w_1524_onprep prop_1564_onprep prop_sw_onprep prevalence1549m prevalence1549w prevalence1549 
prevalence_vg1000 incidence1549  incidence1564  prevalence1524w prevalence_sw incidence1549w  incidence1549m  incidence_sw incidence_onprep
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary mtct_prop p_diag p_diag_m p_diag_w p_diag_sw
p_ai_no_arv_c_nnm p_ai_no_arv_c_pim p_ai_no_arv_c_rt184m p_ai_no_arv_c_rt65m p_ai_no_arv_c_rttams  p_k65m  p_m184m
p_ai_no_arv_e_inm p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw p_efa p_taz
p_ten p_zdv p_dol p_3tc p_lpr p_nev p_onart_vl1000  p_artexp_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m p_vl1000_art_12m_onart  p_onart_vl1000_w p_onart_vl1000_m  p_startedline2 p_linefail_ge1 m15r  m25r  m35r  m45r  m55r  w15r  
w25r  w35r  w45r  w55r p_onart_cd4_l500  prop_art_or_prep  prop_sw_onprep   p_onart p_nactive_ge2p00_xyz   p_nactive_ge1p50_xyz death_rate_hiv 
death_rate_hiv_m death_rate_hiv_w death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w p_iime n_infected_inm 
n_tested n_tested_sw test_prop_positive p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  
p_prep_any_ever p_hiv1_prep p_hiv1_prep_inj p_hiv1_prep_oral incidence1524w  incidence_sw p_onart_w p_onart_m  p_diag_w p_diag_m p_onart_vl1000 n_tested_w test_prop_positive
prop_prep_inj   ratio_inj_prep_on_tail    pr_ever_prep_inj_res_cab    pr_ev_prep_inj_res_cab_hiv prop_cab_res_o_cab    prop_cab_res_tail    
prop_prep_inj_at_inf_diag   of_all_o_cab_prop_dur_3m of_all_o_cab_prop_dur_6m   p_prep_inj_hiv  prop_cab_dol_res_attr_cab   
n_cur_res_cab  n_cur_res_dol  n_emerge_inm_res_cab  n_switch_prep_from_oral n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_any_start n_prep_oral_start  n_prep_inj_start n_prep_vr_start n_prep_any prop_elig_on_prep p_elig_prep  prop_onprep_newpge1 
p_prep_elig_past_year p_prep_newp prop_sw_onprep  p_em_inm_res_ever_prep_inj n_o_cab_at_3m    n_o_cab_at_6m    n_o_cab_at_9m   n_o_cab_at_ge12m 
ddaly  p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail of_all_o_cab_prop_dur_9m of_all_o_cab_prop_dur_ge12m
s_em_inm_res_o_cab_off_3m  s_o_cab_or_o_cab_tm1_no_r   s_emerge_inm_res_cab_tail   s_cur_in_prep_inj_tail_no_r  p_emerge_inm_res_cab 
p_cabr_start_rest_prep_inj p_emerge_inm_res_cab_tail  n_death_hiv death_rate_onart n_birth_with_inf_child  p_u_vfail1_this_period n_infection
p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented ddaly_ac_ntd_mtct
dcost_prep  n_art_initiation  n_restart  dcost_prep_oral  dcost_prep_inj  n_line1_fail_this_period  n_need_cd4m
p_elig_all_prep_criteria  p_elig_all_prep_cri_hivneg  p_elig_hivneg_onprep  p_prep_elig_onprep_inj prop_1564_hivneg_onprep prop_hivneg_onprep
pref_prep_oral_beta_s1 n_started_prep_inj_hiv n_started_prep_any_hiv  p_pop_wide_tld_hiv  p_pop_wide_tld_prep_elig  p_pop_wide_tld_neg_prep_inelig
n_pop_wide_tld_hiv  n_pop_wide_tld_prep_elig  n_pop_wide_tld_neg_prep_inelig prop_prep_tot5yrs n_start_rest_prep_inj_hiv n_prep_inj n_prep_any
p_prep_adhg80 p_nactive_art_start_lt1p5 p_nactive_art_start_lt2  p_nactive_art_start_lt3 n_ai_naive_no_pmtct_e_inm;


proc contents; run;

proc sort; by run; run;

***Macro par used to add in values of all sampled parameters - values before intervention;
data f; set y; 
if cald=2020;

keep 

run cald 

&sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection_pop  super_inf_res  an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr fold_tr_newp switch_for_tox  
circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph

effect_sw_prog_prep_any  prob_prep_any_restart_choice 
adh_pattern_prep_oral   rate_test_startprep_any    rate_choose_stop_prep_oral
prep_any_strategy   prob_prep_any_visit_counsel  rate_test_onprep_any  prep_willingness_threshold  
prob_prep_any_restart_choice  
pr_prep_oral_b  rel_prep_oral_adh_younger prep_oral_efficacy    
higher_future_prep_oral_cov  pr_prep_inj_b  prep_inj_efficacy
rate_choose_stop_prep_inj   prep_inj_effect_inm_partner  res_trans_factor_ii
rel_pr_inm_inj_prep_tail_primary      rr_res_cab_dol  hivtest_type_1_init_prep_inj   hivtest_type_1_prep_inj
sens_ttype1_prep_inj_primary sens_ttype1_prep_inj_inf3m sens_ttype1_prep_inj_infge6m
sens_ttype3_prep_inj_primary sens_ttype3_prep_inj_inf3m sens_ttype3_prep_inj_infge6m

effect_sw_prog_prep_any prob_prep_any_restart_choice dol_higher_potency  cab_time_to_lower_threshold_g
sens_tests_prep_inj  pr_inm_inj_prep_primary
pref_prep_inj_beta_s1  testt1_prep_inj_eff_on_res_prim  incr_res_risk_cab_inf_3m  reg_option_107_after_cab
prob_prep_pop_wide_tld
p_emerge_inm_res_cab_notpr
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_0_to_1 prob_onartvis_1_to_0
p_nactive_art_start_lt1p5 p_nactive_art_start_lt2  p_nactive_art_start_lt3  res_level_dol_cab_mut  pr_res_dol

;

%macro par(p=);

* &p ;
proc means noprint data=f; var &p ; output out=y_ mean= &p; by run ; where cald = 2020; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=&sf); 
%par(p=sex_beh_trans_matrix_m ); %par(p=sex_beh_trans_matrix_w ); %par(p=sex_age_mixing_matrix_m ); %par(p=sex_age_mixing_matrix_w ); %par(p=p_rred_p );
%par(p=p_hsb_p ); %par(p=newp_factor ); %par(p=eprate ) %par(p=conc_ep ); %par(p=ch_risk_diag ); %par(p=ch_risk_diag_newp );
%par(p=ych_risk_beh_newp ); %par(p=ych2_risk_beh_newp ); %par(p=ych_risk_beh_ep ); %par(p=exp_setting_lower_p_vl1000 );
%par(p=external_exp_factor ); %par(p=rate_exp_set_lower_p_vl1000 ); %par(p=prob_pregnancy_base ); %par(p=fold_change_w );
%par(p=fold_change_yw ); %par(p=fold_change_sti ); %par(p=tr_rate_undetec_vl); %par(p=super_infection_pop ); %par(p= super_inf_res ); 
%par(p=an_lin_incr_test );
%par(p=date_test_rate_plateau ); %par(p=rate_testanc_inc ); %par(p=incr_test_rate_sympt ); %par(p=max_freq_testing );
%par(p=test_targeting ); %par(p=fx );  %par(p=gx );  %par(p=adh_pattern ); %par(p=prob_loss_at_diag ); %par(p=pr_art_init ); 
%par(p=rate_lost ); %par(p=prob_lost_art ); %par(p=rate_return ); %par(p=rate_restart ); %par(p=rate_int_choice );
%par(p=clinic_not_aw_int_frac ); %par(p=res_trans_factor_nn ); %par(p=rate_loss_persistence ); %par(p=incr_rate_int_low_adh );
%par(p=poorer_cd4rise_fail_nn ); %par(p=poorer_cd4rise_fail_ii ); %par(p=rate_res_ten );
%par(p=fold_change_mut_risk ); %par(p=adh_effect_of_meas_alert ); %par(p=pr_switch_line ); %par(p=prob_vl_meas_done );
%par(p=red_adh_tb_adc ); %par(p=red_adh_tox_pop ); %par(p=add_eff_adh_nnrti ); %par(p=altered_adh_sec_line_pop );
%par(p=prob_return_adc ); %par(p=prob_lossdiag_adctb ); %par(p=prob_lossdiag_non_tb_who3e); %par(p=higher_newp_less_engagement );
%par(p=fold_tr ); %par(p=fold_tr_newp); %par(p=switch_for_tox ); %par(p=adh_pattern_prep_oral ); %par(p=rate_test_startprep_any ); 
%par(p=circ_inc_rate ); %par(p=p_hard_reach_w ); %par(p=hard_reach_higher_in_men );
%par(p=p_hard_reach_m ); %par(p=inc_cat ); %par(p= base_rate_sw );  %par(p= base_rate_stop_sexwork );    %par(p= rred_a_p );
%par(p= rr_int_tox );     %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg ); %par(p=prep_any_strategy ); %par(p=reg_option_107_after_cab);

%par(p=effect_visit_prob_diag_l);  %par(p=tb_base_prob_diag_l); %par(p=crypm_base_prob_diag_l); %par(p=tblam_eff_prob_diag_l);  
%par(p=crag_eff_prob_diag_l);%par(p=sbi_base_prob_diag_l); %par(p=rel_rate_death_tb_diag_e); %par(p=rel_rate_death_oth_adc_diag_e); 
%par(p=rel_rate_death_crypm_diag_e);%par(p=rel_rate_death_sbi_diag_e);  %par(p=incr_death_rate_tb); %par(p=incr_death_rate_oth_adc);
%par(p=incr_death_rate_crypm); %par(p=incr_death_rate_sbi);%par(p=cm_1stvis_return_vlmg1000);  %par(p=crag_cd4_l200); %par(p=crag_cd4_l100);  
%par(p=tblam_cd4_l200);  %par(p=tblam_cd4_l100);    %par(p=effect_tb_proph);   %par(p=effect_crypm_proph);  %par(p=effect_sbi_proph);

%par(p=sw_init_newp); %par(p=sw_trans_matrix);
%par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); 
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); 

%par(p=effect_sw_prog_prep_any);  %par(p=prob_prep_any_restart_choice);  
%par(p=prob_prep_any_visit_counsel);  %par(p=rate_test_onprep_any); %par(p=prep_willingness_threshold);  
%par(p=prob_prep_any_restart_choice);  
%par(p=pr_prep_oral_b);  %par(p=rel_prep_oral_adh_younger); %par(p=prep_oral_efficacy);    
%par(p=rate_choose_stop_prep_oral);  %par(p=higher_future_prep_oral_cov);  %par(p=pr_prep_inj_b);  %par(p=prep_inj_efficacy);
%par(p=rate_choose_stop_prep_inj);   %par(p=prep_inj_effect_inm_partner);  %par(p=res_trans_factor_ii);
%par(p=rel_pr_inm_inj_prep_tail_primary);      %par(p=rr_res_cab_dol);  %par(p=hivtest_type_1_init_prep_inj);   %par(p=hivtest_type_1_prep_inj);
 %par(p=sens_ttype1_prep_inj_primary);  %par(p=sens_ttype1_prep_inj_inf3m);  %par(p=sens_ttype1_prep_inj_infge6m);
 %par(p=sens_ttype3_prep_inj_primary);  %par(p=sens_ttype3_prep_inj_inf3m);  %par(p=sens_ttype3_prep_inj_infge6m);
%par(p=dol_higher_potency); %par(p=cab_time_to_lower_threshold_g);  %par(p=sens_tests_prep_inj);  %par(p=pr_inm_inj_prep_primary);
%par(p=pref_prep_inj_beta_s1); %par(p=testt1_prep_inj_eff_on_res_prim);  %par(p=incr_res_risk_cab_inf_3m);
%par(p=p_emerge_inm_res_cab_notpr);
%par(p=rr_return_pop_wide_tld); %par(p=rr_interrupt_pop_wide_tld);  %par(p=prob_tld_prep_if_untested);  %par(p=prob_onartvis_0_to_1);
 %par(p=prob_onartvis_1_to_0);   %par(p=prob_prep_pop_wide_tld);  %par(p=res_level_dol_cab_mut); %par(p=pr_res_dol);

data a.wide_par; merge 
&sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection_pop  super_inf_res  an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr fold_tr_newp switch_for_tox  
circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph

effect_sw_prog_prep_any  prob_prep_any_restart_choice 
adh_pattern_prep_oral   rate_test_startprep_any    rate_choose_stop_prep_oral
prep_any_strategy   prob_prep_any_visit_counsel  rate_test_onprep_any  prep_willingness_threshold  
prob_prep_any_restart_choice  
pr_prep_oral_b  rel_prep_oral_adh_younger prep_oral_efficacy    
higher_future_prep_oral_cov  pr_prep_inj_b  prep_inj_efficacy
rate_choose_stop_prep_inj   prep_inj_effect_inm_partner  res_trans_factor_ii
rel_pr_inm_inj_prep_tail_primary      rr_res_cab_dol  hivtest_type_1_init_prep_inj   hivtest_type_1_prep_inj
sens_ttype1_prep_inj_primary sens_ttype1_prep_inj_inf3m sens_ttype1_prep_inj_infge6m
sens_ttype3_prep_inj_primary sens_ttype3_prep_inj_inf3m sens_ttype3_prep_inj_infge6m

effect_sw_prog_prep_any prob_prep_any_restart_choice dol_higher_potency  cab_time_to_lower_threshold_g
sens_tests_prep_inj  pr_inm_inj_prep_primary
pref_prep_inj_beta_s1  testt1_prep_inj_eff_on_res_prim  incr_res_risk_cab_inf_3m  reg_option_107_after_cab
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_1_to_0 prob_onartvis_1_to_0
 prob_prep_pop_wide_tld

p_emerge_inm_res_cab_notpr res_level_dol_cab_mut  pr_res_dol
;

run;
proc sort; by run;run;


* To get one row per run;

  data  a.w_pop_wide_tld11_with_lost     ; 
  merge a.wide_outputs         a.wide_par     ;
  by run;


  data w_pop_wide_tld ;
  set a.w_pop_wide_tld11_with_lost ;


if incidence1549_22 >= 0.15 and prevalence1549_22 <= 0.25;

if prep_any_strategy = 4;

d_prop_elig_on_prep_20y_3_2 =  prop_elig_on_prep_20y_3 -  prop_elig_on_prep_20y_2 ;
d_prop_elig_on_prep_20y_3_2 = round(d_prop_elig_on_prep_20y_3_2, 0.01);
if d_prop_elig_on_prep_20y_3_2 >= 0.1;

* sensitivity analysis;
* if 0.05 <= d_prop_elig_on_prep_20y_3_2 < 0.1;


* if run <=  943258673 ;  * for n=1000 pop_wide_tld11 ;
  if run <=  958425156 ;  * for n=1000 pop_wide_tld11_with_lost ;
  

* checked that this the same as dcost_50y_1 etc so over-writing so can change individual costs;
  
dcost_50y_1 = dart_cost_y_50y_1 + dadc_cost_50y_1 + dcd4_cost_50y_1 + dvl_cost_50y_1 + dvis_cost_50y_1 + dnon_tb_who3_cost_50y_1 + 
					dcot_cost_50y_1 + dtb_cost_50y_1 + dres_cost_50y_1 + dtest_cost_50y_1 + d_t_adh_int_cost_50y_1 + dswitchline_cost_50y_1 + 
					dcost_circ_50y_1 + dcost_condom_dn_50y_1 + dcost_child_hiv_50y_1 + dcost_non_aids_pre_death_50y_1
					+ (dcost_prep_visit_oral_50y_1) + (dcost_prep_oral_50y_1) 
;			

dcost_50y_2 = dart_cost_y_50y_2 + dadc_cost_50y_2 + dcd4_cost_50y_2 + dvl_cost_50y_2 + dvis_cost_50y_2 + dnon_tb_who3_cost_50y_2 + 
					dcot_cost_50y_2 + dtb_cost_50y_2 + dres_cost_50y_2 + dtest_cost_50y_2 + d_t_adh_int_cost_50y_2 + dswitchline_cost_50y_2 + 
					dcost_circ_50y_2 + dcost_condom_dn_50y_2 + dcost_child_hiv_50y_2 + dcost_non_aids_pre_death_50y_2
					+ (dcost_prep_visit_oral_50y_2) + (dcost_prep_oral_50y_2) ;
	

dcost_50y_3 = dart_cost_y_50y_3 + dadc_cost_50y_3 + dcd4_cost_50y_3 + dvl_cost_50y_3 + dvis_cost_50y_3 + dnon_tb_who3_cost_50y_3 + 
					dcot_cost_50y_3 + dtb_cost_50y_3 + dres_cost_50y_3 + dtest_cost_50y_3 + d_t_adh_int_cost_50y_3 + dswitchline_cost_50y_3 + 
					dcost_circ_50y_3 + dcost_condom_dn_50y_3 + dcost_child_hiv_50y_3 + dcost_non_aids_pre_death_50y_3
					+ (dcost_prep_visit_oral_50y_3) + (dcost_prep_oral_50y_3) 
+ (1      * dcost_prep_visit_inj_50y_3) 
+ (1      * dcost_prep_inj_50y_3)
;			

* 234 / 60 ;

dcost_50y_4 = dart_cost_y_50y_4 + dadc_cost_50y_4 + dcd4_cost_50y_4 + dvl_cost_50y_4 + dvis_cost_50y_4 + dnon_tb_who3_cost_50y_4 + 
					dcot_cost_50y_4 + dtb_cost_50y_4 + dres_cost_50y_4 + dtest_cost_50y_4 + d_t_adh_int_cost_50y_4 + dswitchline_cost_50y_4 + 
					dcost_circ_50y_4 + dcost_condom_dn_50y_4 + dcost_child_hiv_50y_4 + dcost_non_aids_pre_death_50y_4
					+ (dcost_prep_visit_oral_50y_4) + (dcost_prep_oral_50y_4) 
+ (1      * dcost_prep_visit_inj_50y_4) 
+ (1      * dcost_prep_inj_50y_4)
;			



dcost_hiv_50y_1 = dart_cost_y_50y_1 + dadc_cost_50y_1 + dcd4_cost_50y_1 + dvl_cost_50y_1 + dvis_cost_50y_1 + dnon_tb_who3_cost_50y_1 + 
					dcot_cost_50y_1 + dtb_cost_50y_1 + dres_cost_50y_1 + d_t_adh_int_cost_50y_1 + dswitchline_cost_50y_1 + 
					dcost_child_hiv_50y_1 + dcost_non_aids_pre_death_50y_1 ; 
dcost_hiv_50y_2 = dart_cost_y_50y_2 + dadc_cost_50y_2 + dcd4_cost_50y_2 + dvl_cost_50y_2 + dvis_cost_50y_2 + dnon_tb_who3_cost_50y_2 + 
					dcot_cost_50y_2 + dtb_cost_50y_2 + dres_cost_50y_2 + d_t_adh_int_cost_50y_2 + dswitchline_cost_50y_2 + 
					dcost_child_hiv_50y_2 + dcost_non_aids_pre_death_50y_2 ; 
dcost_hiv_50y_3 = dart_cost_y_50y_3 + dadc_cost_50y_3 + dcd4_cost_50y_3 + dvl_cost_50y_3 + dvis_cost_50y_3 + dnon_tb_who3_cost_50y_3 + 
					dcot_cost_50y_3 + dtb_cost_50y_3 + dres_cost_50y_3 + d_t_adh_int_cost_50y_3 + dswitchline_cost_50y_3 + 
					dcost_child_hiv_50y_3 + dcost_non_aids_pre_death_50y_3 ; 
dcost_hiv_50y_4 = dart_cost_y_50y_4 + dadc_cost_50y_4 + dcd4_cost_50y_4 + dvl_cost_50y_4 + dvis_cost_50y_4 + dnon_tb_who3_cost_50y_4 + 
					dcot_cost_50y_4 + dtb_cost_50y_4 + dres_cost_50y_4 + d_t_adh_int_cost_50y_4 + dswitchline_cost_50y_4 + 
					dcost_child_hiv_50y_4 + dcost_non_aids_pre_death_50y_4 ; 

dcost_prep_total_50y_1 = (dcost_prep_visit_oral_50y_1) + (dcost_prep_oral_50y_1) ;
dcost_prep_total_50y_2 = (dcost_prep_visit_oral_50y_2) + (dcost_prep_oral_50y_2) ;
dcost_prep_total_50y_3 = (dcost_prep_visit_oral_50y_3) + (dcost_prep_oral_50y_3)+ (dcost_prep_visit_inj_50y_3) + (dcost_prep_inj_50y_3);
dcost_prep_total_50y_4 = (dcost_prep_visit_oral_50y_4) + (dcost_prep_oral_50y_4)+ (dcost_prep_visit_inj_50y_4) + (dcost_prep_inj_50y_4);

netdaly500_1 = ddaly_50y_1 + (dcost_50y_1 / 0.0005);
netdaly500_2 = ddaly_50y_2 + (dcost_50y_2 / 0.0005);
netdaly500_3 = ddaly_50y_3 + (dcost_50y_3 / 0.0005);
netdaly500_4 = ddaly_50y_4 + (dcost_50y_4 / 0.0005);

min_netdaly500 = min(netdaly500_1, netdaly500_2, netdaly500_3, netdaly500_4);

if netdaly500_1 = min_netdaly500 then lowest_netdaly=1;
if netdaly500_2 = min_netdaly500 then lowest_netdaly=2;
if netdaly500_3 = min_netdaly500 then lowest_netdaly=3;
if netdaly500_4 = min_netdaly500 then lowest_netdaly=4;

pop_wide_tld_ce=0; if netdaly500_4 = min_netdaly500 then pop_wide_tld_ce=1;
pop_wide_tld_ce_x = 1 - pop_wide_tld_ce;

ce_cab_la_oral_prep = 0;
if 0 < netdaly500_3 < netdaly500_2 then ce_cab_la_oral_prep = 1;

d_p_onart_50y_4_3 = p_onart_50y_4 - p_onart_50y_3; 
d_n_death_hiv_50y_4_3 = n_death_hiv_50y_4 - n_death_hiv_50y_3;
d_n_death_hiv_50y_3_2 = n_death_hiv_50y_3 - n_death_hiv_50y_2;

d_prop_1564_onprep_20y_3_2 = prop_1564_onprep_20y_3 - prop_1564_onprep_20y_2;
d_prop_prep_inj_20y_3_2 = prop_prep_inj_20y_3 - prop_prep_inj_20y_2 ;
d_p_prep_any_ever_42_3_2 = p_prep_any_ever_42_3 - p_prep_any_ever_42_2 ;
r_incidence1549_20y_3_2 = incidence1549_20y_3 / incidence1549_20y_2 ;
d_incidence_onprep_20y_3_2 = incidence_onprep_20y_3 - incidence_onprep_20y_2 ;
d_n_birth_with_inf_child_20y_3_2 = n_birth_with_inf_child_20y_3 - n_birth_with_inf_child_20y_2 ;
r_prevalence1549_42_3_2 = prevalence1549_42_3 / prevalence1549_42_2 ;
r_n_hiv_42_3_2 = n_hiv_42_3 / n_hiv_42_2 ;
d_n_ai_naive_inm_42_3_2 = n_ai_naive_no_pmtct_e_inm_42_3 - n_ai_naive_no_pmtct_e_inm_42_2;  

d_p_hiv1_prep_20y_3_2 = p_hiv1_prep_20y_3 - p_hiv1_prep_20y_2 ; 
d_p_hiv1_prep_inj_20y_3_2 = p_hiv1_prep_inj_20y_3 - p_hiv1_prep_inj_20y_2 ; 
d_p_hiv1_prep_oral_20y_3_2 = p_hiv1_prep_oral_20y_3 - p_hiv1_prep_oral_20y_2 ; 
d_n_st_rest_prep_inj_hiv_20y_3_2 = n_start_rest_prep_inj_hiv_20y_3 - n_start_rest_prep_inj_hiv_20y_2 ; 
d_n_prep_inj_20y_3_2 = n_prep_inj_20y_3 - n_prep_inj_20y_2 ;
d_p_ai_no_arv_e_inm_42_3_2 = p_ai_no_arv_e_inm_42_3 - p_ai_no_arv_e_inm_42_2 ;
d_p_iime_42_3_2 = p_iime_42_3 - p_iime_42_2 ;
d_n_infected_inm_42_3_2 = n_infected_inm_42_3 - n_infected_inm_42_2 ;   
d_n_cur_res_cab_42_3_2 = n_cur_res_cab_42_3 - n_cur_res_cab_42_2 ;
d_p_vl1000_art_12m_onart_42_3_2 = p_vl1000_art_12m_onart_42_3 - p_vl1000_art_12m_onart_42_2 ;  
d_p_onart_vl1000_42_3_2 = p_onart_vl1000_42_3 - p_onart_vl1000_42_2 ; 
d_p_taz_42_3_2 = p_taz_42_3 - p_taz_42_2 ; 

d_p_nacti_art_start_lt1p5_42_3_2 = p_nactive_art_start_lt1p5_42_3 - p_nactive_art_start_lt1p5_42_2 ;
d_p_nacti_art_start_lt2_42_3_2 = p_nactive_art_start_lt2_42_3 - p_nactive_art_start_lt2_42_2 ;
d_p_nacti_art_start_lt3_42_3_2 = p_nactive_art_start_lt3_42_3 - p_nactive_art_start_lt3_42_2 ;

d_p_vl1000_art_12m_onart_50y_3_2 = p_vl1000_art_12m_onart_50y_3 - p_vl1000_art_12m_onart_50y_2 ;  

d_n_death_hiv_50y_3_2 = n_death_hiv_50y_3 - n_death_hiv_50y_2 ;
d_ddaly_50y_3_2 = ddaly_50y_3 - ddaly_50y_2 ;
d_dcost_50y_3_2 =  dcost_50y_3 - dcost_50y_2 ; 
netdaly_averted_3_2 = netdaly500_3 - netdaly500_2 ; 

death_hiv_not_averted = 0; if d_n_death_hiv_50y_3_2 > 0 then death_hiv_not_averted = 1;

r_incidence1549_50y_3_2 = incidence1549_50y_3 / incidence1549_50y_2 ;

if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 then hiv_test_strat3=1; else hiv_test_strat3=0;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat2=1; else hiv_test_strat2=0;

if hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat =1;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat =2;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 then hiv_test_strat =3; 

d_p_ai_no_arv_e_inm_50y_3_2 = p_ai_no_arv_e_inm_50y_3 - p_ai_no_arv_e_inm_50y_2;

pr_inm_inj_prep_primary_x = pr_inm_inj_prep_primary;
if hivtest_type_1_prep_inj=1 then pr_inm_inj_prep_primary_x = pr_inm_inj_prep_primary / testt1_prep_inj_eff_on_res_prim; 
* this is done to find out the originally allocated value  ;

super_inf = 0;
if super_infection_pop = 1 and super_inf_res = 0.2 then super_inf=2;
if super_infection_pop = 1 and super_inf_res = 0.8 then super_inf=3;



/*
dcost_hiv_50y_1 = dart_cost_y_50y_1 + dadc_cost_50y_1 + dcd4_cost_50y_1 + dvl_cost_50y_1 + dvis_cost_50y_1 + dnon_tb_who3_cost_50y_1 + 
					dcot_cost_50y_1 + dtb_cost_50y_1 + dres_cost_50y_1 + d_t_adh_int_cost_50y_1 + dswitchline_cost_50y_1 + 
					dcost_child_hiv_50y_1 + dcost_non_aids_pre_death_50y_1 ; 
dcost_hiv_50y_2 = dart_cost_y_50y_2 + dadc_cost_50y_2 + dcd4_cost_50y_2 + dvl_cost_50y_2 + dvis_cost_50y_2 + dnon_tb_who3_cost_50y_2 + 
					dcot_cost_50y_2 + dtb_cost_50y_2 + dres_cost_50y_2 + d_t_adh_int_cost_50y_2 + dswitchline_cost_50y_2 + 
					dcost_child_hiv_50y_2 + dcost_non_aids_pre_death_50y_2 ; 

dcost_prep_total_50y_1 = (dcost_prep_visit_oral_50y_1) + (dcost_prep_oral_50y_1) ;
dcost_prep_total_50y_2 = (dcost_prep_visit_oral_50y_2) + (dcost_prep_oral_50y_2)+ (dcost_prep_visit_inj_50y_2) + (dcost_prep_inj_50y_2);			

*/



* table 1;

proc means data=   w_pop_wide_tld n p50 p5 p95 min max;  *  w_pop_wide_tld ;
var prevalence1549w_22 prevalence1549m_22 incidence1549_22 p_diag_22 p_onart_diag_22 p_onart_vl1000_22 p_vl1000_22 prevalence_vg1000_22   ;
run;

* table 2;

proc means data=  w_pop_wide_tld n mean p5 p95 min max;
var 
prop_elig_on_prep_20y_2 prop_elig_on_prep_20y_3  d_prop_elig_on_prep_20y_3_2
prop_1564_onprep_20y_2  prop_1564_onprep_20y_3  d_prop_1564_onprep_20y_3_2
n_prep_inj_20y_2 n_prep_inj_20y_3 
n_prep_any_20y_2 n_prep_any_20y_3 
prop_prep_inj_20y_2 prop_prep_inj_20y_3  d_prop_prep_inj_20y_3_2
p_prep_any_ever_42_2 p_prep_any_ever_42_3  d_p_prep_any_ever_42_3_2
prop_prep_tot5yrs_42_2 prop_prep_tot5yrs_42_3 
;
run;

* table 3;

proc means data=  w_pop_wide_tld n mean p5 p95 min max;
var 
incidence1549_20y_2 incidence1549_20y_3  r_incidence1549_20y_3_2
incidence_onprep_20y_2 incidence_onprep_20y_3  d_incidence_onprep_20y_3_2
n_birth_with_inf_child_20y_2 n_birth_with_inf_child_20y_3  d_n_birth_with_inf_child_20y_3_2
prevalence1549_42_2 prevalence1549_42_3  r_prevalence1549_42_3_2
n_hiv_42_2 n_hiv_42_3 r_n_hiv_42_3_2 
; 
run;
proc freq data=  w_pop_wide_tld; tables d_prop_elig_on_prep_20y_3_2; run;


* table 4;

proc means data=   w_pop_wide_tld n mean  p5 p95 ;
var 
p_hiv1_prep_20y_1 p_hiv1_prep_20y_2 p_hiv1_prep_20y_3 p_hiv1_prep_20y_4  d_p_hiv1_prep_20y_3_2
p_hiv1_prep_inj_20y_1 p_hiv1_prep_inj_20y_2 p_hiv1_prep_inj_20y_3 p_hiv1_prep_inj_20y_4  d_p_hiv1_prep_inj_20y_3_2
p_hiv1_prep_oral_20y_1 p_hiv1_prep_oral_20y_2 p_hiv1_prep_oral_20y_3 p_hiv1_prep_oral_20y_4  d_p_hiv1_prep_oral_20y_3_2
n_start_rest_prep_inj_hiv_20y_1   n_start_rest_prep_inj_hiv_20y_2   n_start_rest_prep_inj_hiv_20y_3   n_start_rest_prep_inj_hiv_20y_4   
p_ai_no_arv_e_inm_42_1 p_ai_no_arv_e_inm_42_2 p_ai_no_arv_e_inm_42_3 p_ai_no_arv_e_inm_42_4 d_p_ai_no_arv_e_inm_42_3_2
n_ai_naive_no_pmtct_e_inm_42_2  n_ai_naive_no_pmtct_e_inm_42_3  d_n_ai_naive_inm_42_3_2
p_iime_42_1 p_iime_42_2 p_iime_42_3 p_iime_42_4 d_p_iime_42_3_2
n_infected_inm_42_1  n_infected_inm_42_2  n_infected_inm_42_3  n_infected_inm_42_4 d_n_infected_inm_42_3_2  
n_cur_res_cab_42_1 n_cur_res_cab_42_2 n_cur_res_cab_42_3 n_cur_res_cab_42_4 d_n_cur_res_cab_42_3_2 
p_vl1000_art_12m_onart_42_1 p_vl1000_art_12m_onart_42_2 p_vl1000_art_12m_onart_42_3 p_vl1000_art_12m_onart_42_4 d_p_vl1000_art_12m_onart_42_3_2 
p_onart_vl1000_42_1  p_onart_vl1000_42_2 p_onart_vl1000_42_3  p_onart_vl1000_42_4 d_p_onart_vl1000_42_3_2 
prevalence_vg1000_42_1 prevalence_vg1000_42_2 prevalence_vg1000_42_3 prevalence_vg1000_42_4
p_vl1000_42_1  p_vl1000_42_2 p_vl1000_42_3  p_vl1000_42_4 
p_taz_42_1 p_taz_42_2 p_taz_42_3 p_taz_42_4 d_p_taz_42_3_2  

d_p_nacti_art_start_lt1p5_42_3_2  p_nactive_art_start_lt1p5_42_3  p_nactive_art_start_lt1p5_42_2 
d_p_nacti_art_start_lt2_42_3_2  p_nactive_art_start_lt2_42_3  p_nactive_art_start_lt2_42_2 
d_p_nacti_art_start_lt3_42_3_2  p_nactive_art_start_lt3_42_3  p_nactive_art_start_lt3_42_2 

;
  where hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj =  1 ; run;
run;



* table 5;
proc means data=  w_pop_wide_tld n mean p5 p95;
  var 
n_death_hiv_50y_1 n_death_hiv_50y_2 n_death_hiv_50y_3 n_death_hiv_50y_4 d_n_death_hiv_50y_3_2
ddaly_50y_1 ddaly_50y_2 ddaly_50y_3 ddaly_50y_4    d_ddaly_50y_3_2
dcost_50y_1   dcost_50y_2 dcost_50y_3   dcost_50y_4  d_dcost_50y_3_2
netdaly500_1 netdaly500_2 netdaly500_3 netdaly500_4 netdaly_averted_3_2
;
* var 
n_death_hiv_50y_2 n_death_hiv_50y_3  d_n_death_hiv_50y_3_2
ddaly_50y_2 ddaly_50y_3  d_ddaly_50y_3_2
dcost_50y_2 dcost_50y_3  d_dcost_50y_3_2
netdaly500_1 netdaly500_2 netdaly500_3 netdaly_averted_3_2
;
  where hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 ; run;
run;



proc freq  data = w_pop_wide_tld; tables d_n_death_hiv_50y_3_2 ce_cab_la_oral_prep  death_hiv_not_averted;
  where hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 ; 
* where (hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ge 0) and 0.5 <= incidence1549_22 < 1.0;  
* where (hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ge 0) and  0.0 <= p_prep_adhg80_20y_2 < 0.7 ;  
run;

proc logistic; model ce_cab_la_oral_prep = incidence1549_22 ; run;
proc logistic; model ce_cab_la_oral_prep = p_prep_adhg80_20y_2 ; run;

proc logistic; model death_hiv_not_averted = d_p_ai_no_arv_e_inm_42_3_2 ; run;
proc freq; tables death_hiv_not_averted; where  d_p_ai_no_arv_e_inm_42_3_2 < 0.05; run;
proc freq; tables death_hiv_not_averted; where  0.05 <= d_p_ai_no_arv_e_inm_42_3_2 < 0.10; run;
proc freq; tables death_hiv_not_averted; where  0.10 <= d_p_ai_no_arv_e_inm_42_3_2 < 0.15; run;
proc freq; tables death_hiv_not_averted; where  0.15 <= d_p_ai_no_arv_e_inm_42_3_2 ; run;


* text ;



proc means data =  w_pop_wide_tld ; 
var 
dcost_50y_2  dcost_hiv_50y_2  dcost_prep_total_50y_2  dtest_cost_50y_2 dcost_circ_50y_2
dcost_50y_3  dcost_hiv_50y_3  dcost_prep_total_50y_3  dtest_cost_50y_3 dcost_circ_50y_3
;
  where  hivtest_type_1_init_prep_inj =  1 and hivtest_type_1_prep_inj =  1  ;
run;


* suppl table x ;

proc glm data=  w_pop_wide_tld;  
class fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x   rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  adh_pattern super_inf pr_switch_line gx
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b res_level_dol_cab_mut pr_res_dol;  
model d_p_ai_no_arv_e_inm_50y_3_2 =
p_ai_no_arv_e_inm_22 fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  adh_pattern  super_inf  pr_switch_line gx
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b res_level_dol_cab_mut pr_res_dol/ solution;
run;

proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where prep_inj_efficacy = 0.9 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where pref_prep_inj_beta_s1 = 6 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where pr_inm_inj_prep_primary = 0.5 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where incr_res_risk_cab_inf_3m = 50 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where rel_pr_inm_inj_prep_tail_primary = 1.33 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where res_trans_factor_ii = 0.8 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where pr_prep_inj_b = 0.7 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where hiv_test_strat=3; run; 
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where pr_res_dol=0.015; run; 
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where gx = 2; run; 

proc glm data=    w_pop_wide_tld; 
class fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x   rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii adh_pattern  super_inf   pr_switch_line gx
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b res_level_dol_cab_mut pr_res_dol;                ;
model d_n_death_hiv_50y_3_2 =
n_death_hiv_22 fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x   rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  adh_pattern super_inf  pr_switch_line gx
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b res_level_dol_cab_mut pr_res_dol/  solution;
run;


proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where prep_inj_efficacy = 0.9 ; run;
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where pref_prep_inj_beta_s1 = 6 ; run;
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where rate_choose_stop_prep_inj = 0.3  ; run;
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where pr_inm_inj_prep_primary=0.5; run; 
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where adh_pattern =7 ;run; 
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where hiv_test_strat=3; run; 
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where gx = 2; run; 




* extra for possible inclusion in suppl table ;

proc glm data=  w_pop_wide_tld;  
class fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x   rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  adh_pattern super_inf
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b res_level_dol_cab_mut pr_switch_line gx;              
model d_p_vl1000_art_12m_onart_50y_3_2 = p_vl1000_art_12m_onart_22  d_p_ai_no_arv_e_inm_50y_3_2
p_ai_no_arv_e_inm_22 fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  
dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  adh_pattern  super_inf
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b res_level_dol_cab_mut
pr_switch_line gx/ solution;
run;

proc means data=w_pop_wide_tld;  var d_p_vl1000_art_12m_onart_50y_3_2 ; where super_inf = 3 ; run;

proc means data=w_pop_wide_tld;  var p_vl1000_art_12m_onart_50y_2  p_vl1000_art_12m_onart_50y_3 ; 
where res_level_dol_cab_mut = 1 and  dol_higher_potency = 0.5 and fold_change_mut_risk = 1   ; run;






