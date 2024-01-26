library(tidyverse)

data_genre <- read_csv('C:/Users/Mirre/OneDrive/Documenten/Personal/School/Labcourses/Datascience/group_project/People/genre_counter.csv')

data_long <- data_genre |>
  select(-decade, -five_year_bracket) |>
  pivot_longer(everything(), names_to = "genre_instrument", values_to = "n") |>
  separate_wider_delim(genre_instrument, "_", names = c("genre", "instrument")) |>
  group_by(genre, instrument) |>
  summarise(n = sum(n)) 

new_long <- data_long[-c(13,14,15),]

ggplot(data = new_long) +
  aes(x = genre, y = n, fill = instrument) +
  scale_fill_manual(values=c(musicians="gold", guitarists="red", pianists="#0433b5"),
                    labels=c(musicians="Total musicians", guitarists="Guitarists", pianists="Pianists")) +
  labs(fill = "Musician") +
  theme_light() +
  xlab("Genre") +
  ylab("Count") +
  geom_bar(stat="identity", width=.6, position = "dodge") +
  geom_text(aes(label = n), 
            position = position_dodge(width = 0.6), 
            vjust = -0.5, size = 3)
ggsave('musicians_per_genre.pdf', width = 15, height = 10, units = "cm")