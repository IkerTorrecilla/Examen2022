library(dplyr)

df = read.csv("covid19-download.csv")

df$ratecases_total = as.numeric(df$ratecases_total)


df_fitrado_meses = df %>% filter(date > "2024-03-21")


df_casos_total = df_fitrado_meses %>% 
  group_by(prname) %>% 
  summarise(casos_totales = sum(ratecases_total, na.rm = TRUE), numero_muertes = sum(ratedeaths, na.rm = TRUE)) %>% 
  arrange(desc(casos_totales))


