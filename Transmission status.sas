

if infection=caldate&j then do;

*Undiagnosed;
i_undiag= 1- infected_diagnosed;

*On ART <6months after first ART initiation, initiated with CD4 <200;
*On ART <6months after first ART initiation, initiated with CD4 >200; 
*After interruption, on ART <6 months after last re-initiation, last re-initiated with CD4 <200;
*After interruption, on ART <6 months after last re-initiation, last re-initiated with CD4 >200;

*On ART (irrespective of time on ART), current VL <1000;
i_vlsupp=infected_vlsupp; ***does not restict to those on ART;

*On ART (irrespective of time on ART), current VL >1000;

/*

On ART <6 months (regardless of first or subsequent ART initiation), current VL<1000
On ART <6 months (regardless of first or subsequent ART initiation), current VL>1000
On ART continuously for >6months (regardless of first or subsequent ART initiation), current VL<1000
On ART continuously for >6months (regardless of first or subsequent ART initiation), current VL>1000
ART interrupted, out of care, any interruption
ART interrupted, out of care, first interruption
ART interrupted, out of care, subsequent interruption, < 6 months from last interruption
ART interrupted, out of care, subsequent interruption, > 6 months from last interruption 
*/
