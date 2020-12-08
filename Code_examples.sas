/* GENERATE TABLE 206x10000*/
%MACRO GENERATE_DATA();
DATA WORK.TESTDATA;
	LENGTH CHARVAR $5.;
	%DO I=1 %TO 10000;
		OBS=&I.;
		NUMVAR=RANUNI(&I.);
		AGE=RANUNI(1234);
		CHARVAR="text&I.";
		OUTPUT;
	%END;
RUN;

DATA WORK.TESTDATA2;
	LENGTH CHARVAR1 $5.;
	SET WORK.TESTDATA (RENAME=(NUMVAR=NUMVAR1 CHARVAR=CHARVAR1 AGE=AGE1));
	BY OBS;
RUN;

%DO J=1 %TO 5;
	%DO K=1 %TO 100;
		DATA WORK.TESTDATA2;
			LENGTH CHARVAR&J. $6.;
			MERGE WORK.TESTDATA2 WORK.TESTDATA (RENAME=(NUMVAR=NUMVAR&K. CHARVAR=CHARVAR&J. AGE=AGE&K.));
			BY OBS;
			NUMVAR&K.+RANUNI(&K.);
			CHARVAR&J.="TEXT&J.&K.";
		RUN;
	%END;
%END;
%MEND;
%GENERATE_DATA

/* TURN ON FULLSTIMER OPTION */
OPTIONS FULLSTIMER;

/* 1. FIND ALTERNATIVE(S) TO PROC UNIVARIATE */
	PROC UNIVARIATE DATA=WORK.TESTDATA2;
		VAR NUMVAR1;
	RUN;
	/* x200
	NOTE: PROCEDURE UNIVARIATE used (Total process time):
      real time           0.03 seconds
      user cpu time       0.01 seconds
      system cpu time     0.01 seconds
      memory              2850.87k
      OS Memory           28796.00k
      Timestamp           16/01/2020 05:34:49 PM
      Step Count                        3018  Switch Count  2
	*/

	/* ALTERNATIVE 1 - SUMS FOR ALL NUMERIC VARIABLES */
	PROC MEANS DATA=WORK.TESTDATA2 NOPRINT;
		VAR _NUMERIC_;
		OUTPUT OUT=WORK.SUMTABLE SUM=;
	RUN;
	/*
	NOTE: There were 10000 observations read from the data set WORK.TESTDATA2.
	NOTE: PROCEDURE MEANS used (Total process time):
      real time           0.18 seconds
      user cpu time       0.20 seconds
      system cpu time     0.01 seconds
      memory              9194.18k
      OS Memory           34940.00k
      Timestamp           16/01/2020 05:35:14 PM
      Step Count                        3019  Switch Count  3
	*/

	/* ALTERNATIVE 2 - SUMS FOR ALL NUMERIC VARIABLES */
	PROC TABULATE DATA=WORK.TESTDATA2 OUT=WORK.SUMTABLE;
		VAR _NUMERIC_;
		TABLE _NUMERIC_, SUM;
	RUN;
	/*
	NOTE: There were 10000 observations read from the data set WORK.TESTDATA2.
	NOTE: PROCEDURE TABULATE used (Total process time):
      real time           0.09 seconds
      user cpu time       0.06 seconds
      system cpu time     0.00 seconds
      memory              9182.15k
      OS Memory           34684.00k
      Timestamp           16/01/2020 05:37:23 PM
      Step Count                        3020  Switch Count  11
	*/

	/* ALTERNATIVE 3 - SUMS FOR ALL NUMERIC VARIABLES */
	PROC SUMMARY DATA=WORK.TESTDATA2;
		VAR _NUMERIC_;
		OUTPUT OUT=WORK.SUMTABLE SUM= / AUTONAME;
	RUN;
	/*
	NOTE: There were 10000 observations read from the data set WORK.TESTDATA2.
	NOTE: The data set WORK.SUMTABLE has 1 observations and 203 variables.
	NOTE: PROCEDURE SUMMARY used (Total process time):
	      real time           0.04 seconds
	      user cpu time       0.17 seconds
	      system cpu time     0.00 seconds
	      memory              6539.06k
	      OS Memory           33664.00k
	      Timestamp           16/01/2020 05:48:32 PM
	      Step Count                        3039  Switch Count  5
	*/

/* 2. EXEMPLIFY DO LOOP / REFERENCE TABLE / SELECT STATEMENT */
	/* Using as reference - lines of code 2167 */
	/* ORIGINAL 
		if gender=1 then do;

		if 15 <= age{t} < 20 then rred_a=rred_a_15m; 
		if 20 <= age{t} < 25 then rred_a=rred_a_20m;
		if 25 <= age{t} < 30 then rred_a=rred_a_25m;
		if 30 <= age{t} < 35 then rred_a=rred_a_30m;
		if 35 <= age{t} < 40 then rred_a=rred_a_35m;
		if 40 <= age{t} < 45 then rred_a=rred_a_40m;
		if 45 <= age{t} < 50 then rred_a=rred_a_45m;
		if 50 <= age{t} < 55 then rred_a=rred_a_50m;
		if 55 <= age{t} < 60 then rred_a=rred_a_55m;
		if 60 <= age{t} < 65 then rred_a=rred_a_60m;

		end;
	*/

	/* ALTERNATIVE 1 */
	%MACRO AGE_CONTAINERS();
		DATA WORK.OUT1;
			SET WORK.TESTDATA2;
			AGE1=AGE1*54; /* ADJUSTING AGE VALUES TO FALL UNDER THE BELOW CONDITIONS */
			SELECT;
				%DO I=15 %TO 65 %BY 5;
					WHEN (&I. <= AGE1 < &I.+5) RRED_A_&I.M=NUMVAR&I.;
				%END;
				OTHERWISE;
			END;
		RUN;
	%MEND;
	%AGE_CONTAINERS

	/* ALTERNATIVE 2 - INTRODUCE MORE AUTOMATION */
	%MACRO AGE_CONTAINERS_AUTOMATED(SELECTVAR=, T=, LB=, UP=, J=, RESULTVAR=, SUFFIX=);
		DATA WORK.OUT2;
			SET WORK.OUT1;
			SELECT;
				%DO I=&LB. %TO &UP. %BY &J.;
					WHEN (&I. <= &SELECTVAR.&T. < &I.+5) &RESULTVAR.=&RESULTVAR._&I.&SUFFIX.;
				%END;
				OTHERWISE;
			END;
		RUN;
	%MEND;
	%AGE_CONTAINERS_AUTOMATED(SELECTVAR=AGE, T=1, LB=15, UP=65, J=5, RESULTVAR=RRED_A, SUFFIX=M);

