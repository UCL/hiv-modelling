
ods html close;

data r;

inc = 0.1;  
vls = 0.9; 
cost = 240; 

inc1 = inc - 0.5;
vls = vls - 0.75; 
cost = cost - 200;

*
incidence1549_24 = incidence1549_24 - 0.5
len_cab_total_cost = len_cab_total_cost - 200
p_vl1000_24 = p_vl1000_24 - 0.75
;

logodds = 2.25 + (inc * 3.6 ) - (vls * 9.9 ) + (0.03  * cost) - (15.2 * inc * vls) - (0.0786 * inc * cost);

odds = exp(logodds);

prob = odds / (1 + odds);

proc print; var logodds odds prob; run;







