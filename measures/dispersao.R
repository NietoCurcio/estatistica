source("measures/separatrizes.R")
source("measures/centrais.R")

getATPop <- function(variable_vector) {
  max(variable_vector) - min(variable_vector)
}

getATDistFreq <- function(dFreq) {
  max(dFreq$upperBound) - min(dFreq$lowerBound)
}

getATInterquartilicaPop <- function(variable_vector) {
  Q3 <- getSeparatrizPop("quartil", 3, variable_vector)
  Q1 <- getSeparatrizPop("quartil", 1, variable_vector)

  Q3 - Q1
}

getATInterquartilicaDistFreq <- function(dFreq) {
  Q3 <- getSeparatrizDistFreq("quartil", 3, dFreq)
  Q1 <- getSeparatrizDistFreq("quartil", 1, dFreq)

  Q3 - Q1
}

getDesvioMedioPop <- function(variable_vector) {
  m <- getMeanPop(variable_vector)
  sum(abs(variable_vector - m)) / length(variable_vector)
}

getDesvioMedioDistFreq <- function(dFreq) {
  m <- getMeanDistFreq(dFreq)
  sum(abs(dFreq$xi - m) * dFreq$Fi) / last(dFreq$Fai)
}

getVarPop <- function(variable_vector) {
  m <- getMeanPop(variable_vector)
  sum((variable_vector - m)**2) / length(variable_vector)
}

getVarDistFreq <- function(dFreq) {
  m <- getMeanDistFreq(dFreq)
  sum((dFreq$xi - m)**2 * dFreq$Fi) / (last(dFreq$Fai) - 1)
}

getDesvioPadraoPop <- function(variable_vector) {
  sqrt(getVarPop(variable_vector))
}

getDesvioPadraoDistFreq <- function(dFreq) {
  sqrt(getVarDistFreq(dFreq))
}

getCoefVariacaoPop <- function(variable_vector) {
  o <- getDesvioPadraoPop(variable_vector)
  m <- getMeanPop(variable_vector)

  o / m * 100
}

getCoefVariacaoDistFreq <- function(dFreq) {
  s <- getDesvioPadraoDistFreq(dFreq)
  x <- getMeanDistFreq(dFreq)

  s / x * 100
}