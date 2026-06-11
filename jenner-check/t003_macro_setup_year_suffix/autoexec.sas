options obs=100;

/* ----------------------------------------------------------------------------
   %setup macro from Auto_Table1.sas (lines 9-58). For a given year suffix it
   copies each '<metric>_<yr>' column onto the bare '<metric>' name, so that a
   single wide row carrying many years of model output can be sliced into one
   row per year of interest. The real macro maps ~100 variables; this bundle
   keeps the macro structure and a faithful subset of the mappings.
---------------------------------------------------------------------------- */
%macro setup(yr=);
	s_alive = s_alive_&yr;
	prevalence1549 = prevalence1549_&yr;  prevalence1549m = prevalence1549m_&yr; prevalence1549w = prevalence1549w_&yr;
	incidence1549 = incidence1549_&yr; incidence1549w = incidence1549w_&yr; incidence1549m = incidence1549m_&yr;
	p_diag = p_diag_&yr; p_diag_m = p_diag_m_&yr; p_diag_w = p_diag_w_&yr;
%mend setup;
