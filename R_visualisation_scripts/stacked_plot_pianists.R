library(tidyverse)

data <- read_csv("C:/Users/Siem Broeder/Dropbox/UCU Year 3/Making Sense of Data/Research/People/piano_instrument.csv")

new_data <- data |> select(decade, instrument_label) |>
  mutate(musical = if_else(instrument_label == "piano", "pianist", "musician")) |>
  group_by(decade, musical) |>
  summarise(count = n()) |>
  pivot_wider(names_from = musical, values_from = count) |>
  mutate(actual_musician = musician + pianist) |>
  mutate(pianist_ratio = pianist / actual_musician) |>
  select(decade, pianist_ratio, actual_musician, pianist)


ggplot(data = new_data) +
  xlim(1900,2020) +
  ggtitle('Ratio of pianist with respect to total number of musicians') +
  xlab('Time') +
  ylab('Number of musicians') +
  geom_col(aes(x = decade, y = actual_musician), fill = "blue") +
  geom_col(aes(x = decade, y = pianist), fill = "orange")
#ggsave('ratio_pianists.pdf')
