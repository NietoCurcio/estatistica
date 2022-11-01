source("measures/separatrizes.R")

getCurtosePop <- function(variable_vector) {
  Q3 <- getSeparatrizPop("quartil", 3, variable_vector)
  Q1 <- getSeparatrizPop("quartil", 1, variable_vector)

  P90 <- getSeparatrizPop("percentil", 90, variable_vector)
  P10 <- getSeparatrizPop("percentil", 10, variable_vector)

  (Q3 - Q1) / 2 * (P90 - P10)
}

getCurtoseDistFreq <- function(dFreq) {
  Q3 <- getSeparatrizDistFreq("quartil", 3, dFreq)
  Q1 <- getSeparatrizDistFreq("quartil", 1, dFreq)

  P90 <- getSeparatrizDistFreq("percentil", 90, dFreq)
  P10 <- getSeparatrizDistFreq("percentil", 10, dFreq)

  (Q3 - Q1) / 2 * (P90 - P10)
}