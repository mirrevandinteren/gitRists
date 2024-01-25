library(tidyverse)
library(ggplot2)

# This plot shows how pianists are divided over the four genres (classical, pop, jazz, rock) relative to the total number of guitarists.


piano_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')
piano_genre <- piano_genre |>
  mutate(ratio_pop = pop_pianists / total_pianists) |>
  mutate(ratio_classical = classical_pianists / total_pianists) |>
  mutate(ratio_jazz = jazz_pianists / total_pianists) |>
  mutate(ratio_rock = rock_pianists / total_pianists)|>
  pivot_longer(cols=c("ratio_pop", "ratio_classical", "ratio_jazz", "ratio_rock"), names_to="genres", values_to="ratios") |>
  group_by(five_year_bracket, genres)

# This plot should be a stacked plot

ggplot(data = piano_genre) +
  aes(x = five_year_bracket, y = ratios, color = genres) +
  scale_color_manual(values = c(ratio_classical="#003f5c", ratio_jazz="#ffa600", ratio_pop="#ef5675", ratio_rock="#7a5195"),
                     labels = c(ratio_classical="Classical", ratio_jazz="Jazz", ratio_pop="Pop", ratio_rock="Rock")) +
  xlim(1880,1990) +
  scale_y_continuous(labels = scales::label_percent(), limits = c(0,0.7)) +
  theme_light() +
  xlab('Time') +
  ylab('Pianists distribution') +
  labs(color = 'Genre') +
  geom_line(size=0.85) +
  geom_point()
  
       
ggsave('Pianist_distribution_genre.pdf')
