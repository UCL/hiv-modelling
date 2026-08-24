
%let sasoutputdir = %scan(&sysparm,1," ");
libname a "&sasoutputdir/";


data a.concatenated_data(compress=binary); set a.out: ;

run;

