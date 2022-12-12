library(ggplot2)
library(tidyverse)

source("dataTable.R")

data
length(data$idade[data$idade == 24])

#### Question 3

### Barchart

ggplot(data, aes(x = sexo)) +
  geom_bar(width = 0.5) +
  scale_y_continuous(breaks = seq(0, 22, by = 1))

### Piechart 1, src: https://r-graph-gallery.com/piechart-ggplot2.html

fi.estado.civil <- data %>% count(estado.civil) %>% pull(n)
group <- levels(data$estado.civil)
piechart1.data <- data.frame(
  value = fi.estado.civil,
  group = group
)

ggplot(piechart1.data, aes(x = "", y = fi.estado.civil, fill = group)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0)

### Piechart 2

data.transporte <- data %>% count(transporte)
fi.transporte <- data.transporte$n
group <- data.transporte$transporte
piechart2.data <- data.frame(
  value = fi.transporte,
  group = group
)

piechart2.data <- piechart2.data %>%
  arrange(desc(group)) %>%
  mutate(prop = value / sum(piechart2.data$value) * 100) %>%
  mutate(ypos = cumsum(prop) - 0.5 * prop)

ggplot(piechart2.data, aes(x = "", y = prop, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  theme_void() +
  theme(legend.position = "none") +
  geom_text(aes(y = ypos, label = group), color = "white", size = 5) +
  scale_fill_brewer(palette = "Set1")

### Comparative chart

data %>% group_by(info, sexo) %>% count() # or
data %>% group_by(info, sexo) %>% tally()
# tally is a lower-level function that assumes we've done the grouping
# data %>% tally(info, sexo) # it does not works
# or even
datainfobysex <- data %>% count(info, sexo)
glimpse(datainfobysex)

# Another approach using facets:
# 1.
# ggplot(datainfobysex, aes(x = info, y = n)) +
#   geom_col() +
#   scale_y_continuous(breaks = seq(0, 22, by = 1)) +
#   facet_grid(. ~ sexo)
# 2.
# ggplot(datainfobysex, aes(x = sexo, y = n)) +
#   geom_col() +
#   scale_y_continuous(breaks = seq(0, 22, by = 1)) +
#   facet_grid(. ~ info)
# 3.
# ggplot(datainfobysex, aes(x = "", y = n)) +
#   geom_col() +
#   scale_y_continuous(breaks = seq(0, 22, by = 1)) +
#   facet_grid(sexo ~ info)

# position documentation available at:
# https://www.rdocumentation.org/packages/ggplot2/versions/3.3.6/topics/geom_bar
ggplot(datainfobysex, aes(x = info, fill = sexo, y = n)) +
  geom_col(position = "dodge") +
  scale_y_continuous(breaks = seq(0, 22, by = 1))

# Difference between geom_bar and geom_col, with geom_col we must pass the y value,
# whereas geom_bar it will use as y axis the number of frequency of a categorical variable.
# Side note: for continues values, use geom_histogram(binwidth = 10)
# (binwidth as 10 is just an example)

#### Question 4

sort(data$peso)
peso2 <- data$peso[order(data$peso)]
length(peso2[peso2 >= 46 & peso2 <= 50])
length(peso2[peso2 >= 50 & peso2 <= 54])
length(peso2[peso2 >= 52 & peso2 <= 58])

### Hist and frequency polygon for weight and height

ggplot(data, aes(x = peso)) +
  geom_histogram(binwidth = 4) +
  scale_x_continuous(breaks = seq(min(data$peso), max(data$peso), by = 4))

ggplot(data, aes(x = peso)) +
  geom_freqpoly(binwidth = 4) +
  scale_x_continuous(breaks = seq(min(data$peso), max(data$peso), by = 4))

## Height

ggplot(data, aes(x = altura)) +
  geom_histogram(binwidth = 0.04, boundary = 0.99, closed = "left") +
  scale_x_continuous(breaks = seq(min(data$altura), max(data$altura), by = 0.04))

## Comparing by sex

ggplot(data, aes(x = altura)) +
  geom_histogram(binwidth = 0.04, boundary = 0.99, closed = "left") +
  scale_x_continuous(breaks = seq(min(data$altura), max(data$altura), by = 0.04)) +
  facet_grid(sexo ~ .)

ggplot(data, aes(x = altura, color = sexo)) +
  geom_freqpoly(binwidth = 0.04) +
  scale_x_continuous(breaks = seq(min(data$altura), max(data$altura), by = 0.04))

ggplot(data, aes(x = altura, fill = sexo)) +
  geom_histogram(binwidth = 0.04, , boundary = 0.99, closed = "left", position = "dodge") +
  scale_x_continuous(breaks = seq(min(data$altura), max(data$altura), by = 0.04))


data %>% filter(sexo == "M") %>% count(altura)

data$altura[order(data$altura)]

## disapprovals

ggplot(data, aes(x = disc)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = seq(min(data$disc), max(data$disc), by = 1)) +
  scale_y_continuous(breaks = seq(0, nrow(data), by = 1))
