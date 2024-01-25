library(tidyverse)
library(ggplot2)

# This plot shows how guitarists are divided over the four genres (classical, pop, jazz, rock) relative to the total number of guitarists.


guitar_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')
guitar_genre <- guitar_genre |>
  mutate(gratio_pop = pop_guitarists / total_guitarists) |>
  mutate(gratio_classical = classical_guitarists / total_guitarists) |>
  mutate(gratio_jazz = jazz_guitarists / total_guitarists) |>
  mutate(gratio_rock = rock_guitarists / total_guitarists) |>
  pivot_longer(cols=c("gratio_pop", "gratio_classical", "gratio_jazz", "gratio_rock"), names_to="genres", values_to="ratios") |>
  group_by(five_year_bracket, genres)


ggplot(data = guitar_genre) +
  aes(x = five_year_bracket, y = ratios, color = genres) +
  scale_color_manual(values = c(gratio_classical="#003f5c", gratio_jazz="#ffa600", gratio_pop="#ef5675", gratio_rock="#7a5195"),
                     labels = c(gratio_classical="Classical", gratio_jazz="Jazz", gratio_pop="Pop", gratio_rock="Rock")) +
  xlim(1880,1990) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0,0.7)) +
  theme_light() +
  xlab('Time') +
  ylab('Guitarists distribution') +
  labs(color = 'Genre') +
  geom_line(size=0.8) +
  geom_point()

ggsave('Guitarists_distribution_genre.pdf')