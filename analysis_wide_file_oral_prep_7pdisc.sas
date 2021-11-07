
* note using tld_prep runs;
  libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\oral_prep";


data wide1; 

  set 	a.wide_oral_prep_13       ;  

drop dcost_21_71_1 dcost_21_71_2 ddaly_all_21_71_all_1 ddaly_all_21_71_all_2;


data wide ;

merge a.wide_oral_prep_13_7pdisc  wide1 ;


  if incidence1549m_17 < 1.75 and incidence1549w_17 < 2.25 ; 

  if incidence1549m_17 > 0.10  and incidence1549w_17 > 0.10  ; 

keep dcost_21_71_1 dcost_21_71_2 ddaly_all_21_71_all_1 ddaly_all_21_71_all_2


ndb_500_21_71_2 =  ddaly_all_21_71_2 + (dcost_21_71_2)/0.0005;
ndb_500_21_71_1 =  ddaly_all_21_71_1 + (dcost_21_71_1)/0.0005;

d_ndb_500_21_71_2 = ndb_500_21_71_2 - ndb_500_21_71_1 ;

if d_ndb_500_21_71_2 >= 0 then ce_500 = 0; if d_ndb_500_21_71_2 < 0 then ce_500 = 1;


* for table / results;
  ods html;
proc freq data=wide;   tables ce_500_x  / nocum norow binomial; 
run; 
  ods html close;
