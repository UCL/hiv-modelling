library(tidyverse)
require(haven)
library(readxl)
library(stringr)
library(knitr)
library(kableExtra)

setwd("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration")
ihme_file <- "IHME-GBD_2019_DATA-ae7f35c6-1.csv"

# Import Synthesis output
df_sas <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/w_base_87.sas7bdat")
df_sas <- df_sas %>% mutate(source = ifelse(option ==1, "SOC",
                                     ifelse(option ==2, "PCC",
                                     ifelse(option ==3, "CHW",
                                     ifelse(option ==4, "CHW_link", NA)))))

df_sas <- rename(df_sas, country = run) 
sourcenames <- c("GBD 2015", "Geldsetzer", "SOC", "PCC", "CHW", "CHW_link")
df_sas$source <- as.factor(df_sas$source)
df_sas$source <- factor(df_sas$source, levels = sourcenames)
df_sas <- df_sas %>% select(country, source, ends_with("_15"), ends_with("_23"), ends_with("_43"), ends_with("_73"), ends_with("_2343"), ends_with("_2373")) %>% 
  rename(setting_sbp_inc = prob_sbp_increase_43,
         setting_sbp_cal = sbp_cal_eff_43,
         setting_cvd_tx = rr_cvd_tx_43,
         setting_cvd_tx_eff = rr_cvd_tx_effective_43) %>% 
  select(-c(starts_with("prob_sbp_increase_"), starts_with("sbp_cal_eff_"), starts_with("rr_cvd_tx_"), starts_with("rr_cvd_tx_effective_")))

key_params <- read_csv("key_model_parameters_10jan2022.csv")
df_ncdrisc <- read.csv("ncd_risc.csv", header=TRUE)
p_source <- c("country", "source")

# Synthesis hypertension prevalence
p_hypert <- c("p_hypert_1524", "p_hypert_2534", "p_hypert_3544", "p_hypert_4554", "p_hypert_5564", "p_hypert_2544", "p_hypert_4564",  "p_hypert_ge65")
df_sas_htn <- df_sas %>% select("country", "source", starts_with(p_hypert))
df_sas_htn_long <- df_sas_htn %>% 
  pivot_longer(cols=3:ncol(df_sas_htn), names_to = "name", values_to = "htn") %>% 
  separate(col = name, into = c("a", "b", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
           age = str_replace(age,"ge65","65+")) %>% 
  select(country, source, age, htn, year) %>% 
  filter(!is.na(htn))

# Synthesis severe hypertension prevalence
df_sas_sevhtn <- df_sas %>% select("country", "source", starts_with("p_hypert160"))
df_sas_sevhtn_long <- df_sas_sevhtn %>% 
  pivot_longer(cols=3:ncol(df_sas_sevhtn), names_to = "name", values_to = "sevhtn") %>% 
  separate(col = name, into = c("a", "b", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge65","65+")) %>% 
  select(country, source, age, sevhtn, year) %>% 
  filter(!is.na(sevhtn))

# Synthesis hypertension TRUE prevalence (true SBP ≥140)
df_sas_htn_true <- df_sas %>% select("country", "source", starts_with("p_htn_true"))
df_sas_htn_true <- df_sas_htn_true %>% 
  pivot_longer(cols=3:ncol(df_sas_htn_true), names_to = "name", values_to = "htn_true") %>% 
  separate(col = name, into = c("a", "b", "c", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge65","65+")) %>% 
  select(country, source, age, htn_true, year) %>% 
  filter(!is.na(htn_true))

# Synthesis diagnosis
p_diagn <- c("country", "source", "p_diagnosed_hypert_1524", "p_diagnosed_hypert_2534", "p_diagnosed_hypert_3544", "p_diagnosed_hypert_4554", "p_diagnosed_hypert_5564", "p_diagnosed_hypert_2544", "p_diagnosed_hypert_4564", "p_diagnosed_hypert_ge65")
df_sas_dx <- df_sas %>% select("country", "source", starts_with(p_diagn))
df_sas_dx_long <- df_sas_dx %>% 
  pivot_longer(cols=3:ncol(df_sas_htn), names_to = "name", values_to = "dx") %>% 
  separate(col = name, into = c("a", "b", "c", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge65","65+")) %>% 
  select(country, source, age, dx, year) %>% 
  filter(!is.na(dx))

# # Synthesis TRUE diagnosis
df_sas_dx_true <- df_sas %>% select(all_of(p_source), starts_with("p_dx_htn_true"))
df_dx_true <- df_sas_dx_true %>% 
  pivot_longer(cols=3:ncol(df_sas_dx_true), names_to = "name", values_to = "dx_true") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge65","65+")) %>% 
  select(country, source, age, dx_true, year) %>% 
  filter(!is.na(dx_true))

# Synthesis OVER diagnosis
df_sas_dx_over <- df_sas %>% select(all_of(p_source), starts_with("p_dx_htn_over"))
df_dx_over <- df_sas_dx_over %>% pivot_longer(cols=3:ncol(df_sas_dx_over), names_to = "name", values_to = "dx_over") %>% 
    separate(col = name, into = c("a", "b", "c", "d", "age", "year"), sep = "_", fill = "right") %>% 
    mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
           age = str_replace(age,"ge65","65+")) %>% 
    select(country, source, age, dx_over, year) %>% 
    filter(!is.na(dx_over))
  
# Synthesis current treatment
p_tx <- c("p_on_anti_hypert_1524", "p_on_anti_hypert_2534", "p_on_anti_hypert_3544", "p_on_anti_hypert_4554", "p_on_anti_hypert_5564", "p_on_anti_hypert_2544", "p_on_anti_hypert_4564", "p_on_anti_hypert_ge65")
df_sas_tx <- df_sas %>% select("country", "source", starts_with(p_tx))
df_sas_tx_long <- pivot_longer(df_sas_tx, cols=3:ncol(df_sas_tx), names_to = "name", values_to = "tx") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge65","65+")) %>% 
  select(country, source, age, tx, year) %>% 
  filter(!is.na(tx))

# Synthesis ever treatment
p_tx_ever <- c("p_ever_anti_hypert_1524", "p_ever_anti_hypert_2534", "p_ever_anti_hypert_3544", "p_ever_anti_hypert_4554", "p_ever_anti_hypert_5564", "p_ever_anti_hypert_2544", "p_ever_anti_hypert_4564", "p_ever_anti_hypert_ge65")
df_sas_tx_ever <- df_sas %>% select("country", "source", starts_with(p_tx_ever))
df_sas_tx_ever_long <- pivot_longer(df_sas_tx_ever, cols=3:ncol(df_sas_tx_ever), names_to = "name", values_to = "tx_ever") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge65","65+")) %>% 
  select(country, source, age, tx_ever, year) %>% 
  filter(!is.na(tx_ever))

# Synthesis hypertension control
p_ctrl <- c("p_hypert_control_1524", "p_hypert_control_2534", "p_hypert_control_3544", "p_hypert_control_4554", "p_hypert_control_5564", "p_hypert_control_2544", "p_hypert_control_4564", "p_hypert_control_ge65")
df_sas_ctrl <- df_sas %>% select("country", "source", starts_with(p_ctrl))
df_sas_ctrl_long <- pivot_longer(df_sas_ctrl, cols=3:ncol(df_sas_ctrl), names_to = "name", values_to = "control") %>% 
  separate(col = name, into = c("a", "b", "c", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge65","65+")) %>% 
  select(country, source, age, control, year) %>% 
  filter(!is.na(control))

# Synthesis mortality
df_cvd_dead_r <- df_sas %>% select("country", "source", starts_with("rate_dead_cvd"))
df_cvd_dead_r_long <- pivot_longer(df_cvd_dead_r, cols=3:ncol(df_cvd_dead_r), names_to = "name", values_to = "cvd_death_rate") %>%  
  separate(col = name, into = c("a", "b", "c", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(year = ifelse(is.na(year), age, year),
         age = ifelse(year == age, "All", age),
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         sex = ifelse(str_detect(age, "m"), "Male", 
               ifelse(str_detect(age, "w"), "Female", 
               ifelse(str_detect(age, "All"), "All", NA))),
         age = str_remove_all(age, "w"),
         age = str_remove_all(age, "m"),
         age = str_replace(age,"ge80","80+"),
         region = source) %>% 
  select(country, source, region, age, sex, cvd_death_rate, year) %>% 
  filter(!is.na(cvd_death_rate))

df_cvd_dead_n <- df_sas %>% select("country", "source", starts_with("n_dead_cvd"))
df_cvd_dead_n_long <- pivot_longer(df_cvd_dead_n, cols=3:ncol(df_cvd_dead_n), names_to = "name", values_to = "cvd_death_n")  %>% 
  separate(col = name, into = c("a", "b", "c", "year"), sep = "_", fill = "right") %>% 
  select(country, source, cvd_death_n, year) %>% 
  filter(!is.na(cvd_death_n))

df_deadr_all <- df_sas %>% select("country", "source", starts_with("rate_dead_all_anycause"))
df_deadr_all_long <- pivot_longer(df_deadr_all, cols=3:ncol(df_deadr_all), names_to = "name", values_to = "death_rate") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "year"), sep = "_", fill = "right") %>% 
  select(country, source, death_rate, year) %>% 
  filter(!is.na(death_rate))

df_deadr_hivneg <- df_sas %>% select("country", "source", starts_with("rate_dead_hivneg_anycause"))
df_deadr_hivneg_long <- pivot_longer(df_deadr_hivneg, cols=3:ncol(df_deadr_hivneg), names_to = "name", values_to = "death_rate") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "year"), sep = "_", fill = "right") %>% 
  select(country, source, death_rate, year) %>% 
  filter(!is.na(death_rate))

df_deadn_hivneg <- df_sas %>% select("country", "source", starts_with("n_dead_hivneg_anycause"))
df_deadn_hivneg_long <- pivot_longer(df_deadn_hivneg, cols=3:ncol(df_deadn_hivneg), names_to = "name", values_to = "n_dead") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "year"), sep = "_", fill = "right") %>% 
  select(country, source, n_dead, year) %>% 
  filter(!is.na(n_dead))

df_deadr_hivpos <- df_sas %>% select("country", "source", starts_with("rate_dead_hivpos_anycause"))
df_deadr_hivpos_long <- pivot_longer(df_deadr_hivpos, cols=3:ncol(df_deadr_hivpos), names_to = "name", values_to = "death_rate") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "year"), sep = "_", fill = "right") %>% 
  select(country, source, death_rate, year) %>% 
  filter(!is.na(death_rate))

df_deadcvdr_hivpos <- df_sas %>% select("country", "source", starts_with("rate_dead_hivpos_cvd"))
df_deadcvdr_hivpos_long <- pivot_longer(df_deadcvdr_hivpos, cols=3:ncol(df_deadcvdr_hivpos), names_to = "name", values_to = "cvd_death_rate") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "year"), sep = "_", fill = "right") %>% 
  select(country, source, cvd_death_rate, year) %>% 
  filter(!is.na(cvd_death_rate))

df_deadn_hivpos <- df_sas %>% select("country", "source", starts_with("n_dead_hivpos_anycause"))
df_deadn_hivpos_long <- pivot_longer(df_deadn_hivpos, cols=3:ncol(df_deadn_hivpos), names_to = "name", values_to = "n_dead") %>% 
  separate(col = name, into = c("a", "b", "c", "d", "year"), sep = "_", fill = "right") %>% 
  select(country, source, n_dead, year) %>% 
  filter(!is.na(n_dead))

df_dyll <- df_sas %>% select("country", "source", starts_with("tot_dyll")) %>% 
  rename(tot_dyll_all_15 = tot_dyll_15, tot_dyll_all_23 = tot_dyll_23, tot_dyll_all_43 = tot_dyll_43, tot_dyll_all_73 = tot_dyll_73, tot_dyll_all_2343 = tot_dyll_2343, tot_dyll_all_2373 = tot_dyll_2373)
df_dyll_long <- pivot_longer(df_dyll, cols=3:ncol(df_dyll), names_to = "name", values_to = "dyll") %>% 
  separate(col = name, into = c("a", "b", "type", "year"), sep = "_", fill = "right") %>% 
  select(country, source, dyll, type, year) %>% 
  mutate(dyll = dyll / 1000) %>% 
  filter(!is.na(dyll))

df_ddaly <- df_sas %>% select("country", "source", starts_with("ddaly"))
df_ddaly_long <- pivot_longer(df_ddaly, cols=3:ncol(df_ddaly), names_to = "name", values_to = "ddaly") %>% 
  separate(col = name, into = c("a", "year"), sep = "_", fill = "right") %>% 
  select(country, source, ddaly, year) %>% 
  mutate(ddaly = ddaly / 1000) %>% 
  filter(!is.na(ddaly))

# Synthesis mean SBP
m_sbp_w <- c("country", "source", "m_sbp_1519w", "m_sbp_2024w", "m_sbp_2529w", "m_sbp_3034w", "m_sbp_3539w", "m_sbp_4044w", "m_sbp_4549w", "m_sbp_5054w", "m_sbp_5559w", "m_sbp_6064w", "m_sbp_6569w", "m_sbp_7074w", "m_sbp_7579w", "m_sbp_ge80w")
m_sbp_m <- c("country", "source", "m_sbp_1519m", "m_sbp_2024m", "m_sbp_2529m", "m_sbp_3034m", "m_sbp_3539m", "m_sbp_4044m", "m_sbp_4549m", "m_sbp_5054m", "m_sbp_5559m", "m_sbp_6064m", "m_sbp_6569m", "m_sbp_7074m", "m_sbp_7579m", "m_sbp_ge80m")
m_sbp_all <- c("country", "source", "m_sbp_1519_", "m_sbp_2024_", "m_sbp_2529_", "m_sbp_3034_", "m_sbp_3539_", "m_sbp_4044_", "m_sbp_4549_", "m_sbp_5054_", "m_sbp_5559_", "m_sbp_6064_", "m_sbp_6569_", "m_sbp_7074_", "m_sbp_7579_", "m_sbp_ge80_", "m_sbp_2544_", "m_sbp_4564_", "m_sbp_ge65_")
df_sas_sbp <- df_sas %>% select(starts_with(m_sbp_all))
df_sas_sbp_w <- df_sas %>% select(starts_with(m_sbp_w))
df_sas_sbp_m <- df_sas %>% select(starts_with(m_sbp_m))

# Mean SBP Women
df_sas_sbp_w_long <- pivot_longer(df_sas_sbp_w, cols=3:ncol(df_sas_sbp_w), names_to = "name", values_to = "sbp") %>% 
  separate(col = name, into = c("a", "b", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(gender = "Women",
         age = str_remove_all(age, "w"),
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge80","80+")) %>% 
  select(country, source, age, gender, sbp, year) %>% 
  filter(!is.na(sbp))

# Mean SBP men
cols <- ncol(df_sas_sbp_m)
df_sas_sbp_m_long <- pivot_longer(df_sas_sbp_m, cols=3:cols, names_to = "name", values_to = "sbp") %>% 
  separate(col = name, into = c("a", "b", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(gender = "Men",
         age = str_remove_all(age, "m"),
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge80","80+")) %>% 
  select(country, source, age, gender, sbp, year) %>% 
  filter(!is.na(sbp))

# Mean SBP All
cols <- ncol(df_sas_sbp)
df_sas_sbp_long <- pivot_longer(df_sas_sbp, cols=3:cols, names_to = "name", values_to = "sbp") %>% 
  separate(col = name, into = c("a", "b", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(gender = "All",
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         age = str_replace(age,"ge65","65+"), 
         age = str_replace(age,"ge80","80+")) %>% 
  select(country, source, age, gender, sbp, year) %>% 
  filter(!is.na(sbp))

# CVD events
df_sas_cvd <- df_sas %>% select("country", "source", starts_with(c("rate_ihd", "rate_cva")))
cols <- ncol(df_sas_cvd)
df_sas_cvd_long <- pivot_longer(df_sas_cvd, cols=3:cols, names_to = "name", values_to = "value") %>% 
  separate(col = name, into = c("a", "cause", "type", "b", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(year = ifelse(is.na(year), age, year),
         year = ifelse(is.na(year), b, year),
         age = ifelse(is.na(age), "All", age),
         age = ifelse(age == year & b == "modsev", "All", age),
         age = ifelse(year == age, b, age),
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         sex = ifelse(str_detect(age, "m"), "Male", 
                      ifelse(str_detect(age, "w"), "Female", 
                             ifelse(str_detect(age, "All"), "All", NA))),
         age = str_remove_all(age, "w"),
         age = str_remove_all(age, "m"),
         age = str_replace(age,"ge80","80+"),
         cause = ifelse(cause == "ihd", "Ischemic heart disease", cause),
         cause = ifelse(cause == "cva", "Stroke", cause),
         region = source,
         measure = "Incidence",
         b = ifelse(b == "modsev", "modsev", "all")) %>% 
  rename(sev = b) %>% 
  select(measure, country, source, region, sex, age, cause, type, sev, value, year) %>% 
  filter(!is.na(value))

df_sas_cvd_prev <- df_sas %>% select("country", "source", starts_with(c("prev_ihd_", "prev_cva_")))
cols <- ncol(df_sas_cvd_prev)
df_sas_cvd_p_long <- pivot_longer(df_sas_cvd_prev, cols=3:cols, names_to = "name", values_to = "value") %>% 
  separate(col = name, into = c("a", "cause", "age", "year"), sep = "_", fill = "right") %>% 
  mutate(year = ifelse(is.na(year), age, year),
         age = ifelse(year == age, "All", age),
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         sex = ifelse(str_detect(age, "m"), "Male", 
                      ifelse(str_detect(age, "w"), "Female", 
                             ifelse(str_detect(age, "All"), "All", NA))),
         age = str_remove_all(age, "w"),
         age = str_remove_all(age, "m"),
         age = str_replace(age,"ge80","80+"),
         cause = ifelse(cause == "ihd", "Ischemic heart disease", cause),
         cause = ifelse(cause == "cva", "Stroke", cause),
         region = source,
         measure = "Prevalence",
         value = value * 100,
         sev = "all",
         type = NA) %>% 
  select(measure, country, source, region, sex, age, cause, value, year, sev, type) %>% 
  filter(!is.na(value))


### EXTERNAL DATA ###
# Import Geldsetzer Lancet 2019 country data on treatemnt/control (not age-stratified)
df_ssa_txctrl <- read.delim(file = "geldsetzer_tx_data.txt", sep = "", header = TRUE)
df_ssa_txctrl <- df_ssa_txctrl %>% 
  rename(country = Country, tx = Medication, tx_95ci = X.95.CI..3, control = Controlled, control_95ci = X.95.CI..5) %>% 
  mutate(tx = tx/100, 
         control = control/100,
         source = "Geldsetzer",
         year = "15",
         age = "All")
df_ssa_tx <- df_ssa_txctrl %>% select(country, age, source, tx, year)
df_ssa_ctrl <- df_ssa_txctrl %>% select(country, age, source, control, year)

# Import Geldsetzer Lancet 2019 country age-stratified data and select SSA countries
df_data <- read.delim(file = "geldsetzer_country_data.txt", sep = "", header = FALSE)
df_data <- df_data[c("V1", "V2", "V3", "V6")]
df_data = df_data %>% rename(country = V1, age = V2, htn = V3, htn_undx = V6) %>% 
  mutate(dx = (1 -  htn_undx / htn),
         htn = htn/100,
         country = as.character(country),
         age = as.character(age),
         age = ifelse(age== "18-24", "15-24", age),
         age = ifelse(age== "23-24", "15-24", age),
         age = ifelse(age== "24-24", "15-24", age),
         age = ifelse(age== "55-59", "55-64", age),
         age = ifelse(age== "65-69", "65+", age),
         age = ifelse(age== "65-70", "65+", age),
         source = "Geldsetzer",
         year = "15") %>% 
  select(country, age, htn, dx, source, year)

df_country <- data.frame(country = as.character(c("Benin", "BurkinaFaso", "Ghana", "Kenya", "Lesotho", "Liberia", "Mozamb.", "Namibia", "SouthAfrica", "Swaziland", "Tanzania", "Timor-Leste", "Togo", "Uganda", "Zanzibar")))
df_ssa <- inner_join(df_country, df_data, by="country")
df_ssa_htn <-  df_ssa %>% select(country, age, htn, source, year)
df_ssa_dx  <-  df_ssa %>% select(country, age, dx, source, year)

# # Import Forouzanfar JAMA 2017 SBP country data country data and select SSA countries
data_sbp <- read_excel("IHME_GBD_2015_SBP_110_115_MM_HG_HYPERTENSION_1990_2015_ETABLE_2_Y2017M01D10.XLSX", sheet="raw")
df_data_sbp <- as.data.frame(data_sbp)
df_data_sbp <- df_data_sbp[c("location_name", "age_name", "val_1_2015", "val_2_2015")]
df_data_sbp <- df_data_sbp %>% filter(age_name != "Age-standardized")
countries_ssa <- read.delim(file = "countries_ssa.txt", sep = ";", header = FALSE)
countries_ssa <- countries_ssa[['V1']]
df_ssa_sbp <- df_data_sbp %>% subset(location_name %in% countries_ssa)
df_ssa_sbp %>% count(location_name)
df_ssa_sbp <- df_ssa_sbp %>% 
  rename(country = location_name, age = age_name) %>% 
  mutate(source = "GBD 2015",
         year = "15",
         sbp_men = as.numeric(word(df_ssa_sbp$val_1_2015,1,sep = "\u000D")),
         sbp_women = as.numeric(word(df_ssa_sbp$val_2_2015,1,sep = "\u000D")),
         age = str_remove_all(age, " years"))

df_ssa_sbp_m = df_ssa_sbp %>% select(country, age, sbp_men, source, year) %>% 
  mutate(gender = "Men") %>% 
  rename(sbp = sbp_men)
df_ssa_sbp_w = df_ssa_sbp %>% select(country, age, sbp_women, source, year) %>% 
  mutate(gender = "Women") %>% 
  rename(sbp = sbp_women)

# IHME 2019 GBD data on mortality
df_ihme <- read_csv(ihme_file) 
ssa_central <- c("Angola", "Central African Republic", "Congo", "Democratic Republic of the Congo", "Equatorial Guinea", "Gabon")
ssa_eastern <- c("Burundi", "Comoros", "Djibouti", "Eritrea", "Ethiopia", "Kenya", "Madagascar", "Malawi", "Mozambique", "Rwanda", "Somalia", "South Sudan", "Uganda", "United Republic of Tanzania", "Zambia")
ssa_southern <- c("Botswana", "Eswatini", "Lesotho", "Namibia", "South Africa", "Zimbabwe")
ssa_western <- c("Benin", "Burkina Faso", "Cabo Verde", "Cameroon", "Chad", "Côte d'Ivoire", "Gambia", "Ghana", "Guinea", "Guinea-Bissau", "Liberia", "Mali", "Mauritania", "Niger", "Nigeria", "Sao Tome and Principe", "Senegal", "Sierra Leone", "Togo")
ssa_all <- c(ssa_western, ssa_eastern, ssa_southern, ssa_central)
df_ihme_country <- df_ihme %>% 
  filter(location %in% ssa_all) %>% 
  mutate(region = ifelse(location %in% ssa_central, "Central SSA",
                         ifelse(location %in% ssa_eastern, "Eastern SSA",
                                ifelse(location %in% ssa_southern, "Southern SSA",
                                       ifelse(location %in% ssa_western, "Western SSA", NA)))),
         age = paste0("yr", age),
         age = str_remove(age, " years"),
         age = str_remove(age, "-"))

df_ihme_country %>% group_by(region, location) %>% count() %>% print(n=50)
df_ihme_country <- df_ihme_country %>% 
  mutate(val = ifelse(val ==0, NA, val),
         upper = ifelse(upper ==0, NA, upper),
         lower = ifelse(lower ==0, NA, lower))

df_ihme_cvdeath <- df_ihme_country %>% 
  filter(measure == "Deaths", cause == "Cardiovascular diseases") %>% 
  select(location, region, sex, age, val, year, measure, cause) %>% 
  pivot_wider(names_from = age, values_from = val) %>% 
  rowwise() %>% 
  mutate(yr3039 = mean(c(yr3034, yr3539)),
         yr4049 = mean(c(yr4044, yr4549)),
         yr5059 = mean(c(yr5054, yr5559)),
         yr6069 = mean(c(yr6064, yr6569)),
         yr7079 = mean(c(yr7074, yr7579))) %>% 
  select(location, region, sex, 'yr20+', yr3039, yr4049, yr5059, yr6069, yr7079, year) %>% 
  pivot_longer(cols = c('yr20+', yr3039, yr4049, yr5059, yr6069, yr7079),
               names_to = "age") %>% 
  mutate(age = str_remove(age, "yr"),
         value = value / 1000,
         source = "SSA") %>% 
  rename(country = location,
         cvd_death_rate = value)

df_ihme_sas_cvd_death <- rbind(df_cvd_dead_r_long, df_ihme_cvdeath) %>% 
  filter(year == "2019" | year == "15") %>% 
  filter(age != "80+") %>% 
  filter(source %in% c("SOC", "SSA"))

df_ihme_cvevent <- df_ihme_country %>% 
  filter(cause != "Cardiovascular diseases") %>% 
  select(location, region, sex, age, val, year, measure, cause) %>% 
  pivot_wider(names_from = age, values_from = val) %>% 
  rowwise() %>% 
  mutate(yr3039 = mean(c(yr3034, yr3539)),
         yr4049 = mean(c(yr4044, yr4549)),
         yr5059 = mean(c(yr5054, yr5559)),
         yr6069 = mean(c(yr6064, yr6569)),
         yr7079 = mean(c(yr7074, yr7579))) %>% 
  select(measure, location, region, sex, cause, 'yr20+', yr3039, yr4049, yr5059, yr6069, yr7079, 'yr80+', year) %>% 
  pivot_longer(cols = c('yr20+', yr3039, yr4049, yr5059, yr6069, yr7079, 'yr80+'),
               names_to = "age") %>% 
  mutate(age = str_remove(age, "yr"),
         value = value / 1000,
         source = "SSA") %>% 
  rename(country = location) %>% 
  mutate(type = "all",
         sev = "all")

df_ihme_sas_cvd_inc <- rbind(df_sas_cvd_long, df_ihme_cvevent) %>% 
  filter(measure == "Incidence")  %>% 
  filter(age %in% c("4049", "5059", "6069", "7079", "80+"))

df_ihme_sas_cvd_prev <- rbind(df_sas_cvd_p_long, df_ihme_cvevent) %>% 
  filter(measure == "Prevalence")  %>% 
  filter(age %in% c("4049", "5059", "6069", "7079", "80+"))



# Append Synthesis data to STEPS data from Geldsetzer for hypertension prevalence (htn) and diagnosis (dx)
df_htn <- rbind(df_ssa_htn, df_sas_htn_long)
df_htn <- df_htn %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_dx <- rbind(df_ssa_dx, df_sas_dx_long)
df_dx <- df_dx %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_tx <- rbind(df_ssa_tx, df_sas_tx_long)
df_tx <- df_tx %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_ctrl <- rbind(df_ssa_ctrl, df_sas_ctrl_long)
df_ctrl <- df_ctrl %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_sbp_m <- rbind(df_ssa_sbp_m, df_sas_sbp_m_long)
df_sbp_m <- df_sbp_m %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_sbp_w <- rbind(df_ssa_sbp_w, df_sas_sbp_w_long)
df_sbp_w <- df_sbp_w %>% 
  mutate(age = as.factor(age),
       source = factor(source, levels = sourcenames))

# CVD risk reduction
df_cvdevent_rr <- df_sas_cvd_long %>% 
  filter(year == "2343" | year == "2373") %>% 
  pivot_wider(id_cols = c(country, age, sex, year, cause, type, sev),
              names_from = c(source),
              values_from = value) %>% 
  mutate(PCC.rr = PCC / SOC,
         CHW.rr = CHW / SOC,
         CHW_link.rr = CHW_link / SOC) %>%
  select(country, age, sex, year,cause, type, sev, PCC.rr, CHW.rr, CHW_link.rr) %>% 
  pivot_longer(cols = c(PCC.rr, CHW.rr, CHW_link.rr),
               values_to = "cvd_event_rr") %>% 
  separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
  mutate(source = factor(source, levels = sourcenames))

# Mortality
df_cvd_summ <- df_cvd_dead_r_long %>% 
  filter(year == "2343" | year == "2373") %>% 
  pivot_wider(id_cols = c(country, age, sex, year),
              names_from = c(source),
              values_from = cvd_death_rate) %>% 
  mutate(PCC.abs = PCC - SOC,
         CHW.abs = CHW - SOC,
         CHW_link.abs = CHW_link - SOC,
         PCC.rr = PCC / SOC,
         CHW.rr = CHW / SOC,
         CHW_link.rr = CHW_link / SOC) %>%
select(country, age, sex, year, PCC.abs, CHW.abs, CHW_link.abs, PCC.rr, CHW.rr, CHW_link.rr) %>% 
  pivot_longer(cols = c(PCC.abs, CHW.abs, CHW_link.abs, PCC.rr, CHW.rr, CHW_link.rr),
               values_to = "cvd_risk_reduction") %>% 
  separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
  mutate(source = factor(source, levels = sourcenames))

df_acmort_hivpos <- df_deadr_hivpos_long %>% 
  filter(year == "2343" | year == "2373") %>% 
  pivot_wider(id_cols = c(country, year),
              names_from = c(source),
              values_from = death_rate) %>% 
  mutate(PCC.rr = PCC / SOC,
         CHW.rr = CHW / SOC,
         CHW_link.rr = CHW_link / SOC) %>%
  select(country, year, PCC.rr, CHW.rr, CHW_link.rr) %>% 
  pivot_longer(cols = c(PCC.rr, CHW.rr, CHW_link.rr),
               values_to = "mortality_rr") %>% 
  separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
  mutate(source = factor(source, levels = sourcenames))

df_cvdmort_hivpos <- df_deadcvdr_hivpos_long %>% 
  filter(year == "2343" | year == "2373") %>% 
  pivot_wider(id_cols = c(country, year),
              names_from = c(source),
              values_from = cvd_death_rate) %>% 
  mutate(PCC.rr = PCC / SOC,
         CHW.rr = CHW / SOC,
         CHW_link.rr = CHW_link / SOC) %>%
  select(country, year, PCC.rr, CHW.rr, CHW_link.rr) %>% 
  pivot_longer(cols = c(PCC.rr, CHW.rr, CHW_link.rr),
               values_to = "cvd_mortality_rr") %>% 
  separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
  mutate(source = factor(source, levels = sourcenames))

df_acmort_hivneg <- df_deadr_hivneg_long %>% 
  filter(year == "2343" | year == "2373") %>% 
  pivot_wider(id_cols = c(country, year),
              names_from = c(source),
              values_from = death_rate) %>% 
  mutate(PCC.rr = PCC / SOC,
         CHW.rr = CHW / SOC,
         CHW_link.rr = CHW_link / SOC) %>%
  select(country, year, PCC.rr, CHW.rr, CHW_link.rr) %>% 
  pivot_longer(cols = c(PCC.rr, CHW.rr, CHW_link.rr),
               values_to = "mortality_rr") %>% 
  separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
  mutate(source = factor(source, levels = sourcenames))

df_acmort_all <- df_deadr_all_long %>% 
  filter(year == "2343" | year == "2373") %>% 
  pivot_wider(id_cols = c(country, year),
              names_from = c(source),
              values_from = death_rate) %>% 
  mutate(PCC.rr = PCC / SOC,
         CHW.rr = CHW / SOC,
         CHW_link.rr = CHW_link / SOC) %>%
  select(country, year, PCC.rr, CHW.rr, CHW_link.rr) %>% 
  pivot_longer(cols = c(PCC.rr, CHW.rr, CHW_link.rr),
               values_to = "mortality_rr") %>% 
  separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
  mutate(source = factor(source, levels = sourcenames))

df_dyll_all <- df_dyll_long %>%
  filter(year == "2373") %>%
  pivot_wider(        id_cols = c(country, type),
                      names_from = c(source, year),
                      values_from = dyll) %>%
  mutate(PCC = PCC_2373 - SOC_2373,
         CHW = CHW_2373 - SOC_2373,
         CHW_link = CHW_link_2373 - SOC_2373) %>%
  select(country, type, PCC, CHW, CHW_link)
df_dyll_summ <- df_dyll_all %>%
  pivot_longer(cols = c(PCC, CHW, CHW_link),
               values_to = "dyll_reduction") %>%
  rename(source = name) %>%
  mutate(source = factor(source, levels = sourcenames))

df_ddaly_all <- df_ddaly_long %>%
  filter(year != "15" & year != "22") %>% 
  pivot_wider(        id_cols = c(country, year),
                      names_from = c(source),
                      values_from = ddaly) %>%
  mutate(PCC_avert = PCC - SOC,
         CHW_avert = CHW - SOC,
         CHW_link_avert = CHW_link - SOC) %>%
  select(country, year, PCC_avert, CHW_avert, CHW_link_avert) %>% 
  mutate(PCC = PCC_avert,
         CHW = CHW_avert,
         CHW_link = CHW_link_avert) %>% 
  select(country, year, PCC, CHW, CHW_link)
df_ddaly_summ <- df_ddaly_all %>%
  pivot_longer(cols = c(PCC, CHW, CHW_link),
               values_to = "ddaly_reduction") %>%
  rename(source = name) %>%
  mutate(source = factor(source, levels = sourcenames))

# Cost
df_cost <- df_sas %>% select("country", "source", starts_with("htn_cost_"))
cols <- ncol(df_cost)
df_cost_long <- df_cost %>%
  pivot_longer(cols=3:cols, names_to = "name", values_to = "cost") %>%
  separate(col = name, into = c("a", "b", "cost_cat", "year"), sep = "_", fill = "right") %>%
  mutate(cost_cat = ifelse(a == "cost", "Total cost", cost_cat),
         cost_cat = ifelse(cost_cat == "total", "total htn", cost_cat),
         year = ifelse(a == "cost", b, year)) %>%
  select(country, source, cost_cat, cost, year) %>%
  mutate(cost_cat = ifelse(cost_cat == "total", "total htn", cost_cat)) %>%
  filter(!is.na(cost)) %>% 
  filter(year == 2373 | year == 2373)

df_dcost <- df_sas %>% select("country", "source", starts_with("dhtn_cost_"), starts_with("dcost_"))
cols <- ncol(df_dcost)
df_dcost_long <- df_dcost %>%
  pivot_longer(cols=3:cols, names_to = "name", values_to = "dcost") %>% 
  separate(col = name, into = c("a", "b", "dcost_cat", "year"), sep = "_", fill = "right") %>%
  mutate(dcost_cat = ifelse(a == "dcost", "total cost", dcost_cat),
         dcost_cat = ifelse(dcost_cat == "total", "total htn", dcost_cat),
         dcost_cat = ifelse(dcost_cat == "totdrughalf", "total (half drug cost)", dcost_cat),
         dcost_cat = ifelse(dcost_cat == "totdrugdoub", "total (double drug cost)", dcost_cat),
         dcost_cat = ifelse(dcost_cat == "tothalf", "total htn (50%)", dcost_cat),
         dcost_cat = ifelse(dcost_cat == "totdoub", "total htn (200%)", dcost_cat),
         year = ifelse(a == "dcost", b, year)) %>%
  select(country, source, dcost_cat, dcost, year) %>%
  mutate(dcost_cat = ifelse(dcost_cat == "total", "total htn", dcost_cat),
         dcost_cat = factor(dcost_cat,
                            levels = c("scr", "clin", "drug", "cvd", "total htn", "total cost", "total (half drug cost)", "total (double drug cost)", "total htn (50%)", "total htn (200%)"),
                            labels = c("scr", "clin", "drug", "cvd", "total htn", "total cost", "total (half drug cost)", "total (double drug cost)", "total htn (50%)", "total htn (200%)"))) %>%
  filter(!is.na(dcost)) %>% 
  filter(year == 2343 | year == 2373)

# ICER
df_dcost_icer <- df_dcost_long %>%
  filter(dcost_cat %in% c("total htn", "total (half drug cost)", "total (double drug cost)", "total htn (50%)", "total htn (200%)")) %>%
  select(country, source, dcost_cat, dcost, year) %>%
  pivot_wider(id_cols = c(country, year, dcost_cat),
              names_from = c(source),
              values_from = dcost) %>% 
  mutate(PCC = PCC - SOC,
         CHW = CHW - SOC,
         CHW_link = CHW_link - SOC,
         SOC = 0) %>% 
  pivot_longer(cols = c(PCC, CHW, CHW_link),
               values_to = "cost") %>%
  rename(source = name) %>%
  mutate(source = factor(source, levels = sourcenames))

df_icer <- left_join(df_ddaly_summ, df_dcost_icer, by = c("country", "source", "year")) %>%
  filter(year %in% c("2343", "2373")) %>% 
  rename(ddaly_averted = ddaly_reduction) %>%
  mutate(ddaly_averted = ddaly_averted *-1,
         icer = (cost*1000000) / (ddaly_averted*1000),
         netdaly_averted = ddaly_averted - ((cost*1000)/500),
         cf_netdaly = ifelse(netdaly_averted >=0 & ddaly_averted >=0, 1, 0))

df_icer_wide <- df_icer %>% 
  pivot_wider(id_cols = c(country, year, dcost_cat),
              names_from = c(source),
              values_from = netdaly_averted) %>% 
  mutate(SOC = 0,
         cf = ifelse(SOC > PCC & SOC > CHW & SOC > CHW_link, "SOC",
              ifelse(PCC > SOC & PCC > CHW & PCC > CHW_link, "PCC",
              ifelse(CHW > SOC & CHW > PCC & CHW > CHW_link, "CHW",
              ifelse(CHW_link > SOC & CHW_link > PCC & CHW_link > CHW, "CHW_link", NA)))),
         SOC = ifelse(cf == "SOC", 1, 0),
         PCC = ifelse(cf == "PCC", 1, 0),
         CHW = ifelse(cf == "CHW", 1, 0),
         CHW_link = ifelse(cf == "CHW_link", 1, 0)) %>% 
  pivot_longer(cols = c(SOC, PCC, CHW, CHW_link),
               values_to = "cost_effective") %>% 
  rename(source = name)

df_icer_summ <- df_icer %>%
  filter(dcost_cat == "total htn") %>% 
  group_by(source) %>%
  summarize(dcost_mean = round(mean(cost),1), 
            dcost_q05 = round(quantile(cost,0.05),1),
            dcost_q95 = round(quantile(cost,0.95),1),
            ddaly_mean = round(mean(ddaly_averted),1),
            ddaly_q05 = round(quantile(ddaly_averted,0.05),1),
            ddaly_q95 = round(quantile(ddaly_averted,0.95),1),
            netddaly_mean = round(mean(netdaly_averted),1),
            netddaly_q05 = round(quantile(netdaly_averted,0.05),1),
            netddaly_q95 = round(quantile(netdaly_averted,0.95),1)) %>%
  rbind(as.data.frame(list(
    source = "SOC",
    dcost_mean = 0, 
    dcost_q05 = 0,
    dcost_q95 = 0,
    ddaly_mean = 0,
    ddaly_q05 = 0,
    ddaly_q95 = 0,
    netddaly_mean = 0,
    netddaly_q05 = 0,
    netddaly_q95 = 0))) %>%
  mutate(source = factor(source, levels = sourcenames)) %>% 
  arrange(source)

# Setting scenario characteristics
df_sas %>% select(country, source, p_hypert_4564_15, p_hypert_4564_23)
df_scenario_chars <- df_sas %>% 
  filter(source == "SOC") %>%
  select(country, m_sbp_4564_23, p_hypert_4564_23, p_diagnosed_hypert_4564_23, p_on_anti_hypert_4564_23, p_hypert_control_4564_23, rate_dead_cvd_4059_23, starts_with("setting"), prevalence1549_23)
df_netdaly_params <- merge(df_icer, df_scenario_chars, by="country")
df_cf_params <- merge(df_icer_wide, df_scenario_chars, by="country")

save.image("SynthesisHTN.RData")

