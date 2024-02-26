libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\FSW\Zim\fsw_zim_15feb24";
libname b "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\FSW\Zim";


data b;
set a.out:;
run;


data b.fsw_zim_15feb24;
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
