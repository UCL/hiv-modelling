
*libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\";
libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\unaids\";


data d1;  

infile "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\unaids\c_output_unaids_14_8_20_1pm";  

input   


/*general*/
run   cald   option 

/*number alive and in each age group*/
s_alive1549	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m		s_ageg1014m	
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
s_primary_sw  s_primary_sw1519_  s_primary_sw2024_  s_primary_sw2529_  s_primary_sw3039_
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
s_m1524_ep1524 s_m1524_ep2534 s_m1524_ep3544 s_m1524_ep4554 s_m1524_ep5564 
s_m2534_ep1524 s_m2534_ep2534 s_m2534_ep3544 s_m2534_ep4554 s_m2534_ep5564 
s_m3544_ep1524 s_m3544_ep2534 s_m3544_ep3544 s_m3544_ep4554 s_m3544_ep5564 
s_m4554_ep1524 s_m4554_ep2534 s_m4554_ep3544 s_m4554_ep4554 s_m4554_ep5564 
s_m5564_ep1524 s_m5564_ep2534 s_m5564_ep3544 s_m5564_ep4554 s_m5564_ep5564 
s_w1524_ep1524 s_w1524_ep2534 s_w1524_ep3544 s_w1524_ep4554 s_w1524_ep5564 
s_w2534_ep1524 s_w2534_ep2534 s_w2534_ep3544 s_w2534_ep4554 s_w2534_ep5564 
s_w3544_ep1524 s_w3544_ep2534 s_w3544_ep3544 s_w3544_ep4554 s_w3544_ep5564 
s_w4554_ep1524 s_w4554_ep2534 s_w4554_ep3544 s_w4554_ep4554 s_w4554_ep5564 
s_w5564_ep1524 s_w5564_ep2534 s_w5564_ep3544 s_w5564_ep4554 s_w5564_ep5564 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5
s_m1549_newp_ge1  s_w1549_newp_ge1

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 

npgt1conc_l4p_1524m  npgt1conc_l4p_1524w  npgt1conc_l4p_1519m  npgt1conc_l4p_1519w  npgt1conc_l4p_2549m 
npgt1conc_l4p_2549w  npgt1conc_l4p_5064m  npgt1conc_l4p_5064w 

s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

s_newp_this_per_art_or_prep   s_newp_this_per_art   s_newp_this_per_prep  s_newp_this_per_prep_sw 
s_newp_this_per_elig_prep 	s_newp_this_per_elig_prep_sw 
s_newp_this_per  s_newp_sw  s_newp_hivneg   s_newp_this_per_hivneg    s_newp_this_per_hivneg_1549  s_newp_this_per_1549

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
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  
s_ai_naive_no_pmtct_   s_ai_naive_no_pmtct_c_nnm_
s_ai_naive_no_pmtct_c_pim_  s_ai_naive_no_pmtct_c_inm_   s_ai_naive_no_pmtct_c_rt184m_  s_ai_naive_no_pmtct_c_rt65m_  s_ai_naive_no_pmtct_c_rttams_ 
s_o_dol_2nd_vlg1000 s_o_dol_2nd_vlg1000_dolr1_adh0  s_o_dol_2nd_vlg1000_dolr1_adh1  s_o_dol_2nd_vlg1000_dolr0_adh0 s_o_dol_2nd_vlg1000_dolr0_adh1 

s_zero_3tc_activity_m184  s_zero_tdf_activity_k65r

s_ontle  s_vlg1000_ontle  s_vlg1000_184m_ontle  s_vlg1000_65m_ontle  s_vlg1000_nnm_ontle s_ontld s_vlg1000_ontld  s_vlg1000_65m_ontld 
s_vlg1000_184m_ontld  s_vlg1000_nnm_ontld s_vlg1000_inm_ontld  s_vlg1000_tams_ontle  s_vlg1000_tams_ontld

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
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w  s_elig_prep_sw   s_elig_prep_onprep

s_elig_prep_w_1549 s_prep_w_1549 

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

s_prep_newp  s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg4  
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_ever_w_1524  s_prep_ever_w
s_test_gt_period1_on_prep  s_test_gt_period1_on_prep_pos  s_test_period1_on_prep  s_test_period1_on_prep_pos  
s_prepuptake_sw 	 s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep   prep_strategy
										

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
s_vg1000  s_vg1000_m  s_vg1000_w  s_vg1000_w_1524  s_vg1000_m_1524  s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw s_vl1000_art_gt6m_iicu_sw  s_onart_gt6m_iicu_sw

s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
  s_naive    s_onart  s_int_clinic_not_aw
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
s_vl1000_line2_12m   s_vl1000_line2_12m_onart  s_vl1000_line2

s_offart  s_line1_  s_line2_  s_line1_lf0  s_line1_lf1  s_line2_lf1  s_line2_lf2  s_linefail_ge1  s_line1_fail_this_period
s_lf1_past_yr   s_lf1_past_yr_line2 
s_onart_cl200  s_onart_cd4_g500  s_onart_res 

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  

s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e 

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

s_drug_level_test   s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

s_o_zdv_tox s_o_3tc_tox s_o_ten_tox s_o_taz_tox s_o_lpr_tox s_o_efa_tox s_o_nev_tox s_o_dol_tox 
s_o_zdv_adh_hi s_o_3tc_adh_hi s_o_ten_adh_hi s_o_taz_adh_hi s_o_lpr_adh_hi s_o_efa_adh_hi s_o_nev_adh_hi s_o_dol_adh_hi 

s_o_tle_tox s_o_tld_tox s_o_zld_tox s_o_zla_tox s_o_tle_adh_hi  s_o_tld_adh_hi  s_o_zld_adh_hi  s_o_zla_adh_hi 

s_a_zld_if_reg_op_116  s_adh_hi_a_zld_if_reg_op_116  s_nac_ge2p75_a_zld_if_reg_op_116  s_nac_ge2p00_a_zld_if_reg_op_116  s_nac_ge1p50_a_zld_if_reg_op_116

s_start_zld_if_reg_op_116   s_onart_start_zld_if_reg_op_116   s_e_rt65m_st_zld_if_reg_op_116  s_n_zld_if_reg_op_116   s_x_n_zld_if_reg_op_116 

s_per1_art_int s_per2_art_int	s_dead_per1_art_int	s_dead_per2_art_int  s_cd4_before_int	s_cd4_before_int_lt100   	s_cd4_before_int_100200 
s_cd4_per1_art_int 	s_cd4_per1_art_int_lt100	s_cd4_per1_art_int_100200 s_cd4_per2_art_int 	s_cd4_per2_art_int_lt100	s_cd4_per2_art_int_100200

s_started_art_as_tld_prep_vl1000    s_onart_as_tld_prep   s_onart_as_tld_prep_vl1000     s_started_art_as_tld_prep 

/*costs and dalys*/
s_cost       s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ   s_cost_condom_dn  s_cost_sw_program  s_t_adh_int_cost      s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  			  s_cost_cascade_intervention
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
  	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dwho3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ  s_dcost_condom_dn  s_dcost_sw_program   s_d_t_adh_int_cost   s_dtest_cost_f  s_dtest_cost_m
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
s_dead1519m_all  s_dead2024m_all  s_dead2529m_all  s_dead3034m_all  s_dead3539m_all s_dead4044m_all  s_dead4549m_all
s_dead1519w_all  s_dead2024w_all  s_dead2529w_all  s_dead3034w_all  s_dead3539w_all s_dead4044w_all  s_dead4549w_all
s_death_hivrel  s_dead_rdcause2  s_dead_onart_rdcause2  s_death_dcause3
s_dead1564_  s_death_hiv  s_death_hiv_m s_death_hiv_w  s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_1p 
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
s_ev_art_g1k_not2l_adead  s_dead_allage  s_death_dcause3_allage  s_death_hivrel_allage

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

s_age_deb_sw1519_  s_age_deb_sw2024_  s_age_deb_sw2529_  s_age_deb_sw3039_  s_age_deb_swov40_ 
s_age_deb_sw_nm1519_  s_age_deb_sw_nm2024_  s_age_deb_sw_nm2529_  s_age_deb_sw_nm3039_  s_age_deb_sw_nmov40_ 

s_age_stop_sw1519_  s_age_stop_sw2024_  s_age_stop_sw2529_  s_age_stop_sw3039_  s_age_stop_swov40_ 

s_actdur_sw_0to3  s_actdur_sw_3to5  s_actdur_sw_6to9  s_actdur_sw_10to19  
s_totdur_sw_0to3  s_totdur_sw_3to5  s_totdur_sw_6to9  s_totdur_sw_10to19 
s_totdur_eversw_0to3  s_totdur_eversw_3to5  s_totdur_eversw_6to9  s_totdur_eversw_10to19 

s_sw_program_visit

s_diag_sw_noprog  s_diag_sw_inprog  s_onart_sw_noprog  s_onart_sw_inprog  
s_vl1000_art_gt6m_iicu_sw_noprog  s_vl1000_art_gt6m_iicu_sw_inprog 

s_sw1519_tp1  s_sw2024_tp1  s_sw2529_tp1  s_sw3039_tp1  s_swov40_tp1

/*ADC etc*/
s_adc  s_who3_event  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 

/*Pregnancy and children*/
s_pregnant 	s_anc  s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant 
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524_  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_ceb_w1524 	s_ceb_w2534		s_ceb_w3544 	s_ceb_w4549 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child  

/*circumcision*/
s_mcirc  s_mcirc_1519m  s_mcirc_2024m  s_mcirc_2529m  s_mcirc_3034m  s_mcirc_3539m  s_mcirc_4044m  s_mcirc_4549m 
s_mcirc_50plm
s_vmmc s_vmmc1519m  s_vmmc2024m  s_vmmc2529m  s_vmmc3034m  s_vmmc3539m  s_vmmc4044m  s_vmmc4549m  s_vmmc50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3034m  s_new_mcirc_3539m  
s_new_mcirc_4044m  s_new_mcirc_4549m  s_new_mcirc_50plm
s_new_vmmc s_new_vmmc1519m  s_new_vmmc2024m  s_new_vmmc2529m  s_new_vmmc3034m  s_new_vmmc3539m  s_new_vmmc4044m 
s_new_vmmc4549m  s_new_vmmc50plm

s_birth_circ  s_mcirc_1014m  s_new_mcirc_1014m  s_vmmc1014m  s_new_vmmc1014m

/*parameters sampled*/
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  sex_age_mixing_matrix_m sex_age_mixing_matrix_w   p_rred_p  p_hsb_p  newp_factor  
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate  circ_inc_15_19  circ_red_20_30  circ_red_30_50
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat   base_rate_sw 
prob_prep_restart_choice 	prepuptake_sw 		prepuptake_pop   cd4_monitoring   base_rate_stop_sexwork    rred_a_p 
rr_int_tox   rate_birth_with_infected_child  nnrti_res_no_effect  double_rate_gas_tox_taz   incr_mort_risk_dol_weightg 
greater_disability_tox 	  greater_tox_zdv 	higher_rate_res_dol  rel_dol_tox  dol_higher_potency  prop_bmi_ge23
ntd_risk_dol  oth_dol_adv_birth_e_risk  zdv_potency_p75
sw_program  eff_sw_program  sw_program_effect sw_higher_int  prob_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
sw_init_newp sw_trans_matrix  rate_sw_rred_rc  effect_weak_sw_prog_newp  effect_strong_sw_prog_newp  sw_art_disadv

/*2020 interventions*/
condom_incr_2020    			  cascade_care_improvements    incr_test_2020             decr_hard_reach_2020  incr_adh_2020 
decr_prob_loss_at_diag_2020 	  decr_rate_lost_2020 		    decr_rate_lost_art_2020    incr_rate_return_2020     
incr_rate_restart_2020          incr_rate_init_2020          decr_rate_int_choice_2020  incr_prob_vl_meas_done_2020 
incr_pr_switch_line_2020    	 prep_improvements       	 incr_adh_pattern_prep_2020 
inc_r_test_startprep_2020   incr_r_test_restartprep_2020 decr_r_choose_stop_prep_2020 
inc_p_prep_restart_choi_2020  incr_prepuptake_sw_2020      incr_prepuptake_pop_2020   prep_strategy_2020 
circ_improvements 			  circ_inc_rate_2020 		     incr_test_targeting_2020   
incr_max_freq_testing_2020      initial_pr_switch_line       initial_prob_vl_meas_done  sw_test_6mthly_2020   reg_option_switch_2020 
art_mon_drug_levels_2020   ten_is_taf_2020  	pop_wide_tld_2020 single_vl_switch_efa_2020

eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice  e_decr_hard_reach_2020  eff_test_targeting

vmmc_disrup_covid condom_disrup_covid prep_disrup_covid swprog_disrup_covid testing_disrup_covid art_tld_disrup_covid art_tld_eod_disrup_covid
art_init_disrup_covid vl_adh_switch_disrup_covid cotrim_disrup_covid no_art_disrup_covid inc_death_rate_aids_disrup_covid art_low_adh_disrup_covid
cov_death_risk_mult

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

/* covid */

s_covid

/* used in abort statements */

prevalence1549  prev_ratio_1524 incidence1549w  incidence1549m  cum_ratio_newp_mw

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

s_prop_m_vlg1  s_prop_m_vlg2  s_prop_m_vlg3  s_prop_m_vlg4  s_prop_m_vlg5 s_prop_m_vlg6 
s_prop_w_vlg1  s_prop_w_vlg2  s_prop_w_vlg3  s_prop_w_vlg4  s_prop_w_vlg5 s_prop_w_vlg6

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


; 

if run=997951394 ;

data a; set d1  ;


proc sort; by run cald option;run;
proc freq;table run;where cald=2020;run;

* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a ;
 
if cald=2020;
s_alive = s_alive_m + s_alive_w ;
sf_2020 = 10000000 / s_alive;
keep run sf_2020;
proc sort; by run;


data y; 
merge a sf;
by run ;


* preparatory code ;

* ================================================================================= ;

zero_3tc_activity_m184   = s_zero_3tc_activity_m184 / s_n ;
zero_tdf_activity_k65r  =  s_zero_tdf_activity_k65r / s_n ;

if s_pregnant_oth_dol_adv_birth_e = . then s_pregnant_oth_dol_adv_birth_e = 0;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

*r_bir_w_infected_child_ = rate_birth_with_infected_child_;


*reg_option = s_reg_option / s_n;

* ================================================================================= ;


* discount rate;

* ================================================================================= ;

if s_cost_ gt 0 then disc     = s_dcost_ / s_cost_;
* discount rate is 3%; 
* note discounting is from 2020 - no adjustment needed;
* ts1m - this code needs to change for ts1m;
discount_adj = 1;
discount_adj_10p = discount_adj * (0.90/0.97)**(cald-2020) ; 
discount_adj_0  = discount_adj * (1.00/0.97)**(cald-2020) ; 
discount = disc * discount_adj ;
discount_10p = disc * discount_adj_10p ;
discount_0 = disc * discount_adj_0 ;

* proc print; 
* var cald  run  cald s_dcost_  s_cost_  disc  discount_adj  discount  discount_adj_10p discount_10p ; 
* where option=0  and cald ge 2019; 
* run;

* if using 10% discount rate:  ; 
* discount=discount_10p; 
* discount_adj=discount_adj_10p;

* if using 0% discount rate:  ;
* discount=discount_0; 
* discount_adj=discount_adj_0;

* ================================================================================= ;




* dalys and life years;

* ================================================================================= ;

ly = s_ly * sf_2020;
dly = s_dly * sf_2020;

s_ddaly = s_dead_ddaly + s_live_ddaly;

dead_ddaly_ntd = s_dead_ddaly_ntd * sf_2020 * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * sf_2020 * 4 * discount_adj ;

* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 

dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * sf_2020 * 4  * discount_adj ; * odabe ;

ddaly_mtct = s_ddaly_mtct * sf_2020 * 4  * discount_adj ;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * sf_2020 * 4  * discount_adj ; * napd;

ddaly_ac_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ac_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;



* ================================================================================= ;

/*
proc print; var cald  run option ddaly_ntd_mtct_odab_napd  ddaly  dead_ddaly_ntd  ddaly_mtct  dead_ddaly_odabe   
ddaly_non_aids_pre_death;
where cald = 2021;
run;
*/



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 
dzdv_cost = s_cost_zdv * discount * sf_2020 * 4 / 1000;
dten_cost = s_cost_ten * discount * sf_2020 * 4 / 1000;
d3tc_cost = s_cost_3tc * discount * sf_2020 * 4 / 1000; 
dnev_cost = s_cost_nev * discount * sf_2020 * 4 / 1000;
dlpr_cost = s_cost_lpr * discount * sf_2020 * 4 / 1000;
ddar_cost = s_cost_dar * discount * sf_2020 * 4 / 1000;
dtaz_cost = s_cost_taz * discount * sf_2020 * 4 / 1000;
defa_cost = s_cost_efa * discount * sf_2020 * 4 / 1000;
ddol_cost = s_cost_dol * discount * sf_2020 * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep=. then s_dcost_prep=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * sf_2020 * discount_adj * 4 / 1000;
dart1_cost = s_dart_1_cost * sf_2020 * discount_adj * 4 / 1000;
dart2_cost = s_dart_2_cost * sf_2020 * discount_adj * 4 / 1000;
dart3_cost = s_dart_3_cost * sf_2020 * discount_adj * 4 / 1000;
dart_cost = s_dart_cost * sf_2020 * discount_adj * 4 / 1000;
dvl_cost = s_dvl_cost * sf_2020 * discount_adj * 4 / 1000;
dcd4_cost = s_dcd4_cost * sf_2020 * discount_adj * 4 / 1000;
dadc_cost = s_dadc_cost * sf_2020 * discount_adj * 4 / 1000;
dtb_cost = s_dtb_cost * sf_2020 * discount_adj * 4 / 1000;
dtest_cost = s_dtest_cost * sf_2020 * discount_adj * 4 / 1000;
dwho3_cost = s_dwho3_cost * sf_2020 * discount_adj * 4 / 1000;
dcot_cost = s_dcot_cost * sf_2020 * discount_adj * 4 / 1000;
dres_cost = s_dres_cost * sf_2020 * discount_adj * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * sf_2020 * discount_adj * 4 / 1000;  
dcost_cascade_interventions = s_dcost_cascade_interventions * sf_2020 * discount_adj * 4 / 1000;  
dcost_prep = s_dcost_prep * sf_2020* discount_adj * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf_2020* discount_adj * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * sf_2020* discount_adj * 4 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf_2020 * discount_adj * 4 / 1000;
  dcost_non_aids_pre_death = ddaly_non_aids_pre_death * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * sf_2020 * discount_adj * 4 / 1000;
dcost_circ = s_dcost_circ * sf_2020* discount_adj * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * sf_2020* discount_adj * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * discount_adj * sf_2020 * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf_2020 * discount_adj * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * sf_2020 * discount_adj * 4 / 1000; * s_cost_child_hiv is discounted cost;

dclin_cost = dadc_cost+dwho3_cost+dcot_cost+dtb_cost;

* sens analysis;

* dtaz_cost = dtaz_cost * (100 / 180);
* dtaz_cost = dtaz_cost * (50 / 180);
* dzdv_cost = dzdv_cost * (25 / 45);


dart_cost_x = dart1_cost + dart2_cost + dart3_cost; 
dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

* dcost = dart_cost_y + dclin_cost + dcd4_cost + dvl_cost + dvis_cost + dtest_cost + d_t_adh_int_cost + dswitchline_cost
		+dcost_circ + dcost_condom_dn  + dcost_child_hiv  + dcost_non_aids_pre_death ;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dwho3_cost + dcot_cost + dtb_cost+dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test+dcost_cascade_interventions + dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death ;

s_cost_art_x = s_cost_zdv + s_cost_ten + s_cost_3tc + s_cost_nev + s_cost_lpr + s_cost_dar + s_cost_taz + s_cost_efa + s_cost_dol ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dwho3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 
if discount gt 0 then cost_clin_care = dcost_clin_care / discount;


* ================================================================================= ;


* derived var cald iables relating to population, not only those with hiv ;

if s_ai_naive_no_pmtct_c_nnm_ = . then s_ai_naive_no_pmtct_c_nnm_ = 0; 
if s_ai_naive_no_pmtct_c_pim_ = . then s_ai_naive_no_pmtct_c_pim_ = 0;
if s_ai_naive_no_pmtct_c_inm_ = . then s_ai_naive_no_pmtct_c_inm_ = 0;
if s_ai_naive_no_pmtct_c_rt184m_ = . then s_ai_naive_no_pmtct_c_rt184m_ = 0;
if s_ai_naive_no_pmtct_c_rt65m_ = . then s_ai_naive_no_pmtct_c_rt65m_ = 0;
if s_ai_naive_no_pmtct_c_rttams_ = . then s_ai_naive_no_pmtct_c_rttams_ = 0;

s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
s_mcirc_3039m = s_mcirc_3034m + s_mcirc_3539m;
s_mcirc_4049m = s_mcirc_4044m + s_mcirc_4549m;

s_vmmc1549m = s_vmmc1519m + s_vmmc2024m + s_vmmc2529m + s_vmmc3034m + s_vmmc3539m + s_vmmc4044m + s_vmmc4549m ;
s_vmmc3039m = s_vmmc3034m + s_vmmc3539m;
s_vmmc4049m = s_vmmc4044m + s_vmmc4549m;

s_hiv1524m = s_hiv1519m + s_hiv2024m ;
s_hiv1524w = s_hiv1519w + s_hiv2024w ;

* s_alive;						s_alive = s_alive_m + s_alive_w ;

* n_ageg1519m ;					n_ageg1519m = s_ageg1519m * sf_2020 ;
* n_ageg2024m ;					n_ageg2024m = s_ageg2024m * sf_2020 ;
* n_ageg2529m ;					n_ageg2529m = s_ageg2529m * sf_2020 ;
* n_ageg3034m ;					n_ageg3034m = s_ageg3034m * sf_2020 ;
* n_ageg3539m ;					n_ageg3539m = s_ageg3539m * sf_2020 ;
* n_ageg4044m ;					n_ageg4044m = s_ageg4044m * sf_2020 ;
* n_ageg4549m ;					n_ageg4549m = s_ageg4549m * sf_2020 ;
* n_ageg5054m ;					n_ageg5054m = s_ageg5054m * sf_2020 ;
* n_ageg5559m ;					n_ageg5559m = s_ageg5559m * sf_2020 ;
* n_ageg6064m ;					n_ageg6064m = s_ageg6064m * sf_2020 ;
* n_ageg6569m ;					n_ageg6569m = s_ageg6569m * sf_2020 ;
* n_ageg7074m ;					n_ageg7074m = s_ageg7074m * sf_2020 ;
* n_ageg7579m ;					n_ageg7579m = s_ageg7579m * sf_2020 ;
* n_ageg8084m ;					n_ageg8084m = s_ageg8084m * sf_2020 ;
* n_ageg85plw ;					* n_ageg85plw  = s_ageg85plw * sf_2020 ;
* n_ageg1519w ;					n_ageg1519w = s_ageg1519w * sf_2020 ;
* n_ageg2024w ;					n_ageg2024w = s_ageg2024w * sf_2020 ;
* n_ageg2529w ;					n_ageg2529w = s_ageg2529w * sf_2020 ;
* n_ageg3034w ;					n_ageg3034w = s_ageg3034w * sf_2020 ;
* n_ageg3539w ;					n_ageg3539w = s_ageg3539w * sf_2020 ;
* n_ageg4044w ;					n_ageg4044w = s_ageg4044w * sf_2020 ;
* n_ageg4549w ;					n_ageg4549w = s_ageg4549w * sf_2020 ;
* n_ageg5054w ;					n_ageg5054w = s_ageg5054w * sf_2020 ;
* n_ageg5559w ;					n_ageg5559w = s_ageg5559w * sf_2020 ;
* n_ageg6064w ;					n_ageg6064w = s_ageg6064w * sf_2020 ;
* n_ageg6569w ;					n_ageg6569w = s_ageg6569w * sf_2020 ;
* n_ageg7074w ;					n_ageg7074w = s_ageg7074w * sf_2020 ;
* n_ageg7579w ;					n_ageg7579w = s_ageg7579w * sf_2020 ;
* n_ageg8084w ;					n_ageg8084w = s_ageg8084w * sf_2020 ;
* n_ageg85plw ;					* n_ageg85plw  = s_ageg85plw * sf_2020 ;

* n_onart_m1519 ;				n_onart_m1519 = s_onart_m1519_  * sf_2020 ;
* n_onart_m2024 ;				n_onart_m2024 = s_onart_m2024_  * sf_2020 ;
* n_onart_m2529 ;				n_onart_m2529 = s_onart_m2529_  * sf_2020 ;
* n_onart_m3034 ;				n_onart_m3034 = s_onart_m3034_  * sf_2020 ;
* n_onart_m3539 ;				n_onart_m3539 = s_onart_m3539_  * sf_2020 ;
* n_onart_m4044 ;				n_onart_m4044 = s_onart_m4044_  * sf_2020 ;
* n_onart_m4549 ;				n_onart_m4549 = s_onart_m4549_  * sf_2020 ;
* n_onart_m5054 ;				n_onart_m5054 = s_onart_m5054_  * sf_2020 ;
* n_onart_m5559 ;				n_onart_m5559 = s_onart_m5559_  * sf_2020 ;
* n_onart_m6064 ;				n_onart_m6064 = s_onart_m6064_  * sf_2020 ;
* n_onart_m6569 ;				* n_onart_m6569 = s_onart_m6569_  * sf_2020 ;
* n_onart_m7074 ;				* n_onart_m7074 = s_onart_m7074_  * sf_2020 ;
* n_onart_m7579 ;				* n_onart_m7579 = s_onart_m7579_  * sf_2020 ;
* n_onart_m8084 ;				* n_onart_m8084 = s_onart_m8084_  * sf_2020 ;
* n_onart_m85pl ;				* n_onart_m85pl = s_onart_m85pl  * sf_2020 ;
* n_onart_w1519 ;				n_onart_w1519 = s_onart_w1519_  * sf_2020 ;
* n_onart_w2024 ;				n_onart_w2024 = s_onart_w2024_  * sf_2020 ;
* n_onart_w2529 ;				n_onart_w2529 = s_onart_w2529_  * sf_2020 ;
* n_onart_w3034 ;				n_onart_w3034 = s_onart_w3034_  * sf_2020 ;
* n_onart_w3539 ;				n_onart_w3539 = s_onart_w3539_  * sf_2020 ;
* n_onart_w4044 ;				n_onart_w4044 = s_onart_w4044_  * sf_2020 ;
* n_onart_w4549 ;				n_onart_w4549 = s_onart_w4549_  * sf_2020 ;
* n_onart_w5054 ;				n_onart_w5054 = s_onart_w5054_  * sf_2020 ;
* n_onart_w5559 ;				n_onart_w5559 = s_onart_w5559_  * sf_2020 ;
* n_onart_w6064 ;				n_onart_w6064 = s_onart_w6064_  * sf_2020 ;
* n_onart_w6569 ;				* n_onart_w6569 = s_onart_w6569_  * sf_2020 ;
* n_onart_w7074 ;				* n_onart_w7074 = s_onart_w7074_  * sf_2020 ;
* n_onart_w7579 ;				* n_onart_w7579 = s_onart_w7579_  * sf_2020 ;
* n_onart_w8084 ;				* n_onart_w8084 = s_onart_w8084_  * sf_2020 ;
* n_onart_w85pl ;				* n_onart_w85pl = s_onart_w85pl  * sf_2020 ;

* n_mcirc_1014m ;				n_mcirc_1014m = s_mcirc_1014m * sf_2020 ;
* n_mcirc_1519m ;				n_mcirc_1519m = s_mcirc_1519m * sf_2020 ;
* n_mcirc_2024m ;				n_mcirc_2024m = s_mcirc_2024m * sf_2020 ;
* n_mcirc_2529m ;				n_mcirc_2529m = s_mcirc_2529m * sf_2020 ;
* n_mcirc_3034m ;				n_mcirc_3034m = s_mcirc_3034m * sf_2020 ;
* n_mcirc_3539m ;				n_mcirc_3539m = s_mcirc_3539m * sf_2020 ;
* n_mcirc_4044m ;				n_mcirc_4044m = s_mcirc_4044m * sf_2020 ;
* n_mcirc_4549m ;				n_mcirc_4549m = s_mcirc_4549m * sf_2020 ;
* n_mcirc_5054m ;				* n_mcirc_5054m = s_mcirc_5054m * sf_2020 ;
* n_mcirc_5559m ;				* n_mcirc_5559m = s_mcirc_5559m * sf_2020 ;
* n_mcirc_6064m ;				* n_mcirc_6064m = s_mcirc_6064m * sf_2020 ;
* n_mcirc_6569m ;				* n_mcirc_6569m = s_mcirc_6569m * sf_2020 ;
* n_mcirc_7074m ;				* n_mcirc_7074m = s_mcirc_7074m * sf_2020 ;
* n_mcirc_7579m ;				* n_mcirc_7579m = s_mcirc_7579m * sf_2020 ;
* n_mcirc_8084m ;				* n_mcirc_8084m = s_mcirc_8084m * sf_2020 ;
* n_mcirc_85plm ;				* n_mcirc_85plm = s_mcirc_85plm * sf_2020 ;

* n_new_mcirc_1014m ;			n_new_mcirc_1014m = s_new_mcirc_1014m * sf_2020 ;
* n_new_mcirc_1519m ;			n_new_mcirc_1519m = s_new_mcirc_1519m * sf_2020 ;
* n_new_mcirc_2024m ;			n_new_mcirc_2024m = s_new_mcirc_2024m * sf_2020 ;
* n_new_mcirc_2529m ;			n_new_mcirc_2529m = s_new_mcirc_2529m * sf_2020 ;
* n_new_mcirc_3034m ;			n_new_mcirc_3034m = s_new_mcirc_3034m * sf_2020 ;
* n_new_mcirc_3539m ;			n_new_mcirc_3539m = s_new_mcirc_3539m * sf_2020 ;
* n_new_mcirc_4044m ;			n_new_mcirc_4044m = s_new_mcirc_4044m * sf_2020 ;
* n_new_mcirc_4549m ;			n_new_mcirc_4549m = s_new_mcirc_4549m * sf_2020 ;
* n_new_mcirc_5054m ;			* n_new_mcirc_5054m = s_new_mcirc_5054m * sf_2020 ;
* n_new_mcirc_5559m ;			* n_new_mcirc_5559m = s_new_mcirc_5559m * sf_2020 ;
* n_new_mcirc_6064m ;			* n_new_mcirc_6064m = s_new_mcirc_6064m * sf_2020 ;
* n_new_mcirc_6569m ;			* n_new_mcirc_6569m = s_new_mcirc_6569m * sf_2020 ;
* n_new_mcirc_7074m ;			* n_new_mcirc_7074m = s_new_mcirc_7074m * sf_2020 ;
* n_new_mcirc_7579m ;			* n_new_mcirc_7579m = s_new_mcirc_7579m * sf_2020 ;
* n_new_mcirc_8084m ;			* n_new_mcirc_8084m = s_new_mcirc_8084m * sf_2020 ;
* n_new_mcirc_85plm ;			* n_new_mcirc_85plm = s_new_mcirc_85plm * sf_2020 ;

* n_new_inf_1519m ;				n_new_inf_1519m = s_primary1519m  * sf_2020 ;
* n_new_inf_2024m ;				n_new_inf_2024m = s_primary2024m  * sf_2020 ;
* n_new_inf_2529m ;				n_new_inf_2529m = s_primary2529m  * sf_2020 ;
* n_new_inf_3034m ;				n_new_inf_3034m = s_primary3034m  * sf_2020 ;
* n_new_inf_3539m ;				n_new_inf_3539m = s_primary3539m  * sf_2020 ;
* n_new_inf_4044m ;				n_new_inf_4044m = s_primary4044m  * sf_2020 ;
* n_new_inf_4549m ;				n_new_inf_4549m = s_primary4549m  * sf_2020 ;
* n_new_inf_5054m ;				n_new_inf_5054m = s_primary5054m  * sf_2020 ;
* n_new_inf_5559m ;				n_new_inf_5559m = s_primary5559m  * sf_2020 ;
* n_new_inf_6064m ;				n_new_inf_6064m = s_primary6064m  * sf_2020 ;
* n_new_inf_1519w ;				n_new_inf_1519w = s_priwary1519w  * sf_2020 ;
* n_new_inf_2024w ;				n_new_inf_2024w = s_priwary2024w  * sf_2020 ;
* n_new_inf_2529w ;				n_new_inf_2529w = s_priwary2529w  * sf_2020 ;
* n_new_inf_3034w ;				n_new_inf_3034w = s_priwary3034w  * sf_2020 ;
* n_new_inf_3539w ;				n_new_inf_3539w = s_priwary3539w  * sf_2020 ;
* n_new_inf_4044w ;				n_new_inf_4044w = s_priwary4044w  * sf_2020 ;
* n_new_inf_4549w ;				n_new_inf_4549w = s_priwary4549w  * sf_2020 ;
* n_new_inf_5054w ;				n_new_inf_5054w = s_priwary5054w  * sf_2020 ;
* n_new_inf_5559w ;				n_new_inf_5559w = s_priwary5559w  * sf_2020 ;
* n_new_inf_6064w ;				n_new_inf_6064w = s_priwary6064w  * sf_2020 ;

* n_hiv1519m ; 					n_hiv1519m = s_hiv1519m  * sf_2020 ;
* n_hiv2024m ; 					n_hiv2024m = s_hiv2024m  * sf_2020 ;
* n_hiv2529m ; 					n_hiv2529m = s_hiv2529m  * sf_2020 ;
* n_hiv3034m ; 					n_hiv3034m = s_hiv3034m  * sf_2020 ;
* n_hiv3539m ; 					n_hiv3539m = s_hiv3539m  * sf_2020 ;
* n_hiv4044m ; 					n_hiv4044m = s_hiv4044m  * sf_2020 ;
* n_hiv4549m ; 					n_hiv4549m = s_hiv4549m  * sf_2020 ;
* n_hiv5054m ; 					n_hiv5054m = s_hiv5054m  * sf_2020 ;
* n_hiv5559m ; 					n_hiv5559m = s_hiv5559m  * sf_2020 ;
* n_hiv6064m ; 					n_hiv6064m = s_hiv6064m  * sf_2020 ;
* n_hiv6569m ; 					n_hiv6569m = s_hiv6569m  * sf_2020 ;
* n_hiv7074m ; 					n_hiv7074m = s_hiv7074m  * sf_2020 ;
* n_hiv7579m ; 					n_hiv7579m = s_hiv7579m  * sf_2020 ;
* n_hiv8084m ; 					n_hiv8084m = s_hiv8084m  * sf_2020 ;
* n_hiv85plm ; 					* n_hiv85plm = s_hiv85plm  * sf_2020 ;
* n_hiv1519w ; 					n_hiv1519w = s_hiv1519w  * sf_2020 ;
* n_hiv2024w ; 					n_hiv2024w = s_hiv2024w  * sf_2020 ;
* n_hiv2529w ; 					n_hiv2529w = s_hiv2529w  * sf_2020 ;
* n_hiv3034w ; 					n_hiv3034w = s_hiv3034w  * sf_2020 ;
* n_hiv3539w ; 					n_hiv3539w = s_hiv3539w  * sf_2020 ;
* n_hiv4044w ; 					n_hiv4044w = s_hiv4044w  * sf_2020 ;
* n_hiv4549w ; 					n_hiv4549w = s_hiv4549w  * sf_2020 ;
* n_hiv5054w ; 					n_hiv5054w = s_hiv5054w  * sf_2020 ;
* n_hiv5559w ; 					n_hiv5559w = s_hiv5559w  * sf_2020 ;
* n_hiv6064w ; 					n_hiv6064w = s_hiv6064w  * sf_2020 ;
* n_hiv6569w ; 					n_hiv6569w = s_hiv6569w  * sf_2020 ;
* n_hiv7074w ; 					n_hiv7074w = s_hiv7074w  * sf_2020 ;
* n_hiv7579w ; 					n_hiv7579w = s_hiv7579w  * sf_2020 ;
* n_hiv8084w ; 					n_hiv8084w = s_hiv8084w  * sf_2020 ;
* n_hiv85plw ; 					* n_hiv85plw = s_hiv85plw  * sf_2020 ;


* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive ;
* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;

* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf_2020;
* p_newp_sw;					p_newp_sw = s_sw_newp / s_w_newp ;
* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;
* n_tested_m;					n_tested_m = s_tested_m * sf_2020 * 4;
* n_tested;						n_tested = s_tested * sf_2020 * 4;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3039m;				p_mcirc_3039m = s_mcirc_3039m / (s_ageg3034m + s_ageg3539m) ;
* p_mcirc_4049m;				p_mcirc_4049m = s_mcirc_4049m / (s_ageg4044m + s_ageg4549m) ;
* p_mcirc_50plm;				p_mcirc_50plm = s_mcirc_50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;
* n_new_mcirc;					n_new_mcirc = s_new_mcirc * sf_2020 * 4;

* p_vmmc;						p_vmmc = s_vmmc / s_alive_m ;
* p_vmmc_1519m;					p_vmmc_1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc_2024m;					p_vmmc_2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc_2529m;					p_vmmc_2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc_3039m;					p_vmmc_3039m = s_vmmc3039m / (s_ageg3034m + s_ageg3539m) ;
* p_vmmc_4049m;					p_vmmc_4049m = s_vmmc4049m / (s_ageg4044m + s_ageg4549m) ;
* p_vmmc_50plm;					p_vmmc_50plm = s_vmmc50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_vmmc_1549m;					p_vmmc_1549m = s_vmmc1549m / s_ageg1549m ;

* prop_w_1549_sw;				prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  

* prep;

* p_elig_prep;   				p_elig_prep = s_elig_prep / (s_alive - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / (s_ageg1519w + s_ageg2024w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;
* prop_sw_onprep; 				prop_sw_onprep = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* n_prep;						n_prep = s_prep * sf_2020;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * sf_2020;
* p_hiv1_prep;					if s_prep gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep ;

* n_prep_ever;					n_prep_ever = s_prep_ever * sf_2020;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * sf_2020;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * sf_2020;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * sf_2020;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * sf_2020;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf_2020;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf_2020;

* prop_elig_on_prep;			if s_elig_prep then prop_elig_on_prep = s_prep / s_elig_prep ; 

* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* ts1m - below change 4 to 12;
* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* incidence1524w;				incidence1524w = ((s_primary1519w + s_primary2024w) * 4 * 100) / 
									(s_ageg1519w + s_ageg2024w - s_hiv1519w - s_hiv2024w + s_primary1519w + s_primary2024w);
* incidence1524m;				incidence1524m = ((s_primary1519m + s_primary2024m) * 4 * 100) / 
									(s_ageg1519m + s_ageg2024m - s_hiv1519m - s_hiv2024m + s_primary1519m + s_primary2024m);

* prevalence1519w;				prevalence1519w = s_hiv1519w  / s_ageg1519w ;
* prevalence1519m;				prevalence1519m = s_hiv1519m  / s_ageg1519m ;
* prevalence2024w;				prevalence2024w = s_hiv2024w  / s_ageg2024w ;
* prevalence2024m;				prevalence2024m = s_hiv2024m  / s_ageg2024m ;
* prevalence2529w;				prevalence2529w = s_hiv2529w  / s_ageg2529w ;
* prevalence2529m;				prevalence2529m = s_hiv2529m  / s_ageg2529m ;
* prevalence3034w;				prevalence3034w = s_hiv3034w  / s_ageg3034w ;
* prevalence3034m;				prevalence3034m = s_hiv3034m  / s_ageg3034m ;
* prevalence3539w;				prevalence3539w = s_hiv3539w  / s_ageg3539w ;
* prevalence3539m;				prevalence3539m = s_hiv3539m  / s_ageg3539m ;
* prevalence4044w;				prevalence4044w = s_hiv4044w  / s_ageg4044w ;
* prevalence4044m;				prevalence4044m = s_hiv4044m  / s_ageg4044m ;
* prevalence4549w;				prevalence4549w = s_hiv4549w  / s_ageg4549w ;
* prevalence4549m;				prevalence4549m = s_hiv4549m  / s_ageg4549m ;

* prevalence1524w;				prevalence1524w =  s_hiv1524w  / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m =  s_hiv1524m  / (s_ageg1519m + s_ageg2024m) ;

* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

* derived var cald iables relating to people with hiv ;
								if s_primary gt 0 then do;
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

* p_diag_m1524;					if s_hiv1524m > 0 then p_diag_m1524 = (s_diag_m1519_+s_diag_m2024_)/(s_hiv1524m);
* p_diag_w1524;					if s_hiv1524w > 0 then p_diag_w1524 = (s_diag_w1519_+s_diag_w2024_)/(s_hiv1524w);

* p_diag_sw;					if s_sw_1564 > 0 then p_diag_sw = s_diag_sw / s_sw_1564; 

* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_pim;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_pim = s_ai_naive_no_pmtct_c_pim_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt184m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt184m = s_ai_naive_no_pmtct_c_rt184m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt65m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt65m = s_ai_naive_no_pmtct_c_rt65m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rttams;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rttams = s_ai_naive_no_pmtct_c_rttams_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_inm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_inm = s_ai_naive_no_pmtct_c_inm_ / s_ai_naive_no_pmtct_;

* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart;						if s_hiv1564 gt 0 then p_onart = s_onart / s_hiv1564;

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

* p_o_zdv_tox;					if s_zdv gt 0 then p_o_zdv_tox = s_o_zdv_tox / s_zdv ;
* p_o_3tc_tox;					if s_3tc gt 0 then p_o_3tc_tox = s_o_3tc_tox / s_3tc ;
* p_o_ten_tox;					if s_ten gt 0 then p_o_ten_tox = s_o_ten_tox / s_ten ;
* p_o_taz_tox;					if s_taz gt 0 then p_o_taz_tox = s_o_taz_tox / s_taz ;
* p_o_lpr_tox;					if s_lpr gt 0 then p_o_lpr_tox = s_o_lpr_tox / s_lpr ;
* p_o_efa_tox;					if s_efa gt 0 then p_o_efa_tox = s_o_efa_tox / s_efa ;
* p_o_nev_tox;					if s_nev gt 0 then p_o_nev_tox = s_o_nev_tox / s_nev ;
* p_o_dol_tox;					if s_dol gt 0 then p_o_dol_tox = s_o_dol_tox / s_dol ;

* p_o_tle_tox;					if s_tle gt 0 then p_o_tle_tox = s_o_tle_tox / s_tle ;
* p_o_tld_tox;					if s_tld gt 0 then p_o_tld_tox = s_o_tld_tox / s_tld ;
* p_o_zld_tox;					if s_zld gt 0 then p_o_zld_tox = s_o_zld_tox / s_zld ;
* p_o_zla_tox;					if s_zla gt 0 then p_o_zla_tox = s_o_zla_tox / s_zla ;

* p_o_zdv_adh_hi;				if s_zdv gt 0 then p_o_zdv_adh_hi = s_o_zdv_adh_hi / s_zdv ;
* p_o_3tc_adh_hi;				if s_3tc gt 0 then p_o_3tc_adh_hi = s_o_3tc_adh_hi / s_3tc ;
* p_o_ten_adh_hi;				if s_ten gt 0 then p_o_ten_adh_hi = s_o_ten_adh_hi / s_ten ;
* p_o_taz_adh_hi;				if s_taz gt 0 then p_o_taz_adh_hi = s_o_taz_adh_hi / s_taz ;
* p_o_lpr_adh_hi;				if s_lpr gt 0 then p_o_lpr_adh_hi = s_o_lpr_adh_hi / s_lpr ;
* p_o_efa_adh_hi;				if s_efa gt 0 then p_o_efa_adh_hi = s_o_efa_adh_hi / s_efa ;
* p_o_nev_adh_hi;				if s_nev gt 0 then p_o_nev_adh_hi = s_o_nev_adh_hi / s_nev ;
* p_o_dol_adh_hi;				if s_dol gt 0 then p_o_dol_adh_hi = s_o_dol_adh_hi / s_dol ;

* p_o_tle_adh_hi;				if s_tle gt 0 then p_o_tle_adh_hi = s_o_tle_adh_hi / s_tle ;
* p_o_tld_adh_hi;				if s_tld gt 0 then p_o_tld_adh_hi = s_o_tld_adh_hi / s_tld ;
* p_o_zld_adh_hi;				if s_zld gt 0 then p_o_zld_adh_hi = s_o_zld_adh_hi / s_zld ;
* p_o_zla_adh_hi;				if s_zla gt 0 then p_o_zla_adh_hi = s_o_zla_adh_hi / s_zla ;

* p_adh_hi;						if s_onart gt 0 then p_adh_hi = s_adh_hi / s_onart;

* p_k65m;						if s_hiv1564 gt 0 then p_k65m = s_k65m_ / s_hiv1564 ;
* p_m184m;						if s_hiv1564 gt 0 then p_m184m = s_m184m_ / s_hiv1564 ;

* p_vlg1000_184m;				if s_vg1000 > 0 then p_vlg1000_184m = s_vlg1000_184m / s_vg1000 ;
* p_vlg1000_65m;				if s_vg1000 > 0 then p_vlg1000_65m = s_vlg1000_65m / s_vg1000 ;

* p_vlg1000_184m_hiv;			if s_hiv1564 > 0 then p_vlg1000_184m_hiv = s_vlg1000_184m / s_hiv1564  ;
* p_vlg1000_65m_hiv;			if s_hiv1564 > 0 then p_vlg1000_65m_hiv = s_vlg1000_65m / s_hiv1564  ;

* p_vlg1000_onart_65m;			if s_vlg1000_onart > 0 then p_vlg1000_onart_65m = s_vlg1000_onart_65m / s_vlg1000_onart ;
* p_vlg1000_onart_184m;			if s_vlg1000_onart > 0 then p_vlg1000_onart_184m = s_vlg1000_onart_184m / s_vlg1000_onart ;

* p_184m_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_184m_ontle_vlg1000 = s_vlg1000_184m_ontle / s_vlg1000_ontle ;
* p_tams_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_tams_ontle_vlg1000 = s_vlg1000_tams_ontle / s_vlg1000_ontle ;
* p_65m_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_65m_ontle_vlg1000 = s_vlg1000_65m_ontle / s_vlg1000_ontle ;
* p_nnm_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_nnm_ontle_vlg1000 = s_vlg1000_nnm_ontle / s_vlg1000_ontle ;

* p_184m_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_184m_ontld_vlg1000 = s_vlg1000_184m_ontld / s_vlg1000_ontld ;
* p_tams_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_tams_ontld_vlg1000 = s_vlg1000_tams_ontld / s_vlg1000_ontld ;
* p_65m_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_65m_ontld_vlg1000 = s_vlg1000_65m_ontld / s_vlg1000_ontld ;
* p_nnm_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_nnm_ontld_vlg1000 = s_vlg1000_nnm_ontld / s_vlg1000_ontld ;
* p_inm_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_inm_ontld_vlg1000 = s_vlg1000_inm_ontld / s_vlg1000_ontld ;

								if s_onart_start_zld_if_reg_op_116 gt 0 then do;
* p_nactive_ge2p75_xyz;			p_nactive_ge2p75_xyz = s_nac_ge2p75_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge2p00_xyz;			p_nactive_ge2p00_xyz = s_nac_ge2p00_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge1p50_xyz;			p_nactive_ge1p50_xyz = s_nac_ge1p50_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
								end;

* p_adh_hi_xyz_ot1;				if s_a_zld_if_reg_op_116 gt 0 then p_adh_hi_xyz_ot1 = s_adh_hi_a_zld_if_reg_op_116 / s_a_zld_if_reg_op_116;
* p_adh_hi_xyz_ot2;				if s_onart_start_zld_if_reg_op_116 gt 0 then p_adh_hi_xyz_ot2 = s_adh_hi_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_adh_hi_xyz_itt;				if s_x_n_zld_if_reg_op_116 gt 0 then  p_adh_hi_xyz_itt = s_adh_hi_a_zld_if_reg_op_116 / s_x_n_zld_if_reg_op_116;

* p_e_rt65m_xyz; 				if s_onart_start_zld_if_reg_op_116 gt 0 then p_e_rt65m_xyz = s_e_rt65m_st_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116 ;

* p_startedline2;				if s_artexp > 0 then do; p_startedline2 = s_startedline2 / s_artexp; end;
* Of people on ART, percent with CD4 < 500;	
								if  s_onart_iicu > 0 then  p_onart_cd4_l500 = 1 - (s_onart_cd4_g500 / s_onart_iicu) ;
* Of people on ART, percent with CD4 < 200;	
								if s_onart_iicu > 0 then  p_onart_cd4_l200 = s_onart_cl200 / s_onart_iicu ;
* p_drug_level_test;			if s_onart > 0 then p_drug_level_test = s_drug_level_test / s_onart ;

* p_linefail_ge1;				if s_artexp > 0 then p_linefail_ge1 = s_linefail_ge1 / s_artexp;
* p_startedline2;				if s_artexp > 0 then p_startedline2 = s_startedline2 / s_artexp; 
* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_artexp_vl1000;				if s_artexp > 0 then p_artexp_vl1000 = s_vl1000_art_gt6m_iicu / s_artexp ;

* p_vg1000, p_vl1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* p_vg1000_m, p_vl1000_m;		if s_hiv1564m  > 0 then p_vg1000_m = s_vg1000_m / s_hiv1564m ;  p_vl1000_m = 1- p_vg1000_m ;
* p_vg1000_w, p_vl1000_w;		if s_hiv1564w  > 0 then p_vg1000_w = s_vg1000_w / s_hiv1564w ;  p_vl1000_w = 1- p_vg1000_w ;
* p_vg1000_m_1524;				if s_hiv1524m  > 0 then p_vg1000_m_1524 = s_vg1000_m_1524 / s_hiv1524m ;
* p_vg1000_w_1524;				if s_hiv1524w  > 0 then p_vg1000_w_1524 = s_vg1000_w_1524 / s_hiv1524w ;
* p_vl1000_m_1524;				p_vl1000_m_1524 = 1 - p_vg1000_m_1524 ;
* p_vl1000_w_1524;				p_vl1000_w_1524 = 1 - p_vg1000_w_1524 ;

* p_onart_m;					if s_hiv1564m > 0 then p_onart_m = s_onart_m / s_hiv1564m  ;
* p_onart_w;					if s_hiv1564w  > 0 then p_onart_w = s_onart_w / s_hiv1564w  ;  
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_1524;			if s_onart_gt6m_iicu_1524_ > 0 then p_onart_vl1000_1524 = s_vl1000_art_gt6m_iicu_1524_ / s_onart_gt6m_iicu_1524_ ;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* p_vl1000_art_12m;				if s_art_12m > 0 then p_vl1000_art_12m = s_vl1000_art_12m / s_art_12m ;
* p_vl1000_art_12m_onart;		if s_art_12m_onart > 0 then p_vl1000_art_12m_onart = s_vl1000_art_12m / s_art_12m_onart ;

* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);
* prev_vg1000_newp_m;			prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_m_newp;
* prev_vg1000_newp_w;			prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_w_newp;
* r_efa_hiv;					if s_hiv1564 > 0 then r_efa_hiv = s_r_efa / s_hiv1564 ;
* p_dol_2vg1000_dolr1_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh0 = s_o_dol_2nd_vlg1000_dolr1_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr1_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh1 = s_o_dol_2nd_vlg1000_dolr1_adh1 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh0 = s_o_dol_2nd_vlg1000_dolr0_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh1 = s_o_dol_2nd_vlg1000_dolr0_adh1 / s_o_dol_2nd_vlg1000 ;

* p_iime_;						p_iime_ = s_iime_ / s_hiv1564 ;
* p_pime_;						p_pime_ = s_pime_ / s_hiv1564 ;
* p_nnme_;						p_nnme_ = s_nnme_ / s_hiv1564 ;

* ts1m - below change 4 to 12;
* aids_death_rate;				if s_hiv1564 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hiv1564 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;
* death_rate_artexp;			if s_artexp gt 0 then death_rate_artexp = (4 * 100 * s_dead_artexp / s_artexp);
* death_rate;					if s_hiv1564 > 0 then death_rate= (4 * 100 * s_dead1564_) / s_hiv1564;
* death_rate_hiv; 				if s_hiv1564 > 0 then death_rate_hiv = (4 * 100 * s_death_hiv) / s_hiv1564;
				 				if s_hiv1564m > 0 then death_rate_hiv_m = (4 * 100 * s_death_hiv_m) / s_hiv1564m;
								if s_hiv1564w > 0 then death_rate_hiv_w = (4 * 100 * s_death_hiv_w) / s_hiv1564w;

* n_onart;						n_onart = s_onart * sf_2020 ;
* n_diag;						n_diag = s_diag_this_period * sf_2020 * 4 ;
* n_start_line2;				n_start_line2 = s_start_line2_this_period * sf_2020 * 4 ;
* n_vl_test_done;				n_vl_test_done = (s_vl_cost / 0.022  )  * sf_2020 * 4 ;
* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage * sf_2020 * 4;
* n_death_covid;				n_death_covid = s_death_dcause3_allage * sf_2020 * 4;
* n_death;						n_death = s_dead_allage * sf_2020 * 4;
* n_covid;						n_covid = s_covid * sf_2020 * 4;

* n_death_discount;				n_death_discount = n_death*discount;
* death_rate_all_discount;		death_rate_all_discount = (4 * 100 * s_dead_allage) / (s_alive_w + s_alive_m) ;

* p_death_hivrel_age_le64;		if s_death_hivrel_allage gt 0 then p_death_hivrel_age_le64 = s_death_hivrel / s_death_hivrel_allage ;

inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* number of women with hiv giving birth per year;
n_give_birth_w_hiv = s_give_birth_with_hiv * sf_2020 * 4;
n_birth_with_inf_child = s_birth_with_inf_child * sf_2020 * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * sf_2020 * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf_2020 * 4;  * annual number;


n_mcirc1549_=s_mcirc_1549m * sf_2020 * 4;
n_mcirc1549_3m=s_mcirc_1549m * sf_2020;
n_vmmc1549_=s_vmmc1549m * sf_2020 * 4;
n_vmmc1549_3m=s_vmmc1549m * sf_2020;
n_new_inf1549m=s_primary1549m * sf_2020 * 4;
n_new_inf1549=s_primary1549 * sf_2020 * 4;

keep run option cald 

/*
dataset
s_alive p_w_giv_birth_this_per p_newp_ge1 p_newp_ge5 gender_r_newp  n_onart
p_newp_sw  n_tested_m   p_tested_past_year_1549m  p_tested_past_year_1549w
p_diag_m1524 p_diag_w1524 p_diag_sw  p_onart_cd4_l200  n_start_line2
p_mcirc p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3039m p_mcirc_4049m p_mcirc_50plm p_mcirc_1549m
p_vmmc p_vmmc_1519m p_vmmc_2024m p_vmmc_2529m p_vmmc_3039m p_vmmc_4049m p_vmmc_50plm p_vmmc_1549m
prop_w_1549_sw	prop_w_ever_sw prop_sw_hiv prop_w_1524_onprep prop_1564_onprep prop_sw_onprep prevalence1549m prevalence1549w prevalence1549 
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 			
prevalence1524w prevalence1524m  prevalence_sw
incidence1549 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary mtct_prop
p_diag p_diag_m p_diag_w p_ai_no_arv_c_nnm prop_sw_newp0
p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m   p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm
p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw
p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_onart_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w   p_vl1000_m_1524  p_vl1000_w_1524    
p_onart_m p_onart_w p_onart_vl1000_w p_onart_vl1000_m  p_onart_vl1000_1524	  p_onart_vl1000_sw
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w  p_startedline2
 p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart  ddaly  ddaly_all  dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost dcost_cascade_interventions     dcost_circ  dcost_condom_dn dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv 
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564  prop_sw_onprep  p_onart  p_vl1000_art_12m  p_vl1000_art_12m_onart
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  p_k65m  p_m184m  p_artexp_vl1000
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000  p_tams_ontle_vlg1000   p_tams_ontld_vlg1000  
death_rate  death_rate_hiv  death_rate_hiv_m  death_rate_hiv_w  p_iime_   p_pime_   p_nnme_  n_pregnant_ntd  n_preg_odabe
ddaly_non_aids_pre_death ddaly_ac_ntd_mtct ddaly_ac_ntd_mtct_odabe ddaly_ntd_mtct_napd ddaly_ntd_mtct_odab_napd ddaly  ddaly_all 
n_birth_with_inf_child  dead_ddaly_ntd   ddaly_mtct   dead_ddaly_odabe n_tested  p_vlg1000_onart_65m  p_vlg1000_onart_184m  p_elig_prep
prop_elig_on_prep n_hiv1_prep  n_prep  n_covid  n_death_covid n_death n_death_hivrel p_death_hivrel_age_le64 death_rate_all_discount n_death_discount
p_prep_ever  p_hiv1_prep incidence1524w   incidence1524m  test_prop_positive  p_newp_prep  n_vl_test_done  n_diag 

sf_2020 sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
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
prob_return_adc prob_lossdiag_adctb prob_lossdiag_who3e higher_newp_less_engagement
fold_tr switch_for_tox adh_pattern_prep rate_test_startprep rate_test_restartprep
rate_choose_stop_prep circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice 	eff_test_targeting
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
prep_strategy rate_sw_rred_rc

exp_setting_lower_p_vl1000  
external_exp_factor   rate_exp_set_lower_p_vl1000    max_freq_testing  
test_targeting    prob_loss_at_diag   pr_art_init   
rate_lost   prob_lost_art   rate_return   rate_restart   rate_int_choice  
clinic_not_aw_int_frac    rate_loss_persistence   incr_rate_int_low_adh  
fold_change_mut_risk   adh_effect_of_meas_alert   pr_switch_line   prob_vl_meas_done  
red_adh_tb_adc   red_adh_tox_pop   add_eff_adh_nnrti   altered_adh_sec_line_pop  
prob_return_adc   prob_lossdiag_adctb   prob_lossdiag_who3e  higher_newp_less_engagement  
fold_tr   switch_for_tox   adh_pattern_prep    base_rate_sw  

condom_incr_2020     			cascade_care_improvements  incr_test_2020              decr_hard_reach_2020   
decr_prob_loss_at_diag_2020  	decr_rate_lost_2020 		decr_rate_lost_art_2020     incr_rate_return_2020      
incr_rate_restart_2020         incr_rate_init_2020        decr_rate_int_choice_2020  
incr_prob_vl_meas_done_2020  
incr_pr_switch_line_2020     	prep_improvements        	incr_adh_pattern_prep_2020  
inc_r_test_startprep_2020  incr_r_test_restartprep_2020  decr_r_choose_stop_prep_2020  
inc_p_prep_restart_choi_2020 incr_prepuptake_sw_2020    incr_prepuptake_pop_2020    
circ_improvements  			circ_inc_rate_2020  		incr_test_targeting_2020    pop_wide_tld_2020 
incr_max_freq_testing_2020     initial_pr_switch_line     initial_prob_vl_meas_done   sw_test_6mthly_2020  
reg_option_switch_2020      art_mon_drug_levels_2020       ten_is_taf_2020    

eff_max_freq_testing  		eff_rate_restart   		eff_prob_loss_at_diag   		eff_rate_lost   		
eff_prob_lost_art   		eff_rate_return   
eff_pr_art_init   	eff_rate_int_choice   	eff_prob_vl_meas_done   		eff_pr_switch_line   	

e_decr_hard_reach_2020  eff_test_targeting  prep_strategy 
vmmc_disrup_covid  condom_disrup_covid  prep_disrup_covid  swprog_disrup_covid  
testing_disrup_covid  art_tld_disrup_covid  art_tld_eod_disrup_covid   art_init_disrup_covid   
vl_adh_switch_disrup_covid  cotrim_disrup_covid    no_art_disrup_covid 
inc_adeathr_disrup_covid art_low_adh_disrup_covid  cov_death_risk_mult 

n_mcirc1549_  n_mcirc1549_3m  n_vmmc1549_  n_vmmc1549_3m  n_new_inf1549m  n_new_inf1549 n_new_mcirc

s_sw_newp	  

*/

p_onart  n_death incidence1549  p_mcirc

/*

n_ageg1519m  n_ageg2024m  n_ageg2529m  n_ageg3034m  n_ageg3539m  n_ageg4044m  n_ageg4549m  n_ageg5054m  n_ageg5559m  n_ageg6064m  n_ageg6569m 
n_ageg7074m  n_ageg7579m  n_ageg8084m  n_ageg85plw  n_ageg1519w n_ageg2024w  n_ageg2529w  n_ageg3034w  n_ageg3539w  n_ageg4044w  n_ageg4549w 
n_ageg5054w  n_ageg5559w  n_ageg6064w n_ageg6569w  n_ageg7074w  n_ageg7579w  n_ageg8084w  n_ageg85plw  n_onart_m1519 
n_onart_m2024  n_onart_m2529 n_onart_m3034  n_onart_m3539  n_onart_m4044  n_onart_m4549  n_onart_m5054  n_onart_m5559  n_onart_m6064  n_onart_m7074 
n_onart_m7074  n_onart_m7579  n_onart_m8084  n_onart_m85pl  n_onart_w1519  n_onart_w2024  n_onart_w2529  n_onart_w3034  n_onart_w3539  n_onart_w4044 
n_onart_w4549 n_onart_w5054 n_onart_w5559 n_onart_w6064 n_onart_w6569 n_onart_w7074 n_onart_w7579 n_onart_w8084 n_onart_w85pl n_mcirc_1014m 		
n_mcirc_1519m  n_mcirc_2024m  n_mcirc_2529m  n_mcirc_3034m  n_mcirc_3539m  n_mcirc_4044m n_mcirc_4549m  n_mcirc_5054m  n_mcirc_5559m  n_mcirc_6064m 
n_mcirc_6569m n_mcirc_7074m n_mcirc_7579m n_mcirc_8084m n_mcirc_85plm n_new_mcirc_1014m n_new_mcirc_1519m n_new_mcirc_2024m n_new_mcirc_2529m 
n_new_mcirc_3034m  n_new_mcirc_3539m  n_new_mcirc_4044m  n_new_mcirc_4549m  n_new_mcirc_5054m n_new_mcirc_5559m n_new_mcirc_6064m  n_new_mcirc_6569m 
n_new_mcirc_7074m  n_new_mcirc_7579m  n_new_mcirc_8084m  n_new_mcirc_85plm  n_new_inf_1519m  n_new_inf_2024m  n_new_inf_2529m  n_new_inf_3034m 
n_new_inf_3539m  n_new_inf_4044m  n_new_inf_4549m  n_new_inf_5054m  n_new_inf_5559m  n_new_inf_6064m  n_new_inf_1519w  n_new_inf_2024w  n_new_inf_2529w 
n_new_inf_3034w  n_new_inf_3539w n_new_inf_4044w n_new_inf_4549w  n_new_inf_5054w  n_new_inf_5559w n_new_inf_6064w  n_hiv1519m  n_hiv2024m n_hiv2529m
n_hiv3034m  n_hiv3539m  n_hiv4044m  n_hiv4549m  n_hiv5054m  n_hiv5559m  n_hiv6064m  n_hiv6569m  n_hiv7074m  n_hiv7579m n_hiv8084m n_hiv85plm 
n_hiv1519w  n_hiv2024w  n_hiv2529w  n_hiv3034w  n_hiv3539w  n_hiv4044w n_hiv4549w n_hiv5054w  n_hiv5559w n_hiv6064w  n_hiv6569w  n_hiv7074w n_hiv7579w 
n_hiv8084w  n_hiv85plw

*/

;



proc sort data=y;by run option;run;

data unaids_14_8_20_1pm; set y;  

proc contents; run;


data y; set unaids_14_8_20_1pm; 


  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

proc means  noprint data=y; var &v; output out=y_00 mean= &v._00; by run ; where 2000 <= cald <= 2000.75; 
proc means  noprint data=y; var &v; output out=y_01 mean= &v._01; by run ; where 2001 <= cald <= 2001.75; 
proc means  noprint data=y; var &v; output out=y_02 mean= &v._02; by run ; where 2002 <= cald <= 2002.75; 
proc means  noprint data=y; var &v; output out=y_03 mean= &v._03; by run ; where 2003 <= cald <= 2003.75; 
proc means  noprint data=y; var &v; output out=y_04 mean= &v._04; by run ; where 2004 <= cald <= 2004.75; 
proc means noprint data=y; var &v; output out=y_05 mean= &v._05; by run option ; where 2005 <= cald <= 2005.75;  
proc means noprint data=y; var &v; output out=y_06 mean= &v._06; by run option ; where 2006 <= cald <= 2006.75;  
proc means noprint data=y; var &v; output out=y_07 mean= &v._07; by run option ; where 2007 <= cald <= 2007.75;  
proc means noprint data=y; var &v; output out=y_08 mean= &v._08; by run option ; where 2008 <= cald <= 2008.75;  
proc means noprint data=y; var &v; output out=y_09 mean= &v._09; by run option ; where 2009 <= cald <= 2009.75;  
proc means noprint data=y; var &v; output out=y_10 mean= &v._10; by run option ; where 2010 <= cald <= 2010.75;  
proc means noprint data=y; var &v; output out=y_11 mean= &v._11; by run option ; where 2011 <= cald <= 2011.75;  
proc means noprint data=y; var &v; output out=y_12 mean= &v._12; by run option ; where 2012 <= cald <= 2012.75;  
proc means noprint data=y; var &v; output out=y_13 mean= &v._13; by run option ; where 2013 <= cald <= 2013.75;  
proc means noprint data=y; var &v; output out=y_14 mean= &v._14; by run option ; where 2014 <= cald <= 2014.75;  
proc means noprint data=y; var &v; output out=y_15 mean= &v._15; by run option ; where 2015 <= cald <= 2015.75;  
proc means noprint data=y; var &v; output out=y_16 mean= &v._16; by run option ; where 2016 <= cald <= 2016.75;  
proc means noprint data=y; var &v; output out=y_17 mean= &v._17; by run option ; where 2017 <= cald <= 2017.75;  
proc means noprint data=y; var &v; output out=y_18 mean= &v._18; by run option ; where 2018 <= cald <= 2018.75;  
proc means noprint data=y; var &v; output out=y_19 mean= &v._19; by run option ; where 2019 <= cald <= 2019.75;  
proc means noprint data=y; var &v; output out=y_20 mean= &v._20; by run option ; where 2020 <= cald <= 2020.75;  
proc means noprint data=y; var &v; output out=y_21 mean= &v._21; by run option ; where 2021 <= cald <= 2021.75;  
proc means noprint data=y; var &v; output out=y_22 mean= &v._22; by run option ; where 2022 <= cald <= 2022.75;  
proc means noprint data=y; var &v; output out=y_23 mean= &v._23; by run option ; where 2023 <= cald <= 2023.75;  
proc means noprint data=y; var &v; output out=y_24 mean= &v._24; by run option ; where 2024 <= cald <= 2024.75;  
proc means noprint data=y; var &v; output out=y_25 mean= &v._25; by run option ; where 2025 <= cald <= 2025.75;  
 
proc sort data=y_05; by run; proc transpose data=y_05 out=t_05 prefix=&v._05_; var &v._05; by run;   
proc sort data=y_06; by run; proc transpose data=y_06 out=t_06 prefix=&v._06_; var &v._06; by run;   
proc sort data=y_07; by run; proc transpose data=y_07 out=t_07 prefix=&v._07_; var &v._07; by run;   
proc sort data=y_08; by run; proc transpose data=y_08 out=t_08 prefix=&v._08_; var &v._08; by run;   
proc sort data=y_09; by run; proc transpose data=y_09 out=t_09 prefix=&v._09_; var &v._09; by run;   
proc sort data=y_10; by run; proc transpose data=y_10 out=t_10 prefix=&v._10_; var &v._10; by run;   
proc sort data=y_11; by run; proc transpose data=y_11 out=t_11 prefix=&v._11_; var &v._11; by run;   
proc sort data=y_12; by run; proc transpose data=y_12 out=t_12 prefix=&v._12_; var &v._12; by run;   
proc sort data=y_13; by run; proc transpose data=y_13 out=t_13 prefix=&v._13_; var &v._13; by run;   
proc sort data=y_14; by run; proc transpose data=y_14 out=t_14 prefix=&v._14_; var &v._14; by run;   
proc sort data=y_15; by run; proc transpose data=y_15 out=t_15 prefix=&v._15_; var &v._15; by run;   
proc sort data=y_16; by run; proc transpose data=y_16 out=t_16 prefix=&v._16_; var &v._16; by run;   
proc sort data=y_17; by run; proc transpose data=y_17 out=t_17 prefix=&v._17_; var &v._17; by run;   
proc sort data=y_18; by run; proc transpose data=y_18 out=t_18 prefix=&v._18_; var &v._18; by run;   
proc sort data=y_19; by run; proc transpose data=y_19 out=t_19 prefix=&v._19_; var &v._19; by run;   
proc sort data=y_20; by run; proc transpose data=y_20 out=t_20 prefix=&v._20_; var &v._20; by run;   
proc sort data=y_21; by run; proc transpose data=y_21 out=t_21 prefix=&v._21_; var &v._21; by run;   
proc sort data=y_22; by run; proc transpose data=y_22 out=t_22 prefix=&v._22_; var &v._22; by run;   
proc sort data=y_23; by run; proc transpose data=y_23 out=t_23 prefix=&v._23_; var &v._23; by run;   
proc sort data=y_24; by run; proc transpose data=y_24 out=t_24 prefix=&v._24_; var &v._24; by run;   
proc sort data=y_25; by run; proc transpose data=y_25 out=t_25 prefix=&v._25_; var &v._25; by run;   

data &v ; merge  y_00 y_01  y_02 y_03  y_04  t_05 t_06 t_07 t_08 t_09 t_10 t_11 t_12 t_13 t_14 t_15 t_16 t_17 t_18 
t_19 t_20 t_21 t_22 t_23 t_24 t_25 ;
 
drop _NAME_ _TYPE_ _FREQ_;


%mend var;

/*
%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=p_newp_sw); %var(v=prop_sw_newp0);  %var(v=p_newp_prep);  %var(v=n_onart);
%var(v=n_tested_m);
%var(v=p_tested_past_year_1549m)  ; %var(v=p_tested_past_year_1549w)  ;
%var(v=p_mcirc); %var(v=p_mcirc_1519m); %var(v=p_mcirc_2024m);%var(v=p_mcirc_2529m); %var(v=p_mcirc_3039m); %var(v=p_mcirc_4049m);
%var(v=p_mcirc_50plm); %var(v=p_mcirc_1549m);  %var(v=n_start_line2);
%var(v=p_vmmc); %var(v=p_vmmc_1519m); %var(v=p_vmmc_2024m);%var(v=p_vmmc_2529m); %var(v=p_vmmc_3039m); %var(v=p_vmmc_4049m);
%var(v=p_vmmc_50plm); %var(v=p_vmmc_1549m);
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
%var(v=prev_vg1000_newp_m);  %var(v=prev_vg1000_newp_w);    %var(v= p_startedline2) ;
%var(v=p_tle);  %var(v=p_tld);  %var(v=p_zld);  %var(v=p_zla);  %var(v=p_otherreg);  %var(v=p_drug_level_test); %var(v=p_linefail_ge1);
%var(v=aids_death_rate);  %var(v=death_rate_onart); %var(v=ddaly);  %var(v=ddaly_all);  %var(v=dcost);  %var(v= dart_cost_y);
%var(v=dadc_cost);   %var(v=dcd4_cost);   %var(v=dvl_cost);   %var(v=dvis_cost);   %var(v=dwho3_cost);   %var(v=dcot_cost);   %var(v=dtb_cost);   
%var(v=dres_cost);  %var(v=dtest_cost);   %var(v=d_t_adh_int_cost);   %var(v=dswitchline_cost);  %var(v=dtaz_cost);   %var(v=dcost_drug_level_test);
%var(v=dclin_cost );  %var(v=n_diag);
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
%var(v=p_nactive_ge2p00_xyz);   %var(v=p_nactive_ge1p50_xyz);  %var(v=n_vl_test_done);
%var(v=p_184m_ontle_vlg1000);  %var(v=p_65m_ontle_vlg1000);  %var(v=p_nnm_ontle_vlg1000);   %var(v=p_184m_ontld_vlg1000);   %var(v=p_65m_ontld_vlg1000);  
%var(v=p_nnm_ontld_vlg1000);   %var(v=p_inm_ontld_vlg1000);   %var(v=p_inm_ontld_vlg1000);   
%var(v=p_tams_ontle_vlg1000);  %var(v=p_tams_ontld_vlg1000);  %var(v=p_k65m); %var(v=p_m184m);
%var(v=death_rate);   %var(v=death_rate_hiv); %var(v=death_rate_hiv_m); %var(v=death_rate_hiv_w);
%var(v=p_iime_);   %var(v=p_pime_);   %var(v=p_nnme_);     %var(v=n_pregnant_ntd);   %var(v=n_preg_odabe);
%var(v=ddaly_non_aids_pre_death);    %var(v=ddaly_ac_ntd_mtct);    %var(v=ddaly_ac_ntd_mtct_odabe);     %var(v=ddaly_ntd_mtct_napd);   
%var(v=ddaly_ntd_mtct_odab_napd); %var(v=n_birth_with_inf_child);
%var(v=dead_ddaly_ntd);   %var(v=ddaly_mtct);  %var(v=dead_ddaly_odabe);  %var(v=n_tested); %var(v=test_prop_positive);
%var(v=p_vlg1000_onart_65m);   %var(v=p_vlg1000_onart_184m);   %var(v=p_elig_prep); %var(v=prop_elig_on_prep);   %var(v= n_hiv1_prep);
%var(v= n_prep); %var(v=n_covid); %var(v=n_death_covid);  %var(v=n_death);  %var(v=n_death_hivrel); 
%var(v=p_death_hivrel_age_le64);  %var(v=p_prep_ever); %var(v=p_hiv1_prep);  %var(v=incidence1524w);   %var(v=incidence1524m)
%var(v=n_mcirc1549_);%var(v=n_mcirc1549_3m);%var(v=n_vmmc1549_);%var(v=n_vmmc1549_3m);%var(v=n_new_inf1549m); %var(v=n_new_inf1549);
%var(v=n_new_mcirc); %var(v=s_sw_newp); %var(v=death_rate_all_discount); %var(v=n_death_discount)

*/

%var(v=p_onart );  %var(v=n_death );   %var(v=incidence1549 );  %var(v=p_mcirc );

/*

%var(v=n_ageg1519m  );    %var(v=n_ageg2024m  );    %var(v=n_ageg2529m  );    %var(v=n_ageg3034m  );    %var(v=n_ageg3539m  );    %var(v=n_ageg4044m  );    %var(v=n_ageg4549m  );    %var(v=n_ageg5054m  );    %var(v=n_ageg5559m  );    %var(v=n_ageg6064m  );    %var(v=n_ageg6569m );
%var(v=n_ageg7074m  );    %var(v=n_ageg7579m  );    %var(v=n_ageg8084m  );    %var(v=n_ageg85plw  );    %var(v=n_ageg1519w );    %var(v=n_ageg2024w  );    %var(v=n_ageg2529w  );    %var(v=n_ageg3034w  );    %var(v=n_ageg3539w  );    %var(v=n_ageg4044w  );    %var(v=n_ageg4549w); 
%var(v=n_ageg5054w  );    %var(v=n_ageg5559w  );    %var(v=n_ageg6064w );    %var(v=n_ageg6569w  );    %var(v=n_ageg7074w  );    %var(v=n_ageg7579w  );    %var(v=n_ageg8084w  );    %var(v=n_ageg85plw  );    %var(v=n_onart_m1519 );
%var(v=n_onart_m2024  );    %var(v=n_onart_m2529 );    %var(v=n_onart_m3034  );    %var(v=n_onart_m3539  );    %var(v=n_onart_m4044  );    %var(v=n_onart_m4549  );    %var(v=n_onart_m5054  );    %var(v=n_onart_m5559  );    %var(v=n_onart_m6064  );    %var(v=n_onart_m7074 );
%var(v=n_onart_m7074  );    %var(v=n_onart_m7579  );    %var(v=n_onart_m8084  );    %var(v=n_onart_m85pl  );    %var(v=n_onart_w1519  );    %var(v=n_onart_w2024  );    %var(v=n_onart_w2529  );    %var(v=n_onart_w3034  );    %var(v=n_onart_w3539  );    %var(v=n_onart_w4044 );
%var(v=n_onart_w4549 );    %var(v=n_onart_w5054 );    %var(v=n_onart_w5559 );    %var(v=n_onart_w6064 );    %var(v=n_onart_w6569 );    %var(v=n_onart_w7074 );    %var(v=n_onart_w7579 );    %var(v=n_onart_w8084 );    %var(v=n_onart_w85pl );    %var(v=n_mcirc_1014m 	);	
%var(v=n_mcirc_1519m  );    %var(v=n_mcirc_2024m  );    %var(v=n_mcirc_2529m  );    %var(v=n_mcirc_3034m  );    %var(v=n_mcirc_3539m  );    %var(v=n_mcirc_4044m );    %var(v=n_mcirc_4549m  );    %var(v=n_mcirc_5054m  );    %var(v=n_mcirc_5559m  );    %var(v=n_mcirc_6064m );
%var(v=n_mcirc_6569m );    %var(v=n_mcirc_7074m );    %var(v=n_mcirc_7579m );    %var(v=n_mcirc_8084m );    %var(v=n_mcirc_85plm );    %var(v=n_new_mcirc_1014m );    %var(v=n_new_mcirc_1519m );    %var(v=n_new_mcirc_2024m );    %var(v=n_new_mcirc_2529m );
%var(v=n_new_mcirc_3034m  );    %var(v=n_new_mcirc_3539m  );    %var(v=n_new_mcirc_4044m  );    %var(v=n_new_mcirc_4549m  );    %var(v=n_new_mcirc_5054m );    %var(v=n_new_mcirc_5559m );    %var(v=n_new_mcirc_6064m  );    %var(v=n_new_mcirc_6569m );
%var(v=n_new_mcirc_7074m  );    %var(v=n_new_mcirc_7579m  );    %var(v=n_new_mcirc_8084m  );    %var(v=n_new_mcirc_85plm  );    %var(v=n_new_inf_1519m  );    %var(v=n_new_inf_2024m  );    %var(v=n_new_inf_2529m  );    %var(v=n_new_inf_3034m );
%var(v=n_new_inf_3539m  );    %var(v=n_new_inf_4044m  );    %var(v=n_new_inf_4549m  );    %var(v=n_new_inf_5054m  );    %var(v=n_new_inf_5559m  );    %var(v=n_new_inf_6064m  );    %var(v=n_new_inf_1519w  );    %var(v=n_new_inf_2024w  );    %var(v=n_new_inf_2529w );
%var(v=n_new_inf_3034w  );    %var(v=n_new_inf_3539w );    %var(v=n_new_inf_4044w );    %var(v=n_new_inf_4549w  );    %var(v=n_new_inf_5054w  );    %var(v=n_new_inf_5559w );    %var(v=n_new_inf_6064w  );    %var(v=n_hiv1519m  );    %var(v=n_hiv2024m );    %var(v=n_hiv2529m);
%var(v=n_hiv3034m  );    %var(v=n_hiv3539m  );    %var(v=n_hiv4044m  );    %var(v=n_hiv4549m  );    %var(v=n_hiv5054m  );    %var(v=n_hiv5559m  );    %var(v=n_hiv6064m  );    %var(v=n_hiv6569m  );    %var(v=n_hiv7074m  );    %var(v=n_hiv7579m );    %var(v=n_hiv8084m );    %var(v=n_hiv85plm );
%var(v=n_hiv1519w  );    %var(v=n_hiv2024w  );    %var(v=n_hiv2529w  );    %var(v=n_hiv3034w  );    %var(v=n_hiv3539w  );    %var(v=n_hiv4044w );    %var(v=n_hiv4549w );    %var(v=n_hiv5054w  );    %var(v=n_hiv5559w );    %var(v=n_hiv6064w  );    %var(v=n_hiv6569w  );    %var(v=n_hiv7074w );    %var(v=n_hiv7579w );
%var(v=n_hiv8084w  );    %var(v=n_hiv85plw );

*/

data   wide_outputs; merge 

/*
s_alive  p_w_giv_birth_this_per  p_newp_ge1 p_newp_ge5  gender_r_newp  n_onart
p_newp_sw prop_sw_newp0  p_newp_prep  n_tested_m  n_start_line2
p_tested_past_year_1549m  p_tested_past_year_1549w  n_vl_test_done  
p_mcirc  p_mcirc_1519m  p_mcirc_2024m  p_mcirc_2529m  p_mcirc_3039m  p_mcirc_4049m  p_mcirc_50plm  p_mcirc_1549m
p_vmmc  p_vmmc_1519m  p_vmmc_2024m  p_vmmc_2529m  p_vmmc_3039m  p_vmmc_4049m  p_vmmc_50plm  p_vmmc_1549m
prop_w_1549_sw  prop_w_ever_sw  prop_sw_hiv  prop_w_1524_onprep  prop_1564_onprep  prop_sw_onprep 
prevalence1549m  prevalence1549w  prevalence1549  prevalence1519w  prevalence1519m  prevalence2024w  prevalence2024m
prevalence2529w  prevalence2529m  prevalence3034w prevalence3034m  prevalence3539w  prevalence3539m  	  
prevalence4044w  prevalence4044m  prevalence4549w prevalence4549m  
prevalence_vg1000  incidence1549  prevalence1524w prevalence1524m   prevalence_sw
incidence1549w  incidence1549m  n_diag
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary 
mtct_prop  p_diag  p_diag_m  p_diag_w  p_diag_sw  p_diag_m1524  p_diag_w1524
p_ai_no_arv_c_nnm  p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m  p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm 
p_artexp_diag  p_onart_diag  p_onart_diag_w  p_onart_diag_m  p_onart_diag_sw  
p_efa  p_taz  p_ten  p_zdv  p_dol  p_3tc  p_lpr  p_nev  
p_onart_vl1000  p_artexp_vl1000  p_vl1000  p_vg1000  p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m  p_vl1000_art_12m_onart  p_onart_m p_onart_w  p_onart_vl1000_w  p_onart_vl1000_m   p_onart_vl1000_1524  p_onart_vl1000_sw
prev_vg1000_newp_m  prev_vg1000_newp_w   p_startedline2
p_tle  p_tld  p_zld  p_zla  p_otherreg  p_drug_level_test p_linefail_ge1
aids_death_rate  death_rate_onart ddaly  ddaly_all  dcost   dart_cost_y
dadc_cost  dcd4_cost  dvl_cost  dvis_cost  dwho3_cost  dcot_cost  dtb_cost   
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
death_rate  death_rate_hiv  death_rate_hiv_m  death_rate_hiv_w
p_iime_   p_pime_   p_nnme_     n_pregnant_ntd   n_preg_odabe
ddaly_non_aids_pre_death  ddaly_ac_ntd_mtct  ddaly_ac_ntd_mtct_odabe  ddaly_ntd_mtct_napd   
ddaly_ntd_mtct_odab_napd  n_birth_with_inf_child
dead_ddaly_ntd  ddaly_mtct  dead_ddaly_odabe  n_tested test_prop_positive
p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  n_hiv1_prep
n_prep  n_covid  n_death_covid  n_death  n_death_hivrel 
p_death_hivrel_age_le64  p_prep_ever p_hiv1_prep  incidence1524w   incidence1524m
n_mcirc1549_  n_mcirc1549_3m  n_vmmc1549_  n_vmmc1549_3m  n_new_inf1549m  n_new_inf1549  n_new_mcirc
s_sw_newp  death_rate_all_discount n_death_discount
*/

p_onart  n_death incidence1549  p_mcirc

/*

n_ageg1519m  n_ageg2024m  n_ageg2529m  n_ageg3034m  n_ageg3539m  n_ageg4044m  n_ageg4549m  n_ageg5054m  n_ageg5559m  n_ageg6064m  n_ageg6569m 
n_ageg7074m  n_ageg7579m  n_ageg8084m  n_ageg85plw  n_ageg1519w n_ageg2024w  n_ageg2529w  n_ageg3034w  n_ageg3539w  n_ageg4044w  n_ageg4549w 
n_ageg5054w  n_ageg5559w  n_ageg6064w n_ageg6569w  n_ageg7074w  n_ageg7579w  n_ageg8084w  n_ageg85plw  n_onart_m1519 
n_onart_m2024  n_onart_m2529 n_onart_m3034  n_onart_m3539  n_onart_m4044  n_onart_m4549  n_onart_m5054  n_onart_m5559  n_onart_m6064  n_onart_m7074 
n_onart_m7074  n_onart_m7579  n_onart_m8084  n_onart_m85pl  n_onart_w1519  n_onart_w2024  n_onart_w2529  n_onart_w3034  n_onart_w3539  n_onart_w4044 
n_onart_w4549 n_onart_w5054 n_onart_w5559 n_onart_w6064 n_onart_w6569 n_onart_w7074 n_onart_w7579 n_onart_w8084 n_onart_w85pl n_mcirc_1014m 		
n_mcirc_1519m  n_mcirc_2024m  n_mcirc_2529m  n_mcirc_3034m  n_mcirc_3539m  n_mcirc_4044m n_mcirc_4549m  n_mcirc_5054m  n_mcirc_5559m  n_mcirc_6064m 
n_mcirc_6569m n_mcirc_7074m n_mcirc_7579m n_mcirc_8084m n_mcirc_85plm n_new_mcirc_1014m n_new_mcirc_1519m n_new_mcirc_2024m n_new_mcirc_2529m 
n_new_mcirc_3034m  n_new_mcirc_3539m  n_new_mcirc_4044m  n_new_mcirc_4549m  n_new_mcirc_5054m n_new_mcirc_5559m n_new_mcirc_6064m  n_new_mcirc_6569m 
n_new_mcirc_7074m  n_new_mcirc_7579m  n_new_mcirc_8084m  n_new_mcirc_85plm  n_new_inf_1519m  n_new_inf_2024m  n_new_inf_2529m  n_new_inf_3034m 
n_new_inf_3539m  n_new_inf_4044m  n_new_inf_4549m  n_new_inf_5054m  n_new_inf_5559m  n_new_inf_6064m  n_new_inf_1519w  n_new_inf_2024w  n_new_inf_2529w 
n_new_inf_3034w  n_new_inf_3539w n_new_inf_4044w n_new_inf_4549w  n_new_inf_5054w  n_new_inf_5559w n_new_inf_6064w  n_hiv1519m  n_hiv2024m n_hiv2529m
n_hiv3034m  n_hiv3539m  n_hiv4044m  n_hiv4549m  n_hiv5054m  n_hiv5559m  n_hiv6064m  n_hiv6569m  n_hiv7074m  n_hiv7579m n_hiv8084m n_hiv85plm 
n_hiv1519w  n_hiv2024w  n_hiv2529w  n_hiv3034w  n_hiv3539w  n_hiv4044w n_hiv4549w n_hiv5054w  n_hiv5559w n_hiv6064w  n_hiv6569w  n_hiv7074w n_hiv7579w 
n_hiv8084w  n_hiv85plw

*/

;

proc contents; run;

proc sort; by run; run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2020; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

/*

%par(p=sf_2020); %par(p=dataset);
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
%par(p=prob_return_adc ); %par(p=prob_lossdiag_adctb ); %par(p=prob_lossdiag_who3e ); %par(p=higher_newp_less_engagement );
%par(p=fold_tr ); %par(p=switch_for_tox ); %par(p=adh_pattern_prep ); %par(p=rate_test_startprep ); %par(p=rate_test_restartprep );
%par(p=rate_choose_stop_prep ); %par(p=circ_inc_rate ); %par(p=p_hard_reach_w ); %par(p=hard_reach_higher_in_men );
%par(p=p_hard_reach_m ); %par(p=inc_cat ); %par(p= base_rate_sw );  %par(p= base_rate_stop_sexwork );    %par(p= rred_a_p );
%par(p= rr_int_tox );    %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg );
%par(p=eff_max_freq_testing ); 		%par(p=eff_rate_restart );  		%par(p=eff_prob_loss_at_diag );  		%par(p=eff_rate_lost );  		
%par(p=eff_prob_lost_art );  		%par(p=eff_rate_return );  			
%par(p=eff_pr_art_init );  	%par(p=eff_rate_int_choice );  	%par(p=eff_prob_vl_meas_done );  		%par(p=eff_pr_switch_line );  	
%par(p=eff_rate_test_startprep );  	%par(p=eff_rate_test_restartprep );  	%par(p=prep_strategy );
%par(p=eff_rate_choose_stop_prep );  		%par(p=eff_prob_prep_restart_choice );  %par(p=sw_init_newp); %par(p=sw_trans_matrix);
%par(p=eff_test_targeting );  %par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); 
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); %par(p=rate_sw_rred_rc);
run;

data wide_par; merge 
sf_2020   dataset   sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
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
prob_return_adc prob_lossdiag_adctb prob_lossdiag_who3e higher_newp_less_engagement
fold_tr switch_for_tox adh_pattern_prep rate_test_startprep rate_test_restartprep
rate_choose_stop_prep circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice 	eff_test_targeting
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
 prep_strategy rate_sw_rred_rc  
;

proc contents; run;

run;
proc sort; by run;run;

*/


* NOTE THESE BLOCKS OF CODE ARE SPECIFIC TO OPTIONS (currently for case of 2 options 0 and 1) ;

* values for parameters that change after the intervention introduction, for option=1;

%macro par_ai1(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p._ai1; by run ; where cald = 2021 and option = 1 ;run;
data &p._ai1 ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par_ai1_option1; 

/*

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
%par_ai1(p=inc_p_prep_restart_choi_2020 );%par_ai1(p=incr_prepuptake_sw_2020 );   %par_ai1(p=incr_prepuptake_pop_2020 );   
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
inc_p_prep_restart_choi_2020_ai1 incr_prepuptake_sw_2020_ai1   	incr_prepuptake_pop_2020_ai1   
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

*/

* values for parameters that change after the intervention for option=0;


%macro par_ai0(p=);
* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p._ai0; by run ; where cald = 2021 and option = 0 ;run;
data &p._ai0 ; set  y_ ; drop _TYPE_ _FREQ_; 

%mend par_ai0; 

/*

%par_ai0(p=eff_rate_test_startprep );  	%par_ai0(p=eff_rate_test_restartprep );  	
%par_ai0(p=eff_rate_choose_stop_prep );  		%par_ai0(p=eff_prob_prep_restart_choice );  	

data wide_par_after_int_option0; merge 
 eff_rate_test_startprep_ai0  	eff_rate_test_restartprep_ai0   	
eff_rate_choose_stop_prep_ai0   eff_prob_prep_restart_choice_ai0  	
; 
run;

proc contents; run;

proc sort; by run;run;

*/


* To get one row per run;

  data a.w_unaids_14_8_20_1pm ; 

* merge   wide_outputs  wide_par wide_par_after_int_option0  wide_par_after_int_option1  ; * this if you have parameter values changing after
  baseline that you need to track the values of;
  merge   wide_outputs  wide_par ;  
  by run;run;

proc means; run;

