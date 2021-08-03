
libname a "/home/rmjllob/Scratch";


data y; set a.vmmc_25_06_21_10r;run;


proc freq;table option_new;run;



  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

proc means  noprint data=y; var &v; output out=y_21 mean= &v._21; by run ; where 2021.5 <= cald < 2022.5; 

***outputs in 2040;
proc means noprint data=y; var &v; output out=y_40_41 mean= &v._40_41; by run option_new ; where 2040.0 <= cald < 2041.0; 

proc means noprint data=y; var &v; output out=y_20_21 mean= &v._20_21; by run option_new ; where 2020.5 <= cald < 2021.5;
proc means noprint data=y; var &v; output out=y_21_22 mean= &v._21_22; by run option_new ; where 2021.5 <= cald < 2022.5;

proc means noprint data=y; var &v; output out=y_21_26 mean= &v._21_26; by run option_new ; where 2021.5 <= cald < 2026.50;
proc means noprint data=y; var &v; output out=y_21_41 mean= &v._21_41; by run option_new ; where 2021.5 <= cald < 2041.50;
proc means noprint data=y; var &v; output out=y_21_71 mean= &v._21_71; by run option_new ; where 2021.5 <= cald < 2071.50;

proc sort data=y_40_41; by run; proc transpose data=y_40_41 out=t_40_41 prefix=&v._40_41_; var &v._40_41; by run;
proc sort data=y_20_21; by run; proc transpose data=y_20_21 out=t_20_21 prefix=&v._20_21_; var &v._20_21; by run;
proc sort data=y_21_22; by run; proc transpose data=y_21_22 out=t_21_22 prefix=&v._21_22_; var &v._21_22; by run;
proc sort data=y_21_26; by run; proc transpose data=y_21_26 out=t_21_26 prefix=&v._21_26_; var &v._21_26; by run;
proc sort data=y_21_41; by run; proc transpose data=y_21_41 out=t_21_41 prefix=&v._21_41_; var &v._21_41; by run;
proc sort data=y_21_71; by run; proc transpose data=y_21_71 out=t_21_71 prefix=&v._21_71_; var &v._21_71; by run;


data &v ; merge  y_21 t_40_41 t_20_21 t_21_22 t_21_26 t_21_41 t_21_71 ;  
/* data &v ; merge    y_19 y_20 t_20b t_21 t_20_21  t_20_25  t_20_70 ; */ 

/*
%macro var(v=);
proc means noprint data=y; var &v; output out=y_20_ mean= &v._20_; by run option_new ; where 2020 <= cald < 2021;
proc means noprint data=y; var &v; output out=y_21_ mean= &v._21_; by run option_new ; where 2021 <= cald < 2022;
proc means noprint data=y; var &v; output out=y_22_ mean= &v._22_; by run option_new ; where 2022 <= cald < 2023;
proc means noprint data=y; var &v; output out=y_23_ mean= &v._23_; by run option_new ; where 2023 <= cald < 2024;
proc means noprint data=y; var &v; output out=y_24_ mean= &v._24_; by run option_new ; where 2024 <= cald < 2025;
proc means noprint data=y; var &v; output out=y_25_ mean= &v._25_; by run option_new ; where 2025 <= cald < 2026;
proc means noprint data=y; var &v; output out=y_26_ mean= &v._26_; by run option_new ; where 2026 <= cald < 2027;
proc means noprint data=y; var &v; output out=y_27_ mean= &v._27_; by run option_new ; where 2027 <= cald < 2028;
proc means noprint data=y; var &v; output out=y_28_ mean= &v._28_; by run option_new ; where 2028 <= cald < 2029;
proc means noprint data=y; var &v; output out=y_29_ mean= &v._29_; by run option_new ; where 2029 <= cald < 2030;
proc means noprint data=y; var &v; output out=y_30_ mean= &v._30_; by run option_new ; where 2030 <= cald < 2031;

proc means noprint data=y; var &v; output out=y_31_ mean= &v._31_; by run option_new ; where 2031 <= cald < 2032;
proc means noprint data=y; var &v; output out=y_32_ mean= &v._32_; by run option_new ; where 2032 <= cald < 2033;
proc means noprint data=y; var &v; output out=y_33_ mean= &v._33_; by run option_new ; where 2033 <= cald < 2034;
proc means noprint data=y; var &v; output out=y_34_ mean= &v._34_; by run option_new ; where 2034 <= cald < 2035;
proc means noprint data=y; var &v; output out=y_35_ mean= &v._35_; by run option_new ; where 2035 <= cald < 2036;
proc means noprint data=y; var &v; output out=y_36_ mean= &v._36_; by run option_new ; where 2036 <= cald < 2037;
proc means noprint data=y; var &v; output out=y_37_ mean= &v._37_; by run option_new ; where 2037 <= cald < 2038;
proc means noprint data=y; var &v; output out=y_38_ mean= &v._38_; by run option_new ; where 2038 <= cald < 2039;
proc means noprint data=y; var &v; output out=y_39_ mean= &v._39_; by run option_new ; where 2039 <= cald < 2040;
proc means noprint data=y; var &v; output out=y_40_ mean= &v._40_; by run option_new ; where 2040 <= cald < 2041;

proc means noprint data=y; var &v; output out=y_41_ mean= &v._41_; by run option_new ; where 2041 <= cald < 2042;
proc means noprint data=y; var &v; output out=y_42_ mean= &v._42_; by run option_new ; where 2042 <= cald < 2043;
proc means noprint data=y; var &v; output out=y_43_ mean= &v._43_; by run option_new ; where 2043 <= cald < 2044;
proc means noprint data=y; var &v; output out=y_44_ mean= &v._44_; by run option_new ; where 2044 <= cald < 2045;
proc means noprint data=y; var &v; output out=y_45_ mean= &v._45_; by run option_new ; where 2045 <= cald < 2046;
proc means noprint data=y; var &v; output out=y_46_ mean= &v._46_; by run option_new ; where 2046 <= cald < 2047;
proc means noprint data=y; var &v; output out=y_47_ mean= &v._47_; by run option_new ; where 2047 <= cald < 2048;
proc means noprint data=y; var &v; output out=y_48_ mean= &v._48_; by run option_new ; where 2048 <= cald < 2049;
proc means noprint data=y; var &v; output out=y_49_ mean= &v._49_; by run option_new ; where 2049 <= cald < 2050;
proc means noprint data=y; var &v; output out=y_50_ mean= &v._50_; by run option_new ; where 2050 <= cald < 2051;

proc means noprint data=y; var &v; output out=y_51_ mean= &v._51_; by run option_new ; where 2051 <= cald < 2052;
proc means noprint data=y; var &v; output out=y_52_ mean= &v._52_; by run option_new ; where 2052 <= cald < 2053;
proc means noprint data=y; var &v; output out=y_53_ mean= &v._53_; by run option_new ; where 2053 <= cald < 2054;
proc means noprint data=y; var &v; output out=y_54_ mean= &v._54_; by run option_new ; where 2054 <= cald < 2055;
proc means noprint data=y; var &v; output out=y_55_ mean= &v._55_; by run option_new ; where 2055 <= cald < 2056;
proc means noprint data=y; var &v; output out=y_56_ mean= &v._56_; by run option_new ; where 2056 <= cald < 2057;
proc means noprint data=y; var &v; output out=y_57_ mean= &v._57_; by run option_new ; where 2057 <= cald < 2058;
proc means noprint data=y; var &v; output out=y_58_ mean= &v._58_; by run option_new ; where 2058 <= cald < 2059;
proc means noprint data=y; var &v; output out=y_59_ mean= &v._59_; by run option_new ; where 2059 <= cald < 2060;
proc means noprint data=y; var &v; output out=y_60_ mean= &v._60_; by run option_new ; where 2060 <= cald < 2061;

proc means noprint data=y; var &v; output out=y_61_ mean= &v._61_; by run option_new ; where 2061 <= cald < 2062;
proc means noprint data=y; var &v; output out=y_62_ mean= &v._62_; by run option_new ; where 2062 <= cald < 2063;
proc means noprint data=y; var &v; output out=y_63_ mean= &v._63_; by run option_new ; where 2063 <= cald < 2064;
proc means noprint data=y; var &v; output out=y_64_ mean= &v._64_; by run option_new ; where 2064 <= cald < 2065;
proc means noprint data=y; var &v; output out=y_65_ mean= &v._65_; by run option_new ; where 2065 <= cald < 2066;
proc means noprint data=y; var &v; output out=y_66_ mean= &v._66_; by run option_new ; where 2066 <= cald < 2067;
proc means noprint data=y; var &v; output out=y_67_ mean= &v._67_; by run option_new ; where 2067 <= cald < 2068;
proc means noprint data=y; var &v; output out=y_68_ mean= &v._68_; by run option_new ; where 2068 <= cald < 2069;
proc means noprint data=y; var &v; output out=y_69_ mean= &v._69_; by run option_new ; where 2069 <= cald < 2070;
proc means noprint data=y; var &v; output out=y_70_ mean= &v._70_; by run option_new ; where 2070 <= cald < 2071;

proc sort data=y_20_; by run; proc transpose data=y_20_ out=t_20_ prefix=&v._20_; var &v._20_; by run;
proc sort data=y_21_; by run; proc transpose data=y_21_ out=t_21_ prefix=&v._21_; var &v._21_; by run;
proc sort data=y_22_; by run; proc transpose data=y_22_ out=t_22_ prefix=&v._22_; var &v._22_; by run;
proc sort data=y_23_; by run; proc transpose data=y_23_ out=t_23_ prefix=&v._23_; var &v._23_; by run;
proc sort data=y_24_; by run; proc transpose data=y_24_ out=t_24_ prefix=&v._24_; var &v._24_; by run;
proc sort data=y_25_; by run; proc transpose data=y_25_ out=t_25_ prefix=&v._25_; var &v._25_; by run;
proc sort data=y_26_; by run; proc transpose data=y_26_ out=t_26_ prefix=&v._26_; var &v._26_; by run;
proc sort data=y_27_; by run; proc transpose data=y_27_ out=t_27_ prefix=&v._27_; var &v._27_; by run;
proc sort data=y_28_; by run; proc transpose data=y_28_ out=t_28_ prefix=&v._28_; var &v._28_; by run;
proc sort data=y_29_; by run; proc transpose data=y_29_ out=t_29_ prefix=&v._29_; var &v._29_; by run;
proc sort data=y_30_; by run; proc transpose data=y_30_ out=t_30_ prefix=&v._30_; var &v._30_; by run;

proc sort data=y_31_; by run; proc transpose data=y_31_ out=t_31_ prefix=&v._31_; var &v._31_; by run;
proc sort data=y_32_; by run; proc transpose data=y_32_ out=t_32_ prefix=&v._32_; var &v._32_; by run;
proc sort data=y_33_; by run; proc transpose data=y_33_ out=t_33_ prefix=&v._33_; var &v._33_; by run;
proc sort data=y_34_; by run; proc transpose data=y_34_ out=t_34_ prefix=&v._34_; var &v._34_; by run;
proc sort data=y_35_; by run; proc transpose data=y_35_ out=t_35_ prefix=&v._35_; var &v._35_; by run;
proc sort data=y_36_; by run; proc transpose data=y_36_ out=t_36_ prefix=&v._36_; var &v._36_; by run;
proc sort data=y_37_; by run; proc transpose data=y_37_ out=t_37_ prefix=&v._37_; var &v._37_; by run;
proc sort data=y_38_; by run; proc transpose data=y_38_ out=t_38_ prefix=&v._38_; var &v._38_; by run;
proc sort data=y_39_; by run; proc transpose data=y_39_ out=t_39_ prefix=&v._39_; var &v._39_; by run;
proc sort data=y_40_; by run; proc transpose data=y_40_ out=t_40_ prefix=&v._40_; var &v._40_; by run;

proc sort data=y_41_; by run; proc transpose data=y_41_ out=t_41_ prefix=&v._41_; var &v._41_; by run;
proc sort data=y_42_; by run; proc transpose data=y_42_ out=t_42_ prefix=&v._42_; var &v._42_; by run;
proc sort data=y_43_; by run; proc transpose data=y_43_ out=t_43_ prefix=&v._43_; var &v._43_; by run;
proc sort data=y_44_; by run; proc transpose data=y_44_ out=t_44_ prefix=&v._44_; var &v._44_; by run;
proc sort data=y_45_; by run; proc transpose data=y_45_ out=t_45_ prefix=&v._45_; var &v._45_; by run;
proc sort data=y_46_; by run; proc transpose data=y_46_ out=t_46_ prefix=&v._46_; var &v._46_; by run;
proc sort data=y_47_; by run; proc transpose data=y_47_ out=t_47_ prefix=&v._47_; var &v._47_; by run;
proc sort data=y_48_; by run; proc transpose data=y_48_ out=t_48_ prefix=&v._48_; var &v._48_; by run;
proc sort data=y_49_; by run; proc transpose data=y_49_ out=t_49_ prefix=&v._49_; var &v._49_; by run;
proc sort data=y_50_; by run; proc transpose data=y_50_ out=t_50_ prefix=&v._50_; var &v._50_; by run;

proc sort data=y_51_; by run; proc transpose data=y_51_ out=t_51_ prefix=&v._51_; var &v._51_; by run;
proc sort data=y_52_; by run; proc transpose data=y_52_ out=t_52_ prefix=&v._52_; var &v._52_; by run;
proc sort data=y_53_; by run; proc transpose data=y_53_ out=t_53_ prefix=&v._53_; var &v._53_; by run;
proc sort data=y_54_; by run; proc transpose data=y_54_ out=t_54_ prefix=&v._54_; var &v._54_; by run;
proc sort data=y_55_; by run; proc transpose data=y_55_ out=t_55_ prefix=&v._55_; var &v._55_; by run;
proc sort data=y_56_; by run; proc transpose data=y_56_ out=t_56_ prefix=&v._56_; var &v._56_; by run;
proc sort data=y_57_; by run; proc transpose data=y_57_ out=t_57_ prefix=&v._57_; var &v._57_; by run;
proc sort data=y_58_; by run; proc transpose data=y_58_ out=t_58_ prefix=&v._58_; var &v._58_; by run;
proc sort data=y_59_; by run; proc transpose data=y_59_ out=t_59_ prefix=&v._59_; var &v._59_; by run;
proc sort data=y_60_; by run; proc transpose data=y_60_ out=t_60_ prefix=&v._60_; var &v._60_; by run;

proc sort data=y_61_; by run; proc transpose data=y_61_ out=t_61_ prefix=&v._61_; var &v._61_; by run;
proc sort data=y_62_; by run; proc transpose data=y_62_ out=t_62_ prefix=&v._62_; var &v._62_; by run;
proc sort data=y_63_; by run; proc transpose data=y_63_ out=t_63_ prefix=&v._63_; var &v._63_; by run;
proc sort data=y_64_; by run; proc transpose data=y_64_ out=t_64_ prefix=&v._64_; var &v._64_; by run;
proc sort data=y_65_; by run; proc transpose data=y_65_ out=t_65_ prefix=&v._65_; var &v._65_; by run;
proc sort data=y_66_; by run; proc transpose data=y_66_ out=t_66_ prefix=&v._66_; var &v._66_; by run;
proc sort data=y_67_; by run; proc transpose data=y_67_ out=t_67_ prefix=&v._67_; var &v._67_; by run;
proc sort data=y_68_; by run; proc transpose data=y_68_ out=t_68_ prefix=&v._68_; var &v._68_; by run;
proc sort data=y_69_; by run; proc transpose data=y_69_ out=t_69_ prefix=&v._69_; var &v._69_; by run;
proc sort data=y_70_; by run; proc transpose data=y_70_ out=t_70_ prefix=&v._70_; var &v._70_; by run;


data &v ; merge  
t_20_ t_21_ t_22_ t_23_ t_24_ t_25_ t_26_ t_27_ t_28_ t_29_ t_30_
t_30_ t_31_ t_32_ t_33_ t_34_ t_35_ t_36_ t_37_ t_38_ t_39_ t_40_
t_40_ t_41_ t_42_ t_43_ t_44_ t_45_ t_46_ t_47_ t_48_ t_49_ t_50_
t_50_ t_51_ t_52_ t_53_ t_54_ t_55_ t_56_ t_57_ t_58_ t_59_ t_60_
t_60_ t_61_ t_62_ t_63_ t_64_ t_65_ t_66_ t_67_ t_68_ t_69_ t_70_
; 


drop _NAME_ _TYPE_ _FREQ_;

%mend var;
%var(v=p_mcirc_1549m);%var(v=p_onart);%var(v=incidence1564);%var(v=p_vl1000_m);%var(v=p_onart_vl1000_m); run;

data   wide_outputs; 
merge p_mcirc_1549m p_onart incidence1564 p_vl1000_m p_onart_vl1000_m;run;


proc means n p50 p5 p95;var
p_mcirc_1549m_20_1 p_mcirc_1549m_21_1 p_mcirc_1549m_22_1 p_mcirc_1549m_23_1 p_mcirc_1549m_24_1 
p_mcirc_1549m_25_1 p_mcirc_1549m_26_1 p_mcirc_1549m_27_1 p_mcirc_1549m_28_1 p_mcirc_1549m_29_1 
p_mcirc_1549m_30_1 p_mcirc_1549m_31_1 p_mcirc_1549m_32_1 p_mcirc_1549m_33_1 p_mcirc_1549m_34_1 
p_mcirc_1549m_35_1 p_mcirc_1549m_36_1 p_mcirc_1549m_37_1 p_mcirc_1549m_38_1 p_mcirc_1549m_39_1 
p_mcirc_1549m_40_1 p_mcirc_1549m_41_1 p_mcirc_1549m_42_1 p_mcirc_1549m_43_1 p_mcirc_1549m_44_1 
p_mcirc_1549m_45_1 p_mcirc_1549m_46_1 p_mcirc_1549m_47_1 p_mcirc_1549m_48_1 p_mcirc_1549m_49_1 
p_mcirc_1549m_50_1 p_mcirc_1549m_51_1 p_mcirc_1549m_52_1 p_mcirc_1549m_53_1 p_mcirc_1549m_54_1
p_mcirc_1549m_55_1 p_mcirc_1549m_56_1 p_mcirc_1549m_57_1 p_mcirc_1549m_58_1 p_mcirc_1549m_59_1 
p_mcirc_1549m_60_1 p_mcirc_1549m_61_1 p_mcirc_1549m_62_1 p_mcirc_1549m_63_1 p_mcirc_1549m_64_1
p_mcirc_1549m_65_1 p_mcirc_1549m_66_1 p_mcirc_1549m_67_1 p_mcirc_1549m_68_1 p_mcirc_1549m_69_1 p_mcirc_1549m_70_1

p_mcirc_1549m_21_2 p_mcirc_1549m_22_2 p_mcirc_1549m_23_2 p_mcirc_1549m_24_2 
p_mcirc_1549m_25_2 p_mcirc_1549m_26_2 p_mcirc_1549m_27_2 p_mcirc_1549m_28_2 p_mcirc_1549m_29_2 
p_mcirc_1549m_30_2 p_mcirc_1549m_31_2 p_mcirc_1549m_32_2 p_mcirc_1549m_33_2 p_mcirc_1549m_34_2 
p_mcirc_1549m_35_2 p_mcirc_1549m_36_2 p_mcirc_1549m_37_2 p_mcirc_1549m_38_2 p_mcirc_1549m_39_2 
p_mcirc_1549m_40_2 p_mcirc_1549m_41_2 p_mcirc_1549m_42_2 p_mcirc_1549m_43_2 p_mcirc_1549m_44_2 
p_mcirc_1549m_45_2 p_mcirc_1549m_46_2 p_mcirc_1549m_47_2 p_mcirc_1549m_48_2 p_mcirc_1549m_49_2 
p_mcirc_1549m_50_2 p_mcirc_1549m_51_2 p_mcirc_1549m_52_2 p_mcirc_1549m_53_2 p_mcirc_1549m_54_2
p_mcirc_1549m_55_2 p_mcirc_1549m_56_2 p_mcirc_1549m_57_2 p_mcirc_1549m_58_2 p_mcirc_1549m_59_2 
p_mcirc_1549m_60_2 p_mcirc_1549m_61_2 p_mcirc_1549m_62_2 p_mcirc_1549m_63_2 p_mcirc_1549m_64_2
p_mcirc_1549m_65_2 p_mcirc_1549m_66_2 p_mcirc_1549m_67_2 p_mcirc_1549m_68_2 p_mcirc_1549m_69_2 p_mcirc_1549m_70_2;run;

proc means n p50 p5 p95;var
p_onart_20_1 p_onart_21_1 p_onart_22_1 p_onart_23_1 p_onart_24_1 
p_onart_25_1 p_onart_26_1 p_onart_27_1 p_onart_28_1 p_onart_29_1 
p_onart_30_1 p_onart_31_1 p_onart_32_1 p_onart_33_1 p_onart_34_1 
p_onart_35_1 p_onart_36_1 p_onart_37_1 p_onart_38_1 p_onart_39_1 
p_onart_40_1 p_onart_41_1 p_onart_42_1 p_onart_43_1 p_onart_44_1 
p_onart_45_1 p_onart_46_1 p_onart_47_1 p_onart_48_1 p_onart_49_1 
p_onart_50_1 p_onart_51_1 p_onart_52_1 p_onart_53_1 p_onart_54_1
p_onart_55_1 p_onart_56_1 p_onart_57_1 p_onart_58_1 p_onart_59_1 
p_onart_60_1 p_onart_61_1 p_onart_62_1 p_onart_63_1 p_onart_64_1
p_onart_65_1 p_onart_66_1 p_onart_67_1 p_onart_68_1 p_onart_69_1 p_onart_70_1

p_onart_21_2 p_onart_22_2 p_onart_23_2 p_onart_24_2 
p_onart_25_2 p_onart_26_2 p_onart_27_2 p_onart_28_2 p_onart_29_2 
p_onart_30_2 p_onart_31_2 p_onart_32_2 p_onart_33_2 p_onart_34_2 
p_onart_35_2 p_onart_36_2 p_onart_37_2 p_onart_38_2 p_onart_39_2 
p_onart_40_2 p_onart_41_2 p_onart_42_2 p_onart_43_2 p_onart_44_2 
p_onart_45_2 p_onart_46_2 p_onart_47_2 p_onart_48_2 p_onart_49_2 
p_onart_50_2 p_onart_51_2 p_onart_52_2 p_onart_53_2 p_onart_54_2
p_onart_55_2 p_onart_56_2 p_onart_57_2 p_onart_58_2 p_onart_59_2 
p_onart_60_2 p_onart_61_2 p_onart_62_2 p_onart_63_2 p_onart_64_2
p_onart_65_2 p_onart_66_2 p_onart_67_2 p_onart_68_2 p_onart_69_2 p_onart_70_2;run;

proc means n p50 p5 p95;var
incidence1564_20_1 incidence1564_21_1 incidence1564_22_1 incidence1564_23_1 incidence1564_24_1 
incidence1564_25_1 incidence1564_26_1 incidence1564_27_1 incidence1564_28_1 incidence1564_29_1 
incidence1564_30_1 incidence1564_31_1 incidence1564_32_1 incidence1564_33_1 incidence1564_34_1 
incidence1564_35_1 incidence1564_36_1 incidence1564_37_1 incidence1564_38_1 incidence1564_39_1 
incidence1564_40_1 incidence1564_41_1 incidence1564_42_1 incidence1564_43_1 incidence1564_44_1 
incidence1564_45_1 incidence1564_46_1 incidence1564_47_1 incidence1564_48_1 incidence1564_49_1 
incidence1564_50_1 incidence1564_51_1 incidence1564_52_1 incidence1564_53_1 incidence1564_54_1
incidence1564_55_1 incidence1564_56_1 incidence1564_57_1 incidence1564_58_1 incidence1564_59_1 
incidence1564_60_1 incidence1564_61_1 incidence1564_62_1 incidence1564_63_1 incidence1564_64_1
incidence1564_65_1 incidence1564_66_1 incidence1564_67_1 incidence1564_68_1 incidence1564_69_1 incidence1564_70_1

incidence1564_21_2 incidence1564_22_2 incidence1564_23_2 incidence1564_24_2 
incidence1564_25_2 incidence1564_26_2 incidence1564_27_2 incidence1564_28_2 incidence1564_29_2 
incidence1564_30_2 incidence1564_31_2 incidence1564_32_2 incidence1564_33_2 incidence1564_34_2 
incidence1564_35_2 incidence1564_36_2 incidence1564_37_2 incidence1564_38_2 incidence1564_39_2 
incidence1564_40_2 incidence1564_41_2 incidence1564_42_2 incidence1564_43_2 incidence1564_44_2 
incidence1564_45_2 incidence1564_46_2 incidence1564_47_2 incidence1564_48_2 incidence1564_49_2 
incidence1564_50_2 incidence1564_51_2 incidence1564_52_2 incidence1564_53_2 incidence1564_54_2
incidence1564_55_2 incidence1564_56_2 incidence1564_57_2 incidence1564_58_2 incidence1564_59_2 
incidence1564_60_2 incidence1564_61_2 incidence1564_62_2 incidence1564_63_2 incidence1564_64_2
incidence1564_65_2 incidence1564_66_2 incidence1564_67_2 incidence1564_68_2 incidence1564_69_2 incidence1564_70_2;run;



***internal use;
proc means n p50 p5 p95;var
p_vl1000_m_20_1 p_vl1000_m_21_1 p_vl1000_m_22_1 p_vl1000_m_23_1 p_vl1000_m_24_1 
p_vl1000_m_25_1 p_vl1000_m_26_1 p_vl1000_m_27_1 p_vl1000_m_28_1 p_vl1000_m_29_1 
p_vl1000_m_30_1 p_vl1000_m_31_1 p_vl1000_m_32_1 p_vl1000_m_33_1 p_vl1000_m_34_1 
p_vl1000_m_35_1 p_vl1000_m_36_1 p_vl1000_m_37_1 p_vl1000_m_38_1 p_vl1000_m_39_1 
p_vl1000_m_40_1 p_vl1000_m_41_1 p_vl1000_m_42_1 p_vl1000_m_43_1 p_vl1000_m_44_1 
p_vl1000_m_45_1 p_vl1000_m_46_1 p_vl1000_m_47_1 p_vl1000_m_48_1 p_vl1000_m_49_1 
p_vl1000_m_50_1 p_vl1000_m_51_1 p_vl1000_m_52_1 p_vl1000_m_53_1 p_vl1000_m_54_1
p_vl1000_m_55_1 p_vl1000_m_56_1 p_vl1000_m_57_1 p_vl1000_m_58_1 p_vl1000_m_59_1 
p_vl1000_m_60_1 p_vl1000_m_61_1 p_vl1000_m_62_1 p_vl1000_m_63_1 p_vl1000_m_64_1
p_vl1000_m_65_1 p_vl1000_m_66_1 p_vl1000_m_67_1 p_vl1000_m_68_1 p_vl1000_m_69_1 p_vl1000_m_70_1

p_onart_vl1000_m_21_1 p_onart_vl1000_m_22_1 p_onart_vl1000_m_23_1 p_onart_vl1000_m_24_1 
p_onart_vl1000_m_25_1 p_onart_vl1000_m_26_1 p_onart_vl1000_m_27_1 p_onart_vl1000_m_28_1 p_onart_vl1000_m_29_1 
p_onart_vl1000_m_30_1 p_onart_vl1000_m_31_1 p_onart_vl1000_m_32_1 p_onart_vl1000_m_33_1 p_onart_vl1000_m_34_1 
p_onart_vl1000_m_35_1 p_onart_vl1000_m_36_1 p_onart_vl1000_m_37_1 p_onart_vl1000_m_38_1 p_onart_vl1000_m_39_1 
p_onart_vl1000_m_40_1 p_onart_vl1000_m_41_1 p_onart_vl1000_m_42_1 p_onart_vl1000_m_43_1 p_onart_vl1000_m_44_1 
p_onart_vl1000_m_45_1 p_onart_vl1000_m_46_1 p_onart_vl1000_m_47_1 p_onart_vl1000_m_48_1 p_onart_vl1000_m_49_1 
p_onart_vl1000_m_50_1 p_onart_vl1000_m_51_1 p_onart_vl1000_m_52_1 p_onart_vl1000_m_53_1 p_onart_vl1000_m_54_1
p_onart_vl1000_m_55_1 p_onart_vl1000_m_56_1 p_onart_vl1000_m_57_1 p_onart_vl1000_m_58_1 p_onart_vl1000_m_59_1 
p_onart_vl1000_m_60_1 p_onart_vl1000_m_61_1 p_onart_vl1000_m_62_1 p_onart_vl1000_m_63_1 p_onart_vl1000_m_64_1
p_onart_vl1000_m_65_1 p_onart_vl1000_m_66_1 p_onart_vl1000_m_67_1 p_onart_vl1000_m_68_1 p_onart_vl1000_m_69_1 p_onart_vl1000_m_70_1;run;

*/

%mend var;

%var(v=incidence_sw);
%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=p_newp_sw); %var(v=prop_sw_newp0);  %var(v=p_newp_prep);
%var(v=n_tested_m);
%var(v=p_tested_past_year_1549m)  ; %var(v=p_tested_past_year_1549w)  ;
%var(v=p_mcirc);%var(v=p_mcirc_inc1014m); %var(v=p_mcirc_1014m);%var(v=p_mcirc_1519m); %var(v=p_mcirc_2024m);%var(v=p_mcirc_2529m);
%var(v=p_mcirc_3034m);%var(v=p_mcirc_3539m);%var(v=p_mcirc_3039m);%var(v=p_mcirc_4044m);%var(v=p_mcirc_4549m); %var(v=p_mcirc_4049m);
%var(v=p_mcirc_50plm); %var(v=p_mcirc_1549m);
%var(v=p_vmmc);%var(v=p_vmmc_inc1014m); %var(v=p_vmmc_1014m);%var(v=p_vmmc_1519m); %var(v=p_vmmc_2024m);%var(v=p_vmmc_2529m); %var(v=p_vmmc_3039m); %var(v=p_vmmc_4049m);
%var(v=p_vmmc_50plm); %var(v=p_vmmc_1549m);
%var(v=p_new_vmmc_u); %var(v=p_new_vmmc_u_1049m); %var(v=p_new_vmmc_1014m_u); %var(v=p_new_vmmc_1519m_u); %var(v=p_new_vmmc_2024m_u);%var(v=p_new_vmmc_2529m_u);
%var(v=p_new_vmmc_3034m_u);%var(v=p_new_vmmc_3539m_u);%var(v=p_new_vmmc_3039m_u);%var(v=p_new_vmmc_4044m_u);%var(v=p_new_vmmc_4549m_u);
%var(v=p_new_vmmc_4049m_u); %var(v=p_new_vmmc_50plm_u); %var(v=p_new_vmmc_1549m_u);
%var(v=prop_w_1549_sw); %var(v=prop_w_ever_sw); %var(v=prop_sw_hiv); %var(v=prop_w_1524_onprep); %var(v=prop_1564_onprep);
%var(v=prop_sw_onprep); %var(v=prevalence1549m); %var(v=prevalence1549w); %var(v=prevalence1549); 
%var(v=prevalence1519w);  	%var(v=prevalence1519m);  	  %var(v=prevalence2024w);  	  %var(v=prevalence2024m);  	  %var(v=prevalence2529w);  	  
%var(v=prevalence2529m);    %var(v=prevalence3034w);    %var(v=prevalence3034m);  	%var(v=prevalence3539w);  	  %var(v=prevalence3539m);  	  
%var(v=prevalence4044w);  	 %var(v=prevalence4044m);  	  %var(v=prevalence4549w);  	  %var(v=prevalence4549m);  
%var(v=prevalence_vg1000); %var(v=incidence1549);   %var(v=prevalence1524w); %var(v=prevalence1524m);   %var(v=prevalence_sw);
%var(v=incidence1549w);  %var(v=incidence1549m); 
%var(v=p_inf_vlsupp);  %var(v=p_inf_newp);  %var(v=p_inf_ep);  %var(v=p_inf_diag);  %var(v=p_inf_naive);   %var(v=p_inf_primary); 
%var(v=mtct_prop); %var(v=p_diag); %var(v=p_diag_m); %var(v=p_diag_w); %var(v=p_diag_sw);
%var(v=p_diag_m1524); %var(v=p_diag_w1524);
%var(v=p_ai_no_arv_c_nnm); %var(v=p_ai_no_arv_c_pim); %var(v=p_ai_no_arv_c_rt184m); %var(v=p_ai_no_arv_c_rt65m); %var(v=p_ai_no_arv_c_rttams); 
%var(v=p_ai_no_arv_c_inm); 
%var(v=p_artexp_diag); %var(v=p_onart_diag); %var(v=p_onart_diag_w); %var(v=p_onart_diag_m); %var(v=p_onart_diag_sw); %var(v=p_efa); %var(v=p_taz);
%var(v=p_ten); %var(v=p_zdv); %var(v=p_dol); %var(v=p_3tc); %var(v=p_lpr); %var(v=p_nev); %var(v=p_onart_vl1000);  %var(v=p_artexp_vl1000);
%var(v=p_vl1000); %var(v=p_vg1000); %var(v=p_vl1000_m);  %var(v=p_vl1000_w);  %var(v=p_vl1000_m_1524);  %var(v=p_vl1000_w_1524);  
%var(v=p_vl1000_art_12m); %var(v=p_vl1000_art_12m_onart); 
%var(v=p_onart_m); %var(v=p_onart_w); 
%var(v=p_onart_vl1000_w); %var(v=p_onart_vl1000_m); %var(v= p_onart_vl1000_1524);  %var(v=p_onart_vl1000_sw);
%var(v=prev_vg1000_newp_m);  %var(v=prev_vg1000_newp_w);  %var(v= p_startedline2) ;
%var(v=p_tle);  %var(v=p_tld);  %var(v=p_zld);  %var(v=p_zla);  %var(v=p_otherreg);  %var(v=p_drug_level_test); %var(v=p_linefail_ge1);
%var(v=aids_death_rate);  %var(v=death_rate_onart); %var(v=ddaly_adults);  

%var(v=dcost);  %var(v= dart_cost_y);
%var(v=dadc_cost);   %var(v=dcd4_cost);   %var(v=dvl_cost);   %var(v=dvis_cost);  %var(v=dcot_cost);   %var(v=dtb_cost);   
%var(v=dres_cost);  %var(v=dtest_cost);   %var(v=d_t_adh_int_cost);   %var(v=dswitchline_cost);  %var(v=dtaz_cost);   %var(v=dcost_drug_level_test);
%var(v=dclin_cost );  
%var(v=dcost_circ );  %var(v=dcost_condom_dn);
%var(v=dcost_prep_visit );   %var(v=dcost_prep );   %var(v=dcost_drug_level_test ); 
%var(v=dcost_clin_care );  %var(v=dcost_non_aids_pre_death );  %var(v=dcost_child_hiv );  %var(v=dzdv_cost );   %var(v=dten_cost );   %var(v=d3tc_cost );   
%var(v=dnev_cost );   %var(v=dlpr_cost );   %var(v=ddar_cost );   %var(v=dtaz_cost );    %var(v=defa_cost );   %var(v=ddol_cost );

%var(v=m15r);  %var(v=m25r);  %var(v=m35r);  %var(v=m45r);  %var(v=m55r);  %var(v=w15r);  %var(v=w25r);  %var(v=w35r);  %var(v=w45r);  %var(v=w55r)
%var(v=r_efa_hiv); %var(v=p_onart_cd4_l200);
%var(v=p_dol_2vg1000_dolr1_adh0); %var(v=p_dol_2vg1000_dolr1_adh1); %var(v=p_dol_2vg1000_dolr0_adh0); %var(v=p_dol_2vg1000_dolr0_adh1);
%var(v=p_onart_cd4_l500);   %var(v=p_startedline2);  %var(v=prop_art_or_prep);  %var(v=n_sw_1564);   %var(v=prop_sw_onprep);   %var(v=p_onart);
%var(v=p_o_zdv_tox);   %var(v=p_o_3tc_tox);   %var(v=p_o_ten_tox);   %var(v=p_o_taz_tox);   %var(v=p_o_lpr_tox);   %var(v=p_o_efa_tox);   
%var(v=p_o_nev_tox);  %var(v=p_o_dol_tox);   %var(v=p_o_zdv_adh_hi);   %var(v=p_o_3tc_adh_hi);   %var(v=p_o_ten_adh_hi);  
%var(v=p_o_taz_adh_hi);   %var(v=p_o_lpr_adh_hi);   %var(v=p_o_efa_adh_hi);   %var(v=p_o_nev_adh_hi);   %var(v=p_o_dol_adh_hi);  
%var(v= p_o_tle_tox);   %var(v=p_o_tld_tox);   %var(v=p_o_zla_tox);   %var(v=p_o_zld_tox);    %var(v=p_o_tle_adh_hi);   %var(v=p_o_tld_adh_hi);   
%var(v=p_o_zla_adh_hi);   %var(v=p_o_zld_adh_hi);   %var(v=p_adh_hi);    %var(v=s_a_zld_if_reg_op_116);
%var(v=p_nactive_ge2p75_xyz);  %var(v=p_adh_hi_xyz_ot1);   %var(v=p_adh_hi_xyz_ot2);   %var(v=p_adh_hi_xyz_itt);   %var(v=p_e_rt65m_xyz);   
%var(v=p_nactive_ge2p00_xyz);   %var(v=p_nactive_ge1p50_xyz); 
%var(v=p_184m_ontle_vlg1000);  %var(v=p_65m_ontle_vlg1000);  %var(v=p_nnm_ontle_vlg1000);   %var(v=p_184m_ontld_vlg1000);   %var(v=p_65m_ontld_vlg1000);  
%var(v=p_nnm_ontld_vlg1000);   %var(v=p_inm_ontld_vlg1000);   %var(v=p_inm_ontld_vlg1000);   
%var(v=p_tams_ontle_vlg1000);  %var(v=p_tams_ontld_vlg1000);  %var(v=p_k65m); %var(v=p_m184m);
%var(v=death_rate);   %var(v=death_rate_hiv); %var(v=death_rate_hiv_m); %var(v=death_rate_hiv_w);
%var(v=death_rate_hiv_all);%var(v=death_rate_hiv_all_m);%var(v=death_rate_hiv_all_w);
%var(v=p_iime_);   %var(v=p_pime_);   %var(v=p_nnme_);     %var(v=n_pregnant_ntd);   %var(v=n_preg_odabe);
%var(v=n_birth_with_inf_child);
%var(v=n_tested); %var(v=test_prop_positive);
%var(v=p_vlg1000_onart_65m);   %var(v=p_vlg1000_onart_184m);   %var(v=p_elig_prep); %var(v=prop_elig_on_prep);   %var(v= n_hiv1_prep);
%var(v= n_prep); %var(v=n_covid); %var(v=n_death_covid);  %var(v=n_death);  %var(v=n_death_hivrel); 
%var(v=p_death_hivrel_age_le64);  %var(v=p_prep_ever); %var(v=p_hiv1_prep);  %var(v=incidence1524w);   %var(v=incidence1524m)
%var(v=n_mcirc1549_py);%var (v=n_mcirc1549_3m);%var(v=n_vmmc1549_py);%var (v=n_vmmc1549_3m);%var (v=n_new_vmmc1549_py);%var (v=n_new_vmmc1049_py);
%var(v=n_new_inf1549m); %var(v=n_new_inf1549);%var(v=s_sw_newp); %var(v=d_n_new_inf1549);%var(v=d_n_infection)
%var(v=ddaly);%var(v=ddaly_adults_Op);

data   wide_outputs; merge incidence_sw
s_alive  p_w_giv_birth_this_per  p_newp_ge1 p_newp_ge5  gender_r_newp
p_newp_sw prop_sw_newp0  p_newp_prep  n_tested_m
p_tested_past_year_1549m  p_tested_past_year_1549w  
p_mcirc  p_mcirc_inc1014m  p_mcirc_1014m  p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3034m p_mcirc_3539m 
p_mcirc_3039m p_mcirc_4044m p_mcirc_4549m p_mcirc_4049m p_mcirc_50plm p_mcirc_1549m
p_vmmc  p_vmmc_inc1014m p_vmmc_1014m p_vmmc_1519m p_vmmc_2024m p_vmmc_2529m p_vmmc_3039m p_vmmc_4049m p_vmmc_50plm p_vmmc_1549m
p_new_vmmc_u  p_new_vmmc_u_1049m  p_new_vmmc_1014m_u  p_new_vmmc_1519m_u p_new_vmmc_2024m_u p_new_vmmc_2529m_u
p_new_vmmc_3034m_u p_new_vmmc_3539m_u p_new_vmmc_3039m_u p_new_vmmc_4044m_u p_new_vmmc_4549m_u p_new_vmmc_4049m_u p_new_vmmc_50plm_u p_new_vmmc_1549m_u
prop_w_1549_sw  prop_w_ever_sw  prop_sw_hiv  prop_w_1524_onprep  prop_1564_onprep  prop_sw_onprep 
prevalence1549m  prevalence1549w  prevalence1549  prevalence1519w  prevalence1519m  prevalence2024w  prevalence2024m
prevalence2529w  prevalence2529m  prevalence3034w prevalence3034m  prevalence3539w  prevalence3539m  	  
prevalence4044w  prevalence4044m  prevalence4549w prevalence4549m  
prevalence_vg1000  incidence1549  prevalence1524w prevalence1524m   prevalence_sw
incidence1549w  incidence1549m 
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary 
mtct_prop  p_diag  p_diag_m  p_diag_w  p_diag_sw  p_diag_m1524  p_diag_w1524
p_ai_no_arv_c_nnm  p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m  p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm 
p_artexp_diag  p_onart_diag  p_onart_diag_w  p_onart_diag_m  p_onart_diag_sw  
p_efa  p_taz  p_ten  p_zdv  p_dol  p_3tc  p_lpr  p_nev  
p_onart_vl1000  p_artexp_vl1000  p_vl1000  p_vg1000  p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m  p_vl1000_art_12m_onart  p_onart_m p_onart_w  p_onart_vl1000_w  p_onart_vl1000_m   p_onart_vl1000_1524  p_onart_vl1000_sw
prev_vg1000_newp_m  prev_vg1000_newp_w  p_startedline2
p_tle  p_tld  p_zld  p_zla  p_otherreg  p_drug_level_test p_linefail_ge1
aids_death_rate  death_rate_onart ddaly_adults  dcost   dart_cost_y
dadc_cost  dcd4_cost  dvl_cost  dvis_cost    dcot_cost  dtb_cost   
dres_cost  dtest_cost  d_t_adh_int_cost  dswitchline_cost  dtaz_cost   dcost_drug_level_test  dclin_cost   
dcost_circ  dcost_condom_dn  dcost_prep_visit  dcost_prep  dcost_drug_level_test  
dcost_clin_care   dcost_non_aids_pre_death   dcost_child_hiv  dzdv_cost  dten_cost  d3tc_cost    
dnev_cost  dlpr_cost  ddar_cost  dtaz_cost  defa_cost  ddol_cost 
m15r  m25r  m35r  m45r  m55r  w15r  w25r  w35r  w45r  w55r
r_efa_hiv  p_onart_cd4_l200
p_dol_2vg1000_dolr1_adh0  p_dol_2vg1000_dolr1_adh1  p_dol_2vg1000_dolr0_adh0  p_dol_2vg1000_dolr0_adh1
p_onart_cd4_l500  p_startedline2  prop_art_or_prep  n_sw_1564   prop_sw_onprep   p_onart
p_o_zdv_tox  p_o_3tc_tox   p_o_ten_tox   p_o_taz_tox   p_o_lpr_tox   p_o_efa_tox   
p_o_nev_tox  p_o_dol_tox   p_o_zdv_adh_hi   p_o_3tc_adh_hi   p_o_ten_adh_hi  
p_o_taz_adh_hi   p_o_lpr_adh_hi   p_o_efa_adh_hi   p_o_nev_adh_hi   p_o_dol_adh_hi  
p_o_tle_tox   p_o_tld_tox   p_o_zla_tox   p_o_zld_tox    p_o_tle_adh_hi   p_o_tld_adh_hi   
p_o_zla_adh_hi   p_o_zld_adh_hi   p_adh_hi    s_a_zld_if_reg_op_116
p_nactive_ge2p75_xyz  p_adh_hi_xyz_ot1   p_adh_hi_xyz_ot2   p_adh_hi_xyz_itt   p_e_rt65m_xyz   
p_nactive_ge2p00_xyz   p_nactive_ge1p50_xyz 
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000   
p_tams_ontle_vlg1000  p_tams_ontld_vlg1000  p_k65m p_m184m
death_rate  death_rate_hiv death_rate_hiv_m death_rate_hiv_w death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w
p_iime_   p_pime_   p_nnme_     n_pregnant_ntd   n_preg_odabe
n_birth_with_inf_child
n_tested test_prop_positive
p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  n_hiv1_prep
n_prep  n_covid  n_death_covid  n_death  n_death_hivrel 
p_death_hivrel_age_le64  p_prep_ever p_hiv1_prep  incidence1524w   incidence1524m
n_mcirc1549_py n_mcirc1549_3m n_vmmc1549_py  n_vmmc1549_3m  n_new_vmmc1549_py  n_new_vmmc1049_py
n_new_inf1549m n_new_inf1549 d_n_new_inf1549 d_n_infection
s_sw_newp ddaly ddaly_adults_Op;
;

proc contents; run;

proc sort; by run; run;



***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2015; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=sf_2021); /*%par(p=dataset);*/
%par(p=sex_beh_trans_matrix_m ); %par(p=sex_beh_trans_matrix_w ); %par(p=sex_age_mixing_matrix_m ); %par(p=sex_age_mixing_matrix_w ); %par(p=p_rred_p );
%par(p=p_hsb_p ); %par(p=newp_factor ); %par(p=eprate ) %par(p=conc_ep ); %par(p=ch_risk_diag ); %par(p=ch_risk_diag_newp );
%par(p=ych_risk_beh_newp ); %par(p=ych2_risk_beh_newp ); %par(p=ych_risk_beh_ep ); %par(p=exp_setting_lower_p_vl1000 );
%par(p=external_exp_factor ); %par(p=rate_exp_set_lower_p_vl1000 ); %par(p=prob_pregnancy_base ); %par(p=fold_change_w );
%par(p=fold_change_yw ); %par(p=fold_change_sti ); %par(p=super_infection ); %par(p=an_lin_incr_test );
%par(p=date_test_rate_plateau ); %par(p=rate_testanc_inc ); %par(p=incr_test_rate_sympt ); %par(p=max_freq_testing );
%par(p=test_targeting ); %par(p=fx ); %par(p=adh_pattern ); %par(p=prob_loss_at_diag ); %par(p=pr_art_init ); 
%par(p=rate_lost ); %par(p=prob_lost_art ); %par(p=rate_return ); %par(p=rate_restart ); %par(p=rate_int_choice );
%par(p=clinic_not_aw_int_frac ); %par(p=res_trans_factor_nn ); %par(p=rate_loss_persistence ); %par(p=incr_rate_int_low_adh );
%par(p=poorer_cd4rise_fail_nn ); %par(p=poorer_cd4rise_fail_ii ); %par(p=rate_res_ten );
%par(p=fold_change_mut_risk ); %par(p=adh_effect_of_meas_alert ); %par(p=pr_switch_line ); %par(p=prob_vl_meas_done );
%par(p=red_adh_tb_adc ); %par(p=red_adh_tox_pop ); %par(p=add_eff_adh_nnrti ); %par(p=altered_adh_sec_line_pop );
%par(p=prob_return_adc ); %par(p=prob_lossdiag_adctb ); %par(p=higher_newp_less_engagement );
%par(p=fold_tr ); %par(p=switch_for_tox ); %par(p=adh_pattern_prep ); %par(p=rate_test_startprep ); %par(p=rate_test_restartprep );
%par(p=rate_choose_stop_prep ); %par(p=circ_inc_rate ); %par(p=p_hard_reach_w ); %par(p=hard_reach_higher_in_men );
%par(p=p_hard_reach_m ); %par(p=inc_cat ); %par(p= base_rate_sw );  %par(p= base_rate_stop_sexwork );    %par(p= rred_a_p );
%par(p= rr_int_tox ); %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg ); %par(p=sw_init_newp); %par(p=sw_trans_matrix);  	
	%par(p=prep_strategy );
 /*%par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); */
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); 
%par(p=lower_future_art_cov);
run;
data wide_par; merge 
sf_2021 /*dataset*/ sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti super_infection an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb higher_newp_less_engagement
fold_tr switch_for_tox adh_pattern_prep rate_test_startprep rate_test_restartprep
rate_choose_stop_prep circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
prep_strategy  			

/*zero_tdf_activity_k65r  zero_3tc_activity_m184*/  
red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
lower_future_art_cov
;

proc sort; by run;run;



/*

* NOTE THESE BLOCKS OF CODE ARE SPECIFIC TO OPTIONS (currently for case of 2 options 0 and 1) ;

* values for parameters that change after the intervention introduction, for option=1;

%macro par_ai1(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p._ai1; by run ; where cald = 2021 and option = 1 ;run;
data &p._ai1 ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par_ai1_option1; 

%par_ai1(p=exp_setting_lower_p_vl1000 ); 
%par_ai1(p=external_exp_factor );  %par_ai1(p=rate_exp_set_lower_p_vl1000 );   %par_ai1(p=max_freq_testing ); 
%par_ai1(p=test_targeting );   %par_ai1(p=prob_loss_at_diag );  %par_ai1(p=pr_art_init );  
%par_ai1(p=rate_lost );  %par_ai1(p=prob_lost_art );  %par_ai1(p=rate_return );  %par_ai1(p=rate_restart );  %par_ai1(p=rate_int_choice ); 
%par_ai1(p=clinic_not_aw_int_frac );   %par_ai1(p=rate_loss_persistence );  %par_ai1(p=incr_rate_int_low_adh ); 
%par_ai1(p=fold_change_mut_risk );  %par_ai1(p=adh_effect_of_meas_alert );  %par_ai1(p=pr_switch_line );  %par_ai1(p=prob_vl_meas_done ); 
%par_ai1(p=red_adh_tb_adc );  %par_ai1(p=red_adh_tox_pop );  %par_ai1(p=add_eff_adh_nnrti );  %par_ai1(p=altered_adh_sec_line_pop ); 
%par_ai1(p=prob_return_adc );  %par_ai1(p=prob_lossdiag_adctb );  %par_ai1(p=prob_lossdiag_who3e ); %par_ai1(p=higher_newp_less_engagement ); 
%par_ai1(p=fold_tr );  %par_ai1(p=switch_for_tox );  %par_ai1(p=adh_pattern_prep );   %par_ai1(p=base_rate_sw ); 

%par_ai1(p=condom_incr_2020 );    			%par_ai1(p=cascade_care_improvements ); %par_ai1(p=incr_test_2020 );             %par_ai1(p=decr_hard_reach_2020 );  
%par_ai1(p=decr_prob_loss_at_diag_2020 ); 	%par_ai1(p=decr_rate_lost_2020 );		%par_ai1(p=decr_rate_lost_art_2020 );    %par_ai1(p=incr_rate_return_2020 );     
%par_ai1(p=incr_rate_restart_2020 );        %par_ai1(p=incr_rate_init_2020 );       %par_ai1(p=decr_rate_int_choice_2020 ); 
%par_ai1(p=incr_prob_vl_meas_done_2020 ); 
%par_ai1(p=incr_pr_switch_line_2020 )    	%par_ai1(p=prep_improvements );       	%par_ai1(p=incr_adh_pattern_prep_2020 ); 
%par_ai1(p=inc_r_test_startprep_2020 ); %par_ai1(p=incr_r_test_restartprep_2020 ); %par_ai1(p=decr_r_choose_stop_prep_2020 ); 
%par_ai1(p=inc_p_prep_restart_choi_2020 );%par_ai1(p=incr_prepuptake_sw_2020 );   %par_ai1(p=incr_prepuptake_pop_2020 );   %par_ai1(p=expand_prep_to_all_2020 ); 
%par_ai1(p=circ_improvements ); 			%par_ai1(p=circ_inc_rate_2020 ); 		%par_ai1(p=incr_test_targeting_2020 );   %par_ai1(p=pop_wide_tld_2020 );
%par_ai1(p=incr_max_freq_testing_2020 );    %par_ai1(p=initial_pr_switch_line );    %par_ai1(p=initial_prob_vl_meas_done );  %par_ai1(p=sw_test_6mthly_2020 ); 
%par_ai1(p=reg_option_switch_2020 );     %par_ai1(p=art_mon_drug_levels_2020 );      %par_ai1(p=ten_is_taf_2020 );   

%par_ai1(p=eff_max_freq_testing ); 		%par_ai1(p=eff_rate_restart );  		%par_ai1(p=eff_prob_loss_at_diag );  		%par_ai1(p=eff_rate_lost );  		
%par_ai1(p=eff_prob_lost_art );  		%par_ai1(p=eff_rate_return );  
%par_ai1(p=eff_pr_art_init );  	%par_ai1(p=eff_rate_int_choice );  	%par_ai1(p=eff_prob_vl_meas_done );  		%par_ai1(p=eff_pr_switch_line );  	
%par_ai1(p=eff_rate_test_startprep );  	%par_ai1(p=eff_rate_test_restartprep );  	
%par_ai1(p=eff_rate_choose_stop_prep );  		%par_ai1(p=eff_prob_prep_restart_choice );  	
%par_ai1(p=e_decr_hard_reach_2020 ); %par_ai1(p=eff_test_targeting ); %par_ai1(p=prep_strategy );
%par_ai1(p=vmmc_disrup_covid);  %par_ai1(p=condom_disrup_covid);  %par_ai1(p=prep_disrup_covid);  %par_ai1(p=swprog_disrup_covid);  
%par_ai1(p=testing_disrup_covid);  %par_ai1(p=art_tld_disrup_covid);  %par_ai1(p=art_tld_eod_disrup_covid);   %par_ai1(p=art_init_disrup_covid);   
%par_ai1(p=vl_adh_switch_disrup_covid);  %par_ai1(p=cotrim_disrup_covid);    %par_ai1(p=no_art_disrup_covid); 
%par_ai1(p=inc_adeathr_disrup_covid); %par_ai1(p=art_low_adh_disrup_covid);  %par_ai1(p=cov_death_risk_mult); 
%par_ai1(p=lower_future_art_cov); 

run;


data wide_par_after_int_option1; merge 
 exp_setting_lower_p_vl1000_ai1 
external_exp_factor_ai1 rate_exp_set_lower_p_vl1000_ai1  max_freq_testing_ai1 
test_targeting_ai1  prob_loss_at_diag_ai1 pr_art_init_ai1 
rate_lost_ai1 prob_lost_art_ai1 rate_return_ai1 rate_restart_ai1 rate_int_choice_ai1 
clinic_not_aw_int_frac_ai1  rate_loss_persistence_ai1 incr_rate_int_low_adh_ai1 
fold_change_mut_risk_ai1 adh_effect_of_meas_alert_ai1 pr_switch_line_ai1 prob_vl_meas_done_ai1 
red_adh_tb_adc_ai1 red_adh_tox_pop_ai1 add_eff_adh_nnrti_ai1 altered_adh_sec_line_pop_ai1 
prob_return_adc_ai1 prob_lossdiag_adctb_ai1 prob_lossdiag_who3e_ai1 higher_newp_less_engagement_ai1 
fold_tr_ai1 switch_for_tox_ai1 adh_pattern_prep_ai1   base_rate_sw_ai1 

condom_incr_2020_ai1    			cascade_care_improvements_ai1 	incr_test_2020_ai1             decr_hard_reach_2020_ai1  
decr_prob_loss_at_diag_2020_ai1 	decr_rate_lost_2020_ai1 		decr_rate_lost_art_2020_ai1    incr_rate_return_2020_ai1     
incr_rate_restart_2020_ai1        	incr_rate_init_2020_ai1       	decr_rate_int_choice_2020_ai1  incr_prob_vl_meas_done_2020_ai1 
incr_pr_switch_line_2020_ai1    	prep_improvements_ai1       	incr_adh_pattern_prep_2020_ai1 
inc_r_test_startprep_2020_ai1 	incr_r_test_restartprep_2020_ai1 decr_r_choose_stop_prep_2020_ai1 
inc_p_prep_restart_choi_2020_ai1 incr_prepuptake_sw_2020_ai1   	incr_prepuptake_pop_2020_ai1   expand_prep_to_all_2020_ai1 
circ_improvements_ai1 				circ_inc_rate_2020_ai1 		incr_test_targeting_2020_ai1   pop_wide_tld_2020_ai1 
incr_max_freq_testing_2020_ai1     initial_pr_switch_line_ai1 	    initial_prob_vl_meas_done_ai1  sw_test_6mthly_2020_ai1 
reg_option_switch_2020_ai1  art_mon_drug_levels_2020_ai1   ten_is_taf_2020_ai1 	

eff_max_freq_testing_ai1 		eff_rate_restart_ai1  		eff_prob_loss_at_diag_ai1  		eff_rate_lost_ai1  		
eff_prob_lost_art_ai1  		eff_rate_return_ai1  		
eff_pr_art_init_ai1  	eff_rate_int_choice_ai1  	eff_prob_vl_meas_done_ai1  		eff_pr_switch_line_ai1  	
eff_rate_test_startprep_ai1  	eff_rate_test_restartprep_ai1  	
eff_rate_choose_stop_prep_ai1  		eff_prob_prep_restart_choice_ai1  	  
e_decr_hard_reach_2020_ai1 eff_test_targeting_ai1   prep_strategy_ai1 

vmmc_disrup_covid_ai1 condom_disrup_covid_ai1 prep_disrup_covid_ai1 swprog_disrup_covid_ai1 testing_disrup_covid_ai1 art_tld_disrup_covid_ai1
art_tld_eod_disrup_covid_ai1  art_init_disrup_covid_ai1 vl_adh_switch_disrup_covid_ai1 cotrim_disrup_covid_ai1 no_art_disrup_covid_ai1 
inc_adeathr_disrup_covid_ai1   art_low_adh_disrup_covid_ai1  cov_death_risk_mult_ai1

;

proc contents; run;

run;
proc sort; by run;


* values for parameters that change after the intervention for option=0;

%macro par_ai0(p=);
* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p._ai0; by run ; where cald = 2021 and option = 0 ;run;
data &p._ai0 ; set  y_ ; drop _TYPE_ _FREQ_; 

%mend par_ai0; 

%par_ai0(p=option_0_prep_continue_2020 );	 
%par_ai0(p=eff_rate_test_startprep );  	%par_ai0(p=eff_rate_test_restartprep );  	
%par_ai0(p=eff_rate_choose_stop_prep );  		%par_ai0(p=eff_prob_prep_restart_choice );  	

data wide_par_after_int_option0; merge 
option_0_prep_continue_2020_ai0   eff_rate_test_startprep_ai0  	eff_rate_test_restartprep_ai0   	
eff_rate_choose_stop_prep_ai0   eff_prob_prep_restart_choice_ai0  	
; 
run;

proc contents; run;

proc sort; by run;run;
*/

* To get one row per run;

*libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\vmmc\";

  data a.wide_vmmc_25_06_21_1pm_10r;

* merge   wide_outputs  wide_par wide_par_after_int_option0  wide_par_after_int_option1  ; * this if you have parameter values changing after
  baseline that you need to track the values of;
  merge   wide_outputs  wide_par ;  
  by run;run;
run;

/*
data a;
set a.wide_vmmc_02_06_21_9pm;run;

proc means n p50 mean p5 p95;
var p_onart_diag_20 p_onart_diag_m_20 p_onart_diag_w_20;run;

proc means n p50 mean p5 p95;
var p_onart_diag_40_41_1 p_onart_diag_m_40_41_1 p_onart_diag_w_40_41_1
;where lower_future_art_cov=0;run;

proc means n p50 mean p5 p95;
var p_onart_diag_40_41_1 p_onart_diag_m_40_41_1 p_onart_diag_w_40_41_1
;where lower_future_art_cov=1;run;

proc means n p50 p5 p95;var
prevalence1549_40_41_1 
incidence1549_40_41_1 
prop_1564_onprep_20
p_diag_40_41_1 
p_onart_diag_40_41_1 
p_vl1000_40_41_1 
p_onart_vl1000_40_41_1 
p_mcirc_1549m_40_41_1;
;where lower_future_art_cov=1;run;



proc means n mean p50 p5 p95;
var p_mcirc_21	prevalence1519w_21 	prevalence1519m_21 	prevalence1549m_21 prevalence1549w_21
incidence1549w_21  incidence1549m_21 incidence_sw_21	p_diag_21 	p_diag_m_21   p_diag_w_21	p_ai_no_arv_c_nnm_21   
prop_w_1549_sw_21  mtct_prop_21  prop_1564_onprep_21
p_onart_diag_21 p_onart_vl1000_21   p_vl1000_21	p_onart_vl1000_w_21	p_onart_vl1000_m_21   p_onart_cd4_l500_21  
p_onart_cd4_l200_21  p_startedline2_21 prop_sw_newp0_21  prop_sw_hiv_21 p_newp_sw_21 
;run;
proc means n mean p50 p5 p95;
var p_mcirc_40_41	prevalence1519w_40_41 	prevalence1519m_40_41 	prevalence1549m_40_41 prevalence1549w_40_41
incidence1549w_40_41  incidence1549m_40_41 incidence_sw_40_41	p_diag_40_41 	p_diag_m_40_41   p_diag_w_40_41	p_ai_no_arv_c_nnm_40_41   
prop_w_1549_sw_40_41  mtct_prop_40_41  prop_1564_onprep_40_41
p_onart_diag_40_41 p_onart_vl1000_40_41   p_vl1000_40_41	p_onart_vl1000_w_40_41	p_onart_vl1000_m_40_41   p_onart_cd4_l500_40_41  
p_onart_cd4_l200_40_41  p_startedline2_40_41 prop_sw_newp0_40_41  prop_sw_hiv_40_41 p_newp_sw_40_41 
;run;

* note this would need to be changed if option=1 is not the default/null policy option;
proc means n p50 mean p5 p95;
var p_w_giv_birth_this_per_20_25_1	p_mcirc_20_25_1	prevalence1549_20_25_1 incidence1549_20_25_1 	p_diag_20_25_1 	p_diag_m_20_25_1   p_diag_w_20_25_1	p_ai_no_arv_c_nnm_20_25_1   
prop_w_1549_sw_20_25_1  mtct_prop_20_25_1  prop_1564_onprep_20_25_1
p_onart_diag_20_25_1 p_onart_vl1000_20_25_1   p_vl1000_20_25_1	p_onart_vl1000_w_20_25_1	p_onart_vl1000_m_20_25_1   p_onart_cd4_l500_20_25_1  
p_onart_cd4_l200_20_25_1  p_startedline2_20_25_1 prop_sw_newp0_20_25_1  prop_sw_hiv_20_25_1 ;
run;


proc means n p50 p5 p95;var incidence_sw_21;run;



var s_alive_20			p_w_giv_birth_this_per_20	p_newp_ge1_20  p_newp_ge5_20 
p_newp_sw_20   n_tested_m_20
p_mcirc_20	 		p_mcirc_1519m_20	p_mcirc_2024m_20	p_mcirc_2529m_20		p_mcirc_3039m_20	p_mcirc_4049m_20 	p_mcirc_50plm_20 
prop_w_1549_sw_20	prop_w_ever_sw_20 	prop_sw_hiv_20 	prop_w_1524_onprep_20  prop_1564_onprep_20 	prevalence1549m_20 prevalence1549w_20
prevalence1549_20 
prevalence1519w_20 	prevalence1519m_20 	  prevalence2024w_20 	  prevalence2024m_20 	  prevalence2529w_20 	  prevalence2529m_20   prevalence3034w_20   
prevalence3034m_20 	prevalence3539w_20 	  prevalence3539m_20 	  prevalence4044w_20 	 prevalence4044m_20 	  prevalence4549w_20  prevalence4549m_20 
prevalence_vg1000_20 incidence1549_20 incidence1549w_20  incidence1549m_20 
p_inf_vlsupp_20   p_inf_newp_20   p_inf_ep_20   p_inf_diag_20   p_inf_naive_20 p_inf_primary_20
mtct_prop_20 		p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20    p_artexp_diag_20
p_onart_diag_20	p_onart_diag_w_20 	p_onart_diag_m_20 	p_efa_20 	p_taz_20		p_ten_20 	p_zdv_20	p_dol_20	p_3tc_20 	p_lpr_20 	p_nev_20 
p_onart_vl1000_20   p_vl1000_20		p_vg1000_20 			p_onart_m_20 	p_onart_w_20 
p_onart_vl1000_w_20				p_onart_vl1000_m_20  prev_vg1000_newp_m_20   prev_vg1000_newp_w_20 p_startedline2_20
p_tle_20	 p_tld_20	 p_zld_20	 p_zla_20	 p_otherreg_20	 p_drug_level_test_20	 p_linefail_ge1_20  
r_efa_hiv_20  p_onart_cd4_l500_20  p_onart_cd4_l200_20  p_startedline2_20 prop_art_or_prep_20 n_sw_1564_20 
p_k65m_20 p_m184m_20 ;
run;

proc contents;run;


