library(tidyverse)

# Ratio of pianists

piano_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

piano_genre <- piano_genre |>
  mutate(ratio_pop_piano = pop_pianists / pop_musicians) |>
  mutate(ratio_classical_piano = classical_pianists / classical_musicians) |>
  mutate(ratio_jazz_piano = jazz_pianists / jazz_musicians) |>
  mutate(ratio_rock_piano = rock_pianists / rock_musicians) |>
  pivot_longer(cols=c("ratio_pop_piano", "ratio_classical_piano", "ratio_jazz_piano", "ratio_rock_piano"), names_to="genres", values_to="ratios") |>
  group_by(five_year_bracket, genres)
  
ggplot(data = piano_genre) +
  aes(x = five_year_bracket, y = ratios, fill = genres) +
  xlim(1900,1990) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1.6)) +
  scale_fill_manual(values=c(ratio_jazz_piano="#ffa600", ratio_pop_piano="#ef5675", ratio_classical_piano="#003f5c", ratio_rock_piano="#7a5195"),
                     labels=c(ratio_jazz_piano="Jazz", ratio_pop_piano="Pop", ratio_classical_piano="Classical", ratio_rock_piano="Rock")) +
  theme_light() +
  xlab('Time') +
  ylab('Pianists distribution') +
  labs(color = "Genre") +
  geom_col()

  
ggsave('Proportion_of_pianists_per_genre.pdf')


