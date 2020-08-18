
* ==========================================================================================================================================;

* INTERVENTIONS / CHANGES in 2005 2010 2015 2020 ;

* insert policy-specific code in here: ;

option = &s;

if option = 0 then do;  end;

if option = 1 and caldate{t} ge 2008 then vmmc_disrup_covid = 1 ; * using this coiv_disrup variable to implement the stopping of circumcision;

if option = 2  and caldate{t} ge 2005 then t_prop_ageg1_m_vlg1 = 0; * this forces the viral load distribution of those with viral suppression 
to be re-distibuted amongst higher levels - to remove effect of art on transmission;

if option = 3 and caldate{t} ge 2005 then no_art_disrup_covid = 1;

if option = 4  and caldate{t} ge 2010 then t_prop_ageg1_m_vlg1 = 0; * this forces the viral load distribution of those with viral suppression 
to be re-distibuted amongst higher levels - to remove effect of art on transmission;

if option = 5 and caldate{t} ge 2010 then no_art_disrup_covid = 1;

if option = 6  and caldate{t} ge 2015 then t_prop_ageg1_m_vlg1 = 0; * this forces the viral load distribution of those with viral suppression 
to be re-distibuted amongst higher levels - to remove effect of art on transmission;

if option = 7 and caldate{t} ge 2015 then no_art_disrup_covid = 1;

if option = 8  and caldate{t} ge 2020 then t_prop_ageg1_m_vlg1 = 0; * this forces the viral load distribution of those with viral suppression 
to be re-distibuted amongst higher levels - to remove effect of art on transmission;

if option = 9 and caldate{t} ge 2020 then no_art_disrup_covid = 1;


* ==========================================================================================================================================;
