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