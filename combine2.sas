
%let sasoutputdir = %scan(&sysparm,1," ");
libname a "&sasoutputdir/";

data i1(compress=binary); set a.out1:; 
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr cvd_tx_effective prob_htn_link cost_lowqual_cvdcare

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;

data i2(compress=binary); set a.out2:;
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr cvd_tx_effective prob_htn_link cost_lowqual_cvdcare

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;
data i3(compress=binary); set a.out3:;
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr cvd_tx_effective prob_htn_link cost_lowqual_cvdcare

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;
data i4(compress=binary); set a.out4:;
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;
data i5(compress=binary); set a.out5:;
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr cvd_tx_effective prob_htn_link cost_lowqual_cvdcare

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;
data i6(compress=binary); set a.out6:;
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr cvd_tx_effective prob_htn_link cost_lowqual_cvdcare

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;
data i7(compress=binary); set a.out7:;
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr cvd_tx_effective prob_htn_link cost_lowqual_cvdcare

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;
data i8(compress=binary); set a.out8:;
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr cvd_tx_effective prob_htn_link cost_lowqual_cvdcare

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;
data i9(compress=binary); set a.out9:;
keep run cald option 
s_alive s_alive_m s_alive_w
discount_3py
p_hard_reach_w hard_reach_higher_in_men p_hard_reach_m inc_cat 

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr cvd_tx_effective prob_htn_link cost_lowqual_cvdcare

s_htn_cost_scr  s_htn_cost_drug s_htn_cost_clin s_htn_cost_cvd
s_dhtn_cost_scr s_dhtn_cost_drug s_dhtn_cost_clin s_dhtn_cost_cvd  

s_ageg1517m   s_ageg1819m   s_ageg2024m   s_ageg1517w   s_ageg1819w   s_ageg2024w  
s_ageg2529m   s_ageg3034m   s_ageg2529w   s_ageg3034w  
s_ageg3539m   s_ageg4044m   s_ageg3539w   s_ageg4044w  
s_ageg4549m   s_ageg5054m   s_ageg4549w   s_ageg5054w  
s_ageg5559m   s_ageg6064m   s_ageg5559w   s_ageg6064w  
s_ageg6569m   s_ageg7074m      s_ageg6569w   s_ageg7074w  
s_ageg7579m   s_ageg8084m   s_ageg7579w   s_ageg8084w 
s_ageg85plm   s_ageg85plw 

s_hypertension_ge18
s_hypertension_2534
s_hypertension_3544
s_hypertension_4554
s_hypertension_5564
s_hypertension_ge65

s_htn_true_ge18
s_htn_true_2534
s_htn_true_3544
s_htn_true_4554
s_htn_true_5564
s_htn_true_ge65

s_dx_htn_ge18
s_dx_htn_2534
s_dx_htn_3544
s_dx_htn_4554
s_dx_htn_5564
s_dx_htn_ge65

s_htn_true_dx_ge18
s_htn_true_dx_2534
s_htn_true_dx_3544
s_htn_true_dx_4554
s_htn_true_dx_5564
s_htn_true_dx_ge65

s_on_tx_htn_ge18
s_on_tx_htn_2534
s_on_tx_htn_3544
s_on_tx_htn_4554
s_on_tx_htn_5564
s_on_tx_htn_ge65

s_ever_tx_htn_ge18
s_ever_tx_htn_2534 s_ever_tx_htn_3544
s_ever_tx_htn_4554  s_ever_tx_htn_5564
s_ever_tx_htn_ge65

s_on1drug_antihyp_ge18	
s_on2drug_antihyp_ge18	
s_on3drug_antihyp_ge18	
s_on1drug_antihyp_2534	s_on1drug_antihyp_3544
s_on2drug_antihyp_2534	s_on2drug_antihyp_3544
s_on3drug_antihyp_2534	s_on3drug_antihyp_3544
s_on1drug_antihyp_4554	s_on1drug_antihyp_5564
s_on2drug_antihyp_4554	s_on2drug_antihyp_5564
s_on3drug_antihyp_4554	s_on3drug_antihyp_5564
s_on1drug_antihyp_ge65	
s_on2drug_antihyp_ge65	
s_on3drug_antihyp_ge65	
	
s_htn_control_ge18	
s_htn_control_2534	
s_htn_control_3544	
s_htn_control_4554	
s_htn_control_5564	
s_htn_control_ge65	
	
s_htn_over_dx_ge18	
s_htn_over_dx_2534	s_htn_over_dx_3544
s_htn_over_dx_4554	s_htn_over_dx_5564
s_htn_over_dx_ge65	
	
s_on_tx_htn_over_ge18	
s_on_tx_htn_over_2534	s_on_tx_htn_over_3544
s_on_tx_htn_over_4554	s_on_tx_htn_over_5564
s_on_tx_htn_over_ge65	
	
s_ever_tx_htn_over_ge18	
s_ever_tx_htn_over_2534	s_ever_tx_htn_over_3544
s_ever_tx_htn_over_4554	s_ever_tx_htn_over_5564
s_ever_tx_htn_over_ge65	
	
s_sbp_max_over_ge18	s_htn_over_dx_ge18
s_sbp_over_ge18	s_htn_over_dx_ge18
	
s_hypertens160_ge18	
s_hypertens160_2534	s_hypertens160_3544
s_hypertens160_4554	s_hypertens160_5564
s_hypertens160_ge65	
	
s_htn_true160_ge18	
s_htn_true160_2534	s_htn_true160_3544
s_htn_true160_4554	s_htn_true160_5564
s_htn_true160_ge65	
	
s_htn_true_dx160_ge18	
s_htn_true_dx160_2534	s_htn_true_dx160_3544
s_htn_true_dx160_4554	s_htn_true_dx160_5564
s_htn_true_dx160_ge65	
	
s_on_tx_htn160_ge18	
s_on_tx_htn160_2534	s_on_tx_htn160_3544
s_on_tx_htn160_4554	s_on_tx_htn160_5564
s_on_tx_htn160_ge65	
	
s_htn_control160_ge18	
s_htn_control160_2534	s_htn_control160_3544
s_htn_control160_4554	s_htn_control160_5564
s_htn_control160_ge65	
	
s_sbp_1519w	
s_sbp_2024w	
s_sbp_2529w	
s_sbp_3034w	
s_sbp_3539w	
s_sbp_4044w	
s_sbp_4549w	
s_sbp_5054w	
s_sbp_5559w	
s_sbp_6064w	
s_sbp_6569w	
s_sbp_7074w	
s_sbp_7579w	
s_sbp_ge80w	
	
s_sbp_1519m	
s_sbp_2024m	
s_sbp_2529m	
s_sbp_3034m	
s_sbp_3539m	
s_sbp_4044m	
s_sbp_4549m	
s_sbp_5054m	
s_sbp_5559m	
s_sbp_6064m	
s_sbp_6569m	
s_sbp_7074m	
s_sbp_7579m	
s_sbp_ge80m	
	
s_ihd_inc_all_modsev_ge18m	s_ihd_inc_all_modsev_ge18w
s_ihd_inc_all_modsev_4049m	
s_ihd_inc_all_modsev_5059m	
s_ihd_inc_all_modsev_6069m	
s_ihd_inc_all_modsev_7079m	
s_ihd_inc_all_modsev_ge80m	
s_ihd_inc_all_modsev_4049w	
s_ihd_inc_all_modsev_5059w	
s_ihd_inc_all_modsev_6069w	
s_ihd_inc_all_modsev_7079w	
s_ihd_inc_all_modsev_ge80w	
s_ihd_inc_all_modsev_2544	
s_ihd_inc_all_modsev_4564	
s_ihd_inc_all_modsev_ge65	
	
s_cva_inc_all_modsev_ge18m	s_cva_inc_all_modsev_ge18w
s_cva_inc_all_modsev_4049m	
s_cva_inc_all_modsev_5059m	
s_cva_inc_all_modsev_6069m	
s_cva_inc_all_modsev_7079m	
s_cva_inc_all_modsev_ge80m	
s_cva_inc_all_modsev_4049w	
s_cva_inc_all_modsev_5059w	
s_cva_inc_all_modsev_6069w	
s_cva_inc_all_modsev_7079w	
s_cva_inc_all_modsev_ge80w	
s_cva_inc_all_modsev_2544	
s_cva_inc_all_modsev_4564	
s_cva_inc_all_modsev_ge65	

s_ihd_prev_ge18m	s_ihd_prev_ge18w
s_ihd_prev_4049m	
s_ihd_prev_5059m	
s_ihd_prev_6069m	
s_ihd_prev_7079m	
s_ihd_prev_ge80m	
s_ihd_prev_4049w	
s_ihd_prev_5059w	
s_ihd_prev_6069w	
s_ihd_prev_7079w	
s_ihd_prev_ge80w	

s_cva_prev_ge18m	s_cva_prev_ge18w
s_cva_prev_4049m	
s_cva_prev_5059m	
s_cva_prev_6069m	
s_cva_prev_7079m	
s_cva_prev_ge80m	
s_cva_prev_4049w	
s_cva_prev_5059w	
s_cva_prev_6069w	
s_cva_prev_7079w	
s_cva_prev_ge80w	
;

data a.concatenated_data(compress=binary); set i1 i2 i3 i4 i5 i6 i7 i8 i9 ;

proc sort data=a.concatenated_data;
by run cald option;
run;


