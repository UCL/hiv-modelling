%let outfile = %scan(&sysparm,1," ");

libname output "&outfile/";

data output.xyz;
    population = 1000;
    runs = 100;
    startyear = 1989;
    endyear = 2070;
run;