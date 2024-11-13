library(tidyverse)
require(haven)
library(readxl)
library(stringr)
library(knitr)
library(kableExtra)

setwd("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration")

# Import Synthesis output
df <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/out102.sas7bdat")

df_x <- df %>% select(run, cald, option, prob_htn_link) %>% 
  filter(option ==3, cald < 2029)

write_csv(df_x, "prob_htn_link.csv")

df %>% filter(option ==3) %>% ggplot(aes(x = prob_htn_link)) +
  geom_histogram()
