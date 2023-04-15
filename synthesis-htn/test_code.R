pct <- function(x) {
  y <- paste0(round((x*100),0),"%")
  return(y)
}

df_drug <- df_sas %>% 
  group_by(source) %>% 
  summarize("treated" = paste0(pct(mean(p_on_anti_hypert_5059_2343, na.rm = T)), " (", 
                                round(100*quantile(p_on1drug_antihyp_5059_2343, 0.05, q = 0.05),0), " to ", 
                                pct(quantile(p_on1drug_antihyp_5059_2343, 0.95, q=0.95)), ")"), 
            "One drug" = paste0(pct(mean(p_on1drug_antihyp_5059_2343, na.rm = T)), " (", 
                           round(100*quantile(p_on1drug_antihyp_5059_2343, 0.05, q = 0.05),0), " to ", 
                           pct(quantile(p_on1drug_antihyp_5059_2343, na.rm = T, 0.95, q=0.95)), ")"), 
            "Two drugs" = paste0(pct(mean(p_on2drug_antihyp_5059_2343)), " (", 
                           round(100*quantile(p_on2drug_antihyp_5059_2343, 0.05, q = 0.05),0), " to ", 
                           pct(quantile(p_on2drug_antihyp_5059_2343, na.rm = T, 0.95, q=0.95)), ")"), 
            "Three drugs" = paste0(pct(mean(p_on3drug_antihyp_5059_2343)), " (", 
                           round(100*quantile(p_on3drug_antihyp_5059_2343, 0.05, q = 0.05),0), " to ", 
                           pct(quantile(p_on3drug_antihyp_5059_2343, na.rm = T, 0.95, q=0.95)), ")"))
df_drug <- data.frame(df_drug)
df_drug2 <- data.frame(t(df_drug[,-1]))
colnames(df_drug2) <- df_drug[,1]

df_drug2 <- df_drug2 %>% 
  mutate(parameter = rownames(df_drug2),
         parameter = str_replace(parameter, "[.]", " ")) %>% 
  as_tibble() %>% 
  relocate(parameter)
df_drug2