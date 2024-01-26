library(tidyverse)

data <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

rock_data <- data |>
  mutate(ratio_rock_guitarists = rock_guitarists / rock_musicians) |>
  mutate(ratio_rock_pianists = rock_pianists / rock_musicians) |>
  pivot_longer(cols=c("ratio_rock_guitarists", "ratio_rock_pianists"), values_to = "ratios", names_to = "instrument") |>
  group_by(five_year_bracket, ratios)

ggplot(data = rock_data) +
  aes(x = five_year_bracket, y = ratios, color = instrument) +
  scale_colour_manual(values = c(ratio_rock_guitarists="red", ratio_rock_pianists="#0433b5"), 
                      labels = c(ratio_rock_guitarists="Guitar", ratio_rock_pianists="Piano")) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1)) +
  xlim(1905,1990) +
  theme_light() +
  xlab('Birthyear of musician') +
  ylab('Rock players as % of total rock musicians') +
  labs(color = 'Instrument') +
  geom_line(size=0.85) +
  geom_point()
ggsave('rock_plot.pdf', width = 15, height = 10, units = "cm")