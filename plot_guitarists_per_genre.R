library(tidyverse)

guitar_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

guitar_genre <- guitar_genre |>
  mutate(ratio_pop_guitar = pop_guitarists / pop_musicians) |>
  mutate(ratio_classical_guitar = classical_guitarists / classical_musicians) |>
  mutate(ratio_jazz_guitar = jazz_guitarists / jazz_musicians) |>
  pivot_longer(cols=c("ratio_pop_guitar", "ratio_classical_guitar", "ratio_jazz_guitar"), names_to="genres", values_to="ratios") |>
  group_by(five_year_bracket, genres)

ggplot(data = guitar_genre) +
  aes(x = five_year_bracket, y = ratios, color = genres) +
  xlim(1900,1990) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 0.6)) +
  scale_color_manual(values=c(ratio_jazz_guitar="#ff7800", ratio_pop_guitar="#ff0000", ratio_classical_guitar="#2629a0")) +
  theme_light() +
  xlab('Time') +
  ylab('Guitarists distribution') +
  geom_line(size=0.8) 


ggsave('Proportion_of_guitarists_per_genre.pdf')


