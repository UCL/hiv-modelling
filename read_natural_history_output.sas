
* options user="/folders/myfolders/";

 proc printto ; *  log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";


libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";
libname b "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\natural_history_out\";

data natural_history;  
set b.out: ;

prop_who4_5yr_age1524 =  s_age1524_who4_5yr / s_age1524_infected_5yr ;
prop_who4_10yr_age1524 =  s_age1524_who4_10yr / s_age1524_infected_10yr ;
prop_who4_15yr_age1524 =  s_age1524_who4_15yr / s_age1524_infected_15yr ;
prop_who4_20yr_age1524 =  s_age1524_who4_20yr / s_age1524_infected_20yr ;

prop_who4_5yr_age2534 =  s_age2534_who4_5yr / s_age2534_infected_5yr ;
prop_who4_10yr_age2534 =  s_age2534_who4_10yr / s_age2534_infected_10yr ;
prop_who4_15yr_age2534 =  s_age2534_who4_15yr / s_age2534_infected_15yr ;
prop_who4_20yr_age2534 =  s_age2534_who4_20yr / s_age2534_infected_20yr ;

prop_who4_5yr_age3544 =  s_age3544_who4_5yr / s_age3544_infected_5yr ;
prop_who4_10yr_age3544 =  s_age3544_who4_10yr / s_age3544_infected_10yr ;
prop_who4_15yr_age3544 =  s_age3544_who4_15yr / s_age3544_infected_15yr ;
prop_who4_20yr_age3544 =  s_age3544_who4_20yr / s_age3544_infected_20yr ;

prop_who4_5yr_age4554 =  s_age4554_who4_5yr / s_age4554_infected_5yr ;
prop_who4_10yr_age4554 =  s_age4554_who4_10yr / s_age4554_infected_10yr ;
prop_who4_15yr_age4554 =  s_age4554_who4_15yr / s_age4554_infected_15yr ;
prop_who4_20yr_age4554 =  s_age4554_who4_20yr / s_age4554_infected_20yr ;

prop_who4_5yr_age5564 =  s_age5564_who4_5yr / s_age5564_infected_5yr ;
prop_who4_10yr_age5564 =  s_age5564_who4_10yr / s_age5564_infected_10yr ;
prop_who4_15yr_age5564 =  s_age5564_who4_15yr / s_age5564_infected_15yr ;
prop_who4_20yr_age5564 =  s_age5564_who4_20yr / s_age5564_infected_20yr ;



proc means n mean p5 p95; var 

prop_who4_5yr_age1524 
prop_who4_10yr_age1524 
prop_who4_15yr_age1524 
prop_who4_20yr_age1524 

prop_who4_5yr_age2534 
prop_who4_10yr_age2534 
prop_who4_15yr_age2534 
prop_who4_20yr_age2534 

prop_who4_5yr_age3544 
prop_who4_10yr_age3544 
prop_who4_15yr_age3544 
prop_who4_20yr_age3544 

prop_who4_5yr_age4554 
prop_who4_10yr_age4554 
prop_who4_15yr_age4554 
prop_who4_20yr_age4554 

prop_who4_5yr_age5564 
prop_who4_10yr_age5564 
prop_who4_15yr_age5564 
prop_who4_20yr_age5564 
												
;

run;






