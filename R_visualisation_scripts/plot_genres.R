library(tidyverse)

data <- read_delim('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/piano_instrument.csv', delim = ',')

piano_genre <- data |> select(decade, instrument_label, pop_music, classical_music) |>
  mutate(musical = ifelse(instrument_label == "piano", "pianist", "musician")) |>
  select(decade, musical, pop_music, classical_music) |>
  