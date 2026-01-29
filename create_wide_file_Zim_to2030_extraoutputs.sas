
***This file is used to create outputs for Steve Cohen - requested key epi outputs to comapre to data they already had;

libname a "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

data y; 
set a.long_gen_07Jan26; 
run;


%let op_num=99;

*Use SQ for most outputs, but use the PrEP KP scenario for the PrEP outputs as inj PrEP is not introduced in SQ;

*This means need to overwrite the SQ PrEP outputs with the option=xx ones;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Variable lists;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%let stock_list = 

n_alive					n_alive1564_		n_hivge15_			n_hivge1564_		n_agyw			n_agyw_pg
n_sw_1549_				n_msm_1564_			n_hiv_pregnant		n_give_birth_with_hiv				n_onart
n_vm_this_per		 	n_cd4m_this_per		n_vmmc1549m			n_selftested		n_tested		n_pregnant_onart
n_infbirth_testing		n_postdel_testing	p_diag				p_onart_diag		p_onart_vl1000_	n_vmmc_all
/*n_onprep_oral			n_onprep_cab	n_onprep_len*/
;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Macros;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* var_stock macro takes the mid-year data point;
%macro var_stock(v=);

* &v ;

* option is set to &op_num - defined below where macro is run;

* stock ;

* Use option 0 outputs for years 1985-2023;


proc means noprint data=y; var &v; output out=y_2000 mean= &v;  where 2000 <= cald <2001 and option = 0;
proc means noprint data=y; var &v; output out=y_2001 mean= &v;  where 2001 <= cald <2002 and option = 0;
proc means noprint data=y; var &v; output out=y_2002 mean= &v;  where 2002 <= cald <2003 and option = 0;
proc means noprint data=y; var &v; output out=y_2003 mean= &v;  where 2003 <= cald <2004 and option = 0;
proc means noprint data=y; var &v; output out=y_2004 mean= &v;  where 2004 <= cald <2005 and option = 0;
proc means noprint data=y; var &v; output out=y_2005 mean= &v;  where 2005 <= cald <2006 and option = 0;
proc means noprint data=y; var &v; output out=y_2006 mean= &v;  where 2006 <= cald <2007 and option = 0;
proc means noprint data=y; var &v; output out=y_2007 mean= &v;  where 2007 <= cald <2008 and option = 0;
proc means noprint data=y; var &v; output out=y_2008 mean= &v;  where 2008 <= cald <2009 and option = 0;
proc means noprint data=y; var &v; output out=y_2009 mean= &v;  where 2009 <= cald <2010 and option = 0;
proc means noprint data=y; var &v; output out=y_2010 mean= &v;  where 2010 <= cald <2011 and option = 0;
proc means noprint data=y; var &v; output out=y_2011 mean= &v;  where 2011 <= cald <2012 and option = 0;
proc means noprint data=y; var &v; output out=y_2012 mean= &v;  where 2012 <= cald <2013 and option = 0;
proc means noprint data=y; var &v; output out=y_2013 mean= &v;  where 2013 <= cald <2014 and option = 0;
proc means noprint data=y; var &v; output out=y_2014 mean= &v;  where 2014 <= cald <2015 and option = 0;
proc means noprint data=y; var &v; output out=y_2015 mean= &v;  where 2015 <= cald <2016 and option = 0;
proc means noprint data=y; var &v; output out=y_2016 mean= &v;  where 2016 <= cald <2017 and option = 0;
proc means noprint data=y; var &v; output out=y_2017 mean= &v;  where 2017 <= cald <2018 and option = 0;
proc means noprint data=y; var &v; output out=y_2018 mean= &v;  where 2018 <= cald <2019 and option = 0;
proc means noprint data=y; var &v; output out=y_2019 mean= &v;  where 2019 <= cald <2020 and option = 0;
proc means noprint data=y; var &v; output out=y_2020 mean= &v;  where 2020 <= cald <2021 and option = 0;
proc means noprint data=y; var &v; output out=y_2021 mean= &v;  where 2021 <= cald <2022 and option = 0;
proc means noprint data=y; var &v; output out=y_2022 mean= &v;  where 2022 <= cald <2023 and option = 0;
proc means noprint data=y; var &v; output out=y_2023 mean= &v;  where 2023 <= cald <2024 and option = 0;
proc means noprint data=y; var &v; output out=y_2024 mean= &v;  where 2024 <= cald <2025 and option = 0;
proc means noprint data=y; var &v; output out=y_2025 mean= &v;  where 2025 <= cald <2026 and option = 0;
proc means noprint data=y; var &v; output out=y_2026 mean= &v;  where 2026 <= cald <2027 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2027 mean= &v;  where 2027 <= cald <2028 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2028 mean= &v;  where 2028 <= cald <2029 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2029 mean= &v;  where 2029 <= cald <2030 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2030 mean= &v;  where 2030 <= cald <2031 and option = &op_num;


	
data &v ; set  
y_2000  y_2001  y_2002  y_2003  y_2004 y_2005  y_2006  y_2007  y_2008  y_2009  y_2010  y_2011  y_2012  y_2013  y_2014  y_2015  y_2016  y_2017  y_2018
y_2019  y_2020  y_2021  y_2022  y_2023 y_2024  y_2025  y_2026  y_2027  y_2028  y_2029  y_2030  
;  
*drop _NAME_ _TYPE_ _FREQ_;

%mend var_stock;


* make_stocks macro runs the var_stock macro through a list of variable names;
%macro make_stocks;
	%let n=%sysfunc(countw(&stock_list));	/* number of variables in stock_list */
    %do i=1 %to &n;
        %let var=%scan(&stock_list, &i);
        %var_stock(v=&var);
    %end;
%mend;


* Note years 1985-2023 are option 0 and 2024 onwards are selected option;
data year;
input year;
cards;

2000 
2001 
2002 
2003 
2004 
2005 
2006 
2007 
2008 
2009 
2010 
2011 
2012 
2013 
2014 
2015 
2016 
2017 
2018 
2019 
2020 
2021 
2022 
2023 
2024 
2025 
2026 
2027 
2028 
2029 
2030 


proc contents; 
run;

%make_stocks;run;

data stocks ; 
merge year &stock_list;
drop _TYPE_ _FREQ_ n_onprep_oral n_onprep_cab n_onprep_len;***dropping the prep vars as inj prep was not introduced so need to overwrite these by running with option=7;
rename year=cald;
run;



***The graphs are to check that the outputs are sensible - not to share with Genesis;

***Output dataset is created after the graphs;

data c;
set stocks;

%include "C:\Users\lovel\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_Zimbabwe_Jan2026_genesis.sas";by cald;
run;


data d;
set c;
%include "C:\Users\Lovel\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_FSW_Zimbabwe_genesis.sas"; by cald;
run;

ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = 'C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\Zim_calibration_means_28_01_26.doc' startpage=never; 


proc sgplot data=d; 
Title    height=1.5 justify=center "Population (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2030 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 15000000) valueattrs=(size=10);

label n_alive1564_ = "Model 15-64";
label n_alive = "Model 15+";

label o_pop_15plus_Zim_cens  = "Census 15+";
label o_pop_1565_Zi_CIA = "CIA 15-65";
label o_pop_15plus_WPP = "World population prospectus 15+";

series  x=cald y=n_alive1564_/	lineattrs = (color=black thickness = 2);
series  x=cald y=n_alive/	lineattrs = (color=blue thickness = 2);


scatter x=cald y=o_pop_15plus_Zim_cens / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=o_pop_15plus_WPP / markerattrs=(symbol=circle color=blue size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2030 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 250000) valueattrs=(size=10);

label n_hivge15_ = "Model 15+";
label n_hivge1564_ = "Model 15-64";
label o_livingHIV_15plus_UNAIDS  = "UNAIDS 15+";
label e_hiv_15plus_nac = "National AIDS Council 15+";
label o_livingHIV_all_GARPR = "Global AIDS Progress Report (All ages)";

series  x=cald y=n_hivge15_/	lineattrs = (color=black thickness = 2);
series  x=cald y=n_hivge1564_/	lineattrs = (color=blue thickness = 2);

scatter x=cald y=o_livingHIV_15plus_UNAIDS / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=e_hiv_15plus_nac / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=o_livingHIV_all_GARPR / markerattrs=(symbol=circle color=blue size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "AGYW Population";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 2000000 by 250000)  valueattrs=(size=10);

label n_agyw       	= "Model";
label o_pop_agyw_census		= "Census";

series  x=cald y=n_agyw  /           lineattrs = (color=blue thickness = 2);

scatter x=cald y=o_pop_agyw_census / markerattrs = (symbol=circle       color=blue size = 12);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "High risk AGYW population and pregnant women";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 2000000 by 250000)  valueattrs=(size=10);

label n_agyw_pg       	= "Model";

series  x=cald y=n_agyw_pg  /           lineattrs = (color=blue thickness = 2);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Female sex workers 15-49";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 300000 by 25000)  valueattrs=(size=10);

label n_sw_1549_       	= "Model 15-49";
label o_pop_fsw_1549w_Fearon = "Fearon";

series  x=cald y=n_sw_1549_  /           lineattrs = (color=black thickness = 2);
scatter x=cald y=o_pop_fsw_1549w_Fearon / markerattrs = (symbol=circle color=red size = 10)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearon yerrorupper=o_pop_fsw_ul_1549w_Fearon errorbarattrs= (color=red thickness = 1);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "MSM 15-64";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 300000 by 25000)  valueattrs=(size=10);

label n_msm_1564_       	= "Model 15-49";

series  x=cald y=n_msm_1564_  /           lineattrs = (color=black thickness = 2);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Pregnant women living with HIV";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 300000 by 25000)  valueattrs=(size=10);

label n_hiv_pregnant     	= "Model 15-49";

series  x=cald y=n_hiv_pregnant  /           lineattrs = (color=black thickness = 2);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Births to HIV+ women";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 300000 by 25000)  valueattrs=(size=10);

label n_give_birth_with_hiv     	= "Model 15-49";

series  x=cald y=n_give_birth_with_hiv  /           lineattrs = (color=black thickness = 2);
run;quit; 

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of VL measures per year";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 1000000 by 50000)  valueattrs=(size=10);

label n_vm_this_per    	= "Model";

series  x=cald y=n_vm_this_per  /           lineattrs = (color=black thickness = 2);
run;quit; 

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of CD4 measures per year";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 1000000 by 50000)  valueattrs=(size=10);

label n_cd4m_this_per    	= "Model";

series  x=cald y=n_cd4m_this_per  /           lineattrs = (color=black thickness = 2);
run;quit; 

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of VMMCs";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 300000 by 25000)  valueattrs=(size=10);

label n_vmmc1549m    = "Model 15-49";
label n_vmmc_all    = "Model 10+";
label o_s_new_vmmc  = "WHO 15+";
label o_s_new_vmmc_1049m  = "Ministry of Health 10+";
label o_s_new_vmmc_all = "UNAIDS 10+";

series  x=cald y=n_vmmc1549m /           lineattrs = (color=black thickness = 2);
series  x=cald y=n_vmmc_all /           lineattrs = (color=blue thickness = 2);


scatter x=cald y=o_s_new_vmmc / markerattrs = (symbol=circle color=red size = 10);
scatter x=cald y=o_s_new_vmmc_1049m / markerattrs = (symbol=circle color=green size = 10);
scatter x=cald y=o_s_new_vmmc_all / markerattrs = (symbol=circle color=blue size = 10);
run;quit; 

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of self tests";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 7000000 by 1000000)  valueattrs=(size=10);

label n_selftested    	= "Model";
label o_n_hivst_primd  = "MoH: Self tests distributed for primary use";

series  x=cald y=n_selftested /           lineattrs = (color=black thickness = 2);

scatter x=cald y=o_n_hivst_primd/ markerattrs = (symbol=circle color=red size = 10);
run;quit; 


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of tests";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 40000000 by 25000)  valueattrs=(size=10);

label n_tested    	= "Model 15+";
label o_s_tested_1549_py_garcpr  = "UNAIDS 15-49";
label target_s_tested_1549_py_NSP  = "NSP targets";
label o_s_test_15ov_py_z = "Ministry of Health";
label o_s_rec_htc_Z_all_ly_PSI = "PSI";

series  x=cald y=n_tested /           lineattrs = (color=black thickness = 2);

scatter x=cald y=o_s_tested_1549_py_garcpr/ markerattrs = (symbol=circle color=red size = 10);
scatter x=cald y=target_s_tested_1549_py_NSP/ markerattrs = (symbol=circle color=green size = 10);
scatter x=cald y=o_s_test_15ov_py_z/ markerattrs = (symbol=circle color=blue size = 10);
scatter x=cald y=o_s_rec_htc_Z_all_ly_PSI/ markerattrs = (symbol=circle color=orange size = 10);
run;quit; 


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of infants tested at birth";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 75000 by 10000)  valueattrs=(size=10);

label n_infbirth_testing    	= "Model 15+";

series  x=cald y=n_infbirth_testing /           lineattrs = (color=black thickness = 2);
run;quit; 

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of infants tested post delivery";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2030  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 300000 by 30000)  valueattrs=(size=10);

label n_postdel_testing    	= "Model 15+";

series  x=cald y=n_postdel_testing /           lineattrs = (color=black thickness = 2);
run;quit; 

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion diagnosed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2030 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p_diag = "Model";
label o_p_diag_1549_dhs = "DHS 15-49";
label o_p_diag_1564_zimphia = "ZIMPHIA 15-64";
label o_p_diag_15pl_zimphia = "ZIMPHIA 15+";

series  x=cald y=p_diag/	lineattrs = (color=black thickness = 2);

scatter x=cald y=o_p_diag_1564_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_15pl_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_1549_dhs / markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2030 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p_onart_diag = "Model";
label o_p_onart_1564_diag_zimphia = "ZIMPHIA 15-64";
label o_p_onart_15pl_diag_zimphia = "ZIMPHIA 15+";

series  x=cald y=p_onart_diag/	lineattrs = (color=black thickness = 2);

scatter x=cald y=o_p_onart_1564_diag_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_onart_15pl_diag_zimphia/ markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p_onart_vl1000_ = "Model";
label o_p_vlsupp_1564_Zimphia = "ZIMPHIA 15-64";
label o_p_vlsupp_15pl_Zimphia = "ZIMPHIA 15+";

series  x=cald y=p_onart_vl1000_/	lineattrs = (color=black thickness = 2);

scatter x=cald y=o_p_vlsupp_1564_Zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_vlsupp_15pl_Zimphia/ markerattrs=(symbol=circle color=red size=10);
run;quit;

ods rtf close;
ods listing;
run;


***Creating output dataset for all vars other than prep;

proc transpose data=stocks out=outputs_27Jan26; id cald; run;




***Now do the same again but just with the prep vars, using option=7 to ensure inclusion of Len;
data y1; 
set a.long_gen_07Jan26; 
run;


%let op_num=7;

*Use SQ for most outputs, but use the PrEP KP scenario for the PrEP outputs as inj PrEP is not introduced in SQ;

*This means need to overwrite the SQ PrEP outputs with the option=xx ones;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Variable lists;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%let stock_list_a = 

/*n_alive1564_			n_alive				n_hivge15_			n_hivge1564_		n_agyw			n_agyw_pg
n_sw_1549_				n_msm_1564_			n_hiv_pregnant		n_give_birth_with_hiv				s_onart
n_vm_this_per		 	n_cd4m_this_per		n_vmmc				n_selftested		n_tested		n_pregnant_onart
n_infbirth_testing		n_postdel_testing	p_diag				p_onart_diag		p_onart_vl1000_*/
n_onprep_oral			n_onprep_cab	n_onprep_len
;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Macros;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* var_stock macro takes the mid-year data point;
%macro var_stock_a(v=);

* &v ;

* option is set to &op_num - defined below where macro is run;

* stock ;

* Use option 0 outputs for years 1985-2023;


proc means noprint data=y1; var &v; output out=y1_2000 mean= &v;  where 2000 <= cald <2001 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2001 mean= &v;  where 2001 <= cald <2002 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2002 mean= &v;  where 2002 <= cald <2003 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2003 mean= &v;  where 2003 <= cald <2004 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2004 mean= &v;  where 2004 <= cald <2005 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2005 mean= &v;  where 2005 <= cald <2006 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2006 mean= &v;  where 2006 <= cald <2007 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2007 mean= &v;  where 2007 <= cald <2008 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2008 mean= &v;  where 2008 <= cald <2009 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2009 mean= &v;  where 2009 <= cald <2010 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2010 mean= &v;  where 2010 <= cald <2011 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2011 mean= &v;  where 2011 <= cald <2012 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2012 mean= &v;  where 2012 <= cald <2013 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2013 mean= &v;  where 2013 <= cald <2014 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2014 mean= &v;  where 2014 <= cald <2015 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2015 mean= &v;  where 2015 <= cald <2016 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2016 mean= &v;  where 2016 <= cald <2017 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2017 mean= &v;  where 2017 <= cald <2018 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2018 mean= &v;  where 2018 <= cald <2019 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2019 mean= &v;  where 2019 <= cald <2020 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2020 mean= &v;  where 2020 <= cald <2021 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2021 mean= &v;  where 2021 <= cald <2022 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2022 mean= &v;  where 2022 <= cald <2023 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2023 mean= &v;  where 2023 <= cald <2024 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2024 mean= &v;  where 2024 <= cald <2025 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2025 mean= &v;  where 2025 <= cald <2026 and option = 0;
proc means noprint data=y1; var &v; output out=y1_2026 mean= &v;  where 2026 <= cald <2027 and option = &op_num;
proc means noprint data=y1; var &v; output out=y1_2027 mean= &v;  where 2027 <= cald <2028 and option = &op_num;
proc means noprint data=y1; var &v; output out=y1_2028 mean= &v;  where 2028 <= cald <2029 and option = &op_num;
proc means noprint data=y1; var &v; output out=y1_2029 mean= &v;  where 2029 <= cald <2030 and option = &op_num;
proc means noprint data=y1; var &v; output out=y1_2030 mean= &v;  where 2030 <= cald <2031 and option = &op_num;


	
data &v ; set  
y1_2000  y1_2001  y1_2002  y1_2003  y1_2004 y1_2005  y1_2006  y1_2007  y1_2008  y1_2009  y1_2010  y1_2011  y1_2012  y1_2013  y1_2014  y1_2015  y1_2016  y1_2017  y1_2018
y1_2019  y1_2020  y1_2021  y1_2022  y1_2023 y1_2024  y1_2025  y1_2026  y1_2027  y1_2028  y1_2029  y1_2030  
;  
*drop _NAME_ _TYPE_ _FREQ_;

%mend var_stock_a;


* make_stocks macro runs the var_stock macro through a list of variable names;
%macro make_stocks_a;
	%let n=%sysfunc(countw(&stock_list_a));	/* number of variables in stock_list */
    %do i=1 %to &n;
        %let var=%scan(&stock_list_a, &i);
        %var_stock_a(v=&var);
    %end;
%mend;


* Note years 1985-2023 are option 0 and 2024 onwards are selected option;
data year;
input year;
cards;

2000 
2001 
2002 
2003 
2004 
2005 
2006 
2007 
2008 
2009 
2010 
2011 
2012 
2013 
2014 
2015 
2016 
2017 
2018 
2019 
2020 
2021 
2022 
2023 
2024 
2025 
2026 
2027 
2028 
2029 
2030 


proc contents; 
run;

%make_stocks_a;run;

data stocks1 ; 
merge year &stock_list_a;
drop _TYPE_ _FREQ_ ;***dropping the prep vars as inj prep was not introduced so need to overwrite these by running with option=7;
rename year=cald;
run;


data c1;
set stocks1;

%include "C:\Users\lovel\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_Zimbabwe_Jan2026_genesis.sas";by cald;
run;


data d1;
set c1;
%include "C:\Users\Lovel\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_FSW_Zimbabwe_genesis.sas"; by cald;
run;

proc sgplot data=d1; 
Title    height=1.5 justify=center "Currently on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2030 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 100000 by 10000) valueattrs=(size=10);

label n_onprep_oral = "Model oral PrEP";
label n_onprep_len = "Model len PrEP";
label o_n_prep_all_NSP = "National Strategic Plan 2021-25";

series  x=cald y=n_onprep_oral/	lineattrs = (color=black thickness = 2);
series  x=cald y=n_onprep_len/	lineattrs = (color=blue thickness = 2);

scatter x=cald y=o_n_prep_all_NSP/ markerattrs=(symbol=circle color=red size=10);
run;quit;


proc transpose data=stocks1 out=outputs_27Jan26_1; id cald; run;


data final;
set outputs_27Jan26 outputs_27Jan26_1;
run;

data final1;
set final;
keep _NAME_ _2024 _2025 _2026 _2027 _2028 _2029 _2030;
run;

proc export data=final1
	outfile= "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\outputs_2024_2030.csv"
	dbms=csv replace; 
	putnames=yes;
run;
