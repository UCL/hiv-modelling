
libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\fsw\";


data a;  

  infile "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\FSW\c_output_fsw_27_05_21";

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

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		s_ageg85plm
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		s_ageg85plw
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m	s_hiv85plm	
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w  s_hiv85plw 
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
s_m1524_ep1524 s_m2534_ep2534 s_m3544_ep3544 s_m4554_ep4554 s_m5564_ep5564 
s_w1524_ep1524 s_w2534_ep2534 s_w3544_ep3544 s_w4554_ep4554 s_w5564_ep5564 

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
s_prep_willing  		    	   s_stop_prep_choice      s_started_prep_hiv_test_sens  
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
s_prepuptake_pop  	  s_prob_prep_restart_choice
s_prep_all_past_year s_tot_yrs_prep_gt_5  s_tot_yrs_prep_gt_10   s_tot_yrs_prep_gt_20
s_pop_wide_tld_prep   
s_prep_elig_past_year s_prep_elig_past_3year  s_prep_elig_past_5year s_newp_prep s_prop_elig_years_onprep_ayear_i	s_continuous_prep_ge1yr									
s_newp_this_per_hivneg_m   s_newp_this_per_hivneg_w   s_newp_this_per_hivneg_age1524w   s_newp_this_per_hivneg_sw  
s_newp_this_per_hivneg_m_prep   s_newp_this_per_hivneg_w_prep  s_newp_tp_hivneg_age1524w_prep   s_newp_this_per_hivneg_sw_prep 

										

/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_tested1549_		s_tested1549m       s_tested1549w
s_tested_4p_m1549_ 	s_tested_4p_m1519_ 	s_tested_4p_m2024_ s_tested_4p_m2529_  s_tested_4p_m3039_  s_tested_4p_m4049_  s_tested_4p_m5064_
s_tested_4p_w1549_ 	s_tested_4p_w1519_ 	s_tested_4p_w2024_ s_tested_4p_w2529_  s_tested_4p_w3039_  s_tested_4p_w4049_  s_tested_4p_w5064_ 
s_tested_4p_sw		s_tested_sw

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_non_tb_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_non_tb_who3_tested  
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
s_year_1_infection  s_year_2_infection  s_year_3_infection  s_year_4_infection  s_year_5_infection  
s_year_1_infection_diag  s_year_2_infection_diag  s_year_3_infection_diag  s_year_4_infection_diag  s_year_5_infection_diag  



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
s_onart_m6569_	s_onart_m7074_	s_onart_m7579_	s_onart_m8084_	s_onart_m85pl_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	
s_onart_w6569_	s_onart_w7074_	s_onart_w7579_	s_onart_w8084_	s_onart_w85pl_	
s_onart_sw
s_art_dur_l6m   s_art_dur_g6m   s_art_tdur_l6m  s_art_tdur_g6m
s_eponart_m	 s_eponart_w  s_hiv1564_onart  s_dead1564_onart  s_non_tb_who3_art_init  s_who4_art_init  s_art_start_pregnant 

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

/* note s_ variables below are for up to age 80 */

s_diag80  s_diagnosed_dead 
s_art_3m_bcd4_lt100  s_art_3m_bcd4_lt100_adead s_art_6m_bcd4_lt100 	s_art_6m_bcd4_lt100_adead  s_art_9m_bcd4_lt100 
s_art_9m_bcd4_lt100_adead s_art_12m_bcd4_lt100 s_art_12m_bcd4_lt100_adead s_art_15m_bcd4_lt100 s_art_15m_bcd4_lt100_adead s_art_18m_bcd4_lt100 
s_art_18m_bcd4_lt100_adead s_art_21m_bcd4_lt100 s_art_21m_bcd4_lt100_adead s_art_24m_bcd4_lt100  s_art_24m_bcd4_lt100_adead s_art_27m_bcd4_lt100  
s_art_27m_bcd4_lt100_adead s_art_30m_bcd4_lt100  s_art_30m_bcd4_lt100_adead s_art_33m_bcd4_lt100  s_art_33m_bcd4_lt100_adead s_art_36m_bcd4_lt100  
s_art_36m_bcd4_lt100_adead s_art_39m_bcd4_lt100  s_art_39m_bcd4_lt100_adead s_art_42m_bcd4_lt100 s_art_42m_bcd4_lt100_adead s_art_45m_bcd4_lt100  
s_art_45m_bcd4_lt100_adead s_art_48m_bcd4_lt100  s_art_48m_bcd4_lt100_adead s_art_51m_bcd4_lt100 s_art_51m_bcd4_lt100_adead s_art_54m_bcd4_lt100 
s_art_54m_bcd4_lt100_adead s_art_57m_bcd4_lt100 s_art_57m_bcd4_lt100_adead s_art_60m_bcd4_lt100 s_art_60m_bcd4_lt100_adead 

s_art_3m_bcd4_100200  s_art_3m_bcd4_100200_adead s_art_6m_bcd4_100200 	s_art_6m_bcd4_100200_adead  s_art_9m_bcd4_100200 
s_art_9m_bcd4_100200_adead s_art_12m_bcd4_100200 s_art_12m_bcd4_100200_adead s_art_15m_bcd4_100200 s_art_15m_bcd4_100200_adead s_art_18m_bcd4_100200 
s_art_18m_bcd4_100200_adead s_art_21m_bcd4_100200 s_art_21m_bcd4_100200_adead s_art_24m_bcd4_100200  s_art_24m_bcd4_100200_adead s_art_27m_bcd4_100200  
s_art_27m_bcd4_100200_adead s_art_30m_bcd4_100200  s_art_30m_bcd4_100200_adead s_art_33m_bcd4_100200  s_art_33m_bcd4_100200_adead s_art_36m_bcd4_100200  
s_art_36m_bcd4_100200_adead s_art_39m_bcd4_100200  s_art_39m_bcd4_100200_adead s_art_42m_bcd4_100200 s_art_42m_bcd4_100200_adead s_art_45m_bcd4_100200  
s_art_45m_bcd4_100200_adead s_art_48m_bcd4_100200  s_art_48m_bcd4_100200_adead s_art_51m_bcd4_100200 s_art_51m_bcd4_100200_adead s_art_54m_bcd4_100200 
s_art_54m_bcd4_100200_adead s_art_57m_bcd4_100200 s_art_57m_bcd4_100200_adead s_art_60m_bcd4_100200 s_art_60m_bcd4_100200_adead

s_art_3m_bcd4_200350  s_art_3m_bcd4_200350_adead s_art_6m_bcd4_200350 	s_art_6m_bcd4_200350_adead  s_art_9m_bcd4_200350 
s_art_9m_bcd4_200350_adead s_art_12m_bcd4_200350 s_art_12m_bcd4_200350_adead s_art_15m_bcd4_200350 s_art_15m_bcd4_200350_adead s_art_18m_bcd4_200350 
s_art_18m_bcd4_200350_adead s_art_21m_bcd4_200350 s_art_21m_bcd4_200350_adead s_art_24m_bcd4_200350  s_art_24m_bcd4_200350_adead s_art_27m_bcd4_200350  
s_art_27m_bcd4_200350_adead s_art_30m_bcd4_200350  s_art_30m_bcd4_200350_adead s_art_33m_bcd4_200350  s_art_33m_bcd4_200350_adead s_art_36m_bcd4_200350  
s_art_36m_bcd4_200350_adead s_art_39m_bcd4_200350  s_art_39m_bcd4_200350_adead s_art_42m_bcd4_200350 s_art_42m_bcd4_200350_adead s_art_45m_bcd4_200350  
s_art_45m_bcd4_200350_adead s_art_48m_bcd4_200350  s_art_48m_bcd4_200350_adead s_art_51m_bcd4_200350 s_art_51m_bcd4_200350_adead s_art_54m_bcd4_200350 
s_art_54m_bcd4_200350_adead s_art_57m_bcd4_200350 s_art_57m_bcd4_200350_adead s_art_60m_bcd4_200350 s_art_60m_bcd4_200350_adead

s_art_3m_bcd4_350500  s_art_3m_bcd4_350500_adead s_art_6m_bcd4_350500 	s_art_6m_bcd4_350500_adead  s_art_9m_bcd4_350500 
s_art_9m_bcd4_350500_adead s_art_12m_bcd4_350500 s_art_12m_bcd4_350500_adead s_art_15m_bcd4_350500 s_art_15m_bcd4_350500_adead s_art_18m_bcd4_350500 
s_art_18m_bcd4_350500_adead s_art_21m_bcd4_350500 s_art_21m_bcd4_350500_adead s_art_24m_bcd4_350500  s_art_24m_bcd4_350500_adead s_art_27m_bcd4_350500  
s_art_27m_bcd4_350500_adead s_art_30m_bcd4_350500  s_art_30m_bcd4_350500_adead s_art_33m_bcd4_350500  s_art_33m_bcd4_350500_adead s_art_36m_bcd4_350500  
s_art_36m_bcd4_350500_adead s_art_39m_bcd4_350500  s_art_39m_bcd4_350500_adead s_art_42m_bcd4_350500 s_art_42m_bcd4_350500_adead s_art_45m_bcd4_350500  
s_art_45m_bcd4_350500_adead s_art_48m_bcd4_350500  s_art_48m_bcd4_350500_adead s_art_51m_bcd4_350500 s_art_51m_bcd4_350500_adead s_art_54m_bcd4_350500 
s_art_54m_bcd4_350500_adead s_art_57m_bcd4_350500 s_art_57m_bcd4_350500_adead s_art_60m_bcd4_350500 s_art_60m_bcd4_350500_adead

s_art_3m_bcd4_ge500  s_art_3m_bcd4_ge500_adead s_art_6m_bcd4_ge500 	s_art_6m_bcd4_ge500_adead  s_art_9m_bcd4_ge500 
s_art_9m_bcd4_ge500_adead s_art_12m_bcd4_ge500 s_art_12m_bcd4_ge500_adead s_art_15m_bcd4_ge500 s_art_15m_bcd4_ge500_adead s_art_18m_bcd4_ge500 
s_art_18m_bcd4_ge500_adead s_art_21m_bcd4_ge500 s_art_21m_bcd4_ge500_adead s_art_24m_bcd4_ge500  s_art_24m_bcd4_ge500_adead s_art_27m_bcd4_ge500  
s_art_27m_bcd4_ge500_adead s_art_30m_bcd4_ge500  s_art_30m_bcd4_ge500_adead s_art_33m_bcd4_ge500  s_art_33m_bcd4_ge500_adead s_art_36m_bcd4_ge500  
s_art_36m_bcd4_ge500_adead s_art_39m_bcd4_ge500  s_art_39m_bcd4_ge500_adead s_art_42m_bcd4_ge500 s_art_42m_bcd4_ge500_adead s_art_45m_bcd4_ge500  
s_art_45m_bcd4_ge500_adead s_art_48m_bcd4_ge500  s_art_48m_bcd4_ge500_adead s_art_51m_bcd4_ge500 s_art_51m_bcd4_ge500_adead s_art_54m_bcd4_ge500 
s_art_54m_bcd4_ge500_adead s_art_57m_bcd4_ge500 s_art_57m_bcd4_ge500_adead s_art_60m_bcd4_ge500 s_art_60m_bcd4_ge500_adead

/*costs and dalys*/
s_cost       s_onart_cost		s_art_cost    s_adc_cost    s_cd4_cost    s_vl_cost    s_vis_cost     s_full_vis_cost    s_non_tb_who3_cost    s_cot_cost 
s_tb_cost    s_cost_test   s_res_cost    s_cost_circ   s_cost_condom_dn  s_cost_sw_program  s_t_adh_int_cost      s_cost_test_m    s_cost_test_f
s_cost_prep  s_cost_prep_visit			   s_cost_prep_ac_adh  			 
s_cost_test_m_sympt  		   s_cost_test_f_sympt  		   s_cost_test_m_circ  			   s_cost_test_f_anc  s_cost_test_f_sw
s_cost_test_f_non_anc  	   	   s_pi_cost  	   s_cost_switch_line  			  s_cost_child_hiv s_cost_child_hiv_mo_art  		   s_cost_art_init
  	   s_art_1_cost   s_art_2_cost     s_art_3_cost  	  s_cost_vl_not_done 
s_cost_zdv     s_cost_ten 	   s_cost_3tc 	   s_cost_nev  	   s_cost_lpr  	  s_cost_dar 	   s_cost_taz  	  	  s_cost_efa  	   s_cost_dol   

s_ly  s_dly  s_qaly  s_dqaly  s_cost_  s_live_daly  s_live_ddaly   

s_dcost_  	   s_donart_cost 		s_dart_cost     s_dadc_cost     s_dcd4_cost     s_dvl_cost	  s_dvis_cost    	s_dfull_vis_cost  s_dnon_tb_who3_cost     s_dcot_cost 
s_dtb_cost     s_dtest_cost    s_dres_cost     s_dcost_circ  s_dcost_condom_dn  s_dcost_sw_program   s_d_t_adh_int_cost   s_dtest_cost_f  s_dtest_cost_m
s_dcost_prep   s_dcost_prep_visit  			   s_dcost_prep_ac_adh 			  
s_dcost_test_m_sympt  	       s_dcost_test_f_sympt  		   s_dcost_test_m_circ  	  	 	s_dcost_test_f_anc s_dcost_test_f_sw
s_dcost_test_f_non_anc 	       s_dpi_cost     s_dcost_switch_line  		  s_dcost_child_hiv s_dcost_child_hiv_mo_art  		   s_dcost_art_init
	   s_dart_1_cost  s_dart_2_cost     s_dart_3_cost	   s_dcost_vl_not_done 	
s_dcost_non_aids_pre_death   s_ddaly_non_aids_pre_death  s_dead_ddaly_oth_dol_adv_birth_e   s_dcost_drug_level_test
s_dead_ddaly_ntd  s_ddaly_mtct    s_dead_ddaly  s_live_daly_80  s_live_ddaly_80  s_dead_daly_80  s_dead_ddaly_80

s_cost_80  s_art_cost_80  s_adc_cost_80  s_cd4_cost_80  s_vl_cost_80  s_vis_cost_80  s_full_vis_cost_80  s_non_tb_who3_cost_80  s_cot_cost_80 
s_tb_cost_80  s_cost_test_80  s_res_cost_80  s_cost_circ_80  s_cost_condom_dn_80  s_cost_sw_program_80  s_t_adh_int_cost_80  s_cost_test_m_80  
s_cost_test_f_80  s_cost_prep_80  s_cost_prep_visit_80  s_cost_prep_ac_adh_80    s_cost_test_m_sympt_80    
s_cost_test_f_sympt_80    s_cost_test_m_circ_80   s_cost_test_f_anc_80  s_cost_test_f_sw_80
s_cost_test_f_non_anc_80   s_pi_cost_80  	  s_cost_switch_line_80    s_cost_child_hiv_80  s_cost_child_hiv_mo_art_80    s_cost_art_init_80
s_art_1_cost_80  s_art_2_cost_80  s_art_3_cost_80  	  s_cost_vl_not_done_80 s_cost_zdv_80  s_cost_ten_80 	  s_cost_3tc_80 	  s_cost_nev_80  	  
s_cost_lpr_80  	  s_cost_dar_80 	  s_cost_taz_80  	  	  s_cost_efa_80  	  s_cost_dol_80  
s_cost__80   s_dcost__80  	  s_dart_cost_80  s_dadc_cost_80  s_dcd4_cost_80  s_dvl_cost_80	  s_dvis_cost_80  	s_dfull_vis_cost_80  s_dnon_tb_who3_cost_80 
s_dcot_cost_80 s_dtb_cost_80  s_dtest_cost_80  s_dres_cost_80  s_dcost_circ_80  s_dcost_condom_dn_80  s_dcost_sw_program_80  s_d_t_adh_int_cost_80  
s_dtest_cost_f_80  s_dtest_cost_m_80  s_dcost_prep_80  s_dcost_prep_visit_80  	 s_dcost_prep_ac_adh_80 	
s_dcost_test_m_sympt_80  	  s_dcost_test_f_sympt_80  		  s_dcost_test_m_circ_80  	s_dcost_test_f_anc_80 s_dcost_test_f_sw_80
s_dcost_test_f_non_anc_80 	  s_dpi_cost_80  s_dcost_switch_line_80   s_dcost_child_hiv_80  s_dcost_child_hiv_mo_art_80  s_dcost_art_init_80 
s_dart_1_cost_80  s_dart_2_cost_80  s_dart_3_cost_80	  s_dcost_vl_not_done_80 s_dcost_non_aids_pre_death_80  s_dcost_drug_level_test_80


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

/* deaths by cause - age 15+ */
s_dead_hivpos_cause1  s_dead_hivpos_tb  s_dead_hivpos_crypm s_dead_hivpos_sbi  s_dead_hivpos_oth_adc  s_dead_hivpos_cause2 
s_dead_hivpos_cause3 	s_dead_hivpos_cause4  s_dead_hivpos_cvd s_dead_cvd  s_dead_hivneg_cause4  s_dead_hivneg_cause3 
s_dead_hivneg_cause2   s_dead_hivneg_cvd  s_dead_cvd s_dead_hivneg_cause5  s_dead_hivneg_tb  s_dead_tb 

/*sex workers*/
s_base_rate_sw  s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp   s_sw1524_newp s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  
s_diag_sw s_onart_sw s_vs_sw 

s_age_deb_sw1519_  s_age_deb_sw2024_  s_age_deb_sw2529_  s_age_deb_sw3039_  s_age_deb_swov40_ 

s_age_stop_sw1519_  s_age_stop_sw2024_  s_age_stop_sw2529_  s_age_stop_sw3039_  s_age_stop_swov40_ 

s_actdur_sw_0to3  s_actdur_sw_3to5  s_actdur_sw_6to9  s_actdur_sw_10to19  
s_totdur_sw_0to3  s_totdur_sw_3to5  s_totdur_sw_6to9  s_totdur_sw_10to19 
s_totdur_eversw_0to3  s_totdur_eversw_3to5  s_totdur_eversw_6to9  s_totdur_eversw_10to19 s_act_dur_sw  s_tot_dur_sw

s_sw_program_visit

s_diag_sw_noprog  s_diag_sw_inprog  s_onart_sw_noprog  s_onart_sw_inprog  
s_vl1000_art_gt6m_iicu_sw_noprog  s_vl1000_art_gt6m_iicu_sw_inprog 

s_sw1519_tp1  s_sw2024_tp1  s_sw2529_tp1  s_sw3039_tp1  s_swov40_tp1

/*ADC etc*/
s_adc  s_non_tb_who3_ev  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 

/* outputs for advanced hiv disease */ 
s_crag_measured_this_per  s_tblam_measured_this_per  s_cm_this_per    s_crypm_proph    s_tb_proph    s_pcp_p_80  s_sbi_proph  s_crypm sbi 
s_crypm_diag_e    s_tb_diag_e   s_sbi_diag_e  s_cd4_g1    s_cd4_g2   s_cd4_g3    s_cd4_g4   s_cd4_g5    s_cd4_g6   s_vl_g1    s_vl_g2    s_vl_g3     
s_vl_g4     s_vl_g5   s_age_g1    s_age_g2  s_age_g3   s_age_g4     s_age_g5   s_cd4_g1_tb   s_cd4_g2_tb  s_cd4_g3_tb   s_cd4_g4_tb   s_cd4_g5_tb  
s_cd4_g6_tb  s_vl_g1_tb   s_vl_g2_tb    s_vl_g3_tb   s_vl_g4_tb  s_vl_g5_tb  s_age_g1_tb   s_age_g2_tb   s_age_g3_tb  s_age_g4_tb  s_age_g5_tb    
s_onart_tb   s_pcpp_tb   s_tblam_measured_this_per_tb  s_tb_proph_tb  s_onart_80 s_pcpp_80  s_tb_80  
s_cd4_g1_who3   s_cd4_g2_who3   s_cd4_g3_who3   s_cd4_g4_who3  s_cd4_g5_who3  s_cd4_g6_who3    s_vl_g1_who3  s_vl_g2_who3   
s_vl_g3_who3   s_vl_g4_who3   s_vl_g5_who3    s_age_g1_who3    s_age_g2_who3   s_age_g3_who3    s_age_g4_who3  s_age_g5_who3    s_onart_who3     
s_pcpp_who3       s_who3_event_80  s_cd4_g1_adc    s_cd4_g2_adc     s_cd4_g3_adc   s_cd4_g4_adc   s_cd4_g5_adc  s_cd4_g6_adc    s_vl_g1_adc   
s_vl_g2_adc   s_vl_g3_adc   s_vl_g4_adc  s_vl_g5_adc  s_age_g1_adc   s_age_g2_adc    s_age_g3_adc   s_age_g4_adc s_age_g5_adc  	s_onart_adc  s_pcpp_adc
s_cd4_g1_crypm   s_cd4_g2_crypm   s_cd4_g3_crypm   s_cd4_g4_crypm   s_cd4_g5_crypm   s_cd4_g6_crypm  s_vl_g1_crypm   s_vl_g2_crypm  s_vl_g3_crypm    
s_vl_g4_crypm   s_vl_g5_crypm  s_age_g1_crypm  s_age_g2_crypm   s_age_g3_crypm    s_age_g4_crypm  s_age_g5_crypm   s_onart_crypm     s_pcpp_crypm   
s_crag_measured_this_per_crypm    s_crypm_proph_crypm   s_cd4_g1_sbi   s_cd4_g2_sbi   s_cd4_g3_sbi   s_cd4_g4_sbi  s_cd4_g5_sbi    
s_cd4_g6_sbi   s_vl_g1_sbi  s_vl_g2_sbi    s_vl_g3_sbi   s_vl_g4_sbi s_vl_g5_sbi    s_age_g1_sbi   s_age_g2_sbi   s_age_g3_sbi   s_age_g4_sbi   
s_age_g5_sbi    s_onart_sbi   s_pcpp_sbi    s_sbi_proph_sbi    s_sbi  s_cd4_g1_dead  s_cd4_g2_dead   s_cd4_g3_dead s_cd4_g4_dead   
s_cd4_g5_dead   s_cd4_g6_dead   s_vl_g1_dead   s_vl_g2_dead   s_vl_g3_dead   s_vl_g4_dead   s_vl_g5_dead  s_age_g1_dead  s_age_g2_dead   s_age_g3_dead   
s_age_g4_dead  s_age_g5_dead  s_onart_dead_80    s_pcpp_dead   s_tb_proph_dead    s_crypm_proph_dead  s_sbi_proph_dead   sbi_proph_dead  
s_who3_event_dead  s_adc_dead     s_crypm_dead  s_sbi_dead     s_in_care_time_of_adc_tb
s_dead_tb s_dead_crypm s_dead_sbi s_dead_oth_adc 
s_tcur3m_cd4t0l100  s_who3_tcur3m_cd4t0l100  s_adc_tcur3m_cd4t0l100 s_tb_tcur3m_cd4t0l100  s_crypm_tcur3m_cd4t0l100  s_sbi_tcur3m_cd4t0l100  
s_tcur6m_cd4t0l100  s_who3_tcur6m_cd4t0l100  s_adc_tcur6m_cd4t0l100 s_tb_tcur6m_cd4t0l100  s_crypm_tcur6m_cd4t0l100  s_sbi_tcur6m_cd4t0l100 	
s_tcur3m_cd4t0l200  s_who3_tcur3m_cd4t0l200  s_adc_tcur3m_cd4t0l200 s_tb_tcur3m_cd4t0l200  s_crypm_tcur3m_cd4t0l200  s_sbi_tcur3m_cd4t0l200  
s_tcur6m_cd4t0l200  s_who3_tcur6m_cd4t0l200  s_adc_tcur6m_cd4t0l200 s_tb_tcur6m_cd4t0l200  s_crypm_tcur6m_cd4t0l200  s_sbi_tcur6m_cd4t0l200 

s_dead_80  s_death_hivrel_80

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
s_mcirc_5054m  s_mcirc_5559m  s_mcirc_6064m  s_mcirc_6569m 	s_mcirc_7074m  s_mcirc_7579m  s_mcirc_8084m  s_mcirc_85plm 
s_mcirc_50plm
s_vmmc s_vmmc1519m  s_vmmc2024m  s_vmmc2529m  s_vmmc3034m  s_vmmc3539m  s_vmmc4044m  s_vmmc4549m  s_vmmc50plm
s_new_mcirc  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3034m  s_new_mcirc_3539m  
s_new_mcirc_4044m  s_new_mcirc_4549m  s_new_mcirc_50plm
s_new_mcirc_5054m s_new_mcirc_5559m s_new_mcirc_6064m s_new_mcirc_6569m s_new_mcirc_7074m s_new_mcirc_7579m s_new_mcirc_8084m s_new_mcirc_85plm
s_new_vmmc s_new_vmmc1519m  s_new_vmmc2024m  s_new_vmmc2529m  s_new_vmmc3034m  s_new_vmmc3539m  s_new_vmmc4044m 
s_new_vmmc4549m  s_new_vmmc50plm

s_birth_circ  s_mcirc_1014m  s_new_mcirc_1014m  s_vmmc1014m  s_new_vmmc1014m


/* blood pressure */

s_diagnosed_hypertension_1549 s_on_anti_hypertensive_1549 s_hypertension_1549 	
s_diagnosed_hypertension_5059 s_on_anti_hypertensive_5059 s_hypertension_5059 	
s_diagnosed_hypertension_6069 s_on_anti_hypertensive_6069 s_hypertension_6069 	
s_diagnosed_hypertension_7079 s_on_anti_hypertensive_7079 s_hypertension_7079 	
s_diagnosed_hypertension_ge80 s_on_anti_hypertensive_ge80 s_hypertension_ge80 


/*parameters sampled*/

sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  sex_age_mixing_matrix_m sex_age_mixing_matrix_w   p_rred_p  p_hsb_p  newp_factor  fold_tr_newp
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_non_tb_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate  circ_inc_15_19  circ_red_20_30  circ_red_30_50
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat   base_rate_sw 
prob_prep_restart_choice 			prepuptake_pop   cd4_monitoring   base_rate_stop_sexwork    rred_a_p  higher_newp_with_lower_adhav
rr_int_tox   rate_birth_with_infected_child  nnrti_res_no_effect  double_rate_gas_tox_taz   incr_mort_risk_dol_weightg 
greater_disability_tox 	  greater_tox_zdv 	higher_rate_res_dol  rel_dol_tox  dol_higher_potency  prop_bmi_ge23
ntd_risk_dol  oth_dol_adv_birth_e_risk  zdv_potency_p75
sw_program    sw_higher_int  prob_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
sw_init_newp sw_trans_matrix  p_rred_sw_newp  effect_sw_prog_newp   
effect_sw_prog_6mtest effect_sw_prog_int effect_sw_prog_pers_sti effect_sw_prog_adh  effect_sw_prog_lossdiag effect_sw_prog_prep
sw_art_disadv
zero_3tc_activity_m184  zero_tdf_activity_k65r lower_future_art_cov  higher_future_prep_cov

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph


/*year_i interventions*/
condom_incr_year_i    			  incr_test_year_i             decr_hard_reach_year_i  incr_adh_year_i 
decr_prob_loss_at_diag_year_i 	  decr_rate_lost_year_i 		    decr_rate_lost_art_year_i    incr_rate_return_year_i     
incr_rate_restart_year_i          incr_rate_init_year_i          decr_rate_int_choice_year_i  incr_prob_vl_meas_done_year_i 
incr_pr_switch_line_year_i    	 prep_improvements       	 incr_adh_pattern_prep_year_i 
inc_r_test_startprep_year_i   incr_r_test_restartprep_year_i decr_r_choose_stop_prep_year_i 
inc_p_prep_restart_choi_year_i  incr_prepuptake_sw_year_i      incr_prepuptake_pop_year_i   prep_strategy_year_i 
	  circ_inc_rate_year_i 		     incr_test_targeting_year_i   
incr_max_freq_testing_year_i      initial_pr_switch_line       initial_prob_vl_meas_done  sw_test_6mthly_year_i   reg_option_switch_year_i 
art_mon_drug_levels_year_i   ten_is_taf_year_i  	pop_wide_tld_year_i single_vl_switch_efa_year_i

 prepuptake_pop e_decr_hard_reach_year_i 

vmmc_disrup_covid condom_disrup_covid prep_disrup_covid swprog_disrup_covid testing_disrup_covid art_tld_disrup_covid art_tld_eod_disrup_covid
art_init_disrup_covid vl_adh_switch_disrup_covid cotrim_disrup_covid no_art_disrup_covid inc_death_rate_aids_disrup_covid art_low_adh_disrup_covid
cov_death_risk_mult

prep_strategy

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

r_s_ep_m15w15 r_s_ep_m25w25 r_s_ep_m35w35 r_s_ep_m45w45 r_s_ep_m55w55 

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r  s_m_newp   s_w_newp
ptnewp15_m  ptnewp25_m  ptnewp35_m  ptnewp45_m  ptnewp55_m
ptnewp15_w  ptnewp25_w  ptnewp35_w  ptnewp45_w  ptnewp55_w


; 

* note need to keep one s_n ! ;

run;
proc freq;table option;where cald ge 2021 ;run;
proc freq;table option cald;run;
proc sort data=a;by run;run;



data sf;
set a ;
 
if cald=2021;
s_alive = s_alive_m + s_alive_w ;
sf_2021 = 10000000 / s_alive;
keep run sf_2021;
proc sort; by run;run;

data a1; 
merge a sf;
by run ;
run;

data a2;
set a1;

if option=1 then do;
* n_sw_1564;					n_sw_1564_1_ = s_sw_1564 * sf_2021;
* n_sw_1549;					n_sw_1549_1_ = s_sw_1549 * sf_2021;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_1_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_1_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_1_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;				p_sw_prog_vis_1_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_1_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_1_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_1_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_1_ = s_tested_sw * sf_2021 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_1_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_1_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_1_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_1_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_1_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_1_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_1_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* incidence1549;				incidence1549_1_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w_1_ = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m_1_ = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* duration of sw;				tot_dur_sw_1_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_1_= s_act_dur_sw/ s_sw_1564;
	
	
								 
***no disadv;
if sw_art_disadv=1 then do;
* n_sw_1564;					n_sw_1564_nodis_1_ = s_sw_1564 * sf_2021;
* n_sw_1549;					n_sw_1549_nodis_1_ = s_sw_1549 * sf_2021;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_nodis_1_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_nodis_1_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_nodis_1_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;				p_sw_prog_vis_nodis_1_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_nodis_1_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_nodis_1_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_nodis_1_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_nodis_1_ = s_tested_sw * sf_2021 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_nodis_1_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_nodis_1_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_nodis_1_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_nodis_1_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_nodis_1_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_nodis_1_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_nodis_1_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* duration of sw;				tot_dur_sw_nodis_1_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_nodis_1_= s_act_dur_sw/ s_sw_1564;
	
end;

***mild disadv;
if sw_art_disadv=2 then do;

* n_sw_1564;					n_sw_1564_mild_1_ = s_sw_1564 * sf_2021;
* n_sw_1549;					n_sw_1549_mild_1_ = s_sw_1549 * sf_2021;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_mild_1_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_mild_1_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_mild_1_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;				p_sw_prog_vis_mild_1_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_mild_1_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_mild_1_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_mild_1_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_mild_1_ = s_tested_sw * sf_2021 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_mild_1_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_mild_1_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_mild_1_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_mild_1_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_mild_1_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_mild_1_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_mild_1_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* duration of sw;				tot_dur_sw_mild_1_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_mild_1_= s_act_dur_sw/ s_sw_1564;
end;

end;



if option=2 then do;
* n_sw_1564;					n_sw_1564_2_ = s_sw_1564 * sf_2021;
* n_sw_1549;					n_sw_1549_2_ = s_sw_1549 * sf_2021;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_2_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_2_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_2_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;				p_sw_prog_vis_2_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_2_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_2_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_2_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_2_ = s_tested_sw * sf_2021 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_2_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_2_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_2_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_2_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_2_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_2_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_2_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* incidence1549;				incidence1549_2_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w_2_ = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m_2_ = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* duration of sw;				tot_dur_sw_2_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_2_= s_act_dur_sw/ s_sw_1564;

***nodis disadv;
if sw_art_disadv=1 then do;

* n_sw_1564;					n_sw_1564_nodis_2_ = s_sw_1564 * sf_2021;
* n_sw_1549;					n_sw_1549_nodis_2_ = s_sw_1549 * sf_2021;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_nodis_2_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_nodis_2_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_nodis_2_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;		p_sw_prog_vis_nodis_2_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_nodis_2_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_nodis_2_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_nodis_2_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_nodis_2_ = s_tested_sw * sf_2021 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_nodis_2_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_nodis_2_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_nodis_2_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_nodis_2_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_nodis_2_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_nodis_2_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_nodis_2_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* duration of sw;				tot_dur_sw_nodis_2_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_nodis_2_= s_act_dur_sw/ s_sw_1564;

end;

***mild disadv;
if sw_art_disadv=2 then do;
* p_diag_sw;					if s_sw_1564 > 0 then p_diag_sw_mild_2_ = s_diag_sw / s_sw_1564; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_mild_2_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_mild_2_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* n_sw_1564;					n_sw_1564_mild_2_ = s_sw_1564 * sf_2021;
* n_sw_1549;					n_sw_1549_mild_2_ = s_sw_1549 * sf_2021;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_mild_2_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_mild_2_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_mild_2_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;		p_sw_prog_vis_mild_2_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_mild_2_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_mild_2_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_mild_2_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_mild_2_ = s_tested_sw * sf_2021 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_mild_2_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_mild_2_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_mild_2_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_mild_2_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_mild_2_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_mild_2_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_mild_2_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* duration of sw;				tot_dur_sw_mild_2_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_mild_2_= s_act_dur_sw/ s_sw_1564;
end;

end;
run;


data b;
set a2;

proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***gives each simulation an id;
proc means max data=b;var count_csim;run; ***number of simulations - this is manually inputted in nfit below;
%let nfit=600;  
run;

data c;
set b;

%let var =  
dur0to3_sw_1_  dur3to5_sw_1_  dur6to9_sw_1_  dur10to19_sw_1_
dur0to3_sw_nodis_1_  dur3to5_sw_nodis_1_  dur6to9_sw_nodis_1_  dur10to19_sw_nodis_1_
dur0to3_sw_mild_1_  dur3to5_sw_mild_1_  dur6to9_sw_mild_1_  dur10to19_sw_mild_1_

dur0to3_sw_2_  dur3to5_sw_2_  dur6to9_sw_2_  dur10to19_sw_2_
dur0to3_sw_nodis_2_  dur3to5_sw_nodis_2_  dur6to9_sw_nodis_2_  dur10to19_sw_nodis_2_
dur0to3_sw_mild_2_  dur3to5_sw_mild_2_  dur6to9_sw_mild_2_  dur10to19_sw_mild_2_

n_sw_1564_1_  n_sw_1549_1_  prop_w_1564_sw_1_  prop_w_1549_sw_1_  prop_w_ever_sw_1_  p_sw_prog_vis_1_  prop_sw_hiv_1_  prop_sw_newp0_1_
t_sw_newp_1_  n_tested_sw_1_  p_newp_sw_1_  prop_sw_onprep_1_  prevalence_sw_1_  incidence_sw_1_  p_diag_sw_1_  p_onart_diag_sw_1_
p_onart_vl1000_sw_1_

n_sw_1564_nodis_1_  n_sw_1549_nodis_1_  prop_w_1564_sw_nodis_1_  prop_w_1549_sw_nodis_1_  prop_w_ever_sw_nodis_1_  p_sw_prog_vis_nodis_1_  prop_sw_hiv_nodis_1_  prop_sw_newp0_nodis_1_
t_sw_newp_nodis_1_  n_tested_sw_nodis_1_  p_newp_sw_nodis_1_  prop_sw_onprep_nodis_1_  prevalence_sw_nodis_1_  incidence_sw_nodis_1_  p_diag_sw_nodis_1_  p_onart_diag_sw_nodis_1_
p_onart_vl1000_sw_nodis_1_

n_sw_1564_mild_1_  n_sw_1549_mild_1_  prop_w_1564_sw_mild_1_  prop_w_1549_sw_mild_1_  prop_w_ever_sw_mild_1_  p_sw_prog_vis_mild_1_  prop_sw_hiv_mild_1_  prop_sw_newp0_mild_1_
t_sw_newp_mild_1_  n_tested_sw_mild_1_  p_newp_sw_mild_1_  prop_sw_onprep_mild_1_  prevalence_sw_mild_1_  incidence_sw_mild_1_  p_diag_sw_mild_1_  p_onart_diag_sw_mild_1_
p_onart_vl1000_sw_mild_1_


n_sw_1564_2_  n_sw_1549_2_  prop_w_1564_sw_2_  prop_w_1549_sw_2_  prop_w_ever_sw_2_  p_sw_prog_vis_2_  prop_sw_hiv_2_  prop_sw_newp0_2_
t_sw_newp_2_  n_tested_sw_2_  p_newp_sw_2_  prop_sw_onprep_2_  prevalence_sw_2_  incidence_sw_2_  p_diag_sw_2_  p_onart_diag_sw_2_
p_onart_vl1000_sw_2_
n_sw_1564_nodis_2_  n_sw_1549_nodis_2_  prop_w_1564_sw_nodis_2_  prop_w_1549_sw_nodis_2_  prop_w_ever_sw_nodis_2_  p_sw_prog_vis_nodis_2_  prop_sw_hiv_nodis_2_  prop_sw_newp0_nodis_2_
t_sw_newp_nodis_2_  n_tested_sw_nodis_2_  p_newp_sw_nodis_2_  prop_sw_onprep_nodis_2_  prevalence_sw_nodis_2_  incidence_sw_nodis_2_  p_diag_sw_nodis_2_  p_onart_diag_sw_nodis_2_
p_onart_vl1000_sw_nodis_2_
n_sw_1564_mild_2_  n_sw_1549_mild_2_  prop_w_1564_sw_mild_2_  prop_w_1549_sw_mild_2_  prop_w_ever_sw_mild_2_  p_sw_prog_vis_mild_2_  prop_sw_hiv_mild_2_  prop_sw_newp0_mild_2_
t_sw_newp_mild_2_  n_tested_sw_mild_2_  p_newp_sw_mild_2_  prop_sw_onprep_mild_2_  prevalence_sw_mild_2_  incidence_sw_mild_2_  p_diag_sw_mild_2_  p_onart_diag_sw_mild_2_
p_onart_vl1000_sw_mild_2_

incidence1549_1_  incidence1549w_1_  incidence1549m_1_  incidence1549_2_  incidence1549w_2_  incidence1549m_2_

dur0to3_sw_1_  dur3to5_sw_1_  dur6to9_sw_1_  dur10to19_sw_1_
dur0to3_sw_nodis_1_  dur3to5_sw_nodis_1_  dur6to9_sw_nodis_1_  dur10to19_sw_nodis_1_
dur0to3_sw_mild_1_  dur3to5_sw_mild_1_  dur6to9_sw_mild_1_  dur10to19_sw_mild_1_

dur0to3_sw_2_  dur3to5_sw_2_  dur6to9_sw_2_  dur10to19_sw_2_
dur0to3_sw_nodis_2_  dur3to5_sw_nodis_2_  dur6to9_sw_nodis_2_  dur10to19_sw_nodis_2_
dur0to3_sw_mild_2_  dur3to5_sw_mild_2_  dur6to9_sw_mild_2_  dur10to19_sw_mild_2_
;

***transpose given name; *starts with %macro and ends with %mend;
%macro transpose;
%let p25_var = p25_&var;
%let p75_var = p75_&var;
%let p5_var = p5_&var;
%let p95_var = p95_&var;
%let p50_var = median_&var;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=c out=a&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data a&count;set a&count;***creates one dataset per variable;
p25_&varb  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb = median(of &varb.1-&varb.&nfit);

keep cald p5_&varb p95_&varb p50_&varb p25_&varb p75_&varb;
run;

      proc datasets nodetails nowarn nolist; 
      delete  aa&count;quit;run;
%end;
%mend;


%transpose;
run;

data d;
merge b
a1   a2   a3   a4   a5   a6   a7   a8   a9   a10  a11  a12  a13  a14  a15  a16  a17  a18  a19  a20  a21  a22  a23  a24  a25  a26 
a27  a28  a29  a30  a31  a32  a33  a34  a35  a36  a37  a38  a39  a40  a41  a42  a43  a44  a45  a46  a47  a48  a49  a50  a51  a52 
a53  a54  a55  a56  a57  a58  a59  a60  a61  a62  a63  a64  a65  a66  a67  a68  a69  a70  a71  a72  a73  a74  a75  a76  a77  a78 
a79  a80  a81  a82  a83  a84  a85  a86  a87  a88  a89  a90  a91  a92  a93  a94  a95  a96  a97  a98  a99  a100 a101 a102 a103 a104
a105 a106 a107 a108 a109 a110 a111 a112 a113 a114 a115 a116 a117 a118 a119 a120 a121 a122 a123 a124 a125 a126 a127 a128 a129 a130
a131 a132 a133 a134 a135 a136 a137 a138 a139 a140 a141 a142 a143 a144 a145 a146 a147 a148 a149 a150 a151 a152 a153 a154 a155 a156
/*a157 a158 a159 a160 a161 a162 a163 a164 a165 a166 a167 a168 a169 a170 a171 a172 a173 a174 a175 a176 a177 a178 a179 a180 a181 a182
a183 a184 a185 a186 a187 a188 a189 a190 a191 a192 a193 a194 a195 a196 a197 a198 a199 a200 a201 a202 a203 a204 a205 a206 a207 a208
a209 a210 a211 a212 a213 a214 a215 a216 a217 a218 a219 a220 a221 a222 a223 a224 a225 a226 a227 a228 a229 a230 a231 a232 a233 a234
a235 a236 a237 a238 a239 a240 a241 a242 a243 a244 a245 a246 a247 a248 a249 a250 a251 a252*/;
by cald;
run;

data e;
set d;
%include '"C:\Loveleen\Synthesis model\Zim\Calibration\Observed data_Zimbabwe_LBMMay2017.sas"'; by cald;
run;

ods graphics / reset imagefmt=jpeg height=5in width=8in; run;
ods rtf file = 'C:\Loveleen\Synthesis model\Zim\FSW\24May2021.doc' startpage=never; 


proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 130000)  valueattrs=(size=10);
label p50_n_sw_1549_1_	                  = "model age 15-49 (median)";

label o_pop_fsw_1549w_Fearnon			  = "All FSW age 15-49 - Fearon";
series  x=cald y=p50_n_sw_1549_1_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549_1_      upper=p95_n_sw_1549_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearnon / markerattrs = (symbol=circle color=black size = 12)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearnon yerrorupper=o_pop_fsw_ul_1549w_Fearnon errorbarattrs= (color=black thickness = 2);
run;quit;
 

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of women who are sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) 		valueattrs=(size=10);
label p50_prop_w_1549_sw_1_   = "model - median ";

label o_p_fsw_ab1ts6m_1849w_nbcs = "NBCP: >  1 TSP (age 18-49)";
label o_p_fsw_1549w_Fearnon		 = "Fearon 15-49";

series  x=cald y=p50_prop_w_1549_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1_ 	 upper=p95_prop_w_1549_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=o_p_fsw_ab1ts6m_1849w_nbcs / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_1549w_Fearnon / markerattrs = (symbol=circle       color=green size = 12)
										 yerrorlower=o_p_fsw_ll_1549w_Fearnon yerrorupper=o_p_fsw_ul_1549w_Fearnon errorbarattrs= (color=green thickness = 2);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Duration of sex work";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  valueattrs=(size=10);
label p50_dur0to3_sw_1_	                  = "0 to 3 years (median)";
label p50_dur3to5_sw_1_	                  = "3 to 5 years (median)";
label p50_dur6to9_sw_1_	                  = "6 to 9 years (median)";
label p50_dur10to19_sw_1_	              = "9+ years (median)";

series  x=cald y=p50_dur0to3_sw_1_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_dur0to3_sw_1_      upper=p95_dur0to3_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "0 to 3y 90% range";
series  x=cald y=p50_dur3to5_sw_1_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_dur3to5_sw_1_      upper=p95_dur3to5_sw_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "3 to 5y 90% range";
series  x=cald y=p50_dur6to9_sw_1_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_dur6to9_sw_1_      upper=p95_dur6to9_sw_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "6 to 9y 90% range";
series  x=cald y=p50_dur10to19_sw_1_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_dur10to19_sw_1_      upper=p95_dur10to19_sw_1_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "9+ y 90% range";

run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst all sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_1_ 	 upper=p95_p_diag_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_1_	 upper=p95_p_onart_diag_sw_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_1_	 upper=p95_p_onart_vl1000_sw_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst sex workers with no disadvantages (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_nodis_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_nodis_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_nodis_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_nodis_1_ 	 upper=p95_p_diag_sw_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_nodis_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_nodis_1_	 upper=p95_p_onart_diag_sw_nodis_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_nodis_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_nodis_1_	 upper=p95_p_onart_vl1000_sw_nodis_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst sex workers with mild disadvantages (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_mild_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_mild_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_mild_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_mild_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_mild_1_ 	 upper=p95_p_diag_sw_mild_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_mild_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_mild_1_	 upper=p95_p_onart_diag_sw_mild_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_mild_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_mild_1_	 upper=p95_p_onart_vl1000_sw_mild_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Assuming a sex-worker program is in place, proportion of sex workers who have a program visit";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 1 by 0.2) 		valueattrs=(size=10);
label p50_p_sw_prog_vis_2_ = "Proportion with a program visit";

series  x=cald y=p50_p_sw_prog_vis_2_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_2_ 	 upper=p95_p_sw_prog_vis_2_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Average number of condomless partners stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_t_sw_newp_1_ = "No sex worker program ";
label p50_t_sw_newp_2_ = "Sex worker program ";

series  x=cald y=p50_t_sw_newp_1_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_t_sw_newp_1_	 upper=p95_t_sw_newp_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_t_sw_newp_2_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_t_sw_newp_2_	 upper=p95_t_sw_newp_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers on PrEP stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.4 by 0.1) 		valueattrs=(size=10);

label p50_prop_sw_onprep_1_ = "No sex worker program ";
label p50_prop_sw_onprep_2_ = "Sex worker program ";

series  x=cald y=p50_prop_sw_onprep_1_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_1_	 upper=p95_prop_sw_onprep_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_prop_sw_onprep_2_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_2_	 upper=p95_prop_sw_onprep_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_prop_sw_newp0_1_ = "No sex worker program ";
label p50_prop_sw_newp0_2_ = "Sex worker program ";

series  x=cald y=p50_prop_sw_newp0_1_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_newp0_1_	 upper=p95_prop_sw_newp0_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_prop_sw_newp0_2_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_newp0_2_	 upper=p95_prop_sw_newp0_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Number of HIV tests amongst sex workers stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)  values = (0 to 100000 by 10000) 		valueattrs=(size=10);

label p50_n_tested_sw_1_ = "No sex worker program ";
label p50_n_tested_sw_2_ = "Sex worker program ";

series  x=cald y=p50_n_tested_sw_1_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_1_	 upper=p95_n_tested_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_n_tested_sw_2_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_2_	 upper=p95_n_tested_sw_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_diag_sw_1_  = "No sex worker program ";
label p50_p_diag_sw_2_  = "Sex worker program ";

series  x=cald y=p50_p_diag_sw_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_sw_1_  upper=p95_p_diag_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_diag_sw_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_sw_2_  upper=p95_p_diag_sw_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_diag_sw_nodis_2_  = "No disadvantages ";
label p50_p_diag_sw_mild_2_  = "Mild disadvantages ";


series  x=cald y=p50_p_diag_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_diag_sw_nodis_2_  upper=p95_p_diag_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_diag_sw_mild_2_/  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_diag_sw_mild_2_  upper=p95_p_diag_sw_mild_2_/ transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV on ART";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_diag_sw_1_  = "No sex worker program ";
label p50_p_onart_diag_sw_2_  = "Sex worker program ";

series  x=cald y=p50_p_onart_diag_sw_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_1_  upper=p95_p_onart_diag_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_diag_sw_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_2_  upper=p95_p_onart_diag_sw_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV on ART by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_diag_sw_nodis_2_  = "No disadvantages";
label p50_p_onart_diag_sw_mild_2_  = "Mild disadvantages ";

series  x=cald y=p50_p_onart_diag_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_nodis_2_  upper=p95_p_onart_diag_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_diag_sw_2_ /  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_2_  upper=p95_p_onart_diag_sw_2_ / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers on ART and virally suppressed";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_vl1000_sw_1_  = "No sex worker program ";
label p50_p_onart_vl1000_sw_2_  = "Sex worker program ";

series  x=cald y=p50_p_onart_vl1000_sw_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_1_  upper=p95_p_onart_vl1000_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_vl1000_sw_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_2_  upper=p95_p_onart_vl1000_sw_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers on ART and virally suppressed by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_vl1000_sw_nodis_2_  = "No disadvantages";
label p50_p_onart_vl1000_sw_mild_2_  = "Mild disadvantages ";

series  x=cald y=p50_p_onart_vl1000_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_nodis_2_  upper=p95_p_onart_vl1000_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_vl1000_sw_mild_2_ /  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_mild_2_  upper=p95_p_onart_vl1000_sw_mild_2_ / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;



proc sgplot data=e; 

title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (1995 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 100 by 5)    valueattrs=(size=10);

label p50_incidence_sw_1_  = "No sex worker program ";
label p50_incidence_sw_2_ = "Sex worker program";

series  x=cald y=p50_incidence_sw_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_sw_1_  upper=p95_incidence_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_incidence_sw_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_2_  upper=p95_incidence_sw_2_/ transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "HIV incidence in general population";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 2 by 0.2)    valueattrs=(size=10);

label p50_incidence1549_1_  = "No sex worker program ";
label p50_incidence1549_2_ = "Sex worker program";

series  x=cald y=p50_incidence1549_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549_1_  upper=p95_incidence1549_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_incidence1549_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549_2_  upper=p95_incidence1549_2_/ transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;

ods rtf close;
ods listing;
run;

