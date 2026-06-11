options obs=100 nodate nonumber;

/* ----------------------------------------------------------------------------
   Build a small 'final' dataset matching the column shape that the Table 1
   PROC REPORT in Auto_Table1.sas reads: an ordering variable (grpord), a row
   label (catlbl), an N column (num1) and four year columns (col1-col4), each
   holding a "Median (90% range)" string. The real flow derives 'final' from
   the model output via PROC UNIVARIATE / PROC TRANSPOSE upstream; here we feed
   the report a few representative summary rows directly.
---------------------------------------------------------------------------- */
data final;
	length catlbl $40 col1 col2 col3 col4 $24;
	grpord=1; catlbl="HIV prevalence 15-49 (%)";    num1=1000;
		col1="2.0 (1.5-2.6)"; col2="11.0 (9.8-12.5)"; col3="14.2 (12.9-15.8)"; col4="12.6 (11.1-14.0)"; output;
	grpord=2; catlbl="HIV incidence 15-49 (/100py)"; num1=1000;
		col1="0.8 (0.6-1.0)"; col2="1.4 (1.1-1.7)";  col3="0.9 (0.7-1.1)";   col4="0.5 (0.4-0.7)"; output;
	grpord=3; catlbl="% diagnosed";                  num1=1000;
		col1="5 (3-7)";       col2="35 (30-40)";      col3="78 (74-82)";     col4="92 (90-94)"; output;
run;
