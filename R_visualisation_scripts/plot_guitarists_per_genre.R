library(tidyverse)

guitar_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

guitar_genre <- guitar_genre |>
  mutate(ratio_pop_guitar = pop_guitarists / pop_musicians) |>
  mutate(ratio_classical_guitar = classical_guitarists / classical_musicians) |>
  mutate(ratio_jazz_guitar = jazz_guitarists / jazz_musicians) |>
  mutate(ratio_rock_guitar = rock_guitarists / rock_musicians) |>
  pivot_longer(cols=c("ratio_pop_guitar", "ratio_classical_guitar", "ratio_jazz_guitar", "ratio_rock_guitar"), names_to="genres", values_to="ratios") |>
  group_by(five_year_bracket, genres)

ggplot(data = guitar_genre) +
  aes(x = five_year_bracket, y = ratios, color = genres) +
  xlim(1905,1990) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 0.7)) +
  scale_color_manual(values=c(ratio_jazz_guitar="#ffa600", ratio_pop_guitar="#ef5675", ratio_classical_guitar="#003f5c", ratio_rock_guitar="#7a5195"),
                     labels = c(ratio_classical_guitar="Classical", ratio_jazz_guitar="Jazz", ratio_pop_guitar="Pop", ratio_rock_guitar="Rock")) +
  theme_light() +
  xlab('Birthyear of musician') +
  ylab('Guitarists distribution') +
  labs(color = "Genre") +
  geom_line(size=0.85) +
  geom_point()
ggsave('Proportion_of_guitarists_per_genre.pdf')


ggplot(data = guitar_genre) +
  aes(x = five_year_bracket, y = ratios, fill = genres) +
  xlim(1905,1990) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1.6)) +
  scale_fill_manual(values=c(ratio_jazz_guitar="#ffa600", ratio_pop_guitar="#ef5675", ratio_classical_guitar="#003f5c", ratio_rock_guitar="#7a5195"),
                    labels=c(ratio_jazz_guitar="Jazz", ratio_pop_guitar="Pop", ratio_classical_guitar="Classical", ratio_rock_guitar="Rock")) +
  theme_light() +
  xlab('Birthyear of musician') +
  ylab('Guitarists distribution') +
  labs(fill = "Genre") +
  geom_col()
ggsave('Proportion_of_guitarists_per_genre_barplot.pdf')


