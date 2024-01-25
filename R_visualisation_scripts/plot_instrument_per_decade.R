library(tidyverse)

data <- read_delim('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/clean_data.csv', delim = ';')

new_data <- data |> select(decade, instrument_label) |>
  filter(instrument_label == 'Piano') |>
  group_by(decade)

ggplot(data = new_data) +
  aes(x = decade) +
  xlim(1800,2020) +
  xlab('Time') +
  ylab('Number of pianists') +
  ggtitle('Pianists over the decades', subtitle = 'from 1800 onwards') +
  geom_bar()
ggsave('Piano_graph.pdf')