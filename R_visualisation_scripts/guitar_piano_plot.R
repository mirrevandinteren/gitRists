library(tidyverse)
# This plot shows the percentage of total musicians that is guitarist or pianist over time.


data <- read_csv('z/People/genre_counter.csv')

data <- data |>
  mutate(ratio_guitarists = total_guitarists / total_musicians) |>
  mutate(ratio_pianists = total_pianists / total_musicians) |>
  pivot_longer(cols=c("ratio_guitarists", "ratio_pianists"), values_to = "ratios", names_to = "instrument") |>
  group_by(five_year_bracket, ratios)

ggplot(data = data) +
  aes(x = five_year_bracket, y = ratios, color = instrument) +
  scale_colour_manual(values = c(ratio_guitarists="red", ratio_pianists="#0433b5"), 
                      labels = c(ratio_guitarists="Guitar", ratio_pianists="Piano")) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 0.6)) +
  xlim(1880,2000) +
  theme_light() +
  xlab('Time') +
  ylab('Players as % of total musicians') +
  labs(color = 'Instrument') +
  geom_line(size=0.85) +
  geom_point()
ggsave('Guitar_piano_plot.pdf')
