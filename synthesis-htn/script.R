library(tidyverse)
require(haven)
library(readxl)
library(stringr)
library(knitr)
library(kableExtra)

setwd("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration")
ihme_file <- "IHME-GBD_2019_DATA-ae7f35c6-1.csv"
pop_factor <- 1
pct <- function(x) {
  y <- paste0(round((x*100),0),"%")
  return(y)
}

# Import Synthesis output
df_sas_wide <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/w_base_97b.sas7bdat")
df_sas_wide <- df_sas_wide %>% mutate(source = ifelse(option ==1, "SOC",
                                     ifelse(option ==2, "CCC",
                                     ifelse(option ==3, "CHW",
                                     ifelse(option ==4, "CHW_link", 
                                     ifelse(option ==5, "perfect", NA)))))) %>% 
  filter(source == "SOC" | source == "CCC" | source == "CHW")

df_sas_wide <- rename(df_sas_wide, country = run) 
sourcenames <- c("GBD 2015", "Geldsetzer", "SEARCH (Kenya/Uganda)", "NIDS (South Africa)", "SOC", "CCC", "CHW", "CHW_link", "perfect")
df_sas_wide$source <- as.factor(df_sas_wide$source)
df_sas_wide$source <- factor(df_sas_wide$source, levels = sourcenames)
df_sas_wide <- df_sas_wide %>% 
  select(country, source, ends_with("_15"), ends_with("_23"), ends_with("_2343"), ends_with("_2373")) %>% 
  select(-c(starts_with("p_diag_"), starts_with("p_onart_"), starts_with("p_vg1000"), starts_with("p_vl1000"), starts_with("prevalence_vg1000"), starts_with("prevalence1549m"), starts_with("prevalence1549w"), starts_with("incidence1549"))) %>% 
  rename(setting_sbp_inc = prob_sbp_increase_2343,
         setting_sbp_cal = sbp_cal_eff_2343,
         setting_cvd_tx = rr_cvd_tx_2343,
         setting_cvd_tx_eff = rr_cvd_tx_effective_2343) %>% 
  select(-c(starts_with("prob_sbp_increase_"), starts_with("sbp_cal_eff_"), starts_with("rr_cvd_tx_"), starts_with("rr_cvd_tx_effective_")))

# select setting level variables at baseline
df_scenario_chars <- df_sas_wide %>% 
  filter(source == "SOC") %>%
  select(country, m_sbp_4564_23, p_htn_true_4564_23, p_diagnosed_hypert_4564_23, p_on_tx_htn_4564_23, p_hypert_control_4564_23, rate_dead_cvd_4059_23, starts_with("setting"), prevalence1549_23)

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
# uganda  <- df_sas_wide %>% filter(p_hypert_ge18.15 < 0.32,
#                                   p_diagnosed_hypert_ge18.15 < 0.26,
#                                   prevalence1549.15 < 0.15) %>% select(country)
# ug <- left_join(uganda, df_sas_wide, by = "country")
# df_sas_wide <- ug
#####======================================#####

# pivot to long dataset
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

  # # Fix prevalence - updated 21Apr2023 - this is now corrected in create_wide file
  # df_sas <- df_sas %>% 
  #   mutate(value = ifelse(grepl("^prev_", var), value * 100, value))

# pivot wider - NOTE: in future can consider pivitoing into a wider tidy dataframe, but this does not work well because of the very large number of age categories which have missing data for most variables
# df_sas <- df_sas_long %>% 
#   pivot_wider(id_cols = c(country, source, year, sex, age),
#               names_from = var,
#               values_from = value)
# 
# vars_cascade <- c("p_hypert", "p_hypertens160", "p_htn_true", "p_dx_htn_true", "p_dx_htn_over", "p_diagnosed_hypert", "p_on_tx_htn", "p_ever_tx_htn", "p_hypert_control",
#                   "p_on1drug_antihyp", "p_on2drug_antihyp", "p_on3drug_antihyp")
# df_sas_cascade <- df_sas %>% 
#   select(country, source, year, sex, age, all_of(vars_cascade)) %>% 
#   filter(!rowSums(is.na(.[, vars_cascade])) == length(vars_cascade))

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
ssa_tx <- df_ssa_txctrl %>% select(country, age, source, tx, year)
ssa_ctrl <- df_ssa_txctrl %>% select(country, age, source, control, year)


# Import Geldsetzer Lancet 2019 country age-stratified data and select SSA countries
ssa_data <- read.delim(file = "geldsetzer_country_data.txt", sep = "", header = FALSE)
ssa_data <- ssa_data[c("V1", "V2", "V3", "V6")]
ssa_data <- ssa_data %>% rename(country = V1, age = V2, htn = V3, htn_undx = V6) %>% 
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

ssa_country_geld <- data.frame(country = as.character(c("Benin", "BurkinaFaso", "Ghana", "Kenya", "Lesotho", "Liberia", "Mozamb.", "Namibia", "SouthAfrica", "Swaziland", "Tanzania", "Timor-Leste", "Togo", "Uganda", "Zanzibar")))
ssa_htndx <- inner_join(ssa_country_geld, ssa_data, by="country")
ssa_htn <-  ssa_htndx %>% select(country, age, htn, source, year)
ssa_dx  <-  ssa_htndx %>% select(country, age, dx, source, year)
rm(ssa_data, ssa_country_geld)

# # Import Forouzanfar JAMA 2017 SBP country data country data and select SSA countries
data_sbp <- read_excel("IHME_GBD_2015_SBP_110_115_MM_HG_HYPERTENSION_1990_2015_ETABLE_2_Y2017M01D10.XLSX", sheet="raw")
data_sbp <- as.data.frame(data_sbp)
data_sbp <- data_sbp[c("location_name", "age_name", "val_1_2015", "val_2_2015")]
data_sbp <- data_sbp %>% filter(age_name != "Age-standardized")
ssa_country_foro <- read.delim(file = "countries_ssa.txt", sep = ";", header = FALSE)
ssa_country_foro <- ssa_country_foro[['V1']]
ssa_sbp <- data_sbp %>% subset(location_name %in% ssa_country_foro)
ssa_sbp %>% count(location_name)
ssa_sbp <- ssa_sbp %>% 
  rename(country = location_name, age = age_name) %>% 
  mutate(source = "GBD 2015",
         year = "15",
         sbp_men = as.numeric(word(ssa_sbp$val_1_2015,1,sep = "\u000D")),
         sbp_women = as.numeric(word(ssa_sbp$val_2_2015,1,sep = "\u000D")),
         age = str_remove_all(age, " years"))

ssa_sbp_m = ssa_sbp %>% select(country, age, sbp_men, source, year) %>% 
  mutate(sex = "Male") %>% 
  rename(sbp = sbp_men)
ssa_sbp_w = ssa_sbp %>% select(country, age, sbp_women, source, year) %>% 
  mutate(sex = "Female") %>% 
  rename(sbp = sbp_women)
ssa_sbp <- rbind(ssa_sbp_m, ssa_sbp_w)
rm(data_sbp)

# IHME 2019 GBD data on mortality
ihme <- read_csv(ihme_file) 
ssa_central <- c("Angola", "Central African Republic", "Congo", "Democratic Republic of the Congo", "Equatorial Guinea", "Gabon")
ssa_eastern <- c("Burundi", "Comoros", "Djibouti", "Eritrea", "Ethiopia", "Kenya", "Madagascar", "Malawi", "Mozambique", "Rwanda", "Somalia", "South Sudan", "Uganda", "United Republic of Tanzania", "Zambia")
ssa_southern <- c("Botswana", "Eswatini", "Lesotho", "Namibia", "South Africa", "Zimbabwe")
ssa_western <- c("Benin", "Burkina Faso", "Cabo Verde", "Cameroon", "Chad", "Côte d'Ivoire", "Gambia", "Ghana", "Guinea", "Guinea-Bissau", "Liberia", "Mali", "Mauritania", "Niger", "Nigeria", "Sao Tome and Principe", "Senegal", "Sierra Leone", "Togo")
ssa_all <- c(ssa_western, ssa_eastern, ssa_southern, ssa_central)
ihme_country <- ihme %>% 
  filter(location %in% ssa_all) %>% 
  mutate(region = ifelse(location %in% ssa_central, "Central SSA",
                         ifelse(location %in% ssa_eastern, "Eastern SSA",
                                ifelse(location %in% ssa_southern, "Southern SSA",
                                       ifelse(location %in% ssa_western, "Western SSA", NA)))),
         age = paste0("yr", age),
         age = str_remove(age, " years"),
         age = str_remove(age, "-"))

ihme_country %>% group_by(region, location) %>% count() %>% print(n=50)
ihme_country <- ihme_country %>% 
  mutate(val = ifelse(val ==0, NA, val),
         upper = ifelse(upper ==0, NA, upper),
         lower = ifelse(lower ==0, NA, lower))

ihme_cvdeath <- ihme_country %>% 
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
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         value = value / 1000,
         source = "SSA") %>% 
  rename(country = location,
         cvd_death_rate = value)

df_cvd_death <- df_sas %>% 
  filter(var == "rate_dead_cvd") %>% 
  select(-var) %>% 
  mutate(region = source) %>% 
  rename(cvd_death_rate = value) %>% 
  rbind(ihme_cvdeath) %>% 
  filter(year == "2019" | year == "15") %>% 
  filter(age != "80+") %>% 
  filter(source %in% c("SOC", "SSA"))

ihme_cvevent <- ihme_country %>% 
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
         age = str_replace(age,"(\\d{2})(\\d{2})$","\\1-\\2"),
         value = value / 1000,
         source = "SSA") %>% 
  rename(country = location)

df_cvd_inc <- df_sas %>% 
  filter(var == "rate_ihd_modsev" | var == "rate_cva_modsev",
         source == "SOC") %>% 
  mutate(region = source,
         measure = "Incidence",
         var = if_else(str_detect(var, "ihd"), "Ischemic heart disease",
                       if_else(str_detect(var, "cva"), "Stroke", var))) %>% 
  rename(cause = var) %>% 
  rbind(ihme_cvevent) %>% 
  filter(measure == "Incidence",
         cause %in% c("Stroke", "Ischemic heart disease"),
         year == "2019" | year == "15",
         age %in% c("18+", "20+", "40-49", "50-59", "60-69", "70-79", "80+"))

df_cvd_prev <- df_sas %>% 
  filter(grepl("^prev_", var),
         source == "SOC") %>% 
  mutate(region = source,
         measure = "Prevalence",
         var = if_else(str_detect(var, "ihd"), "Ischemic heart disease",
                       if_else(str_detect(var, "cva"), "Stroke", var))) %>% 
  rename(cause = var) %>% 
  rbind(ihme_cvevent) %>% 
  filter(measure == "Prevalence",
         cause %in% c("Stroke", "Ischemic heart disease"),
         year == "2019" | year == "15",
         age %in% c("18+", "20+", "40-49", "50-59", "60-69", "70-79", "80+"))

ihme_objects <- ls(pattern = "^ihme")
rm(list = ihme_objects, ihme_objects)

# SEARCH and NIDS South Africa Data for severe hypertension (SBP ≥160)
## NIDS Wave 4 (2015) and SEARCH 1.0 baseline (2013)

sevhtn_search <- read_csv("search_severeHTN.csv") %>% 
  rename(country = Community,
         age = age_cat) %>% 
  mutate(source = "SEARCH (Kenya/Uganda)",
         year = "15")
sevhtn_nids <- read_csv("NIDS_severeHTN.csv") %>% 
  rename(age = age_cat) %>% 
  mutate(source = "NIDS (South Africa)",
         year = "15",
         country = "South Africa")

# Append Synthesis data to STEPS data from Geldsetzer for hypertension cascade
df_htn <- df_sas %>% 
  filter(var == "p_htn_true",
         source == "SOC",
         sex == "All") %>% 
  rename(htn = value) %>% 
  select(-c(var, sex)) %>% 
  rbind(ssa_htn)
df_htn <- df_htn %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_sevhtn <- df_sas %>% 
  filter(var =="p_hypertens160",
         source == "SOC",
         sex == "All") %>% 
  rename(sevhtn = value) %>% 
  select(-c(var, sex)) %>% 
  rbind(sevhtn_search) %>% 
  rbind(sevhtn_nids)
df_sevhtn <- df_sevhtn %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

sevhtn_objects <- ls(pattern = "^sevhtn")
rm(list = sevhtn_objects, sevhtn_objects)

df_dx <- df_sas %>% 
  filter(var == "p_diagnosed_hypert",
         source == "SOC",
         sex == "All") %>%  
  rename(dx = value) %>% 
  select(-c(var, sex)) %>% 
  rbind(ssa_dx)
df_dx <- df_dx %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_tx_current <- df_sas %>% 
  filter(var == "p_on_tx_htn",
         source == "SOC",
         sex == "All") %>%  
  rename(tx = value) %>% 
  select(-c(var, sex)) %>% 
  rbind(ssa_tx)
df_tx_current <- df_tx_current %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_tx_ever <- df_sas %>% 
  filter(var == "p_ever_tx_htn",
         source == "SOC",
         sex == "All") %>%  
  rename(tx = value) %>% 
  select(-c(var, sex)) %>% 
  rbind(ssa_tx)
df_tx_ever <- df_tx_ever %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_ctrl <- df_sas %>% 
  filter(var == "p_hypert_control",
         source == "SOC",
         sex == "All") %>%  
  rename(control = value) %>% 
  select(-c(var, sex)) %>% 
  rbind(ssa_ctrl)
df_ctrl <- df_ctrl %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

df_sbp <- df_sas %>% 
  filter(var == "m_sbp",
         source == "SOC",
         !(age %in% c("15-19", "20-24", "25-44", "45-64", "65+"))) %>% 
  rename(sbp = value) %>% 
  select(-c(var)) %>%
  rbind(ssa_sbp)
df_sbp <- df_sbp %>% 
  mutate(age = as.factor(age),
         source = factor(source, levels = sourcenames))

ssa_objects <- ls(pattern = "^ssa")
rm(list = ssa_objects, ssa_objects)


# Add factor variables to df_sas
df_sas <- df_sas %>% 
  mutate(source = factor(source, levels = sourcenames))

# CVD event and mortality risk reduction
df_cvdmort_rr <- df_sas %>% 
  filter(grepl("^rate_", var),
         year == "2343" | year == "2373",
         sex == "All") %>% 
  pivot_wider(id_cols = c(country, age, sex, year, var),
              names_from = c(source),
              values_from = value) %>% 
  mutate(CCC.rr = CCC / SOC,
         CHW.rr = CHW / SOC) %>%
  select(country, age, sex, year, var, CCC.rr, CHW.rr) %>% 
  pivot_longer(cols = c(CCC.rr, CHW.rr),
               values_to = "value") %>% 
  separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
  mutate(source = factor(source, levels = sourcenames),
         var = paste0(var, "_", measure)) %>% 
  select(-measure)
  # bind RR measures to df_sas
  df_sas <- rbind(df_sas, df_cvdmort_rr)

df_cvdevent_n <- df_sas %>% 
    filter(var %in% c("n_ihd", "n_cva", "n_cvd"),
           year == "2343" | year == "2373") %>% 
    pivot_wider(id_cols = c(country, age, sex, year, var),
                names_from = c(source),
                values_from = value) %>% 
    mutate(CCC.diff = SOC - CCC,
           CHW.diff = SOC - CHW) %>% 
    select(country, age, sex, year, var, CCC.diff, CHW.diff) %>% 
    pivot_longer(cols = c(CCC.diff, CHW.diff),
                 values_to = "value") %>% 
    separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
    mutate(source = factor(source, levels = sourcenames),
           var = paste0(var, "_", measure)) %>% 
    select(-measure)  

df_cvdmort_n <- df_sas %>% 
  filter(var == "n_dead_cvd",
         year == "2343" | year == "2373") %>%
  pivot_wider(id_cols = c(country, age, sex, year, var),
              names_from = c(source),
              values_from = value) %>% 
  mutate(CCC.diff = SOC - CCC,
         CHW.diff = SOC - CHW) %>% 
  select(country, age, sex, year, var, CCC.diff, CHW.diff) %>% 
  pivot_longer(cols = c(CCC.diff, CHW.diff),
               values_to = "value") %>% 
  separate_wider_delim(cols = name, delim = ".", names = c("source", "measure")) %>% 
  mutate(source = factor(source, levels = sourcenames),
         var = paste0(var, "_", measure)) %>% 
  select(-measure)
# bind death difference measures to df_sas
df_sas <- rbind(df_sas, df_cvdevent_n, df_cvdmort_n)

# DALYs averted
df_ddaly_avert <- df_sas %>% 
  filter(var == "ddaly",
         year == "2343" | year == "2373") %>% 
  mutate(value = value / 1000) %>% 
  pivot_wider(        id_cols = c(country, year, var, age, sex),
                      names_from = c(source),
                      values_from = value) %>% 
  mutate(CCC = SOC - CCC,
         CHW = SOC - CHW,
         
         SOC = 0) %>%
  pivot_longer(cols = c(SOC, CCC, CHW),
               values_to = "value") %>%
  rename(source = name) %>%
  mutate(source = factor(source, levels = sourcenames),
         var = "ddaly_averted")
  # bind to df_sas
  df_sas <- rbind(df_sas, df_ddaly_avert)
  df_ddaly_avert <- df_ddaly_avert %>% 
    rename(ddaly_averted = value) %>% 
    select(-c(var, age, sex))
  
# Cost
df_dcost_inc <- df_sas %>% filter(grepl("^dhtn_cost_tot", var)) %>%
  filter(year == 2343 | year == 2373) %>% 
  pivot_wider(id_cols = c(country, year, var, age, sex),
              names_from = c(source),
              values_from = value) %>% 
  mutate(CCC = CCC - SOC,
         CHW = CHW - SOC,
         SOC = 0) %>% 
  pivot_longer(cols = c(SOC, CCC, CHW),
               values_to = "value") %>%
  rename(source = name) %>%
  mutate(source = factor(source, levels = sourcenames),
         var = paste0(var, "_inc"))
  # bind to df_sas
  df_sas <- rbind(df_sas, df_dcost_inc)

df_netdaly <- df_sas %>% 
  filter(grepl("^dhtn_cost_tot", var) & grepl("_inc$", var),
         year %in% c("2343", "2373")) %>% 
  rename(cost_inc = value,
         cost_cat = var) %>% 
  select(-c(age, sex)) %>% 
  right_join(df_ddaly_avert, by = join_by(country, source, year)) %>% 
  mutate(netdaly_averted = ddaly_averted - ((cost_inc*1000)/500),
         netdaly_1 = ddaly_averted - ((cost_inc*1000)/1),
         netdaly_10 = ddaly_averted - ((cost_inc*1000)/10),
         netdaly_50 = ddaly_averted - ((cost_inc*1000)/50),
         netdaly_100 = ddaly_averted - ((cost_inc*1000)/100),
         netdaly_150 = ddaly_averted - ((cost_inc*1000)/150),
         netdaly_200 = ddaly_averted - ((cost_inc*1000)/200),
         netdaly_250 = ddaly_averted - ((cost_inc*1000)/250),
         netdaly_300 = ddaly_averted - ((cost_inc*1000)/300),
         netdaly_350 = ddaly_averted - ((cost_inc*1000)/350),
         netdaly_400 = ddaly_averted - ((cost_inc*1000)/400),
         netdaly_450 = ddaly_averted - ((cost_inc*1000)/450),
         netdaly_500 = ddaly_averted - ((cost_inc*1000)/500),
         netdaly_600 = ddaly_averted - ((cost_inc*1000)/600),
         netdaly_800 = ddaly_averted - ((cost_inc*1000)/800),
         netdaly_1000 = ddaly_averted - ((cost_inc*1000)/1000),
         cf_netdaly_any = ifelse(netdaly_averted >=0 & ddaly_averted >=0, 1, 0),
         cf_netdaly_any = ifelse(source == "SOC", NA, cf_netdaly_any),
         cost_cat = factor(cost_cat, 
                           levels = c("dhtn_cost_tothalf_inc", 
                                      "dhtn_cost_totdrughalf_inc", "dhtn_cost_totclinhalf_inc", "dhtn_cost_totscrnhalf_inc", 
                                      "dhtn_cost_total_inc", 
                                      "dhtn_cost_totscrndoub_inc", "dhtn_cost_totclindoub_inc", "dhtn_cost_totdrugdoub_inc", 
                                      "dhtn_cost_totdoub_inc"),
                           ordered = TRUE,
                           labels= c("total htn (50%)", 
                                     "total (50% drug cost)", "total (50% clinic cost)", "total (50% screening cost)", 
                                     "total htn", 
                                     "total (200% screening cost)", "total (200% clinic cost)", "total (200% drug cost)", 
                                     "total htn (200%)")))

df_netdaly_all<- df_netdaly %>% 
  pivot_wider(id_cols = c(country, year, cost_cat),
              names_from = c(source),
              values_from = netdaly_averted) %>% 
  mutate(SOC = 0,
         cf = ifelse(SOC > CCC & SOC > CHW, "SOC",
              ifelse(CCC > SOC & CCC > CHW, "CCC",
              ifelse(CHW > SOC & CHW > CCC, "CHW", NA))),
         SOC = ifelse(cf == "SOC", 1, 0),
         CCC = ifelse(cf == "CCC", 1, 0),
         CHW = ifelse(cf == "CHW", 1, 0)) %>% 
  pivot_longer(cols = c(SOC, CCC, CHW),
               values_to = "cf_netdaly_all",
               names_to = "source") %>% 
  select(-cf) %>% 
  mutate(source = factor(source, levels = sourcenames))

df_netdaly_graph<- df_netdaly %>% 
  select(-c(cost_inc, ddaly_averted, netdaly_averted, cf_netdaly_any)) %>% 
  pivot_longer(cols = starts_with("netdaly"),
               names_to = c("netdaly", "ce_threshold"), 
               names_sep = "\\_",
               values_to = "netdaly_averted") %>% 
  pivot_wider(id_cols = c(country, year, cost_cat, ce_threshold),
              names_from = c(source),
              values_from = netdaly_averted) %>% 
  mutate(ce_threshold = as.numeric(ce_threshold),
         SOC = 0,
         cf = ifelse(SOC > CCC & SOC > CHW, "SOC",
                     ifelse(CCC > SOC & CCC > CHW, "CCC",
                            ifelse(CHW > SOC & CHW > CCC, "CHW",NA))),
         SOC = ifelse(cf == "SOC", 1, 0),
         CCC = ifelse(cf == "CCC", 1, 0),
         CHW = ifelse(cf == "CHW", 1, 0)) %>% 
  pivot_longer(cols = c(SOC, CCC, CHW),
               values_to = "cf_netdaly_all",
               names_to = "source") %>% 
  select(-c(cf)) %>% 
  mutate(source = factor(source, levels = sourcenames))

df_netdaly_graph_summ <- df_netdaly_graph %>% 
  filter(year == "2373", cost_cat == "total htn") %>% 
  group_by(source, ce_threshold) %>% 
  summarize(prop = mean(cf_netdaly_all),
            pct = pct(prop)) 

df_netdaly <- left_join(df_netdaly, df_netdaly_all, by = c("country", "source", "cost_cat", "year"))
rm(df_netdaly_all, df_ddaly_avert, df_dcost_inc)

# Setting scenario characteristics
df_netdaly <- left_join(df_netdaly, df_scenario_chars, by="country")
vars <- df_sas %>% select(var) %>% distinct

# cost-effectiveness frontier
plot_icer <- df_netdaly %>% filter(year == "2373") %>% 
  group_by(source, cost_cat) %>% 
  summarize(mean_ddaly = mean(ddaly_averted),
            mean_cost = mean(cost_inc)) %>% 
  mutate(icer = round((mean_cost * 1000) / mean_ddaly))
plot_icer_cost <- plot_icer %>% 
  pivot_wider(id_cols = c(cost_cat),
              names_from = c(source),
              values_from = c(mean_cost)) %>% 
  mutate(CHW = CHW - CCC) %>% 
  pivot_longer(cols = c(SOC, CCC, CHW),
               values_to = "inc_cost",
               names_to = "source")
plot_icer_ddaly <- plot_icer %>% 
  pivot_wider(id_cols = c(cost_cat),
              names_from = c(source),
              values_from = c(mean_ddaly)) %>% 
  mutate(CHW = CHW - CCC) %>% 
  pivot_longer(cols = c(SOC, CCC, CHW),
               values_to = "inc_ddaly",
               names_to = "source")
plot_icer <- left_join(plot_icer, plot_icer_cost, by = c("cost_cat", "source")) %>% 
  left_join(plot_icer_ddaly, by = c("cost_cat", "source")) %>% 
  mutate(icer2 = round((inc_cost * 1000) / inc_ddaly))

plot_icer %>% filter(source !="SOC")




save.image("SynthesisHTN_ug.RData")





