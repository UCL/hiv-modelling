
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

n_alive1564_			n_alive				n_hivge15m			n_hivge1564_		n_agyw			n_agyw_pg
n_sw_1564_				n_msm_1564_			n_hiv_pregnant		n_give_birth_with_hiv				s_onart
n_vm_this_per		 	n_cd4m_this_per		n_vmmc				n_onprep_oral		n_onprep_cab	n_onprep_len
n_selftested		 	n_tested			n_pregnant_onart	n_infbirth_testing	n_postdel_testing
p_diag					p_onart_diag		p_onart_vl1000_
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
run;
