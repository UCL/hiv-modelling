
test <- read_sas("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/synthesis/test/out471529.sas7bdat")
test2 <- test %>% select(cald, prob_sbp_increase, sbp_cal_eff, s_sbp_2529, s_ageg2529w, s_ageg2529m, s_sbp_4549, s_ageg4549w, s_ageg4549m) %>% 
  mutate(m_sbp_2529 = round(s_sbp_2529 / (s_ageg2529w + s_ageg2529m), 1),
         m_sbp_4549 = round(s_sbp_4549 / (s_ageg4549w + s_ageg4549m), 1)) %>% 
  select(cald, prob_sbp_increase, sbp_cal_eff, m_sbp_2529, m_sbp_4549)


cva_calibration <- read_csv("~/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration/cva_calibration.csv")

cva_calibration %>% 
  ggplot(aes(x = Age, y = Incidence, color = Source)) +
    geom_point() +
    geom_line() +
    labs(title = "Incidence of stroke in model data (2015), compared to Walker et al (Tanzania; 2003-2006)",
         subtitle = "Using mid-points of 10-year age ranges",
         y = "CVA Incidence per 100 person-years") +
    theme(
      legend.position = "bottom"
    )
         
plot_icer %>% 
  filter(cost_cat == "total htn") %>% 
  ggplot(aes(x = mean_ddaly, y = mean_cost)) +
  geom_line() +
  geom_point() +
  annotate("text", x=0, y=3, label= "SOC") +
  annotate("text", x=45, y=6, label= "Primary Care") +
  annotate("text", x=45, y=4, label= "$17/DALY") +
  annotate("text", x=140, y=42, label= "CHW Screening") +
  annotate("text", x=140, y=40, label= "$205/DALY") +
  theme_minimal(base_size = 14) +
  labs(title = "Cost-effectiveness of hypertension treatment policies (2023 - 2073)",
       y = "Annual incremental cost (millions $USD)",
       x = "Annual DALYs averted (thousands)") +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    legend.position = "bottom"
  )
plot_icer


plot_cost <- df_sas %>% filter(year == "2373", var %in% c("dhtn_cost_scr", "dhtn_cost_clin", "dhtn_cost_drug", "dhtn_cost_cvd")) %>%
  mutate(var = factor(var, 
                      levels = c("dhtn_cost_scr", "dhtn_cost_clin", "dhtn_cost_drug", "dhtn_cost_cvd", "dhtn_cost_total"),
                      labels= c("scr", "clin", "drug", "cvd", "total htn")),
         value = ifelse(var == "clin", value, value)) %>% 
  group_by(source, var) %>% 
  summarize(mean_cost = mean(value)) %>% 
  mutate(mean_cost = round(mean_cost, 1))
plot_cost %>% 
  ggplot(aes(x = source, y = mean_cost, fill = var)) +
  geom_bar(position="stack", stat="identity") +
  geom_text(
    aes(label = after_stat(y), group = source), 
    stat = 'summary', fun = sum, vjust = -1
  ) +
  theme_minimal(base_size = 12) +
  expand_limits(y=c(0,60)) +
  scale_y_continuous(breaks = scales::pretty_breaks(n = 8)) + 
  labs( y = "Cost in millions of USD (discounted)", 
        title = "Average annual discounted HTN costs (in millions USD) from 2023 to 2073", 
        subtitle = "Standardized to population size = 10,000,000", 
        x = "Policy") +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    legend.position = "bottom"
  )

# cost-effectiveness frontier
plot_icer %>% 
  filter(cost_cat %in% c("total (50% clinic cost)", "total htn", "total (200% clinic cost)")) %>% 
  ggplot(aes(x = mean_ddaly, y = mean_cost, color = cost_cat)) +
  geom_line() +
  geom_point() +
  annotate("text", x=0, y=3, label= "SOC") +
  annotate("text", x=40, y=10, label= "Primary Care") +
  annotate("text", x=40, y=8, label= "$17/DALY", color = "#D95F02") +
  annotate("text", x=40, y=6, label= "$13/DALY", color = "#7570B3") +
  annotate("text", x=40, y=4, label= "$4/DALY", color = "#1B9E77") +
  annotate("text", x=130, y=42, label= "CHW Screening") +
  annotate("text", x=130, y=40, label= "$251/DALY", color = "#D95F02") +
  annotate("text", x=130, y=38, label= "$201/DALY", color = "#7570B3") +
  annotate("text", x=130, y=36, label= "$131/DALY", color = "#1B9E77") +
  theme_minimal(base_size = 14) +
  labs(title = "Cost-effectiveness of hypertension treatment policies (2023 - 2073)",
       subtitle = "Alternative assumptions about clinic costs",
       y = "Annual incremental cost (millions $USD)",
       x = "Annual DALYs averted (thousands)") +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    legend.position = "bottom"
  ) +
  scale_color_brewer(palette = "Dark2")

plot_icer %>% 
  filter(cost_cat %in% c("total (50% drug cost)", "total htn", "total (200% drug cost)")) %>% 
  ggplot(aes(x = mean_ddaly, y = mean_cost, color = cost_cat)) +
  geom_line() +
  geom_point() +
  annotate("text", x=0, y=3, label= "SOC") +
  annotate("text", x=40, y=24, label= "Primary Care") +
  annotate("text", x=40, y=20.5, label= "$158/DALY", color = "#7570B3") +
  annotate("text", x=40, y=17, label= "$17/DALY", color = "#D95F02") +
  annotate("text", x=40, y=13.5, label= "$-54/DALY (cost-saving)", color = "#1B9E77") +
  annotate("text", x=130, y=65, label= "CHW Screening") +
  annotate("text", x=130, y=61.5, label= "$395/DALY", color = "#7570B3") +
  annotate("text", x=130, y=58, label= "$251/DALY", color = "#D95F02") +
  annotate("text", x=130, y=54.5, label= "$179/DALY", color = "#1B9E77") +
  theme_minimal(base_size = 14) +
  labs(title = "Cost-effectiveness of hypertension treatment policies (2023 - 2073)",
       subtitle = "Alternative assumptions about drug costs",
       y = "Annual incremental cost (millions $USD)",
       x = "Annual DALYs averted (thousands)") +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    legend.position = "bottom"
  ) +
  scale_color_brewer(palette = "Dark2")

plot_icer %>% 
  filter(cost_cat %in% c("total (50% screening cost)", "total htn", "total (200% screening cost)")) %>% 
  ggplot(aes(x = mean_ddaly, y = mean_cost, color = cost_cat)) +
  geom_line() +
  geom_point() +
  annotate("text", x=0, y=3, label= "SOC") +
  annotate("text", x=40, y=12, label= "Primary Care") +
  annotate("text", x=40, y=8, label= "$17/DALY", color = "#D95F02") +
  annotate("text", x=130, y=58, label= "CHW Screening") +
  annotate("text", x=130, y=55, label= "$343/DALY", color = "#7570B3") +
  annotate("text", x=130, y=52, label= "$251/DALY", color = "#D95F02") +
  annotate("text", x=130, y=49, label= "$205/DALY", color = "#1B9E77") +
  theme_minimal(base_size = 14) +
  labs(title = "Cost-effectiveness of hypertension treatment policies (2023 - 2073)",
       subtitle = "Alternative assumptions about screening costs",
       y = "Annual incremental cost (millions $USD)",
       x = "Annual DALYs averted (thousands)") +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    legend.position = "bottom"
  ) +
  scale_color_brewer(palette = "Dark2")

plot_icer %>% filter(source !="SOC")

