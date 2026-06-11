options obs=100 nospool;

/* ----------------------------------------------------------------------------
   Build a small mock of the long model-output dataset 'y' that
   create_wide_file.sas reads from an external libname. The %par macro below
   pulls each sampled parameter's value at a single calendar time (cald=2022.5,
   just before intervention). Here a few sex-worker-programme parameters are
   synthesised, constant within each run, over a fixed random stream.
---------------------------------------------------------------------------- */
data y;
	call streaminit(909090);
	do run = 1 to 3;
		sw_program          = (run=2);              /* SW programme on for run 2 */
		effect_sw_prog_newp = 0.20 + 0.05*run;
		sw_trans_matrix     = ceil(rand('uniform')*3);
		do cald = 2022.0 to 2024.0 by 0.5;
			output;
		end;
	end;
run;
proc sort data=y; by run; run;
