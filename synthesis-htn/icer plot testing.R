library(tidyverse)
library(ggrepel)

load("/Users/sf124046/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration/SynthesisHTN_105.RData")

plot_icer_base <- plot_icer %>% 
  rename(policy = source) %>% 
  filter(cost_cat == "Base case cost assumptions") %>% 
  mutate(icer_text = ifelse(is.na(icer2), "SOC", paste0(policy, "\n", "$", icer2, "/DALY")),
         nudge_y = ifelse(policy == "CCC", 6, 
                          ifelse(policy == "CHW", 2, NA)))

colors <- RColorBrewer::brewer.pal(n = 3, name = "Dark2")  # Adjust n as needed
colors <- colors[-1]  # Remove the first color

ccc_icer <- plot_icer_base %>% filter(policy == "CCC") %>% ungroup() %>% select(icer2)
chw_icer <- plot_icer_base %>% filter(policy == "CHW") %>% ungroup() %>% select(icer2)

# Create the overlayed plot
fig3 <- ggplot() +
  # First plot: Points from df_netdaly
  geom_point(data = df_netdaly %>% 
               rename(policy = source) %>% 
               filter(year == "2474", cost_cat == "Base case cost assumptions"),
             aes(x = ddaly_averted, y = cost_inc, color = policy), alpha = 0.4, size = 0.1) +
  # Axis lines at x=0 and y=0
  geom_hline(yintercept = 0, color = "#636363", linetype = "dashed") +
  geom_vline(xintercept = 0, color = "#636363", linetype = "dashed") +
  # Second plot: Lines and points from plot_icer_base
  geom_point(data = plot_icer_base,
             aes(x = mean_ddaly, y = mean_cost), size = 2.5, alpha = 1, color = "black") +
  geom_line(data = plot_icer_base,
            aes(x = mean_ddaly, y = mean_cost),
            linewidth = 0.8) +
  geom_point(data = plot_icer_base,
             aes(x = mean_ddaly, y = mean_cost, color = policy), size = 1.5) +
  # ggrepel annotations
  geom_label_repel(data = plot_icer_base, 
                   aes(x = mean_ddaly, y = mean_cost, color = policy, label = icer_text), 
                   nudge_y = c(8, 5, 5),
                   nudge_x = c(-40, 170, 130),
                   fill = alpha("white", 0.5),
                   direction = "y",  # Keep labels in a vertical column
                   hjust = 0.5,  # Left-align the text
                   segment.size = 0.2,
                   force = 1,
                   min.segment.length = 0,
                   show.legend = FALSE) +
  # Shared labels, theme, and scales
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10)) + 
  scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
  labs(title = "Cost-effectiveness frontier",
       subtitle = "Per 10 million adults over 50-year time horizon (2024 - 2074), n=3000 setting-scenarios",
       y = "Annual incremental cost (millions $USD)",
       x = "Annual DALYs averted (thousands)") +
  labs(color = "Policy") +
  theme_classic() +
  theme(
    plot.title = element_text(size = 16, face = "bold", color = "#636363"),
    plot.subtitle = element_text(size = 12),
    legend.position = "bottom",
    text = element_text(color = "#636363"),
    axis.line = element_line(color = "#636363"),
    axis.ticks = element_line(color = "#636363"),
    axis.text = element_text(color = "#636363")
  ) +
  scale_color_brewer(palette = "Dark2") +
  scale_fill_brewer(palette = "Dark2")
  # scale_color_manual(values = colors) +  # Use the modified color vector
  # scale_fill_manual(values = colors)    # Use the modified color vector
# Display the combined plot
print(fig3)

ggsave("/Users/sf124046/Library/CloudStorage/Box-Box/1.sapphire_modelling/calibration/results/fig3_opt9.pdf", plot = fig3, device = "pdf", width = 7.5, height = 5, units = "in", dpi = 600)

