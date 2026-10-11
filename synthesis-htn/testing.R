library(tidyverse)
require(haven)

x <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/HTN screening manuscript/data files/w_base_100.sas7bdat")
out <- read_sas(
  "~/Library/CloudStorage/Box-Box/1.sapphire_modelling/search2026/search_8/out743610420.sas7bdat"
) %>%
  mutate(run = "New model")

# out2 <- read_sas(
#   "~/Library/CloudStorage/Box-Box/1.sapphire_modelling/search2026/out974146639.sas7bdat"
# ) %>%
#   mutate(run = "Old model")
# 
# # Combine runs
# out <- bind_rows(out, out2)

out %>%
  count(run, option)

x |> select(starts_with("prob_sbp"), sbp_cal_eff_2474)


out <- out |> 
  mutate(
    pop2534 = s_ageg2529m + s_ageg3034m + s_ageg2529w + s_ageg3034w ,
    pop3544 = s_ageg3539m + s_ageg4044m + s_ageg3539w + s_ageg4044w ,
    pop4554 = s_ageg4549m + s_ageg5054m + s_ageg4549w + s_ageg5054w ,
    pop5564 = s_ageg5559m + s_ageg6064m + s_ageg5559w + s_ageg6064w ,
    pop6574 = s_ageg6569m + s_ageg7074m + s_ageg6569w + s_ageg7074w ,
    pop7584 = s_ageg7579m + s_ageg8084m + s_ageg7579w + s_ageg8084w,
    popge85 = s_ageg85plm + s_ageg85plw,
    m_sbp_2544  = (s_sbp_2529w + s_sbp_2529m + s_sbp_3034w + s_sbp_3034m + s_sbp_3539w + s_sbp_3539m + s_sbp_4044w + s_sbp_4044m) / (pop2534 + pop3544),
    m_sbp_4564  = (s_sbp_4549w + s_sbp_4549m + s_sbp_5054w + s_sbp_5054m + s_sbp_5559w + s_sbp_5559m + s_sbp_6064w + s_sbp_6064m) / (pop4554 + pop5564),
    m_sbp_ge65  = (s_sbp_6569w + s_sbp_6569m + s_sbp_7074w + s_sbp_7074m + s_sbp_7579w + s_sbp_7579m + s_sbp_ge80w + s_sbp_ge80m) / (pop6574 + pop7584 + popge85)
    
  )
y <- out |> select(cald, run, option, m_sbp_2544, m_sbp_4564, m_sbp_ge65)
y %>%
  select(cald, option, run, m_sbp_2544, m_sbp_4564, m_sbp_ge65) %>%
  pivot_longer(
    cols = starts_with("m_sbp_"),
    names_to = "age_group",
    values_to = "mean_sbp"
  ) %>%
  mutate(
    age_group = factor(
      age_group,
      levels = c("m_sbp_2544", "m_sbp_4564", "m_sbp_ge65"),
      labels = c("Age 25–44", "Age 45–64", "Age ≥65")
    ),
    option = factor(option),
    run = factor(run, levels = c("Old model", "New model"))
  ) %>%
  ggplot(
    aes(
      x = cald,
      y = mean_sbp,
      color = option,
      linetype = run,
      group = interaction(option, run)
    )
  ) +
  geom_line(linewidth = 1) +
  facet_wrap(~ age_group, ncol = 1) +
  labs(
    x = "Calendar year",
    y = "Mean systolic blood pressure (mmHg)",
    color = "Option",
    linetype = "Run"
  ) +
  theme_classic() +
  theme(
    legend.position = "top"
  )
