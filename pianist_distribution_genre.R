library(tidyverse)
library(ggplot2)

piano_genre <- read_csv("C:/Users/csgb/OneDrive/UCU/ACCMET2J/Week 3 group project/datasets/piano_genre_counter.csv")
piano_genre <- piano_genre |>
  mutate(ratio_pop = pop_pianists / total_pianists) |>
  mutate(ratio_classical = classical_pianists / total_pianists) |>
  mutate(ratio_jazz = jazz_pianists / total_pianists) |>
  mutate(ratio_other = (total_pianists - jazz_pianists - classical_pianists - pop_pianists) / total_pianists)|>
  pivot_longer(cols=c("ratio_pop", "ratio_classical", "ratio_jazz", "ratio_other"), names_to="genres", values_to="ratios")


ggplot(data = piano_genre) +
  xlim(1850,2020) +
  scale_y_continuous(labels = scales::label_percent()) +
  geom_line(aes(x=decade, y=ratio_pop), color=rgb(255,105,180, maxColorValue = 255)) +
  geom_line(aes(x=decade, y=ratio_classical), color=rgb(65,105,225, maxColorValue = 255)) +
  geom_line(aes(x=decade, y=ratio_jazz), color=rgb(246,169,15, maxColorValue = 255)) +
  geom_line(aes(x=decade, y=ratio_other)) +
  xlab('Time') +
  ylab('Pianists distribution')+
  scale_color_manual(name="Legend",
                    breaks=c('Pop', 'Classical', 'Jazz', 'Other'),
                    values=c('Pop'=rgb(255,105,180, maxColorValue = 255), 'Classical'=rgb(65,105,225, maxColorValue = 255), 'Jazz'=rgb(246,169,15, maxColorValue = 255), 'Other'='black'))
       
       
ggsave('Pianist_distribution_genre.pdf')
  