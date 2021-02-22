
* note using tld_prep runs;
  libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\tld_prep";

data wide;    
  set a.wide_prep_29_jan_21_7p ; 


* to give n = 1000 setting scenarios;

if run > 837709993 then delete;


* checked that this = original dcost that is overwritten - we re-create here so can adjust components;
 dcost_21_71_1 =      
dart_cost_y_21_71_1 +       
dcost_prep_21_71_1  +      
dcost_prep_visit_21_71_1 + 
dadc_cost_21_71_1   +      
dcd4_cost_21_71_1     +    
dvl_cost_21_71_1    +      
dvis_cost_21_71_1   + 
dwho3_cost_21_71_1    +    
dcot_cost_21_71_1   +       
dtb_cost_21_71_1   +       
dres_cost_21_71_1   +      
dtest_cost_21_71_1  +      
d_t_adh_int_cost_21_71_1 +  
dswitchline_cost_21_71_1 +  
dcost_drug_level_test_21_71_1 +   
dcost_circ_21_71_1  +           
dcost_condom_dn_21_71_1  +      
dcost_child_hiv_21_71_1  +      
dcost_non_aids_pre_death_21_71_1 ; 

* cost of prep deliver from $115 to $75 is implemented as a cut in prep drug cost from $60 to $20 to give the $40 saving - the $40 lower cost would
be beyond drug cost: (dcost_prep_21_71_2 / 3) or (dcost_prep_21_71_2  * 100/60) ; 

* checked that this = original dcost that is overwritten - we re-create here so can adjust components;
 dcost_21_71_2           =      
dart_cost_y_21_71_2 +       
(dcost_prep_21_71_2  * 1 * 60  / 60 ) +
(dcost_prep_visit_21_71_2 * 1)     + 
dadc_cost_21_71_2   +      
dcd4_cost_21_71_2     +    
dvl_cost_21_71_2    +      
dvis_cost_21_71_2   + 
dwho3_cost_21_71_2    +    
dcot_cost_21_71_2   +       
dtb_cost_21_71_2   +       
dres_cost_21_71_2   +      
dtest_cost_21_71_2  +      
d_t_adh_int_cost_21_71_2 +  
dswitchline_cost_21_71_2 +  
dcost_drug_level_test_21_71_2 +   
dcost_circ_21_71_2  +           
dcost_condom_dn_21_71_2  +      
dcost_child_hiv_21_71_2  +      
dcost_non_aids_pre_death_21_71_2 ; 

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
  where 1.5 <= incidence1549_21 < 9.5 and 3  <= av_newp_ge1_non_sw_21 < 10  ;
run; 
  ods html close;

