

* determining newp base categories for new sw;
if sw_init_newp=1 then do; p_sw_init_newp_g1=0.40; p_sw_init_newp_g2=0.55; p_sw_init_newp_g3= 0.03; p_sw_init_newp_g4=0.01; p_sw_init_newp_g5=0.01; end;
if sw_init_newp=2 then do; p_sw_init_newp_g1=0.30; p_sw_init_newp_g2=0.65; p_sw_init_newp_g3= 0.03; p_sw_init_newp_g4=0.01; p_sw_init_newp_g5=0.01; end;
if sw_init_newp=3 then do; p_sw_init_newp_g1=0.20; p_sw_init_newp_g2=0.75; p_sw_init_newp_g3= 0.03; p_sw_init_newp_g4=0.01; p_sw_init_newp_g5=0.01; end;

* transition probabilities between sex worker newp levels;
* sw newp levels are   1 	newp = 0   2   newp 1-6   3   newp 7-20   4   newp 21-50   5   newp 51-150  ;

if sw_trans_matrix=1 then do;
sw_newp_lev_1_1 = 0.95 ; sw_newp_lev_1_2 = 0.05 ; sw_newp_lev_1_3 = 0.000  ; sw_newp_lev_1_4 = 0.000 ; sw_newp_lev_1_5 = 0.000 ; 
sw_newp_lev_2_1 = 0.50 ; sw_newp_lev_2_2 = 0.45 ; sw_newp_lev_2_3 = 0.050  ; sw_newp_lev_2_4 = 0.002 ; sw_newp_lev_2_5 = 0.002 ; 
sw_newp_lev_3_1 = 0.00 ; sw_newp_lev_3_2 = 0.05 ; sw_newp_lev_3_3 = 0.95  ; sw_newp_lev_3_4 = 0.002 ; sw_newp_lev_3_5 = 0.002 ; 
sw_newp_lev_4_1 = 0.000 ; sw_newp_lev_4_2 = 0.000 ; sw_newp_lev_4_3 = 0.030 ; sw_newp_lev_4_4 = 0.95 ; sw_newp_lev_4_5 = 0.020; 
sw_newp_lev_5_1 = 0.000 ; sw_newp_lev_5_2 = 0.000 ; sw_newp_lev_5_3 = 0.000  ; sw_newp_lev_5_4 = 0.05 ; sw_newp_lev_5_5 = 0.95 ; 
end;
if sw_trans_matrix=2 then do;
sw_newp_lev_1_1 = 0.90 ; sw_newp_lev_1_2 = 0.10 ; sw_newp_lev_1_3 = 0.000  ; sw_newp_lev_1_4 = 0.000 ; sw_newp_lev_1_5 = 0.000 ; 
sw_newp_lev_2_1 = 0.50 ; sw_newp_lev_2_2 = 0.45 ; sw_newp_lev_2_3 = 0.050  ; sw_newp_lev_2_4 = 0.002 ; sw_newp_lev_2_5 = 0.002 ; 
sw_newp_lev_3_1 = 0.00 ; sw_newp_lev_3_2 = 0.10 ; sw_newp_lev_3_3 = 0.90  ; sw_newp_lev_3_4 = 0.002 ; sw_newp_lev_3_5 = 0.002 ; 
sw_newp_lev_4_1 = 0.000 ; sw_newp_lev_4_2 = 0.000 ; sw_newp_lev_4_3 = 0.050 ; sw_newp_lev_4_4 = 0.90 ; sw_newp_lev_4_5 = 0.050; 
sw_newp_lev_5_1 = 0.000 ; sw_newp_lev_5_2 = 0.000 ; sw_newp_lev_5_3 = 0.000  ; sw_newp_lev_5_4 = 0.10 ; sw_newp_lev_5_5 = 0.90 ; 
end;
if sw_trans_matrix=3 then do;
sw_newp_lev_1_1 = 0.99 ; sw_newp_lev_1_2 = 0.01 ; sw_newp_lev_1_3 = 0.000  ; sw_newp_lev_1_4 = 0.000 ; sw_newp_lev_1_5 = 0.000 ; 
sw_newp_lev_2_1 = 0.01 ; sw_newp_lev_2_2 = 0.98 ; sw_newp_lev_2_3 = 0.010  ; sw_newp_lev_2_4 = 0.000 ; sw_newp_lev_2_5 = 0.000 ; 
sw_newp_lev_3_1 = 0.00 ; sw_newp_lev_3_2 = 0.01 ; sw_newp_lev_3_3 = 0.98  ; sw_newp_lev_3_4 = 0.010 ; sw_newp_lev_3_5 = 0.000 ; 
sw_newp_lev_4_1 = 0.000 ; sw_newp_lev_4_2 = 0.000 ; sw_newp_lev_4_3 = 0.010 ; sw_newp_lev_4_4 = 0.98 ; sw_newp_lev_4_5 = 0.010; 
sw_newp_lev_5_1 = 0.000 ; sw_newp_lev_5_2 = 0.000 ; sw_newp_lev_5_3 = 0.000  ; sw_newp_lev_5_4 = 0.01 ; sw_newp_lev_5_5 = 0.99 ; 
end;
if sw_trans_matrix=4 then do; 
sw_newp_lev_1_1 = 0.96 ; sw_newp_lev_1_2 = 0.01 ; sw_newp_lev_1_3 = 0.01 ; sw_newp_lev_1_4 = 0.01 ; sw_newp_lev_1_5 = 0.01 ; 
sw_newp_lev_2_1 = 0.01 ; sw_newp_lev_2_2 = 0.96 ; sw_newp_lev_2_3 = 0.01 ; sw_newp_lev_2_4 = 0.01 ; sw_newp_lev_2_5 = 0.01 ; 
sw_newp_lev_3_1 = 0.01 ; sw_newp_lev_3_2 = 0.01 ; sw_newp_lev_3_3 = 0.96 ; sw_newp_lev_3_4 = 0.01 ; sw_newp_lev_3_5 = 0.01 ; 
sw_newp_lev_4_1 = 0.01 ; sw_newp_lev_4_2 = 0.01 ; sw_newp_lev_4_3 = 0.01 ; sw_newp_lev_4_4 = 0.96 ; sw_newp_lev_4_5 = 0.01; 
sw_newp_lev_5_1 = 0.01 ; sw_newp_lev_5_2 = 0.01 ; sw_newp_lev_5_3 = 0.01 ; sw_newp_lev_5_4 = 0.01 ; sw_newp_lev_5_5 = 0.96 ; 
end; 
if sw_trans_matrix=5 then do; 
sw_newp_lev_1_1 = 1;  sw_newp_lev_1_2 = 0; sw_newp_lev_1_3 = 0; sw_newp_lev_1_4 = 0; sw_newp_lev_1_5 = 0; 
sw_newp_lev_2_1 = 0;  sw_newp_lev_2_2 = 1; sw_newp_lev_2_3 = 0; sw_newp_lev_2_4 = 0; sw_newp_lev_2_5 = 0; 
sw_newp_lev_3_1 = 0;  sw_newp_lev_3_2 = 0; sw_newp_lev_3_3 = 1; sw_newp_lev_3_4 = 0; sw_newp_lev_3_5 = 0; 
sw_newp_lev_4_1 = 0;  sw_newp_lev_4_2 = 0; sw_newp_lev_4_3 = 0; sw_newp_lev_4_4 = 1; sw_newp_lev_4_5 = 0; 
sw_newp_lev_5_1 = 0;  sw_newp_lev_5_2 = 0; sw_newp_lev_5_3 = 0; sw_newp_lev_5_4 = 0; sw_newp_lev_5_5 = 1; 
end; 
