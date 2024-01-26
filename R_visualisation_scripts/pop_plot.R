library(tidyverse)

data <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

pop_data <- data |>
  mutate(ratio_pop_guitarists = pop_guitarists / pop_musicians) |>
  mutate(ratio_pop_pianists = pop_pianists / pop_musicians) |>
  pivot_longer(cols=c("ratio_pop_guitarists", "ratio_pop_pianists"), values_to = "ratios", names_to = "instrument") |>
  group_by(five_year_bracket, ratios)

ggplot(data = pop_data) +
  aes(x = five_year_bracket, y = ratios, color = instrument) +
  scale_colour_manual(values = c(ratio_pop_guitarists="red", ratio_pop_pianists="#0433b5"), 
                      labels = c(ratio_pop_guitarists="Guitar", ratio_pop_pianists="Piano")) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1)) +
  xlim(1905,1990) +
  theme_light() +
  xlab('Birthyear of musician') +
  ylab('Pop players as % of total pop musicians') +
  labs(color = 'Instrument') +
  geom_line(size=0.85) +
  geom_point()
ggsave('pop_plot.pdf', width = 15, height = 10, units = "cm")