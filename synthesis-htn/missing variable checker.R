library(haven)

# ---- Load SAS input ----
x <- read_sas("~/Library/CloudStorage/Box-Box/Synthesis_HTN-HIV/out996133.sas7bdat") %>% 
  filter(!is.na(run))
df <- as.data.frame(x, check.names = FALSE)

# ---- Variables required to compute dcost ----
required_vars <- c(
  # ART drug costs
  "s_dcost_zdv","s_dcost_ten","s_dcost_3tc","s_dcost_nev",
  "s_dcost_lpr","s_dcost_dar","s_dcost_taz","s_dcost_efa","s_dcost_dol",
  # Labs/visits/other HIV costs
  "s_dvis_cost","s_dvl_cost","s_dcd4_cost","s_dadc_cost",
  "s_dnon_tb_who3_cost","s_dtb_cost","s_dtest_cost","s_dcot_cost",
  "s_dres_cost","s_d_t_adh_int_cost","s_dcost_switch_line",
  "s_dcost_drug_level_test","s_dcost_circ","s_dcost_condom_dn",
  # PrEP
  "s_dcost_prep_oral","s_dcost_prep_inj",
  "s_dcost_prep_visit_oral","s_dcost_prep_visit_inj",
  "s_dcost_prep_ac_adh","s_dcost_sw_program",
  # Extra HIV child/visits vars
  "s_dcost_child_hiv","s_dfull_vis_cost",
  # Hypertension
  "s_htn_cost_scr","s_htn_cost_drug","s_htn_cost_clin","s_htn_cost_cvd",
  # Sometimes set upstream
  "s_dart_cost","s_dcost_prep","s_dcost_prep_visit"
)

required_params <- c("sf", "discount", "option")
referenced_but_undef <- c("dcost_avail_self_test")  # referenced in sum but not defined upstream

# ---- Check presence ----
cols <- colnames(df)

report <- data.frame(
  variable = c(required_vars, required_params, referenced_but_undef),
  type = c(rep("var", length(required_vars)),
           rep("param", length(required_params)),
           rep("referenced_only", length(referenced_but_undef))),
  present = c(required_vars %in% cols,
              required_params %in% cols,
              referenced_but_undef %in% cols),
  stringsAsFactors = FALSE
)

cat("=== dcost INPUT CHECK REPORT ===\n")
cat("Rows:", nrow(df), "| Cols:", ncol(df), "\n\n")

cat("Missing variables/parameters:\n")
print(subset(report, present == FALSE))

# ---- Missingness among present variables ----
vars_to_check <- intersect(required_vars, cols)
if (length(vars_to_check) > 0) {
  miss_df <- data.frame(
    variable = vars_to_check,
    n_missing = colSums(is.na(df[vars_to_check])),
    pct_missing = round(100 * colMeans(is.na(df[vars_to_check])), 2),
    stringsAsFactors = FALSE
  )
  cat("\nMissingness among PRESENT variables:\n")
  print(miss_df[order(-miss_df$pct_missing), ])
}