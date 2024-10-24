

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\";

* debra spreadhseet;
* "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsm" ;

* save first as a .xlsx file ;


proc import
out=a.goals_sq 
datafile = "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\kenya\multi_model_outputs\kenya_multi_model_excel.xlsx"
dbms=xlsx replace; sheet="Goals_SQ"; 
run;

ods html;
proc print data = a.goals_sq; 
run;
ods html close;

data a.goals_sq_renamed;
    set a.goals_sq;
    rename 
        col1=year    
        col2=pop_size_m_15pl
        col3=pop_size_w_15pl
        col4=pop_size_15pl
		col5=prevalence_m_15pl
		col6=prevalence_w_15pl
		col7=prevalence_15pl
		col8=new_infection_m_15pl
		col9=new_infection_w_15pl
		col10=new_infection_15pl
		col11=p_diagnosed_m_15pl
		col12=p_diagnosed_w_15pl
		col13=p_diagnosed_15pl
		col14=p_onart_diag_m_15pl
		col15=p_onart_diag_w_15pl
		col16=p_onart_diag_15pl
		col17=p_vl1000_onart_m_15pl
		col18=p_vl1000_onart_w_15pl
		col19=p_vl1000_onart_15pl
		col20=p_women_sw_15pl
		col21=prevalence_sw
		col22=p_men_15pl_circ
		col23=p_men_15pl_vmmc
		col24=p_men_15pl_trad_circ
		col25=n_hiv_deaths_m_15pl
		col26=n_hiv_deaths_w_15pl
		col27=n_hiv_deaths_15pl
		col28=n_hiv_m_15pl
		col29=n_hiv_w_15pl
		col30=n_hiv_15pl
		col31=prevalence_msm
		col32=p_men_msm
		col33=incidence_m_1524
		col34=incidence_m_15pl
		col35=incidence_w_1524
		col36=incidence_w_15pl
		col37=incidence_fsw
		col38=incidence_msm
		col39=incidence_kp1
		col39=incidence_kp2
		col40=incidence_15pl
		col41=n_onart_15pl
		col42=n_prep_w
		col43=n_prep_m
		col43=n_prep
		col44=yll
		col45=n_hiv_014
		col46=new_infection_014
		col47=n_hiv_deaths_014
		col48=n_tests;
		col49=n_condoms
        ;
run;



ods html;
proc print data = a.goals_sq_renamed; 
run;
ods html close;



















*Created: 03 July 2023;
*Last update: 12 Sept 2024;
*Aim: import output and compare findings across models of scenarios shared with me:
	- essential
	- essential + oral TDF in AGYW
5 MODELS
- EMOD 									(100-130)
- GOALS									(200-230)
- OPTIMA 								(300-330)
- POPART-IBM (updated results provided) (400-430)
- SYNTHESIS 							(500-530)

Check the excel sheets name and that all the sheets have the variable year

*********  TABLE OF CONTENTS  *********
- Import       					Line 29
- Stock        					Line 368
- Flow         					Line 541
- Large dataset created			Line 1164
- Line graphs over time for minimal and status quo 		Line 1233 
- Line graphs over time showing ScaleOfInterventions	Line 1823

- Graphs oral PreP in AGYW  	Line 1116
- Bar chart with deaths averted Line 1586;



* Set library and path names;
libname a 'C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\MIHPSA Zimbabwe\Phase 2 - Comparison\Results\SASdata';run;
%let pth_new= C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\MIHPSA Zimbabwe\Phase 2 - Comparison\Results;run;

* Delete all datasets in library a;
proc datasets lib=a kill nolist;
quit;

* Delete all datasets in work library;
proc datasets lib=work kill nolist;
quit;




/*******************************************************************************/
/*******************              IMPORT              **************************/
/*******************************************************************************/

***Note: the excel files need to be closed for the import to work;

*First letter indicates the model,
 the number indicates the sceanrio (sorry they do not correspond to our numbers anymore)
 FL stands for FLOW, ST stands for STOCK
 The numbers below come from the sheet "Instructions" in the excel file "Output template MIHPSAZimP2_20240116.xls"

0   Status quo
1   Minimal/Essential

2	Self-test kits distributed (Primary distribution)
3	Self-test kits distributed (Secondary distribution, excluding for partners)
4	Self-test kits distributed (Secondary distribution, for sexual partners)
5	Clients tested for HIV at facility, excluding ANC & PD, infant testing, contacts testing for HIV at the facility and testing of FSW without SYMPTOMS
6	Newly diagnosed HIV positive clients tested for recent infection + community testing in hotspot areas -- OPTIONAL (agreed on call 13th Aug 24)
7	Contacts tested for HIV at the facility -- OPTIONAL (agreed on call 13th Aug 24)

8	HIV P&T program targeting FSWf
9	HIV P&T program targeting gay and bisexual men having sex with men (GBMSM)f
10	Social and behavioral change communication (SBCC)
11	Condom mass media campaign
12	General population men’s health clinics (for men from the general population)
13	VMMC in 15-49 years old

14	Oral TDF/FTC PrEP for AGWY
15	Oral TDF/FTC PrEP for FSW
16	Oral TDF/FTC PrEP for sero-discordant couples
17	Oral TDF/FTC PrEP for MSM
18	Oral TDF/FTC PrEP for pregnant and breastfeeding women 

19	Dapivirine ring for AGYW
20	Dapivirine ring for FSW
21	Dapivirine ring for sero-discordant couples
22	Dapivirine ring for pregnant and breastfeeding women 

23	Injectable PrEP for AGYW
24	Injectable PrEP for FSW
25	Injectable PrEP for Sero-discordant couples
26	Injectable PrEP for MSM
27	Injectable PrEP for pregnant and breastfeeding women 

28	Adherence and retention support for adolescents and young people LWHIV
29	Adherence support for adults
30	Retention support for adults

In theory all the models should provide the excel spreadsheet in exactly the same format,
as indicated in the file "Output template MIHPSAZimP2_20240116",
in the folder 
"C:\Users\Valentina\Dropbox (UCL)\hiv synthesis ssa unified program\MIHPSA Zimbabwe\Phase 2 - Comparison"
in practice there is variability;



*Define macro variables;
%let model_names = EMOD GOALS OPT POP SYN;					/* Define model names */

%let option_name_list =										/* Define options names */
SQ				Min		
ST_PD			ST_SDNonP		ST_SDPart
FACNoSym		COMRecInf		FACIndex
FSWprog			MSMprog
SBCC			CMMC			GPMHC			VMMC
OPrEPF1524		OPrEPFSW		OPrEPSDC		OPrEPMSM		OPrEPPLW
RPrEPF1524		RPrEPFSW		RPrEPSDC		RPrEPPLW
IPrEPF1524		IPrEPFSW		IPrEPSDC		IPrEPMSM		IPrEPPLW
AdoSupp			AdhSupp			RetSupp
;

%let emod_options = 01 14;									/* Define list of options for each model */
%let goals_options = 01 02 05 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30;
/*%put &goals_options;*/
%let optima_options = 00 01 02 08 09 10 11 14 15 17 19 20 23 24 26 28 29 30;		* Will need to add option 13;
/*%put &optima_options;*/
%let popart_options = 00 01 10 11 13 14 16 19 21 23 25;	
%let synthesis_options = 00 01 02 04 08 11 14 15 16 18 19 20 21 22 23 24 25 27;	




* IMPORT DATA;
***EMOD;
PROC IMPORT OUT=a.EMOD_01_FL DATAFILE= "&pth_new\MIHPSAZimP2_EMOD.xlsx" dbms=xlsx REPLACE; sheet="Ess_FLOW"; RUN;
PROC IMPORT OUT=a.EMOD_01_ST DATAFILE= "&pth_new\MIHPSAZimP2_EMOD.xlsx" dbms=xlsx REPLACE; sheet="Ess_STOCK"; RUN;
PROC IMPORT OUT=a.EMOD_14_FL DATAFILE= "&pth_new\MIHPSAZimP2_EMOD.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_F1524_FLOW"; RUN;
PROC IMPORT OUT=a.EMOD_14_ST DATAFILE= "&pth_new\MIHPSAZimP2_EMOD.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_F1524_STOCK"; RUN;


***GOALS;
*!!!! Remove rows 1 and 3-7 from new output spreadsheet. Columns headings are in row 2;
* No SQ;
PROC IMPORT OUT=a.GOALS_01_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="Min_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_01_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="Min_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_02_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="T_HIVST_FLOW";  RUN;			* Combined self-testing programme;
PROC IMPORT OUT=a.GOALS_02_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="T_HIVST_STOCK";  RUN;			* Combined self-testing programme;
PROC IMPORT OUT=a.GOALS_05_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="T_FACNOSYMPT_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_05_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="T_FACNOSYMPT_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_07_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="T_IndexFAC_FLOW";  RUN;			* NB. 3 testing interventions have same outputs copied;
PROC IMPORT OUT=a.GOALS_07_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="T_IndexFAC_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_08_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="FSWprog_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_08_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="FSWprog_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_09_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="MSMprog_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_09_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="MSMprog_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_10_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="SBCC_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_10_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="SBCC_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_11_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CMMC_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_11_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CMMC_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_12_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="GPMHC_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_12_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="GPMHC_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_13_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="VMMC_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_13_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="VMMC_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_14_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_F1524_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_14_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_F1524_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_15_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_FSW1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_15_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_FSW1599_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_16_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_SDCA1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_16_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_SDCA1599_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_17_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_MSM1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_17_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_MSM1599_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_18_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_pregnbfF1549_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_18_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_pregnbfF1549_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_19_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_F1524_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_19_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_F1524_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_20_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="DVPPrEP_FSW1599_FLOW";  RUN;	* Note DPV is misspelt as DVP in output spreadsheet;
PROC IMPORT OUT=a.GOALS_20_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="DVPPrEP_FSW1599_STOCK";  RUN;	* Note DPV is misspelt as DVP in output spreadsheet;
PROC IMPORT OUT=a.GOALS_21_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_SDCA1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_21_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_SDCA1599_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_22_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_pregnbfF1549_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_22_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_pregnbfF1549_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_23_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_F1524_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_23_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_F1524_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_24_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_FSW1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_24_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_FSW1599_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_25_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_SDCA1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_25_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_SDCA1599_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_26_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_MSM1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_26_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_MSM1599_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_27_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_pregnbfF1549_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_27_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_pregnbfF1549_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_28_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="ADH_RET_SUPP_A1019_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_28_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="ADH_RET_SUPP_A1019_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_29_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="ADH_SUPP_A1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_29_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="ADH_SUPP_A1599_STOCK";  RUN;
PROC IMPORT OUT=a.GOALS_30_FL DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="RET_SUPP_A1599_FLOW";  RUN;
PROC IMPORT OUT=a.GOALS_30_ST DATAFILE= "&pth_new\MIHPSAZimP2_GOALS.xlsx" dbms=xlsx REPLACE; sheet="RET_SUPP_A1599_STOCK";  RUN;

***OPTIMA;	
*!!!! Remove spaces from excel sheets titles, e.g. change "Essential+FSW programs_FLOW" to "Essential+FSWprograms_FLOW";
* Outputs split into two sheets: 
	MIHPSAZimP2_OPTIMA_1: 
		Essential, StatusQuo_FLOW, 
		Essential+Self-testing_FLOW
		Essential+FSWprograms_FLOW, Essential+MSMprograms_STOCK, 
		Essential+Condoms_FLOW, 			<<<< QUERY - CHECK WHICH INTERVENTION THIS IS >>>>
		Essential+OralPrEPAGYW_FLOW, Essential+OralPrEPFSW_FLOW, Essential+OralPrEPMSM_FLOW, 
		Essential+DPVringAGYW_FLOW, Essential+DPVringFSW_FLOW, 
		Essential+LAPrEPAGYW_FLOW, 
		Essential+LAPrEPFSW_FLOW, 
		Essential+LAPrEPMSM_FLOW, 
	MIHPSAZimP2_OPTIMA_2:
		Essential+SBCC_FLOW,
		Essential+CMMC_FLOW,
		Essential+VMMC15-19_FLOW			<<<< QUERY - CHECK IF CAN COMBINE >>>>
		Essential+VMMC20-24_FLOW
		Essential+VMMC25-34_FLOW
		Essential+VMMC35-49_FLOW
		Essential+AdherenceAdults_FLOW, 
		Essential+RetentionAdults_FLOW,
		Essential+AdhAdolescents_FLOW,
		Essential+InfantTesting_FLOW		<<<< QUERY - CHECK IF IN MINIMAL >>>>
		Essential+RoutineVLmonitoring_F,	<<<< QUERY - CHECK WHICH INTERVENTION THIS IS >>>> 
		Essential+HTS_ANC_&_PD_FLOW			<<<< QUERY - CHECK WHICH INTERVENTION THIS IS >>>>
;

PROC IMPORT OUT=a.OPT_00_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="StatusQuo_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_00_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="StatusQuo_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_01_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_01_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_02_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+Self-testing_FLOW"; RUN;			*Combined self-testing programme;
PROC IMPORT OUT=a.OPT_02_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+Self-testing_STOCK"; RUN;			*Combined self-testing programme;
PROC IMPORT OUT=a.OPT_08_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+FSWprograms_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_08_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+FSWprograms_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_09_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+MSMprograms_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_09_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+MSMprograms_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_10_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE; sheet="Essential+SBCC_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_10_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE; sheet="Essential+SBCC_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_11_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE; sheet="Essential+CMMC_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_11_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE; sheet="Essential+CMMC_STOCK"; RUN;
* VMMC (#13) - which one? ;
PROC IMPORT OUT=a.OPT_14_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+OralPrEPAGYW_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_14_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+OralPrEPAGYW_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_15_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+OralPrEPFSW_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_15_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+OralPrEPFSW_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_17_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+OralPrEPMSM_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_17_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+OralPrEPMSM_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_19_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+DPVringAGYW_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_19_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+DPVringAGYW_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_20_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+DPVringFSW_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_20_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+DPVringFSW_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_23_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+LAPrEPAGYW_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_23_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+LAPrEPAGYW_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_24_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+LAPrEPFSW_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_24_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+LAPrEPFSW_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_26_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE; sheet="Essential+LAPrEPMSM_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_26_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_1.xlsx" dbms=xlsx REPLACE;sheet="Essential+LAPrEPMSM_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_28_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE; sheet="Essential+AdhAdolescents_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_28_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE;sheet="Essential+AdhAdolescents_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_29_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE; sheet="Essential+AdherenceAdults_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_29_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE;sheet="Essential+AdherenceAdults_STOCK"; RUN;
PROC IMPORT OUT=a.OPT_30_FL DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE; sheet="Essential+RetentionAdults_FLOW"; RUN;
PROC IMPORT OUT=a.OPT_30_ST DATAFILE= "&pth_new\MIHPSAZimP2_OPTIMA_2.xlsx" dbms=xlsx REPLACE;sheet="Essential+RetentionAdults_STOCK"; RUN;

*Change column name "a" to "year";
%macro add_year(dataset);
	data a.&dataset; 
		set a.&dataset;
		rename A=year;
	run;
%mend;

%macro run_add_year(model,input_type,model_options);
	%local i opt_num dataset;	 						/* Create a macro variable to store the options as a list */
    %do i = 1 %to %sysfunc(countw(&model_options));	/* Loop through the options in the optima_options list */
		%let opt_num = %scan(&model_options, &i);		/* Extract each option from the list */
        %let dataset = &model._&opt_num._&input_type;	/* Create the dataset name using the model, option number and input type (stock or flow) */
        %add_year(&dataset);							/* Call the add_year macro for each dataset */
	%end;
%mend;

%run_add_year(OPT,ST,&optima_options);
%run_add_year(OPT,FL,&optima_options);
/*
proc freq data=a.opt_1_st; table year; run;
proc freq data=a.opt_1_fl; table year; run;
*/

* Change year inputs "2023-2024" to "2023";
%macro convertyear(dataset);
	data a; set a.&dataset;
		year_end=substr(Year, 6, 2);
		year_start=substr(Year, 1, 2);
		year_=cats(year_start,year_end);
		drop Year;run;
	data a.&dataset; set a;
		year=input(year_,best12.);
	run;
%mend;

%macro run_convertyear(model,model_options);
	%local i opt_num dataset;	 						/* Create a macro variable to store the options as a list */
    %do i = 1 %to %sysfunc(countw(&model_options));	/* Loop through the options in the optima_options list */
		%let opt_num = %scan(&model_options, &i);		/* Extract each option from the list */
        %let dataset = &model._&opt_num._fl;			/* Create the dataset name using the model and option number (all flow data) */
        %convertyear(&dataset);							/* Call the add_year macro for each dataset */
	%end;
%mend;

%run_convertyear(OPT,&optima_options);
/*proc freq data=a.OPT_0_FL; table year; run;*/


***POPART-IBM;
PROC IMPORT OUT=a.POP_00_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="StatusQuo_FLOW"; RUN;
PROC IMPORT OUT=a.POP_00_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="StatusQuo_STOCK"; RUN;
PROC IMPORT OUT=a.POP_01_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Min_FLOW"; RUN;
PROC IMPORT OUT=a.POP_01_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Min_STOCK"; RUN;
PROC IMPORT OUT=a.POP_10_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_SBCC_FLOW"; RUN;
PROC IMPORT OUT=a.POP_10_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_SBCC_STOCK"; RUN;
PROC IMPORT OUT=a.POP_11_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE;	sheet="Minimal_plusCondomAwareness_FLO"; RUN;		********* CHECK CONDOM AWARENESS IS THE SAME AS CMMC ********;
PROC IMPORT OUT=a.POP_11_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_plusCondomAwareness_STO"; RUN;
PROC IMPORT OUT=a.POP_13_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_VMMC_FLOW"; RUN;						* 25/9: Mike was planning to add testing to VMMC initiation but we agreed to omit;
PROC IMPORT OUT=a.POP_13_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_VMMC_STOCK"; RUN;
PROC IMPORT OUT=a.POP_14_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_TDFPrEP_F1524_FLOW"; RUN;
PROC IMPORT OUT=a.POP_14_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_TDFPrEP_F1524_STOCK"; RUN;
PROC IMPORT OUT=a.POP_16_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_TDFPrEP_SDCA1599_FLOW"; RUN;
PROC IMPORT OUT=a.POP_16_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_TDFPrEP_SDCA1599_STOCK"; RUN;
PROC IMPORT OUT=a.POP_19_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_DPVPrEP_F1524_FLOW"; RUN;
PROC IMPORT OUT=a.POP_19_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_DPVPrEP_F1524_STOCK"; RUN;
PROC IMPORT OUT=a.POP_21_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_DPVPrEP_SDCF1599_FLOW"; RUN;
PROC IMPORT OUT=a.POP_21_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_DPVPrEP_SDCF1599_STOCK"; RUN;
PROC IMPORT OUT=a.POP_23_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_CABPrEP_F1524_FLOW"; RUN;
PROC IMPORT OUT=a.POP_23_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_CABPrEP_F1524_STOCK"; RUN;
PROC IMPORT OUT=a.POP_25_FL DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_CABPrEP_SDCA1599_FLOW"; RUN;
PROC IMPORT OUT=a.POP_25_ST DATAFILE= "&pth_new\MIHPSAZimP2_PopART-IBM.xlsx" dbms=xlsx REPLACE; sheet="Minimal_CABPrEP_SDCA1599_STOCK"; RUN;
 
*Change column name "a" to "year";
%run_add_year(POP,ST,&popart_options);
%run_add_year(POP,FL,&popart_options);
/*proc contents data=a.pop_00_ST; run;*/
/*proc contents data=a.pop_00_FL; run;*/

* Change year inputs "2023-2024" to "2023";
%run_convertyear(POP,&popart_options);
/*proc freq data=a.pop_00_fl; table year; run;*/


***SYNTHESIS;
PROC IMPORT OUT=a.SYN_00_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="Base_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_00_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="Base_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_01_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="Min_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_01_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="Min_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_02_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="T_HIVST_PD_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_02_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="T_HIVST_PD_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_04_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="T_HIVST_SDPARTNER_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_04_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="T_HIVST_SDPARTNER_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_08_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="T_FSWTestprog_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_08_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="T_FSWTestprog_STOCK"; RUN;
/*PROC IMPORT OUT=a.SYN_10_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="SBCC_FLOW"; RUN;*/	* Not in latest spreadsheet;
/*PROC IMPORT OUT=a.SYN_10_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="SBCC_STOCK"; RUN;*/
PROC IMPORT OUT=a.SYN_11_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CMMC_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_11_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CMMC_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_14_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_F1524_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_14_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_F1524_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_15_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_FSW1599_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_15_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_FSW1599_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_16_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_SDCA1599_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_16_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_SDCA1599_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_18_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_pregnbfF1549_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_18_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="TDFPrEP_pregnbfF1549_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_19_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_F1524_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_19_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_F1524_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_20_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_FSW1599_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_20_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_FSW1599_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_21_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_SDCF1599_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_21_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_SDCF1599_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_22_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_pregnbfF1549_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_22_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="DPVPrEP_pregnbfF1549_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_23_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_F1524_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_23_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_F1524_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_24_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_FSW1599_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_24_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_FSW1599_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_25_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_SDCA1599_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_25_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_SDCA1599_STOCK"; RUN;
PROC IMPORT OUT=a.SYN_27_FL DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_pregnbfF1549_FLOW"; RUN;
PROC IMPORT OUT=a.SYN_27_ST DATAFILE= "&pth_new\MIHPSAZimP2_SYNTHESIS.xlsx" dbms=xlsx REPLACE; sheet="CABPrEP_pregnbfF1549_STOCK"; RUN;


ods html close;
ods listing;
run;

/*
*Output of interest (over calendar year):
- NTDFPrEPinit_F1524_M: 		Number of females 15-24 years old initiated for the first time on oral TDF/FTC
- P_TDFPrEP_ElevRiskF1524_M:	% of adolescent and young females (15-24 years old) at elevated risk on Oral TDF/FTC PrEP
- HIVIncid_A1549_M:				HIV incidence in 15-49 years old adults


*Targets
PrEP_New: Number of clients initiating the indicated PrEP method(s) for the first time during the date range displayed.
PrEP_CT: Number of clients actively taking the indicated PrEP method(s) (excluding newly enrolled) during the last quarter of the date range displayed
*/



/****************************************************************************/
*****			 COLLECT ALL OUTPUT VARIABLES INTO ONE DATASET 			*****;
/****************************************************************************/

*Check that stock sheets have "year" in the first row (usually it is the first column);
*QUERY - some outputs not in all output templates - eg OPTIMA has used old template and SYNTHESIS? only has variables that are filled in ;

* Define lists of variables that we keep for figures / analysis / costing;
%let keep_stock_var = 
		year  					
		NAlive_M1599_M 			NAlive_F1599_M				NAlive_A1599_M				NAlive_A014_M
		NAlive_A1524_M			NAlive_F1524_M				NAlive_M1524_M			
		NAlive_F2549_M			NAlive_M2549_M 
		NAlive_FSW1599_M		NAlive_FSW1599_95LL			NAlive_FSW1599_95UL
		NAlive_MSM1599_M		NAlive_MSM1599_95LL			NAlive_MSM1599_95UL
		Nalive_NEGInSDA1599_M								Nalive_NEGInSDF1599_M
		Nalive_NEGInSDNotOnARTA1599_M						Nalive_NEGInSDNotOnARTF1599_M
		NHIV_M1599_M			NHIV_M1599_95LL				NHIV_M1599_95LL
		NHIV_M1599_M			NHIV_F1599_95LL				NHIV_F1599_95LL
		NHIV_A014_M				NHIV_A014_95LL				NHIV_A014_95LL
		NHIV_A1599_M
		NHIV_M1524_M			NHIV_F1524_M				NHIV_M2549_M				NHIV_F2549_M	/* no CIs for NHIV_M1524_M, NHIV_F1524_M, NHIV_M2549_M, NHIV_F2549_M */
		NHIV_FSW1599_M 			NHIV_FSW1599_LL  			NHIV_FSW1599_UL 			/*NB NHIV_FSW1599_LL and NHIV_FSW1599_UL misnamed without 95 in output template */
		NHIV_MSM1599_M			NHIV_MSM1599_95LL			NHIV_MSM1599_95UL
		P_DIAG_A1599_M 			P_DIAG_F1599_M				P_DIAG_M1599_M				P_DIAG_F1524_M
		P_DIAG_FSW1599_M		P_DIAG_MSM1599_M
		P_onART_HIVA1599_M  	P_onART_HIVM1599_M			P_onART_HIVF1599_M			P_onART_HIVA014_M
		P_onART_HIVFSW1599_M	P_onART_HIVMSM1599_M
		P_onART_DiagA1599_M		P_onART_DiagM1599_M			P_onART_DiagF1599_M			
		P_onART_DiagA014_M		P_onART_DiagA1524_M
		P_onART_DiagF1524_M		P_onART_DiagFSW1599_M		P_onART_DiagMSM1599_M
		P_VLS_onARTA1599_M		P_VLS_onARTA1524_M			P_VLS_onARTA014_M			P_VLS_onARTpregEBirthF1524_M
		NOnART_A1599_M 			NOnART_M1599_M 				NOnART_F1599_M 				NOnART_A014_M
		P_TDFPrEP_ElevRiskF1524_M  	CIRC_PREV_M1549_M		CIRC_PREV_M1549_95LL		CIRC_PREV_M1549_95UL
		P_CONDOMLAST_M1599_M	P_CONDOMLAST_F1599_M		
		P_CONDOMLAST_F1524_M	P_CONDOMLAST_FSW1599_M		P_CONDOMLAST_MSM1599_M		
		P_CLS3m_M1599_M			P_CLS3m_F1599_M
		P_CLS3m_F1524_M			P_CLS3m_FSW_M				P_CLS3m_MSM_M
		NHIV_A1599_NoART_CD4500pl_M			NHIV_A1599_NoART_CD4350499_M
		NHIV_A1599_NoART_CD4200349_M		NHIV_A1599_NoART_CD450199_M			NHIV_A1599_NoART_CD4050_M
		NHIV_A014_NoART_CD4500pl_M			NHIV_A014_NoART_CD4350499_M
		NHIV_A014_NoART_CD4200349_M			NHIV_A014_NoART_CD450199_M			NHIV_A014_NoART_CD4050_M
		YLD_A1599_				YLD_A014_					P_CD4050_CD40200_
		Cost_OnART_A1599_M		Cost_OnART_A014_M			Cost_OnART_A099_M
;

%let keep_flow_var = 
		year 	
		HIVIncid_A1549_M 				HIVIncid_F1549_M				HIVIncid_M1549_M
		HIVIncid_F1549_M				HIVIncid_F1524_M				HIVIncid_FSW1599_M
		HIVIncid_SDCA1599_M				HIVIncid_SDCF1599_M				HIVIncid_MSM1599_M
		HIVIncid_pregbfF1549_M			/*HIVIncid_A014_M	* do not list here as calculated after keep statement */
		NHIVInf_A1549_M 				NHIVInf_A1549_95LL				NHIVInf_A1549_95UL	
		NHIVInf_F1549_M					NHIVInf_F1524_M					NHIVInf_A014_M
		TOTDeaths_A1599_M				TOTDeaths_A1599_95LL			TOTDeaths_A1599_95UL
		TOTDeaths_M1599_M				TOTDeaths_M1599_95LL			TOTDeaths_M1599_95UL	
		TOTDeaths_F1599_M				TOTDeaths_F1599_95LL			TOTDeaths_F1599_95UL
		AIDSDeaths_A1599_M
		TOTTests_M1599_M				TOTTests_F1599_M				TOTTests_A1599_M
		TOTTests_A014_M
		TOTPosTests_M1599_M				TOTPosTests_F1599_M				TOTPosTests_A014_M
		TOTHIVST_M1599_M				TOTHIVST_F1599_M 				TOTHIVST_A1599_M
		TOTHIVST_A014_M
		Ntested_ANCPD_F1599_M 			Ntests_ANCPD_F1599_M 			NPosTests_ANCPD_F1599_M	
		Ntests_FACSYMPT_A1599_M			Ntests_FACSYMPT_F1599_M			Ntests_FACSYMPT_M1599_M
		Ntested_FSWprog_FSW1599_M		Ntests_FSW1599_M				
		Ntested_MSMprog_MSM1599_M		Ntests_MSM1599_M
		NFSWprog_FSW1599_M				NMSMprog_MSM1599_M 				NSBCC_A1599_M 	
		NCUPP_A1599_M					NGPMHC_M1599_M					NVMMC_M1549_M 

		NTDFPrEPinit_F1524_M			NTDFPrEPinit_FSW1599_M			NTDFPrEPinit_SDCA1599_M
		NTDFPrEPinit_MSM1599_M 			NTDFPrEPinit_pregbfF1549_M  		
		NDPVPrEPinit_F1524_M 			NDPVPrEPinit_FSW1599_M 			NDPVPrEPinit_SDCF1599_M 			
										NDPVPrEPinit_pregbfF1549_M 
		NCABPrEPinit_F1524_M 			NCABPrEPinit_FSW1599_M 			NCABPrEPinit_SDCA1599_M 			
		NCABPrEPinit_MSM1599_M 			NCABPrEPinit_pregbfF1549_M  		

		NTDFPrEP_F1524_M				NTDFPrEP_FSW1599_M				NTDFPrEP_SDCA1599_M
		NTDFPrEP_MSM1599_M 				NTDFPrEP_pregbfF1549_M  		
		NDPVPrEP_F1524_M 				NDPVPrEP_FSW1599_M 				NDPVPrEP_SDCF1599_M 			
										NDPVPrEP_pregbfF1549_M 
		NCABPrEP_F1524_M 				NCABPrEP_FSW1599_M 				NCABPrEP_SDCA1599_M 			
		NCABPrEP_MSM1599_M 				NCABPrEP_pregbfF1549_M  		

		/* QUERY - PrEP CT variables not in earlier spreadsheet so not all models have produced these */
		NTDFPrEPCT_F1524_M				NTDFPrEPCT_FSW1599_M			NTDFPrEPCT_SDCA1599_M	
		NTDFPrEPCT_MSM1599_M			NTDFPrEPCT_pregbfF1549_M		
		NDPVPrEPCT_F1524_M				NDPVPrEPCT_FSW1599_M			NDPVPrEPCT_SDCF1599_M
										NDPVPrEPCT_pregbfF1549_M
		NCABPrEPCT_F1524_M				NCABPrEPCT_FSW1599_M			NCABPrEPCT_SDCA1599_M
		NCABPrEPCT_MSM1599_M			NCABPrEPCT_pregbfF1549_M

		NTDFPrEPEver_F1524_M			NTDFPrEPEver_FSW1599_M			NTDFPrEPEver_SDCA1599_M
		NTDFPrEPEver_MSM1599_M 			NTDFPrEPEver_pregbfF1549_M  		
		NDPVPrEPEver_F1524_M 			NDPVPrEPEver_FSW1599_M 			NDPVPrEPEver_SDCF1599_M 			
										NDPVPrEPEver_pregbfF1549_M 
		NCABPrEPEver_F1524_M 			NCABPrEPEver_FSW1599_M 			NCABPrEPEver_SDCA1599_M 			
		NCABPrEPEver_MSM1599_M 			NCABPrEPEver_pregbfF1549_M  		

		P_TDFPrEP_ElevRiskF1524_M
		NPMTCT_FbirthHIV1599_M 

		/* QUERY - YLL outputs not in earlier spreadsheet so not all models have produced these */
		YLL_AgeGenLifeExpect_A1599_M   	YLL_AgeGenLifeExpect_A014_M
		Cost_ANCPD_F1599_M				Cost_FACSYMPT_A1599_M			Cost_condoms_A1599_M
		Cost_CUPP_A1599_M				Cost_PMTCT_FbirthHIV1599_M		Cost_TFSWprog_F1599_M	
		Cost_TMSMprog_F1599_M			Cost_VMMC_M1549_M 				Cost_TDFPrEP_F1524_M
		Cost_TDFPrEP_FSW1599_M			Cost_TDFPrEP_SDCA1599_M			Cost_TDFPrEP_MSM1599_M
		Cost_TDFPrEP_pregbfF1549_M		Cost_DPVPrEP_F1524_M			Cost_DPVPrEP_FSW1599_M
		Cost_DPVPrEP_SDCF1599_M			Cost_DPVPrEP_pregbfF1549_M		Cost_CABPrEP_F1524_M
		Cost_CABPrEP_FSW1599_M			Cost_CABPrEP_SDCA1599_M			Cost_CABPrEP_MSM1599_M
		Cost_CABPrEP_pregbfF1549_M
		Cost_test 						Cost_mixprev					Cost_TDFPrEP
		Cost_DPVPrEP					Cost_CABPrEP					Tot_cost_flow
;


* Set up empty dataset to add outputs to;
data a.large;
    do year = 2023 to 2072;
        output; 	/* Write each year to the dataset */
    end;
run;


* Define macro to extract variables from imported file, add model-output specific label and save in workspace;
%macro keep_var(model_abbr,dataset_st,dataset_fl,s);

	* Define model number and model-option code;
	%if &model_abbr = emod %then %let m=1;
	%if &model_abbr = goals %then %let m=2;
	%if &model_abbr = opt %then %let m=3;
	%if &model_abbr = pop %then %let m=4;
	%if &model_abbr = syn %then %let m=5;

	%let ms = &m.&s;

	* Stock variables;
	data &dataset_st; 
		set a.&dataset_st;

		* Convert units for some model outputs;
/*		if &model = 'GOALS' or &model = 'EMOD' then do;*/
		if &ms ge 100 and &ms lt 300 then do;				*EMOD and GOALS;
			P_DIAG_A1599_M 			= P_DIAG_A1599_M/100;
			P_DIAG_F1599_M 			= P_DIAG_F1599_M/100;
			P_DIAG_M1599_M 			= P_DIAG_M1599_M/100;
			P_DIAG_F1524_M 			= P_DIAG_F1524_M/100;
			P_DIAG_FSW1599_M 		= P_DIAG_FSW1599_M/100;
			P_DIAG_MSM1599_M 		= P_DIAG_MSM1599_M/100;
			P_onART_HIVA1599_M 		= P_onART_HIVA1599_M/100;
			P_onART_HIVM1599_M 		= P_onART_HIVM1599_M/100;
			P_onART_HIVF1599_M 		= P_onART_HIVF1599_M/100;
			P_onART_HIVA014_M 		= P_onART_HIVA014_M/100;
			P_onART_HIVFSW1599_M 	= P_onART_HIVFSW1599_M/100;
			P_onART_HIVMSM1599_M 	= P_onART_HIVMSM1599_M/100;
			P_onART_DiagA1599_M 	= P_onART_DiagA1599_M/100;
			P_onART_DiagM1599_M 	= P_onART_DiagM1599_M/100;
			P_onART_DiagF1599_M 	= P_onART_DiagF1599_M/100;
			P_onART_DiagA014_M 		= P_onART_DiagA014_M/100;
			P_onART_DiagA1524_M 	= P_onART_DiagA1524_M/100;
			P_onART_DiagF1524_M 	= P_onART_DiagF1524_M/100;
			P_onART_DiagFSW1599_M 	= P_onART_DiagFSW1599_M/100;
			P_onART_DiagMSM1599_M 	= P_onART_DiagMSM1599_M/100;
			P_VLS_onARTA1599_M 		= P_VLS_onARTA1599_M/100;
			P_VLS_onARTA1524_M 		= P_VLS_onARTA1524_M/100;
			P_VLS_onARTA014_M 		= P_VLS_onARTA014_M/100;
			P_VLS_onARTpregEverBirthF1524_M 	= P_VLS_onARTpregEverBirthF1524_M/100;
		end;

/*		if &model = 'GOALS' then do;*/
		if &ms ge 200 and &ms lt 300 then do;				*GOALS;
			CIRC_PREV_M1549_M 		= CIRC_PREV_M1549_M/100;
			CIRC_PREV_M1549_95LL 	= CIRC_PREV_M1549_95LL/100;
			CIRC_PREV_M1549_95UL 	= CIRC_PREV_M1549_95UL/100;
			P_CONDOMLAST_M1599_M	= P_CONDOMLAST_M1599_M/100;
			P_CONDOMLAST_F1599_M	= P_CONDOMLAST_F1599_M/100;
			P_CONDOMLAST_F1524_M	= P_CONDOMLAST_F1524_M/100;
			P_CONDOMLAST_FSW1599_M	= P_CONDOMLAST_FSW1599_M/100;
			P_CONDOMLAST_MSM1599_M	= P_CONDOMLAST_MSM1599_M/100;
			P_CLS3m_M1599_M			= P_CLS3m_M1599_M/100;
			P_CLS3m_F1599_M			= P_CLS3m_F1599_M/100;
			P_CLS3m_F1524_M			= P_CLS3m_F1524_M/100;
			P_CLS3m_FSW_M			= P_CLS3m_FSW_M/100;
			P_CLS3m_MSM_M			= P_CLS3m_MSM_M/100;
		end;

		* Shorten variable names that are too long;
		rename P_VLS_onARTpregEverBirthF1524_M = P_VLS_onARTpregEBirthF1524_M;

		* Calculate additional outputs;
		NAlive_A1599_M = NAlive_M1599_M + NAlive_F1599_M;
		NAlive_A1524_M = NAlive_M1524_M + NAlive_F1524_M;
		NHIV_A1599_M = NHIV_M1599_M + NHIV_F1599_M;

		* Calculate YLD;
		YLD_A1599_ =	(NHIV_A1599_NoART_CD4500pl_M*0.01)		+ (NHIV_A1599_NoART_CD4350499_M*0.025) +
					   	(NHIV_A1599_NoART_CD4200349_M*0.081)	+ (NHIV_A1599_NoART_CD450199_M*0.289) +
					   	(NHIV_A1599_NoART_CD4050_M*0.582)		+ (NOnART_A1599_M*0.078);
		YLD_A014_ = 	(NHIV_A014_NoART_CD4500pl_M*0.01)		+ (NHIV_A014_NoART_CD4350499_M*0.025) +
					  	(NHIV_A014_NoART_CD4200349_M*0.081) 	+ (NHIV_A014_NoART_CD450199_M*0.289) +
					  	(NHIV_A014_NoART_CD4050_M*0.582)    	+ (NOnART_A014_M)*0.078;

		P_CD4050_CD40200_ = NHIV_A1599_NoART_CD4050_M / (NHIV_A1599_NoART_CD4050_M + NHIV_A1599_NoART_CD450199_M); 

		* Calculate costs;
		Cost_OnART_A1599_M =	sum(NOnART_M1599_M,NOnART_F1599_M)*113.75;
		Cost_OnART_A014_M =		NOnART_A014_M*113.75;
		Cost_OnART_A099_M = 	sum(Cost_OnART_A1599_M,Cost_OnART_A014_M);

		* Rename variables to add &ms;
	    %do i = 2 %to %sysfunc(countw(&keep_stock_var));	/* Loop through the variable names in the keep_stock_var list except year */
			%let var_name = %scan(&keep_stock_var, &i);
			rename &var_name = &var_name.&ms;
		%end;

		* Keep only the variables listed in keep_stock_var;
		keep &keep_stock_var;

		* Remove rows with missing year or year outside output range 2023-2072;
		if year=. or year<2023 or year>2072 then delete;

	run;


	* Flow variables;
	data &dataset_fl; 
		set a.&dataset_fl;

		* QUERY - do we still need this section? ;
		*The following is required as the format of some variables was different in some of the excel files;
		format NTDFPrEP_F1524_M 8.;
		format NTDFPrEP_FSW1599_M 8.;
		format NTDFPrEP_SDCA1599_M 8.;
		format NTDFPrEP_MSM1599_M 8.;
		format NTDFPrEP_pregbfF1549_M 8.;
		format NDPVPrEP_F1524_M 8.;
		format NDPVPrEP_FSW1599_M 8.;
		format NDPVPrEP_SDCF1599_M 8.;
		format NDPVPrEP_pregbfF1549_M 8.;
		format NCABPrEP_F1524_M 8.;
		format NCABPrEP_FSW1599_M 8.;
		format NCABPrEP_SDCA1599_M 8.;
		format NCABPrEP_MSM1599_M 8.;
		format NCABPrEP_pregbfF1549_M 8.;
		format NSBCC_A1599_M 8.;

		* Convert units for some model outputs;
		if &ms ge 100 and &ms lt 200 then do;				*EMOD;
			P_TDFPrEP_ElevRiskF1524_M = P_TDFPrEP_ElevRiskF1524_M/100;		*NB. P_TDFPrEP_ElevRiskF1524_M is with flow outputs for EMOD but stock for other models;
		end;

		* Calculate additional outputs;
		TOTDeaths_A1599_M = TOTDeaths_M1599_M + TOTDeaths_F1599_M;
		TOTDeaths_A1599_95LL = TOTDeaths_M1599_95LL + TOTDeaths_F1599_95LL;
		TOTDeaths_A1599_95UL = TOTDeaths_M1599_95UL + TOTDeaths_F1599_95UL;
		TOTHIVST_A1599_M = TOTHIVST_M1599_M + TOTHIVST_F1599_M;
		Ntests_FACSYMPT_A1599_M = Ntests_FACSYMPT_M1599_M + Ntests_FACSYMPT_F1599_M;

		* Calculate costs;

		***General - added 10thOct2024 JAS;
		Cost_TOTtests_A099_M = 	sum(
								((TOTTests_A1599_M + TOTTests_A014_M - TOTPosTests_M1599_M - TOTPosTests_F1599_M - TOTPosTests_A014_M)*2.30),
								((TOTPosTests_M1599_M + TOTPosTests_F1599_M + TOTPosTests_A014)*5.11)
								);


		***Minimal scenario;
		*Cost estimates are sourced from file "20240208 Interventions and Progress Tracker MIHPSA_Zimbabwe.xls";
		Cost_ANCPD_F1599_M    = sum(((Ntests_ANCPD_F1599_M - NPosTests_ANCPD_F1599_M)*2.30),(NPosTests_ANCPD_F1599_M*5.11));
		*I asked the models to export NPosTests_FACSYMPT_A1599_M in January 2024;
		Cost_FACSYMPT_A1599_M = sum((Ntests_FACSYMPT_A1599_M - NPosTests_FACSYMPT_A1599_M)*2.30,(NPosTests_FACSYMPT_A1599_M*5.11));
		** ADD EID if we have model outputs / overall cost estimate;

		Cost_condoms_A1599_M = max(0,NCondoms_A1599_M*0.04);
		Cost_CUPP_A1599_M = NCUPP_A1599_M*0;*This is a placeholder (for CMMC?);
		Cost_PMTCT_FbirthHIV1599_M = max(0,NPMTCT_FbirthHIV1599_M*113.75);

		***Prevention interventions;
		*Note that the following 2 capture only the costs of testing, I asked Thami for other components;
		Cost_TFSWprog_F1599_M   = sum (((Ntests_FSW1599_M - NPosTests_FSWprog_FSW1599_M)*3.50),(NPosTests_FSWprog_FSW1599_M*6.31));
		Cost_TMSMprog_F1599_M   = sum (((Ntests_MSM1599_M - NPosTests_MSMprog_MSM1599_M)*3.50),(NPosTests_MSMprog_MSM1599_M*6.31));
		*We do not have the 2 following costs;
		*NSBCC_A1599_M;
		*Ntested_SBCC_A1599_M;
		Cost_VMMC_M1549_M = NVMMC_M1549_M*16.36;
		*Cost Per Patient Year for Oral PreP: 59.32;
		Cost_TDFPrEP_F1524_M    = NTDFPrEP_F1524_M*59.32;
		Cost_TDFPrEP_FSW1599_M  = NTDFPrEP_FSW1599_M*59.32;
		Cost_TDFPrEP_SDCA1599_M = NTDFPrEP_SDCA1599_M*59.32;
		Cost_TDFPrEP_MSM1599_M = NTDFPrEP_MSM1599_M*59.32;
		Cost_TDFPrEP_pregbfF1549_M = NTDFPrEP_pregbfF1549_M*59.32;
		*Thami did not provide the cost per patient for vaginal ring so I assumed it was the same as Oral PreP.;
		Cost_DPVPrEP_F1524_M = NDPVPrEP_F1524_M*59.32;
		Cost_DPVPrEP_FSW1599_M = NDPVPrEP_FSW1599_M*59.32;
		Cost_DPVPrEP_SDCF1599_M = NDPVPrEP_SDCF1599_M*59.32;
		Cost_DPVPrEP_pregbfF1549_M = NDPVPrEP_pregbfF1549_M*59.32;
		*Thami did not provide the cost per patient for injectable PrEP so I assumed it was double that of Oral PreP.;
		Cost_CABPrEP_F1524_M = NCABPrEP_F1524_M*59.32*2;
		Cost_CABPrEP_FSW1599_M = NCABPrEP_FSW1599_M*59.32*2;
		Cost_CABPrEP_SDCA1599_M = NCABPrEP_SDCA1599_M*59.32*2;
		Cost_CABPrEP_MSM1599_M = NCABPrEP_MSM1599_M*59.32*2;
		Cost_CABPrEP_pregbfF1549_M = NCABPrEP_pregbfF1549_M*59.32*2;

		Cost_test = sum(Cost_ANCPD_F1599_M,Cost_FACSYMPT_A1599_M,Cost_TFSWprog_F1599_M,Cost_TMSMprog_F1599_M);
		Cost_mixprev = sum(Cost_CUPP_A1599_M,Cost_condoms_A1599_M,Cost_VMMC_M1549_M);
		Cost_TDFPrEP = sum(Cost_TDFPrEP_F1524_M,Cost_TDFPrEP_FSW1599_M,Cost_TDFPrEP_SDCA1599_M,Cost_TDFPrEP_MSM1599_M,Cost_TDFPrEP_pregbfF1549_M);
		Cost_DPVPrEP = sum(Cost_DPVPrEP_F1524_M,Cost_DPVPrEP_FSW1599_M,Cost_DPVPrEP_SDCF1599_M,Cost_DPVPrEP_pregbfF1549_M);
		Cost_CABPrEP = sum(Cost_CABPrEP_F1524_M,Cost_CABPrEP_FSW1599_M,Cost_CABPrEP_SDCA1599_M,Cost_CABPrEP_MSM1599_M,Cost_CABPrEP_pregbfF1549_M);
		Tot_cost_flow =sum(Cost_test,Cost_mixprev,Cost_TDFPrEP,Cost_DPVPrEP,Cost_CABPrEP);

		* Rename variables to add &ms;
	    %do i = 2 %to %sysfunc(countw(&keep_flow_var));		/* Loop through the variable names in the keep_flow_var list except year */
			%let var_name = %scan(&keep_flow_var, &i);
			rename &var_name = &var_name.&ms;
		%end;

		* Keep only the variables listed in keep_flow_var;
		keep &keep_flow_var;

		* Remove rows with missing year or year outside output range 2023-2072;
		if year=. or year<2023 or year>2072 then delete;

	run;

	* Merge stock and flow datasets into one;
	proc sort data=&dataset_st;
		by year;
	run;

	proc sort data=&dataset_fl;
		by year;
	run;

	data &model_abbr._&s;
		merge &dataset_st &dataset_fl;
		by year;
	run;

	* Calculate incidence among children and for OPTIMA outcomes;
	* OPTIMA output is given as a number (19/9/24 version) so need to convert to a rate, using both stock and flow outputs;
	data &model_abbr._&s; set &model_abbr._&s;

		HIVIncid_A014_M&ms = 		100 * NHIVInf_A014_M&ms 	/ 	(NAlive_A014_M&ms - NHIV_A014_M&ms);;				*Calculate incidence among children;

		if &ms ge 300 and &ms lt 400 then do;				* OPTIMA;
			NHIVInf_FSW1599_M&ms = HIVIncid_FSW1599_M&ms;			* Define NHIVInf;
			NHIVInf_MSM1599_M&ms = HIVIncid_MSM1599_M&ms;
																	* Calculate incidence;
			HIVIncid_A1549_M&ms = 	100 * NHIVInf_A1549_M&ms / 
									( (NAlive_M1524_M&ms + NAlive_F1524_M&ms + NAlive_M2549_M&ms + NAlive_F2549_M&ms) 
									- (NHIV_M1524_M&ms + NHIV_F1524_M&ms + NHIV_M2549_M&ms + NHIV_F2549_M&ms) );

			HIVIncid_F1549_M&ms = 		100 * NHIVInf_F1549_M&ms	/ ( (NAlive_F1524_M&ms + NAlive_F2549_M&ms) - (NHIV_F1524_M&ms + NHIV_F2549_M&ms) );
			HIVIncid_M1549_M&ms = 		100 * NHIVInf_M1549_M&ms 	/ ( (NAlive_M1524_M&ms + NAlive_M2549_M&ms) - (NHIV_M1524_M&ms + NHIV_M2549_M&ms) );
			HIVIncid_F1524_M&ms = 		100 * NHIVInf_F1524_M&ms 	/ 	(NAlive_F1524_M&ms - NHIV_F1524_M&ms);
			HIVIncid_FSW1599_M&ms = 	100 * NHIVInf_FSW1599_M&ms 	/ 	(NAlive_FSW1599_M&ms - NHIV_FSW1599_M&ms);		* OPTIMA HIVIncid outputs given as annual number of infections so we convert to rate here;
			HIVIncid_MSM1599_M&ms = 	100 * NHIVInf_MSM1599_M&ms 	/ 	(NAlive_MSM1599_M&ms - NHIV_MSM1599_M&ms);		* OPTIMA HIVIncid outputs given as number of infections so we convert to rate here;
		end;
	run;

	* Delete stock and flow datasets from workspace;
	proc delete data=work.&dataset_st; run;
	proc delete data=work.&dataset_fl; run;

	* Add outputs to merge dataset;
	data a.large;
		merge a.large &model_abbr._&s;
		by year;
	run;

%mend;

/*%keep_var('GOALS',GOALS_18_ST,GOALS_18_FL,18);		* test example; */


* Define macro to run keep_var for each model;
%macro run_keep_var(model, model_options);
		
	%let model_abbr = &model;

	%do j = 1 %to %sysfunc(countw(&model_options));					/* Loop through the option numbers in the options list for each model */
		%let option_number = %scan(&model_options, &j);				/* Define option number */
		%let dataset_st = &model_abbr._&option_number._ST;			/* Define stock dataset name */
		%let dataset_fl = &model_abbr._&option_number._FL;			/* Define flow dataset name */
		%keep_var(&model_abbr,&dataset_st,&dataset_fl,&option_number);	/* Run keep_var for each option */
	%end;

%mend;


* Run macros;
* Note that these need to be run in order to compile a.large and empty a.large needs to be created first (QUERY - COULD SWAP TO APPEND CODE);
* May need to run these individually and slowly otherwise some options can be missed;
%run_keep_var(emod, &emod_options);			* Model name needs to be the abbreviated version to create datasets;
%run_keep_var(goals, &goals_options);
%run_keep_var(opt, &optima_options);	
%run_keep_var(pop, &popart_options);	
%run_keep_var(syn, &synthesis_options;);	

/*proc contents data=a.large; run;*/

/*proc freq data=a.large; table HIVIncid_F1549_M301; run;*/
/*proc freq data=a.large; table year; run;*/
/*proc freq data=a.large; table NAlive_A1599_M501; run;*/
/*proc contents data=opt_15; run;*/
/*proc freq data=opt_15; table NHIVInf_A1549_95LL315; run;*/
/*proc contents data=goals_15; run;*/
/*proc freq data=a.goals_15_fl; table  TOTDeaths_F1599_95LL; run;*/
/*proc freq data=a.large; table TOTDeaths_F1599_95LL215; run;*/



* Define target data for interventions;
data target;
	year=2022;
	do i=1 to 4;
		year+1;output;
	end;
	drop i;
run;

data target;set target;		*it would be at the end of the calendar year indicated;

***HIV P&T program targeting FSW;
	*# of FSW reached with the defined package of HIV combination prevention services;
	if year=2023 then target_NFSWprog=40500;	
	if year=2024 then target_NFSWprog=42750;
	if year=2025 then target_NFSWprog=42750;
	*there are targets for other outputs;

***HIV P&T program targeting MSM;
	*# of MSM reached with the defined package of HIV combination prevention services;
	if year=2023 then target_NMSMprog=13000;	
	if year=2024 then target_NMSMprog=14000;
	if year=2025 then target_NMSMprog=15000;
	*there are targets for other outputs;

***Social and behavioral change communication (SBCC);
	*# of 10-24 receiving educational assistance (i.e. DREAMS) in school and 
	   of vulnerable population (refers to peer-led model) reached with a defined package of combination prevention service;
	if year=2023 then do; target_reachedSBCC=242000; target_reachedSBCC_1024m= 93000;target_reachedSBCC_1024w= 98000;target_reachedSBCC_25ov=51000;end;
	if year=2024 then do; target_reachedSBCC=251000; target_reachedSBCC_1024m= 95000;target_reachedSBCC_1024w=100000;target_reachedSBCC_25ov=56000;end;
	if year=2025 then do; target_reachedSBCC=265000; target_reachedSBCC_1024m=100000;target_reachedSBCC_1024w=105000;target_reachedSBCC_25ov=60000;end;

***Condom mass media campaign;
	*Percentage of the whole adult popualtion reached by the condom mass media campaign
	*We asked for Number of adults 15+ years old reached by the Condom mass media campaig (NCMMC_A1599_M).
	so we could create this output to compare to the target;
	if year=2023 then target_p_reachedCMMC=0.8;	
	if year=2024 then target_p_reachedCMMC=0.8;
	if year=2025 then target_p_reachedCMMC=0.8;
	if year=2026 then target_p_reachedCMMC=0.8;

***VMMC in 15-49 years old;
	*# of Men aged 15+ years circumcised as part of the minimum package of male circumcision for HIV prevention services;
	if year=2023 then do; target_NVMMC_1549m=211526; target_CIRC_PREV_1549m=0.7; end;
	if year=2024 then do; target_NVMMC_1549m=463448; target_CIRC_PREV_1549m=0.75; end;
	if year=2025 then do; target_NVMMC_1549m=175211; target_CIRC_PREV_1549m=0.80; end;

***PrEP for AGYW
	*PrEP_New (prepinit): Number of clients initiating the indicated PrEP method(s) for the first time during the date range displayed.;
	*PrEP_CT (prep): Number of clients actively taking the indicated PrEP method(s) (excluding newly enrolled) during the last quarter of the date range displayed;
	*Currently on PrEP;
	if year=2023 then do; target_prepinit_1524w=37144; target_prepct_1524w_lq=11594; target_curr_prep_1524w =15292; end;
	if year=2024 then do; target_prepinit_1524w=41639; target_prepct_1524w_lq=22544; target_curr_prep_1524w =26125; end;
	if year=2025 then do; target_prepinit_1524w=44303; target_prepct_1524w_lq=33436; target_curr_prep_1524w =35484; end;
	if year=2026 then do; target_prepinit_1524w=45084; target_prepct_1524w_lq=42431; target_curr_prep_1524w =43443; end;

	***PrEP for FSW;
	if year=2023 then do; target_prepinit_fsw= 6960; target_prepct_fsw_lq=16638; target_curr_prep_fsw=15478; end;
	if year=2024 then do; target_prepinit_fsw= 6960; target_prepct_fsw_lq=14127; target_curr_prep_fsw=13262; end;
	if year=2025 then do; target_prepinit_fsw= 6960; target_prepct_fsw_lq=15592; target_curr_prep_fsw=14583; end;
	if year=2026 then do; target_prepinit_fsw= 6960; target_prepct_fsw_lq=16939; target_curr_prep_fsw=15746; end;

	***PrEP for SD couples;
	if year=2023 then do; target_prepinit_sdca=10149; target_prepct_sdca_lq=14388; target_curr_prep_sdca=13854; end;
	if year=2024 then do; target_prepinit_sdca=10149; target_prepct_sdca_lq=15641; target_curr_prep_sdca=16337; end;
	if year=2025 then do; target_prepinit_sdca=10149; target_prepct_sdca_lq=18520; target_curr_prep_sdca=18699; end;
	if year=2026 then do; target_prepinit_sdca=10149; target_prepct_sdca_lq=20718; target_curr_prep_sdca=20670; end;

***PrEP for MSM;
	if year=2023 then do; target_prepinit_msm=4931; target_prepct_msm_lq=4260; target_curr_prep_msm=4301; end;
	if year=2024 then do; target_prepinit_msm=4931; target_prepct_msm_lq=5518; target_curr_prep_msm=5376; end;
	if year=2025 then do; target_prepinit_msm=4931; target_prepct_msm_lq=6468; target_curr_prep_msm=6214; end;
	if year=2026 then do; target_prepinit_msm=4931; target_prepct_msm_lq=7421; target_curr_prep_msm=7043; end;

***PrEP for PLW;
	if year=2023 then do; target_prepinit_plw=18900; target_prepct_plw_lq=16144; target_curr_prep_plw=18890; end;
	if year=2024 then do; target_prepinit_plw=21187; target_prepct_plw_lq=18252; target_curr_prep_plw=21883; end;
	if year=2025 then do; target_prepinit_plw=22543; target_prepct_plw_lq=26981; target_curr_prep_plw=28938; end;
	if year=2026 then do; target_prepinit_plw=22941; target_prepct_plw_lq=32070; target_curr_prep_plw=33533; end;
run;


* Merge outputs and targets;
data a.large;
	merge a.large target;
	by year;
	*where year ge 2023;
run;



*At 31st July 2023, updated for OPTIMA POPART and SYNTHESIS on 26/2/2024, indicated as NN or YY).
I have not listed all variables.
OPTIMA did indicate in the file shared in the sheet dictionary what they can and are not able to share

STOCKS
								EMOD		GOALS	OPTIMA		POPART	SYNTHESIS
P_TDFPrEP_ElevRiskF1524_M 		Y (in flow)	N		N			Y		N

CIRC_PREV_M1549_M				N			Y		Y			Y		Y
NOnART_M1599_M					N			Y		Y			Y		Y
NOnART_F1599_M					N			Y		Y			Y		Y
NOnART_A014_M					N			Y		Y			Y		N
NOnART_A1599_M 					N			Y		Y			Y		Y
P_onART_HIVM1599_M				N			Y		Y			Y		Y
P_onART_HIVF1599_M				N			Y		Y			Y		Y
P_onART_HIVA014_M				N			Y		Y			Y		N


NHIV_A1599_NoART_CD4500pl_M		Y			Y		Y			Y		Y
NHIV_A1599_NoART_CD4350499_M 	Y			Y		Y			Y		Y
NHIV_A1599_NoART_CD4200349_M	Y			Y		Y			Y		Y
NHIV_A1599_NoART_CD450199_M 	Y			Y		Y			Y		Y
NHIV_A1599_NoART_CD4050_M		N			Y		Y			Y		Y
NHIV_A014_NoART_CD4500pl_M		Y			Y		Y			N		N
NHIV_A014_NoART_CD4350499_M 	Y			Y		Y			N		N
NHIV_A014_NoART_CD4200349_M		Y			Y		Y			N		N
NHIV_A014_NoART_CD450199_M 		Y			Y		Y			N		N
NHIV_A014_NoART_CD4050_M		N			Y		Y			N		N
NHIV_A014_M											Y			Y		N


FLOWS
									EMOD	GOALS	OPTIMA		POPART		SYNTHESIS
year 								Y		Y		YY (2022-23)Y (2022-23)	Y
HIVIncid_A1549_M&s	 				Y		Y		YY			Y			Y
NHIVInf_A1549_M 					N		Y		YY			Y			Y
TOTDeaths_A1599_M&s					N		Y		YY			Y			Y
	(=TOTDeaths_M1599_M + TOTDeaths_F1599_M)
TOTTests_M1599_M					N		N		NN			N			Y
TOTTests_F1599_M					N		N		NN			N			Y
TOTHIVST_M1599_M	 				N		N		NN			N			N
TOTHIVST_F1599_M					N		N		NN			N			N
NPosTests_ANCPD_F1599_M								NN
Ntested_ANCPD_F1599_M 				N		N		NN			N			Y
Ntests_ANCPD_F1599_M 				N		N		NN			N			Y
Ntests_FACSYMPT_A1599_M&s			N		N		NN			N			Y
	(= Ntests_FACSYMPT_M1599_M + Ntests_FACSYMPT_F1599_M)
NFSWprog_FSW1599_M					N		Y		NN			N			N
NMSMprog_MSM1599_M 					N		Y		NN			N			N
NSBCC_A1599_M 						N		N		NN			N			N
NCUPP_A1599_M						N		Y		NN			N			N
NGPMHC_M1599_M						N		N		N			N			N
NVMMC_M1549_M 						N		Y		NN			Y			Y
NPMTCT_FbirthHIV1599_M 				N		Y		YY			N			Y (I have something close enough)
YLL_AgeGenLifeExpect_A1599_M	   	Y		N		NN			Y 			Y (should have them now)
YLL_AgeGenLifeExpect_A014_M			Y		N		NN			N			N 
YLL_AgeGenLifeExpect_3Disc_A1599_M	Y		N		N			Y			Y (should have them now)
YLL_AgeGenLifeExpect_3Disc_A014_M	Y		N		N			N			N


NTDFPrEPinit_F1524_M 				N 		N		N			Y			Y
NTDFPrEP_F1524_M					Y		N		NN			Y			Y
NTDFPrEPCT_F1524_M					N		N		NN			Y			N - do I have it now?
NTDFPrEPEver_F1524_M						N		N			Y			Y
NTDFPrEPinit_FSW_M 		
NTDFPrEP_FSW1599_M					N		Y		NN
NTDFPrEPinit_SDCA_M
NTDFPrEP_SDCA1599_M									NN
NTDFPrEPinit_MSM_M 		
NTDFPrEP_MSM1599_M					N		Y		NN
NTDFPrEPinit_pregbfF1549_M
NTDFPrEP_pregbfF1549_M								NN
Same for DPVPrEP and CABPrEP

NPOSTests_ANCPD_F1599_M								NN			NN
;




* <<<< CALCULATE INFECTIONS AND DEATHS AVERTED AND COSTS HERE AND MOVE GRAPHS TO A DIFFERERNT FILE >>>>>>>>>>;


















/***********************************************************************************/
/*********    BAR CHART WITH DEATHS AVERTED and HIV infections averted    **********/
/***********************************************************************************/


/*proc freq data=GOALS_01;table Tot_cost_flow201;run;*/
/*proc freq data=OPT_01;table Tot_cost_flow301;run;*/
/*proc freq data=POP_01;table Tot_cost_flow401;run;*/
/*proc freq data=SYN_01;table  Tot_cost_flow501;run;*/


%macro keep_var_long(model_label,m,dataset,option_number,option_name);

	%let ms = &m.&option_number;

	data c_&dataset;
		set &dataset;		
		length model_strat model strat $ 16;
		model_strat = "&model_label. - &option_name";
		model = "&model_label";
		strat = "&option_name";
	
		*Calculate DALY;

	if &ms in (101  201  301  401  501)  then do;				* Minimal scenarios;
		TOTDeaths_A1599_M_min = TOTDeaths_A1599_M&ms;
		TOTDeaths_A1599_95LL_min = TOTDeaths_A1599_95LL&ms;
		TOTDeaths_A1599_95UL_min = TOTDeaths_A1599_95UL&ms;

		NHIVInf_A1549_M_min = NHIVInf_A1549_M&ms;
		NHIVInf_A1549_95LL_min = NHIVInf_A1549_95LL&ms;
		NHIVInf_A1549_95UL_min = NHIVInf_A1549_95UL&ms;

		*YLL_AgeGenLifeExpect_A1599_M_min = YLL_AgeGenLifeExpect_A1599_M&ms;
		*YLL_AgeGenLifeExpect_A014_M_min  = YLL_AgeGenLifeExpect_A014_M&ms;

		Cost_OnART_A099_min = Cost_OnART_A099_M&ms;
		Tot_cost_flow_min = Tot_cost_flow&ms;
		* QUERY - insert other individual costs here?? ;
	end;

	else do;	
		TOTDeaths_A1599_M = TOTDeaths_A1599_M&ms;
		TOTDeaths_A1599_95LL = TOTDeaths_A1599_95LL&ms;
		TOTDeaths_A1599_95UL = TOTDeaths_A1599_95UL&ms;

		NHIVInf_A1549_M = NHIVInf_A1549_M&ms;
		NHIVInf_A1549_95LL = NHIVInf_A1549_95LL&ms;
		NHIVInf_A1549_95UL = NHIVInf_A1549_95UL&ms;

		*YLL_AgeGenLifeExpect_A1599_M = YLL_AgeGenLifeExpect_A1599_M&ms;
		*YLL_AgeGenLifeExpect_A014_M  = YLL_AgeGenLifeExpect_A014_M&ms;

		Cost_OnART_A099_M = Cost_OnART_A099_M&ms;
		Tot_cost_flow_M = Tot_cost_flow&ms;
		* QUERY - insert other individual costs here?? ;
	end;

	ms = &ms;

	keep year model_strat model strat 
		TOTDeaths_A1599_M				TOTDeaths_A1599_M_min
		TOTDeaths_A1599_95LL			TOTDeaths_A1599_95LL_min
		TOTDeaths_A1599_95UL			TOTDeaths_A1599_95UL_min
		NHIVInf_A1549_M					NHIVInf_A1549_M_min		
		NHIVInf_A1549_95LL				NHIVInf_A1549_95LL_min		
		NHIVInf_A1549_95UL				NHIVInf_A1549_95UL_min		
		/*YLL_AgeGenLifeExpect_A1599_M	YLL_AgeGenLifeExpect_A1599_M_min
		YLL_AgeGenLifeExpect_A014_M		YLL_AgeGenLifeExpect_A014_M_min	*/
		Cost_OnART_A099_M				Cost_OnART_A099_min
		Tot_cost_flow_M					Tot_cost_flow_min			
		/*s*/
		ms
		;	*ms swapped for s;
			* QUERY - insert other individual costs? ;

	if year=. then delete;
	run;

%mend;

*EMOD does not contains NHIVInf_A1549_M;


* Create list of models for labelling figures;

* Define macro to run keep_var_long for each model;
%macro run_keep_var_long(model, m, model_options);
		
	%let model_label = &model;
	%let m = &m;

	%do j = 1 %to %sysfunc(countw(&model_options));						/* Loop through the option numbers in the options list for each model */
		%let option_number = %scan(&model_options, &j);					/* Define option number */
		%let option_name = %scan(&option_name_list,&option_number+1);	/* Define option name */
		%let dataset = &model_label._&option_number;					/* Define dataset name */
		%keep_var_long(&model_label,&m,&dataset,&option_number,&option_name);	/* Run keep_var_long for each option */
	%end;

%mend;


* Run macros;
%run_keep_var_long(EMOD, 1, &emod_options);			* Model name needs to be the abbreviated version to create datasets, and capitalised for figure labels;
%run_keep_var_long(GOALS, 2, &goals_options);	
%run_keep_var_long(OPT, 3, &optima_options);	
%run_keep_var_long(POP, 4, &popart_options);	
%run_keep_var_long(SYN, 5, &synthesis_options;);	


* Merge into one long dataset;
%macro merge_long;

	%do i = 1 %to %sysfunc(countw(&model_names));
		%let model = %scan(&model_names,&i);				/* Define model name */

		%if &model = EMOD %then %do;						/* Define model option list */
			%let options = &emod_options;
		%end;
		%else %if &model = GOALS %then %do;
			%let options = &goals_options;
		%end;
		%else %if &model = OPT %then %do;
			%let options = &optima_options;
		%end;
		%else %if &model = POP %then %do;
			%let options = &popart_options;
		%end;
		%else %if &model = SYN %then %do;
			%let options = &synthesis_options;
		%end;

		%do j = 1 %to %sysfunc(countw(&options));			
			%let s = %scan(&options, &j);					/* Define option */

		/* Use proc append to accumulate results instead of overwriting the dataset */
			data temp; 										/* Create a temporary dataset for merging */
				set c_&model._&s;
			run;

			proc append base=long data=temp; 				/* Append new data to 'long' */
			run;
			
		%end; 	/* End of inner loop for options */

	%end;		/* End of outer loop for models */

%mend merge_long;


proc datasets lib=work nolist;			* Run this to delete long from work libary before running merge macro;
   delete long;
quit;
%merge_long;








**** Check costs in outputs;
proc contents data=long; run;			* long only has totals;
proc contents data=a.large; run;		* large has outputs defined in keep_var;
proc contents data=a.goals_01_fl; run;	* datasets in a have all outputs from spreadsheets;

*ART;

* Create datasets for infections and deaths averted;
/*proc contents data=long; run;*/
/*proc freq data=long;table TOTDeaths_A1599_M_min TOTDeaths_A1599_M NHIVInf_A1549_M_min NHIVInf_A1549_M;run;*/

* Deaths averted;
proc summary data=long nway;
	class model ms;
	var TOTDeaths_A1599_M_min	TOTDeaths_A1599_95LL_min	TOTDeaths_A1599_95UL_min 
		TOTDeaths_A1599_M		TOTDeaths_A1599_95LL		TOTDeaths_A1599_95UL;
	output out=Total_deaths sum=;
run;

data totdeaths_min; 
	set total_deaths; 
	where ms in (101 201 301 401 501);		* Minimal;
	drop TOTDeaths_A1599_M		TOTDeaths_A1599_95LL		TOTDeaths_A1599_95UL;
run;

data totdeaths_ints;
	set total_deaths; 
	where ms not in (101 201 301 401 501);	* Interventions;
	drop TOTDeaths_A1599_M_min	TOTDeaths_A1599_95LL_min	TOTDeaths_A1599_95UL_min;
run;

data totdeaths_large;
	merge totdeaths_min totdeaths_ints;
	by model;
	Deaths_A1599_averted  = 		TOTDeaths_A1599_M_min - TOTDeaths_A1599_M;
	Deaths_A1599_averted_95LL  = 	TOTDeaths_A1599_95LL_min - TOTDeaths_A1599_95LL;
	Deaths_A1599_averted_95UL  = 	TOTDeaths_A1599_95UL_min - TOTDeaths_A1599_95UL;
	pcDeaths_A1599_averted = 100 * Deaths_A1599_averted / TOTDeaths_A1599_M_min;
run;

*The following step is required as I need the variable model_strat for the graph;
data model_strat;
	set long;
	keep model_strat model strat ms;
run;

proc sort data=model_strat nodupkey; by model_strat; run;	*76 records;
proc sort data=model_strat; by model ms; run;
proc sort data=totdeaths_large; by model ms; run;

data totdeaths_large;
	merge totdeaths_large model_strat;
	by model ms;
run;


* Infections averted;
proc summary data=long nway;
	class model ms;
	var NHIVInf_A1549_M_min 	NHIVInf_A1549_95LL_min		NHIVInf_A1549_95UL_min
		NHIVInf_A1549_M			NHIVInf_A1549_95LL			NHIVInf_A1549_95UL;
	output out=Total_NHIVInf sum=;
run;

data TotNHIVInf_min; 
	set Total_NHIVInf; 
	where ms in (101 201 301 401 501);		* Minimal;
	drop NHIVInf_A1549_M		NHIVInf_A1549_95LL			NHIVInf_A1549_95UL;
run;

data TotNHIVInf_ints;
	set Total_NHIVInf; 
	where ms not in (101 201 301 401 501);	* Interventions;
	drop NHIVInf_A1549_M_min 	NHIVInf_A1549_95LL_min		NHIVInf_A1549_95UL_min;
run;

data TotNHIVInf_large;
	merge TotNHIVInf_min TotNHIVInf_ints;
	by model;
	NHIVInf_A1549_averted = 		NHIVInf_A1549_M_min - NHIVInf_A1549_M;
	NHIVInf_A1549_averted_95LL = 	NHIVInf_A1549_95LL_min - NHIVInf_A1549_95LL;
	NHIVInf_A1549_averted_95UL = 	NHIVInf_A1549_95UL_min - NHIVInf_A1549_95UL;
	pcHIVInf_A1549_averted = 100 * NHIVInf_A1549_averted / NHIVInf_A1549_M_min;
run;

proc sort data=model_strat; by model ms; run;
proc sort data=TotNHIVInf_large; by model ms; run;

data TotNHIVInf_large; 
	merge TotNHIVInf_large model_strat;
	by model ms;
run;

/*proc contents data=TotNHIVInf_large; run;*/
* Export TotNHIVInf_large to csv;
PROC export data=TotNHIVInf_large outFILE= "&pth_new\SASdata\inf_averted_20240923" dbms=xlsx REPLACE; sheet="Export";  RUN;



proc freq data=a.emod_01_st; table NOnART_M1599_M; run;
proc freq data=a.emod_01_st; table NOnART_F1599_M; run;
proc freq data=a.emod_01_st; table NOnART_A014_M; run;
proc freq data=a.goals_01_st; table NOnART_M1599_M; run;
proc freq data=a.goals_01_st; table NOnART_F1599_M; run;
proc freq data=a.goals_01_st; table NOnART_A014_M; run;
proc freq data=a.opt_01_st; table NOnART_M1599_M; run;
proc freq data=a.opt_01_st; table NOnART_F1599_M; run;
proc freq data=a.opt_01_st; table NOnART_A014_M; run;
proc freq data=a.pop_01_st; table NOnART_M1599_M; run;
proc freq data=a.pop_01_st; table NOnART_F1599_M; run;
proc freq data=a.pop_01_st; table NOnART_A014_M; run;
proc freq data=a.syn_01_st; table NOnART_M1599_M; run;
proc freq data=a.syn_01_st; table NOnART_F1599_M; run;
proc freq data=a.syn_01_st; table NOnART_A014_M; run;

%let year_start=2023;
%let year_end=2073;

proc sgplot data=a.large; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);*20000000 is stoping in 2023;
label NOnART_M1599_M101  = "EMOD - Min";
label NOnART_F1599_M101  = "EMOD - Min";
label NOnART_A014_M101  = "EMOD - Min";
label NOnART_M1599_M201  = "GOALS - Min";
label NOnART_F1599_M201  = "GOALS - Min";
label NOnART_A014_M201  = "GOALS - Min";
label NOnART_M1599_M301  = "OPTIMA - Min";
label NOnART_F1599_M301  = "OPTIMA - Min";
label NOnART_A014_M301  = "OPTIMA - Min";
label NOnART_M1599_M401  = "POPART-IBM - Min";
label NOnART_F1599_M401  = "POPART-IBM - Min";
label NOnART_A014_M401  = "POPART-IBM - Min";
label NOnART_M1599_M501  = "SYNTHESIS - Min";
label NOnART_F1599_M501  = "SYNTHESIS - Min";
label NOnART_A014_M501  = "SYNTHESIS - Min";
series  x=year y=NOnART_M1599_M101/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=year y=NOnART_F1599_M101/	lineattrs = (color=purple thickness = 2 pattern=LongDash);
series  x=year y=NOnART_A014_M101/	lineattrs = (color=purple thickness = 2 pattern=MediumDash);
series  x=year y=NOnART_M1599_M201/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=year y=NOnART_F1599_M201/	lineattrs = (color=blue thickness = 2 pattern=LongDash);
series  x=year y=NOnART_A014_M201/	lineattrs = (color=blue thickness = 2 pattern=MediumDash);
series  x=year y=NOnART_M1599_M301/	lineattrs = (color=red thickness = 2 pattern=solid);
series  x=year y=NOnART_F1599_M301/	lineattrs = (color=red thickness = 2 pattern=LongDash);
series  x=year y=NOnART_A014_M301/	lineattrs = (color=red thickness = 2 pattern=MediumDash);
series  x=year y=NOnART_M1599_M401/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=year y=NOnART_F1599_M401/	lineattrs = (color=black thickness = 2 pattern=LongDash);
series  x=year y=NOnART_A014_M401/	lineattrs = (color=black thickness = 2 pattern=MediumDash);
series  x=year y=NOnART_M1599_M501/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=year y=NOnART_F1599_M501/	lineattrs = (color=green thickness = 2 pattern=LongDash);
run;quit;

proc sgplot data=a.large; 
Title    height=1.5 justify=center "Cost - ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Cost (USD)'	labelattrs=(size=12)  values = (0 to 300000000 by 30000000) valueattrs=(size=10);*20000000 is stoping in 2023;
label Cost_OnART_A1599_M101  = "EMOD - Min";
label Cost_OnART_A1599_M201  = "GOALS - Min";
label Cost_OnART_A1599_M301  = "OPTIMA - Min";
label Cost_OnART_A1599_M401  = "POPART-IBM - Min";
label Cost_OnART_A1599_M501  = "SYNTHESIS - Min";
series  x=year y=Cost_OnART_A1599_M101/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=year y=Cost_OnART_A1599_M201/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=year y=Cost_OnART_A1599_M301/	lineattrs = (color=red thickness = 2 pattern=solid);
series  x=year y=Cost_OnART_A1599_M401/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=year y=Cost_OnART_A1599_M501/	lineattrs = (color=green thickness = 2 pattern=solid);
run;quit;


*Tests;
/* 
Only Synthesis counts number of tests explicitly. How to estimate cost of testing in models without explicit counting? 
Can we use NHIV_A1599_Asympt_Undiag_M or p_diag?
What is the testing rate in the different models? 
*/
*Total tests;
proc freq data=a.emod_01_fl; table TOTTests_A1599_M; run;		* Not provided;
proc freq data=a.goals_01_fl; table TOTTests_A1599_M; run;		* Not provided;
proc freq data=a.opt_01_fl; table TOTTests_A1599_M; run;		* Not provided;
proc freq data=a.pop_01_fl; table TOTTests_A1599_M; run;
proc freq data=a.syn_01_fl; table TOTTests_A1599_M; run;

*ANC & PD testing;
proc freq data=a.emod_01_fl; table Ntests_ANCPD_F1599_M; run;
proc freq data=a.goals_01_fl; table Ntests_ANCPD_F1599_M; run;
proc freq data=a.opt_01_fl; table Ntests_ANCPD_F1599_M; run;
proc freq data=a.pop_01_fl; table Ntests_ANCPD_F1599_M; run;
proc freq data=a.syn_01_fl; table Ntests_ANCPD_F1599_M; run;	*Only SYNTHESIS has this output;

proc freq data=a.syn_01_fl; table NPostests_ANCPD_F1599_M; run;	*Only SYNTHESIS has this output;

*Exposed infant testing;
proc freq data=a.syn_01_fl; table Ntested_A06m_M; run;	


*Facility-based testing for symptomatics;
proc freq data=a.emod_01_fl; table Ntests_FACSYMPT_F1599_M; run;
proc freq data=a.goals_01_fl; table Ntests_FACSYMPT_F1599_M; run;
proc freq data=a.opt_01_fl; table Ntests_FACSYMPT_F1599_M; run;
proc freq data=a.pop_01_fl; table Ntests_FACSYMPT_F1599_M; run;
proc freq data=a.syn_01_fl; table Ntests_FACSYMPT_F1599_M; run;		*Only SYNTHESIS has this output(M and F separately);

proc freq data=a.syn_01_fl; table NPosTests_FACSYMPT_A1599_M; run;	*Only SYNTHESIS has this output (A);

*Condoms;
*How to estimate cost of condoms for models that do not provide this outputs? ;
proc freq data=a.emod_01_fl; table NCondoms_A1599_M; run;
proc freq data=a.goals_01_fl; table NCondoms_A1599_M; run;			*Only GOALS has this output;
proc freq data=a.opt_01_fl; table NCondoms_A1599_M; run;
proc freq data=a.pop_01_fl; table NCondoms_A1599_M; run;
	* SYN NA;

*VMMC;
/*
How to estimate cost of VMMC for models that do not provide this outputs?
Do they use VMMC rate? Have we asked for this output?
Ask Daniel and Debra if they can estimate number of procedures
*/
proc freq data=a.emod_13_fl; table NVMMC_M1549_M; run;		* Not provided;
proc freq data=a.goals_13_fl; table NVMMC_M1549_M; run;
proc freq data=a.opt_13_fl; table NVMMC_M1549_M; run;		* Not provided - although indicated in spreadsheet that they can provide this;
proc freq data=a.pop_13_fl; table NVMMC_M1549_M; run;
proc freq data=a.syn_13_fl; table NVMMC_M1549_M; run;


*ART;
*PMTCT;
proc freq data=a.emod_01_fl; table NPMTCT_FbirthHIV1599_M; run;		* Not provided;
proc freq data=a.goals_01_fl; table NPMTCT_FbirthHIV1599_M; run;
proc freq data=a.opt_01_fl; table NPMTCT_FbirthHIV1599_M; run;
proc freq data=a.pop_01_fl; table NPMTCT_FbirthHIV1599_M; run;		* Not provided;
proc freq data=a.syn_01_fl; table NPMTCT_FbirthHIV1599_M; run;		







* Cost per infection averted;
proc summary data=long nway;
	class model ms;
	var Cost_OnART_A099_min	Cost_OnART_A099_M	Tot_cost_flow_min  	Tot_cost_flow_M;
	output out=Total_costs sum=;
run;

data total_costs;
	set total_costs;
	tot_cost_min = Cost_OnART_A099_min + Tot_cost_flow_min;
	tot_cost_m   = Cost_OnART_A099_m   + Tot_cost_flow_m;
run;

data totcosts_min;  set total_costs; where ms in (101 201 301 401 501);		drop TOT_cost_M;	run;
data totcosts_ints; set total_costs; where ms not in (101 201 301 401 501); drop TOT_cost_min;	run;

data totcosts_large; 
	merge totcosts_min totcosts_ints; 
	by model;
	Incr_cost  = TOT_cost_M - TOT_cost_min;
	if Tot_cost_flow_M=0 then incr_cost=.;
run;

data cost_inf_averted; merge totcosts_large TotNHIVInf_large;by ms;run;
data cost_inf_averted; set cost_inf_averted;
	*!careful as infections averted are in 1549 but costs in 0-99;
	cost_per_infaverted = incr_cost/NHIVInf_A1549_averted;
run;



ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = "&pth_new\Graphs\MIHPSAZimP2_totals_20240806.doc" startpage=never; 
/*
proc sgplot data=totdeaths_large;
Title    height=1.5 justify=center "Deaths (all causes) averted in 15+ years old (50 years)";
yaxis grid label	= 'Number'	labelattrs=(size=12);
styleattrs datacolors=(grey blue red black green) datacontrastcolors=(grey blue red black green);
vbarparm category=model_strat response=Deaths_A1599_averted / group=model;
xaxistable Deaths_A1599_averted / colorgroup=model location=inside nolabel;
run;*/

proc sgplot data=totdeaths_large;
Title    height=1.5 justify=center "Deaths (all causes) averted in 15+ years old (50 years) - EMOD";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 10000 by 1000);
*styleattrs datacolors=blue;* datacontrastcolors=blue;
vbarparm category=strat response=Deaths_A1599_averted/  fillattrs=(color=purple);/* / group=model;*/
*xaxistable Deaths_A1599_averted;/* / colorgroup=model location=inside nolabel;*/
where model="EMOD";run;

proc sgplot data=totdeaths_large;
Title    height=1.5 justify=center "Deaths (all causes) averted in 15+ years old (50 years) - GOALS";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 10000 by 1000);
*styleattrs datacolors=blue;* datacontrastcolors=blue;
vbarparm category=strat response=Deaths_A1599_averted/  fillattrs=(color=blue);/* / group=model;*/
*xaxistable Deaths_A1599_averted;/* / colorgroup=model location=inside nolabel;*/
where model="GOALS";run;

proc sgplot data=totdeaths_large;
Title    height=1.5 justify=center "Deaths (all causes) averted in 15+ years old (50 years) - OPTIMA";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 10000 by 1000) ;
vbarparm category=strat response=Deaths_A1599_averted/  fillattrs=(color=red);
where model="OPT";run;

proc sgplot data=totdeaths_large;
Title    height=1.5 justify=center "Deaths (all causes) averted in 15+ years old (50 years) - GOALS";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 400000 by 50000);
*styleattrs datacolors=blue;* datacontrastcolors=blue;
Title    height=1.5 justify=center "Deaths (all causes) averted in 15+ years old (50 years) - OPTIMA";
vbarparm category=strat response=Deaths_A1599_averted/  fillattrs=(color=blue);/* / group=model;*/
*xaxistable Deaths_A1599_averted;/* / colorgroup=model location=inside nolabel;*/
where model="GOALS";run;

proc sgplot data=totdeaths_large;
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 400000 by 50000) ;
vbarparm category=strat response=Deaths_A1599_averted/  fillattrs=(color=red);
where model="OPT";run;

proc sgplot data=totdeaths_large;
Title    height=1.5 justify=center "Deaths (all causes) averted in 15+ years old (50 years) - POPART-IBM";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 400000 by 50000) ;
vbarparm category=strat response=Deaths_A1599_averted/  fillattrs=(color=black);
where model="POP";run;

proc sgplot data=totdeaths_large;
Title    height=1.5 justify=center "Deaths (all causes) averted in 15+ years old (50 years) - SYNTHESIS";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 400000 by 50000) ;
vbarparm category=strat response=Deaths_A1599_averted/  fillattrs=(color=green);
where model="SYN";run;



/*
proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years)";
yaxis grid label	= 'Number'	labelattrs=(size=12);
styleattrs datacolors=(grey blue red black green) datacontrastcolors=(grey blue red black green);
vbarparm category=model_strat response=NHIVInf_A1549_averted / group=model;
xaxistable NHIVInf_A1549_averted / colorgroup=model location=inside nolabel;
run;*/

proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - GOALS";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 1000000 by 200000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=purple);
where model="EMOD";run;

proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - GOALS";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 1000000 by 200000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=blue);
where model="GOALS";run;

proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - OPTIMA";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 1000000 by 200000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=red);
where model="OPT";run;

proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - POPART-IBM";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 1000000 by 200000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=black);
where model="POP" and s ne 400;run;

proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - SYNTHESIS";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 1000000 by 200000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=green);
where model="SYN" and s ne 500;run;


proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - GOALS";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 200000 by 50000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=blue);
where model="GOALS";run;

proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - OPTIMA";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 200000 by 50000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=red);
where model="OPT";run;

proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - POPART-IBM";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 3000000 by 500000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=black);
where model="POP";run;

proc sgplot data=TotNHIVInf_large;
Title    height=1.5 justify=center "New HIV infections averted in 15-49 years old (50 years) - SYNTHESIS";
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 3000000 by 500000);
vbarparm category=strat response=NHIVInf_A1549_averted / fillattrs=(color=green);
where model="SYN";run;
/*
proc sgplot data=tot_large;
Title    height=1.5 justify=center "Years of life lost averted in 15-99 years old (50 years)";
yaxis grid label	= 'Number'	labelattrs=(size=12);
styleattrs datacolors=(grey blue red black green) datacontrastcolors=(grey blue red black green);
vbarparm category=model response=YLL_A1599_averted / group=model;
xaxistable YLL_A1599_averted / colorgroup=model location=inside nolabel;
run;

proc sgplot data=tot_large;
Title    height=1.5 justify=center "Years of life lost averted in 0-14 years old (50 years)";
yaxis grid label	= 'Number'	labelattrs=(size=12);
styleattrs datacolors=(grey blue red black green) datacontrastcolors=(grey blue red black green);
vbarparm category=model response=YLL_A014_averted / group=model;
xaxistable YLL_A014_averted / colorgroup=model location=inside nolabel;
run;
*/
ods rtf close;

data cost_inf_averted;set cost_inf_averted;
*!careful as infections averted are in 1549 but costs in 0-99;
cost_per_infaverted = incr_cost/NHIVInf_A1549_averted;
run;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = "&pth_new\Graphs\MIHPSAZimP2_CostInfAverted_20240806.doc" startpage=never; 

proc sgplot data=cost_inf_averted;
Title    height=1.5 justify=center "GOALS";
xaxis label			= 'Infections averted'	labelattrs=(size=12) valueattrs=(size=10); 
yaxis grid label	= 'Cost per infection averted'	labelattrs=(size=12) valueattrs=(size=10);
  scatter x=NHIVInf_A1549_averted y=cost_per_infaverted/datalabel=strat
     filledoutlinedmarkers
  markerattrs = (symbol=circleFilled size=9)
  markeroutlineattrs=(color=blue);
  where model="GOALS";
run;

proc sgplot data=cost_inf_averted;
Title    height=1.5 justify=center "GOALS - ZOOM";
xaxis label			= 'Infections averted'	labelattrs=(size=12) valueattrs=(size=10); 
yaxis grid label	= 'Cost per infection averted'	labelattrs=(size=12) values = (0 to 100000 by 20000) valueattrs=(size=10);
  scatter x=NHIVInf_A1549_averted y=cost_per_infaverted/datalabel=strat
     filledoutlinedmarkers
  markerattrs = (symbol=circleFilled size=9)
  markeroutlineattrs=(color=blue);
  where model="GOALS";
run;

proc sgplot data=cost_inf_averted;
Title    height=1.5 justify=center "OPTIMA";
xaxis label			= 'Infections averted'	labelattrs=(size=12) values = (0 to 1000000 by 200000)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Cost per infection averted'	labelattrs=(size=12) valueattrs=(size=10);
  scatter x=NHIVInf_A1549_averted y=cost_per_infaverted/datalabel=strat 
   filledoutlinedmarkers
    markerattrs = (symbol=circleFilled size=9)
  markeroutlineattrs=(color=red);
  where model="OPT" and ms ne 300;
run;

proc sgplot data=cost_inf_averted;
Title    height=1.5 justify=center "POPART-IBM";
xaxis label			= 'Infections averted'	labelattrs=(size=12) values = (0 to 1000000 by 200000)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Cost per infection averted'	labelattrs=(size=12) valueattrs=(size=10);
  scatter x=NHIVInf_A1549_averted y=cost_per_infaverted/datalabel=strat 
   filledoutlinedmarkers
    markerattrs = (symbol=circleFilled size=9)
  markeroutlineattrs=(color=black);
  where model="POP" and ms ne 300;
run;

proc sgplot data=cost_inf_averted;
Title    height=1.5 justify=center "SYNTHESIS";
xaxis label			= 'Infections averted'	labelattrs=(size=12) values = (0 to 1000000 by 200000)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Cost per infection averted'	labelattrs=(size=12) valueattrs=(size=10);
  scatter x=NHIVInf_A1549_averted y=cost_per_infaverted/datalabel=strat 
   filledoutlinedmarkers
    markerattrs = (symbol=circleFilled size=9)
  markeroutlineattrs=(color=green);
  where model="SYN" and ms ne 500;
run;
ods rtf close;



*Understanding why PrEP has a big effect on deaths;
*I'm printing only oral PrEP as the coverage assumed for cabotegravir and injectable is the same and so the effect on testing;
ods rtf file = "&pth_new\Graphs\MIHPSAZimP2_Synthesis_PREPconsequences_20240506.doc" startpage=never; 
proc sgplot data=a.large; 
Title    height=1.5 justify=center "Total number of test (excluding HIV self-test) conducted among adults 15+ years old - Different strategies in SYNTHESIS";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12);*  values = (0 to 60000 by 10000) valueattrs=(size=10);*20000000 is stoping in 2023;
label TOTTests_A1599_M500  = "StatusQuo";
label TOTTests_A1599_M501  = "Min";
label TOTTests_A1599_M508  = "Min+TFSWprog";
/*label TOTTests_A1599_M510  = "Min+SBCC";*/
label TOTTests_A1599_M511  = "Min+CMMC";
label TOTTests_A1599_M514  = "Min+OPrEPF1524";
label TOTTests_A1599_M515  = "Min+OPrEPFSW";
label TOTTests_A1599_M516  = "Min+OPrEPSDC";
label TOTTests_A1599_M518  = "Min+OPrEPPLW";
series  x=year y=TOTTests_A1599_M500/lineattrs = (color=green thickness = 2 pattern=solid);
series  x=year y=TOTTests_A1599_M501/lineattrs = (color=green thickness = 2 pattern=MediumDash);
series  x=year y=TOTTests_A1599_M508/lineattrs = (color=yellow thickness = 2 pattern=solid);
/*series  x=year y=TOTTests_A1599_M510/lineattrs = (color=orange thickness = 2 pattern=solid);*/
series  x=year y=TOTTests_A1599_M511/lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=year y=TOTTests_A1599_M514/lineattrs = (color=violet thickness = 2 pattern=solid);
series  x=year y=TOTTests_A1599_M515/lineattrs = (color=violet thickness = 2 pattern=shortDash);
series  x=year y=TOTTests_A1599_M516/lineattrs = (color=violet thickness = 2 pattern=LongDash);
series  x=year y=TOTTests_A1599_M518/lineattrs = (color=violet thickness = 2 pattern=dot);
run;quit;

proc sgplot data=a.large; 
Title    height=1.5 justify=center "Proportion of adults 15+ years old living with HIV diagnosed - Different strategies in SYNTHESIS";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);*20000000 is stoping in 2023;
label P_DIAG_A1599_M500  = "StatusQuo";
label P_DIAG_A1599_M501  = "Min";
label P_DIAG_A1599_M508  = "Min+TFSWprog";
/*label P_DIAG_A1599_M510  = "Min+SBCC";*/
label P_DIAG_A1599_M511  = "Min+CMMC";
label P_DIAG_A1599_M514  = "Min+OPrEPF1524";
label P_DIAG_A1599_M515  = "Min+OPrEPFSW";
label P_DIAG_A1599_M516  = "Min+OPrEPSDC";
label P_DIAG_A1599_M518  = "Min+OPrEPPLW";
series  x=year y=P_DIAG_A1599_M500/lineattrs = (color=green thickness = 2 pattern=solid);
series  x=year y=P_DIAG_A1599_M501/lineattrs = (color=green thickness = 2 pattern=MediumDash);
series  x=year y=P_DIAG_A1599_M508/lineattrs = (color=yellow thickness = 2 pattern=solid);
/*series  x=year y=P_DIAG_A1599_M510/lineattrs = (color=orange thickness = 2 pattern=solid);*/
series  x=year y=P_DIAG_A1599_M511/lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=year y=P_DIAG_A1599_M514/lineattrs = (color=violet thickness = 2 pattern=solid);
series  x=year y=P_DIAG_A1599_M515/lineattrs = (color=violet thickness = 2 pattern=shortDash);
series  x=year y=P_DIAG_A1599_M516/lineattrs = (color=violet thickness = 2 pattern=LongDash);
series  x=year y=P_DIAG_A1599_M518/lineattrs = (color=violet thickness = 2 pattern=dot);
run;quit;


proc sgplot data=a.large; 
Title    height=1.5 justify=center "Proportion of adults 15+ years old living with HIV diagnosed - Different strategies in SYNTHESIS - ZOOM";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0.8 to 1 by 0.05);*20000000 is stoping in 2023;
label P_DIAG_A1599_M500  = "StatusQuo";
label P_DIAG_A1599_M501  = "Min";
label P_DIAG_A1599_M508  = "Min+TFSWprog";
/*label P_DIAG_A1599_M510  = "Min+SBCC";*/
label P_DIAG_A1599_M511  = "Min+CMMC";
label P_DIAG_A1599_M514  = "Min+OPrEPF1524";
label P_DIAG_A1599_M515  = "Min+OPrEPFSW";
label P_DIAG_A1599_M516  = "Min+OPrEPSDC";
label P_DIAG_A1599_M518  = "Min+OPrEPPLW";
series  x=year y=P_DIAG_A1599_M500/lineattrs = (color=green thickness = 2 pattern=solid);
series  x=year y=P_DIAG_A1599_M501/lineattrs = (color=green thickness = 2 pattern=MediumDash);
series  x=year y=P_DIAG_A1599_M508/lineattrs = (color=yellow thickness = 2 pattern=solid);
/*series  x=year y=P_DIAG_A1599_M510/lineattrs = (color=orange thickness = 2 pattern=solid);*/
series  x=year y=P_DIAG_A1599_M511/lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=year y=P_DIAG_A1599_M514/lineattrs = (color=violet thickness = 2 pattern=solid);
series  x=year y=P_DIAG_A1599_M515/lineattrs = (color=violet thickness = 2 pattern=shortDash);
series  x=year y=P_DIAG_A1599_M516/lineattrs = (color=violet thickness = 2 pattern=LongDash);
series  x=year y=P_DIAG_A1599_M518/lineattrs = (color=violet thickness = 2 pattern=dot);
run;quit;


proc sgplot data=a.large; 
Title    height=1.5 justify=center "Proportion of adults 15+ years old living with HIV on ART - Different strategies in SYNTHESIS";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0.7 to 1 by 0.05);*20000000 is stoping in 2023;
label P_onART_HIVA1599_M500  = "StatusQuo";
label P_onART_HIVA1599_M501  = "Min";
label P_onART_HIVA1599_M508  = "Min+TFSWprog";
/*label P_onART_HIVA1599_M510  = "Min+SBCC";*/
label P_onART_HIVA1599_M511  = "Min+CMMC";
label P_onART_HIVA1599_M514  = "Min+OPrEPF1524";
label P_onART_HIVA1599_M515  = "Min+OPrEPFSW";
label P_onART_HIVA1599_M516  = "Min+OPrEPSDC";
label P_onART_HIVA1599_M518  = "Min+OPrEPPLW";
series  x=year y=P_onART_HIVA1599_M500/lineattrs = (color=green thickness = 2 pattern=solid);
series  x=year y=P_onART_HIVA1599_M501/lineattrs = (color=green thickness = 2 pattern=MediumDash);
series  x=year y=P_onART_HIVA1599_M508/lineattrs = (color=yellow thickness = 2 pattern=solid);
/*series  x=year y=P_onART_HIVA1599_M510/lineattrs = (color=orange thickness = 2 pattern=solid);*/
series  x=year y=P_onART_HIVA1599_M511/lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=year y=P_onART_HIVA1599_M514/lineattrs = (color=violet thickness = 2 pattern=solid);
series  x=year y=P_onART_HIVA1599_M515/lineattrs = (color=violet thickness = 2 pattern=shortDash);
series  x=year y=P_onART_HIVA1599_M516/lineattrs = (color=violet thickness = 2 pattern=LongDash);
series  x=year y=P_onART_HIVA1599_M518/lineattrs = (color=violet thickness = 2 pattern=dot);
run;quit;

proc sgplot data=a.large; 
Title    height=1.5 justify=center "Number of adults 15+ years old on ART - Different strategies in SYNTHESIS";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) ;* values = (0.8 to 1 by 0.05);*20000000 is stoping in 2023;
label NonART_A1599_M500  = "StatusQuo";
label NonART_A1599_M501  = "Min";
label NonART_A1599_M508  = "Min+TFSWprog";
/*label NonART_A1599_M510  = "Min+SBCC";*/
label NonART_A1599_M511  = "Min+CMMC";
label NonART_A1599_M514  = "Min+OPrEPF1524";
label NonART_A1599_M515  = "Min+OPrEPFSW";
label NonART_A1599_M516  = "Min+OPrEPSDC";
label NonART_A1599_M518  = "Min+OPrEPPLW";
series  x=year y=NonART_A1599_M500/lineattrs = (color=green thickness = 2 pattern=solid);
series  x=year y=NonART_A1599_M501/lineattrs = (color=green thickness = 2 pattern=MediumDash);
series  x=year y=NonART_A1599_M508/lineattrs = (color=yellow thickness = 2 pattern=solid);
/*series  x=year y=NonART_A1599_M510/lineattrs = (color=orange thickness = 2 pattern=solid);*/
series  x=year y=NonART_A1599_M511/lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=year y=NonART_A1599_M514/lineattrs = (color=violet thickness = 2 pattern=solid);
series  x=year y=NonART_A1599_M515/lineattrs = (color=violet thickness = 2 pattern=shortDash);
series  x=year y=NonART_A1599_M516/lineattrs = (color=violet thickness = 2 pattern=LongDash);
series  x=year y=NonART_A1599_M518/lineattrs = (color=violet thickness = 2 pattern=dot);
run;quit;
ods rtf close;

/*
NHIVInf_A1549_M1 = NHIVInf_A1549_M1 - NHIVInf_A1549_M11;
NHIVInf_A1549_M2 = NHIVInf_A1549_M2 - NHIVInf_A1549_M21;
NHIVInf_A1549_M3 = NHIVInf_A1549_M3 - NHIVInf_A1549_M31;
NHIVInf_A1549_M4 = NHIVInf_A1549_M4 - NHIVInf_A1549_M41;
NHIVInf_A1549_M5 = NHIVInf_A1549_M5 - NHIVInf_A1549_M51;


Deaths averted
Additional cost
DALYs averted
Cost-effectiveness plane
*/


/***********************************************************************************/
/***********************    BAR CHART WITH BUDGET IN 2023    ***********************/
/***********************************************************************************/

data b; set a.large;
Cost_OnART_A1599_exclPMTCT_M101 = Cost_OnART_A1599_M101 - Cost_PMTCT_FbirthHIV1599_M101;
Cost_OnART_A1599_exclPMTCT_M201 = Cost_OnART_A1599_M201 - Cost_PMTCT_FbirthHIV1599_M201;
Cost_OnART_A1599_exclPMTCT_M301 = Cost_OnART_A1599_M301 - Cost_PMTCT_FbirthHIV1599_M301;
Cost_OnART_A1599_exclPMTCT_M401 = Cost_OnART_A1599_M401 - Cost_PMTCT_FbirthHIV1599_M401;
Cost_OnART_A1599_exclPMTCT_M501 = Cost_OnART_A1599_M501 - Cost_PMTCT_FbirthHIV1599_M501;
run;
/*
%let i=1;
do until i=6;
      Cost_OnART_A1599_exclPMTCT_M&i = Cost_OnART_A1599_M&i - Cost_PMTCT_FbirthHIV1599_M&i;
%eval &i=&i+1;
end;
run;*/
*array Cost_PMTCT_FbirthHIV1599_M{5} Cost_PMTCT_FbirthHIV1599_M1-Cost_PMTCT_FbirthHIV1599_M5;
*array Cost_OnART_A1599_M{5} Cost_OnART_A1599_M1-Cost_OnART_A1599_M5;
*array Cost_OnART_A1599_exclPMTCT_M{5} Cost_OnART_A1599_exclPMTCT_M1-Cost_OnART_A1599_exclPMTCT_M5

	*****This part not working - _MX numbers not specified;
*Note: the costs of PMTCT is captured is the same as people on ART;
proc contents data=b; run;
data budget_large_2023; set b;
where year=2023;
keep Cost_ANCPD_F1599_M1-Cost_ANCPD_F1599_M5
     Cost_FACSYMPT_A1599_M1-Cost_FACSYMPT_A1599_M5
	 Cost_OnART_A014_M1-Cost_OnART_A014_M5
	 Cost_OnART_A1599_exclPMTCT_M1- Cost_OnART_A1599_exclPMTCT_M5
	 Cost_PMTCT_FbirthHIV1599_M1-Cost_PMTCT_FbirthHIV1599_M5
	 Cost_CUPP_A1599_M1-Cost_CUPP_A1599_M5;run;
proc print data=b;var 
Cost_OnART_A1599_M2 Cost_PMTCT_FbirthHIV1599_M2 Cost_OnART_A1599_exclPMTCT_M2;
run;
*1 row;
proc transpose data=budget_large_2023 out=budget_long_2023;run;
proc format;
	value item 1='Testing - ANC & PD'
               2='Testing - at facility with symptoms'
			   3='ART and clinical care - adults excl. PMTCT'
			   4='ART and clinical care - PMTCT/maternal ART'
			   5='ART and clinical care - infants and children'
			   6='Prevention - Condom use promotion and provision';run;
data budget_long_2023;set budget_long_2023;
format item_n item.;
Item=substr(_NAME_,6,11);
cost_million=col1/1000000;
if cost_million=. then cost_million=0;
model_n=substr(_NAME_,length(_NAME_),1);
model="          ";
if model_n=1  then model="EMOD";
if model_n=2  then model="GOALS"; 
if model_n=3  then model="OPTIMA"; 
if model_n=4  then model="POPART-IBM"; 
if model_n=5  then model="SYNTHESIS"; 

if Item="ANCPD_F1599" then item_n=1;
if Item="FACSYMPT_A1" then item_n=2;
if Item="OnART_A1599" then item_n=3;
if Item="PMTCT_Fbirt" then item_n=4;
if Item="OnART_A014_" then item_n=5;
if Item="CUPP_A1599_" then item_n=6;
run;

proc sort;by item model_n;run;

ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = "&pth_new\Graphs\MIHPSAZimP2_budget2023.doc" startpage=never; 
proc sgplot data=budget_long_2023;
    vbar model/response=cost_million group=Item_n groupdisplay=stack;* GROUPORDER = DATA;
run;
ods rtf close;


