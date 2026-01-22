
***Program to produce graphs using averages across runs
***Use include statement in analysis program to read the code below in;

*** 20260119 version has options 0-9 and 99, using weaker condom change intervention parameters and removing self-testing in the minimal (option 0);
* Building up package of interventions in order of decreasing cost-effectivesness (based on ICER);

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_malawi\mlw_control_20260119_out\";

proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";
proc freq data=a.long_mlw_control;table option;run;

%let pth_export_hiv_control= C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Malawi;run;

%let year_start = 1990;
%let year_end = 2075;


data b;
set a.long_mlw_control;

* Define new variables;
n_alive_m = n_alive_1524m + n_alive_2549m + n_alive_50plm;
n_alive_w = n_alive_1524w + n_alive_2549w + n_alive_50plw;
n_alive = n_alive_m + n_alive_w;

n_new_inf1549m = n_new_inf1524m + n_new_inf2549m;
n_new_inf1549w = n_new_inf1524w + n_new_inf2549w;
n_new_inf1549_ = n_new_inf1549m + n_new_inf1549w;
n_new_inf1564_ = n_new_inf1549_	+ n_new_inf50plm + n_new_inf50plw;
n_new_inf0064_ = n_new_inf1564_ + n_hiv_child;

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

n_onprep = n_onprep_m + n_onprep_w;
n_onprep_oral = n_onprep_oral_m	+ n_onprep_oral_w;
n_onprep_len = n_onprep_len_m + n_onprep_len_w;

pc_elig_onprep = n_onprep / n_elig_prep;
pc_elig_onprep_oral= n_onprep_oral / n_elig_prep;
pc_elig_onprep_len = n_onprep_len / n_elig_prep;

n_tested = n_tested_m + n_tested_w;
n_self_tested = n_self_tested_m + n_self_tested_w;


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

n_sw_1549_ = n_sw_1549;
run;




proc sort data=b; by option cald run ;run;

proc freq data=b; table cald option;run;

*At the moment is the median across all runs by option;
*Note that we need the same number of simulations/runs from each dataset;
data b; set b;
	count_csim+1;
	by option cald ;
	if first.cald then count_csim=1;
run;		***counts the number of runs;
 ***number of runs - this is manually inputted in nfit in the macros below;

/*
proc sql;
    create table b_counts as
    select option,
           cald,
           count(distinct run) as count_csim
    from b
    group by option, cald;
quit;
*/

proc means max data=b; var count_csim cald; run;


/*
proc sort data=b;
	by cald option ;
run;
*/	
** Do we need this line? ;

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
n_daly			total_cost_hiv_control			p_mcirc_1549m			n_sw_program_visit
n_circumcised_15_24_m			n_onprep_agyw_pg		n_agyw_pg	/* added Sept 2025 */

/*Extra outputs for calibration*/	/* added Sept 2025 */
/* Stocks */
n_sw_1549_
n_onprep_agyw_plw				n_agyw_plw
n_onprep_oral_agyw_pg			n_onprep_len_agyw_pg			n_onprep_oral_agyw_plw				n_onprep_len_agyw_plw
n_onprep_oral_m					n_onprep_len_m					n_onprep_oral_w						n_onprep_len_w
n_onprep_oral_sw				n_onprep_len_sw					n_onprep_oral_msm					n_onprep_len_msm
n_elig_prep_any_sw				n_elig_prep_w_1549_				n_elig_prep_w_1564_					n_elig_prep_any_msm_1564_
n_tested_m						n_tested_w
n_self_tested_m					n_self_tested_w					n_tested_due_to_self_test

/* Flows */
incidence1549_					incidence1549w					incidence1549m						incidence1564_
p_newp_ge1_						p_newp_ge5_						av_newp_ge1_						p_ep
p_m_npge1_						p_w_npge1_
p_mcirc_1524m
n_diag_sw						n_undiag_sw
n_diag_msm_age1564_				n_undiag_msm

/* Check costs */
total_dcost_hiv_control
cost_test	cost_self_test	cost_art	cost_condoms	cost_prep_tot	cost_vmmc	cost_fsw_services	cost_msm_services	cost_adh_support
dcost_test	dcost_self_test	dcost_art	dcost_condoms	dcost_prep_tot	dcost_vmmc	dcost_fsw_services	dcost_msm_services	dcost_adh_support

/* Calculated above */
n_alive				n_alive_m			n_alive_w
n_new_inf1549m 		n_new_inf1549w 		n_new_inf1549_ 		n_new_inf1564_		n_new_inf0064_
p_diag_m 			p_diag_w 			p_diag 
p_art_m 			p_art_w 			p_art 
p_diag_art_m 		p_diag_art_w 		p_diag_art
p_art_vls_m 		p_art_vls_w			p_art_vls 
n_onprep			n_onprep_oral		n_onprep_len
pc_elig_onprep		pc_elig_onprep_oral	pc_elig_onprep_len
n_tested			n_self_tested

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
%let nfit=21;
%option_(0);
%option_(1);
%option_(2);
%option_(3);
%option_(4);
%option_(5);
%option_(6);
%option_(7);
%option_(8);
%option_(9);
%option_(10);
/*%option_(11);*/
/*%option_(12);*/
/*%option_(13);*/
%option_(99);
run;



data d_a; * this is number of variables in %let var = above ;
merge 
g0_1   g0_2   g0_3   g0_4   g0_5   g0_6   g0_7   g0_8   g0_9   g0_10  g0_11  g0_12  g0_13  g0_14  g0_15  g0_16  g0_17  g0_18  g0_19  g0_20 
g0_21  g0_22  g0_23  g0_24  g0_25  g0_26  g0_27  g0_28  g0_29  g0_30  g0_31  g0_32  g0_33  g0_34  g0_35  g0_36  g0_37  g0_38  g0_39  g0_40
g0_41  g0_42  g0_43  g0_44  g0_45  g0_46  g0_47  g0_48  g0_49  g0_50  g0_51  g0_52  g0_53  g0_54  g0_55  g0_56  g0_57  g0_58  g0_59  g0_60
g0_61  g0_62  g0_63  g0_64  g0_65  g0_66  g0_67  g0_68  g0_69  g0_70  g0_71  g0_72  g0_73  g0_74  g0_75  g0_76  g0_77  g0_78  g0_79  g0_80
g0_81  g0_82  g0_83  g0_84  g0_85  g0_86  g0_87  g0_88  g0_89  g0_90  g0_91  g0_92  g0_93  g0_94  g0_95  g0_96  g0_97  g0_98  g0_99  g0_100
g0_101 g0_102 g0_103 g0_104 g0_105 g0_106 g0_107 g0_108 g0_109 g0_110 g0_111 g0_112 g0_113 g0_114 g0_115 g0_116 g0_117 g0_118 g0_119 g0_120
g0_121 g0_122 g0_123 g0_124 g0_125 g0_126 g0_127 g0_128 g0_129 g0_130 g0_131 g0_132 g0_133 g0_134 g0_135 g0_136 g0_137 g0_138 g0_139 g0_140 
g0_141 g0_142 g0_143 g0_144 g0_145 g0_146 g0_147 g0_148 g0_149 g0_150 g0_151 g0_152 g0_153 g0_154 g0_155 g0_156 g0_157 g0_158 g0_159 g0_160 
g0_161 g0_162

g1_1   g1_2   g1_3   g1_4   g1_5   g1_6   g1_7   g1_8   g1_9   g1_10  g1_11  g1_12  g1_13  g1_14  g1_15  g1_16  g1_17  g1_18  g1_19  g1_20  
g1_21  g1_22  g1_23  g1_24  g1_25  g1_26  g1_27  g1_28  g1_29  g1_30  g1_31  g1_32  g1_33  g1_34  g1_35  g1_36  g1_37  g1_38  g1_39  g1_40  
g1_41  g1_42  g1_43  g1_44  g1_45  g1_46  g1_47  g1_48  g1_49  g1_50  g1_51  g1_52  g1_53  g1_54  g1_55  g1_56  g1_57  g1_58  g1_59  g1_60  
g1_61  g1_62  g1_63  g1_64  g1_65  g1_66  g1_67  g1_68  g1_69  g1_70  g1_71  g1_72  g1_73  g1_74  g1_75  g1_76  g1_77  g1_78  g1_79  g1_80  
g1_81  g1_82  g1_83  g1_84  g1_85  g1_86  g1_87  g1_88  g1_89  g1_90  g1_91  g1_92  g1_93  g1_94  g1_95  g1_96  g1_97  g1_98  g1_99  g1_100
g1_101 g1_102 g1_103 g1_104 g1_105 g1_106 g1_107 g1_108 g1_109 g1_110 g1_111 g1_112 g1_113 g1_114 g1_115 g1_116 g1_117 g1_118 g1_119 g1_120
g1_121 g1_122 g1_123 g1_124 g1_125 g1_126 g1_127 g1_128 g1_129 g1_130 g1_131 g1_132 g1_133 g1_134 g1_135 g1_136 g1_137 g1_138 g1_139 g1_140 
g1_141 g1_142 g1_143 g1_144 g1_145 g1_146 g1_147 g1_148 g1_149 g1_150 g1_151 g1_152 g1_153 g1_154 g1_155 g1_156 g1_157 g1_158 g1_159 g1_160 
g1_161 g1_162
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
g2_121 g2_122 g2_123 g2_124 g2_125 g2_126 g2_127 g2_128 g2_129 g2_130 g2_131 g2_132 g2_133 g2_134 g2_135 g2_136 g2_137 g2_138 g2_139 g2_140 
g2_141 g2_142 g2_143 g2_144 g2_145 g2_146 g2_147 g2_148 g2_149 g2_150 g2_151 g2_152 g2_153 g2_154 g2_155 g2_156 g2_157 g2_158 g2_159 g2_160 
g2_161 g2_162

g3_1   g3_2   g3_3   g3_4   g3_5   g3_6   g3_7   g3_8   g3_9   g3_10  g3_11  g3_12  g3_13  g3_14  g3_15  g3_16  g3_17  g3_18  g3_19  g3_20  
g3_21  g3_22  g3_23  g3_24  g3_25  g3_26  g3_27  g3_28  g3_29  g3_30  g3_31  g3_32  g3_33  g3_34  g3_35  g3_36  g3_37  g3_38  g3_39  g3_40  
g3_41  g3_42  g3_43  g3_44  g3_45  g3_46  g3_47  g3_48  g3_49  g3_50  g3_51  g3_52  g3_53  g3_54  g3_55  g3_56  g3_57  g3_58  g3_59  g3_60  
g3_61  g3_62  g3_63  g3_64  g3_65  g3_66  g3_67  g3_68  g3_69  g3_70  g3_71  g3_72  g3_73  g3_74  g3_75  g3_76  g3_77  g3_78  g3_79  g3_80  
g3_81  g3_82  g3_83  g3_84  g3_85  g3_86  g3_87  g3_88  g3_89  g3_90  g3_91  g3_92  g3_93  g3_94  g3_95  g3_96  g3_97  g3_98  g3_99  g3_100
g3_101 g3_102 g3_103 g3_104 g3_105 g3_106 g3_107 g3_108 g3_109 g3_110 g3_111 g3_112 g3_113 g3_114 g3_115 g3_116 g3_117 g3_118 g3_119 g3_120
g3_121 g3_122 g3_123 g3_124 g3_125 g3_126 g3_127 g3_128 g3_129 g3_130 g3_131 g3_132 g3_133 g3_134 g3_135 g3_136 g3_137 g3_138 g3_139 g3_140 
g3_141 g3_142 g3_143 g3_144 g3_145 g3_146 g3_147 g3_148 g3_149 g3_150 g3_151 g3_152 g3_153 g3_154 g3_155 g3_156 g3_157 g3_158 g3_159 g3_160 
g3_161 g3_162
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
g4_121 g4_122 g4_123 g4_124 g4_125 g4_126 g4_127 g4_128 g4_129 g4_130 g4_131 g4_132 g4_133 g4_134 g4_135 g4_136 g4_137 g4_138 g4_139 g4_140 
g4_141 g4_142 g4_143 g4_144 g4_145 g4_146 g4_147 g4_148 g4_149 g4_150 g4_151 g4_152 g4_153 g4_154 g4_155 g4_156 g4_157 g4_158 g4_159 g4_160 
g4_161 g4_162

g5_1   g5_2   g5_3   g5_4   g5_5   g5_6   g5_7   g5_8   g5_9   g5_10  g5_11  g5_12  g5_13  g5_14  g5_15  g5_16  g5_17  g5_18  g5_19  g5_20  
g5_21  g5_22  g5_23  g5_24  g5_25  g5_26  g5_27  g5_28  g5_29  g5_30  g5_31  g5_32  g5_33  g5_34  g5_35  g5_36  g5_37  g5_38  g5_39  g5_40  
g5_41  g5_42  g5_43  g5_44  g5_45  g5_46  g5_47  g5_48  g5_49  g5_50  g5_51  g5_52  g5_53  g5_54  g5_55  g5_56  g5_57  g5_58  g5_59  g5_60  
g5_61  g5_62  g5_63  g5_64  g5_65  g5_66  g5_67  g5_68  g5_69  g5_70  g5_71  g5_72  g5_73  g5_74  g5_75  g5_76  g5_77  g5_78  g5_79  g5_80  
g5_81  g5_82  g5_83  g5_84  g5_85  g5_86  g5_87  g5_88  g5_89  g5_90  g5_91  g5_92  g5_93  g5_94  g5_95  g5_96  g5_97  g5_98  g5_99  g5_100
g5_101 g5_102 g5_103 g5_104 g5_105 g5_106 g5_107 g5_108 g5_109 g5_110 g5_111 g5_112 g5_113 g5_114 g5_115 g5_116 g5_117 g5_118 g5_119 g5_120
g5_121 g5_122 g5_123 g5_124 g5_125 g5_126 g5_127 g5_128 g5_129 g5_130 g5_131 g5_132 g5_133 g5_134 g5_135 g5_136 g5_137 g5_138 g5_139 g5_140 
g5_141 g5_142 g5_143 g5_144 g5_145 g5_146 g5_147 g5_148 g5_149 g5_150 g5_151 g5_152 g5_153 g5_154 g5_155 g5_156 g5_157 g5_158 g5_159 g5_160 
g5_161 g5_162
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
g6_121 g6_122 g6_123 g6_124 g6_125 g6_126 g6_127 g6_128 g6_129 g6_130 g6_131 g6_132 g6_133 g6_134 g6_135 g6_136 g6_137 g6_138 g6_139 g6_140 
g6_141 g6_142 g6_143 g6_144 g6_145 g6_146 g6_147 g6_148 g6_149 g6_150 g6_151 g6_152 g6_153 g6_154 g6_155 g6_156 g6_157 g6_158 g6_159 g6_160 
g6_161 g6_162

g7_1   g7_2   g7_3   g7_4   g7_5   g7_6   g7_7   g7_8   g7_9   g7_10  g7_11  g7_12  g7_13  g7_14  g7_15  g7_16  g7_17  g7_18  g7_19  g7_20  
g7_21  g7_22  g7_23  g7_24  g7_25  g7_26  g7_27  g7_28  g7_29  g7_30  g7_31  g7_32  g7_33  g7_34  g7_35  g7_36  g7_37  g7_38  g7_39  g7_40  
g7_41  g7_42  g7_43  g7_44  g7_45  g7_46  g7_47  g7_48  g7_49  g7_50  g7_51  g7_52  g7_53  g7_54  g7_55  g7_56  g7_57  g7_58  g7_59  g7_60  
g7_61  g7_62  g7_63  g7_64  g7_65  g7_66  g7_67  g7_68  g7_69  g7_70  g7_71  g7_72  g7_73  g7_74  g7_75  g7_76  g7_77  g7_78  g7_79  g7_80  
g7_81  g7_82  g7_83  g7_84  g7_85  g7_86  g7_87  g7_88  g7_89  g7_90  g7_91  g7_92  g7_93  g7_94  g7_95  g7_96  g7_97  g7_98  g7_99  g7_100
g7_101 g7_102 g7_103 g7_104 g7_105 g7_106 g7_107 g7_108 g7_109 g7_110 g7_111 g7_112 g7_113 g7_114 g7_115 g7_116 g7_117 g7_118 g7_119 g7_120
g7_121 g7_122 g7_123 g7_124 g7_125 g7_126 g7_127 g7_128 g7_129 g7_130 g7_131 g7_132 g7_133 g7_134 g7_135 g7_136 g7_137 g7_138 g7_139 g7_140 
g7_141 g7_142 g7_143 g7_144 g7_145 g7_146 g7_147 g7_148 g7_149 g7_150 g7_151 g7_152 g7_153 g7_154 g7_155 g7_156 g7_157 g7_158 g7_159 g7_160 
g7_161 g7_162
;
by cald;
run;

data d_e; * this is number of variables in %let var = above ;
merge 
g8_1   g8_2   g8_3   g8_4   g8_5   g8_6   g8_7   g8_8   g8_9   g8_10  g8_11  g8_12  g8_13  g8_14  g8_15  g8_16  g8_17  g8_18  g8_19  g8_20
g8_21  g8_22  g8_23  g8_24  g8_25  g8_26  g8_27  g8_28  g8_29  g8_30  g8_31  g8_32  g8_33  g8_34  g8_35  g8_36  g8_37  g8_38  g8_39  g8_40
g8_41  g8_42  g8_43  g8_44  g8_45  g8_46  g8_47  g8_48  g8_49  g8_50  g8_51  g8_52  g8_53  g8_54  g8_55  g8_56  g8_57  g8_58  g8_59  g8_60  
g8_61  g8_62  g8_63  g8_64  g8_65  g8_66  g8_67  g8_68  g8_69  g8_70  g8_71  g8_72  g8_73  g8_74  g8_75  g8_76  g8_77  g8_78  g8_79  g8_80  
g8_81  g8_82  g8_83  g8_84  g8_85  g8_86  g8_87  g8_88  g8_89  g8_90  g8_91  g8_92  g8_93  g8_94  g8_95  g8_96  g8_97  g8_98  g8_99  g8_100
g8_101 g8_102 g8_103 g8_104 g8_105 g8_106 g8_107 g8_108 g8_109 g8_110 g8_111 g8_112 g8_113 g8_114 g8_115 g8_116 g8_117 g8_118 g8_119 g8_120
g8_121 g8_122 g8_123 g8_124 g8_125 g8_126 g8_127 g8_128 g8_129 g8_130 g8_131 g8_132 g8_133 g8_134 g8_135 g8_136 g8_137 g8_138 g8_139 g8_140 
g8_141 g8_142 g8_143 g8_144 g8_145 g8_146 g8_147 g8_148 g8_149 g8_150 g8_151 g8_152 g8_153 g8_154 g8_155 g8_156 g8_157 g8_158 g8_159 g8_160 
g8_161 g8_162

g9_1   g9_2   g9_3   g9_4   g9_5   g9_6   g9_7   g9_8   g9_9   g9_10  g9_11  g9_12  g9_13  g9_14  g9_15  g9_16  g9_17  g9_18  g9_19  g9_20
g9_21  g9_22  g9_23  g9_24  g9_25  g9_26  g9_27  g9_28  g9_29  g9_30  g9_31  g9_32  g9_33  g9_34  g9_35  g9_36  g9_37  g9_38  g9_39  g9_40
g9_41  g9_42  g9_43  g9_44  g9_45  g9_46  g9_47  g9_48  g9_49  g9_50  g9_51  g9_52  g9_53  g9_54  g9_55  g9_56  g9_57  g9_58  g9_59  g9_60  
g9_61  g9_62  g9_63  g9_64  g9_65  g9_66  g9_67  g9_68  g9_69  g9_70  g9_71  g9_72  g9_73  g9_74  g9_75  g9_76  g9_77  g9_78  g9_79  g9_80  
g9_81  g9_82  g9_83  g9_84  g9_85  g9_86  g9_87  g9_88  g9_89  g9_90  g9_91  g9_92  g9_93  g9_94  g9_95  g9_96  g9_97  g9_98  g9_99  g9_100
g9_101 g9_102 g9_103 g9_104 g9_105 g9_106 g9_107 g9_108 g9_109 g9_110 g9_111 g9_112 g9_113 g9_114 g9_115 g9_116 g9_117 g9_118 g9_119 g9_120
g9_121 g9_122 g9_123 g9_124 g9_125 g9_126 g9_127 g9_128 g9_129 g9_130 g9_131 g9_132 g9_133 g9_134 g9_135 g9_136 g9_137 g9_138 g9_139 g9_140 
g9_141 g9_142 g9_143 g9_144 g9_145 g9_146 g9_147 g9_148 g9_149 g9_150 g9_151 g9_152 g9_153 g9_154 g9_155 g9_156 g9_157 g9_158 g9_159 g9_160 
g9_161 g9_162
;
by cald;
run;

data d_f; * this is number of variables in %let var = above ;
merge 
g10_1   g10_2   g10_3   g10_4   g10_5   g10_6   g10_7   g10_8   g10_9   g10_10  g10_11  g10_12  g10_13  g10_14  g10_15  g10_16  g10_17  g10_18  g10_19  g10_20
g10_21  g10_22  g10_23  g10_24  g10_25  g10_26  g10_27  g10_28  g10_29  g10_30  g10_31  g10_32  g10_33  g10_34  g10_35  g10_36  g10_37  g10_38  g10_39  g10_40
g10_41  g10_42  g10_43  g10_44  g10_45  g10_46  g10_47  g10_48  g10_49  g10_50  g10_51  g10_52  g10_53  g10_54  g10_55  g10_56  g10_57  g10_58  g10_59  g10_60  
g10_61  g10_62  g10_63  g10_64  g10_65  g10_66  g10_67  g10_68  g10_69  g10_70  g10_71  g10_72  g10_73  g10_74  g10_75  g10_76  g10_77  g10_78  g10_79  g10_80  
g10_81  g10_82  g10_83  g10_84  g10_85  g10_86  g10_87  g10_88  g10_89  g10_90  g10_91  g10_92  g10_93  g10_94  g10_95  g10_96  g10_97  g10_98  g10_99  g10_100
g10_101 g10_102 g10_103 g10_104 g10_105 g10_106 g10_107 g10_108 g10_109 g10_110 g10_111 g10_112 g10_113 g10_114 g10_115 g10_116 g10_117 g10_118 g10_119 g10_120
g10_121 g10_122 g10_123 g10_124 g10_125 g10_126 g10_127 g10_128 g10_129 g10_130 g10_131 g10_132 g10_133 g10_134 g10_135 g10_136 g10_137 g10_138 g10_139 g10_140 
g10_141 g10_142 g10_143 g10_144 g10_145 g10_146 g10_147 g10_148 g10_149 g10_150 g10_151 g10_152 g10_153 g10_154 g10_155 g10_156 g10_157 g10_158 g10_159 g10_160 
g10_161 g10_162

g11_1   g11_2   g11_3   g11_4   g11_5   g11_6   g11_7   g11_8   g11_9   g11_10  g11_11  g11_12  g11_13  g11_14  g11_15  g11_16  g11_17  g11_18  g11_19  g11_20
g11_21  g11_22  g11_23  g11_24  g11_25  g11_26  g11_27  g11_28  g11_29  g11_30  g11_31  g11_32  g11_33  g11_34  g11_35  g11_36  g11_37  g11_38  g11_39  g11_40
g11_41  g11_42  g11_43  g11_44  g11_45  g11_46  g11_47  g11_48  g11_49  g11_50  g11_51  g11_52  g11_53  g11_54  g11_55  g11_56  g11_57  g11_58  g11_59  g11_60  
g11_61  g11_62  g11_63  g11_64  g11_65  g11_66  g11_67  g11_68  g11_69  g11_70  g11_71  g11_72  g11_73  g11_74  g11_75  g11_76  g11_77  g11_78  g11_79  g11_80  
g11_81  g11_82  g11_83  g11_84  g11_85  g11_86  g11_87  g11_88  g11_89  g11_90  g11_91  g11_92  g11_93  g11_94  g11_95  g11_96  g11_97  g11_98  g11_99  g11_100
g11_101 g11_102 g11_103 g11_104 g11_105 g11_106 g11_107 g11_108 g11_109 g11_110 g11_111 g11_112 g11_113 g11_114 g11_115 g11_116 g11_117 g11_118 g11_119 g11_120
g11_121 g11_122 g11_123 g11_124 g11_125 g11_126 g11_127 g11_128 g11_129 g11_130 g11_131 g11_132 g11_133 g11_134 g11_135 g11_136 g11_137 g11_138 g11_139 g11_140 
g11_141 g11_142 g11_143 g11_144 g11_145 g11_146 g11_147 g11_148 g11_149 g11_150 g11_151 g11_152 g11_153 g11_154 g11_155 g11_156 g11_157 g11_158 g11_159 g11_160 
g11_161 g11_162
;
by cald;
run;

data d_g; * this is number of variables in %let var = above ;
merge 
g12_1   g12_2   g12_3   g12_4   g12_5   g12_6   g12_7   g12_8   g12_9   g12_10  g12_11  g12_12  g12_13  g12_14  g12_15  g12_16  g12_17  g12_18  g12_19  g12_20
g12_21  g12_22  g12_23  g12_24  g12_25  g12_26  g12_27  g12_28  g12_29  g12_30  g12_31  g12_32  g12_33  g12_34  g12_35  g12_36  g12_37  g12_38  g12_39  g12_40
g12_41  g12_42  g12_43  g12_44  g12_45  g12_46  g12_47  g12_48  g12_49  g12_50  g12_51  g12_52  g12_53  g12_54  g12_55  g12_56  g12_57  g12_58  g12_59  g12_60  
g12_61  g12_62  g12_63  g12_64  g12_65  g12_66  g12_67  g12_68  g12_69  g12_70  g12_71  g12_72  g12_73  g12_74  g12_75  g12_76  g12_77  g12_78  g12_79  g12_80  
g12_81  g12_82  g12_83  g12_84  g12_85  g12_86  g12_87  g12_88  g12_89  g12_90  g12_91  g12_92  g12_93  g12_94  g12_95  g12_96  g12_97  g12_98  g12_99  g12_100
g12_101 g12_102 g12_103 g12_104 g12_105 g12_106 g12_107 g12_108 g12_109 g12_110 g12_111 g12_112 g12_113 g12_114 g12_115 g12_116 g12_117 g12_118 g12_119 g12_120
g12_121 g12_122 g12_123 g12_124 g12_125 g12_126 g12_127 g12_128 g12_129 g12_130 g12_131 g12_132 g12_133 g12_134 g12_135 g12_136 g12_137 g12_138 g12_139 g12_140 
g12_141 g12_142 g12_143 g12_144 g12_145 g12_146 g12_147 g12_148 g12_149 g12_150 g12_151 g12_152 g12_153 g12_154 g12_155 g12_156 g12_157 g12_158 g12_159 g12_160 
g12_161 g12_162

g13_1   g13_2   g13_3   g13_4   g13_5   g13_6   g13_7   g13_8   g13_9   g13_10  g13_11  g13_12  g13_13  g13_14  g13_15  g13_16  g13_17  g13_18  g13_19  g13_20
g13_21  g13_22  g13_23  g13_24  g13_25  g13_26  g13_27  g13_28  g13_29  g13_30  g13_31  g13_32  g13_33  g13_34  g13_35  g13_36  g13_37  g13_38  g13_39  g13_40
g13_41  g13_42  g13_43  g13_44  g13_45  g13_46  g13_47  g13_48  g13_49  g13_50  g13_51  g13_52  g13_53  g13_54  g13_55  g13_56  g13_57  g13_58  g13_59  g13_60  
g13_61  g13_62  g13_63  g13_64  g13_65  g13_66  g13_67  g13_68  g13_69  g13_70  g13_71  g13_72  g13_73  g13_74  g13_75  g13_76  g13_77  g13_78  g13_79  g13_80  
g13_81  g13_82  g13_83  g13_84  g13_85  g13_86  g13_87  g13_88  g13_89  g13_90  g13_91  g13_92  g13_93  g13_94  g13_95  g13_96  g13_97  g13_98  g13_99  g13_100
g13_101 g13_102 g13_103 g13_104 g13_105 g13_106 g13_107 g13_108 g13_109 g13_110 g13_111 g13_112 g13_113 g13_114 g13_115 g13_116 g13_117 g13_118 g13_119 g13_120
g13_121 g13_122 g13_123 g13_124 g13_125 g13_126 g13_127 g13_128 g13_129 g13_130 g13_131 g13_132 g13_133 g13_134 g13_135 g13_136 g13_137 g13_138 g13_139 g13_140 
g13_141 g13_142 g13_143 g13_144 g13_145 g13_146 g13_147 g13_148 g13_149 g13_150 g13_151 g13_152 g13_153 g13_154 g13_155 g13_156 g13_157 g13_158 g13_159 g13_160 
g13_161 g13_162

g99_1   g99_2   g99_3   g99_4   g99_5   g99_6   g99_7   g99_8   g99_9   g99_10  g99_11  g99_12  g99_13  g99_14  g99_15  g99_16  g99_17  g99_18  g99_19  g99_20
g99_21  g99_22  g99_23  g99_24  g99_25  g99_26  g99_27  g99_28  g99_29  g99_30  g99_31  g99_32  g99_33  g99_34  g99_35  g99_36  g99_37  g99_38  g99_39  g99_40
g99_41  g99_42  g99_43  g99_44  g99_45  g99_46  g99_47  g99_48  g99_49  g99_50  g99_51  g99_52  g99_53  g99_54  g99_55  g99_56  g99_57  g99_58  g99_59  g99_60  
g99_61  g99_62  g99_63  g99_64  g99_65  g99_66  g99_67  g99_68  g99_69  g99_70  g99_71  g99_72  g99_73  g99_74  g99_75  g99_76  g99_77  g99_78  g99_79  g99_80  
g99_81  g99_82  g99_83  g99_84  g99_85  g99_86  g99_87  g99_88  g99_89  g99_90  g99_91  g99_92  g99_93  g99_94  g99_95  g99_96  g99_97  g99_98  g99_99  g99_100
g99_101 g99_102 g99_103 g99_104 g99_105 g99_106 g99_107 g99_108 g99_109 g99_110 g99_111 g99_112 g99_113 g99_114 g99_115 g99_116 g99_117 g99_118 g99_119 g99_120
g99_121 g99_122 g99_123 g99_124 g99_125 g99_126 g99_127 g99_128 g99_129 g99_130 g99_131 g99_132 g99_133 g99_134 g99_135 g99_136 g99_137 g99_138 g99_139 g99_140 
g99_141 g99_142 g99_143 g99_144 g99_145 g99_146 g99_147 g99_148 g99_149 g99_150 g99_151 g99_152 g99_153 g99_154 g99_155 g99_156 g99_157 g99_158 g99_159 g99_160 
g99_161 g99_162
;
by cald;
run;


data d; * this is number of variables in %let var = above ;
	merge d_a d_b d_c d_d d_e d_f d_g;
	by cald;
	%include "C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Malawi\Observed data_Malawi.sas";
run;


/*data a.d;set d;run;*/
/*data d;set a.d;run;*/
ods html close;
ods listing;




***Graphs comparing observed data to outputs for Status quo 1 and 15;
*Taken from Zim graphs in branch Death cascade;
ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = 'C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Malawi\graphs_20260119.doc' startpage=never;


***Options 0-9 (building up package of interventions) + 99
	0 = Minimal (turning off self-testing, PrEP, SW program, VMMC, condoms (weak effect), CD4 and VL monitoring, ART support)
	1 =  + condoms
	2 =  + vmmc
	3 =  + fsw-prep-mix
	4 =  + msm-program
	5 =  + msm-prep-oral
	6 =  + adh-supp
	7 =  + fsw-program
	8 =  + agyw-prep-mix
	9 =  + msm-prep-mix
	10 = + testing
	99 = status quo
;


* Incidence 15-49;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1.5 by 0.25) valueattrs=(size=10);
label mean_incidence1549__0 = "minimal";
label mean_incidence1549__1 = " + condoms";
label mean_incidence1549__2 = " + vmmc";
label mean_incidence1549__3 = " + fsw-prep-mix";
label mean_incidence1549__4 = " + msm-program";
label mean_incidence1549__5 = " + msm-prep-oral";
label mean_incidence1549__6 = " + adh-supp";
label mean_incidence1549__7 = " + fsw-program";
label mean_incidence1549__8 = " + agyw-prep-mix";
label mean_incidence1549__9 = " + msm-prep-mix";
label mean_incidence1549__10 = " + testing";
label mean_incidence1549__99 = "status quo";
label incidence1549_obs_mlw = "Observed data";
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_incidence1549__3 	upper=p95_incidence1549__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_incidence1549__4 	upper=p95_incidence1549__4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_incidence1549__5 	upper=p95_incidence1549__5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_incidence1549__6 	upper=p95_incidence1549__6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_incidence1549__7 	upper=p95_incidence1549__7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_incidence1549__ 	upper=p95_incidence1549__8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_incidence1549__9 	upper=p95_incidence1549__9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__10/	lineattrs = (color=lightpurple thickness = 2);
/*band    x=cald lower=p5_incidence1549__10 	upper=p95_incidence1549__10  / transparency=0.9 fillattrs = (color=lightpurple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1549__99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_incidence1549__99 	upper=p95_incidence1549__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter x=cald y=incidence1549_obs_mlw / yerrorlower=incidence1549_ll_obs_mlw yerrorupper=incidence1549_ul_obs_mlw markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;

* Incidence 15-64;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-64, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1.5 by 0.25) valueattrs=(size=10);
label mean_incidence1564__0 = "minimal";
label mean_incidence1564__1 = " + condoms";
label mean_incidence1564__2 = " + vmmc";
label mean_incidence1564__3 = " + fsw-prep-mix";
label mean_incidence1564__4 = " + msm-program";
label mean_incidence1564__5 = " + msm-prep-oral";
label mean_incidence1564__6 = " + adh-supp";
label mean_incidence1564__7 = " + fsw-program";
label mean_incidence1564__8 = " + agyw-prep-mix";
label mean_incidence1564__9 = " + msm-prep-mix";
label mean_incidence1564__10 = " + testing";
label mean_incidence1564__99 = "status quo";
label incidence15pl_obs_mlw = "Observed data";
series  x=cald y=mean_incidence1564__0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_incidence1564__0 	upper=p95_incidence1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_incidence1564__1 	upper=p95_incidence1564__1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_incidence1564__2 	upper=p95_incidence1564__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_incidence1564__3 	upper=p95_incidence1564__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_incidence1564__4 	upper=p95_incidence1564__4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_incidence1564__5 	upper=p95_incidence1564__5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_incidence1564__6 	upper=p95_incidence1564__6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_incidence1564__7 	upper=p95_incidence1564__7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_incidence1564__ 	upper=p95_incidence1564__8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_incidence1564__9 	upper=p95_incidence1564__9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__10/	lineattrs = (color=lightpurple thickness = 2);
/*band    x=cald lower=p5_incidence1564__10 	upper=p95_incidence1564__10  / transparency=0.9 fillattrs = (color=lightpurple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_incidence1564__99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_incidence1564__99 	upper=p95_incidence1564__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter x=cald y=incidence15pl_obs_mlw / yerrorlower=incidence15pl_ll_obs_mlw yerrorupper=incidence15pl_ul_obs_mlw markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;

* Number of new infections;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new HIV infections (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to 2075 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2e5 by  5e4) valueattrs=(size=10);*20000000 is stoping in 2023;
label mean_n_new_inf1549__0 = "minimal";
label mean_n_new_inf1549__1 = " + condoms";
label mean_n_new_inf1549__2 = " + vmmc";
label mean_n_new_inf1549__3 = " + fsw-prep-mix";
label mean_n_new_inf1549__4 = " + fsw-program";
label mean_n_new_inf1549__5 = " + adh-supp";
label mean_n_new_inf1549__6 = " + agyw-prep-mix";
label mean_n_new_inf1549__7 = " + testing";
label mean_n_new_inf1549__8 = " + msm-program";
label mean_n_new_inf1549__9 = " + msm-prep-mix";
label mean_n_new_inf1549__99 = "status quo";
series  x=cald y=mean_n_new_inf1549__0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__0 	upper=p95_n_new_inf1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__1 	upper=p95_n_new_inf1549__1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__2 	upper=p95_n_new_inf1549__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__3 	upper=p95_n_new_inf1549__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__4 	upper=p95_n_new_inf1549__4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__5 	upper=p95_n_new_inf1549__5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__6 	upper=p95_n_new_inf1549__6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__7 	upper=p95_n_new_inf1549__7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__ 	upper=p95_n_new_inf1549__8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__9 	upper=p95_n_new_inf1549__9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_new_inf1549__99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_new_inf1549__99 	upper=p95_n_new_inf1549__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;

proc print data=d;
	var mean_n_new_inf1549__0 mean_n_new_inf1549__1 mean_n_new_inf1549__2 mean_n_new_inf1549__3 mean_n_new_inf1549__4
	mean_n_new_inf1549__5 mean_n_new_inf1549__6 mean_n_new_inf1549__7 mean_n_new_inf1549__8
	mean_n_new_inf1549__9 mean_n_new_inf1549__99
	;
	where cald=2040;
run;

data icer_sums; set d;
	if cald < 2024 then delete;
	cum_n_new_inf1549_0 + mean_n_new_inf1549__0/4;
	cum_n_new_inf1549_1 + mean_n_new_inf1549__1/4;
	cum_n_new_inf1549_2 + mean_n_new_inf1549__2/4;
	cum_n_new_inf1549_3 + mean_n_new_inf1549__3/4;
	cum_n_new_inf1549_4 + mean_n_new_inf1549__4/4;
	cum_n_new_inf1549_5 + mean_n_new_inf1549__5/4;
	cum_n_new_inf1549_6 + mean_n_new_inf1549__6/4;
	cum_n_new_inf1549_7 + mean_n_new_inf1549__7/4;
	cum_n_new_inf1549_8 + mean_n_new_inf1549__8/4;
	cum_n_new_inf1549_9 + mean_n_new_inf1549__9/4;
	cum_n_new_inf1549_99 + mean_n_new_inf1549__99/4;

	cum_n_new_inf1564_0 + mean_n_new_inf1564__0/4;
	cum_n_new_inf1564_1 + mean_n_new_inf1564__1/4;
	cum_n_new_inf1564_2 + mean_n_new_inf1564__2/4;
	cum_n_new_inf1564_3 + mean_n_new_inf1564__3/4;
	cum_n_new_inf1564_4 + mean_n_new_inf1564__4/4;
	cum_n_new_inf1564_5 + mean_n_new_inf1564__5/4;
	cum_n_new_inf1564_6 + mean_n_new_inf1564__6/4;
	cum_n_new_inf1564_7 + mean_n_new_inf1564__7/4;
	cum_n_new_inf1564_8 + mean_n_new_inf1564__8/4;
	cum_n_new_inf1564_9 + mean_n_new_inf1564__9/4;
	cum_n_new_inf1564_99 + mean_n_new_inf1564__99/4;

	cum_cost_hiv_control_0 + mean_total_cost_hiv_control_0/4;
	cum_cost_hiv_control_1 + mean_total_cost_hiv_control_1/4;
	cum_cost_hiv_control_2 + mean_total_cost_hiv_control_2/4;
	cum_cost_hiv_control_3 + mean_total_cost_hiv_control_3/4;
	cum_cost_hiv_control_4 + mean_total_cost_hiv_control_4/4;
	cum_cost_hiv_control_5 + mean_total_cost_hiv_control_5/4;
	cum_cost_hiv_control_6 + mean_total_cost_hiv_control_6/4;
	cum_cost_hiv_control_7 + mean_total_cost_hiv_control_7/4;
	cum_cost_hiv_control_8 + mean_total_cost_hiv_control_8/4;
	cum_cost_hiv_control_9 + mean_total_cost_hiv_control_9/4;
	cum_cost_hiv_control_99 + mean_total_cost_hiv_control_99/4;

	cum_n_new_inf0064_0 + mean_n_new_inf0064__0/4;
	cum_n_new_inf0064_1 + mean_n_new_inf0064__1/4;
	cum_n_new_inf0064_2 + mean_n_new_inf0064__2/4;
	cum_n_new_inf0064_3 + mean_n_new_inf0064__3/4;
	cum_n_new_inf0064_4 + mean_n_new_inf0064__4/4;
	cum_n_new_inf0064_5 + mean_n_new_inf0064__5/4;
	cum_n_new_inf0064_6 + mean_n_new_inf0064__6/4;
	cum_n_new_inf0064_7 + mean_n_new_inf0064__7/4;
	cum_n_new_inf0064_8 + mean_n_new_inf0064__8/4;
	cum_n_new_inf0064_9 + mean_n_new_inf0064__9/4;
	cum_n_new_inf0064_99 + mean_n_new_inf0064__99/4;

	cum_n_daly_0 + mean_n_daly_0/4;
	cum_n_daly_1 + mean_n_daly_1/4;
	cum_n_daly_2 + mean_n_daly_2/4;
	cum_n_daly_3 + mean_n_daly_3/4;
	cum_n_daly_4 + mean_n_daly_4/4;
	cum_n_daly_5 + mean_n_daly_5/4;
	cum_n_daly_6 + mean_n_daly_6/4;
	cum_n_daly_7 + mean_n_daly_7/4;
	cum_n_daly_8 + mean_n_daly_8/4;
	cum_n_daly_9 + mean_n_daly_9/4;
	cum_n_daly_99 + mean_n_daly_99/4;

	keep cald 
		cum_n_new_inf1549_0 	cum_n_new_inf1549_1 	cum_n_new_inf1549_2 	cum_n_new_inf1549_3 	cum_n_new_inf1549_4 
		cum_n_new_inf1549_5 	cum_n_new_inf1549_6 	cum_n_new_inf1549_7 	cum_n_new_inf1549_8 	cum_n_new_inf1549_9 	
		cum_n_new_inf1549_99

		cum_n_new_inf1564_0 	cum_n_new_inf1564_1 	cum_n_new_inf1564_2 	cum_n_new_inf1564_3 	cum_n_new_inf1564_4 
		cum_n_new_inf1564_5 	cum_n_new_inf1564_6 	cum_n_new_inf1564_7 	cum_n_new_inf1564_8 	cum_n_new_inf1564_9 	
		cum_n_new_inf1564_99

		cum_cost_hiv_control_0 	cum_cost_hiv_control_1 	cum_cost_hiv_control_2 	cum_cost_hiv_control_3 	cum_cost_hiv_control_4 
		cum_cost_hiv_control_5 	cum_cost_hiv_control_6 	cum_cost_hiv_control_7 	cum_cost_hiv_control_8 	cum_cost_hiv_control_9 	
		cum_cost_hiv_control_99

		cum_n_new_inf0064_0 	cum_n_new_inf0064_1 	cum_n_new_inf0064_2 	cum_n_new_inf0064_3 	cum_n_new_inf0064_4 
		cum_n_new_inf0064_5 	cum_n_new_inf0064_6 	cum_n_new_inf0064_7 	cum_n_new_inf0064_8 	cum_n_new_inf0064_9 	
		cum_n_new_inf0064_99

		cum_n_daly_0 	cum_n_daly_1 	cum_n_daly_2 	cum_n_daly_3 	cum_n_daly_4 
		cum_n_daly_5 	cum_n_daly_6 	cum_n_daly_7 	cum_n_daly_8 	cum_n_daly_9 	
		cum_n_daly_99
		;

	if cald ne 2073.75 then delete;

run;



data icer_sums_2049; set d;
	if cald < 2024 then delete;
	cum_n_new_inf1549_0 + mean_n_new_inf1549__0/4;
	cum_n_new_inf1549_1 + mean_n_new_inf1549__1/4;
	cum_n_new_inf1549_2 + mean_n_new_inf1549__2/4;
	cum_n_new_inf1549_3 + mean_n_new_inf1549__3/4;
	cum_n_new_inf1549_4 + mean_n_new_inf1549__4/4;
	cum_n_new_inf1549_5 + mean_n_new_inf1549__5/4;
	cum_n_new_inf1549_6 + mean_n_new_inf1549__6/4;
	cum_n_new_inf1549_7 + mean_n_new_inf1549__7/4;
	cum_n_new_inf1549_8 + mean_n_new_inf1549__8/4;
	cum_n_new_inf1549_9 + mean_n_new_inf1549__9/4;
												 
												 
												 
												 
	cum_n_new_inf1549_99 + mean_n_new_inf1549__99/4;

	cum_n_new_inf1564_0 + mean_n_new_inf1564__0/4;
	cum_n_new_inf1564_1 + mean_n_new_inf1564__1/4;
	cum_n_new_inf1564_2 + mean_n_new_inf1564__2/4;
	cum_n_new_inf1564_3 + mean_n_new_inf1564__3/4;
	cum_n_new_inf1564_4 + mean_n_new_inf1564__4/4;
	cum_n_new_inf1564_5 + mean_n_new_inf1564__5/4;
	cum_n_new_inf1564_6 + mean_n_new_inf1564__6/4;
	cum_n_new_inf1564_7 + mean_n_new_inf1564__7/4;
	cum_n_new_inf1564_8 + mean_n_new_inf1564__8/4;
	cum_n_new_inf1564_9 + mean_n_new_inf1564__9/4;
												 
												 
												 
												 
	cum_n_new_inf1564_99 + mean_n_new_inf1564__99/4;

	cum_cost_hiv_control_0 + mean_total_cost_hiv_control_0/4;
	cum_cost_hiv_control_1 + mean_total_cost_hiv_control_1/4;
	cum_cost_hiv_control_2 + mean_total_cost_hiv_control_2/4;
	cum_cost_hiv_control_3 + mean_total_cost_hiv_control_3/4;
	cum_cost_hiv_control_4 + mean_total_cost_hiv_control_4/4;
	cum_cost_hiv_control_5 + mean_total_cost_hiv_control_5/4;
	cum_cost_hiv_control_6 + mean_total_cost_hiv_control_6/4;
	cum_cost_hiv_control_7 + mean_total_cost_hiv_control_7/4;
	cum_cost_hiv_control_8 + mean_total_cost_hiv_control_8/4;
	cum_cost_hiv_control_9 + mean_total_cost_hiv_control_9/4;
															
															
															
															
	cum_cost_hiv_control_99 + mean_total_cost_hiv_control_99/4;

	cum_n_new_inf0064_0 + mean_n_new_inf0064__0/4;
	cum_n_new_inf0064_1 + mean_n_new_inf0064__1/4;
	cum_n_new_inf0064_2 + mean_n_new_inf0064__2/4;
	cum_n_new_inf0064_3 + mean_n_new_inf0064__3/4;
	cum_n_new_inf0064_4 + mean_n_new_inf0064__4/4;
	cum_n_new_inf0064_5 + mean_n_new_inf0064__5/4;
	cum_n_new_inf0064_6 + mean_n_new_inf0064__6/4;
	cum_n_new_inf0064_7 + mean_n_new_inf0064__7/4;
	cum_n_new_inf0064_8 + mean_n_new_inf0064__8/4;
	cum_n_new_inf0064_9 + mean_n_new_inf0064__9/4;
												 
												 
												 
												 
	cum_n_new_inf0064_99 + mean_n_new_inf0064__99/4;

	cum_n_daly_0 + mean_n_daly_0/4;
	cum_n_daly_1 + mean_n_daly_1/4;
	cum_n_daly_2 + mean_n_daly_2/4;
	cum_n_daly_3 + mean_n_daly_3/4;
	cum_n_daly_4 + mean_n_daly_4/4;
	cum_n_daly_5 + mean_n_daly_5/4;
	cum_n_daly_6 + mean_n_daly_6/4;
	cum_n_daly_7 + mean_n_daly_7/4;
	cum_n_daly_8 + mean_n_daly_8/4;
	cum_n_daly_9 + mean_n_daly_9/4;
								  
								  
								  
								  
	cum_n_daly_99 + mean_n_daly_99/4;

	keep cald 
		cum_n_new_inf1549_0 	cum_n_new_inf1549_1 	cum_n_new_inf1549_2 	cum_n_new_inf1549_3 	cum_n_new_inf1549_4 
		cum_n_new_inf1549_5 	cum_n_new_inf1549_6 	cum_n_new_inf1549_7 	cum_n_new_inf1549_8 	cum_n_new_inf1549_9 	
		cum_n_new_inf1549_99

		cum_n_new_inf1564_0 	cum_n_new_inf1564_1 	cum_n_new_inf1564_2 	cum_n_new_inf1564_3 	cum_n_new_inf1564_4 
		cum_n_new_inf1564_5 	cum_n_new_inf1564_6 	cum_n_new_inf1564_7 	cum_n_new_inf1564_8 	cum_n_new_inf1564_9 	
		cum_n_new_inf1564_99

		cum_cost_hiv_control_0 	cum_cost_hiv_control_1 	cum_cost_hiv_control_2 	cum_cost_hiv_control_3 	cum_cost_hiv_control_4 
		cum_cost_hiv_control_5 	cum_cost_hiv_control_6 	cum_cost_hiv_control_7 	cum_cost_hiv_control_8 	cum_cost_hiv_control_9 	
		cum_cost_hiv_control_99

		cum_n_new_inf0064_0 	cum_n_new_inf0064_1 	cum_n_new_inf0064_2 	cum_n_new_inf0064_3 	cum_n_new_inf0064_4 
		cum_n_new_inf0064_5 	cum_n_new_inf0064_6 	cum_n_new_inf0064_7 	cum_n_new_inf0064_8 	cum_n_new_inf0064_9 	
		cum_n_new_inf0064_99

		cum_n_daly_0 	cum_n_daly_1 	cum_n_daly_2 	cum_n_daly_3 	cum_n_daly_4 
		cum_n_daly_5 	cum_n_daly_6 	cum_n_daly_7 	cum_n_daly_8 	cum_n_daly_9 	
		cum_n_daly_99
		;

	if cald ne 2049.75 then delete;

run;


* p_newp;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to 2075 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 /*0.2*/ by 0.02) valueattrs=(size=10);
label mean_p_newp_ge1__0 = "minimal";
label mean_p_newp_ge1__1 = " + condoms";
label mean_p_newp_ge1__2 = " + vmmc";
label mean_p_newp_ge1__3 = " + fsw-prep-mix";
label mean_p_newp_ge1__4 = " + fsw-program";
label mean_p_newp_ge1__5 = " + adh-supp";
label mean_p_newp_ge1__6 = " + agyw-prep-mix";
label mean_p_newp_ge1__7 = " + testing";
label mean_p_newp_ge1__8 = " + msm-program";
label mean_p_newp_ge1__9 = " + msm-prep-mix";
label mean_p_newp_ge1__99 = "status quo";
series  x=cald y=mean_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__2 	upper=p95_p_newp_ge1__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__3 	upper=p95_p_newp_ge1__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__4 	upper=p95_p_newp_ge1__4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__5 	upper=p95_p_newp_ge1__5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__6 	upper=p95_p_newp_ge1__6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__7 	upper=p95_p_newp_ge1__7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__ 	upper=p95_p_newp_ge1__8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__9 	upper=p95_p_newp_ge1__9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_newp_ge1__99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_newp_ge1__99 	upper=p95_p_newp_ge1__99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;


* p_ep;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_ep_0 = "minimal";
label mean_p_ep_1 = " + condoms";
label mean_p_ep_2 = " + vmmc";
label mean_p_ep_3 = " + fsw-prep-mix";
label mean_p_ep_4 = " + fsw-program";
label mean_p_ep_5 = " + adh-supp";
label mean_p_ep_6 = " + agyw-prep-mix";
label mean_p_ep_7 = " + testing";
label mean_p_ep_8 = " + msm-program";
label mean_p_ep_9 = " + msm-prep-mix";
label mean_p_ep_99 = "status quo";
series  x=cald y=mean_p_ep_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_ep_1 	upper=p95_p_ep_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_ep_2 	upper=p95_p_ep_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_ep_3 	upper=p95_p_ep_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_ep_4 	upper=p95_p_ep_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_ep_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_ep_5 	upper=p95_p_ep_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_ep_6 	upper=p95_p_ep_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_ep_7 	upper=p95_p_ep_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_ep_ 	upper=p95_p_ep_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_ep_9 	upper=p95_p_ep_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_ep_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_ep_99 	upper=p95_p_ep_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;


* Proportion diagnosed (of all HIV+);
proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_diag_m_0 = "minimal";
label mean_p_diag_m_1 = " + condoms";
label mean_p_diag_m_2 = " + vmmc";
label mean_p_diag_m_3 = " + fsw-prep-mix";
label mean_p_diag_m_4 = " + fsw-program";
label mean_p_diag_m_5 = " + adh-supp";
label mean_p_diag_m_6 = " + agyw-prep-mix";
label mean_p_diag_m_7 = " + testing";
label mean_p_diag_m_8 = " + msm-program";
label mean_p_diag_m_9 = " + msm-prep-mix";
label mean_p_diag_m_99 = "status quo";
label p_diag_obs_m_mlw = "Observed data";
series  x=cald y=mean_p_diag_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_diag_m_2 	upper=p95_p_diag_m_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_diag_m_3 	upper=p95_p_diag_m_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_diag_m_4 	upper=p95_p_diag_m_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_diag_m_5 	upper=p95_p_diag_m_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_diag_m_6 	upper=p95_p_diag_m_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_diag_m_7 	upper=p95_p_diag_m_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_diag_m_ 	upper=p95_p_diag_m_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_diag_m_9 	upper=p95_p_diag_m_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_m_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_m_99 	upper=p95_p_diag_m_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=p_diag_obs_m_mlw /	markerattrs = (color=black);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_diag_w_0 = "minimal";
label mean_p_diag_w_1 = " + condoms";
label mean_p_diag_w_2 = " + vmmc";
label mean_p_diag_w_3 = " + fsw-prep-mix";
label mean_p_diag_w_4 = " + fsw-program";
label mean_p_diag_w_5 = " + adh-supp";
label mean_p_diag_w_6 = " + agyw-prep-mix";
label mean_p_diag_w_7 = " + testing";
label mean_p_diag_w_8 = " + msm-program";
label mean_p_diag_w_9 = " + msm-prep-mix";
label mean_p_diag_w_99 = "status quo";
label p_diag_obs_w_mlw = "Observed data";
series  x=cald y=mean_p_diag_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_diag_w_2 	upper=p95_p_diag_w_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_diag_w_3 	upper=p95_p_diag_w_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_diag_w_4 	upper=p95_p_diag_w_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_diag_w_5 	upper=p95_p_diag_w_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_diag_w_6 	upper=p95_p_diag_w_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_diag_w_7 	upper=p95_p_diag_w_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_diag_w_ 	upper=p95_p_diag_w_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_diag_w_9 	upper=p95_p_diag_w_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_w_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_w_99 	upper=p95_p_diag_w_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=p_diag_obs_w_mlw /	markerattrs = (color=black);
run;quit;



* Proportion on ART (of all HIV+);
proc sgplot data=d; 
Title    height=1.5 justify=center "p_art_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_art_m_0 = "minimal";
label mean_p_art_m_1 = " + condoms";
label mean_p_art_m_2 = " + vmmc";
label mean_p_art_m_3 = " + fsw-prep-mix";
label mean_p_art_m_4 = " + fsw-program";
label mean_p_art_m_5 = " + adh-supp";
label mean_p_art_m_6 = " + agyw-prep-mix";
label mean_p_art_m_7 = " + testing";
label mean_p_art_m_8 = " + msm-program";
label mean_p_art_m_9 = " + msm-prep-mix";
label mean_p_art_m_99 = "status quo";
series  x=cald y=mean_p_art_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_m_0 	upper=p95_p_art_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_art_m_1 	upper=p95_p_art_m_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_art_m_2 	upper=p95_p_art_m_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_art_m_3 	upper=p95_p_art_m_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_art_m_4 	upper=p95_p_art_m_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_art_m_5 	upper=p95_p_art_m_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_art_m_6 	upper=p95_p_art_m_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_art_m_7 	upper=p95_p_art_m_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_art_m_ 	upper=p95_p_art_m_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_art_m_9 	upper=p95_p_art_m_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_m_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_m_99 	upper=p95_p_art_m_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_art_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_art_w_0 = "minimal";
label mean_p_art_w_1 = " + condoms";
label mean_p_art_w_2 = " + vmmc";
label mean_p_art_w_3 = " + fsw-prep-mix";
label mean_p_art_w_4 = " + fsw-program";
label mean_p_art_w_5 = " + adh-supp";
label mean_p_art_w_6 = " + agyw-prep-mix";
label mean_p_art_w_7 = " + testing";
label mean_p_art_w_8 = " + msm-program";
label mean_p_art_w_9 = " + msm-prep-mix";
label mean_p_art_w_99 = "status quo";
series  x=cald y=mean_p_art_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_w_0 	upper=p95_p_art_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_art_w_1 	upper=p95_p_art_w_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_art_w_2 	upper=p95_p_art_w_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_art_w_3 	upper=p95_p_art_w_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_art_w_4 	upper=p95_p_art_w_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_art_w_5 	upper=p95_p_art_w_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_art_w_6 	upper=p95_p_art_w_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_art_w_7 	upper=p95_p_art_w_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_art_w_ 	upper=p95_p_art_w_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_art_w_9 	upper=p95_p_art_w_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_w_10/	lineattrs = (color=lightpurple thickness = 2);
/*band    x=cald lower=p5_p_art_w_99 	upper=p95_p_art_w_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;


* Proportion on ART (of diagnosed HIV+);
proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_art_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_diag_art_m_0 = "minimal";
label mean_p_diag_art_m_1 = " + condoms";
label mean_p_diag_art_m_2 = " + vmmc";
label mean_p_diag_art_m_3 = " + fsw-prep-mix";
label mean_p_diag_art_m_4 = " + fsw-program";
label mean_p_diag_art_m_5 = " + adh-supp";
label mean_p_diag_art_m_6 = " + agyw-prep-mix";
label mean_p_diag_art_m_7 = " + testing";
label mean_p_diag_art_m_8 = " + msm-program";
label mean_p_diag_art_m_9 = " + msm-prep-mix";
label mean_p_diag_art_m_99 = "status quo";
label p_diag_onart_obs_m_mlw = "Observed data";
series  x=cald y=mean_p_diag_art_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_0 	upper=p95_p_diag_art_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_1 	upper=p95_p_diag_art_m_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_2 	upper=p95_p_diag_art_m_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_3 	upper=p95_p_diag_art_m_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_4 	upper=p95_p_diag_art_m_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_5 	upper=p95_p_diag_art_m_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_6 	upper=p95_p_diag_art_m_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_7 	upper=p95_p_diag_art_m_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_ 	upper=p95_p_diag_art_m_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_9 	upper=p95_p_diag_art_m_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_m_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_art_m_99 	upper=p95_p_diag_art_m_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=p_diag_onart_obs_m_mlw /	markerattrs = (color=black);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_art_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_diag_art_w_0 = "minimal";
label mean_p_diag_art_w_1 = " + condoms";
label mean_p_diag_art_w_2 = " + vmmc";
label mean_p_diag_art_w_3 = " + fsw-prep-mix";
label mean_p_diag_art_w_4 = " + fsw-program";
label mean_p_diag_art_w_5 = " + adh-supp";
label mean_p_diag_art_w_6 = " + agyw-prep-mix";
label mean_p_diag_art_w_7 = " + testing";
label mean_p_diag_art_w_8 = " + msm-program";
label mean_p_diag_art_w_9 = " + msm-prep-mix";
label mean_p_diag_art_w_99 = "status quo";
label p_diag_onart_obs_w_mlw = "Observed data";
series  x=cald y=mean_p_diag_art_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_0 	upper=p95_p_diag_art_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_1 	upper=p95_p_diag_art_w_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_2 	upper=p95_p_diag_art_w_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_3 	upper=p95_p_diag_art_w_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_4 	upper=p95_p_diag_art_w_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_5 	upper=p95_p_diag_art_w_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_6 	upper=p95_p_diag_art_w_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_7 	upper=p95_p_diag_art_w_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_ 	upper=p95_p_diag_art_w_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_9 	upper=p95_p_diag_art_w_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_diag_art_w_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_diag_art_w_99 	upper=p95_p_diag_art_w_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=p_diag_onart_obs_w_mlw /	markerattrs = (color=black);
run;quit;


* Proportion virally suppressed;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_art_vls_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_art_vls_m_0 = "minimal";
label mean_p_art_vls_m_1 = " + condoms";
label mean_p_art_vls_m_2 = " + vmmc";
label mean_p_art_vls_m_3 = " + fsw-prep-mix";
label mean_p_art_vls_m_4 = " + fsw-program";
label mean_p_art_vls_m_5 = " + adh-supp";
label mean_p_art_vls_m_6 = " + agyw-prep-mix";
label mean_p_art_vls_m_7 = " + testing";
label mean_p_art_vls_m_8 = " + msm-program";
label mean_p_art_vls_m_9 = " + msm-prep-mix";
label mean_p_art_vls_m_99 = "status quo";
label p_onart_vl1000_obs_m_mlw = "Observed data";
series  x=cald y=mean_p_art_vls_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_0 	upper=p95_p_art_vls_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_1 	upper=p95_p_art_vls_m_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_2 	upper=p95_p_art_vls_m_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_3 	upper=p95_p_art_vls_m_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_4 	upper=p95_p_art_vls_m_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_5 	upper=p95_p_art_vls_m_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_6 	upper=p95_p_art_vls_m_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_7 	upper=p95_p_art_vls_m_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_ 	upper=p95_p_art_vls_m_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_9 	upper=p95_p_art_vls_m_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_m_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_vls_m_99 	upper=p95_p_art_vls_m_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=p_onart_vl1000_obs_m_mlw /	markerattrs = (color=black);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_art_vls_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_art_vls_w_0 = "minimal";
label mean_p_art_vls_w_1 = " + condoms";
label mean_p_art_vls_w_2 = " + vmmc";
label mean_p_art_vls_w_3 = " + fsw-prep-mix";
label mean_p_art_vls_w_4 = " + fsw-program";
label mean_p_art_vls_w_5 = " + adh-supp";
label mean_p_art_vls_w_6 = " + agyw-prep-mix";
label mean_p_art_vls_w_7 = " + testing";
label mean_p_art_vls_w_8 = " + msm-program";
label mean_p_art_vls_w_9 = " + msm-prep-mix";
label mean_p_art_vls_w_99 = "status quo";
label p_onart_vl1000_obs_w_mlw = "Observed data";
series  x=cald y=mean_p_art_vls_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_0 	upper=p95_p_art_vls_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_1 	upper=p95_p_art_vls_w_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_2 	upper=p95_p_art_vls_w_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_3 	upper=p95_p_art_vls_w_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_4 	upper=p95_p_art_vls_w_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_5 	upper=p95_p_art_vls_w_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_6 	upper=p95_p_art_vls_w_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_7 	upper=p95_p_art_vls_w_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_ 	upper=p95_p_art_vls_w_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_9 	upper=p95_p_art_vls_w_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_art_vls_w_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_art_vls_w_99 	upper=p95_p_art_vls_w_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=p_onart_vl1000_obs_w_mlw /	markerattrs = (color=black);
run;quit;


* Proportion circumcised (15-49);
proc sgplot data=d; 
Title    height=1.5 justify=center "p_mcirc_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_mcirc_1549m_0 = "minimal";
label mean_p_mcirc_1549m_1 = " + condoms";
label mean_p_mcirc_1549m_2 = " + vmmc";
label mean_p_mcirc_1549m_3 = " + fsw-prep-mix";
label mean_p_mcirc_1549m_4 = " + fsw-program";
label mean_p_mcirc_1549m_5 = " + adh-supp";
label mean_p_mcirc_1549m_6 = " + agyw-prep-mix";
label mean_p_mcirc_1549m_7 = " + testing";
label mean_p_mcirc_1549m_8 = " + msm-program";
label mean_p_mcirc_1549m_9 = " + msm-prep-mix";
label mean_p_mcirc_1549m_99 = "status quo";
label p_mcirc_15plm_obs_mlw = "Observed data";
series  x=cald y=mean_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_2 	upper=p95_p_mcirc_1549m_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_3 	upper=p95_p_mcirc_1549m_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_4 	upper=p95_p_mcirc_1549m_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_5 	upper=p95_p_mcirc_1549m_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_6 	upper=p95_p_mcirc_1549m_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_7 	upper=p95_p_mcirc_1549m_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_ 	upper=p95_p_mcirc_1549m_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_9 	upper=p95_p_mcirc_1549m_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1549m_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1549m_99 	upper=p95_p_mcirc_1549m_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=p_mcirc_15plm_obs_mlw /	markerattrs = (color=black);
run;quit;

* Proportion circumcised (15-24);
proc sgplot data=d; 
Title    height=1.5 justify=center "p_mcirc_1524m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_mcirc_1524m_0 = "minimal";
label mean_p_mcirc_1524m_1 = " + condoms";
label mean_p_mcirc_1524m_2 = " + vmmc";
label mean_p_mcirc_1524m_3 = " + fsw-prep-mix";
label mean_p_mcirc_1524m_4 = " + fsw-program";
label mean_p_mcirc_1524m_5 = " + adh-supp";
label mean_p_mcirc_1524m_6 = " + agyw-prep-mix";
label mean_p_mcirc_1524m_7 = " + testing";
label mean_p_mcirc_1524m_8 = " + msm-program";
label mean_p_mcirc_1524m_9 = " + msm-prep-mix";
label mean_p_mcirc_1524m_99 = "status quo";
label p_mcirc_1524m_obs_mlw = "Observed data";
series  x=cald y=mean_p_mcirc_1524m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_0 	upper=p95_p_mcirc_1524m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_1 	upper=p95_p_mcirc_1524m_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_2 	upper=p95_p_mcirc_1524m_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_3 	upper=p95_p_mcirc_1524m_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_4 	upper=p95_p_mcirc_1524m_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_5 	upper=p95_p_mcirc_1524m_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_6 	upper=p95_p_mcirc_1524m_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_7 	upper=p95_p_mcirc_1524m_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_ 	upper=p95_p_mcirc_1524m_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_9 	upper=p95_p_mcirc_1524m_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_p_mcirc_1524m_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_p_mcirc_1524m_99 	upper=p95_p_mcirc_1524m_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=p_mcirc_1524m_obs_mlw /	markerattrs = (color=black);
run;quit;

* Number on PrEP;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_onprep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1e6 by 1e5) valueattrs=(size=10);
label mean_n_onprep_0 = "minimal";
label mean_n_onprep_1 = " + condoms";
label mean_n_onprep_2 = " + vmmc";
label mean_n_onprep_3 = " + fsw-prep-mix";
label mean_n_onprep_4 = " + fsw-program";
label mean_n_onprep_5 = " + adh-supp";
label mean_n_onprep_6 = " + agyw-prep-mix";
label mean_n_onprep_7 = " + testing";
label mean_n_onprep_8 = " + msm-program";
label mean_n_onprep_9 = " + msm-prep-mix";
label mean_n_onprep_99 = "status quo";
label n_prep_obs_mlw = "Observed data";
series  x=cald y=mean_n_onprep_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_onprep_0 	upper=p95_n_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_n_onprep_1 	upper=p95_n_onprep_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_n_onprep_2 	upper=p95_n_onprep_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_n_onprep_3 	upper=p95_n_onprep_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_n_onprep_4 	upper=p95_n_onprep_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_n_onprep_5 	upper=p95_n_onprep_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_n_onprep_6 	upper=p95_n_onprep_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_n_onprep_7 	upper=p95_n_onprep_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_n_onprep_ 	upper=p95_n_onprep_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_n_onprep_9 	upper=p95_n_onprep_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_onprep_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_onprep_99 	upper=p95_n_onprep_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=n_prep_obs_mlw /	markerattrs = (color=black);
run;quit;

proc print data=d;
	var mean_n_onprep_0 mean_n_onprep_1 mean_n_onprep_2 mean_n_onprep_3 mean_n_onprep_4 mean_n_onprep_5 mean_n_onprep_6 mean_n_onprep_99
	;
	where cald=2070;
run;

/*
n_onprep			n_onprep_oral		n_onprep_len
*/

proc print data=d;
	var 
	mean_n_sw_1564__1	mean_n_undiag_sw_1	mean_n_elig_prep_1  mean_n_elig_prep_any_sw_1	mean_n_onprep_sw_1		mean_n_onprep_w_1
	mean_n_sw_1564__2	mean_n_undiag_sw_2	mean_n_elig_prep_2	mean_n_elig_prep_any_sw_2	mean_n_onprep_sw_2		mean_n_onprep_w_2	mean_n_onprep_oral_sw_2		mean_n_onprep_len_sw_2

	mean_n_agyw_pg_3	mean_n_elig_prep_3  mean_n_onprep_agyw_pg_3	mean_n_onprep_w_3
	mean_n_agyw_pg_4	mean_n_elig_prep_4	mean_n_onprep_agyw_pg_4	mean_n_onprep_w_4	mean_n_onprep_oral_agyw_pg_4	mean_n_onprep_len_agyw_pg_4

	mean_n_alive_msm_5	mean_n_elig_prep_5  mean_n_onprep_msm_5		mean_n_onprep_m_5
	mean_n_alive_msm_6	mean_n_elig_prep_6	mean_n_onprep_msm_6		mean_n_onprep_m_6	mean_n_onprep_oral_msm_6	mean_n_onprep_len_msm_6

	mean_pc_elig_onprep_1	mean_pc_elig_onprep_2	mean_pc_elig_onprep_3	mean_pc_elig_onprep_4	mean_pc_elig_onprep_5	mean_pc_elig_onprep_6	
	;
	where cald=2030;
run;


proc print data=d;
	var 
	mean_n_sw_1564__1	mean_n_undiag_sw_1	mean_n_elig_prep_1  mean_n_elig_prep_any_sw_1	mean_n_onprep_sw_1		mean_n_onprep_w_1
	;
	where cald=2030;
run;



%let &year_interv=2024;
/*%put &year_interv;*/

data prep_sums; set d;
	if cald < 2024 then delete;
	cum_onprep_any_0 + mean_n_onprep_0;
	cum_onprep_any_2 + mean_n_onprep_2;
	cum_onprep_any_4 + mean_n_onprep_4;
	cum_onprep_any_6 + mean_n_onprep_6;
	cum_onprep_any_9 + mean_n_onprep_9;
	cum_onprep_any_99 + mean_n_onprep_99;
	cum_onprep_oral_0 + mean_n_onprep_oral_0;
	cum_onprep_oral_2 + mean_n_onprep_oral_2;
	cum_onprep_oral_4 + mean_n_onprep_oral_4;
	cum_onprep_oral_6 + mean_n_onprep_oral_6;
	cum_onprep_oral_9 + mean_n_onprep_oral_9;
	cum_onprep_oral_99 + mean_n_onprep_oral_99;
	cum_onprep_len_0 + mean_n_onprep_len_0;
	cum_onprep_len_2 + mean_n_onprep_len_2;
	cum_onprep_len_4 + mean_n_onprep_len_4;
	cum_onprep_len_6 + mean_n_onprep_len_6;
	cum_onprep_len_9 + mean_n_onprep_len_9;
	cum_onprep_len_99 + mean_n_onprep_len_99;
	ratio_oral_len_2 = cum_onprep_oral_2 / cum_onprep_len_2;	* should be 3/7 = 0.43;
	ratio_oral_len_4 = cum_onprep_oral_4 / cum_onprep_len_4;	* should be 3/7 = 0.43;
	ratio_oral_len_6 = cum_onprep_oral_6 / cum_onprep_len_6;	* should be 3/7 = 0.43;

	keep cald 
		cum_onprep_any_0 cum_onprep_any_1 cum_onprep_any_2 cum_onprep_any_3 cum_onprep_any_4 cum_onprep_any_5 cum_onprep_any_6 
		cum_onprep_any_7 cum_onprep_any_8 cum_onprep_any_9 cum_onprep_any_10 cum_onprep_any_11 cum_onprep_any_12 cum_onprep_any_99
		cum_onprep_oral_0 cum_onprep_oral_1 cum_onprep_oral_2 cum_onprep_oral_3 cum_onprep_oral_4 cum_onprep_oral_5 cum_onprep_oral_6 
		cum_onprep_oral_7 cum_onprep_oral_8 cum_onprep_oral_9 cum_onprep_oral_10 cum_onprep_oral_11 cum_onprep_oral_12 cum_onprep_oral_99
		cum_onprep_len_0 cum_onprep_len_1 cum_onprep_len_2 cum_onprep_len_3 cum_onprep_len_4 cum_onprep_len_5 cum_onprep_len_6 
		cum_onprep_len_7 cum_onprep_len_8 cum_onprep_len_9 cum_onprep_len_10 cum_onprep_len_11 cum_onprep_len_12 cum_onprep_len_99
		ratio_oral_len_2 ratio_oral_len_4 ratio_oral_len_6
		;
	if cald ne 2073.75 then delete;

run;

proc print data=prep_sums;
	var ratio_oral_len_2 ratio_oral_len_4 ratio_oral_len_6;		* should be 3/7 = 0.43;
run;
** Too much len, not enough oral PrEP;

* SW program;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_sw_program_visit";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e5 by 5e4) valueattrs=(size=10);
label mean_n_sw_program_visit_0 = "minimal";
label mean_n_sw_program_visit_1 = " + condoms";
label mean_n_sw_program_visit_2 = " + vmmc";
label mean_n_sw_program_visit_3 = " + fsw-prep-mix";
label mean_n_sw_program_visit_4 = " + fsw-program";
label mean_n_sw_program_visit_5 = " + adh-supp";
label mean_n_sw_program_visit_6 = " + agyw-prep-mix";
label mean_n_sw_program_visit_7 = " + testing";
label mean_n_sw_program_visit_8 = " + msm-program";
label mean_n_sw_program_visit_9 = " + msm-prep-mix";
label mean_n_sw_program_visit_99 = "status quo";
series  x=cald y=mean_n_sw_program_visit_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_0 	upper=p95_n_sw_program_visit_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_1 	upper=p95_n_sw_program_visit_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_2 	upper=p95_n_sw_program_visit_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_3 	upper=p95_n_sw_program_visit_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_4 	upper=p95_n_sw_program_visit_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_5 	upper=p95_n_sw_program_visit_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_6 	upper=p95_n_sw_program_visit_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_7 	upper=p95_n_sw_program_visit_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_ 	upper=p95_n_sw_program_visit_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_9 	upper=p95_n_sw_program_visit_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_sw_program_visit_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_sw_program_visit_99 	upper=p95_n_sw_program_visit_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;


* Self tests;
* nb same trajecory for men and women;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_self_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1e7 by 1e6) valueattrs=(size=10);
label mean_n_self_tested_0 = "minimal";
label mean_n_self_tested_1 = " + condoms";
label mean_n_self_tested_2 = " + vmmc";
label mean_n_self_tested_3 = " + fsw-prep-mix";
label mean_n_self_tested_4 = " + fsw-program";
label mean_n_self_tested_5 = " + adh-supp";
label mean_n_self_tested_6 = " + agyw-prep-mix";
label mean_n_self_tested_7 = " + testing";
label mean_n_self_tested_8 = " + msm-program";
label mean_n_self_tested_9 = " + msm-prep-mix";
label mean_n_self_tested_99 = "status quo";
label n_self_tested_obs_mlw = "Observed data";
series  x=cald y=mean_n_self_tested_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_self_tested_0 	upper=p95_n_self_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_n_self_tested_1 	upper=p95_n_self_tested_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_n_self_tested_2 	upper=p95_n_self_tested_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_n_self_tested_3 	upper=p95_n_self_tested_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_n_self_tested_4 	upper=p95_n_self_tested_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_n_self_tested_5 	upper=p95_n_self_tested_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_n_self_tested_6 	upper=p95_n_self_tested_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_n_self_tested_7 	upper=p95_n_self_tested_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_n_self_tested_ 	upper=p95_n_self_tested_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_n_self_tested_9 	upper=p95_n_self_tested_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_self_tested_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_self_tested_99 	upper=p95_n_self_tested_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
scatter  x=cald y=n_self_tested_obs_mlw /	markerattrs = (color=black);
run;quit;


* All testing;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1e7 by 1e6) valueattrs=(size=10);
label mean_n_tested_m_0 = "minimal";
label mean_n_tested_m_1 = " + condoms";
label mean_n_tested_m_2 = " + vmmc";
label mean_n_tested_m_3 = " + fsw-prep-mix";
label mean_n_tested_m_4 = " + fsw-program";
label mean_n_tested_m_5 = " + adh-supp";
label mean_n_tested_m_6 = " + agyw-prep-mix";
label mean_n_tested_m_7 = " + testing";
label mean_n_tested_m_8 = " + msm-program";
label mean_n_tested_m_9 = " + msm-prep-mix";
label mean_n_tested_m_99 = "status quo";
series  x=cald y=mean_n_tested_m_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_tested_m_0 	upper=p95_n_tested_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_n_tested_m_1 	upper=p95_n_tested_m_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_n_tested_m_2 	upper=p95_n_tested_m_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_n_tested_m_3 	upper=p95_n_tested_m_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_n_tested_m_4 	upper=p95_n_tested_m_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_n_tested_m_5 	upper=p95_n_tested_m_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_n_tested_m_6 	upper=p95_n_tested_m_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_n_tested_m_7 	upper=p95_n_tested_m_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_n_tested_m_ 	upper=p95_n_tested_m_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_n_tested_m_9 	upper=p95_n_tested_m_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_m_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_tested_m_99 	upper=p95_n_tested_m_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1e7 by 1e6) valueattrs=(size=10);
label mean_n_tested_w_0 = "minimal";
label mean_n_tested_w_1 = " + condoms";
label mean_n_tested_w_2 = " + vmmc";
label mean_n_tested_w_3 = " + fsw-prep-mix";
label mean_n_tested_w_4 = " + fsw-program";
label mean_n_tested_w_5 = " + adh-supp";
label mean_n_tested_w_6 = " + agyw-prep-mix";
label mean_n_tested_w_7 = " + testing";
label mean_n_tested_w_8 = " + msm-program";
label mean_n_tested_w_9 = " + msm-prep-mix";
label mean_n_tested_w_99 = "status quo";series  x=cald y=mean_n_tested_w_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_tested_w_0 	upper=p95_n_tested_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_n_tested_w_1 	upper=p95_n_tested_w_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_n_tested_w_2 	upper=p95_n_tested_w_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_n_tested_w_3 	upper=p95_n_tested_w_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_n_tested_w_4 	upper=p95_n_tested_w_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_n_tested_w_5 	upper=p95_n_tested_w_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_n_tested_w_6 	upper=p95_n_tested_w_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_n_tested_w_7 	upper=p95_n_tested_w_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_n_tested_w_ 	upper=p95_n_tested_w_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_n_tested_w_9 	upper=p95_n_tested_w_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_n_tested_w_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_n_tested_w_99 	upper=p95_n_tested_w_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;


* Cost;
proc sgplot data=d; 
Title    height=1.5 justify=center "total_cost_hiv_control";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1e9 by 1e8) valueattrs=(size=10);
label mean_total_cost_hiv_control_0 = "minimal";
label mean_total_cost_hiv_control_1 = " + condoms";
label mean_total_cost_hiv_control_2 = " + vmmc";
label mean_total_cost_hiv_control_3 = " + fsw-prep-mix";
label mean_total_cost_hiv_control_4 = " + fsw-program";
label mean_total_cost_hiv_control_5 = " + adh-supp";
label mean_total_cost_hiv_control_6 = " + agyw-prep-mix";
label mean_total_cost_hiv_control_7 = " + testing";
label mean_total_cost_hiv_control_8 = " + msm-program";
label mean_total_cost_hiv_control_9 = " + msm-prep-mix";
label mean_total_cost_hiv_control_99 = "status quo";
series  x=cald y=mean_total_cost_hiv_control_0/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_0 	upper=p95_total_cost_hiv_control_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_1/	lineattrs = (color=darkred thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_1 	upper=p95_total_cost_hiv_control_1  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_2/	lineattrs = (color=red thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_2 	upper=p95_total_cost_hiv_control_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_3/	lineattrs = (color=orange thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_3 	upper=p95_total_cost_hiv_control_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_4/	lineattrs = (color=yellow thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_4 	upper=p95_total_cost_hiv_control_4  / transparency=0.9 fillattrs = (color=yellow) legendlabkel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_5/	lineattrs = (color=lightgreen thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_5 	upper=p95_total_cost_hiv_control_5  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_6/	lineattrs = (color=green thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_6 	upper=p95_total_cost_hiv_control_6  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_7/	lineattrs = (color=lightblue thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_7 	upper=p95_total_cost_hiv_control_7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_8/	lineattrs = (color=blue thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_ 	upper=p95_total_cost_hiv_control_8  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_9/	lineattrs = (color=purple thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_9 	upper=p95_total_cost_hiv_control_9  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
series  x=cald y=mean_total_cost_hiv_control_99/	lineattrs = (color=black thickness = 2);
/*band    x=cald lower=p5_total_cost_hiv_control_99 	upper=p95_total_cost_hiv_control_99  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
run;quit;


ods html close;

ods rtf close;run;



* export icer_sums;
proc export data=icer_sums
	outfile= "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_malawi\mlw_control_20260119_out\icer_sums.csv" 
	dbms=csv replace; 
	putnames=yes;
run;

* export icer_sums_2049;
proc export data=icer_sums_2049
	outfile= "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_malawi\mlw_control_20260119_out\icer_sums_2049.csv" 
	dbms=csv replace; 
	putnames=yes;
run;
