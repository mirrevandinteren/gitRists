library(tidyverse)
library(ggplot2)

piano_genre <- read_csv("C:/Users/Siem Broeder/Dropbox/UCU Year 3/Making Sense of Data/Research/People/genre_counter.csv")
piano_genre <- piano_genre |>
  mutate(ratio_pop = pop_pianists / total_pianists) |>
  mutate(ratio_classical = classical_pianists / total_pianists) |>
  mutate(ratio_jazz = jazz_pianists / total_pianists) |>
  mutate(ratio_other = (total_pianists - jazz_pianists - classical_pianists - pop_pianists) / total_pianists)|>
  pivot_longer(cols=c("ratio_pop", "ratio_classical", "ratio_jazz", "ratio_other"), names_to="genres", values_to="ratios") |>
  group_by(five_year_bracket, genres)

# This plot should be a stacked plot

ggplot(data = piano_genre) +
  aes(x = five_year_bracket, y = ratios, color = genres) +
  xlim(1900,1990) +
  scale_y_continuous(labels = scales::label_percent()) +
  theme_light() +
  xlab('Time') +
  ylab('Pianists distribution') +
  geom_line() 
  
       
ggsave('Pianist_distribution_genre.pdf')
