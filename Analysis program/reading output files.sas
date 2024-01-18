libname a "C:\Users\Loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\FSW\Zim\18sep\";
libname b "C:\Users\loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\FSW\Zim";


data b;
set a.out:;
run;


data b.fsw_18_09_23;
set b;
run;


DATA simula2;
	do i = 1 to 100;
       b = ranbin(2340234,100,0.5);
       output;
    end;
 RUN;

 proc freq;table b;run;

 proc univariate;var b;run;

 data h;
 p = ranpoi(23, 4);
 proc freq;table p;run;
