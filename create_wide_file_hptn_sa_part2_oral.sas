

* options user="/folders/myfolders/";

 proc printto  ; * log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";


libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";

data w_hptn20; set a.w_hptn20 ;

* for sa;
n_onart_21 = art_w_21 + art_m_21;
if 0.122 <= prevalence1549_05 < 0.202  and  0.166 < prevalence1549_17 < 0.246  and 4000000 <= n_onart_21 < 6400000;

p_oral_prep_10yr = (oral_prep_w_33_2 + oral_prep_m_33_2) / (pop_size_w_33_2 + pop_size_m_33_2 - hiv_w_33_2 - hiv_m_33_2) ;
p_oral_prep_w_10yr = oral_prep_w_33_2 / (pop_size_w_33_2  - hiv_w_33_2 ) ;

prep_elig_criteria = prep_any_strategy; 

if prep_elig_criteria in (4 5 8 9 12) then women_only = 0;
if prep_elig_criteria in (6 7 10 11 13) then women_only = 1;


* need a line like this below to generate each excel sheet - give names to file like ..._prev5_oral_w_10yr_1 ; 
* need to make sure outcomes for oral prep are using _2 and outcomes for la prep are using _3;
* need to change code below as previously there was only option 1 and 2 ;
if  0.04 <= p_oral_prep_10yr < 0.06 and women_only = 0 and prep_from_2042 =  2 and prep_scale_up =  10  ;


proc print; run;


proc univariate data=w_hptn20 ;  
var &sf
n_alive_w_21 n_alive_m_21  n_alive_21
prevalence1549m_21   prevalence1549w_21   prevalence1549_21   
incidence1549m_21   incidence1549w_21   incidence1549_21   
p_onart_m_21      p_onart_w_21      p_onart_21   
p_vl1000_m_21      p_vl1000_w_21      p_vl1000_21   
prop_prep_oral_w_21  prop_prep_oral_m_21 prop_prep_oral_21
n_onart_21 art_w_21 art_m_21
;
run;


data bl; set w_hptn20;

n_alive_w_21 = round(n_alive_w_21,1000);  n_alive_m_21 = round(n_alive_m_21,1000);  n_alive_21 = round(n_alive_21,1000);  
prevalence1549m_21 = round(prevalence1549m_21, 0.001); prevalence1549w_21 = round(prevalence1549w_21, 0.001); 
prevalence1549_21 = round(prevalence1549_21, 0.001); 
incidence1549m_21 = round(incidence1549m_21, 0.001); incidence1549w_21 = round(incidence1549w_21, 0.001); 
incidence1549_21 = round(incidence1549_21, 0.001); 
p_onart_m_21 = round(p_onart_m_21, 0.01); p_onart_w_21 = round(p_onart_w_21, 0.01); 
p_onart_21 = round(p_onart_21, 0.01); 
p_vl1000_m_21 = round(p_vl1000_m_21, 0.01); p_vl1000_w_21 = round(p_vl1000_w_21, 0.01); 
p_vl1000_21 = round(p_vl1000_21, 0.01); 
prop_prep_oral_w_21 = round(prop_prep_oral_w_21, 0.0001); prop_prep_oral_m_21 = round(prop_prep_oral_m_21, 0.0001); 
prop_prep_oral_21 = round(prop_prep_oral_21, 0.0001); 

keep n_alive_w_21 n_alive_m_21  n_alive_21
prevalence1549m_21   prevalence1549w_21   prevalence1549_21   
incidence1549m_21   incidence1549w_21   incidence1549_21   
p_onart_m_21      p_onart_w_21      p_onart_21   
p_vl1000_m_21      p_vl1000_w_21      p_vl1000_21   
prop_prep_oral_w_21  prop_prep_oral_m_21 prop_prep_oral_21;

* table 1;

proc univariate data=w_hptn20 ;  
var
n_alive_w_21 n_alive_m_21  n_alive_21
prevalence1549m_21   prevalence1549w_21   prevalence1549_21   
incidence1549m_21   incidence1549w_21   incidence1549_21   
p_onart_m_21      p_onart_w_21      p_onart_21   
p_vl1000_m_21      p_vl1000_w_21      p_vl1000_21   
prop_prep_oral_w_21  prop_prep_oral_m_21 prop_prep_oral_21;
run;

proc export 
data=bl      dbms=csv  
outfile="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\sc_hptn20_bl_prev5_oral_w_10yr_2" replace; 
run;




data base; set w_hptn20;

file "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\hptn20_base_prev5_oral_w_10yr_2";

put run  prep_elig_criteria  sim_year_22_1
pop_size_w_22_1 pop_size_m_22_1  hiv_w_22_1  hiv_m_22_1 diag_w_22_1 diag_m_22_1 art_w_22_1 art_m_22_1 vs_w_22_1 vs_m_22_1 inf_w_22_1 inf_m_22_1 inf_oral_22_1 
inf_la_22_1 deaths_w_22_1 deaths_m_22_1 elig_prep_w_22_1  elig_prep_m_22_1 oral_prep_w_22_1 oral_prep_m_22_1 la_prep_w_22_1  la_prep_m_22_1 cd4_500pl_22_1
cd4_350_500_22_1 cd4_200_350_22_1 cd4_200_22_1 deaths_1_22_1 deaths_2_22_1 deaths_3_22_1 deaths_4_22_1 deaths_5_22_1 ;

put run  prep_elig_criteria  sim_year_23_1
pop_size_w_23_1 pop_size_m_23_1  hiv_w_23_1  hiv_m_23_1 diag_w_23_1 diag_m_23_1 art_w_23_1 art_m_23_1 vs_w_23_1 vs_m_23_1 inf_w_23_1 inf_m_23_1 inf_oral_23_1 
inf_la_32_1 deaths_w_23_1 deaths_m_23_1 elig_prep_w_23_1  elig_prep_m_23_1 oral_prep_w_23_1 oral_prep_m_23_1 la_prep_w_23_1  la_prep_m_23_1 cd4_500pl_23_1
cd4_350_500_23_1 cd4_200_350_23_1 cd4_200_23_1 deaths_1_23_1 deaths_2_23_1 deaths_3_23_1 deaths_4_23_1 deaths_5_23_1 ;

put run  prep_elig_criteria  sim_year_24_1
pop_size_w_24_1 pop_size_m_24_1  hiv_w_24_1  hiv_m_24_1 diag_w_24_1 diag_m_24_1 art_w_24_1 art_m_24_1 vs_w_24_1 vs_m_24_1 inf_w_24_1 inf_m_24_1 inf_oral_24_1 
inf_la_24_1 deaths_w_24_1 deaths_m_24_1 elig_prep_w_24_1  elig_prep_m_24_1 oral_prep_w_24_1 oral_prep_m_24_1 la_prep_w_24_1  la_prep_m_24_1 cd4_500pl_24_1
cd4_350_500_24_1 cd4_200_350_24_1 cd4_200_24_1 deaths_1_24_1 deaths_2_24_1 deaths_3_24_1 deaths_4_24_1 deaths_5_24_1 ;

put run  prep_elig_criteria  sim_year_25_1
pop_size_w_25_1 pop_size_m_25_1  hiv_w_25_1  hiv_m_25_1 diag_w_25_1 diag_m_25_1 art_w_25_1 art_m_25_1 vs_w_25_1 vs_m_25_1 inf_w_25_1 inf_m_25_1 inf_oral_25_1 
inf_la_25_1 deaths_w_25_1 deaths_m_25_1 elig_prep_w_25_1  elig_prep_m_25_1 oral_prep_w_25_1 oral_prep_m_25_1 la_prep_w_25_1  la_prep_m_25_1 cd4_500pl_25_1
cd4_350_500_25_1 cd4_200_350_25_1 cd4_200_25_1 deaths_1_25_1 deaths_2_25_1 deaths_3_25_1 deaths_4_25_1 deaths_5_25_1 ;

put run  prep_elig_criteria  sim_year_26_1
pop_size_w_26_1 pop_size_m_26_1  hiv_w_26_1  hiv_m_26_1 diag_w_26_1 diag_m_26_1 art_w_26_1 art_m_26_1 vs_w_26_1 vs_m_26_1 inf_w_26_1 inf_m_26_1 inf_oral_26_1 
inf_la_26_1 deaths_w_26_1 deaths_m_26_1 elig_prep_w_26_1  elig_prep_m_26_1 oral_prep_w_26_1 oral_prep_m_26_1 la_prep_w_26_1  la_prep_m_26_1 cd4_500pl_26_1
cd4_350_500_26_1 cd4_200_350_26_1 cd4_200_26_1 deaths_1_26_1 deaths_2_26_1 deaths_3_26_1 deaths_4_26_1 deaths_5_26_1 ;

put run  prep_elig_criteria  sim_year_27_1
pop_size_w_27_1 pop_size_m_27_1  hiv_w_27_1  hiv_m_27_1 diag_w_27_1 diag_m_27_1 art_w_27_1 art_m_27_1 vs_w_27_1 vs_m_27_1 inf_w_27_1 inf_m_27_1 inf_oral_27_1 
inf_la_27_1 deaths_w_27_1 deaths_m_27_1 elig_prep_w_27_1  elig_prep_m_27_1 oral_prep_w_27_1 oral_prep_m_27_1 la_prep_w_27_1  la_prep_m_27_1 cd4_500pl_27_1
cd4_350_500_27_1 cd4_200_350_27_1 cd4_200_27_1 deaths_1_27_1 deaths_2_27_1 deaths_3_27_1 deaths_4_27_1 deaths_5_27_1 ;

put run  prep_elig_criteria  sim_year_28_1
pop_size_w_28_1 pop_size_m_28_1  hiv_w_28_1  hiv_m_28_1 diag_w_28_1 diag_m_28_1 art_w_28_1 art_m_28_1 vs_w_28_1 vs_m_28_1 inf_w_28_1 inf_m_28_1 inf_oral_28_1 
inf_la_28_1 deaths_w_28_1 deaths_m_28_1 elig_prep_w_28_1  elig_prep_m_28_1 oral_prep_w_28_1 oral_prep_m_28_1 la_prep_w_28_1  la_prep_m_28_1 cd4_500pl_28_1
cd4_350_500_28_1 cd4_200_350_28_1 cd4_200_28_1 deaths_1_28_1 deaths_2_28_1 deaths_3_28_1 deaths_4_28_1 deaths_5_28_1 ;
 
put run  prep_elig_criteria  sim_year_29_1
pop_size_w_29_1 pop_size_m_29_1  hiv_w_29_1  hiv_m_29_1 diag_w_29_1 diag_m_29_1 art_w_29_1 art_m_29_1 vs_w_29_1 vs_m_29_1 inf_w_29_1 inf_m_29_1 inf_oral_29_1 
inf_la_29_1 deaths_w_29_1 deaths_m_29_1 elig_prep_w_29_1  elig_prep_m_29_1 oral_prep_w_29_1 oral_prep_m_29_1 la_prep_w_29_1  la_prep_m_29_1 cd4_500pl_29_1
cd4_350_500_29_1 cd4_200_350_29_1 cd4_200_29_1 deaths_1_29_1 deaths_2_29_1 deaths_3_29_1 deaths_4_29_1 deaths_5_29_1 ;

put run  prep_elig_criteria  sim_year_30_1
pop_size_w_30_1 pop_size_m_30_1  hiv_w_30_1  hiv_m_30_1 diag_w_30_1 diag_m_30_1 art_w_30_1 art_m_30_1 vs_w_30_1 vs_m_30_1 inf_w_30_1 inf_m_30_1 inf_oral_30_1 
inf_la_30_1 deaths_w_30_1 deaths_m_30_1 elig_prep_w_30_1  elig_prep_m_30_1 oral_prep_w_30_1 oral_prep_m_30_1 la_prep_w_30_1  la_prep_m_30_1 cd4_500pl_30_1
cd4_350_500_30_1 cd4_200_350_30_1 cd4_200_30_1 deaths_1_30_1 deaths_2_30_1 deaths_3_30_1 deaths_4_30_1 deaths_5_30_1 ;

put run  prep_elig_criteria  sim_year_31_1
pop_size_w_31_1 pop_size_m_31_1  hiv_w_31_1  hiv_m_31_1 diag_w_31_1 diag_m_31_1 art_w_31_1 art_m_31_1 vs_w_31_1 vs_m_31_1 inf_w_31_1 inf_m_31_1 inf_oral_31_1 
inf_la_31_1 deaths_w_31_1 deaths_m_31_1 elig_prep_w_31_1  elig_prep_m_31_1 oral_prep_w_31_1 oral_prep_m_31_1 la_prep_w_31_1  la_prep_m_31_1 cd4_500pl_31_1
cd4_350_500_31_1 cd4_200_350_31_1 cd4_200_31_1 deaths_1_31_1 deaths_2_31_1 deaths_3_31_1 deaths_4_31_1 deaths_5_31_1 ;

put run  prep_elig_criteria  sim_year_32_1
pop_size_w_32_1 pop_size_m_32_1  hiv_w_32_1  hiv_m_32_1 diag_w_32_1 diag_m_32_1 art_w_32_1 art_m_32_1 vs_w_32_1 vs_m_32_1 inf_w_32_1 inf_m_32_1 inf_oral_32_1 
inf_la_32_1 deaths_w_32_1 deaths_m_32_1 elig_prep_w_32_1  elig_prep_m_32_1 oral_prep_w_32_1 oral_prep_m_32_1 la_prep_w_32_1  la_prep_m_32_1 cd4_500pl_32_1
cd4_350_500_32_1 cd4_200_350_32_1 cd4_200_32_1 deaths_1_32_1 deaths_2_32_1 deaths_3_32_1 deaths_4_32_1 deaths_5_32_1 ;

put run  prep_elig_criteria  sim_year_33_1
pop_size_w_33_1 pop_size_m_33_1  hiv_w_33_1  hiv_m_33_1 diag_w_33_1 diag_m_33_1 art_w_33_1 art_m_33_1 vs_w_33_1 vs_m_33_1 inf_w_33_1 inf_m_33_1 inf_oral_33_1 
inf_la_33_1 deaths_w_33_1 deaths_m_33_1 elig_prep_w_33_1  elig_prep_m_33_1 oral_prep_w_33_1 oral_prep_m_33_1 la_prep_w_33_1  la_prep_m_33_1 cd4_500pl_33_1
cd4_350_500_33_1 cd4_200_350_33_1 cd4_200_33_1 deaths_1_33_1 deaths_2_33_1 deaths_3_33_1 deaths_4_33_1 deaths_5_33_1 ;

put run  prep_elig_criteria  sim_year_34_1
pop_size_w_34_1 pop_size_m_34_1  hiv_w_34_1  hiv_m_34_1 diag_w_34_1 diag_m_34_1 art_w_34_1 art_m_34_1 vs_w_34_1 vs_m_34_1 inf_w_34_1 inf_m_34_1 inf_oral_34_1 
inf_la_34_1 deaths_w_34_1 deaths_m_34_1 elig_prep_w_34_1  elig_prep_m_34_1 oral_prep_w_34_1 oral_prep_m_34_1 la_prep_w_34_1  la_prep_m_34_1 cd4_500pl_34_1
cd4_350_500_34_1 cd4_200_350_34_1 cd4_200_34_1 deaths_1_34_1 deaths_2_34_1 deaths_3_34_1 deaths_4_34_1 deaths_5_34_1 ;

put run  prep_elig_criteria  sim_year_35_1
pop_size_w_35_1 pop_size_m_35_1  hiv_w_35_1  hiv_m_35_1 diag_w_35_1 diag_m_35_1 art_w_35_1 art_m_35_1 vs_w_35_1 vs_m_35_1 inf_w_35_1 inf_m_35_1 inf_oral_35_1 
inf_la_35_1 deaths_w_35_1 deaths_m_35_1 elig_prep_w_35_1  elig_prep_m_35_1 oral_prep_w_35_1 oral_prep_m_35_1 la_prep_w_35_1  la_prep_m_35_1 cd4_500pl_35_1
cd4_350_500_35_1 cd4_200_350_35_1 cd4_200_35_1 deaths_1_35_1 deaths_2_35_1 deaths_3_35_1 deaths_4_35_1 deaths_5_35_1 ;

put run  prep_elig_criteria  sim_year_36_1
pop_size_w_36_1 pop_size_m_36_1  hiv_w_36_1  hiv_m_36_1 diag_w_36_1 diag_m_36_1 art_w_36_1 art_m_36_1 vs_w_36_1 vs_m_36_1 inf_w_36_1 inf_m_36_1 inf_oral_36_1 
inf_la_36_1 deaths_w_36_1 deaths_m_36_1 elig_prep_w_36_1  elig_prep_m_36_1 oral_prep_w_36_1 oral_prep_m_36_1 la_prep_w_36_1  la_prep_m_36_1 cd4_500pl_36_1
cd4_350_500_36_1 cd4_200_350_36_1 cd4_200_36_1 deaths_1_36_1 deaths_2_36_1 deaths_3_36_1 deaths_4_36_1 deaths_5_36_1 ;

put run  prep_elig_criteria  sim_year_37_1
pop_size_w_37_1 pop_size_m_37_1  hiv_w_37_1  hiv_m_37_1 diag_w_37_1 diag_m_37_1 art_w_37_1 art_m_37_1 vs_w_37_1 vs_m_37_1 inf_w_37_1 inf_m_37_1 inf_oral_37_1 
inf_la_37_1 deaths_w_37_1 deaths_m_37_1 elig_prep_w_37_1  elig_prep_m_37_1 oral_prep_w_37_1 oral_prep_m_37_1 la_prep_w_37_1  la_prep_m_37_1 cd4_500pl_37_1
cd4_350_500_37_1 cd4_200_350_37_1 cd4_200_37_1 deaths_1_37_1 deaths_2_37_1 deaths_3_37_1 deaths_4_37_1 deaths_5_37_1 ;

put run  prep_elig_criteria  sim_year_38_1
pop_size_w_38_1 pop_size_m_38_1  hiv_w_38_1  hiv_m_38_1 diag_w_38_1 diag_m_38_1 art_w_38_1 art_m_38_1 vs_w_38_1 vs_m_38_1 inf_w_38_1 inf_m_38_1 inf_oral_38_1 
inf_la_38_1 deaths_w_38_1 deaths_m_38_1 elig_prep_w_38_1  elig_prep_m_38_1 oral_prep_w_38_1 oral_prep_m_38_1 la_prep_w_38_1  la_prep_m_38_1 cd4_500pl_38_1
cd4_350_500_38_1 cd4_200_350_38_1 cd4_200_38_1 deaths_1_38_1 deaths_2_38_1 deaths_3_38_1 deaths_4_38_1 deaths_5_38_1 ;

put run  prep_elig_criteria  sim_year_39_1
pop_size_w_39_1 pop_size_m_39_1  hiv_w_39_1  hiv_m_39_1 diag_w_39_1 diag_m_39_1 art_w_39_1 art_m_39_1 vs_w_39_1 vs_m_39_1 inf_w_39_1 inf_m_39_1 inf_oral_39_1 
inf_la_39_1 deaths_w_39_1 deaths_m_39_1 elig_prep_w_39_1  elig_prep_m_39_1 oral_prep_w_39_1 oral_prep_m_39_1 la_prep_w_39_1  la_prep_m_39_1 cd4_500pl_39_1
cd4_350_500_39_1 cd4_200_350_39_1 cd4_200_39_1 deaths_1_39_1 deaths_2_39_1 deaths_3_39_1 deaths_4_39_1 deaths_5_39_1 ;

put run  prep_elig_criteria  sim_year_40_1
pop_size_w_40_1 pop_size_m_40_1  hiv_w_40_1  hiv_m_40_1 diag_w_40_1 diag_m_40_1 art_w_40_1 art_m_40_1 vs_w_40_1 vs_m_40_1 inf_w_40_1 inf_m_40_1 inf_oral_40_1 
inf_la_40_1 deaths_w_40_1 deaths_m_40_1 elig_prep_w_40_1  elig_prep_m_40_1 oral_prep_w_40_1 oral_prep_m_40_1 la_prep_w_40_1  la_prep_m_40_1 cd4_500pl_40_1
cd4_350_500_40_1 cd4_200_350_40_1 cd4_200_40_1 deaths_1_40_1 deaths_2_40_1 deaths_3_40_1 deaths_4_40_1 deaths_5_40_1 ;

put run  prep_elig_criteria  sim_year_41_1
pop_size_w_41_1 pop_size_m_41_1  hiv_w_41_1  hiv_m_41_1 diag_w_41_1 diag_m_41_1 art_w_41_1 art_m_41_1 vs_w_41_1 vs_m_41_1 inf_w_41_1 inf_m_41_1 inf_oral_41_1 
inf_la_41_1 deaths_w_41_1 deaths_m_41_1 elig_prep_w_41_1  elig_prep_m_41_1 oral_prep_w_41_1 oral_prep_m_41_1 la_prep_w_41_1  la_prep_m_41_1 cd4_500pl_41_1
cd4_350_500_41_1 cd4_200_350_41_1 cd4_200_41_1 deaths_1_41_1 deaths_2_41_1 deaths_3_41_1 deaths_4_41_1 deaths_5_41_1 ;

put run  prep_elig_criteria  sim_year_42_1
pop_size_w_42_1 pop_size_m_42_1  hiv_w_42_1  hiv_m_42_1 diag_w_42_1 diag_m_42_1 art_w_42_1 art_m_42_1 vs_w_42_1 vs_m_42_1 inf_w_42_1 inf_m_42_1 inf_oral_42_1 
inf_la_42_1 deaths_w_42_1 deaths_m_42_1 elig_prep_w_42_1  elig_prep_m_42_1 oral_prep_w_42_1 oral_prep_m_42_1 la_prep_w_42_1  la_prep_m_42_1 cd4_500pl_42_1
cd4_350_500_42_1 cd4_200_350_42_1 cd4_200_42_1 deaths_1_42_1 deaths_2_42_1 deaths_3_42_1 deaths_4_42_1 deaths_5_42_1 ;

 

data outp_base;

infile "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\hptn20_base_prev5_oral_w_10yr_2";

input run prep_elig_criteria sim_year pop_size_w pop_size_m hiv_w hiv_m diag_w diag_m art_w art_m vs_w vs_m inf_w inf_m inf_oral inf_la deaths_w deaths_m elig_prep_w 
elig_prep_m oral_prep_w oral_prep_m la_prep_w  la_prep_m cd4_500pl cd4_350_500 cd4_200_350 cd4_200 deaths_1 deaths_2 deaths_3 deaths_4 deaths_5;

/*
pop_size_w = round(pop_size_w,1);
pop_size_m = round(pop_size_m,1);
hiv_w  = round(hiv_w ,1);
hiv_m  = round(hiv_m ,1);
diag_w = round( diag_w ,1);
diag_m = round( diag_m ,1);
art_w  = round(art_w ,1);
art_m  = round(art_m ,1);
vs_w  = round(vs_w ,1);
vs_m  = round(vs_m ,1);
inf_w = round( inf_w ,1);
inf_m = round( inf_m ,1);
inf_oral  = round(inf_oral,1); 
inf_la  = round(inf_la ,1);
deaths_w  = round(deaths_w,1); 
deaths_m  = round(deaths_m,1); 
elig_prep_w  = round(elig_prep_w,1); 
elig_prep_m  = round(elig_prep_m,1); 
oral_prep_w  = round(oral_prep_w,1); 
oral_prep_m  = round(oral_prep_m,1); 
la_prep_w   = round(la_prep_w  ,1);
la_prep_m  = round(la_prep_m ,1);
cd4_500pl  = round(cd4_500pl ,1);
cd4_350_500  = round(cd4_350_500,1); 
cd4_200_350  = round(cd4_200_350,1); 
cd4_200  = round(cd4_200 ,1);
deaths_1  = round(deaths_1 ,1);
deaths_2  = round(deaths_2 ,1);
deaths_3  = round(deaths_3 ,1);
deaths_4  = round(deaths_4 ,1);
deaths_5  = round(deaths_5,1);
*/

proc export 
data=outp_base dbms=csv  
outfile="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\sc_hptn20_base_prev5_oral_w_10yr_2" replace; 
run;



data la; set w_hptn20;

file "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\hptn20_prep_prev5_oral_w_10yr_2";

put run prep_elig_criteria  sim_year_22_2
pop_size_w_22_2 pop_size_m_22_2  hiv_w_22_2  hiv_m_22_2 diag_w_22_2 diag_m_22_2 art_w_22_2 art_m_22_2 vs_w_22_2 vs_m_22_2 inf_w_22_2 inf_m_22_2 inf_oral_22_2 
inf_la_22_2 deaths_w_22_2 deaths_m_22_2 elig_prep_w_22_2  elig_prep_m_22_2 oral_prep_w_22_2 oral_prep_m_22_2 la_prep_w_22_2  la_prep_m_22_2 cd4_500pl_22_2
cd4_350_500_22_2 cd4_200_350_22_2 cd4_200_22_2 deaths_1_22_2 deaths_2_22_2 deaths_3_22_2 deaths_4_22_2 deaths_5_22_2 ;

put run prep_elig_criteria  sim_year_23_2
pop_size_w_23_2 pop_size_m_23_2  hiv_w_23_2  hiv_m_23_2 diag_w_23_2 diag_m_23_2 art_w_23_2 art_m_23_2 vs_w_23_2 vs_m_23_2 inf_w_23_2 inf_m_23_2 inf_oral_23_2 
inf_la_32_2 deaths_w_23_2 deaths_m_23_2 elig_prep_w_23_2  elig_prep_m_23_2 oral_prep_w_23_2 oral_prep_m_23_2 la_prep_w_23_2  la_prep_m_23_2 cd4_500pl_23_2
cd4_350_500_23_2 cd4_200_350_23_2 cd4_200_23_2 deaths_1_23_2 deaths_2_23_2 deaths_3_23_2 deaths_4_23_2 deaths_5_23_2 ;

put run prep_elig_criteria  sim_year_24_2
pop_size_w_24_2 pop_size_m_24_2  hiv_w_24_2  hiv_m_24_2 diag_w_24_2 diag_m_24_2 art_w_24_2 art_m_24_2 vs_w_24_2 vs_m_24_2 inf_w_24_2 inf_m_24_2 inf_oral_24_2 
inf_la_24_2 deaths_w_24_2 deaths_m_24_2 elig_prep_w_24_2  elig_prep_m_24_2 oral_prep_w_24_2 oral_prep_m_24_2 la_prep_w_24_2  la_prep_m_24_2 cd4_500pl_24_2
cd4_350_500_24_2 cd4_200_350_24_2 cd4_200_24_2 deaths_1_24_2 deaths_2_24_2 deaths_3_24_2 deaths_4_24_2 deaths_5_24_2 ;

put run prep_elig_criteria  sim_year_25_2
pop_size_w_25_2 pop_size_m_25_2  hiv_w_25_2  hiv_m_25_2 diag_w_25_2 diag_m_25_2 art_w_25_2 art_m_25_2 vs_w_25_2 vs_m_25_2 inf_w_25_2 inf_m_25_2 inf_oral_25_2 
inf_la_25_2 deaths_w_25_2 deaths_m_25_2 elig_prep_w_25_2  elig_prep_m_25_2 oral_prep_w_25_2 oral_prep_m_25_2 la_prep_w_25_2  la_prep_m_25_2 cd4_500pl_25_2
cd4_350_500_25_2 cd4_200_350_25_2 cd4_200_25_2 deaths_1_25_2 deaths_2_25_2 deaths_3_25_2 deaths_4_25_2 deaths_5_25_2 ;

put run prep_elig_criteria  sim_year_26_2
pop_size_w_26_2 pop_size_m_26_2  hiv_w_26_2  hiv_m_26_2 diag_w_26_2 diag_m_26_2 art_w_26_2 art_m_26_2 vs_w_26_2 vs_m_26_2 inf_w_26_2 inf_m_26_2 inf_oral_26_2 
inf_la_26_2 deaths_w_26_2 deaths_m_26_2 elig_prep_w_26_2  elig_prep_m_26_2 oral_prep_w_26_2 oral_prep_m_26_2 la_prep_w_26_2  la_prep_m_26_2 cd4_500pl_26_2
cd4_350_500_26_2 cd4_200_350_26_2 cd4_200_26_2 deaths_1_26_2 deaths_2_26_2 deaths_3_26_2 deaths_4_26_2 deaths_5_26_2 ;

put run prep_elig_criteria  sim_year_27_2
pop_size_w_27_2 pop_size_m_27_2  hiv_w_27_2  hiv_m_27_2 diag_w_27_2 diag_m_27_2 art_w_27_2 art_m_27_2 vs_w_27_2 vs_m_27_2 inf_w_27_2 inf_m_27_2 inf_oral_27_2 
inf_la_27_2 deaths_w_27_2 deaths_m_27_2 elig_prep_w_27_2  elig_prep_m_27_2 oral_prep_w_27_2 oral_prep_m_27_2 la_prep_w_27_2  la_prep_m_27_2 cd4_500pl_27_2
cd4_350_500_27_2 cd4_200_350_27_2 cd4_200_27_2 deaths_1_27_2 deaths_2_27_2 deaths_3_27_2 deaths_4_27_2 deaths_5_27_2 ;

put run prep_elig_criteria  sim_year_28_2
pop_size_w_28_2 pop_size_m_28_2  hiv_w_28_2  hiv_m_28_2 diag_w_28_2 diag_m_28_2 art_w_28_2 art_m_28_2 vs_w_28_2 vs_m_28_2 inf_w_28_2 inf_m_28_2 inf_oral_28_2 
inf_la_28_2 deaths_w_28_2 deaths_m_28_2 elig_prep_w_28_2  elig_prep_m_28_2 oral_prep_w_28_2 oral_prep_m_28_2 la_prep_w_28_2  la_prep_m_28_2 cd4_500pl_28_2
cd4_350_500_28_2 cd4_200_350_28_2 cd4_200_28_2 deaths_1_28_2 deaths_2_28_2 deaths_3_28_2 deaths_4_28_2 deaths_5_28_2 ;
 
put run prep_elig_criteria  sim_year_29_2
pop_size_w_29_2 pop_size_m_29_2  hiv_w_29_2  hiv_m_29_2 diag_w_29_2 diag_m_29_2 art_w_29_2 art_m_29_2 vs_w_29_2 vs_m_29_2 inf_w_29_2 inf_m_29_2 inf_oral_29_2 
inf_la_29_2 deaths_w_29_2 deaths_m_29_2 elig_prep_w_29_2  elig_prep_m_29_2 oral_prep_w_29_2 oral_prep_m_29_2 la_prep_w_29_2  la_prep_m_29_2 cd4_500pl_29_2
cd4_350_500_29_2 cd4_200_350_29_2 cd4_200_29_2 deaths_1_29_2 deaths_2_29_2 deaths_3_29_2 deaths_4_29_2 deaths_5_29_2 ;

put run prep_elig_criteria  sim_year_30_2
pop_size_w_30_2 pop_size_m_30_2  hiv_w_30_2  hiv_m_30_2 diag_w_30_2 diag_m_30_2 art_w_30_2 art_m_30_2 vs_w_30_2 vs_m_30_2 inf_w_30_2 inf_m_30_2 inf_oral_30_2 
inf_la_30_2 deaths_w_30_2 deaths_m_30_2 elig_prep_w_30_2  elig_prep_m_30_2 oral_prep_w_30_2 oral_prep_m_30_2 la_prep_w_30_2  la_prep_m_30_2 cd4_500pl_30_2
cd4_350_500_30_2 cd4_200_350_30_2 cd4_200_30_2 deaths_1_30_2 deaths_2_30_2 deaths_3_30_2 deaths_4_30_2 deaths_5_30_2 ;

put run prep_elig_criteria  sim_year_31_2
pop_size_w_31_2 pop_size_m_31_2  hiv_w_31_2  hiv_m_31_2 diag_w_31_2 diag_m_31_2 art_w_31_2 art_m_31_2 vs_w_31_2 vs_m_31_2 inf_w_31_2 inf_m_31_2 inf_oral_31_2 
inf_la_31_2 deaths_w_31_2 deaths_m_31_2 elig_prep_w_31_2  elig_prep_m_31_2 oral_prep_w_31_2 oral_prep_m_31_2 la_prep_w_31_2  la_prep_m_31_2 cd4_500pl_31_2
cd4_350_500_31_2 cd4_200_350_31_2 cd4_200_31_2 deaths_1_31_2 deaths_2_31_2 deaths_3_31_2 deaths_4_31_2 deaths_5_31_2 ;

put run prep_elig_criteria  sim_year_32_2
pop_size_w_32_2 pop_size_m_32_2  hiv_w_32_2  hiv_m_32_2 diag_w_32_2 diag_m_32_2 art_w_32_2 art_m_32_2 vs_w_32_2 vs_m_32_2 inf_w_32_2 inf_m_32_2 inf_oral_32_2 
inf_la_32_2 deaths_w_32_2 deaths_m_32_2 elig_prep_w_32_2  elig_prep_m_32_2 oral_prep_w_32_2 oral_prep_m_32_2 la_prep_w_32_2  la_prep_m_32_2 cd4_500pl_32_2
cd4_350_500_32_2 cd4_200_350_32_2 cd4_200_32_2 deaths_1_32_2 deaths_2_32_2 deaths_3_32_2 deaths_4_32_2 deaths_5_32_2 ;

put run prep_elig_criteria  sim_year_33_2
pop_size_w_33_2 pop_size_m_33_2  hiv_w_33_2  hiv_m_33_2 diag_w_33_2 diag_m_33_2 art_w_33_2 art_m_33_2 vs_w_33_2 vs_m_33_2 inf_w_33_2 inf_m_33_2 inf_oral_33_2 
inf_la_33_2 deaths_w_33_2 deaths_m_33_2 elig_prep_w_33_2  elig_prep_m_33_2 oral_prep_w_33_2 oral_prep_m_33_2 la_prep_w_33_2  la_prep_m_33_2 cd4_500pl_33_2
cd4_350_500_33_2 cd4_200_350_33_2 cd4_200_33_2 deaths_1_33_2 deaths_2_33_2 deaths_3_33_2 deaths_4_33_2 deaths_5_33_2 ;

put run prep_elig_criteria  sim_year_34_2
pop_size_w_34_2 pop_size_m_34_2  hiv_w_34_2  hiv_m_34_2 diag_w_34_2 diag_m_34_2 art_w_34_2 art_m_34_2 vs_w_34_2 vs_m_34_2 inf_w_34_2 inf_m_34_2 inf_oral_34_2 
inf_la_34_2 deaths_w_34_2 deaths_m_34_2 elig_prep_w_34_2  elig_prep_m_34_2 oral_prep_w_34_2 oral_prep_m_34_2 la_prep_w_34_2  la_prep_m_34_2 cd4_500pl_34_2
cd4_350_500_34_2 cd4_200_350_34_2 cd4_200_34_2 deaths_1_34_2 deaths_2_34_2 deaths_3_34_2 deaths_4_34_2 deaths_5_34_2 ;

put run prep_elig_criteria  sim_year_35_2
pop_size_w_35_2 pop_size_m_35_2  hiv_w_35_2  hiv_m_35_2 diag_w_35_2 diag_m_35_2 art_w_35_2 art_m_35_2 vs_w_35_2 vs_m_35_2 inf_w_35_2 inf_m_35_2 inf_oral_35_2 
inf_la_35_2 deaths_w_35_2 deaths_m_35_2 elig_prep_w_35_2  elig_prep_m_35_2 oral_prep_w_35_2 oral_prep_m_35_2 la_prep_w_35_2  la_prep_m_35_2 cd4_500pl_35_2
cd4_350_500_35_2 cd4_200_350_35_2 cd4_200_35_2 deaths_1_35_2 deaths_2_35_2 deaths_3_35_2 deaths_4_35_2 deaths_5_35_2 ;

put run prep_elig_criteria  sim_year_36_2
pop_size_w_36_2 pop_size_m_36_2  hiv_w_36_2  hiv_m_36_2 diag_w_36_2 diag_m_36_2 art_w_36_2 art_m_36_2 vs_w_36_2 vs_m_36_2 inf_w_36_2 inf_m_36_2 inf_oral_36_2 
inf_la_36_2 deaths_w_36_2 deaths_m_36_2 elig_prep_w_36_2  elig_prep_m_36_2 oral_prep_w_36_2 oral_prep_m_36_2 la_prep_w_36_2  la_prep_m_36_2 cd4_500pl_36_2
cd4_350_500_36_2 cd4_200_350_36_2 cd4_200_36_2 deaths_1_36_2 deaths_2_36_2 deaths_3_36_2 deaths_4_36_2 deaths_5_36_2 ;

put run prep_elig_criteria  sim_year_37_2
pop_size_w_37_2 pop_size_m_37_2  hiv_w_37_2  hiv_m_37_2 diag_w_37_2 diag_m_37_2 art_w_37_2 art_m_37_2 vs_w_37_2 vs_m_37_2 inf_w_37_2 inf_m_37_2 inf_oral_37_2 
inf_la_37_2 deaths_w_37_2 deaths_m_37_2 elig_prep_w_37_2  elig_prep_m_37_2 oral_prep_w_37_2 oral_prep_m_37_2 la_prep_w_37_2  la_prep_m_37_2 cd4_500pl_37_2
cd4_350_500_37_2 cd4_200_350_37_2 cd4_200_37_2 deaths_1_37_2 deaths_2_37_2 deaths_3_37_2 deaths_4_37_2 deaths_5_37_2 ;

put run prep_elig_criteria  sim_year_38_2
pop_size_w_38_2 pop_size_m_38_2  hiv_w_38_2  hiv_m_38_2 diag_w_38_2 diag_m_38_2 art_w_38_2 art_m_38_2 vs_w_38_2 vs_m_38_2 inf_w_38_2 inf_m_38_2 inf_oral_38_2 
inf_la_38_2 deaths_w_38_2 deaths_m_38_2 elig_prep_w_38_2  elig_prep_m_38_2 oral_prep_w_38_2 oral_prep_m_38_2 la_prep_w_38_2  la_prep_m_38_2 cd4_500pl_38_2
cd4_350_500_38_2 cd4_200_350_38_2 cd4_200_38_2 deaths_1_38_2 deaths_2_38_2 deaths_3_38_2 deaths_4_38_2 deaths_5_38_2 ;

put run prep_elig_criteria  sim_year_39_2
pop_size_w_39_2 pop_size_m_39_2  hiv_w_39_2  hiv_m_39_2 diag_w_39_2 diag_m_39_2 art_w_39_2 art_m_39_2 vs_w_39_2 vs_m_39_2 inf_w_39_2 inf_m_39_2 inf_oral_39_2 
inf_la_39_2 deaths_w_39_2 deaths_m_39_2 elig_prep_w_39_2  elig_prep_m_39_2 oral_prep_w_39_2 oral_prep_m_39_2 la_prep_w_39_2  la_prep_m_39_2 cd4_500pl_39_2
cd4_350_500_39_2 cd4_200_350_39_2 cd4_200_39_2 deaths_1_39_2 deaths_2_39_2 deaths_3_39_2 deaths_4_39_2 deaths_5_39_2 ;

put run prep_elig_criteria  sim_year_40_2
pop_size_w_40_2 pop_size_m_40_2  hiv_w_40_2  hiv_m_40_2 diag_w_40_2 diag_m_40_2 art_w_40_2 art_m_40_2 vs_w_40_2 vs_m_40_2 inf_w_40_2 inf_m_40_2 inf_oral_40_2 
inf_la_40_2 deaths_w_40_2 deaths_m_40_2 elig_prep_w_40_2  elig_prep_m_40_2 oral_prep_w_40_2 oral_prep_m_40_2 la_prep_w_40_2  la_prep_m_40_2 cd4_500pl_40_2
cd4_350_500_40_2 cd4_200_350_40_2 cd4_200_40_2 deaths_1_40_2 deaths_2_40_2 deaths_3_40_2 deaths_4_40_2 deaths_5_40_2 ;

put run prep_elig_criteria  sim_year_41_2
pop_size_w_41_2 pop_size_m_41_2  hiv_w_41_2  hiv_m_41_2 diag_w_41_2 diag_m_41_2 art_w_41_2 art_m_41_2 vs_w_41_2 vs_m_41_2 inf_w_41_2 inf_m_41_2 inf_oral_41_2 
inf_la_41_2 deaths_w_41_2 deaths_m_41_2 elig_prep_w_41_2  elig_prep_m_41_2 oral_prep_w_41_2 oral_prep_m_41_2 la_prep_w_41_2  la_prep_m_41_2 cd4_500pl_41_2
cd4_350_500_41_2 cd4_200_350_41_2 cd4_200_41_2 deaths_1_41_2 deaths_2_41_2 deaths_3_41_2 deaths_4_41_2 deaths_5_41_2 ;

put run prep_elig_criteria  sim_year_42_2
pop_size_w_42_2 pop_size_m_42_2  hiv_w_42_2  hiv_m_42_2 diag_w_42_2 diag_m_42_2 art_w_42_2 art_m_42_2 vs_w_42_2 vs_m_42_2 inf_w_42_2 inf_m_42_2 inf_oral_42_2 
inf_la_42_2 deaths_w_42_2 deaths_m_42_2 elig_prep_w_42_2  elig_prep_m_42_2 oral_prep_w_42_2 oral_prep_m_42_2 la_prep_w_42_2  la_prep_m_42_2 cd4_500pl_42_2
cd4_350_500_42_2 cd4_200_350_42_2 cd4_200_42_2 deaths_1_42_2 deaths_2_42_2 deaths_3_42_2 deaths_4_42_2 deaths_5_42_2 ;

 

data outp_la;

infile "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\hptn20_prep_prev5_oral_w_10yr_2";

input run prep_elig_criteria sim_year pop_size_w pop_size_m hiv_w hiv_m diag_w diag_m art_w art_m vs_w vs_m inf_w inf_m inf_oral inf_la deaths_w deaths_m elig_prep_w 
elig_prep_m oral_prep_w oral_prep_m la_prep_w  la_prep_m cd4_500pl cd4_350_500 cd4_200_350 cd4_200 deaths_1 deaths_2 deaths_3 deaths_4 deaths_5;

/*
pop_size_w = round(pop_size_w,1);
pop_size_m = round(pop_size_m,1);
hiv_w  = round(hiv_w ,1);
hiv_m  = round(hiv_m ,1);
diag_w = round( diag_w ,1);
diag_m = round( diag_m ,1);
art_w  = round(art_w ,1);
art_m  = round(art_m ,1);
vs_w  = round(vs_w ,1);
vs_m  = round(vs_m ,1);
inf_w = round( inf_w ,1);
inf_m = round( inf_m ,1);
inf_oral  = round(inf_oral,1); 
inf_la  = round(inf_la ,1);
deaths_w  = round(deaths_w,1); 
deaths_m  = round(deaths_m,1); 
elig_prep_w  = round(elig_prep_w,1); 
elig_prep_m  = round(elig_prep_m,1); 
oral_prep_w  = round(oral_prep_w,1); 
oral_prep_m  = round(oral_prep_m,1); 
la_prep_w   = round(la_prep_w  ,1);
la_prep_m  = round(la_prep_m ,1);
cd4_500pl  = round(cd4_500pl ,1);
cd4_350_500  = round(cd4_350_500,1); 
cd4_200_350  = round(cd4_200_350,1); 
cd4_200  = round(cd4_200 ,1);
deaths_1  = round(deaths_1 ,1);
deaths_2  = round(deaths_2 ,1);
deaths_3  = round(deaths_3 ,1);
deaths_4  = round(deaths_4 ,1);
deaths_5  = round(deaths_5,1);
*/

proc print; run;

proc export 
data=outp_la dbms=csv  
outfile="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\sc_hptn20_prep_prev5_oral_w_10yr_2" replace; 
run;


