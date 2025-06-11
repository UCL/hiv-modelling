library(ggplot2)
library(dplyr)

set.seed(3)  # for reproducibility

# Create 10 individuals with starting ages between -87 and 15 in 1989
n <- 10
start_ages_1989 <- sample(-65:65, n)

# Create a data frame that calculates each person's trajectory
individuals <- data.frame(
  id = 1:n,
  start_age_1989 = start_ages_1989,
  birth_year = 1989 - start_ages_1989
)

# For each individual, calculate the years they are age 15 to death (15 + lifespan)
lifespan_data <- individuals %>%
  rowwise() %>%
  mutate(
    lifespan = sample(40:80, 1),
    start_year = birth_year + 15,
    end_year = start_year + lifespan - 1
  ) %>%
  ungroup() %>%
  rowwise() %>%
  do({
    tibble(
      id = .$id,
      year = seq(.$start_year, .$end_year),
      age = seq(15, 15 + .$lifespan - 1)
    )
  })

# Merge age-in-1989 info into lifespan_data
lifespan_labeled <- lifespan_data %>%
  group_by(id) %>%
  filter(row_number() == 1) %>%  # first row for each id (where they start at age 15)
  left_join(individuals, by = "id")

# Plot
# Find max y to place the label slightly above it
max_y <- length(unique(lifespan_labeled$id))

ggplot(lifespan_data, aes(x = year, y = factor(id), group = id)) +
  geom_line(linewidth = 1.2) +
  
  # Display "age in 1989" values in left column
  geom_text(data = lifespan_labeled,
            aes(x = 1989, y = factor(id), label = start_age_1989),
            hjust = 1, size = 3.5) +
  annotate("text", x = 1995, y = max_y + 1, label = "Age in 1989", hjust = 1, size = 3, fontface = "bold") +
  
  scale_x_continuous(
    limits = c(1989, 2076),
    breaks = c(1989, 2000, 2020, 2040, 2060, 2076),
    labels = c("1989", "2000", "2020", "2040", "2060", "2076")
  ) +
  scale_y_discrete(labels = NULL) +  # Remove y-axis labels
  labs(
    x = "Year",
    y = "Individuals",
    title = "Example: 10 individuals in the model",
    subtitle = "Aged 15+ at some point between 1989-2076"
  ) +
  theme_minimal() +
  theme(
    plot.margin = margin(t = 10, r = 10, b = 10, l = 10),
    panel.grid.major.y = element_blank()
  ) +
  coord_cartesian(ylim = c(0,max_y + 1), clip = "off")
