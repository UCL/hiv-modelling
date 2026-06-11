/* ----------------------------------------------------------------------------
   Exercise the %sample_uniform range form (low:high) from hiv_synthesis.sas.
   This is the concise form documented in the macro header: each integer in
   the range is drawn with equal probability.

   call streaminit fixes the random stream so the draws are reproducible.
   We draw 200 replicates for each of two ranges and tabulate the realised
   distribution, which should be roughly uniform across the range.

     my_age            : 18:22   (5 values, ~20% each)
     prep_any_strategy : 1:3     (the Malawi prep_any_strategy range,
                                  %sample_uniform(prep_any_strategy, 1 3) -> 1:3)
---------------------------------------------------------------------------- */

data uniform_draws;
	call streaminit(20231017);   /* fixed seed -> reproducible draws */
	do replicate = 1 to 200;
		%sample_uniform(my_age, 18:22);
		%sample_uniform(prep_any_strategy, 1:3);
		output;
	end;
	drop randvar replicate;
run;

title "Realised distribution of my_age over range 18:22 (uniform, ~20% each)";
proc freq data=uniform_draws;
	tables my_age;
run;

title "Realised distribution of prep_any_strategy over range 1:3 (uniform, ~33% each)";
proc freq data=uniform_draws;
	tables prep_any_strategy;
run;
title;
