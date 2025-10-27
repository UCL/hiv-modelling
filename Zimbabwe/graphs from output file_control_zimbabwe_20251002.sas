
***Program to produce graphs using averages across runs
***Use include statement in analysis program to read the code below in;

*** 20261002 version has options 0, 8 and 99 only;

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20251002_out\";
/*libname a "C:\Users\rmjlja9\Dropbox (UCL)\hiv synthesis ssa unified program\output files\zimbabwe";*/

proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";
proc freq data=a.long_zim_control;table option;run;

%let pth_export_hiv_control= C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe;run;

%let year_start = 1990;
%let year_end = 2075;


data b;
set a.long_zim_control;

* Define new variables;
n_alive_m = n_alive_1524m + n_alive_2549m + n_alive_50plm;
n_alive_w = n_alive_1524w + n_alive_2549w + n_alive_50plw;
n_alive = n_alive_m + n_alive_w;

n_new_inf1549m = n_new_inf1524m + n_new_inf2549m;
n_new_inf1549w = n_new_inf1524w + n_new_inf2549w;
n_new_inf1549_ = n_new_inf1549m + n_new_inf1549w;
n_new_inf1564_ = n_new_inf1549_	+ n_new_inf50plm + n_new_inf50plw;

p_diag_m = (n_diag_m_1524 + n_diag_m_2549 + n_diag_m_50pl) / (n_hiv1524m + n_hiv2549m + n_hiv50plm);
p_diag_w = (n_diag_w_1524 + n_diag_w_2549 + n_diag_w_50pl) / (n_hiv1524w + n_hiv2549w + n_hiv50plw);
p_diag = (n_diag_m_1524 + n_diag_m_2549 + n_diag_m_50pl + n_diag_w_1524 + n_diag_w_2549 + n_diag_w_50pl) /
	(n_hiv1524m + n_hiv2549m + n_hiv50plm + n_hiv1524w + n_hiv2549w + n_hiv50plw);

p_art_m = (n_onart1524_m + n_onart2549_m + n_onart50pl_m) / (n_hiv1524m + n_hiv2549m + n_hiv50plm);
p_art_w = (n_onart1524_w + n_onart2549_w + n_onart50pl_w) / (n_hiv1524w + n_hiv2549w + n_hiv50plw);
p_art = (n_onart1524_m + n_onart2549_m + n_onart50pl_m + n_onart1524_w + n_onart2549_w + n_onart50pl_w) / 
	(n_hiv1524m + n_hiv2549m + n_hiv50plm + n_hiv1524w + n_hiv2549w + n_hiv50plw);

p_diag_art_m = (n_onart1524_m + n_onart2549_m + n_onart50pl_m) / (n_diag_m_1524 + n_diag_m_2549 + n_diag_m_50pl);
p_diag_art_w = (n_onart1524_w + n_onart2549_w + n_onart50pl_w) / (n_diag_w_1524 + n_diag_w_2549 + n_diag_w_50pl);
p_diag_art = (n_onart1524_m + n_onart2549_m + n_onart50pl_m + n_onart1524_w + n_onart2549_w + n_onart50pl_w) / 
	(n_diag_m_1524 + n_diag_m_2549 + n_diag_m_50pl + n_diag_w_1524 + n_diag_w_2549 + n_diag_w_50pl);

p_art_vls_m = (n_vl1000_art_1524_m + n_vl1000_art_2549_m + n_vl1000_art_50pl_m) / (n_onart1524_m + n_onart2549_m + n_onart50pl_m);
p_art_vls_w = (n_vl1000_art_1524_w + n_vl1000_art_2549_w + n_vl1000_art_50pl_w) / (n_onart1524_w + n_onart2549_w + n_onart50pl_w);
p_art_vls = (n_vl1000_art_1524_m + n_vl1000_art_2549_m + n_vl1000_art_50pl_m + 	n_vl1000_art_1524_w + n_vl1000_art_2549_w + n_vl1000_art_50pl_w) / 
	(n_onart1524_m + n_onart2549_m + n_onart50pl_m + n_onart1524_w + n_onart2549_w + n_onart50pl_w);

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
n_daly			cost			p_mcirc_1549m			n_sw_program_visit
n_circumcised_15_24_m			n_onprep_agyw_pg		n_agyw_pg	/* added Sept 2025 */

/*Extra outputs for calibration*/	/* added Sept 2025 */
incidence1549_					incidence1549w					incidence1549m						incidence1564_
p_newp_ge1_						p_newp_ge5_						av_newp_ge1_						p_ep
p_m_npge1_						p_w_npge1_
p_mcirc_1524m
n_onprep_agyw_plw				n_agyw_plw
n_onprep_oral_agyw_pg			n_onprep_len_agyw_pg			n_onprep_oral_agyw_plw				n_onprep_len_agyw_plw
n_onprep_oral_m					n_onprep_len_m					n_onprep_oral_w						n_onprep_len_w
n_onprep_oral_sw				n_onprep_len_sw					n_onprep_oral_msm					n_onprep_len_msm

n_alive				n_alive_m			n_alive_w
n_new_inf1549m 		n_new_inf1549w 		n_new_inf1549_ 		n_new_inf1564_ 
p_diag_m 			p_diag_w 			p_diag 
p_art_m 			p_art_w 			p_art 
p_diag_art_m 		p_diag_art_w 		p_diag_art
p_art_vls_m 		p_art_vls_w			p_art_vls 
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
%let nfit=95;
%option_(0);
%option_(1);
%option_(2);
%option_(3);
%option_(4);
%option_(5);
%option_(6);
%option_(7);
%option_(8);
run;



data d_a; * this is number of variables in %let var = above ;
merge 
g0_1   g0_2   g0_3   g0_4   g0_5   g0_6   g0_7   g0_8   g0_9   g0_10  g0_11  g0_12  g0_13  g0_14  g0_15  g0_16  g0_17  g0_18  g0_19  g0_20 
g0_21  g0_22  g0_23  g0_24  g0_25  g0_26  g0_27  g0_28  g0_29  g0_30  g0_31  g0_32  g0_33  g0_34  g0_35  g0_36  g0_37  g0_38  g0_39  g0_40
g0_41  g0_42  g0_43  g0_44  g0_45  g0_46  g0_47  g0_48  g0_49  g0_50  g0_51  g0_52  g0_53  g0_54  g0_55  g0_56  g0_57  g0_58  g0_59  g0_60
g0_61  g0_62  g0_63  g0_64  g0_65  g0_66  g0_67  g0_68  g0_69  g0_70  g0_71  g0_72  g0_73  g0_74  g0_75  g0_76  g0_77  g0_78  g0_79  g0_80
g0_81  g0_82  g0_83  g0_84  g0_85  g0_86  g0_87  g0_88  g0_89  g0_90  g0_91  g0_92  g0_93  g0_94  g0_95  g0_96  g0_97  g0_98  g0_99  g0_100
g0_101 g0_102 g0_103 g0_104 g0_105 g0_106 g0_107 g0_108 g0_109 g0_110 g0_111 g0_112 g0_113 g0_114 g0_115 g0_116 g0_117 g0_118 g0_119 g0_120

g1_1   g1_2   g1_3   g1_4   g1_5   g1_6   g1_7   g1_8   g1_9   g1_10  g1_11  g1_12  g1_13  g1_14  g1_15  g1_16  g1_17  g1_18  g1_19  g1_20  
g1_21  g1_22  g1_23  g1_24  g1_25  g1_26  g1_27  g1_28  g1_29  g1_30  g1_31  g1_32  g1_33  g1_34  g1_35  g1_36  g1_37  g1_38  g1_39  g1_40  
g1_41  g1_42  g1_43  g1_44  g1_45  g1_46  g1_47  g1_48  g1_49  g1_50  g1_51  g1_52  g1_53  g1_54  g1_55  g1_56  g1_57  g1_58  g1_59  g1_60  
g1_61  g1_62  g1_63  g1_64  g1_65  g1_66  g1_67  g1_68  g1_69  g1_70  g1_71  g1_72  g1_73  g1_74  g1_75  g1_76  g1_77  g1_78  g1_79  g1_80  
g1_81  g1_82  g1_83  g1_84  g1_85  g1_86  g1_87  g1_88  g1_89  g1_90  g1_91  g1_92  g1_93  g1_94  g1_95  g1_96  g1_97  g1_98  g1_99  g1_100
g1_101 g1_102 g1_103 g1_104 g1_105 g1_106 g1_107 g1_108 g1_109 g1_110 g1_111 g1_112 g1_113 g1_114 g1_115 g1_116 g1_117 g1_118 g1_119 g1_120
;
by cald;
run;

data d_b; * this is number of variables in %let var = above ;
merge 
g2_1   g2_2   g2_3   g2_4   g2_5   g2_6   g2_7   g2_8   g2_9   g2_10  g2_11  g2_12  g2_13  g2_14  g2_15  g2_16  g2_17  g2_18  g2_19  g2_20  
g2_21  g2_22  g2_23  g2_24  g2_25  g2_26  g2_27  g2_28  g2_29  g2_30  g2_31  g2_32  g2_33  g2_34  g2_35  g2_36  g2_37  g2_38  g2_39  g2_40  
g2_41  g2_42  g2_43  g2_44  g2_45  g2_46  g2_47  g2_48  g2_49  g2_50  g2_51  g2_52  g2_53  g2_54  g2_55  g2_56  g2_57  g2_58  g2_59  g2_60  
g2_61  g2_62  g2_63  g2_64  g2_65  g2_66  g2_67  g2_68  g2_69  g2_70  g2_71  g2_72  g2_73  g2_74  g2_75  g2_76  g2_77  g2_78  g2_79  g2_80  
g2_81  g2_82  g2_83  g2_84  g2_85  g2_86  g2_87  g2_88  g2_89  g2_90  g2_91  g2_92  g2_93  g2_94  g2_95  g2_96  g2_97  g2_98  g2_99  g2_100
g2_101 g2_102 g2_103 g2_104 g2_105 g2_106 g2_107 g2_108 g2_109 g2_110 g2_111 g2_112 g2_113 g2_114 g2_115 g2_116 g2_117 g2_118 g2_119 g2_120

g3_1   g3_2   g3_3   g3_4   g3_5   g3_6   g3_7   g3_8   g3_9   g3_10  g3_11  g3_12  g3_13  g3_14  g3_15  g3_16  g3_17  g3_18  g3_19  g3_20  
g3_21  g3_22  g3_23  g3_24  g3_25  g3_26  g3_27  g3_28  g3_29  g3_30  g3_31  g3_32  g3_33  g3_34  g3_35  g3_36  g3_37  g3_38  g3_39  g3_40  
g3_41  g3_42  g3_43  g3_44  g3_45  g3_46  g3_47  g3_48  g3_49  g3_50  g3_51  g3_52  g3_53  g3_54  g3_55  g3_56  g3_57  g3_58  g3_59  g3_60  
g3_61  g3_62  g3_63  g3_64  g3_65  g3_66  g3_67  g3_68  g3_69  g3_70  g3_71  g3_72  g3_73  g3_74  g3_75  g3_76  g3_77  g3_78  g3_79  g3_80  
g3_81  g3_82  g3_83  g3_84  g3_85  g3_86  g3_87  g3_88  g3_89  g3_90  g3_91  g3_92  g3_93  g3_94  g3_95  g3_96  g3_97  g3_98  g3_99  g3_100
g3_101 g3_102 g3_103 g3_104 g3_105 g3_106 g3_107 g3_108 g3_109 g3_110 g3_111 g3_112 g3_113 g3_114 g3_115 g3_116 g3_117 g3_118 g3_119 g3_120
;
by cald;
run;

data d_c; * this is number of variables in %let var = above ;
merge 
g4_1   g4_2   g4_3   g4_4   g4_5   g4_6   g4_7   g4_8   g4_9   g4_10  g4_11  g4_12  g4_13  g4_14  g4_15  g4_16  g4_17  g4_18  g4_19  g4_20  
g4_21  g4_22  g4_23  g4_24  g4_25  g4_26  g4_27  g4_28  g4_29  g4_30  g4_31  g4_32  g4_33  g4_34  g4_35  g4_36  g4_37  g4_38  g4_39  g4_40  
g4_41  g4_42  g4_43  g4_44  g4_45  g4_46  g4_47  g4_48  g4_49  g4_50  g4_51  g4_52  g4_53  g4_54  g4_55  g4_56  g4_57  g4_58  g4_59  g4_60  
g4_61  g4_62  g4_63  g4_64  g4_65  g4_66  g4_67  g4_68  g4_69  g4_70  g4_71  g4_72  g4_73  g4_74  g4_75  g4_76  g4_77  g4_78  g4_79  g4_80  
g4_81  g4_82  g4_83  g4_84  g4_85  g4_86  g4_87  g4_88  g4_89  g4_90  g4_91  g4_92  g4_93  g4_94  g4_95  g4_96  g4_97  g4_98  g4_99  g4_100
g4_101 g4_102 g4_103 g4_104 g4_105 g4_106 g4_107 g4_108 g4_109 g4_110 g4_111 g4_112 g4_113 g4_114 g4_115 g4_116 g4_117 g4_118 g4_119 g4_120

g5_1   g5_2   g5_3   g5_4   g5_5   g5_6   g5_7   g5_8   g5_9   g5_10  g5_11  g5_12  g5_13  g5_14  g5_15  g5_16  g5_17  g5_18  g5_19  g5_20  
g5_21  g5_22  g5_23  g5_24  g5_25  g5_26  g5_27  g5_28  g5_29  g5_30  g5_31  g5_32  g5_33  g5_34  g5_35  g5_36  g5_37  g5_38  g5_39  g5_40  
g5_41  g5_42  g5_43  g5_44  g5_45  g5_46  g5_47  g5_48  g5_49  g5_50  g5_51  g5_52  g5_53  g5_54  g5_55  g5_56  g5_57  g5_58  g5_59  g5_60  
g5_61  g5_62  g5_63  g5_64  g5_65  g5_66  g5_67  g5_68  g5_69  g5_70  g5_71  g5_72  g5_73  g5_74  g5_75  g5_76  g5_77  g5_78  g5_79  g5_80  
g5_81  g5_82  g5_83  g5_84  g5_85  g5_86  g5_87  g5_88  g5_89  g5_90  g5_91  g5_92  g5_93  g5_94  g5_95  g5_96  g5_97  g5_98  g5_99  g5_100
g5_101 g5_102 g5_103 g5_104 g5_105 g5_106 g5_107 g5_108 g5_109 g5_110 g5_111 g5_112 g5_113 g5_114 g5_115 g5_116 g5_117 g5_118 g5_119 g5_120
;
by cald;
run;

data d_d; * this is number of variables in %let var = above ;
merge 
g6_1   g6_2   g6_3   g6_4   g6_5   g6_6   g6_7   g6_8   g6_9   g6_10  g6_11  g6_12  g6_13  g6_14  g6_15  g6_16  g6_17  g6_18  g6_19  g6_20  
g6_21  g6_22  g6_23  g6_24  g6_25  g6_26  g6_27  g6_28  g6_29  g6_30  g6_31  g6_32  g6_33  g6_34  g6_35  g6_36  g6_37  g6_38  g6_39  g6_40  
g6_41  g6_42  g6_43  g6_44  g6_45  g6_46  g6_47  g6_48  g6_49  g6_50  g6_51  g6_52  g6_53  g6_54  g6_55  g6_56  g6_57  g6_58  g6_59  g6_60  
g6_61  g6_62  g6_63  g6_64  g6_65  g6_66  g6_67  g6_68  g6_69  g6_70  g6_71  g6_72  g6_73  g6_74  g6_75  g6_76  g6_77  g6_78  g6_79  g6_80  
g6_81  g6_82  g6_83  g6_84  g6_85  g6_86  g6_87  g6_88  g6_89  g6_90  g6_91  g6_92  g6_93  g6_94  g6_95  g6_96  g6_97  g6_98  g6_99  g6_100
g6_101 g6_102 g6_103 g6_104 g6_105 g6_106 g6_107 g6_108 g6_109 g6_110 g6_111 g6_112 g6_113 g6_114 g6_115 g6_116 g6_117 g6_118 g6_119 g6_120

g7_1   g7_2   g7_3   g7_4   g7_5   g7_6   g7_7   g7_8   g7_9   g7_10  g7_11  g7_12  g7_13  g7_14  g7_15  g7_16  g7_17  g7_18  g7_19  g7_20  
g7_21  g7_22  g7_23  g7_24  g7_25  g7_26  g7_27  g7_28  g7_29  g7_30  g7_31  g7_32  g7_33  g7_34  g7_35  g7_36  g7_37  g7_38  g7_39  g7_40  
g7_41  g7_42  g7_43  g7_44  g7_45  g7_46  g7_47  g7_48  g7_49  g7_50  g7_51  g7_52  g7_53  g7_54  g7_55  g7_56  g7_57  g7_58  g7_59  g7_60  
g7_61  g7_62  g7_63  g7_64  g7_65  g7_66  g7_67  g7_68  g7_69  g7_70  g7_71  g7_72  g7_73  g7_74  g7_75  g7_76  g7_77  g7_78  g7_79  g7_80  
g7_81  g7_82  g7_83  g7_84  g7_85  g7_86  g7_87  g7_88  g7_89  g7_90  g7_91  g7_92  g7_93  g7_94  g7_95  g7_96  g7_97  g7_98  g7_99  g7_100
g7_101 g7_102 g7_103 g7_104 g7_105 g7_106 g7_107 g7_108 g7_109 g7_110 g7_111 g7_112 g7_113 g7_114 g7_115 g7_116 g7_117 g7_118 g7_119 g7_120

g8_1   g8_2   g8_3   g8_4   g8_5   g8_6   g8_7   g8_8   g8_9   g8_10  g8_11  g8_12  g8_13  g8_14  g8_15  g8_16  g8_17  g8_18  g8_19  g8_20
g8_21  g8_22  g8_23  g8_24  g8_25  g8_26  g8_27  g8_28  g8_29  g8_30  g8_31  g8_32  g8_33  g8_34  g8_35  g8_36  g8_37  g8_38  g8_39  g8_40
g8_41  g8_42  g8_43  g8_44  g8_45  g8_46  g8_47  g8_48  g8_49  g8_50  g8_51  g8_52  g8_53  g8_54  g8_55  g8_56  g8_57  g8_58  g8_59  g8_60  
g8_61  g8_62  g8_63  g8_64  g8_65  g8_66  g8_67  g8_68  g8_69  g8_70  g8_71  g8_72  g8_73  g8_74  g8_75  g8_76  g8_77  g8_78  g8_79  g8_80  
g8_81  g8_82  g8_83  g8_84  g8_85  g8_86  g8_87  g8_88  g8_89  g8_90  g8_91  g8_92  g8_93  g8_94  g8_95  g8_96  g8_97  g8_98  g8_99  g8_100
g8_101 g8_102 g8_103 g8_104 g8_105 g8_106 g8_107 g8_108 g8_109 g8_110 g8_111 g8_112 g8_113 g8_114 g8_115 g8_116 g8_117 g8_118 g8_119 g8_120
;
by cald;
run;

data d; * this is number of variables in %let var = above ;
	merge d_a d_b d_c d_d;
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
ods rtf file = 'C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe\graphs_20251002.doc' startpage=never;


***Options 0-8 
	0 = SQ
	1 = turn off PrEP
	2 = turn off ST
	3 = turn off SW program
	4 = turn off VMMC
	5 = turn off condom provision and promotion
	6 = turn off CD4 measurements
	7 = turn off VL monitoring
	8 = turn off ART support interventions	
;


* Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_incidence1549__0 = "status quo";
label mean_incidence1549__1 = " - PrEP";
label mean_incidence1549__2 = " - self tests";
label mean_incidence1549__3 = " - SW program";
label mean_incidence1549__4 = " - VMMC";
label mean_incidence1549__5 = " - condoms";
label mean_incidence1549__6 = " - CD4 measurements";
label mean_incidence1549__7 = " - VL measurements";
label mean_incidence1549__8 = " - ART support";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_incidence1549__3 	upper=p95_incidence1549__3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_incidence1549__4 	upper=p95_incidence1549__4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_incidence1549__5 	upper=p95_incidence1549__5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_incidence1549__6 	upper=p95_incidence1549__6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_incidence1549__7 	upper=p95_incidence1549__7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_incidence1549__8 	upper=p95_incidence1549__8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;

* Number of new infections;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new HIV infections (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to 2075 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000 by  10000) valueattrs=(size=10);*20000000 is stoping in 2023;
label mean_n_new_inf1549__0 = "status quo";
label mean_n_new_inf1549__1 = " - PrEP";
label mean_n_new_inf1549__2 = " - self tests";
label mean_n_new_inf1549__3 = " - SW program";
label mean_n_new_inf1549__4 = " - VMMC";
label mean_n_new_inf1549__5 = " - condoms";
label mean_n_new_inf1549__6 = " - CD4 measurements";
label mean_n_new_inf1549__7 = " - VL measurements";
label mean_n_new_inf1549__8 = " - ART support";
series  x=cald y=mean_n_new_inf1549__0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__0 	upper=p95_n_new_inf1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__1 	upper=p95_n_new_inf1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__2 	upper=p95_n_new_inf1549__2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__3 	upper=p95_n_new_inf1549__3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__4 	upper=p95_n_new_inf1549__4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__5 	upper=p95_n_new_inf1549__5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__6 	upper=p95_n_new_inf1549__6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__7 	upper=p95_n_new_inf1549__7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__8 	upper=p95_n_new_inf1549__8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;

proc print data=d;
	var mean_n_new_inf1549__0 mean_n_new_inf1549__1 mean_n_new_inf1549__2 mean_n_new_inf1549__3 mean_n_new_inf1549__4
	mean_n_new_inf1549__5 mean_n_new_inf1549__6 mean_n_new_inf1549__7 mean_n_new_inf1549__8
	;
	where cald=2070;
run;

* p_newp;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to 2075 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 /*0.2*/ by 0.02) valueattrs=(size=10);
label mean_p_newp_ge1__0 = "status quo";
label mean_p_newp_ge1__1 = " - PrEP";
label mean_p_newp_ge1__2 = " - self tests";
label mean_p_newp_ge1__3 = " - SW program";
label mean_p_newp_ge1__4 = " - VMMC";
label mean_p_newp_ge1__5 = " - condoms";
label mean_p_newp_ge1__6 = " - CD4 measurements";
label mean_p_newp_ge1__7 = " - VL measurements";
label mean_p_newp_ge1__8 = " - ART support";
series  x=cald y=mean_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__2 	upper=p95_p_newp_ge1__2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__3 	upper=p95_p_newp_ge1__3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__4 	upper=p95_p_newp_ge1__4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__5 	upper=p95_p_newp_ge1__5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__6 	upper=p95_p_newp_ge1__6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__7 	upper=p95_p_newp_ge1__7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__8 	upper=p95_p_newp_ge1__8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;


* p_ep;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_ep_0 = "status quo";
label mean_p_ep_1 = " - PrEP";
label mean_p_ep_2 = " - self tests";
label mean_p_ep_3 = " - SW program";
label mean_p_ep_4 = " - VMMC";
label mean_p_ep_5 = " - condoms";
label mean_p_ep_6 = " - CD4 measurements";
label mean_p_ep_7 = " - VL measurements";
label mean_p_ep_8 = " - ART support";
series  x=cald y=mean_p_ep_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_ep_1 	upper=p95_p_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_ep_2 	upper=p95_p_ep_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_ep_3 	upper=p95_p_ep_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_ep_4 	upper=p95_p_ep_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_ep_5 	upper=p95_p_ep_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_ep_6 	upper=p95_p_ep_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_ep_7 	upper=p95_p_ep_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_ep_8 	upper=p95_p_ep_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;


/*
* Proportion with condomless sex in past 3 months;
* (can compare this outcome with Goals);
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men with condomless sex in past 3 months - p_m_npge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_m_npge1__0 = "status quo";
label mean_p_m_npge1__1 = " - PrEP";
label mean_p_m_npge1__2 = " - self tests";
label mean_p_m_npge1__3 = " - SW program";
label mean_p_m_npge1__4 = " - VMMC";
label mean_p_m_npge1__5 = " - condoms";
label mean_p_m_npge1__6 = " - CD4 measurements";
label mean_p_m_npge1__7 = " - VL measurements";
label mean_p_m_npge1__8 = " - ART support";
series  x=cald y=mean_p_m_npge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_m_npge1__0 	upper=p95_p_m_npge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_m_npge1__1 	upper=p95_p_m_npge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__2/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_m_npge1__2 	upper=p95_p_m_npge1__2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__3/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_p_m_npge1__3 	upper=p95_p_m_npge1__3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__4/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_m_npge1__4 	upper=p95_p_m_npge1__4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__5/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_p_m_npge1__5 	upper=p95_p_m_npge1__5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__6/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_m_npge1__6 	upper=p95_p_m_npge1__6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__7/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_p_m_npge1__7 	upper=p95_p_m_npge1__7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__8/	lineattrs = (color=brown thickness = 2);
band    x=cald lower=p5_p_m_npge1__8 	upper=p95_p_m_npge1__8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women with condomless sex in past 3 months - p_w_npge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_w_npge1__0 = "status quo";
label mean_p_w_npge1__1 = " - PrEP";
label mean_p_w_npge1__2 = " - self tests";
label mean_p_w_npge1__3 = " - SW program";
label mean_p_w_npge1__4 = " - VMMC";
label mean_p_w_npge1__5 = " - condoms";
label mean_p_w_npge1__6 = " - CD4 measurements";
label mean_p_w_npge1__7 = " - VL measurements";
label mean_p_w_npge1__8 = " - ART support";
series  x=cald y=mean_p_w_npge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_npge1__0 	upper=p95_p_w_npge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w_npge1__1 	upper=p95_p_w_npge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__2/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_w_npge1__2 	upper=p95_p_w_npge1__2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__3/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_p_w_npge1__3 	upper=p95_p_w_npge1__3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__4/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_w_npge1__4 	upper=p95_p_w_npge1__4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__5/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_p_w_npge1__5 	upper=p95_p_w_npge1__5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__6/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_w_npge1__6 	upper=p95_p_w_npge1__6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__7/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_p_w_npge1__7 	upper=p95_p_w_npge1__7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__8/	lineattrs = (color=brown thickness = 2);
band    x=cald lower=p5_p_w_npge1__8 	upper=p95_p_w_npge1__8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";
run;quit;
*/


* Proportion diagnosed (of all HIV+);
proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_diag_m_0 = "status quo";
label mean_p_diag_m_1 = " - PrEP";
label mean_p_diag_m_2 = " - self tests";
label mean_p_diag_m_3 = " - SW program";
label mean_p_diag_m_4 = " - VMMC";
label mean_p_diag_m_5 = " - condoms";
label mean_p_diag_m_6 = " - CD4 measurements";
label mean_p_diag_m_7 = " - VL measurements";
label mean_p_diag_m_8 = " - diag support";
series  x=cald y=mean_p_diag_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_diag_m_2 	upper=p95_p_diag_m_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_diag_m_3 	upper=p95_p_diag_m_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_diag_m_4 	upper=p95_p_diag_m_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_diag_m_5 	upper=p95_p_diag_m_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_diag_m_6 	upper=p95_p_diag_m_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_diag_m_7 	upper=p95_p_diag_m_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_diag_m_8 	upper=p95_p_diag_m_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_diag_w_0 = "status quo";
label mean_p_diag_w_1 = " - PrEP";
label mean_p_diag_w_2 = " - self tests";
label mean_p_diag_w_3 = " - SW program";
label mean_p_diag_w_4 = " - VMMC";
label mean_p_diag_w_5 = " - condoms";
label mean_p_diag_w_6 = " - CD4 measurements";
label mean_p_diag_w_7 = " - VL measurements";
label mean_p_diag_w_8 = " - diag support";
series  x=cald y=mean_p_diag_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_diag_w_2 	upper=p95_p_diag_w_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_diag_w_3 	upper=p95_p_diag_w_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_diag_w_4 	upper=p95_p_diag_w_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_diag_w_5 	upper=p95_p_diag_w_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_diag_w_6 	upper=p95_p_diag_w_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_diag_w_7 	upper=p95_p_diag_w_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_diag_w_8 	upper=p95_p_diag_w_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;



* Proportion on ART (of all HIV+);
proc sgplot data=d; 
Title    height=1.5 justify=center "p_art_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_art_m_0 = "status quo";
label mean_p_art_m_1 = " - PrEP";
label mean_p_art_m_2 = " - self tests";
label mean_p_art_m_3 = " - SW program";
label mean_p_art_m_4 = " - VMMC";
label mean_p_art_m_5 = " - condoms";
label mean_p_art_m_6 = " - CD4 measurements";
label mean_p_art_m_7 = " - VL measurements";
label mean_p_art_m_8 = " - ART support";
series  x=cald y=mean_p_art_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_m_0 	upper=p95_p_art_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_art_m_1 	upper=p95_p_art_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_art_m_2 	upper=p95_p_art_m_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_art_m_3 	upper=p95_p_art_m_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_art_m_4 	upper=p95_p_art_m_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_art_m_5 	upper=p95_p_art_m_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_art_m_6 	upper=p95_p_art_m_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_art_m_7 	upper=p95_p_art_m_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_art_m_8 	upper=p95_p_art_m_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_art_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_art_w_0 = "status quo";
label mean_p_art_w_1 = " - PrEP";
label mean_p_art_w_2 = " - self tests";
label mean_p_art_w_3 = " - SW program";
label mean_p_art_w_4 = " - VMMC";
label mean_p_art_w_5 = " - condoms";
label mean_p_art_w_6 = " - CD4 measurements";
label mean_p_art_w_7 = " - VL measurements";
label mean_p_art_w_8 = " - ART support";
series  x=cald y=mean_p_art_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_w_0 	upper=p95_p_art_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_art_w_1 	upper=p95_p_art_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_art_w_2 	upper=p95_p_art_w_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_art_w_3 	upper=p95_p_art_w_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_art_w_4 	upper=p95_p_art_w_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_art_w_5 	upper=p95_p_art_w_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_art_w_6 	upper=p95_p_art_w_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_art_w_7 	upper=p95_p_art_w_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_art_w_8 	upper=p95_p_art_w_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;


* Proportion on ART (of diagnosed HIV+);
proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_art_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_diag_art_m_0 = "status quo";
label mean_p_diag_art_m_1 = " - PrEP";
label mean_p_diag_art_m_2 = " - self tests";
label mean_p_diag_art_m_3 = " - SW program";
label mean_p_diag_art_m_4 = " - VMMC";
label mean_p_diag_art_m_5 = " - condoms";
label mean_p_diag_art_m_6 = " - CD4 measurements";
label mean_p_diag_art_m_7 = " - VL measurements";
label mean_p_diag_art_m_8 = " - ART support";
series  x=cald y=mean_p_diag_art_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_0 	upper=p95_p_diag_art_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_1 	upper=p95_p_diag_art_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_2 	upper=p95_p_diag_art_m_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_3 	upper=p95_p_diag_art_m_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_4 	upper=p95_p_diag_art_m_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_5 	upper=p95_p_diag_art_m_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_6 	upper=p95_p_diag_art_m_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_7 	upper=p95_p_diag_art_m_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_8 	upper=p95_p_diag_art_m_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_art_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_diag_art_w_0 = "status quo";
label mean_p_diag_art_w_1 = " - PrEP";
label mean_p_diag_art_w_2 = " - self tests";
label mean_p_diag_art_w_3 = " - SW program";
label mean_p_diag_art_w_4 = " - VMMC";
label mean_p_diag_art_w_5 = " - condoms";
label mean_p_diag_art_w_6 = " - CD4 measurements";
label mean_p_diag_art_w_7 = " - VL measurements";
label mean_p_diag_art_w_8 = " - ART support";
series  x=cald y=mean_p_diag_art_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_0 	upper=p95_p_diag_art_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_1 	upper=p95_p_diag_art_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_2 	upper=p95_p_diag_art_w_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_3 	upper=p95_p_diag_art_w_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_4 	upper=p95_p_diag_art_w_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_5 	upper=p95_p_diag_art_w_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_6 	upper=p95_p_diag_art_w_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_7 	upper=p95_p_diag_art_w_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_8 	upper=p95_p_diag_art_w_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;


* Proportion virally suppressed;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_art_vls_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_art_vls_m_0 = "status quo";
label mean_p_art_vls_m_1 = " - PrEP";
label mean_p_art_vls_m_2 = " - self tests";
label mean_p_art_vls_m_3 = " - SW program";
label mean_p_art_vls_m_4 = " - VMMC";
label mean_p_art_vls_m_5 = " - condoms";
label mean_p_art_vls_m_6 = " - CD4 measurements";
label mean_p_art_vls_m_7 = " - VL measurements";
label mean_p_art_vls_m_8 = " - ART support";
series  x=cald y=mean_p_art_vls_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_0 	upper=p95_p_art_vls_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_1 	upper=p95_p_art_vls_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_2 	upper=p95_p_art_vls_m_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_3 	upper=p95_p_art_vls_m_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_4 	upper=p95_p_art_vls_m_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_5 	upper=p95_p_art_vls_m_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_6 	upper=p95_p_art_vls_m_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_7 	upper=p95_p_art_vls_m_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_8 	upper=p95_p_art_vls_m_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_art_vls_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_art_vls_w_0 = "status quo";
label mean_p_art_vls_w_1 = " - PrEP";
label mean_p_art_vls_w_2 = " - self tests";
label mean_p_art_vls_w_3 = " - SW program";
label mean_p_art_vls_w_4 = " - VMMC";
label mean_p_art_vls_w_5 = " - condoms";
label mean_p_art_vls_w_6 = " - CD4 measurements";
label mean_p_art_vls_w_7 = " - VL measurements";
label mean_p_art_vls_w_8 = " - ART support";
series  x=cald y=mean_p_art_vls_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_0 	upper=p95_p_art_vls_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_1/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_1 	upper=p95_p_art_vls_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_2/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_2 	upper=p95_p_art_vls_w_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_3/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_3 	upper=p95_p_art_vls_w_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_4/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_4 	upper=p95_p_art_vls_w_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_5/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_5 	upper=p95_p_art_vls_w_5  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_6/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_6 	upper=p95_p_art_vls_w_6  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_7/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_7 	upper=p95_p_art_vls_w_7  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_8/	lineattrs = (color=brown thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_8 	upper=p95_p_art_vls_w_8  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";*/
run;quit;


ods html close;

ods rtf close;run;







