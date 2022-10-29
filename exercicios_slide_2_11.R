#### Question 3
# calcular:
# media, mediana, moda
# q1, q3, d4, p95
# dm, variancia s^2, desvio padrao s e coeficiente de variação coefV
# Medida de assimetria e curtose
# construir boxplot para cada uma das variaveis (Li, Q1, Md, Q3 e Ls)
# para as variaveis: idade, altura, peso, numero de reprovações e numero de irmaos

library(stringr)
library(tidyverse)

source("dataTable.R")
source("helpers.R")
source("helpers_centrais.R")

name_variable <- "idade"

variable <- data[[name_variable]]
variable
distFreq <- getDistDf(variable)
distFreq

getMeasuresByPop <- function(name_variable, variable_pop) {
  print(paste0("Measures population data - ", name_variable))

  centrais <- c(
    str_glue("x̄ = {getMeanPop(variable_pop) %>% round(2) %>% format(nsmall = 2)\n}"),
    str_glue("Md = {getMedianPop2(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("Mo = {getModePop(variable_pop) %>% round(2) %>% format(nsmall = 2)}")
  )

  data.frame(
    centrais,
    row.names = NULL
  )
}

getMeasuresByPop(name_variable, variable)

getMeasuresByDistFreq <- function(name_variable, variable_dist) {
  print(paste0("Measures sample data - ", name_variable))

  centrais <- c(
    "x̄ = ${getMeanDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)}",
    "Md = ${getMedianDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)}",
    "Mo = ${getModeDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)}"
  ) %>% str_interp

  data.frame(
    centrais,
    row.names = NULL
  )
}

getMeasuresByDistFreq(name_variable, distFreq)

