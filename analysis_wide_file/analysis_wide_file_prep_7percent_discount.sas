
* note using tld_prep runs;
  libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\tld_prep";

data wide;    
  set a.wide_prep_29_jan_21_7p ; 


* to give n = 1000 setting scenarios;

if run > 837709993 then delete;



d_ddaly_all_21_26_2 = ddaly_all_21_26_2 - ddaly_all_21_26_1 ;

d_dcost_21_26_2 = dcost_21_26_2 - dcost_21_26_1 ;

ndb_500_21_26_2 =  ddaly_all_21_26_2 + (dcost_21_26_2)/0.0005;
ndb_500_21_26_1 =  ddaly_all_21_26_1 + (dcost_21_26_1)/0.0005;

d_ndb_500_21_26_2 = ndb_500_21_26_2 - ndb_500_21_26_1 ;

d_ddaly_all_21_71_2 = ddaly_all_21_71_2 - ddaly_all_21_71_1 ;

d_dcost_21_71_2 = dcost_21_71_2 - dcost_21_71_1 ;

ndb_500_21_71_2 =  ddaly_all_21_71_2 + (dcost_21_71_2)/0.0005;
ndb_500_21_71_1 =  ddaly_all_21_71_1 + (dcost_21_71_1)/0.0005;

ndb_100_21_71_2 =  ddaly_all_21_71_2 + (dcost_21_71_2)/0.0001;
ndb_100_21_71_1 =  ddaly_all_21_71_1 + (dcost_21_71_1)/0.0001;

d_ndb_500_21_71_2 = ndb_500_21_71_2 - ndb_500_21_71_1 ;
d_ndb_100_21_71_2 = ndb_100_21_71_2 - ndb_100_21_71_1 ;

if d_ndb_500_21_71_2 >= 0 then ce_500 = 0; if d_ndb_500_21_71_2 < 0 then ce_500 = 1;
if d_ndb_100_21_71_2 >= 0 then ce_100 = 0; if d_ndb_100_21_71_2 < 0 then ce_100 = 1;

ce_500_x = 1 - ce_500 ;

  ods html;
proc freq data=wide;  tables ce_500_x ; 
* where 0.2 <= incidence1549_21 < 0.5 and 3  <= av_newp_ge1_non_sw_21 < 10  ;
run; 
  ods html close;

