library(tidyverse)
require(haven)
library(readxl)
library(stringr)

#### Setup ####

setwd("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration")
pop_factor <- 1

pct <- function(x) {
  y <- paste0(round((x*100),0),"%")
  return(y)
}

#### Import Synthesis output ####
df_sas_wide <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/w_base_105_d3pct.sas7bdat")
df_sas_wide <- df_sas_wide %>% mutate(source = ifelse(option ==1, "SOC",
                                                      ifelse(option ==2, "CCC",
                                                             ifelse(option ==3, "CHW",
                                                                    ifelse(option ==4, "CHW_link", 
                                                                           ifelse(option ==5, "perfect", NA)))))) %>% 
  filter(source == "SOC" | source == "CCC" | source == "CHW")

df_sas_wide <- rename(df_sas_wide, country = run) 
sourcenames <- c("SOC", "CCC", "CHW", "CHW_link", "perfect", "GBD 2015", "central Africa", "eastern Africa", "southern Africa", "western Africa",  "Geldsetzer", "SEARCH (Kenya/Uganda)", "NIDS (South Africa)")
df_sas_wide$source <- as.factor(df_sas_wide$source)
df_sas_wide$source <- factor(df_sas_wide$source, levels = sourcenames)
df_sas_wide <- df_sas_wide %>% 
  select(country, source, ends_with("_15"), ends_with("_23"), ends_with("_73"), ends_with("_2429"), ends_with("_2474")) %>% 
  select(-c(starts_with("p_diag_"), starts_with("p_onart_"), starts_with("p_vg1000"), starts_with("p_vl1000"), starts_with("prevalence_vg1000"), starts_with("prevalence1549m"), starts_with("prevalence1549w"), starts_with("incidence1549"))) %>% 
  rename(setting_sbp_inc = prob_sbp_increase_2474,
         setting_sbp_cal = sbp_cal_eff_2474,
         setting_cvd_tx = rr_cvd_tx_2474,
         setting_cvd_tx_eff = rr_cvd_tx_effective_2474,
         setting_cost_lowqual_cvd = cost_lowqual_cvdcare_2474,
         setting_prob_htn_link = prob_htn_link_2474) %>% 
  select(-c(starts_with("prob_sbp_increase_"), starts_with("sbp_cal_eff_"), starts_with("rr_cvd_tx_"), starts_with("rr_cvd_tx_effective_"), starts_with("prob_htn_link_")))

# select setting level variables at baseline
df_scenario_chars <- df_sas_wide %>% 
  select(country, source, m_sbp_4564_23, p_htn_true_4564_23, p_diagnosed_hypert_4564_23, p_on_tx_htn_4564_23, p_hypert_control_4564_23, rate_dead_cvd_4564_23, starts_with("setting"), prevalence1549_23) %>% 
  group_by(country) %>% 
  fill(m_sbp_4564_23, p_htn_true_4564_23, p_diagnosed_hypert_4564_23, p_on_tx_htn_4564_23, p_hypert_control_4564_23, rate_dead_cvd_4564_23, prevalence1549_23) %>% 
  filter(source == "CHW") %>% 
  select(-c("source"))


# replace _year with .year to facilitate pivot long
names <- colnames(df_sas_wide)

# Define a function to replace underscore with dot
replace_fn <- function(x) {
  x <- gsub("_(?=[0-9]{2,4}$)", ".", x, perl = TRUE)
  return(x)
}
# Split the input string by space
words <- strsplit(names, "\\s+")
# Apply the function to each word
output_names <- lapply(words, replace_fn)
# Join the words back into a string
names2 <- sapply(output_names, paste, collapse = " ")
# assign modified colnames to sas dataframe
colnames(df_sas_wide) <- names2

#####===subset data for country profiles===#####
# uganda  <- df_sas_wide %>% filter(p_hypert_ge18.23 < 0.32,
#                                   p_diagnosed_hypert_ge18.23 < 0.26,
#                                   prevalence1549.23 < 0.19) %>% select(country)
# ug <- left_join(uganda, df_sas_wide, by = "country")
# df_sas_wide <- ug
#####======================================#####

#### pivot to long dataset ####
df_sas <- pivot_longer(df_sas_wide, 
                       cols = matches("\\.[0-9]{2}$|\\.[0-9]{4}$"),
                       names_to = c("var", "year"), 
                       names_sep = "\\.",
                       values_to = "value") %>% 
  filter(!((year == "15" | year == "23") & (source == "CCC" | source == "CHW" | source == "CHW_link" | source == "perfect"))) %>% 
  filter(!is.na(value))

# Scale population size based on country profile
df_sas <- df_sas %>% 
  mutate(value = ifelse(grepl("^n_", var) | grepl("^ddaly", var) | grepl("^dhtn_cost", var) | grepl("^htn_cost", var), value * pop_factor, value))

df_sas <- df_sas %>% 
  mutate(var = ifelse(var == "dhtn_cost_cvdquarter", "dhtn_cost_totcvdquart", var),
         var = ifelse(var == "dhtn_cost_cvd4x", "dhtn_cost_totcvd4x", var))

df_ncdrisc <- read.csv("ncd_risc.csv", header=TRUE)
p_source <- c("country", "source")

# remove extra variables & objects
df_sas <- df_sas %>% select(-c(starts_with("setting"))) 
rm(words, output_names, names, names2)

# sex and age vars
df_sas <- df_sas %>%
  mutate(sex = ifelse(grepl("\\d+m$|_m$", var), "Male",
                      ifelse(grepl("\\d+w$|_w$", var), "Female", "All")))

df_sas <- df_sas %>%
  mutate(age = ifelse(grepl(".*?([0-9]{4}|ge[0-9]{2})(?=m|w|$)", var, perl = TRUE), 
                      gsub(".*?([0-9]{4}|ge[0-9]{2})(?=m|w|$)", "\\1", var, perl = TRUE), 
                      "All"),
         age = gsub("m$", "", age),
         age = gsub("w$", "", age),
         age = gsub("ge18", "18+", age),
         age = gsub("ge65", "65+", age),
         age = gsub("ge80", "80+", age),
         age = gsub("ge85", "85+", age),
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"))

# Var cleanup
df_sas <- df_sas %>% 
  mutate(var = gsub("(_)?[0-9]{4}(m|w)?|(_)?ge[0-9]{2}(m|w)?", "", var))
df_sas <- df_sas %>% 
  filter(!(var %in% c("rate_ihd_one", "rate_cva_one", "rate_ihd_one_modsev", "rate_cva_one_modsev", "death_rate_hiv", 
                      "tot_dyll_cvd", "tot_dyll", "n_dead_allage", "n_dead_hivneg_anycause", "n_dead_hivpos_anycause",
                      "rate_ihd_all", "rate_cva_all", "dcost")))
vars <- df_sas %>% select(var) %>% distinct

write_csv(vars, "data_dictionary.csv")