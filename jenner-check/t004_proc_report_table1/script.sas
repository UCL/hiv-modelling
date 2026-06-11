/* ----------------------------------------------------------------------------
   The Table 1 PROC REPORT from Auto_Table1.sas (lines 330-353), verbatim apart
   from the ODS RTF wrapper (which targeted an external Dropbox path). It lays
   out a "Median (90% range)" summary table with a spanning header, an ordering
   variable used only to sequence the rows, and per-year columns with column /
   header styling. SPLIT='*' starts a new line within a cell; ASIS=ON preserves
   leading blanks for indenting row titles.
---------------------------------------------------------------------------- */
title1 "Table 1: Key summary statistics";

proc report data=final split='*';
	columns (grpord catlbl num1 ("Median (90% range)" col1 col2 col3 col4));
	define grpord      / order noprint;
	define catlbl      / "Variable" flow style(column) = [width = 25% textalign = left asis=on] style(header) =[textalign = left];
	define num1        / "N" flow style(column) = [width = 10% textalign = center] style(header) =[textalign = center];
	define col1        / "1995" flow style(column) = [width = 15% textalign = center] style(header) =[textalign = center];
	define col2        / "2005" flow style(column) = [width = 15% textalign = center] style(header) =[textalign = center];
	define col3        / "2015" flow style(column) = [width = 15% textalign = center] style(header) =[textalign = center];
	define col4        / "2021" flow style(column) = [width = 15% textalign = center fontweight=bold] style(header) =[textalign = center fontweight=bold];
run;

title;
