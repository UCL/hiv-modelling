
/*
  HIV Synthesis: compare original and reworked output.

  Run in SAS on Windows, with both .sas7bdat files in the folder below.
  Change C:\filepath to your actual folder, without a trailing backslash.
  Each run replaces hiv_comparison_report.html in that folder.
*/

/* 1. Folder containing both output datasets. */
%let comparison_dir = C:\Users\w3sth\UCL Dropbox\Andrew Phillips\GitHub\hiv-modelling;

/* 2. Read all observations, including after an earlier SAS error. */
options obs=max firstobs=1 nosyntaxcheck;

libname hivcmp "&comparison_dir" access=readonly;

/* 3. Display the comparison and save an HTML report. */
ods listing;
ods html(id=hivreport)
    file="&comparison_dir.\hiv_comparison_report.html"
    style=htmlblue;

title "HIV Synthesis: original versus reworked output";

/*
  Compare every variable in the existing observation order.
  MAXPRINT limits the displayed differences, not the comparison.
*/
proc compare
    base=hivcmp.out_original_583297065
    compare=hivcmp.out_reworked_583297065
    method=exact
    listall
    maxprint=(10,200)
    note;
run;

/* Capture the comparison status before running another step. */
%let hiv_comparison_sysinfo = &sysinfo;
%let hiv_comparison_syserr = &syserr;

ods html(id=hivreport) close;
title;

/* 4. Write a short result to the SAS log. */
data _null_;
    if band(&hiv_comparison_sysinfo,32768) ne 0
       or &hiv_comparison_syserr > 4 then
        put "ERROR: Comparison failed. Check the SAS log.";
    else if &hiv_comparison_sysinfo = 0
        and &hiv_comparison_syserr = 0 then
        put "NOTE: No differences detected by PROC COMPARE.";
    else
        put "NOTE: Differences or warnings detected. Review the report and log.";

    put "NOTE: PROC COMPARE SYSINFO = &hiv_comparison_sysinfo";
    put "NOTE: PROC COMPARE SYSERR  = &hiv_comparison_syserr";
run;

libname hivcmp clear;
