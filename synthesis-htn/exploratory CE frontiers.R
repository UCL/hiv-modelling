plot_icer <- plot_icer %>% 
  rename(policy = source)
ccc_icer <- plot_icer %>% filter(policy == "CCC", cost_cat == "Base case cost assumptions") %>% ungroup() %>% select(icer2)
chw_icer <- plot_icer %>% filter(policy == "CHW", cost_cat == "Base case cost assumptions") %>% ungroup() %>% select(icer2)

# Create the overlayed plot
combined_plot <- ggplot() +
  # First plot: Points from df_netdaly
  geom_point(data = df_netdaly %>% filter(year == "2474", cost_cat == "Base case cost assumptions"),
             aes(x = ddaly_averted, y = cost_inc, color = policy), alpha = 0.4) +
  # Second plot: Lines and points from plot_icer
  geom_line(data = plot_icer %>% filter(cost_cat == "Base case cost assumptions"),
            aes(x = mean_ddaly, y = mean_cost),
            linewidth = 1.5) +
  geom_point(data = plot_icer %>% filter(cost_cat == "Base case cost assumptions"),
             aes(x = mean_ddaly, y = mean_cost)) +
  # Shared labels, theme, and scales
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10)) + 
  scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
  labs(title = "Cost-effectiveness frontier",
       subtitle = "Per 10 million adults over 50-year time horizon (2024 - 2074), n=3000 setting-scenarios",
       y = "Annual incremental cost (millions $USD)",
       x = "Annual DALYs averted (thousands)") +
  # Annotations
  annotate("text", x=0, y=2, label= "SOC", size = 5) +
  annotate("text", x=20, y=-2, label= "Chronic Care Clinic", size = 5) +
  annotate("text", x=20, y=-4, label= paste0("$",ccc_icer, "/DALY"), size = 5) +
  annotate("text", x=60, y=22, label= "CHW Screening", size = 5) +
  annotate("text", x=60, y=20, label= paste0("$",chw_icer, "/DALY"), size = 5) +
  theme_classic(base_size = 16) +
  theme(
    plot.title = element_text(size = 20, face = "bold", color = "#636363"),
    legend.position = "bottom",
    text = element_text(color = "#636363"),
    axis.line = element_line(color = "#636363"),
    axis.ticks = element_line(color = "#636363"),
    axis.text = element_text(color = "#636363")
  ) +
  scale_color_brewer(palette = "Dark2")

# Display the combined plot
print(combined_plot)
