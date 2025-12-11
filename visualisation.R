library(tidyverse)
salaries <- read.csv("salaries_1985to2018.csv", stringsAsFactors = FALSE)

# Make sure salary is numeric
salaries$salary <- as.numeric(salaries$salary)

# Keep only seasons 2000 and 2017
salaries_subset <- salaries %>%
  filter(season_start %in% c(2000, 2017)) %>%
  drop_na(salary) %>%
  mutate(
    season_start = factor(season_start),
    salary_millions = salary / 1e6
  )
#boxplot
ggplot(salaries_subset, aes(x = season_start, y = salary_millions, fill = season_start)) +
  geom_boxplot() +
  labs(
    title = "NBA Player Salaries in 2000 vs 2017",
    subtitle = "Comparison of salary distributions across two seasons",
    x = "Season start year",
    y = "Salary (million US dollars)",
    fill = "Season",
    caption = "Data source: NBA salary dataset, 1984–2017"
  ) +
  theme_minimal() 
#Histogram
ggplot(salaries_subset, aes(x = salary_millions, fill = season_start)) +
  geom_histogram(bins = 30, alpha = 0.6, position = "identity") +
  facet_wrap(~ season_start, ncol = 1) +
  labs(
    title = "Histogram of NBA Player Salaries in 2000 and 2017",
    x = "Salary (million US dollars)",
    y = "Number of players",
    fill = "Season",
    caption = "Histograms show the distribution and skewness of salaries by season."
  ) +
  theme_minimal()
