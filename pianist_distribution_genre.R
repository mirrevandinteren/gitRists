library(tidyverse)

piano_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/piano_genre_counter.csv')

piano_genre <- piano_genre |>
  mutate(ratio_pop = pop_pianists / total_pianists) |>
  mutate(ratio_classical = classical_pianists / total_pianists) |>
  mutate(ratio_jazz = jazz_pianists / total_pianists) |>
  mutate(ratio_other = (total_pianists - jazz_pianists - classical_pianists - pop_pianists) / total_pianists)

ggplot(data = piano_genre) +
  xlim(1850,2020) +
  scale_y_continuous(labels = scales::label_percent()) +
  geom_line(aes(x=decade, y=ratio_pop), color=rgb(255,105,180, maxColorValue = 255)) +
  geom_line(aes(x=decade, y=ratio_classical), color=rgb(65,105,225, maxColorValue = 255)) +
  geom_line(aes(x=decade, y=ratio_jazz), color=rgb(246,169,15, maxColorValue = 255)) +
  geom_line(aes(x=decade, y=ratio_other)) +
  xlab('Time') +
  ylab('Pianists distribution')
ggsave('Pianist_distribution_genre.pdf')
  


  