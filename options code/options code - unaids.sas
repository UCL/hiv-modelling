
* ==========================================================================================================================================;

* INTERVENTIONS / CHANGES in 2005 2010 2015 2020 ;

* insert policy-specific code in here: ;

option = &s;

if option = 0 then do;  end;

if option = 1 and caldate{t} ge 2008 then vmmc_disrup_covid = 1 ; * using this coiv_disrup variable to implement the stopping of circumcision;

if option = 2  and caldate{t} ge 2010 then do; 
t_prop_ageg1_m_vlg1 = 0; t_prop_ageg2_m_vlg1 = 0; t_prop_ageg3_m_vlg1 = 0; t_prop_ageg4_m_vlg1 = 0; t_prop_ageg5_m_vlg1 = 0; 
t_prop_ageg1_w_vlg1 = 0; t_prop_ageg2_w_vlg1 = 0; t_prop_ageg3_w_vlg1 = 0; t_prop_ageg4_w_vlg1 = 0; t_prop_ageg5_w_vlg1 = 0; 
end; 
* this forces the viral load distribution of those with viral suppression 
to be re-distibuted amongst higher levels - to remove effect of art on transmission;

if option = 3  and caldate{t} ge 2020 then do; 
t_prop_ageg1_m_vlg1 = 0; t_prop_ageg2_m_vlg1 = 0; t_prop_ageg3_m_vlg1 = 0; t_prop_ageg4_m_vlg1 = 0; t_prop_ageg5_m_vlg1 = 0; 
t_prop_ageg1_w_vlg1 = 0; t_prop_ageg2_w_vlg1 = 0; t_prop_ageg3_w_vlg1 = 0; t_prop_ageg4_w_vlg1 = 0; t_prop_ageg5_w_vlg1 = 0; 
end; 
 * this forces the viral load distribution of those with viral suppression 
to be re-distibuted amongst higher levels - to remove effect of art on transmission;

* ==========================================================================================================================================;
