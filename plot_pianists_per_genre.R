library(tidyverse)

piano_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/piano_genre_counter.csv')

piano_genre <- piano_genre |>
  mutate(ratio_pop_piano = pop_pianists / pop_musicians) |>
  mutate(ratio_classical_piano = classical_pianists / classical_musicians) |>
  mutate(ratio_jazz_piano = jazz_pianists / jazz_musicians) |>
  pivot_longer(cols=c("ratio_pop_piano", "ratio_classical_piano", "ratio_jazz_piano"), names_to="genres", values_to="ratios") |>
  group_by(five_year_bracket, genres)
  
ggplot(data = piano_genre) +
  aes(x = five_year_bracket, y = ratios, color = genres) +
  xlim(1900,1990) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 0.5)) +
  scale_color_manual(values=c(ratio_jazz_piano="#ff7800", ratio_pop_piano="#ff0000", ratio_classical_piano="#2629a0")) +
  theme_light() +
  xlab('Time') +
  ylab('Pianists distribution') +
  geom_line(size=0.8) 

  
ggsave('Proportion_of_pianists_per_genre.pdf')


