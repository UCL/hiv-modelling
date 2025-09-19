
libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\hiv_control_cdi\cdi_07Jul25";
libname b "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\hiv_control_cdi";


data b;
set a.out:;
run;


data b.cdi_07jul25;
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
