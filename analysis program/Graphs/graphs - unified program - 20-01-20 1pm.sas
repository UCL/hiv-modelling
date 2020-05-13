
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;
data a1;  

 * infile "C:\Users\Andrew Phillips\Dropbox\hiv synthesis ssa unified program\output files\c_output_15_9_19_dolswitch_9am_legion_temp"; 
  infile "C:\Users\lovel\Dropbox\hiv synthesis ssa unified program\output files\c_output_prep_16_1_20_8am_legion_1";

input 

p50_cd4diag  			 s_cd4diag  
p50_measured_cd4art 	 s_measured_cd4art 
p50_years_since_start_prep   	 s_years_since_start_prep
p50_n_test_prev_4p_onprep s_n_test_prev_4p_onprep
p50_age_deb_sw 			 s_age_deb
p50_act_years_sw 		 s_act_years_sw 
p50_tot_dur_sw 			 s_tot_dur_sw

/*general*/
run_    cald  art_monitoring_strategy_  option_

/*number alive and in each age group*/
s_alive1549	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m			
s_ageg1517w		s_ageg1819w		s_ageg1519w  	s_ageg2024w		s_ageg2529w  	s_ageg3034w		s_ageg3539w		s_ageg4044w	
s_ageg4549w		s_ageg5054w 	s_ageg5559w		s_ageg6064w		s_ageg1564w		s_ageg1549w		s_age_1844w
s_ageg1m  s_ageg2m  s_ageg3m  s_ageg4m  s_ageg5m  s_ageg1w  s_ageg2w  s_ageg3w  s_ageg4w  s_ageg5w  

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m		
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w
s_alive_w s_alive_m

/*number and status of those with HIV*/
s_hiv1564		s_hiv1549
s_hiv1517m		s_hiv1819m		s_hiv1519m  	s_hiv2024m		s_hiv2529m  	s_hiv3034m		s_hiv3539m		s_hiv4044m	
s_hiv4549m		s_hiv5054m 		s_hiv5559m		s_hiv6064m		s_hiv1564m		s_hiv1549m	
s_hiv1517w		s_hiv1819w		s_hiv1519w  	s_hiv2024w		s_hiv2529w  	s_hiv3034w		s_hiv3539w		s_hiv4044w	
s_hiv4549w		s_hiv5054w 		s_hiv5559w		s_hiv6064w		s_hiv1564w		s_hiv1549w	
s_sg_1 			s_sg_2 			s_sg_3 			s_sg_4			s_sg_5 			s_sg_6 			s_sg_7 			s_sg_8 		s_sg_9	 s_sg_99

/*primary infection*/
s_primary  		s_primary1549   s_primary1549m  s_primary1549w  s_infected_primary 	s_inf_primary
s_primary1519m	s_primary2024m	s_primary2529m	s_primary3034m	s_primary3539m	s_primary4044m	s_primary4549m
s_primary5054m	s_primary5559m	s_primary6064m
s_primary1519w	s_primary2024w	s_primary2529w	s_primary3034w	s_primary3539w	s_primary4044w	s_primary4549w
s_primary5054w	s_primary5559w	s_primary6064w
s_primary_ep_m  s_primary_ep_w  
s_primary1524m_ep  s_primary2534m_ep  s_primary3544m_ep  s_primary4554m_ep  s_primary5564m_ep
s_primary1524w_ep  s_primary2534w_ep  s_primary3544w_ep  s_primary4554w_ep  s_primary5564w_ep
s_primary1524m_epnewp  s_primary2534m_epnewp  s_primary3544m_epnewp  s_primary4554m_epnewp  s_primary5564m_epnewp 
s_primary1524w_epnewp  s_primary2534w_epnewp  s_primary3544w_epnewp  s_primary4554w_epnewp  s_primary5564w_epnewp
s_primary_sw
s_inf_vlsupp  s_inf_newp  s_inf_ep  s_inf_diag  s_inf_naive 

/*outputs amongst those infected*/
s_i_m_d_newp  s_i_w_d_newp   s_i_w_np   s_i_m_np  s_i_ep 

s_i_m_1524_newp  s_i_m_2534_newp  s_i_m_3544_newp  s_i_m_4554_newp  s_i_m_5564_newp
s_i_w_1524_newp  s_i_w_2534_newp  s_i_w_3544_newp  s_i_w_4554_newp  s_i_w_5564_newp 
s_i_r_vlg1_np  s_i_r_vlg2_np  s_i_r_vlg3_np  s_i_r_vlg4_np  s_i_r_vlg5_np  s_i_r_vlg6_np
s_i_diag_vlg1_rm0_np   s_i_diag_vlg2_rm0_np   s_i_diag_vlg3_rm0_np   s_i_diag_vlg4_rm0_np   s_i_diag_vlg5_rm0_np   s_i_diag_vlg6_rm0_np
s_i_diag_vlg1_rm1_np   s_i_diag_vlg2_rm1_np   s_i_diag_vlg3_rm1_np   s_i_diag_vlg4_rm1_np   s_i_diag_vlg5_rm1_np   s_i_diag_vlg6_rm1_np
s_i_naive_vlg1_rm0_np  s_i_naive_vlg2_rm0_np  s_i_naive_vlg3_rm0_np  s_i_naive_vlg4_rm0_np  s_i_naive_vlg5_rm0_np  s_i_naive_vlg6_rm0_np
s_i_naive_vlg1_rm1_np  s_i_naive_vlg2_rm1_np  s_i_naive_vlg3_rm1_np  s_i_naive_vlg4_rm1_np  s_i_naive_vlg5_rm1_np  s_i_naive_vlg6_rm1_np
s_i_v1_np  s_i_v2_np   s_i_v3_np  s_i_v4_np   s_i_v5_np  s_i_v6_np 

/*Number ep and newp*/
s_np  s_newp  s_newp_ge1  s_newp_ge5  s_newp_ge10  s_newp_ge50  s_ep  s_ep_m  s_ep_w  s_npge10  s_npge2  s_npge2_l4p_1549m  s_npge2_l4p_1549w
s_m_1524_ep  	 s_m_2534_ep 	  s_m_3544_ep 	   s_m_4554_ep 		s_m_5564_ep 	 
s_w_1524_ep		 s_w_2534_ep 	  s_w_3544_ep	   s_w_4554_ep 		s_w_5564_ep 
s_m_1524_newp  	 s_m_2534_newp    s_m_3544_newp    s_m_4554_newp  	s_m_5564_newp
s_w_1524_newp  	 s_w_2534_newp    s_w_3544_newp    s_w_4554_newp    s_w_5564_newp
s_m_1524_epnewp  s_m_2534_epnewp  s_m_3544_epnewp  s_m_4554_epnewp  s_m_5564_epnewp 
s_w_1524_epnewp  s_w_2534_epnewp  s_w_3544_epnewp  s_w_4554_epnewp  s_w_5564_epnewp
s_newp_ge1_hiv 

s_ever_ep  s_ever_newp  
s_m1524_ep1524_ s_m1524_ep2534_ s_m1524_ep3544_ s_m1524_ep4554_ s_m1524_ep5564_ 
s_m2534_ep1524_ s_m2534_ep2534_ s_m2534_ep3544_ s_m2534_ep4554_ s_m2534_ep5564_ 
s_m3544_ep1524_ s_m3544_ep2534_ s_m3544_ep3544_ s_m3544_ep4554_ s_m3544_ep5564_
s_m4554_ep1524_ s_m4554_ep2534_ s_m4554_ep3544_ s_m4554_ep4554_ s_m4554_ep5564_ 
s_m5564_ep1524_ s_m5564_ep2534_ s_m5564_ep3544_ s_m5564_ep4554_ s_m5564_ep5564_ 
s_w1524_ep1524_ s_w1524_ep2534_ s_w1524_ep3544_ s_w1524_ep4554_ s_w1524_ep5564_ 
s_w2534_ep1524_ s_w2534_ep2534_ s_w2534_ep3544_ s_w2534_ep4554_ s_w2534_ep5564_ 
s_w3544_ep1524_ s_w3544_ep2534_ s_w3544_ep3544_ s_w3544_ep4554_ s_w3544_ep5564_ 
s_w4554_ep1524_ s_w4554_ep2534_ s_w4554_ep3544_ s_w4554_ep4554_ s_w4554_ep5564_ 
s_w5564_ep1524_ s_w5564_ep2534_ s_w5564_ep3544_ s_w5564_ep4554_ s_w5564_ep5564_ 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 

npgt1conc_l4p_1524m  npgt1conc_l4p_1524w  npgt1conc_l4p_1519m  npgt1conc_l4p_1519w  npgt1conc_l4p_2549m 
npgt1conc_l4p_2549w  npgt1conc_l4p_5064m  npgt1conc_l4p_5064w 

s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

s_newp_this_per_art_or_prep   s_newp_this_per_art   s_newp_this_per_prep  s_newp_this_per  s_newp_sw

/*status of partner*/
s_eph0_m  s_eph0_w  s_nip   s_epi
s_newp_hiv  s_newp_ge1_hiv_diag  s_epdiag   s_diag_epun  s_eponart  s_epvls
s_hiv1epi0_w  s_hiv0epi1_w  s_hiv1epi0_m  s_hiv0epi1_m  s_hiv1epi1_m  s_hiv1epi1_w  
s_hiv0epprim
s_ever_ep_hiv  s_ever_ep_diag  s_ever_newp_hiv  s_ever_newp_diag
s_infected_newp_m  s_infected_newp_w  s_infected_ep_m  s_infected_ep_w

s_i_vl1000_m_np s_i_v11000_m_ep s_i_vl1000_m_newp
s_i_vl1000_w_np s_i_v11000_w_ep s_i_vl1000_w_newp

s_i_v1_age1_w_np s_i_v1_age2_w_np s_i_v1_age3_w_np s_i_v1_age4_w_np s_i_v1_age5_w_np 
s_i_v1_age1_m_np s_i_v1_age2_m_np s_i_v1_age3_m_np s_i_v1_age4_m_np s_i_v1_age5_m_np 
s_i_v1_age1_w_newp s_i_v1_age2_w_newp s_i_v1_age3_w_newp s_i_v1_age4_w_newp s_i_v1_age5_w_newp 
s_i_v1_age1_m_newp s_i_v1_age2_m_newp s_i_v1_age3_m_newp s_i_v1_age4_m_newp s_i_v1_age5_m_newp 
s_i_v1_age1_w_ep s_i_v1_age2_w_ep s_i_v1_age3_w_ep s_i_v1_age4_w_ep s_i_v1_age5_w_ep 
s_i_v1_age1_m_ep s_i_v1_age2_m_ep s_i_v1_age3_m_ep s_i_v1_age4_m_ep s_i_v1_age5_m_ep 

s_i_v2_age1_w_np s_i_v2_age2_w_np s_i_v2_age3_w_np s_i_v2_age4_w_np s_i_v2_age5_w_np 
s_i_v2_age1_m_np s_i_v2_age2_m_np s_i_v2_age3_m_np s_i_v2_age4_m_np s_i_v2_age5_m_np 
s_i_v2_age1_w_newp s_i_v2_age2_w_newp s_i_v2_age3_w_newp s_i_v2_age4_w_newp s_i_v2_age5_w_newp 
s_i_v2_age1_m_newp s_i_v2_age2_m_newp s_i_v2_age3_m_newp s_i_v2_age4_m_newp s_i_v2_age5_m_newp 
s_i_v2_age1_w_ep s_i_v2_age2_w_ep s_i_v2_age3_w_ep s_i_v2_age4_w_ep s_i_v2_age5_w_ep 
s_i_v2_age1_m_ep s_i_v2_age2_m_ep s_i_v2_age3_m_ep s_i_v2_age4_m_ep s_i_v2_age5_m_ep 

s_i_v3_age1_w_np s_i_v3_age2_w_np s_i_v3_age3_w_np s_i_v3_age4_w_np s_i_v3_age5_w_np 
s_i_v3_age1_m_np s_i_v3_age2_m_np s_i_v3_age3_m_np s_i_v3_age4_m_np s_i_v3_age5_m_np 
s_i_v3_age1_w_newp s_i_v3_age2_w_newp s_i_v3_age3_w_newp s_i_v3_age4_w_newp s_i_v3_age5_w_newp 
s_i_v3_age1_m_newp s_i_v3_age2_m_newp s_i_v3_age3_m_newp s_i_v3_age4_m_newp s_i_v3_age5_m_newp 
s_i_v3_age1_w_ep s_i_v3_age2_w_ep s_i_v3_age3_w_ep s_i_v3_age4_w_ep s_i_v3_age5_w_ep 
s_i_v3_age1_m_ep s_i_v3_age2_m_ep s_i_v3_age3_m_ep s_i_v3_age4_m_ep s_i_v3_age5_m_ep 

s_i_v4_age1_w_np s_i_v4_age2_w_np s_i_v4_age3_w_np s_i_v4_age4_w_np s_i_v4_age5_w_np 
s_i_v4_age1_m_np s_i_v4_age2_m_np s_i_v4_age3_m_np s_i_v4_age4_m_np s_i_v4_age5_m_np 
s_i_v4_age1_w_newp s_i_v4_age2_w_newp s_i_v4_age3_w_newp s_i_v4_age4_w_newp s_i_v4_age5_w_newp 
s_i_v4_age1_m_newp s_i_v4_age2_m_newp s_i_v4_age3_m_newp s_i_v4_age4_m_newp s_i_v4_age5_m_newp 
s_i_v4_age1_w_ep s_i_v4_age2_w_ep s_i_v4_age3_w_ep s_i_v4_age4_w_ep s_i_v4_age5_w_ep 
s_i_v4_age1_m_ep s_i_v4_age2_m_ep s_i_v4_age3_m_ep s_i_v4_age4_m_ep s_i_v4_age5_m_ep 

s_i_v5_age1_w_np s_i_v5_age2_w_np s_i_v5_age3_w_np s_i_v5_age4_w_np s_i_v5_age5_w_np 
s_i_v5_age1_m_np s_i_v5_age2_m_np s_i_v5_age3_m_np s_i_v5_age4_m_np s_i_v5_age5_m_np 
s_i_v5_age1_w_newp s_i_v5_age2_w_newp s_i_v5_age3_w_newp s_i_v5_age4_w_newp s_i_v5_age5_w_newp 
s_i_v5_age1_m_newp s_i_v5_age2_m_newp s_i_v5_age3_m_newp s_i_v5_age4_m_newp s_i_v5_age5_m_newp 
s_i_v5_age1_w_ep s_i_v5_age2_w_ep s_i_v5_age3_w_ep s_i_v5_age4_w_ep s_i_v5_age5_w_ep 
s_i_v5_age1_m_ep s_i_v5_age2_m_ep s_i_v5_age3_m_ep s_i_v5_age4_m_ep s_i_v5_age5_m_ep 

s_i_v6_age1_w_np s_i_v6_age2_w_np s_i_v6_age3_w_np s_i_v6_age4_w_np s_i_v6_age5_w_np 
s_i_v6_age1_m_np s_i_v6_age2_m_np s_i_v6_age3_m_np s_i_v6_age4_m_np s_i_v6_age5_m_np 
s_i_v6_age1_w_newp s_i_v6_age2_w_newp s_i_v6_age3_w_newp s_i_v6_age4_w_newp s_i_v6_age5_w_newp 
s_i_v6_age1_m_newp s_i_v6_age2_m_newp s_i_v6_age3_m_newp s_i_v6_age4_m_newp s_i_v6_age5_m_newp 
s_i_v6_age1_w_ep s_i_v6_age2_w_ep s_i_v6_age3_w_ep s_i_v6_age4_w_ep s_i_v6_age5_w_ep 
s_i_v6_age1_m_ep s_i_v6_age2_m_ep s_i_v6_age3_m_ep s_i_v6_age4_m_ep s_i_v6_age5_m_ep 

s_i_age1_m_np s_i_age2_m_np	s_i_age3_m_np	s_i_age4_m_np	s_i_age5_m_np
s_i_age1_w_np	s_i_age2_w_np	s_i_age3_w_np	s_i_age4_w_np	s_i_age5_w_np
s_i_age1_m_newp s_i_age2_m_newp	s_i_age3_m_newp	s_i_age4_m_newp	s_i_age5_m_newp
s_i_age1_w_newp	s_i_age2_w_newp	s_i_age3_w_newp	s_i_age4_w_newp	s_i_age5_w_newp

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r 

s_i_m_1549_np  s_i_w_1549_np
 
/*resistance*/
s_tam1_  s_tam2_  s_tam3_  s_m184m_  s_k103m_  s_y181m_  s_g190m_  s_nnm_  s_q151m_  s_k65m_  
s_p32m_  s_p33m_  s_p46m_  s_p47m_   s_p50vm_  s_p50lm_  s_p54m_   s_p76m_ s_p82m_   s_p84m_   s_p88m_	s_p90m_   s_pim_  
s_inpm_  s_insm_  s_rm_    s_i_nnm   s_i_rm    s_i_pim   s_i_tam   s_i_im  s_inm_    s_i_184m  s_im_art s_pim_art s_tam_art s_m184_art
s_r_  	 s_r_3tc  s_r_nev  s_r_lpr   s_r_taz   s_r_efa   s_r_ten   s_r_zdv s_r_dol  
s_rme_   s_iime_  s_nnme_  s_pime_   s_nrtime_
s_res_1stline_startline2  s_nnm_art  s_nnm_art_m  s_nnm_art_w  s_r_art  s_acq_rt65m  s_acq_rt184m  s_acq_rtm  s_onart_iicu_res
s_nactive_art_start_lt2  s_nactive_art_start_lt3  s_nactive_art_start_lt1p5
s_nactive_line2_lt4 	 s_nactive_line2_lt3 	  s_nactive_line2_lt2 		s_nactive_line2_lt1p5  s_pim_line2
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  s_higher_rate_res_dol
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  s_nnrti_res_no_effect
s_ai_naive_no_pmtct_   s_ai_naive_no_pmtct_c_nnm_
s_o_dol_2nd_vlg1000 s_o_dol_2nd_vlg1000_dolr1_adh0  s_o_dol_2nd_vlg1000_dolr1_adh1  s_o_dol_2nd_vlg1000_dolr0_adh0 s_o_dol_2nd_vlg1000_dolr0_adh1 

s_zero_3tc_activity_m184  s_zero_tdf_activity_k65r

/*prep*/
s_prep s_prep_sw s_prep_w_1524 s_elig_prep_epdiag  s_infected_prep  s_prep_ever  s_primary_prep  s_hiv1_prep  s_i_r_prep  s_primary_r_prep  s_ever_i_nor_prep  
s_rm_prep   s_elig_prep  	 s_hr_noprep  s_primary_hr_noprep 
s_rt65m_3_prep  s_rt184m_3_prep  s_rtm_3_prep  s_rt65m_6_prep  s_rt184m_6_prep  s_rtm_6_prep 
s_rt65m_9_prep  s_rt184m_9_prep  s_rtm_9_prep  s_rt65m_12_prep  s_rt184m_12_prep  s_rtm_12_prep  
s_rt65m_18_prep s_rt184m_18_prep s_rtm_18_prep  
s_onprep_3  s_onprep_6  s_onprep_9  s_onprep_12  s_onprep_18  

s_prepstart  s_ever_stopped_prep_choice  s_preprestart 
s_acq_rt65m_3_prep  s_acq_rt184m_3_prep   s_acq_rtm_3_prep     s_acq_rt65m_6_prep   s_acq_rt184m_6_prep   s_acq_rtm_6_prep 
s_acq_rt65m_9_prep  s_acq_rt184m_9_prep   s_acq_rtm_9_prep     s_acq_rt65m_12_prep  s_acq_rt184m_12_prep  s_acq_rtm_12_prep  
s_acq_rt65m_18_prep s_acq_rt184m_18_prep  s_acq_rtm_18_prep
s_inf_prep_adhg80   s_inf_prep_adh5080    s_inf_prep_adhl50  s_prep_adhg80  s_prep_adh5080  s_prep_adhl50 
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w

s_elig_prep_w_1524 s_elig_prep_w_2534 s_elig_prep_w_3544 s_prep_w_1524      s_prep_w_2534      s_prep_w_3544 

s_infected_prep_source_prep_r  s_prepinfect_prep_r     s_prepinfect_prep_r_p   s_infected_prep_no_r    s_infected_prep_r  
s_started_prep_in_primary	   s_tot_yrs_prep  		   s_onprep_3_i_prep_no_r  s_onprep_6_i_prep_no_r  s_onprep_9_i_prep_no_r 
s_onprep_12_i_prep_no_r 	   s_onprep_18_i_prep_no_r s_prepinfect_rm_p      s_prepinfect_m184m_p    s_prepinfect_k65m_p 
s_prepinfect_tam_p 			   s_prepinfect_rtm  	   s_prepinfect_k65m	   s_prepinfect_m184m  	   s_prepinfect_tam  
s_prep_willing_pop  		   s_prep_willing_sw  	   s_stop_prep_choice      s_started_prep_hiv_test_sens  
s_cur_res_prep_drug 		   s_started_prep_hiv_test_sens_e  				   s_started_prep_in_primary_e
s_cur_res_ten				   s_cur_res_3tc  		   s_i_65m 				   s_cur_res_efa 			
s_cur_res_ten_vlg1000 		   s_cur_res_3tc_vlg1000 						   s_cur_res_efa_vlg1000	s_ever_hiv1_prep 
s_cur_res_efa_ever_hiv1_prep   s_cur_res_ten_ever_hiv1_prep   				   s_cur_res_3tc_ever_hiv1_prep   
s_prep_effectiveness_non_res_v 
s_prep_3m_after_inf_no_r 	s_prep_3m_after_inf_no_r_184  s_prep_3m_after_inf_no_r_65
s_prep_6m_after_inf_no_r  s_prep_6m_after_inf_no_r_184  s_prep_6m_after_inf_no_r_65  s_prep_12m_after_inf_no_r  
s_prep_12m_after_inf_no_r_184  s_prep_12m_after_inf_no_r_65
s_hiv_prep_reason_1  s_hiv_prep_reason_2  s_hiv_prep_reason_3  s_hiv_prep_reason_4

s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg10  s_prep_newpg100 
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_ever_w_1524  s_prep_ever_w
s_test_gt_period1_on_prep  s_test_gt_period1_on_prep_pos  s_test_period1_on_prep  s_test_period1_on_prep_pos  
s_prepuptake_sw 	 s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep   prep_strategy_
										

/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_tested1549_		s_tested1549m       s_tested1549w
s_tested_4p_m1549_ 	s_tested_4p_m1519_ 	s_tested_4p_m2024_ s_tested_4p_m2529_  s_tested_4p_m3039_  s_tested_4p_m4049_  s_tested_4p_m5064_
s_tested_4p_w1549_ 	s_tested_4p_w1519_ 	s_tested_4p_w2024_ s_tested_4p_w2529_  s_tested_4p_w3039_  s_tested_4p_w4049_  s_tested_4p_w5064_ 
s_tested_4p_sw		

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_who3_tested  
s_com_test  s_tested_anc_prevdiag  s_tested_anc 		
s_tested_as_sw  s_tested_m_sympt  s_tested_f_sympt  s_tested_f_sw  s_tested_m_circ  
s_rate_1sttest   s_rate_reptest  s_newp_lasttest_tested_this_per
s_acc_test  s_acc_test_1524_  s_acc_test_2549_  s_acc_test_5064_  s_acc_test_sw  

s_diag
s_diag_m1549_  s_diag_m1519_  s_diag_m2024_  s_diag_m2529_  s_diag_m3034_  s_diag_m3539_  s_diag_m4044_  s_diag_m4549_ 
s_diag_m5054_  s_diag_m5559_  s_diag_m6064_ 
s_diag_w1549_  s_diag_w1519_  s_diag_w2024_  s_diag_w2529_  s_diag_w3034_  s_diag_w3539_  s_diag_w4044_  s_diag_w4549_ 
s_diag_w5054_  s_diag_w5559_  s_diag_w6064_  s_diag_sw 
s_nn_tdr_diag

s_diag_this_period  s_diag_this_period_m  s_diag_this_period_f  s_diag_this_period_f_non_anc  s_diag_this_period_f_anc 
s_diag_this_period_m_sympt  s_diag_this_period_f_sympt  
s_sympt_diag  s_sympt_diag_ever  s_diag_m  s_diag_w  s_epdiag_m  s_epdiag_w	 s_epi_m  s_epi_w
s_diag_ep

/*VL and CD4*/
s_vlg1  s_vlg2  s_vlg3  s_vlg4  s_vlg5  s_vlg6
s_line1_vlg1000 s_line2_vlg1000  s_res_vfail1
s_u_vfail1_this_period  s_u_vfail1  s_vl_vfail1_g1 s_vl_vfail1_g2 s_vl_vfail1_g3 s_vl_vfail1_g4 s_vl_vfail1_g5 s_vl_vfail1_g6 
s_vlg1000_onart  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_184m  s_vlg1000_onart_65m  s_sw_vg1000
s_vg1000  s_vg1000_m  s_vg1000_w  s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw

s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
s_art_initiation_strategy  s_art_monitoring_strategy   s_naive    s_onart  s_int_clinic_not_aw
s_art_start  	s_art_start_m   s_art_start_w   s_artexp  s_artexpoff  s_onart_m  s_onart_w
s_onart_m1549_  s_onart_m1564_  s_onart_m1519_  s_onart_m2024_  s_onart_m2529_  s_onart_m3034_  s_onart_m3539_  
s_onart_m4044_  s_onart_m4549_  s_onart_m5054_  s_onart_m5559_  s_onart_m6064_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	s_onart_sw
s_art_dur_l6m   s_art_dur_g6m   s_art_tdur_l6m  s_art_tdur_g6m
s_eponart_m	 s_eponart_w  s_hiv1564_onart  s_dead1564_onart  s_who3_art_init  s_who4_art_init  s_art_start_pregnant 

s_lpr  s_taz  s_3tc  s_nev  s_efa  s_ten  s_zdv  s_dol
s_onefa_linefail1  s_ev_art_g1k_l1k  s_ev_art_g1k_not2l  s_ev_art_g1k_not2l_l1k  s_ev_art_g1k  s_ev_art_g1k_not2l_adc
s_art_12m  s_vl1000_art_12m  s_art_24m  s_vl1000_art_24m  s_art_12m_onart  s_vl1000_art_12m_onart
s_startedline2  s_start_line2_this_period  s_line2_12m  s_line2_12m_onart  s_line2_incl_int_clinic_not_aw

s_onart_vlg1000  s_ever_onart_gt6m_vlg1000   s_ever_onart_gt6m_vl_m_g1000  s_onart_gt6m_vlg1000  s_r_onart_gt6m_vlg1000
s_onart_gt6m_nnres_vlg1000  s_onart_gt6m_pires_vlg1000  s_onart_gt6m_res_vlg1000
s_online1_vg1000  s_online1_vg1000_lf1  s_online1_vg1000_cd4l200  s_offart_vl1000
s_vl1000_line2_12m  t  s_vl1000_line2_12m_onart  s_vl1000_line2

s_offart  s_line1_  s_line2_  s_line1_lf0  s_line1_lf1  s_line2_lf1  s_line2_lf2  s_linefail_ge1  s_line1_fail_this_period
s_lf1_past_yr   s_lf1_past_yr_line2 
s_onart_cl200  s_onart_cd4_g500  s_onart_res  s_reg_option

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  s_rel_dol_tox  s_dol_higher_potency

s_status_artl1_1_1   s_status_artl1_1_2   s_status_artl1_1_3   s_status_artl1_1_4   s_status_artl1_1_5   s_status_artl1_1_6  
s_status_artl1_1_7   s_status_artl1_1_8   s_status_artl1_1_9   s_status_artl1_1_10  s_status_artl1_1_11  s_status_artl1_1_12 
s_status_artl1_1_13  s_status_artl1_1_14  s_status_artl1_1_15  s_status_artl1_1_16 
s_status_artl1_3_1   s_status_artl1_3_2   s_status_artl1_3_3   s_status_artl1_3_4   s_status_artl1_3_5   s_status_artl1_3_6
s_status_artl1_3_7   s_status_artl1_3_8   s_status_artl1_3_9   s_status_artl1_3_10  s_status_artl1_3_11  s_status_artl1_3_12 
s_status_artl1_3_13  s_status_artl1_3_14  s_status_artl1_3_15  s_status_artl1_3_16 
s_status_artl1_5_1   s_status_artl1_5_2   s_status_artl1_5_3   s_status_artl1_5_4   s_status_artl1_5_5   s_status_artl1_5_6 
s_status_artl1_5_7   s_status_artl1_5_8   s_status_artl1_5_9   s_status_artl1_5_10  s_status_artl1_5_11  s_status_artl1_5_12
s_status_artl1_5_13  s_status_artl1_5_14  s_status_artl1_5_15  s_status_artl1_5_16

s_rr_int_tox   s_double_rate_gas_tox_taz   s_incr_mort_risk_dol_weightg  s_oth_dol_adv_birth_e_risk  s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e  s_prop_bmi_ge23

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

reg_option_

s_drug_level_test   s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

s_o_zdv_tox s_o_3tc_tox s_o_ten_tox s_o_taz_tox s_o_lpr_tox s_o_efa_tox s_o_nev_tox s_o_dol_tox 
s_o_zdv_adh_hi s_o_3tc_adh_hi s_o_ten_adh_hi s_o_taz_adh_hi s_o_lpr_adh_hi s_o_efa_adh_hi s_o_nev_adh_hi s_o_dol_adh_hi 

s_o_tle_tox s_o_tld_tox s_o_zld_tox s_o_zla_tox s_o_tle_adh_hi  s_o_tld_adh_hi  s_o_zld_adh_hi  s_o_zla_adh_hi 

s_a_zld_if_reg_op_116  s_adh_hi_a_zld_if_reg_op_116  s_nac_ge2p75_a_zld_if_reg_op_116  s_nac_ge2p00_a_zld_if_reg_op_116  s_nac_ge1p50_a_zld_if_reg_op_116

s_start_zld_if_reg_op_116   s_onart_start_zld_if_reg_op_116   s_e_rt65m_st_zld_if_reg_op_116  s_n_zld_if_reg_op_116   s_x_n_zld_if_reg_op_116 

/*costs and dalys*/
s_cost       s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ     s_t_adh_int_cost      s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  			  s_cost_cascade_intervention
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
  	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dwho3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ     s_d_t_adh_int_cost   s_dcost_test_m   s_dcost_test_f
s_dcost_prep   s_dcost_prep_visit  			   s_dcost_prep_ac_adh 			  s_dcost_cascade_interventions
s_dcost_test_m_sympt  	       s_dcost_test_f_sympt  		   s_dcost_test_m_circ  	  	 	s_dcost_test_f_anc s_dcost_test_f_sw
s_dcost_test_f_non_anc 	       s_dpi_cost     s_dcost_switch_line  		  s_dcost_child_hiv s_dcost_child_hiv_mo_art  		   s_dcost_art_init
	   s_dart_1_cost  s_dart_2_cost     s_dart_3_cost	   s_dcost_vl_not_done 	
s_dcost_non_aids_pre_death   s_ddaly_non_aids_pre_death  s_dead_ddaly_oth_dol_adv_birth_e   s_dcost_drug_level_test
s_dead_ddaly_ntd  s_ddaly_mtct    s_dead_ddaly

/*visits*/
s_visit  s_lost  s_linked_to_care  s_linked_to_care_this_period
s_pre_art_care  
s_visit_prep_no  s_visit_prep_d  s_visit_prep_dt  s_visit_prep_dtc
s_sv  s_sv_secondline   

/*deaths*/
s_dead1564_all	   s_dead1564m_all    s_dead1564w_all
s_deaths1519m_all  s_deaths2024m_all  s_deaths2529m_all  s_deaths3034m_all  s_deaths3539m_all s_deaths4044m_all  s_deaths4549m_all
s_deaths1519w_all  s_deaths2024w_all  s_deaths2529w_all  s_deaths3034w_all  s_deaths3539w_all s_deaths4044w_all  s_deaths4549w_all
s_death_hivrel  s_dead_rdcause2  s_dead_onart_rdcause2
s_deaths  s_death_hiv  s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_1p 
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
s_ev_art_g1k_not2l_adead  

/*sex workers*/
s_base_rate_sw  s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw1849_  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp   s_sw1524_newp s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  
s_diag_sw s_onart_sw s_vs_sw 


/*ADC etc*/
s_adc  s_who3_event  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 

/*Pregnancy and children*/
s_pregnant 	s_anc  s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant 
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_CEB_W1524_ 		s_CEB_W2534_ 		s_CEB_W3544_ 		s_CEB_W4549_ 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child  s_ntd_risk_dol  s_rate_birth_with_infected_child

/*circumcision*/
s_mcirc  s_mcirc_1519m  s_mcirc_2024m  s_mcirc_2529m  s_mcirc_3034m  s_mcirc_3539m  s_mcirc_4044m  s_mcirc_4549m  s_mcirc_50plm
s_vmmc s_vmmc1519m  s_vmmc2024m  s_vmmc2529m  s_vmmc3034m  s_vmmc3539m  s_vmmc4044m  s_vmmc4549m  s_vmmc50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3034m  s_new_mcirc_3539m  s_new_mcirc_4044m
s_new_mcirc_4549m  s_new_mcirc_50plm
s_birth_circ  s_mcirc_1014m  s_new_mcirc_1014m  s_vmmc1014m

/*parameters sampled*/
sex_beh_trans_matrix_m_  sex_beh_trans_matrix_w_  sex_age_mixing_matrix_m_ sex_age_mixing_matrix_w_   p_rred_p_  p_hsb_p_  newp_factor_  
eprate_  conc_ep_  ch_risk_diag_  ch_risk_diag_newp_  ych_risk_beh_newp_  ych2_risk_beh_newp_  ych_risk_beh_ep_
exp_setting_lower_p_vl1000_  external_exp_factor_  rate_exp_set_lower_p_vl1000_  prob_pregnancy_base_
fold_change_w_  fold_change_yw_  fold_change_sti_  super_infection_  an_lin_incr_test_  date_test_rate_plateau_  
rate_testanc_inc_  incr_test_rate_sympt_  max_freq_testing_  test_targeting_  fx_  gx_ adh_pattern_  prob_loss_at_diag_  
pr_art_init_  rate_lost_  prob_lost_art_  rate_return_  rate_restart_  rate_int_choice_  clinic_not_aw_int_frac_
res_trans_factor_nn_  rate_loss_persistence_  incr_rate_int_low_adh_  poorer_cd4rise_fail_nn_  
poorer_cd4rise_fail_ii_  rate_res_ten_  fold_change_mut_risk_  adh_effect_of_meas_alert_  pr_switch_line_  
prob_vl_meas_done_  red_adh_tb_adc_  red_adh_tox_pop_  red_adh_multi_pill_pop_ add_eff_adh_nnrti_  altered_adh_sec_line_pop_  prob_return_adc_  
prob_lossdiag_adctb_  prob_lossdiag_who3e_  higher_newp_less_engagement_  fold_tr_  switch_for_tox_
adh_pattern_prep_  rate_test_startprep_  rate_test_restartprep_  rate_choose_stop_prep_  circ_inc_rate_
p_hard_reach_w_  hard_reach_higher_in_men_  p_hard_reach_m_  inc_cat_   base_rate_sw_
prob_prep_restart_choice_ 	prepuptake_sw_ 		prepuptake_pop_   cd4_monitoring_   base_rate_stop_sexwork_    rred_a_p_
rr_int_tox_   rate_birth_with_infected_child_  nnrti_res_no_effect_  double_rate_gas_tox_taz_   incr_mort_risk_dol_weightg_
greater_disability_tox_	  greater_tox_zdv_	

/*2020 interventions*/
condom_incr_2020_    			  cascade_care_improvements_    incr_test_2020_             decr_hard_reach_2020_  incr_adh_2020_
decr_prob_loss_at_diag_2020_ 	  decr_rate_lost_2020_		    decr_rate_lost_art_2020_    incr_rate_return_2020_     
incr_rate_restart_2020_          incr_rate_init_2020_          decr_rate_int_choice_2020_  incr_prob_vl_meas_done_2020_ 
incr_pr_switch_line_2020_    	 prep_improvements_       	 incr_adh_pattern_prep_2020_ 
inc_r_test_startprep_2020_   incr_r_test_restartprep_2020_ decr_r_choose_stop_prep_2020_ 
inc_p_prep_restart_choi_2020_  incr_prepuptake_sw_2020_      incr_prepuptake_pop_2020_   expand_prep_to_all_2020_ 
circ_improvements_ 			  circ_inc_rate_2020_ 		     incr_test_targeting_2020_   option_0_prep_continue_2020_
incr_max_freq_testing_2020_      initial_pr_switch_line_       initial_prob_vl_meas_done_  sw_test_6mthly_2020_   reg_option_switch_2020_
art_mon_drug_levels_2020_   ten_is_taf_2020_	pop_wide_tld_2020_

eff_max_freq_testing_ 		eff_rate_restart_ 		eff_prob_loss_at_diag_ 		eff_rate_lost_ 		eff_prob_lost_art_ 		eff_rate_return_ 			
eff_pr_art_init_ 	eff_rate_int_choice_ 	eff_prob_vl_meas_done_ 		eff_pr_switch_line_ 	eff_rate_test_startprep_ 	eff_rate_test_restartprep_ 	
eff_rate_choose_stop_prep_ 		eff_prob_prep_restart_choice_ 	eff_prepuptake_sw_  eff_prepuptake_pop_ e_decr_hard_reach_2020_  eff_test_targeting_

/*supp material*/
s_onart_vlg1     s_onart_vlg2     s_onart_vlg3     s_onart_vlg4     s_onart_vlg5    
s_onart_vlg1_r   s_onart_vlg2_r   s_onart_vlg3_r   s_onart_vlg4_r   s_onart_vlg5_r 
s_onart_who4_year1   s_onart_who4_year1_vlt1000  s_onart_who4_year3   s_onart_who4_year3_vlt1000  s_onart_cd4l200_year1  
s_onart_cd4l200_year1_vlt1000  s_onart_cd4l200_year3   s_onart_cd4l200_year3_vlt1000  s_onart_res_1stline_linefail0   
s_onart_res_1stline  s_onart_linefail0  s_onart_linefail0_cl200  s_onart_linefail0_cl50  s_onart_cl50  s_onart_linefail0_vg1000  
s_onart_vg1000   s_onart_linefail0_vg1000_r   s_onart_vg1000_r   s_onart_cl350

s_newpge1_l4p_1529m	s_newpge1_l4p_1529w

s_m_1524_ge1newpever  s_m_2534_ge1newpever  s_m_3544_ge1newpever  s_m_4554_ge1newpever  s_m_5564_ge1newpever
s_m_1524_ge2newpever  s_m_2534_ge2newpever  s_m_3544_ge2newpever  s_m_4554_ge2newpever  s_m_5564_ge2newpever
s_m_1524_ge5newpever  s_m_2534_ge5newpever  s_m_3544_ge5newpever  s_m_4554_ge5newpever  s_m_5564_ge5newpever
s_w_ge1newpever		  s_w_ge2newpever		s_w_ge5newpever

s_npge1_l4p_1564m  s_npge1_l4p_1524m  s_npge1_l4p_2534m  s_npge1_l4p_3544m  s_npge1_l4p_4554m  s_npge1_l4p_5564m  s_npge1_l4p_1564w  s_npge1_l4p_1524w  s_npge1_l4p_2534w  s_npge1_l4p_3544w  s_npge1_l4p_4554w  s_npge1_l4p_5564w
s_npge2_l4p_1564m  s_npge2_l4p_1524m  s_npge2_l4p_2534m  s_npge2_l4p_3544m  s_npge2_l4p_4554m  s_npge2_l4p_5564m  s_npge2_l4p_1564w  s_npge2_l4p_1524w  s_npge2_l4p_2534w  s_npge2_l4p_3544w  s_npge2_l4p_4554w  s_npge2_l4p_5564w
s_npge10_l4p_1564m  s_npge10_l4p_1524m  s_npge10_l4p_2534m  s_npge10_l4p_3544m  s_npge10_l4p_4554m  s_npge10_l4p_5564m  s_npge10_l4p_1564w  s_npge10_l4p_1524w  s_npge10_l4p_2534w  s_npge10_l4p_3544w  s_npge10_l4p_4554w  s_npge10_l4p_5564w
s_npge50_l4p_1564m  s_npge50_l4p_1524m  s_npge50_l4p_2534m  s_npge50_l4p_3544m  s_npge50_l4p_4554m  s_npge50_l4p_5564m  s_npge50_l4p_1564w  s_npge50_l4p_1524w  s_npge50_l4p_2534w  s_npge50_l4p_3544w  s_npge50_l4p_4554w  s_npge50_l4p_5564w
s_npge1_l4p_1564_hivpos  s_npge2_l4p_1564_hivpos  s_npge1_l4p_1564_hivdiag  s_npge2_l4p_1564_hivdiag  s_npge1_l4p_1564_hivneg  s_npge2_l4p_1564_hivneg

/* used in abort statements */

prevalence1549  prev_ratio_1524

/* variables created after proc univariate which are used in the body of the program in order to update*/
s_prop_vlg1_rm  s_prop_vlg2_rm  s_prop_vlg3_rm  s_prop_vlg4_rm  s_prop_vlg5_rm  s_prop_vlg6_rm  
s_prop_vlg1_rm0_diag  s_prop_vlg2_rm0_diag  s_prop_vlg3_rm0_diag  s_prop_vlg4_rm0_diag  s_prop_vlg5_rm0_diag  s_prop_vlg6_rm0_diag  
s_prop_vlg1_rm1_diag  s_prop_vlg2_rm1_diag  s_prop_vlg3_rm1_diag  s_prop_vlg4_rm1_diag  s_prop_vlg5_rm1_diag  s_prop_vlg6_rm1_diag  
s_prop_vlg1_rm0_naive  s_prop_vlg2_rm0_naive  s_prop_vlg3_rm0_naive  s_prop_vlg4_rm0_naive  s_prop_vlg5_rm0_naive  s_prop_vlg6_rm0_naive  
s_prop_vlg1_rm1_naive  s_prop_vlg2_rm1_naive  s_prop_vlg3_rm1_naive  s_prop_vlg4_rm1_naive  s_prop_vlg5_rm1_naive  s_prop_vlg6_rm1_naive  
s_prop_tam1   s_prop_tam2   s_prop_tam3  s_prop_k103m  s_prop_y181m  s_prop_g190m   
s_prop_m184m  s_prop_q151m  s_prop_k65m   
s_prop_p32m   s_prop_p33m   s_prop_p46m  s_prop_p47m  s_prop_p50vm   
s_prop_p50lm  s_prop_p54m   s_prop_p76m  s_prop_p82m  s_prop_p84m  s_prop_p88m  s_prop_p90m  s_prop_pim  s_prop_inpm  s_prop_insm   

prevalence1524m  prevalence2534m  prevalence3544m  prevalence4554m  prevalence5564m
prevalence1524w  prevalence2534w  prevalence3544w  prevalence4554w  prevalence5564w
incidence1524m_epnewp  incidence2534m_epnewp  incidence3544m_epnewp  incidence4554m_epnewp  incidence5564m_epnewp
incidence1524w_epnewp  incidence2534w_epnewp  incidence3544w_epnewp  incidence4554w_epnewp  incidence5564w_epnewp

prop_mono_m_1524  prop_mono_m_2534  prop_mono_m_3544  prop_mono_m_4554  prop_mono_m_5564
prop_mono_w_1524  prop_mono_w_2534  prop_mono_w_3544  prop_mono_w_4554  prop_mono_w_5564
s_prop_newp_i_m_1524  s_prop_newp_i_m_2534  s_prop_newp_i_m_3544  s_prop_newp_i_m_4554  s_prop_newp_i_m_5564
s_prop_newp_i_w_1524  s_prop_newp_i_w_2534  s_prop_newp_i_w_3544  s_prop_newp_i_w_4554  s_prop_newp_i_w_5564

d_s_newp

s_prop_ageg1_m_vlg1  s_prop_ageg1_m_vlg2  s_prop_ageg1_m_vlg3   s_prop_ageg1_m_vlg4   s_prop_ageg1_m_vlg5   s_prop_ageg1_m_vlg6  
s_prop_ageg2_m_vlg1  s_prop_ageg2_m_vlg2  s_prop_ageg2_m_vlg3   s_prop_ageg2_m_vlg4   s_prop_ageg2_m_vlg5   s_prop_ageg2_m_vlg6  
s_prop_ageg3_m_vlg1  s_prop_ageg3_m_vlg2  s_prop_ageg3_m_vlg3   s_prop_ageg3_m_vlg4   s_prop_ageg3_m_vlg5   s_prop_ageg3_m_vlg6  
s_prop_ageg4_m_vlg1  s_prop_ageg4_m_vlg2  s_prop_ageg4_m_vlg3   s_prop_ageg4_m_vlg4   s_prop_ageg4_m_vlg5   s_prop_ageg4_m_vlg6  
s_prop_ageg5_m_vlg1  s_prop_ageg5_m_vlg2  s_prop_ageg5_m_vlg3   s_prop_ageg5_m_vlg4   s_prop_ageg5_m_vlg5   s_prop_ageg5_m_vlg6  

s_prop_ageg1_w_vlg1  s_prop_ageg1_w_vlg2  s_prop_ageg1_w_vlg3   s_prop_ageg1_w_vlg4   s_prop_ageg1_w_vlg5   s_prop_ageg1_w_vlg6  
s_prop_ageg2_w_vlg1  s_prop_ageg2_w_vlg2  s_prop_ageg2_w_vlg3   s_prop_ageg2_w_vlg4   s_prop_ageg2_w_vlg5   s_prop_ageg2_w_vlg6  
s_prop_ageg3_w_vlg1  s_prop_ageg3_w_vlg2  s_prop_ageg3_w_vlg3   s_prop_ageg3_w_vlg4   s_prop_ageg3_w_vlg5   s_prop_ageg3_w_vlg6  
s_prop_ageg4_w_vlg1  s_prop_ageg4_w_vlg2  s_prop_ageg4_w_vlg3   s_prop_ageg4_w_vlg4   s_prop_ageg4_w_vlg5   s_prop_ageg4_w_vlg6  
s_prop_ageg5_w_vlg1  s_prop_ageg5_w_vlg2  s_prop_ageg5_w_vlg3   s_prop_ageg5_w_vlg4   s_prop_ageg5_w_vlg5   s_prop_ageg5_w_vlg6  

s_prop_m_vlg1  s_prop_m_vlg2  s_prop_m_vlg3  s_prop_m_vlg4  s_prop_m_vlg5
s_prop_w_vlg1  s_prop_w_vlg2  s_prop_w_vlg3  s_prop_w_vlg4  s_prop_w_vlg5

p_onart_vls  p_onart_epvls  d_vls
p_diag  p_diag_onart  p_diag_eponart  p_diag_m  p_diag_w  p_epdiag_m  p_epdiag_w  d_diag_m  d_diag_w
d_onart

d_hiv_epi_wm  d_hiv_epi_mw  r_hiv_epi_both  r_ep_mw

r_s_ep_m15w15  r_s_ep_m15w25  r_s_ep_m15w35  r_s_ep_m15w45  r_s_ep_m15w55
r_s_ep_m25w15  r_s_ep_m25w25  r_s_ep_m25w35  r_s_ep_m25w45  r_s_ep_m25w55
r_s_ep_m35w15  r_s_ep_m35w25  r_s_ep_m35w35  r_s_ep_m35w45  r_s_ep_m35w55
r_s_ep_m45w15  r_s_ep_m45w25  r_s_ep_m45w35  r_s_ep_m45w45  r_s_ep_m45w55
r_s_ep_m55w15  r_s_ep_m55w25  r_s_ep_m55w35  r_s_ep_m55w45  r_s_ep_m55w55

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r  s_m_newp   s_w_newp
ptnewp15_m  ptnewp25_m  ptnewp35_m  ptnewp45_m  ptnewp55_m
ptnewp15_w  ptnewp25_w  ptnewp35_w  ptnewp45_w  ptnewp55_w

/* keep going - only needed in test runs */

keep_going_1999_  keep_going_2004_  keep_going_2016_  keep_going_2020_ 

s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n s_n 
; 

run;

proc freq;table circ_inc_rate_;where cald=2000;run;
***Note there are more birth_circs than mcirc, probably due to the 2nd proc univariate;

data a; 
set a1;

proc sort; by run_ cald option_;
run;



* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a1;
if cald=2019;
s_alive = s_alive_m + s_alive_w ;
sf_2019 = 10000000 / s_alive;
keep run_ sf_2019;
proc sort; by run_;run;


data y; 
merge a sf;
by run_;


* preparatory code ;

* ================================================================================= ;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

r_bir_w_infected_child_ = rate_birth_with_infected_child_;

reg_option_ = s_reg_option / s_n;

* ================================================================================= ;

* derived variables relating to population, not only those with hiv ;

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		if s_alive1564_w gt 0 then p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;

* p_newp_ge1;					if s_alive gt 0 then p_newp_ge1 = s_newp_ge1 / s_alive ;
* p_newp_ge5;					if s_alive gt 0 then p_newp_ge5 = s_newp_ge5 / s_alive ;
* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf_2019;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;
* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;
* n_tested_m;					n_tested_m = s_tested_m * sf_2019;

***All circumcisions;
* n_mcirc;						n_mcirc = s_mcirc*sf_2019;
* p_mcirc;						if s_alive_m gt 0 then p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1519m;				if s_ageg1519m gt 0 then p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				if s_ageg2024m gt 0 then p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				if s_ageg2529m gt 0 then p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3034m;				if s_ageg3034m gt 0 then p_mcirc_3034m = s_mcirc_3034m / s_ageg3034m ;
* p_mcirc_3539m;				if s_ageg3539m gt 0 then p_mcirc_3539m = s_mcirc_3539m / s_ageg3539m ;
* p_mcirc_4044m;				if s_ageg4044m gt 0 then p_mcirc_4044m = s_mcirc_4044m / s_ageg4044m ;
* p_mcirc_4549m;				if s_ageg4549m gt 0 then p_mcirc_4549m = s_mcirc_4549m / s_ageg4549m ;
* p_mcirc_50plm;				if (s_ageg5054m + s_ageg5559m + s_ageg6064m) gt 0 then p_mcirc_50plm = s_mcirc_50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;

***VMMC only;
* n_vmmc;						n_vmmc = s_vmmc*sf_2019;
* p_vmmc;						if s_alive_m gt 0 then p_vmmc = s_vmmc / s_alive_m ;
* p_vmmc1519m;					if s_ageg1519m gt 0 then p_vmmc1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc2024m;					if s_ageg2024m gt 0 then p_vmmc2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc2529m;					if s_ageg2529m gt 0 then p_vmmc2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc3034m;					if s_ageg3034m gt 0 then p_vmmc3034m = s_vmmc3034m / s_ageg3034m ;
* p_vmmc3539m;					if s_ageg3539m gt 0 then p_vmmc3539m = s_vmmc3539m / s_ageg3539m ;
* p_vmmc4044m;					if s_ageg4044m gt 0 then p_vmmc4044m = s_vmmc4044m / s_ageg4044m ;
* p_vmmc4549m;					if s_ageg4549m gt 0 then p_vmmc4549m = s_vmmc4549m / s_ageg4549m ;
* p_vmmc50plm;					if (s_ageg5054m + s_ageg5559m + s_ageg6064m) gt 0 then p_vmmc50plm = s_vmmc50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;

* s_new_mcirc_py;				s_new_mcirc_py = s_new_mcirc*4*sf_2019;
* s_new_mcirc_py_1519m;			s_new_mcirc_py_1519m = s_new_mcirc_1519m*4*sf_2019;
* s_new_mcirc_py_2024m;			s_new_mcirc_py_2024m = s_new_mcirc_2024m*4*sf_2019;
* s_new_mcirc_py_2529m;			s_new_mcirc_py_2529m = s_new_mcirc_2529m*4*sf_2019;
* s_new_mcirc_py_3034m;         s_new_mcirc_py_3034m = s_new_mcirc_3034m*4*sf_2019;
* s_new_mcirc_py_3539m;         s_new_mcirc_py_3539m = s_new_mcirc_3539m*4*sf_2019;
* s_new_mcirc_py_4044m;			s_new_mcirc_py_4044m = s_new_mcirc_4044m*4*sf_2019;
* s_new_mcirc_py_4549m;			s_new_mcirc_py_4549m = s_new_mcirc_4549m*4*sf_2019;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1519_sw;				if s_ageg1519w gt 0 then prop_w_1519_sw = s_sw_1519 / s_ageg1519w ;
* prop_w_2024_sw;				if s_ageg2024w gt 0 then prop_w_2024_sw = s_sw_2024 / s_ageg2024w ;
* prop_w_2529_sw;				if s_ageg2529w gt 0 then prop_w_2529_sw = s_sw_2529 / s_ageg2529w ;
* prop_w_3039_sw;				if (s_ageg3034w + s_ageg3539w) gt 0 then prop_w_3039_sw = s_sw_3039 / (s_ageg3034w + s_ageg3539w) ;
* prop_w_ov40_sw;				if (s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w + s_ageg6064w) gt 0 then
								prop_w_ov40_sw = s_sw_ov40 / (s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w + s_ageg6064w) ;
* prop_w_ever_sw;				if s_alive1564_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive1564_w ;
* prop_sw_hiv;					if s_sw_1564 gt 0 then prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_w_1524_onprep;			if (s_ageg1519m + s_ageg1519w) gt 0 then prop_w_1524_onprep = s_prep / (s_ageg1519m + s_ageg1519w) ;
* prop_1564_onprep;				if (s_alive - s_diag) gt 0 then prop_1564_onprep =   s_prep / (s_alive - s_diag) ;
* prop_sw_onprep; 				if s_sw_1564 gt 0 then prop_sw_onprep = s_prep_sw / s_sw_1564 ;
* prevalence1549m;				if s_alive1549_m gt 0 then prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				if s_alive1549_w gt 0 then prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				if (s_alive1549_w + s_alive1549_m) gt 0 then prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* incidence1549;				if (s_alive1549  - s_hiv1549  + s_primary1549) gt 0 then incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				if (s_alive1549_w  - s_hiv1549w  + s_primary1549w) gt 0 then incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				if (s_alive1549_m  - s_hiv1549m  + s_primary1549m) gt 0 then incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* prevalence1519w;				if s_ageg1519w gt 0 then prevalence1519w = s_hiv1519w  / s_ageg1519w ;
* prevalence1519m;				if s_ageg1519m gt 0 then prevalence1519m = s_hiv1519m  / s_ageg1519m ;
* prevalence2024w;				if s_ageg2024w gt 0 then prevalence2024w = s_hiv2024w  / s_ageg2024w ;
* prevalence2024m;				if s_ageg2024m gt 0 then prevalence2024m = s_hiv2024m  / s_ageg2024m ;
* prevalence2529w;				if s_ageg2529w gt 0 then prevalence2529w = s_hiv2529w  / s_ageg2529w ;
* prevalence2529m;				if s_ageg2529m gt 0 then prevalence2529m = s_hiv2529m  / s_ageg2529m ;
* prevalence3034w;				if s_ageg3034w gt 0 then prevalence3034w = s_hiv3034w  / s_ageg3034w ;
* prevalence3034m;				if s_ageg3034m gt 0 then prevalence3034m = s_hiv3034m  / s_ageg3034m ;
* prevalence3539w;				if s_ageg3539w gt 0 then prevalence3539w = s_hiv3539w  / s_ageg3539w ;
* prevalence3539m;				if s_ageg3539m gt 0 then prevalence3539m = s_hiv3539m  / s_ageg3539m ;
* prevalence4044w;				if s_ageg4044w gt 0 then prevalence4044w = s_hiv4044w  / s_ageg4044w ;
* prevalence4044m;				if s_ageg4044m gt 0 then prevalence4044m = s_hiv4044m  / s_ageg4044m ;
* prevalence4549w;				if s_ageg4549w gt 0 then prevalence4549w = s_hiv4549w  / s_ageg4549w ;
* prevalence4549m;				if s_ageg4549m gt 0 then  prevalence4549m = s_hiv4549m  / s_ageg4549m ;


* derived variables relating to people with hiv ;
								if  s_primary gt 0 then do;
* p_inf_vlsupp ;				p_inf_vlsupp = s_inf_vlsupp   / s_primary;
* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;	
								end;
* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hiv1564 ;  p_diag = p_diag * 100;
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m / s_hiv1564m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w / s_hiv1564w ;  p_diag_w = p_diag_w * 100;
* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;

* p_efa;						if s_onart > 0 then p_efa = s_efa / s_onart ;
* p_taz;						if s_onart > 0 then p_taz = s_taz / s_onart ;
* p_ten;						if s_onart > 0 then p_ten = s_ten / s_onart ;
* p_zdv;						if s_onart > 0 then p_zdv = s_zdv / s_onart ;
* p_dol; 						if s_onart > 0 then p_dol = s_dol / s_onart ;
* p_3tc;						if s_onart > 0 then p_3tc = s_3tc / s_onart ;
* p_lpr; 						if s_onart > 0 then p_lpr = s_lpr / s_onart ;
* p_nev;						if s_onart > 0 then p_nev = s_nev / s_onart ;

* p_tle;						if s_onart > 0 then p_tle = s_tle / s_onart ;
* p_tld;						if s_onart > 0 then p_tld = s_tld / s_onart ;
* p_zld;						if s_onart > 0 then p_zld = s_zld / s_onart ;
* p_zla;						if s_onart > 0 then p_zla = s_zla / s_onart ;
* p_otherreg;					if s_onart > 0 then p_otherreg = s_otherreg / s_onart ;

* p_drug_level_test;			if s_onart > 0 then p_drug_level_test = s_drug_level_test / s_onart ;

* p_linefail_ge1;				if s_artexp > 0 then p_linefail_ge1 = s_linefail_ge1 / s_artexp;
* p_startedline2;				if s_artexp > 0 then p_startedline2 = s_startedline2 / s_artexp; 
* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_vl1000, p_vg1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* p_onart_vl1000_all;			if s_onart_iicu > 0 then p_onart_vl1000_all = s_vl1000_art_iicu / s_onart_iicu ;
* p_onart_gt6m_iicu_m;			if s_hiv1564m > 0 then p_onart_gt6m_iicu_m = s_onart_gt6m_iicu_m / s_hiv1564m  ;
* p_onart_gt6m_iicu_w;			if s_hiv1564w  > 0 then p_onart_gt6m_iicu_w = s_onart_gt6m_iicu_w / s_hiv1564w  ;  
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);
* prev_vg1000_newp_m;			if s_i_m_newp gt 0 then prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_i_m_newp;
* prev_vg1000_newp_w;			if s_i_w_newp gt 0 then prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_i_w_newp;

* aids_death_rate;				if s_hiv1564 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hiv1564 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;


run;

data b;
set y;


prevalence1549_ = prevalence1549;
incidence1549_ = incidence1549;
p_onart_vl1000_ = p_onart_vl1000;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
p_newp_ge1_ = p_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;

proc sort; by cald run_ ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;

%let nfit=4776;  
run;
proc sort;by cald option_;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option_=1 then delete;

%let var =  

/*p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_   p_tested_ly_m1549_  p_tested_ly_w1549_   n_tested_m*/
n_mcirc  n_vmmc
p_mcirc	 p_mcirc_1519m  p_mcirc_2024m  p_mcirc_2529m  p_mcirc_3034m	 p_mcirc_3539m	p_mcirc_4044m  p_mcirc_4549m  p_mcirc_50plm 
p_vmmc	 p_vmmc1519m	p_vmmc2024m	   p_vmmc2529m	  p_vmmc3034m	 p_vmmc3539m	p_vmmc4044m    p_vmmc4549m 	p_vmmc50plm 

s_new_mcirc_py 			s_new_mcirc_py_1519m	s_new_mcirc_py_2024m	s_new_mcirc_py_2529m	s_new_mcirc_py_3034m	
s_new_mcirc_py_3539m	s_new_mcirc_py_4044m	s_new_mcirc_py_4549m
;		

/*prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence1549_  prevalence_vg1000_  incidence1549_ 	mtct_prop 		p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_gt6m_iicu_m 	p_onart_gt6m_iicu_w 
p_onart_vl1000_w				p_onart_vl1000_m

s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw1849_  
prop_w_1549_sw  prop_w_1519_sw  prop_w_2024_sw  prop_w_2529_sw  prop_w_3039_sw  prop_w_ov40_sw
prop_w_ever_sw


s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_sw_newp   s_sw1524_newp 
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  
s_vs_sw*/

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p25_&varb._0  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._0 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;

%option_0;
run;




data option_1;
set b;
if option_=0 then delete;

%let var =  

/*p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_   p_tested_ly_m1549_  p_tested_ly_w1549_   n_tested_m*/
n_mcirc  n_vmmc
p_mcirc	 p_mcirc_1519m  p_mcirc_2024m  p_mcirc_2529m  p_mcirc_3034m	 p_mcirc_3539m	p_mcirc_4044m  p_mcirc_4549m  p_mcirc_50plm 
p_vmmc	 p_vmmc1519m	p_vmmc2024m	   p_vmmc2529m	  p_vmmc3034m	 p_vmmc3539m	p_vmmc4044m    p_vmmc4549m 	p_vmmc50plm 

s_new_mcirc_py 			s_new_mcirc_py_1519m	s_new_mcirc_py_2024m	s_new_mcirc_py_2529m	s_new_mcirc_py_3034m	
s_new_mcirc_py_3539m	s_new_mcirc_py_4044m	s_new_mcirc_py_4549m

;	
/* 

prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence1549_  prevalence_vg1000_    incidence1549_ 	mtct_prop 		p_diag 	p_diag_m  p_diag_w	p_ai_no_arv_c_nnm 				p_artexp_diag
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 		p_vg1000_ 		p_onart_vl1000_all	p_onart_gt6m_iicu_m 	p_onart_gt6m_iicu_w 
p_onart_vl1000_w				p_onart_vl1000_m;
*/
***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p50_var = median_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p25_&varb._1  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._1 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;

%option_1;
run;


data d1;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15 g16  g17  g18  g19  g20  g21  g22  g23  g24  g25  g26 
g27  g28  /*g29   g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48  g49  g50  g51  g52 
g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71  g72  g73  g74  g75  g76  g77  g78 
g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100 g101 g102 g103 g104
g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252*/

/*

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39 */

;
by cald ;
run;



data d;
set d1;

***observed data from unaids/phia;
*Kenya;		if cald=2014.5 then do;
			o_p_circ_kya_unaids=0.93;
			end;
			if cald=2018.75 then o_new_circ_kya_unaids=286889;

*Ethiopia;	if cald=2016.5 then do;
			o_p_circ_epa_unaids=0.91;
			end;
			if cald=2018.75 then o_new_circ_epa_unaids=23009;

*Tanzania;	if cald=2017.5 then do;
			o_p_circ_tzn_unaids=0.79;
			o_p_circ_tzn_phia=0.79;
			end;
			if cald=2018.75 then o_new_circ_tzn_unaids=885599;

*Lesotho;	if cald=2014.5 then do;
			o_p_circ_lto_unaids=0.72;
			end;
			if cald=2016.5 then o_p_circ_lto_phia=0.683;
			if cald=2018.75 then o_new_circ_lto_unaids=26448;

*Mozambique;if cald=2015.5 then do;
			o_p_circ_mzb_unaids=0.62;
			end;
			if cald=2018.75 then o_new_circ_mzb_unaids=311891;

*S.Africa;	if cald=2017.5 then do;
			o_p_circ_sa_unaids=0.55;
			o_p_circ_sa15pl_hsrc=0.616;
			o_n_circ_sa15pl_hsrc=4330000;
			o_p_circ_sa1524_hsrc=0.702;
			o_p_circ_sa2534_hsrc=0.628;
			o_p_circ_sa3544_hsrc=0.626;
			o_p_circ_sa4554_hsrc=0.552;
			end;
			if cald=2018.75 then o_new_circ_sa_unaids=572442;

			if cald=2016.5 then o_p_circ_sa_phia=0.584;
			if cald=2012.5 then do; o_p_circ_sa_hsrc=0.464;o_n_circ_sa15pl_hsrc=3301000;end;
			if cald=2008.5 then do; o_p_circ_sa_hsrc=0.406;o_n_circ_sa15pl_hsrc=2269000;end;
			if cald=2002.5 then do; o_p_circ_sa_hsrc=0.380;o_n_circ_sa15pl_hsrc=1582000;end;

*Uganda;	if cald=2016.5 then do;
			o_p_circ_ugd_unaids=0.55;
			o_p_circ_ugd_phia=0.433;
			end;
			if cald=2018.75 then o_new_circ_ugd_unaids=619082;

*Namibia;	if cald=2017.5 then do;
			o_p_circ_nmb_unaids=0.34;
			end;
			if cald=2016.5 then o_p_circ_nmb_phia=0.39;
			if cald=2018.75 then o_new_circ_nmb_unaids=34942;

*Eswatini;	if cald=2016.5 then do;
			o_p_circ_esw_unaids=0.28;
			o_p_circ_esw_phia=0.30;
			end;
			if cald=2018.75 then o_new_circ_esw_unaids=14316;

*Rwanda;	if cald=2014.5 then do;
			o_p_circ_rwd_unaids=0.28;
			end;
			if cald=2015.5 then o_p_circ_rwd_unaids=0.30;
			if cald=2018.75 then o_new_circ_rwd_unaids=327904;

*Zambia;	if cald=2016.5 then do;
			o_p_circ_zam_unaids=0.27;
			o_p_circ_zam_phia=0.278;
			end;
			if cald=2014.5 then o_p_circ_zam_unaids=0.22;
			if cald=2018.75 then o_new_circ_zam_unaids=482183;

*Botswana;	if cald=2013.5 then do;
			o_p_circ_btw_unaids=0.22;
			end;
			if cald=2018.75 then o_new_circ_btw_unaids=24207;

*Malawi;	if cald=2016.5 then do;
			o_p_circ_mlw_unaids=0.28;
			o_p_circ_mlw1549_phia=0.254; o_p_circ_mlw1519_phia=0.267; o_p_circ_mlw2024_phia=0.285; o_p_circ_mlw2529_phia=0.232;
			o_p_circ_mlw3034_phia=0.235; o_p_circ_mlw3539_phia=0.262; o_p_circ_mlw4044_phia=0.226; o_p_circ_mlw4549_phia=0.239;		
			end;
			if cald=2018.75 then o_new_circ_mlw_unaids=199399;

			if cald=2004.5 then do;
			o_p_circ_mlw1549_dhs=0.207;	o_p_circ_mlw1519_dhs=0.184;	o_p_circ_mlw2024_dhs=0.171;	o_p_circ_mlw2529_dhs=0.208;
			o_p_circ_mlw3034_dhs=0.214;	o_p_circ_mlw3539_dhs=0.250; o_p_circ_mlw4044_dhs=0.267; o_p_circ_mlw4549_dhs=0.223;
			end;
			if cald=2010.75 then do;
			o_p_circ_mlw1549_dhs=0.215;	o_p_circ_mlw1519_dhs=0.217;	o_p_circ_mlw2024_dhs=0.222;	o_p_circ_mlw2529_dhs=0.183;
			o_p_circ_mlw3039_dhs=0.225;	o_p_circ_mlw4049_dhs=0.217; 
			end;
			if cald=2015.75 then do;
			o_p_circ_mlw1549_dhs=0.278;	o_p_circ_mlw1519_dhs=0.286;	o_p_circ_mlw2024_dhs=0.295;	o_p_circ_mlw2529_dhs=0.302;
			o_p_circ_mlw3039_dhs=0.262;	o_p_circ_mlw4049_dhs=0.249; 
			end;


*Zimbabwe;	if cald=2016.5 then do;
			o_p_circ_zim_unaids=0.14;
			o_p_circ_zim1549_phia=0.143; o_p_circ_zim1519_phia=0.236; o_p_circ_zim2024_phia=0.176; o_p_circ_zim2529_phia=0.118;
			o_p_circ_zim3034_phia=0.078; o_p_circ_zim3539_phia=0.081; o_p_circ_zim4044_phia=0.092; o_p_circ_zim4549_phia=0.109;			
			end;
			if cald=2018.75 then o_new_circ_zim_unaids=326012;

			if cald=2006.25 then do;
			o_p_circ_zim1549_dhs=0.103;	o_p_circ_zim1519_dhs=0.079;	o_p_circ_zim2024_dhs=0.106;
			o_p_circ_zim2529_dhs=0.125;	o_p_circ_zim3034_dhs=0.111;	o_p_circ_zim3539_dhs=0.108;
			end;
			if cald=2010.75 then do;
			o_p_circ_zim1549_dhs=0.091;	o_p_circ_zim1519_dhs=0.053;	o_p_circ_zim2024_dhs=0.081;
			o_p_circ_zim2529_dhs=0.106;	o_p_circ_zim3034_dhs=0.112;	o_p_circ_zim3539_dhs=0.115;
			end;
			if cald=2015.5 then do;
			o_p_circ_zim1549_dhs=0.143;	o_p_circ_zim1519_dhs=0.079;	o_p_circ_zim2024_dhs=0.106;
			o_p_circ_zim2529_dhs=0.125;	o_p_circ_zim3034_dhs=0.111;	o_p_circ_zim3539_dhs=0.108;
			end;

*T.Apollo; if cald = 2009 then do;
		   o_new_circ_zim_moh=2784;
		   o_new_circ_zim1519_moh=216;o_new_circ_zim2024_moh=765;o_new_circ_zim2529_moh=794;
		   end;
		   if cald = 2010 then do;
		   o_new_circ_zim_moh=9384;
		   o_new_circ_zim1519_moh=1954;o_new_circ_zim2024_moh=2626;o_new_circ_zim2529_moh=2069;
		   end;
		   if cald = 2011 then do;
		   o_new_circ_zim_moh=27971;
		   o_new_circ_zim1519_moh=11403;o_new_circ_zim2024_moh=6502;o_new_circ_zim2529_moh=4382;
		   end;
		   if cald = 2012 then do;
		   o_new_circ_zim_moh=29668;
		   o_new_circ_zim1519_moh=12572;o_new_circ_zim2024_moh=6916;o_new_circ_zim2529_moh=4503;
		   end;
		   if cald = 2013 then do;
		   o_new_circ_zim_moh=65613;
		   o_new_circ_zim1519_moh=35324;o_new_circ_zim2024_moh=13173;o_new_circ_zim2529_moh=7949;
		   end;
		   if cald = 2014 then do;
		   o_new_circ_zim_moh=111369;
		   o_new_circ_zim1519_moh=62533;o_new_circ_zim2024_moh=23067;o_new_circ_zim2529_moh=11699;
		   end;
		   if cald = 2015 then do;
		   o_new_circ_zim_moh=133012;
		   o_new_circ_zim1519_moh=62624;o_new_circ_zim2024_moh=31169;o_new_circ_zim2529_moh=19613;
		   end;
		   if cald = 2016 then do;
		   o_new_circ_zim_moh=136986;
		   o_new_circ_zim1519_moh=59758;o_new_circ_zim2024_moh=31089;o_new_circ_zim2529_moh=20905;
		   end;
		   if cald = 2017 then do;
		   o_new_circ_zim_moh=159476;
		   o_new_circ_zim1519_moh=75347;o_new_circ_zim2024_moh=40187;o_new_circ_zim2529_moh=23871;
		   end;
		   if cald = 2018 then do;
		   o_new_circ_zim_moh=190100;
		   o_new_circ_zim1519_moh=87882;o_new_circ_zim2024_moh=46537;o_new_circ_zim2529_moh=30518;
		   end;
run;

ods graphics / reset imagefmt=jpeg height=4in width=6in maxlegendarea=45; run;
ods rtf file = 'C:\Loveleen\Synthesis model\VMMC Wider setting\Graphs_21Jan2020.doc' startpage=never; 


proc sgplot data=d; 

Title    height=1.5 justify=center "Proportion of men circumcised aged 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_0 = "All circumcisions";
label p50_p_vmmc_0 = "VMMC only";
*label p50_p_mcirc_1 = "Option 1 (median) ";
label o_p_circ_kya_unaids = "Kenya";
label o_p_circ_epa_unaids = "Ethiopia";
label o_p_circ_tzn_unaids = "Tanzania";
label o_p_circ_tzn_phia = "TZN - PHIA";
label o_p_circ_lto_unaids = "Lesotho";
label o_p_circ_lto_phia = "LES - PHIA";
label o_p_circ_mzb_unaids = "Mozambique";
label o_p_circ_sa_unaids = "South Africa";
label o_p_circ_sa_phia = "SA - PHIA";
label o_p_circ_sa15pl_hsrc = "SA - HSRC";
label o_p_circ_ugd_unaids = "Uganda";
label o_p_circ_ugd_phia = "UGD - PHIA";
label o_p_circ_nmb_unaids = "Namibia";
label o_p_circ_nmb_phia = "NMB - PHIA";
label o_p_circ_esw_unaids = "Eswatini";
label o_p_circ_esw_phia = "ESW - PHIA";
label o_p_circ_rwd_unaids = "Rwanda";
label o_p_circ_zam_unaids = "Zambia";
label o_p_circ_zam_phia = "ZAM - PHIA";
label o_p_circ_btw_unaids = "Botswana";
label o_p_circ_mlw_unaids = "Malawi";
label o_p_circ_mlw1549_phia = "Malawi - PHIA";
label o_p_circ_mlw1549_dhs = "Malawi - DHS";
label o_p_circ_zim_unaids = "Zimbabwe";
label o_p_circ_zim1549_phia = "Zim - PHIA";
label o_p_circ_zim1549_dhs = "Zim - DHS";


series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "All circumcisions 90% range";

series  x=cald y=p50_p_vmmc_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vmmc_0 	upper=p95_p_vmmc_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "VMMC 90% range";


/*
series  x=cald y=p50_p_mcirc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_1 	upper=p95_p_mcirc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*/

scatter x=cald y=o_p_circ_kya_unaids/ markerattrs = (symbol=circle color=red size = 12);
scatter x=cald y=o_p_circ_epa_unaids/ markerattrs = (symbol=circle color=brown size = 12);
scatter x=cald y=o_p_circ_tzn_unaids/ markerattrs = (symbol=circle color=stypk size = 12);
scatter x=cald y=o_p_circ_tzn_phia/ markerattrs = (symbol=circle color=pink size = 12);
scatter x=cald y=o_p_circ_lto_unaids/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y=o_p_circ_lto_phia/ markerattrs = (symbol=circle color=lig size = 12);
scatter x=cald y=o_p_circ_mzb_unaids/ markerattrs = (symbol=circle color=blue size = 12);
scatter x=cald y=o_p_circ_sa_unaids/  markerattrs = (symbol=circle color=purple size = 12);
scatter x=cald y=o_p_circ_sa15pl_hsrc/  markerattrs = (symbol=circle color=lip size = 12);
scatter x=cald y=o_p_circ_sa_phia/  markerattrs = (symbol=circle color=dap size = 12);
scatter x=cald y=o_p_circ_ugd_unaids/ markerattrs = (symbol=circle color=gray size = 12);
scatter x=cald y=o_p_circ_ugd_phia/ markerattrs = (symbol=circle color=liggr size = 12);
scatter x=cald y=o_p_circ_nmb_unaids/ markerattrs = (symbol=circle color=ygr size = 12);
scatter x=cald y=o_p_circ_nmb_phia/ markerattrs = (symbol=circle color=liggr size = 12);
scatter x=cald y=o_p_circ_esw_unaids/ markerattrs = (symbol=circle color=vigb size = 12);
scatter x=cald y=o_p_circ_esw_phia/ markerattrs = (symbol=circle color=ligb size = 12);
scatter x=cald y=o_p_circ_rwd_unaids/ markerattrs = (symbol=circle color=dagb size = 12);
scatter x=cald y=o_p_circ_zam_unaids/ markerattrs = (symbol=circle color=lib size = 12);
scatter x=cald y=o_p_circ_zam_phia/ markerattrs = (symbol=circle color=dab size = 12);
scatter x=cald y=o_p_circ_mlw_unaids/ markerattrs = (symbol=circle color=dagr size = 12);
scatter x=cald y=o_p_circ_mlw1549_phia/ markerattrs = (symbol=circle color=lime size = 12);
scatter x=cald y=o_p_circ_mlw1549_dhs/ markerattrs = (symbol=circle color=vilg size = 12);
scatter x=cald y=o_p_circ_zim_unaids/ markerattrs = (symbol=circle color=orange size = 12);
scatter x=cald y=o_p_circ_zim1549_phia/ markerattrs = (symbol=circle color=vio size = 12);
scatter x=cald y=o_p_circ_zim1549_dhs/ markerattrs = (symbol=circle color=moo size = 12);
keylegend / noborder down=8 linelength=52 ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men circumcised stratified by age";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1519m_0 = "15 - 19 op 0 (median) ";
label p50_p_mcirc_2024m_0 = "20 - 24 op 0 (median) ";
label p50_p_mcirc_2529m_0 = "25 - 29 op 0 (median) ";
label p50_p_mcirc_3034m_0 = "30 - 34 op 0 (median) ";
label p50_p_mcirc_3539m_0 = "35 - 39 op 0 (median) ";
label p50_p_mcirc_4044m_0 = "40 - 44 op 0 (median) ";
label p50_p_mcirc_4549m_0 = "45 - 49 op 0 (median) ";
/*
label p50_p_mcirc_1519m_1 = "15 - 19 op 1 (median) ";
label p50_p_mcirc_2024m_1 = "20 - 24 op 1 (median) ";
label p50_p_mcirc_2529m_1 = "25 - 29 op 1 (median) ";
label p50_p_mcirc_3039m_1 = "30 - 39 op 1 (median) ";
label p50_p_mcirc_4049m_1 = "40 - 49 op 1 (median) ";
*/

series  x=cald y=p50_p_mcirc_1519m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1519m_0 	upper=p95_p_mcirc_1519m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_2024m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_mcirc_2024m_0 	upper=p95_p_mcirc_2024m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_2529m_0/	lineattrs = (color=yellow thickness = 2);
band    x=cald lower=p5_p_mcirc_2529m_0 	upper=p95_p_mcirc_2529m_0  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_3034m_0/	lineattrs = (color=brown thickness = 2);
band    x=cald lower=p5_p_mcirc_3034m_0 	upper=p95_p_mcirc_3034m_0  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_3539m_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_3539m_0 	upper=p95_p_mcirc_3539m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_4044m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_mcirc_4044m_0 	upper=p95_p_mcirc_4044m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_4549m_0/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_p_mcirc_4549m_0 	upper=p95_p_mcirc_4549m_0  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
/*
series  x=cald y=p50_p_mcirc_1519m_1/	lineattrs = (color=grey thickness = 2);
band    x=cald lower=p5_p_mcirc_1519m_1 	upper=p95_p_mcirc_1519m_1  / transparency=0.9 fillattrs = (color=grey) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_2024m_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_p_mcirc_2024m_1 	upper=p95_p_mcirc_2024m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_2529m_1/	lineattrs = (color=cream thickness = 2);
band    x=cald lower=p5_p_mcirc_2529m_1 	upper=p95_p_mcirc_2529m_1  / transparency=0.9 fillattrs = (color=cream) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_3039m_1/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_mcirc_3039m_1 	upper=p95_p_mcirc_3039m_1  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_4049m_1/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_p_mcirc_4049m_1 	upper=p95_p_mcirc_4049m_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
*/
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men circumcised aged 15-19";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1519m_0 = "15 - 19 all circumcisions (median) ";
label p50_p_vmmc1519m_0 = "15 - 19 vmmc only (median) ";

label o_p_circ_sa1524_hsrc = "South Africa 15-24 (HSRC)";
label o_p_circ_mlw1519_phia = "Malawi 15-19 (PHIA)";
label o_p_circ_mlw1519_dhs = "Malawi 15-19 (DHS)";
label o_p_circ_zim1519_phia = "Zimbabwe 15-19 (PHIA)";
label o_p_circ_zim1519_dhs = "Zimbabwe 15-19 (DHS)";


series  x=cald y=p50_p_mcirc_1519m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1519m_0 	upper=p95_p_mcirc_1519m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*
series  x=cald y=p50_p_vmmc1519m_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vmmc1519m_0 	upper=p95_p_vmmc1519m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*/

scatter x=cald y=o_p_circ_sa1524_hsrc/ markerattrs = (symbol=circle color=purple size = 12);
scatter x=cald y=o_p_circ_mlw1519_phia/ markerattrs = (symbol=circle color=dag size = 12);
scatter x=cald y=o_p_circ_mlw1519_dhs/ markerattrs = (symbol=circle color=lime size = 12);
scatter x=cald y=o_p_circ_zim1519_phia/ markerattrs = (symbol=circle color=orange size = 12);
scatter x=cald y=o_p_circ_zim1519_dhs/ markerattrs = (symbol=circle color=vio size = 12);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men circumcised aged 20-24";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_2024m_0 = "20 - 24 op 0 (median) ";
label o_p_circ_sa1524_hsrc = "South Africa 15-24 (HSRC)";
label o_p_circ_mlw2024_phia = "Malawi 20-24 (PHIA)";
label o_p_circ_mlw2024_dhs = "Malawi 20-24 (DHS)";
label o_p_circ_zim2024_phia = "Zimbabwe 20-24 (PHIA)";
label o_p_circ_zim2024_dhs = "Zimbabwe 20-24 (DHS)";


series  x=cald y=p50_p_mcirc_2024m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_2024m_0 	upper=p95_p_mcirc_2024m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


scatter x=cald y=o_p_circ_sa1524_hsrc/ markerattrs = (symbol=circle color=purple size = 12);
scatter x=cald y=o_p_circ_mlw2024_phia/ markerattrs = (symbol=circle color=dag size = 12);
scatter x=cald y=o_p_circ_mlw2024_dhs/ markerattrs = (symbol=circle color=lime size = 12);
scatter x=cald y=o_p_circ_zim2024_phia/ markerattrs = (symbol=circle color=orange size = 12);
scatter x=cald y=o_p_circ_zim2024_dhs/ markerattrs = (symbol=circle color=vio size = 12);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men circumcised aged 25-29";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_2529m_0 = "25 - 29 op 0 (median) ";
label o_p_circ_sa2534_hsrc = "South Africa 25-34 (HSRC)";
label o_p_circ_mlw2529_phia = "Malawi 25-29 (PHIA)";
label o_p_circ_mlw2529_dhs = "Malawi 25-29 (DHS)";
label o_p_circ_zim2529_phia = "Zimbabwe 25-29 (PHIA)";
label o_p_circ_zim2529_dhs = "Zimbabwe 25-29 (DHS)";


series  x=cald y=p50_p_mcirc_2529m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_2529m_0 	upper=p95_p_mcirc_2529m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


scatter x=cald y=o_p_circ_sa2534_hsrc/ markerattrs = (symbol=circle color=purple size = 12);
scatter x=cald y=o_p_circ_mlw2529_phia/ markerattrs = (symbol=circle color=dag size = 12);
scatter x=cald y=o_p_circ_mlw2529_dhs/ markerattrs = (symbol=circle color=lime size = 12);
scatter x=cald y=o_p_circ_zim2529_phia/ markerattrs = (symbol=circle color=orange size = 12);
scatter x=cald y=o_p_circ_zim2529_dhs/ markerattrs = (symbol=circle color=vio size = 12);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men circumcised aged 30-34";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_3034m_0 = "30 - 34 op 0 (median) ";
label o_p_circ_sa2534_hsrc = "South Africa 25-34 (HSRC)";
label o_p_circ_mlw3034_phia = "Malawi 30-34 (PHIA)";
label o_p_circ_mlw3034_dhs = "Malawi 30-34 (DHS)";
label o_p_circ_zim3034_phia = "Zimbabwe 30-34 (PHIA)";
label o_p_circ_zim3034_dhs = "Zimbabwe 30-34 (DHS)";


series  x=cald y=p50_p_mcirc_3034m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_3034m_0 	upper=p95_p_mcirc_3034m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


scatter x=cald y=o_p_circ_sa2534_hsrc/ markerattrs = (symbol=circle color=purple size = 12);
scatter x=cald y=o_p_circ_mlw3034_phia/ markerattrs = (symbol=circle color=dag size = 12);
scatter x=cald y=o_p_circ_mlw3034_dhs/ markerattrs = (symbol=circle color=lime size = 12);
scatter x=cald y=o_p_circ_zim3034_phia/ markerattrs = (symbol=circle color=orange size = 12);
scatter x=cald y=o_p_circ_zim3034_dhs/ markerattrs = (symbol=circle color=vio size = 12);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men circumcised aged 35-39";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_3539m_0 = "30 - 34 op 0 (median) ";
label o_p_circ_sa3544_hsrc = "South Africa 35-34 (HSRC)";
label o_p_circ_mlw3539_phia = "Malawi 35-39 (PHIA)";
label o_p_circ_mlw3539_dhs = "Malawi 35-39 (DHS)";
label o_p_circ_zim3539_phia = "Zimbabwe 35-39 (PHIA)";
label o_p_circ_zim3539_dhs = "Zimbabwe 35-39 (DHS)";


series  x=cald y=p50_p_mcirc_3539m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_3539m_0 	upper=p95_p_mcirc_3539m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


scatter x=cald y=o_p_circ_sa3544_hsrc/ markerattrs = (symbol=circle color=orange size = 12);
scatter x=cald y=o_p_circ_mlw3539_phia/ markerattrs = (symbol=circle color=dag size = 12);
scatter x=cald y=o_p_circ_mlw3539_dhs/ markerattrs = (symbol=circle color=lime size = 12);
scatter x=cald y=o_p_circ_zim3539_phia/ markerattrs = (symbol=circle color=orange size = 12);
scatter x=cald y=o_p_circ_zim3539_dhs/ markerattrs = (symbol=circle color=vio size = 12);

run;quit;





***Number of new circumcisions per year;
proc sgplot data=d; 
Title    height=1.5 justify=center "Total number of new circumcisions per year aged 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12) values = (0 to 400000 by 50000) valueattrs=(size=10);
label p50_s_new_mcirc_py_0 = "Modelled median";

label o_new_circ_zim_unaids = "Zimbabwe UNAIDS";
label o_new_circ_zim_moh 	= "Zimbabwe MoH";

series  x=cald y=p50_s_new_mcirc_py_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_s_new_mcirc_py_0 	upper=p95_s_new_mcirc_py_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_new_circ_zim_unaids/ markerattrs = (symbol=circle color=orange size = 12);
scatter x=cald y=o_new_circ_zim_moh/ markerattrs = (symbol=circle color=moo size = 12);

run;quit;



***Number of new circumcisions per year by age;
proc sgplot data=d; 
Title    height=1.5 justify=center "Total number of new circumcisions per year by age";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12) values = (0 to 100000 by 20000) valueattrs=(size=10);
label p50_s_new_mcirc_py_1519m_0 = "Modelled 15 - 19";
label p50_s_new_mcirc_py_2024m_0 = "Modelled 20 - 24";
label p50_s_new_mcirc_py_2529m_0 = "Modelled 25 - 29";

label  o_new_circ_zim1519_moh = "15-19 Zimbabwe MoH";
label  o_new_circ_zim2024_moh = "20-24 Zimbabwe MoH";
label  o_new_circ_zim2529_moh = "25-29 Zimbabwe MoH";

series  x=cald y=p50_s_new_mcirc_py_1519m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_s_new_mcirc_py_1519m_0	upper=p95_s_new_mcirc_py_1519m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_s_new_mcirc_py_2024m_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_s_new_mcirc_py_2024m_0	upper=p95_s_new_mcirc_py_2024m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=p50_s_new_mcirc_py_2529m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_s_new_mcirc_py_2529m_0	upper=p95_s_new_mcirc_py_2529m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";


scatter x=cald y=o_new_circ_zim1519_moh/ markerattrs = (symbol=circle color=black size = 12);
scatter x=cald y=o_new_circ_zim2024_moh/ markerattrs = (symbol=circle color=red size = 12);
scatter x=cald y=o_new_circ_zim2529_moh/ markerattrs = (symbol=circle color=geeen size = 12);
run;quit;


***Total number of circumcisions;
proc sgplot data=d; 
Title    height=1.5 justify=center "Total number of circumcisions ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  valueattrs=(size=10);
label p50_n_mcirc_0 = "Modelled median";

label o_new_circ_zim_unaids = "Zimbabwe UNAIDS";

series  x=cald y=p50_n_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_mcirc_0 	upper=p95_n_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


run;quit;

ods rtf close;
ods listing;
run;






proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "Option 0 (median) ";
label p50_p_w_giv_birth_this_per_1 = "Option 1 (median) ";

series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_0 	upper=p95_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_w_giv_birth_this_per_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_1 	upper=p95_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_newp_ge1__0 = "Option 0 (median) ";
label p50_p_newp_ge1__1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_newp_ge5__0 = "Option 0 (median) ";
label p50_p_newp_ge5__1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_ly_m1549_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_ly_m1549__0 = "Option 0 (median) ";
label p50_p_tested_ly_m1549__1 = "Option 1 (median) ";

series  x=cald y=p50_p_tested_ly_m1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_ly_m1549__0 	upper=p95_p_tested_ly_m1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_tested_ly_m1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_ly_m1549__1 	upper=p95_p_tested_ly_m1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_ly_w1549_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_ly_w1549__0 = "Option 0 (median) ";
label p50_p_tested_ly_w1549__1 = "Option 1 (median) ";

series  x=cald y=p50_p_tested_ly_w1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_ly_w1549__0 	upper=p95_p_tested_ly_w1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_tested_ly_w1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_ly_w1549__1 	upper=p95_p_tested_ly_w1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 5000000 by 500000) valueattrs=(size=10);
label p50_n_tested_m_0 = "Option 0 (median) ";
label p50_n_tested_m_1 = "Option 1 (median) ";

series  x=cald y=p50_n_tested_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_0 	upper=p95_n_tested_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_tested_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_m_1 	upper=p95_n_tested_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;







proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
label p50_prop_w_1549_sw_1 = "Current FSW 15-49 op 1 (median) ";

label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";


series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";

series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);

label p50_prop_w_1524_onprep_0 = "Option 0 (median) ";
label p50_prop_w_1524_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);

label p50_prop_1564_onprep_0 = "Option 0 (median) ";
label p50_prop_1564_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549m_0 = "Men Option 0 (median) ";
label p50_prevalence1549m_1 = "Men Option 1 (median) ";
label p50_prevalence1549w_0 = "Women Option 0 (median) ";
label p50_prevalence1549w_1 = "Women Option 1 (median) ";

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 8) valueattrs=(size=10);

label p50_incidence1549__0 = "Option 0 (median) ";
label p50_incidence1549__1 = "Option 1  (median) ";

series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";


run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_mtct_prop_0 = "Option 0 (median) ";
label p50_mtct_prop_1 = "Option 1  (median) ";

series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Percent diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label p50_p_diag_0 = "Option 0 (median) ";
label p50_p_diag_1 = "Option 1  (median) ";

series  x=cald y=p50_p_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Percent men diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label p50_p_diag_m_0 = "Option 0 (median) ";
label p50_p_diag_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Percent women diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label p50_p_diag_w_0 = "Option 0 (median) ";
label p50_p_diag_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);

label p50_p_ai_no_arv_c_nnm_0 = "Option 0 (median) ";
label p50_p_ai_no_arv_c_nnm_1 = "Option 1  (median) ";

series  x=cald y=p50_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ai_no_arv_c_nnm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_1 	upper=p95_p_ai_no_arv_c_nnm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "Option 0 (median) ";
label p50_p_artexp_diag_1 = "Option 1  (median) ";

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_0 = "Option 0 (median) ";
label p50_p_onart_diag_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_0 	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_1 	upper=p95_p_onart_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_m_0 = "Option 0 (median) ";
label p50_p_onart_diag_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_w_0 = "Option 0 (median) ";
label p50_p_onart_diag_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_efa_0 = "Option 0 (median) ";
label p50_p_efa_1 = "Option 1  (median) ";

series  x=cald y=p50_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_efa_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_efa_1 	upper=p95_p_efa_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TAZ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_taz_0 = "Option 0 (median) ";
label p50_p_taz_1 = "Option 1  (median) ";

series  x=cald y=p50_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_taz_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_taz_1 	upper=p95_p_taz_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TEN";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_ten_0 = "Option 0 (median) ";
label p50_p_ten_1 = "Option 1  (median) ";

series  x=cald y=p50_p_ten_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ten_0 	upper=p95_p_ten_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ten_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ten_1 	upper=p95_p_ten_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ZDV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_zdv_0 = "Option 0 (median) ";
label p50_p_zdv_1 = "Option 1  (median) ";

series  x=cald y=p50_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_zdv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_zdv_1 	upper=p95_p_zdv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_dol_0 = "Option 0 (median) ";
label p50_p_dol_1 = "Option 1  (median) ";

series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_dol_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_3TC_0 = "Option 0 (median) ";
label p50_p_3TC_1 = "Option 1  (median) ";

series  x=cald y=p50_p_3TC_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_3TC_0 	upper=p95_p_3TC_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_3TC_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_3TC_1 	upper=p95_p_3TC_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on LPR";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_lpr_0 = "Option 0 (median) ";
label p50_p_lpr_1 = "Option 1  (median) ";

series  x=cald y=p50_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_lpr_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_lpr_1 	upper=p95_p_lpr_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on NEV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_nev_0 = "Option 0 (median) ";
label p50_p_nev_1 = "Option 1  (median) ";

series  x=cald y=p50_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_nev_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_nev_1 	upper=p95_p_nev_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "Option 0 (median) ";
label p50_p_onart_vl1000__1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "Option 0 (median) ";
label p50_p_vl1000__1 = "Option 1  (median) ";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vg1000__0 = "Option 0 (median) ";
label p50_p_vg1000__1 = "Option 1  (median) ";

series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART (any period of time) with VL < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_all_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_all_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000_all_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_all_0 	upper=p95_p_onart_vl1000_all_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_all_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_all_1 	upper=p95_p_onart_vl1000_all_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men men on ART >6 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_gt6m_iicu_m_0 = "Option 0 (median) ";
label p50_p_onart_gt6m_iicu_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_gt6m_iicu_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_gt6m_iicu_m_0 	upper=p95_p_onart_gt6m_iicu_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_gt6m_iicu_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_gt6m_iicu_m_1 	upper=p95_p_onart_gt6m_iicu_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART >6 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_gt6m_iicu_w_0 = "Option 0 (median) ";
label p50_p_onart_gt6m_iicu_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_gt6m_iicu_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_gt6m_iicu_w_0 	upper=p95_p_onart_gt6m_iicu_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_gt6m_iicu_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_gt6m_iicu_w_1 	upper=p95_p_onart_gt6m_iicu_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_m_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_w_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1989 to 2040 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "Option 0 (median) ";
label p50_prevalence_vg1000__1 = "Option 1  (median) ";

series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


 

ods html close;

* ods rtf close;
* ods listing;
run;






	
