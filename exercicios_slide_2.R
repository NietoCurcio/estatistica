library(tidyverse)

source("dataTable.R")

v <- c("a", "b", "c")
first(v) # same v[1]
last(v) # same as v[length(v)]
nth(v, 2) # same as v[2]

altura_sorted <- data$altura[order(data$altura)]
altura_sorted[-1] # different from python, it actually "removes" the element
AT <- last(altura_sorted) - first(altura_sorted)
k <- round(sqrt(nrow(data)))
h <- AT / k
h

classes <- getKClassesByAmplitudeH(k, h, first(altura_sorted))
xi <- getClassesMean(classes)
Fi <- getAbsoluteFrequencies(classes, altura_sorted)

result <- sum(xi * Fi) / length(altura_sorted)
result

altura_sorted

mean(altura_sorted)
var(altura_sorted)

fakedata <- data.frame(v = c(1, 2, 3))
m <- 6 / 3
mean(m)
v <- ((1 - 2)**2 + (2 - 2)**2 + (3 - 2)**2) / (3 - 1)
v
var(fakedata$v)

getVariance <- function(data, average) {
  s <- 0
  for (i in data) {
    s <- s + ((i - average)**2)
  }
  return(s / (length(data) - 1))
}

getVariance(altura_sorted, mean(altura_sorted))
var(altura_sorted)

getVariance(data$idade, mean(data$idade))
var(data$idade)


## idade
xi <- ((20 * 11) + (24 * 6) + (28 * 2) + (32 * 1) + (36 * 2)) / 22
divisor <- (((20 - xi)**2) * 11) +
  (((24 - xi)**2) * 6) +
  (((28 - xi)**2) * 2) +
  (((32 - xi)**2) * 1) +
  (((36 - xi)**2) * 2)
denominador <- nrow(data) - 1
varianceIdade <- divisor / denominador
varianceIdade
sqrt(varianceIdade)

## altura

id <- ((1.578 * 2) + (1.634 * 6) + (1.69 * 4) + (1.746 * 5) + (1.802 * 5)) / 22
divisor <- (((1.578 - id)**2) * 2) + (((1.634 - id)**2) * 6) + (((1.69 - id)**2) * 4) + (((1.746 - id)**2) * 5) + (((1.802 - id)**2) * 5)
denominador <- nrow(data) - 1
varianceAltura <- divisor / denominador
varianceAltura
sqrt(varianceAltura)
