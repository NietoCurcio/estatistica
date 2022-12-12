source("measures/centrais.R")
source("measures/dispersao.R")

getAssimetriaPop <- function(variable_vector) {
  m <- getMeanPop(variable_vector)
  Mo <- getModePop(variable_vector)
  # o <- getVarPop(variable_vector)
  o <- getVarAmostral(variable_vector)

  (m - Mo) / o
}

getAssimetriaDistFreq <- function(dFreq) {
  x <- getMeanDistFreq(dFreq)
  Mo <- getModeDistFreq(dFreq)
  s <- getVarDistFreq(dFreq)

  (x - Mo) / s
}