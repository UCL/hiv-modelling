library(tidyverse)
require(haven)

# Import Synthesis output
df_combined <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/test files/combined_data.sas7bdat")
df_corrupted <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/test files/corrupted_data.sas7bdat")
df_concatenated <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/concatenated_data.sas7bdat")

df_combined %>% group_by(run) %>% summarize(n = n())
df_combined %>% select(run) %>% unique() %>% summarize(n = n())
