
data f;
input a b ;

cards;
1 3
2 4
6 7
;


data d; set f;


proc print; run;
