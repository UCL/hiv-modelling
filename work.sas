
%let sasoutputdir = %scan(&sysparm,1," ");
libname a "&sasoutputdir/";

proc options option = work;
run;
