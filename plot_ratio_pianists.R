library(tidyverse)

data <- read_delim('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/piano_instrument.csv', delim = ',')

new_data <- data |> select(decade, instrument_label) |>
  mutate(musical = ifelse(instrument_label == "piano", "pianist", "musician")) |>
  group_by(decade, musical) |>
  summarise(count = n()) |>
  pivot_wider(names_from = musical, values_from = count) |>
  mutate(actual_musician = musician + pianist) |>
  mutate(pianist_ratio = pianist / actual_musician) |>
  select(decade, pianist_ratio)

ggplot(data = new_data) +
  aes(x = decade, y = pianist_ratio) +
  xlim(1800,2020) +
  ggtitle('Ratio of pianist with respect to total number of musicians') +
  xlab('Time') +
  ylab('Ratio of pianist') +
  scale_y_continuous(labels = scales::label_percent()) +
  geom_line()
ggsave('ratio_pianists.pdf')
