library(tidyverse)

setwd("/Users/sf124046/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration")

# Functions
pct <- function(x) {
  y <- ifelse(x < 0.1, paste0(round((x * 100), 0), "%"), paste0(round((x * 100), 0), "%"))
  return(y)
}

fx_pctmean_range <- function(data) {
  mean_val <- round(mean(data, na.rm = TRUE) * 100, 1)
  lower_val <- round(quantile(data, q = 0.05, na.rm = TRUE) * 100, 1)
  upper_val <- round(quantile(data, q = 0.95, na.rm = TRUE) * 100, 1)
  result <- paste0(mean_val, "% (", lower_val, "% to ", upper_val, "%)")
  return(result)
}

fx_mean_range <- function(data, digits = 2) {
  mean_val <- round(mean(data, na.rm = TRUE), digits)
  lower_val <- round(quantile(data, 0.05, na.rm = TRUE), digits)
  upper_val <- round(quantile(data, 0.95, na.rm = TRUE), digits)
  result <- paste0(mean_val, " (", lower_val, " to ", upper_val, ")")
  return(result)
}

y <- c("2474")

# Table 1
t1_hiv <- df_sas %>% filter(year == "15", var == "prevalence") %>% group_by(age) %>% summarize(hiv_mean = paste0(pct(median(value)), " (", round(100*quantile(value, 0.05, q = 0.05),0), " to ", pct(quantile(value, 0.95, q=0.95)), ")"))

t1_htn <- df_htn %>% filter(year == "15", source == "SOC") %>% group_by(age) %>% summarize(htn_mean = paste0(pct(mean(htn)), " (", round(100*quantile(htn, 0.05, q = 0.05),0), " to ", pct(quantile(htn, 0.95, q=0.95)), ")"))

t1_dx <- df_dx %>% filter(year == "15", source == "SOC") %>% group_by(age) %>% summarize(dx_mean = paste0(pct(mean(dx)), " (", round(100*quantile(dx, 0.05, q = 0.05),0), " to ", pct(quantile(dx, 0.95, q=0.95)), ")"))

t1_tx <- df_tx_current %>% filter(year == "15", source == "SOC", age %in% c("18+", "25-44", "45-64", "65+")) %>% group_by(age) %>% summarize(tx_mean = paste0(pct(mean(tx)), " (", round(100*quantile(tx, 0.05, q = 0.05),0), " to ", pct(quantile(tx, 0.95, q=0.95)), ")"))

t1_ctrl <- df_ctrl %>% filter(year == "15", source == "SOC", age %in% c("18+", "25-44", "45-64", "65+")) %>% group_by(age) %>% summarize(control_mean = paste0(pct(mean(control)), " (", round(100*quantile(control, 0.05, q = 0.05),0), " to ", pct(quantile(control, 0.95, q=0.95)), ")"))

t1_ssahtn <- df_htn %>% filter(age != "15-24", country %in% c("Kenya", "Uganda", "BurkinaFaso", "Swaziland", "SouthAfrica", "Tanzania", "Togo")) %>% mutate(htn = pct(htn)) %>% arrange(age, country)

t1_ssadx <- df_dx %>% filter(age != "15-24", country %in% c("Kenya", "Uganda", "BurkinaFaso", "Swaziland", "SouthAfrica", "Tanzania", "Togo")) %>% mutate(dx = pct(dx)) %>% arrange(age, country)

# Table 3
t3vars_m0 <- c("m_sbp", "m_sbp_max_over", "m_sbp_over")
t3vars_pct <- c("p_htn_true", "p_hypert160", "p_dx_htn_true", "p_dx_htn_over", "p_on_tx_htn", "p_ever_tx_htn", "p_on_tx_htn_over", "p_hypert_control")
t3vars_m2 <- c("rate_ihd_modsev", "rate_ihd_modsev_htn", "rate_ihd_modsev_rr", "rate_ihd_modsev_htn_rr",
               "rate_cva_modsev", "rate_cva_modsev_htn", "rate_cva_modsev_rr", "rate_cva_modsev_htn_rr", 
               "rate_dead_cvd", "rate_dead_cvd_rr", 
               "rate_dead_hivpos_cvd", "rate_dead_hivpos_cvd_rr", "rate_dead_hivneg_cvd", "rate_dead_hivneg_cvd_rr",
               "rate_dead_ac", "rate_dead_ac_rr", 
               "rate_dead_hivpos_anycause", "rate_dead_hivpos_anycause_rr")
t3vars_m1 <- c("ddaly_averted", "dhtn_cost_scr", "dhtn_cost_clin", "dhtn_cost_drug", "dhtn_cost_cvd", "dhtn_cost_total",
               "htn_cost_scr", "htn_cost_clin", "htn_cost_drug", "htn_cost_cvd", "htn_cost_total")

t3vars <- c(t3vars_m0, t3vars_pct, t3vars_m2, t3vars_m1)
t3age <- c("18+", "25-44", "45-64", "65+", "All")

x1 <- df_sas %>% filter(year == y, var %in% t3vars, age %in% t3age) %>% 
  group_by(var, age, source) %>%
  summarize(mean_val = mean(value, na.rm = T),
            q05 = quantile(value, 0.05, q = 0.05, na.rm = T), 
            q95 = quantile(value, 0.95, q=0.95, na.rm = T)) %>%  
  ungroup() %>% filter(!is.na(mean_val)) %>% 
  mutate(mean_value = ifelse(var %in% t3vars_m0, paste0(round(mean_val,0), " (", round(q05,0), " to ", round(q95,0), ")"),
                             ifelse(var %in% t3vars_pct, paste0(pct(mean_val), " (", pct(q05), " to ", pct(q95), ")"), 
                                    ifelse(var %in% t3vars_m2, paste0(round(mean_val,2), " (", round(q05,2), " to ", round(q95,2), ")"),
                                           ifelse(var %in% t3vars_m1, paste0(round(mean_val,1), " (", round(q05,1), " to ", round(q95,1), ")"), NA))))) %>% 
  arrange(match(var, t3vars), match(age, t3age)) %>% 
  select(var, age, source, mean_value) %>% 
  pivot_wider(names_from = source, values_from = mean_value)

x2 <- df_netdaly %>% filter(year == y, cost_cat == "Base case cost assumptions") %>% 
  group_by(source) %>%
  summarize(inc_cost = paste0(round(mean(cost_inc, na.rm = T),1), 
                              " (", round(quantile(cost_inc, 0.05, q = 0.05, na.rm = T),1), " to ", 
                              round(quantile(cost_inc, 0.95, q=0.95, na.rm = T),1), ")"),
            netdaly_averted = paste0(round(mean(netdaly_averted, na.rm = T),1), 
                                     " (", round(quantile(netdaly_averted, 0.05, q = 0.05, na.rm = T),1), " to ", 
                                     round(quantile(netdaly_averted, 0.95, q=0.95, na.rm = T),1), ")"),
            cf_any = pct(mean(cf_netdaly_any, na.rm = T)),
            cf_all = pct(mean(cf_netdaly_all, na.rm = T))) %>%  
  ungroup() %>% 
  select(source, inc_cost, netdaly_averted, cf_any, cf_all) %>% 
  mutate(age = "All") %>% 
  pivot_longer(cols = c(inc_cost, netdaly_averted, cf_any, cf_all), names_to = "var") %>% 
  pivot_wider(names_from = source, values_from = value)

x <- rbind(x1, x2)
write_csv(x, paste0("./results/","htn_", y, ".csv"))

# Table 3: Severe Hypertension
# t3vars_pct <- c("p_htn_true160", "p_hypert160", "p_dx_htn_true160", "p_on_tx_htn160", "p_ever_tx_htn160", "p_hypert_control160")
# 
# t3vars <- c(t3vars_pct)
# t3age <- c("18+", "25-44", "45-64", "65+")
# 
# sev1 <- df_sas %>% filter(year == y, age %in% t3age, var %in% t3vars) %>% 
#   group_by(var, age, source) %>%
#   summarize(mean_val = mean(value, na.rm = T),
#             q05 = quantile(value, 0.05, q = 0.05, na.rm = T), 
#             q95 = quantile(value, 0.95, q=0.95, na.rm = T)) %>%  
#   ungroup() %>% filter(!is.na(mean_val)) %>% 
#   mutate(mean_value = ifelse(var %in% t3vars_pct, paste0(pct(mean_val), " (", pct(q05), " to ", pct(q95), ")"), NA)) %>% 
#   arrange(match(var, t3vars)) %>% 
#   select(var, age, source, mean_value) %>% 
#   pivot_wider(names_from = source, values_from = mean_value)
# 
# # write_csv(sev1, paste0("./results/","sevhtn_", y, ".csv"))

# Table 5
df_netdaly %>% 
  select(m_sbp_4564_23, p_htn_true_4564_23, p_diagnosed_hypert_4564_23, p_on_tx_htn_4564_23, p_hypert_control_4564_23, rate_dead_cvd_4564_23, prevalence1549_23) %>% 
  summary()

df_netdaly_params <- df_netdaly %>% 
  filter(year == y) %>% 
  mutate(sbp_cat = factor(ifelse(m_sbp_4564_23 <132, "<132",
                                 ifelse(m_sbp_4564_23 >=132 & m_sbp_4564_23 <136, "132 to <136", 
                                        ifelse(m_sbp_4564_23 >=136 & m_sbp_4564_23 <140, "136 to <140", 
                                               ifelse(m_sbp_4564_23 >=140 , ">=140", NA)))),
                          levels = c("<132", "132 to <136", "136 to <140", ">=140"),
                          labels = c("<132", "132 to <136", "136 to <140", ">=140")),
         hiv_cat = factor(ifelse(prevalence1549_23 <0.05, "<5%",
                                 ifelse(prevalence1549_23 >=0.05 & prevalence1549_23 <0.10, "5 to <10%", 
                                        ifelse(prevalence1549_23 >=0.10 & prevalence1549_23 <0.15, "10 to <15%", 
                                               ifelse(prevalence1549_23 >=0.15 , ">=15%", NA)))),
                          levels = c("<5%", "5 to <10%", "10 to <15%", ">=15%"),
                          labels = c("<5%", "5 to <10%", "10 to <15%", ">=15%")),
         htn_cat = factor(ifelse(p_htn_true_4564_23 <0.35, "<35%",
                                 ifelse(p_htn_true_4564_23 >=0.35 & p_htn_true_4564_23 <0.43, "35 to <43%", 
                                        ifelse(p_htn_true_4564_23 >=0.43 & p_htn_true_4564_23 <0.50, "43 to <50%", 
                                               ifelse(p_htn_true_4564_23 >=0.50 , ">=50%", NA)))),
                          levels = c("<35%", "35 to <43%", "43 to <50%", ">=50%"),
                          labels = c("<35%", "35 to <43%", "43 to <50%", ">=50%")),
         dx_cat = factor(ifelse(p_diagnosed_hypert_4564_23 <0.22, "<22%",
                                ifelse(p_diagnosed_hypert_4564_23 >=0.22 & p_diagnosed_hypert_4564_23 <0.28, "22 to <28%", 
                                       ifelse(p_diagnosed_hypert_4564_23 >=0.28 & p_diagnosed_hypert_4564_23 <0.36, "28 to <36%", 
                                              ifelse(p_diagnosed_hypert_4564_23 >=0.36 , ">=36%", NA)))),
                         levels = c("<22%", "22 to <28%", "28 to <36%", ">=36%"),
                         labels = c("<22%", "22 to <28%", "28 to <36%", ">=36%")),
         tx_cat = factor(ifelse(p_on_tx_htn_4564_23  <0.04, "<4%",
                                ifelse(p_on_tx_htn_4564_23 >=0.04 & p_on_tx_htn_4564_23 <0.06, "4 to <6%", 
                                       ifelse(p_on_tx_htn_4564_23 >=0.06 & p_on_tx_htn_4564_23 <0.09, "6 to <9%", 
                                              ifelse(p_on_tx_htn_4564_23 >=0.09 , ">=9%", NA)))),
                         levels = c("<4%", "4 to <6%", "6 to <9%", ">=9%"),
                         labels = c("<4%", "4 to <6%", "6 to <9%", ">=9%")),
         ctrl_cat = factor(ifelse(p_hypert_control_4564_23 <0.02, "<2%",
                                  ifelse(p_hypert_control_4564_23 >=0.02 & p_hypert_control_4564_23 <0.04, "2 to <4%", 
                                         ifelse(p_hypert_control_4564_23 >=0.04 & p_hypert_control_4564_23 <0.06, "4 to <6%", 
                                                ifelse(p_hypert_control_4564_23 >=0.06 , ">=6%", NA)))),
                           levels = c("<2%", "2 to <4%", "4 to <6%", ">=6%"),
                           labels = c("<2%", "2 to <4%", "4 to <6%", ">=6%")),
         cvd_cat = factor(ifelse(rate_dead_cvd_4564_23 < 0.4, "<400 per 100,000",
                                 ifelse(rate_dead_cvd_4564_23 >=0.4 & rate_dead_cvd_4564_23 <0.5, "400 to <500 per 100,000", 
                                        ifelse(rate_dead_cvd_4564_23 >=0.5 & rate_dead_cvd_4564_23 <0.6, "500 to <600 per 100,000", 
                                               ifelse(rate_dead_cvd_4564_23 >=0.6 , ">=600 per 100,000", NA)))),
                          levels = c("<400 per 100,000", "400 to <500 per 100,000", "500 to <600 per 100,000", ">=600 per 100,000"),
                          labels = c("<400 per 100,000", "400 to <500 per 100,000", "500 to <600 per 100,000", ">=600 per 100,000")),
         setting_cvd_tx = factor(setting_cvd_tx),
         setting_cvd_tx_eff = factor(setting_cvd_tx_eff),
         setting_prob_htn_link = factor(setting_prob_htn_link)) %>% 
  select(country, source, cost_cat, year, cf_netdaly_any, cf_netdaly_all, sbp_cat, htn_cat, dx_cat, tx_cat, ctrl_cat, cvd_cat, setting_sbp_cal, setting_cvd_tx, setting_cvd_tx_eff, setting_cost_lowqual_cvd, setting_prob_htn_link, hiv_cat)

df_netdaly_paramsbase <- df_netdaly_params %>% filter(cost_cat == "Base case cost assumptions") 

z1 <- df_netdaly_params %>% 
  group_by(source, cost_cat) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Cost scenarios") %>% 
  rename(prop = cost_cat)

# remainder only for cost scenarios = htn total
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, hiv_cat) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "HIV prevalence among age 15-49")  %>% 
  rename(prop = hiv_cat)  %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, setting_cost_lowqual_cvd) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Cost of ineffective emergency CVD care compared to effective care")  %>% 
  rename(prop = setting_cost_lowqual_cvd)  %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, setting_cvd_tx_eff) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Proportion of acute CVD events receiving effective emergency care")  %>% 
  rename(prop = setting_cvd_tx_eff)  %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, setting_cvd_tx) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Proportion of acute CVD events receiving emergency care")  %>% 
  rename(prop = setting_cvd_tx)  %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, setting_sbp_cal) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "SBP rise per decade after 2015",
         setting_sbp_cal = paste0(setting_sbp_cal*40, " mmHg"))  %>% 
  rename(prop = setting_sbp_cal)  %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, cvd_cat) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "CVD mortality rate among adults aged 45-64")  %>% 
  rename(prop = cvd_cat)  %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, ctrl_cat) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Hypertension control among adults aged 45-64")  %>% 
  rename(prop = ctrl_cat) %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, tx_cat) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Hypertension treatment among adults aged 45-64")  %>% 
  rename(prop = tx_cat) %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, dx_cat) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all))) %>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Hypertension diagnosis among adults aged 45-64")  %>% 
  rename(prop = dx_cat) %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, htn_cat) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all)))%>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Hypertension prevalence among adults aged 45-64") %>% 
  rename(prop = htn_cat) %>% 
  rbind(z1)
z1 <- df_netdaly_paramsbase %>% 
  group_by(source, sbp_cat) %>% 
  summarize(n = n(),
            prop = pct(mean(cf_netdaly_all)))%>% 
  pivot_wider(names_from = source, values_from = prop) %>% 
  mutate(parameter = "Mean SBP among adults aged 45-64") %>% 
  rename(prop = sbp_cat) %>% 
  rbind(z1)

z1 <- z1 %>% select(parameter, prop, n, SOC, CCC, CHW)
write_csv(z1, paste0("./results/","cfparams_", y, ".csv"))