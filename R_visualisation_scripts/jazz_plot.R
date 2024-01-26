library(tidyverse)

data <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

jazz_data <- data |>
  mutate(ratio_jazz_guitarists = jazz_guitarists / jazz_musicians) |>
  mutate(ratio_jazz_pianists = jazz_pianists / jazz_musicians) |>
  pivot_longer(cols=c("ratio_jazz_guitarists", "ratio_jazz_pianists"), values_to = "ratios", names_to = "instrument") |>
  group_by(five_year_bracket, ratios)

ggplot(data = jazz_data) +
  aes(x = five_year_bracket, y = ratios, color = instrument) +
  scale_colour_manual(values = c(ratio_jazz_guitarists="red", ratio_jazz_pianists="#0433b5"), 
                      labels = c(ratio_jazz_guitarists="Guitar", ratio_jazz_pianists="Piano")) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1)) +
  xlim(1905,1990) +
  theme_light() +
  xlab('Birthyear of musician') +
  ylab('Jazz players as % of total jazz musicians') +
  labs(color = 'Instrument') +
  geom_line(size=0.85) +
  geom_point()
ggsave('jazz_plot.pdf', width = 15, height = 10, units = "cm")