library(tidyverse)

data <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

classic_data <- data |>
  mutate(ratio_classical_guitarists = classical_guitarists / classical_musicians) |>
  mutate(ratio_classical_pianists = classical_pianists / classical_musicians) |>
  pivot_longer(cols=c("ratio_classical_guitarists", "ratio_classical_pianists"), values_to = "ratios", names_to = "instrument") |>
  group_by(five_year_bracket, ratios)

ggplot(data = classic_data) +
  aes(x = five_year_bracket, y = ratios, color = instrument) +
  scale_colour_manual(values = c(ratio_classical_guitarists="red", ratio_classical_pianists="#0433b5"), 
                      labels = c(ratio_classical_guitarists="Guitar", ratio_classical_pianists="Piano")) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1)) +
  xlim(1905,1990) +
  theme_light() +
  xlab('Time') +
  ylab('Classical players as % of total classical musicians') +
  labs(color = 'Instrument') +
  geom_line(size=0.85) +
  geom_point()
ggsave('classical_plot.pdf', width = 15, height = 10, units = "cm")