library(tidyverse)
library(ggplot2)

guitar_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')
guitar_genre <- guitar_genre |>
  mutate(gratio_pop = pop_guitarists / total_guitarists) |>
  mutate(gratio_classical = classical_guitarists / total_guitarists) |>
  mutate(gratio_jazz = jazz_guitarists / total_guitarists) |>
  pivot_longer(cols=c("gratio_pop", "gratio_classical", "gratio_jazz"), names_to="genres", values_to="ratios") |>
  group_by(five_year_bracket, genres)


ggplot(data = guitar_genre) +
  aes(x = five_year_bracket, y = ratios, color = genres) +
  xlim(1900,1990) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 0.65)) +
  theme_light() +
  xlab('Time') +
  ylab('Guitarists distribution') +
  geom_line(size=0.8) 


ggsave('Guitarists_distribution_genre.pdf')