
libname a "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim\07Jan2026_a";
libname b "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

data b;
set a.out:;
run;

data b.GenesisZim_07Jan26_a;
set b;
run;


libname a "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_MLW\29Jan26";
libname b "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_MLW";
data b;
set a.out:;
run;

data b.GenesisMLW_29Jan26_ops;
set b;
run;





proc freq;table cald;run;
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
