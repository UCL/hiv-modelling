options obs=100 nospool;

/* ----------------------------------------------------------------------------
   Build a small mock of the model-output dataset 'y' that create_wide_file.sas
   reads from an external libname (a.<output file>). The real dataset has one
   row per run x option x calendar quarter (cald), with cost / DALY / prevalence
   / incidence columns. Here we synthesise a handful of runs over a fixed random
   stream so the %var pipeline below has something to aggregate.
---------------------------------------------------------------------------- */
data y;
	call streaminit(424242);
	do run = 1 to 2;
		do option = 1 to 2;
			do cald = 2021.0 to 2030.0 by 0.5;
				prevalence1549 = 0.10 + 0.01*rand('normal');
				incidence1549  = 0.50 + 0.05*rand('normal');
				dcost          = 100  + 10*rand('normal');
				output;
			end;
		end;
	end;
run;
proc sort data=y; by run option; run;
