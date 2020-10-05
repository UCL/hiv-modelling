libname output '/folders/myfolders/hiv-modelling/output/';
options ps=1000 ls=220 cpucount=4 spool fullstimer ;

/**
apparently the cumulative dataset
*/
data cum_l1; 
if eeee=1;
drop eeee;

/**
the initial set of random variables
*/
data initialset;

    caldate1=&startyear;
    caldate_never_dot=&startyear;
    startyr = &startyear + &increment;

    /** SEXUAL BEHAVIOUR; -> this is a small sample
    */
    rbm=4;
    ch_risk_diag = 9/13; *overwritten; 
    ch_risk_diag_newp = 5/6; *overwritten;
    ych_risk_beh_newp = .99; *overwritten;
    ych2_risk_beh_newp = 1.0; *overwritten;
    ych_risk_beh_ep = 1.0; *overwritten;
    eprate=0.1; *overwritten; * dependent_on_time_step_length ;
    newp_factor= 6.5; *overwritten;
    p_rred_p = 0.20; *overwritten;
    p_hsb_p = 0.05; *overwritten;
    condom_incr_2020 = 0; * mar19;
    exp_setting_lower_p_vl1000 = 0; * exposure to hiv in an external setting where p_vl1000 is lower - during short term out migration followed by return;
    external_exp_factor = 1;
    rate_exp_set_lower_p_vl1000 = 0; * dependent_on_time_step_length ;
    rr_sw_age_1519 = 1.00;
    rr_sw_age_2534 = 0.30;
    rr_sw_age_3549 = 0.03;
    rr_sw_life_sex_risk_3 = 10;
    rr_sw_prev_sw = 10;
run;

/** 
loop over population
*/
data randompop;
    set initialset;
    do i=1 to &population;
	    n=1;
	    serial_no + 1;
	    output; 
    end; 
    drop i;
run;








