library(tidyverse)

data <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

new_data <- data |>
  select(total_pianists, five_year_bracket) |>
  group_by(five_year_bracket)

ggplot(data = new_data) +
  aes(x = five_year_bracket, y = total_pianists) +
  xlim(1800,2020) +
  xlab('Time') +
  ylab('Number of pianists') +
  ggtitle('Pianists over the decades', subtitle = 'from 1800 onwards') +
  geom_col()
ggsave('Piano_graph.pdf')