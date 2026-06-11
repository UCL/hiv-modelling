options obs=100;

/* ----------------------------------------------------------------------------
   %sample_uniform macro, taken verbatim from hiv_synthesis.sas (lines 79-105).
   It samples from a discrete uniform distribution. Per the model's own
   documentation, the value set can be given as a range low:high, e.g.
   %sample_uniform(my_var, 18:49) draws integer ages 18-49 with equal weight.
---------------------------------------------------------------------------- */
%macro sample_uniform(name, v);
	* First determine whether v is a range or not, by checking the presence of :;
	%let split_ind=%index(&v, :);
	%if &split_ind = 0 %then
		%do; * values enumerated explicitly, count them and use them directly;
			%let cnt=%sysfunc(countw(&v,,s));
			%let first_value=%scan(&v,1,,s);
		%end;
	%else
		%do; * values given as range, infer length and get limits of range;
			%let lower_value=%substr(&v, 1, %eval(&split_ind-1));
			%let upper_value=%substr(&v, %eval(&split_ind+1));
			%let cnt=%sysevalf(&upper_value - &lower_value + 1);
			%let first_value=&lower_value;
		%end;
	randvar = rand('uniform');
	if randvar < 1/&cnt then
		&name = &first_value;
	%do i=2 %to &cnt;
		%if &split_ind = 0 %then
			%let value=%scan(&v,&i,,S);
		%else
			%let value=%sysevalf(&lower_value + &i - 1);
		else %if &i < &cnt %then if randvar < &i/&cnt then;
			&name = &value;
	%end;
%mend sample_uniform;
