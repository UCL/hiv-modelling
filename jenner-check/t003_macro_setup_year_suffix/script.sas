/* ----------------------------------------------------------------------------
   Drive the %setup macro the same way Auto_Table1.sas does (lines 62-79): read
   the wide model-output row, then for each year of interest set subgp and call
   %setup to copy that year's suffixed columns onto the bare metric names,
   outputting one row per snapshot. The external libname dataset (a.w_base_...)
   is replaced here with a small in-line row carrying the year-suffixed columns.
---------------------------------------------------------------------------- */
data indata2;
	s_alive_95 = 1.2e6; s_alive_05 = 1.5e6;
	prevalence1549_95 = 0.02; prevalence1549m_95 = 0.018; prevalence1549w_95 = 0.022;
	prevalence1549_05 = 0.11; prevalence1549m_05 = 0.095; prevalence1549w_05 = 0.125;
	incidence1549_95 = 0.8; incidence1549w_95 = 0.9; incidence1549m_95 = 0.7;
	incidence1549_05 = 1.4; incidence1549w_05 = 1.6; incidence1549m_05 = 1.2;
	p_diag_95 = 0.05; p_diag_m_95 = 0.04; p_diag_w_95 = 0.06;
	p_diag_05 = 0.35; p_diag_m_05 = 0.30; p_diag_w_05 = 0.40;

	subgp = 1; %setup(yr=95); output;   ***1995 snapshot;
	subgp = 2; %setup(yr=05); output;   ***2005 snapshot;

	keep subgp s_alive prevalence1549 prevalence1549m prevalence1549w
	     incidence1549 incidence1549w incidence1549m p_diag p_diag_m p_diag_w;
run;

proc sort data=indata2;
	by subgp;
run;

proc print data=indata2;
	title "indata2: model outputs sliced into one row per year snapshot";
run;
title;
