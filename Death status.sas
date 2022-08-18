
dead_undiag=0;dead_diag_not_linked=0;dead_onartlt6_artcd4lt200=0;dead_onartlt6_artcd4gt200=0;
dead_int_onartlt6_rescd4lt200=0;dead_int_onartlt6_rescd4gt200=0;dead_onart_vl1000=0;dead_onart_vg1000=0;
dead_onartlt6_vl1000=0;dead_onartlt6_vg1000=0;dead_onartgt6_vl1000=0;dead_onartgt6_vg1000=0;
dead_int_lost=0;dead_1stint_lost=0;dead_subintlt6_lost=0;dead_subintgt6_lost=0;dead_onart_cd4lt200=0;dead_onart_cd4lg200=0;
dead_onartlt6_cd4lt200=0;dead_onartlt6_cd4gt200=0;dead_onartgt6_cd4lt200=0;dead_onartgt6_cd4gt200=0;
	
/*
Status at death;
1	Undiagnosed; 
2	Diagnosed without ART initiation, not in care

3	On ART <6months after first ART initiation, initiated with CD4 <200 
4	On ART <6months after first ART initiation, initiated with CD4 >=200   

5	After interruption, on ART <6 months after last re-initiation, last re-initiated with CD4 <200  
6	After interruption, on ART <6 months after last re-initiation, last re-initiated with CD4 >=200  

7	On ART (irrespective of time on ART), current VL <1000
8	On ART (irrespective of time on ART), current VL >=1000
9	On ART <6 months (regardless of first or subsequent ART initiation), current VL<1000
10	On ART <6 months (regardless of first or subsequent ART initiation), current VL>1000

11	On ART continuously for >6months (regardless of first or subsequent ART initiation), current VL<1000
12	On ART continuously for >6months (regardless of first or subsequent ART initiation), current VL>1000

13	ART interrupted, out of care, any interruption
14	ART interrupted, out of care, first interruption
15	ART interrupted, out of care, subsequent interruption, < 6 months from last interruption
16	ART interrupted, out of care, subsequent interruption, > 6 months from last interruption 

17	On ART, no time restrictions, CD4<200 at time of death
18	On ART, no time restrictions, CD4>200 at time of death
19	On ART, <6 months since first ART initiation, CD4<200 at time of death (not stated in template but I am assuming regardless of interruption for last 4)
20	On ART, <6 months since first ART initiation, CD4>200 at time of death
21	On ART, >6 months since first ART initiation, CD4<200 at time of death
22	On ART, >6 months since first ART initiation, CD4>200 at time of death

*/

if hiv=1 and caldate&j=death and dead_ = 1 and rdcause=1 then do;

death_hiv=1;
if gender=1 then death_hiv_m=1;
if gender=2 then death_hiv_w=1;

if registd_tm1 ne 1 then dead_undiag=1;
if registd_tm1=1 and linked_to_care ne 1 then dead_diag_not_linked=1;

if onart=1 and (caldate&j - yrart < 0.5) and date_last_interrupt = . and cd4art ne . and cd4art <200 then dead_onartlt6_artcd4lt200=1;
if onart=1 and (caldate&j - yrart < 0.5) and date_last_interrupt = . and cd4art ne . and cd4art >=200 then dead_onartlt6_artcd4gt200=1;

if onart=1 and date_last_interrupt ne . and date_last_return_restart ne . and (caldate&j < date_last_return_restart < 0.5) and cd4_tcur0 <200 then dead_int_onartlt6_rescd4lt200=1;
if onart=1 and date_last_interrupt ne . and date_last_return_restart ne . and (caldate&j < date_last_return_restart < 0.5) and cd4_tcur0 >=200 then dead_int_onartlt6_rescd4gt200=1;

if onart=1 and vl1000=1 then dead_onart_vl1000=1;
if onart=1 and vg1000=1 then dead_onart_vg1000=1;
if onart=1 and tcur lt 0.5 and vl1000=1 then dead_onartlt6_vl1000=1;
if onart=1 and tcur lt 0.5 and vg1000=1 then dead_onartlt6_vg1000=1;

if onart=1 and tcur ge 0.5 and vl1000=1 then dead_onartlt6_vl1000=1;
if onart=1 and tcur ge 0.5 and vg1000=1 then dead_onartlt6_vg1000=1;

if interrupt=1 and lost=1 then dead_int_lost=1;
if interrupt=1 and lost=1 and date_1st_int ne . then dead_1stint_lost=1;
if interrupt=1 and lost=1 and date_last_return_restart ne . and (date_last_interruption - date_last_return_restart <0.5) then dead_subintlt6_lost=1;
if interrupt=1 and lost=1 and date_last_return_restart ne . and (date_last_interruption - date_last_return_restart >=0.5) then dead_subintgt6_lost=1;

if onart=1 and cd4_dead lt 200 then dead_onart_cd4lt200=1;
if onart=1 and cd4_dead ge 200 then dead_onart_cd4gt200=1;
if onart=1 and (caldate&j - yrart < 0.5) and cd4_dead lt 200 then dead_onartlt6_cd4lt200=1;
if onart=1 and (caldate&j - yrart < 0.5) and cd4_dead ge 200 then dead_onartlt6_cd4gt200=1;
if onart=1 and (caldate&j - yrart >= 0.5) and cd4_dead lt 200 then dead_onartgt6_cd4lt200=1;
if onart=1 and (caldate&j - yrart >= 0.5) and cd4_dead ge 200 then dead_onartgt6_cd4gt200=1;


dead_int_lost=0;dead_1stint_lost=0;dead_subintlt6_lost=0;dead_subintgt6_lost=0;dead_onart_cd4lt200=0;dead_onart_cd4lg200=0;
dead_onartlt6_cd4lt200=0;dead_onartlt6_cd4gt200=0;dead_onartgt6_cd4lt200=0;dead_onartgt6_cd4gt200=0;
