
ods html close;

* options user="/folders/myfolders/";

libname b "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\search_2\search_2_out\";

footnote;

proc printto ;

* ods html close;

data b;
set b.l_search_2_a ;


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
prop_prep_any = (n_prep_any / n_alive) ;
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
p_diag_m = p_diag_m / 100;

n_tested_incl_self = n_self_tested + n_tested; 

/*
p_hypert_1539_ p_hypert_4049_ p_hypert_5059_ p_hypert_6069_  p_hypert_7079_  
p_diagnosed_hypert_1549_ p_diagnosed_hypert_1539_ p_diagnosed_hypert_4049_ p_diagnosed_hypert_5059_  p_diagnosed_hypert_6069_  p_diagnosed_hypert_7079_  
p_on_anti_hypert_1549_ p_on_anti_hypert_1539_ p_on_anti_hypert_4049_ p_on_anti_hypert_5059_  p_on_anti_hypert_6069_  p_on_anti_hypert_7079_ rate_dead_cvd_ 
*/


if option in (0 1);


%let single_var =  incidence1549_         ;

* prop_prep_any prop_elig_on_prep p_elig_prep;


  if run in (

1499111 
2533576 
2605965 
6051737 
8731374 
8796632 
11859983 
12664486 
16805498 
16946305 
17857765 
18059471 
20743942 
22108168 
22302592 
24654083 
24657659 
25358768 
33779491 
36649045 
41204693 
41207782 
41228478 
44271215 
51460027 
53120823 
55743735 
55827830 
58139878 
62297434 
64518177 
64862566 
71861153 
73305709 
73785368 
75116104 
77027858 
77052679 
82381561 
83351670 
87242346 
89110120 
93611980 
95715025 
96267519 
100349542 
104470050 
110278615 
117609088 
123532903 
124391431 
125216936 
125842099 
127378597 
129547455 
132071685 
133811272 
134395998 
137006229 
137985581 
138708270 
138862398 
140300023 
142583185 
143303976 
155880517 
157221082 
161979007 
166033772 
167408357 
170554904 
170798946 
171035128 
171546263 
175673879 
179815471 
181843959 
184968406 
186409694 
188269959 
189764614 
191343131 
195806987 
196021265 
203918955 
207302922 
207733009 
210649283 
217922701 
226526564 
227102077 
227550343 
227760354 
232247463 
233690528 
235062761 
248900181 
253707635 
256782707 
256982931 
261389019 
262875005 
265347144 
267177535 
267334047 
270064941 
271547630 
272089576 
272477850 
274277590 
274580265 
278500119 
283444105 
284083734 
285581577 
290640810 
294475012 
301385995 
302512380 
309758565 
313109295 
317808692 
322195227 
322542219 
324606945 
325237244 
326025755 
326138874 
334258834 
337391501 
337391676 
337467805 
338326835 
342449510 
343742018 
346446889 
346579428 
347518344 
351302821 
351346146 
351456478 
352580748 
355835569 
357238218 
359789803 
361219615 
365401133 
366586163 
371019227 
371161409 
372853252 
375662489 
386270752 
393451137 
395111632 
397420428 
405153273 
405420373 
408589381 
412283240 
414204636 
414983518 
416148893 
417026284 
420349633 
423664029 
423751386 
425862853 
428290681 
428898727 
431481870 
432809431 
433166613 
440295430 
440470150 
444988374 
448626772 
449911116 
450419912 
451634575 
452786653 
453413365 
454266299 
454357114 
461508488 
466277035 
466910464 
469820442 
472438584 
472856041 
476712106 
480444151 
482419408 
482437234 
482977207 
483876590 
485688739 
488767560 
489741766 
493219991 
493683553 
500029782 
502663414 
505298120 
508140927 
508670025 
509519143 
509855184 
514792602 
519760252 
521705469 
524225704 
526779487 
527678149 
529148997 
530507127 
531441306 
532305864 
532912675 
533725311 
537348620 
539979548 
541052342 
544527960 
550932825 
552200307 
557704573 
558961435 
559213831 
560448924 
562764970 
563267238 
563558843 
566617341 
572114663 
574411068 
574611862 
576756875 
577197311 
582026181 
582707096 
583784277 
585452035 
585721205 
586294546 
593743819 
598342959 
600204020 
601352504 
603295737 
605635776 
617468242 
623194158 
623198030 
623656246 
627625851 
629211396 
629322642 
629929440 
630700991 
631678513 
632129815 
632773235 
633221950 
639235920 
643494614 
645141229 
646278421 
646309617 
646331995 
653742985 
659001607 
662844901 
663000079 
669706162 
680888721 
681142833 
697442045 
699709727 
702691161 
709080210 
709186024 
709292856 
710576281 
714699457 
715134068 
717574361 
718773644 
719317495 
721484256 
721616975 
721791027 
727590877 
730828407 
733807475 
737851521 
741192408 
743218587 
744686909 
744836583 
750508697 
756085702 
759064681 
759865245 
761529081 
764759238 
765023607 
765156873 
765293189 
770142019 
771007192 
773301549 
776291259 
788536375 
789586109 
794870318 
797871029 
798965913 
799258560 
800737557 
812319040 
813272241 
814828860 
816552163 
818913674 
819651373 
820834585 
822168420 
826783916 
829258891 
833213196 
836448018 
838360685 
838606431 
839944011 
847057830 
850229238 
851234471 
851551045 
851598905 
854146990 
855492744 
864208915 
864516154 
864972026 
867792203 
870580167 
876019576 
879523459 
885140197 
887743148 
893365707 
895471921 
895482151 
897941578 
907425709 
907664095 
908184283 
912460735 
913100185 
914130456 
914164995 
915501010 
919086839 
922985163 
929326157 
930925210 
934226398 
938858588 
939057888 
939058971 
942421481 
943050365 
944513819 
945927299 
947560610 
951875167 
951926964 
952510502 
954789370 
960471553 
962785935 
967113096 
967819870 
967969616 
969768272 
974435614 
975049751 
977138550 
993642176 
994831924 
997789955 
998978413 




);



* p_agege15_ever_vaccinated n_death_hiv  ddaly  p_cur_any_vac_e_1564_  deathr_dol_r_first_uvl2 p_first_uvl2_dol_r
p_cur_full_vac_e_1564_ prop_elig_on_prep  prop_1564_hivneg_onprep  n_tested  p_diag  p_onart_diag  p_onart_vl1000_  incidence1549_;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;

%let nfit = 786  ;

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
* Title '';  * Title    height=1.5 justify=center "p_tested_incl_self";
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
* Title '';    Title    height=1.5 justify=center "Incidence (age 15-49)";
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
* Title '';   Title    height=1.5 justify=center "prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'prevalence'		labelattrs=(size=12)  values = (0 to  0.35      by 0.02    ) valueattrs=(size=10);

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
* Title ''; Title    height=1.5 justify=center "proportion of people with a prep/pep indication taking prep/pep";
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
* Title ''; Title    height=1.5 justify=center "proportion of people with a prep/pep indication ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  0.2       by 0.05    ) valueattrs=(size=10);

series  x=cald y=p50_p_elig_prep_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_elig_prep_0 upper=p95_p_elig_prep_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_elig_prep_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_elig_prep_1 upper=p95_p_elig_prep_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

run;quit;

*/

  

ods html;
proc sgplot data=d nolegend; 
* Title '';   Title    height=1.5 justify=center "proportion of people taking prep/pep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2075 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to  0.04       by 0.005     ) valueattrs=(size=10);

series  x=cald y=p50_prop_prep_any_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_prop_prep_any_0 upper=p95_prop_prep_any_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_prop_prep_any_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_prop_prep_any_1 upper=p95_prop_prep_any_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

run;quit;




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
* Title '';   Title    height=1.5 justify=center "p_onart_vl1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2025 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.70 to  1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_onart_vl1000__0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_onart_vl1000__0 upper=p95_p_onart_vl1000__0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000__1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_onart_vl1000__1 upper=p95_p_onart_vl1000__1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

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
* Title '';  Title    height=1.5 justify=center "p_diag";
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
* Title '';  Title    height=1.5 justify=center "p_diag_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2025 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.50 to  1       by 0.05  ) valueattrs=(size=10);

series  x=cald y=p50_p_diag_m_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_p_diag_m_0 upper=p95_p_diag_m_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_p_diag_m_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_p_diag_m_1 upper=p95_p_diag_m_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

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
* Title '';    Title    height=1.5 justify=center "n tested per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2025 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'n_tested'		labelattrs=(size=12)  values = (0 to  1500000     by 500000 )  valueattrs=(size=10);

series  x=cald y=p50_n_tested_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_tested_0 upper=p95_n_tested_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_tested_1 / lineattrs = (color=blue      thickness = 4);
band    x=cald lower=p5_n_tested_1 upper=p95_n_tested_1 / transparency=0.9 fillattrs = (color=blue     ) legendlabel= "90% range";


run;quit;

*/

/*

ods html;
proc sgplot data=d nolegend; 
* Title '';   Title    height=1.5 justify=center "n self_tested per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2025 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000     by 1000000 )  valueattrs=(size=10);

series  x=cald y=p50_n_self_tested_0 / lineattrs = (color=grey thickness = 4);
band    x=cald lower=p5_n_self_tested_0 upper=p95_n_self_tested_0 / transparency=0.9 fillattrs = (color=grey) legendlabel= "90% range";

series  x=cald y=p50_n_self_tested_1 / lineattrs = (color=darkblue    thickness = 4);
band    x=cald lower=p5_n_self_tested_1 upper=p95_n_self_tested_1 / transparency=0.9 fillattrs = (color=darkblue   ) legendlabel= "90% range";

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

*/

/*

ods html;
proc sgplot data=d ; 
  Title    height=1.5 justify=center "Of those diagnosed, proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to 2025 by 1)	 	 valueattrs=(size=10); 
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

*/

/*

ods html;
proc sgplot data=d ; 
  Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2070 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  1.0       by 0.1     ) valueattrs=(size=10);

label mean_incidence1549__0 = "no int";
label mean_incidence1549__1 = "with_int";

 series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=mean_incidence1549__1/	lineattrs = (color=violet thickness = 4);
  band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;quit;

* ods html close;

*/

/*

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


/*

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 15-39 with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_hypert_1539__0 = "Option 0 (median) ";
label p50_p_hypert_1539__1 = "Option 1 (median) ";

series  x=cald y=p50_p_hypert_1539__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hypert_1539__0 	upper=p95_p_hypert_1539__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_hypert_1539__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_hypert_1539__1 	upper=p95_p_hypert_1539__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 40-49 with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_hypert_4049__0 = "Option 0 (median) ";
label p50_p_hypert_4049__1 = "Option 1 (median) ";

series  x=cald y=p50_p_hypert_4049__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hypert_4049__0 	upper=p95_p_hypert_4049__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_hypert_4049__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_hypert_4049__1 	upper=p95_p_hypert_4049__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 50-59 with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_hypert_5059__0 = "Option 0 (median) ";
label p50_p_hypert_5059__1 = "Option 1 (median) ";

series  x=cald y=p50_p_hypert_5059__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hypert_5059__0 	upper=p95_p_hypert_5059__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_hypert_5059__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_hypert_5059__1 	upper=p95_p_hypert_5059__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 60-69 with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_hypert_6069__0 = "Option 0 (median) ";
label p50_p_hypert_6069__1 = "Option 1 (median) ";

series  x=cald y=p50_p_hypert_6069__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hypert_6069__0 	upper=p95_p_hypert_6069__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_hypert_6069__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_hypert_6069__1 	upper=p95_p_hypert_6069__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 70-79 with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_hypert_7079__0 = "Option 0 (median) ";
label p50_p_hypert_7079__1 = "Option 1 (median) ";

series  x=cald y=p50_p_hypert_7079__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hypert_7079__0 	upper=p95_p_hypert_7079__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_hypert_7079__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_hypert_7079__1 	upper=p95_p_hypert_7079__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 15-39 diagnosed with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diagnosed_hypert_1539__0 = "Option 0 (median) ";
label p50_p_diagnosed_hypert_1539__1 = "Option 1 (median) ";

series  x=cald y=p50_p_diagnosed_hypert_1539__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_1539__0 	upper=p95_p_diagnosed_hypert_1539__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_diagnosed_hypert_1539__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_1539__1 	upper=p95_p_diagnosed_hypert_1539__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 40-49 diagnosed with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diagnosed_hypert_4049__0 = "Option 0 (median) ";
label p50_p_diagnosed_hypert_4049__1 = "Option 1 (median) ";

series  x=cald y=p50_p_diagnosed_hypert_4049__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_4049__0 	upper=p95_p_diagnosed_hypert_4049__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_diagnosed_hypert_4049__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_4049__1 	upper=p95_p_diagnosed_hypert_4049__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 50-59 diagnosed with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diagnosed_hypert_5059__0 = "Option 0 (median) ";
label p50_p_diagnosed_hypert_5059__1 = "Option 1 (median) ";

series  x=cald y=p50_p_diagnosed_hypert_5059__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_5059__0 	upper=p95_p_diagnosed_hypert_5059__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_diagnosed_hypert_5059__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_5059__1 	upper=p95_p_diagnosed_hypert_5059__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 60-69 diagnosed with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diagnosed_hypert_6069__0 = "Option 0 (median) ";
label p50_p_diagnosed_hypert_6069__1 = "Option 1 (median) ";

series  x=cald y=p50_p_diagnosed_hypert_6069__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_6069__0 	upper=p95_p_diagnosed_hypert_6069__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_diagnosed_hypert_6069__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_6069__1 	upper=p95_p_diagnosed_hypert_6069__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 70-79 diagnosed with hypertension";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diagnosed_hypert_7079__0 = "Option 0 (median) ";
label p50_p_diagnosed_hypert_7079__1 = "Option 1 (median) ";

series  x=cald y=p50_p_diagnosed_hypert_7079__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_7079__0 	upper=p95_p_diagnosed_hypert_7079__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_diagnosed_hypert_7079__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diagnosed_hypert_7079__1 	upper=p95_p_diagnosed_hypert_7079__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 15-39 on hypertension treatment";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_on_anti_hypert_1539__0 = "Option 0 (median) ";
label p50_p_on_anti_hypert_1539__1 = "Option 1 (median) ";

series  x=cald y=p50_p_on_anti_hypert_1539__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_1539__0 	upper=p95_p_on_anti_hypert_1539__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_on_anti_hypert_1539__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_1539__1 	upper=p95_p_on_anti_hypert_1539__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 40-49 on hypertension treatment";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_on_anti_hypert_4049__0 = "Option 0 (median) ";
label p50_p_on_anti_hypert_4049__1 = "Option 1 (median) ";

series  x=cald y=p50_p_on_anti_hypert_4049__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_4049__0 	upper=p95_p_on_anti_hypert_4049__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_on_anti_hypert_4049__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_4049__1 	upper=p95_p_on_anti_hypert_4049__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 50-59 on hypertension treatment";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_on_anti_hypert_5059__0 = "Option 0 (median) ";
label p50_p_on_anti_hypert_5059__1 = "Option 1 (median) ";

series  x=cald y=p50_p_on_anti_hypert_5059__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_5059__0 	upper=p95_p_on_anti_hypert_5059__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_on_anti_hypert_5059__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_5059__1 	upper=p95_p_on_anti_hypert_5059__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 60-69 on hypertension treatment";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_on_anti_hypert_6069__0 = "Option 0 (median) ";
label p50_p_on_anti_hypert_6069__1 = "Option 1 (median) ";

series  x=cald y=p50_p_on_anti_hypert_6069__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_6069__0 	upper=p95_p_on_anti_hypert_6069__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_on_anti_hypert_6069__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_6069__1 	upper=p95_p_on_anti_hypert_6069__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion age 70-79 on hypertension treatment";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_on_anti_hypert_7079__0 = "Option 0 (median) ";
label p50_p_on_anti_hypert_7079__1 = "Option 1 (median) ";

series  x=cald y=p50_p_on_anti_hypert_7079__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_7079__0 	upper=p95_p_on_anti_hypert_7079__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_on_anti_hypert_7079__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_on_anti_hypert_7079__1 	upper=p95_p_on_anti_hypert_7079__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

quit;

*/






* ods rtf close;
* ods listing;
run;




	
