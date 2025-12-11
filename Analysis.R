library(tidyverse)
salaries <- read.csv("salaries_1985to2018.csv", stringsAsFactors = FALSE)

# Make sure salary is numeric
salaries$salary <- as.numeric(salaries$salary)

# Keep only seasons 2000 and 2017
salaries_subset <- salaries %>%
  filter(season_start %in% c(2000, 2017)) %>%
  drop_na(salary) %>%
  mutate(
    season_start = factor(season_start))
#Independent two-sample t-test
t.test(salary ~ season_start, data = salaries_subset)
