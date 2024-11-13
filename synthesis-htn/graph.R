library(tidyverse)
library(haven)
library(furrr)
library(data.table)

# Set up parallel processing
plan(multisession)  # Use all available cores

# Define the directory containing the SAS files
filepath <- "~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/run105/"

# List all SAS files in the directory
file_list <- list.files(path = filepath, pattern = "\\.sas7bdat$", full.names = TRUE)

# Define the required variables
required_vars <- c(
  "run", "cald", "option",
  "s_ageg1819m", "s_ageg2024m", "s_ageg1819w", "s_ageg2024w", 
  "s_ageg2529m", "s_ageg3034m", "s_ageg2529w", "s_ageg3034w", 
  "s_ageg3539m", "s_ageg4044m", "s_ageg3539w", "s_ageg4044w", 
  "s_ageg4549m", "s_ageg5054m", "s_ageg4549w", "s_ageg5054w", 
  "s_ageg5559m", "s_ageg6064m", "s_ageg5559w", "s_ageg6064w", 
  "s_ageg6569m", "s_ageg7074m", "s_ageg6569w", "s_ageg7074w", 
  "s_ageg7579m", "s_ageg8084m", "s_ageg7579w", "s_ageg8084w", 
  "s_ageg85plm", "s_ageg85plw",
  "s_hypertension_4554", "s_hypertension_5564", "s_hypertension_ge18",
  "s_htn_true_4554", "s_htn_true_5564", "s_htn_true_ge18",
  "s_dx_htn_4554", "s_dx_htn_5564", "s_dx_htn_ge18",
  "s_on_tx_htn_4554", "s_on_tx_htn_5564", "s_on_tx_htn_ge18",
  "s_htn_control_4554", "s_htn_control_5564", "s_htn_control_ge18"
)

# Function to process a single file
process_file <- function(file) {
  tryCatch(
    {
      read_sas(file) %>%
        select(all_of(required_vars)) %>%
        mutate(
          popge18 = s_ageg1819m + s_ageg2024m + s_ageg1819w + s_ageg2024w +
            s_ageg2529m + s_ageg3034m + s_ageg2529w + s_ageg3034w + 
            s_ageg3539m + s_ageg4044m + s_ageg3539w + s_ageg4044w + 
            s_ageg4549m + s_ageg5054m + s_ageg4549w + s_ageg5054w + 
            s_ageg5559m + s_ageg6064m + s_ageg5559w + s_ageg6064w + 
            s_ageg6569m + s_ageg7074m + s_ageg6569w + s_ageg7074w + 
            s_ageg7579m + s_ageg8084m + s_ageg7579w + s_ageg8084w + 
            s_ageg85plm + s_ageg85plw,
          pop4564 = s_ageg4549m + s_ageg5054m + s_ageg4549w + s_ageg5054w + s_ageg5559m + s_ageg6064m + s_ageg5559w + s_ageg6064w,
          p_htn_4564 = (s_htn_true_4554 + s_htn_true_5564) / pop4564,
          p_diag_htn_4564 = (s_dx_htn_4554 + s_dx_htn_5564) / (s_hypertension_4554 + s_hypertension_5564),
          p_on_tx_htn_4564 = (s_on_tx_htn_4554 + s_on_tx_htn_5564) / (s_htn_true_4554 + s_htn_true_5564),
          p_htn_ctrl_4564 = (s_htn_control_4554 + s_htn_control_5564) / (s_htn_true_4554 + s_htn_true_5564),
          p_htn_ge18 = s_htn_true_ge18 / (popge18),
          p_diag_htn_ge18 = s_dx_htn_ge18 / s_hypertension_ge18,
          p_on_tx_htn_ge18 = s_on_tx_htn_ge18 / s_htn_true_ge18,
          p_htn_ctrl_ge18 = s_htn_control_ge18 / s_htn_true_ge18,
          policy = ifelse(option ==1, "SOC",
                          ifelse(option ==2, "CCC",
                                 ifelse(option ==3, "CHW",
                                        ifelse(option ==4, "CHW_link", 
                                               ifelse(option ==5, "perfect", NA)))))
        ) %>%
          filter(policy == "SOC" | policy == "CCC" | policy == "CHW") %>% 
          filter(!is.na(run))
    },
    error = function(e) {
      warning(paste("Failed to process file:", file, "\nError:", e))
      NULL
    }
  )
}

# Use furrr to process files in parallel
df <- future_map_dfr(file_list, process_file, .progress = TRUE)

# compress data to average across each year
setDT(df)

# Create a new variable to define 1-year periods based on cald
df[, year := floor(cald)]

# Aggregate the data by `run`, `policy`, and `year_group`
df_yr <- df[, lapply(.SD, mean, na.rm = TRUE), 
                    by = .(run, policy, year),
                    .SDcols = setdiff(names(df), c("run", "policy", "cald", "year"))]

# Optional: Add the year column back for context if needed
df_yr[, cald := year]

save.image("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration/run105_long.RData")
