## media

getMeanPop <- function(variable_vector) {
  s <- sum(variable_vector)
  return(s / length(variable_vector))
}

getMeanDistFreq <- function(dFreq) {
  s <- sum(dFreq$xi * dFreq$Fi)
  return(s / last(dFreq$Fai))
}

## mediana

getMedianPop1 <- function(variable_vector) {
  sorted <- variable_vector[order(variable_vector)] # or sort(variable)

  len <- length(variable_vector)
  if (len %% 2 == 1) {
    idx <- (len + 1) / 2
    Md <- sorted[idx]
  } else {
    idx <- (len) / 2
    Md <- (sorted[idx] + sorted[idx + 1]) / 2
  }

  return(Md)
}

getMedianPop2 <- function(variable_vector) {
  sorted <- variable_vector[order(variable_vector)]

  p <- 0.5 * (length(sorted) + 1)

  lp <- as.integer(p)
  Fp <- p - as.integer(p)

  sorted[lp] + Fp * (sorted[lp + 1] - sorted[lp])
}

getMedianDistFreq <- function(dFreq) {
  p <- last(dFreq$Fai) / 2

  # distFreq[distFreq$Fai >= 18.5, ] or distFreq %>% subset(distFreq$Fai >= 18.5)
  # preserves the rownames of the dataframe, to preserve it with tidyverse we have to
  # create a column for the rownames then turn that column to rownames:

  i <- dFreq %>%
    rownames_to_column("rn") %>%
    filter(Fai >= p) %>%
    column_to_rownames("rn") %>%
    rownames %>%
    as.integer %>%
    first

  li <- dFreq$lowerBound[i]
  h <- dFreq$upperBound[i] - li
  FaiMinus1 <- if (i > 1) dFreq$Fai[i - 1] else 0
  Fi <- dFreq$Fi[i]

 li + h * (p - FaiMinus1) / Fi
}

## moda

getModePop <- function(variable_vector) {
  freq_vector <- table(variable_vector) # or data.frame(table(vector))
  as.numeric(names(freq_vector[freq_vector == max(freq_vector)]))
}

getModeDistFreq <- function(dFreq) {
  i <- dFreq[dFreq$Fi >= max(dFreq$Fi)] %>%
    rownames %>%
    as.integer %>%
    first


  li <- dFreq$lowerBound[i]
  h <- dFreq$upperBound[i] - li
  Fi <- dFreq$Fi[i]
  FiMinus1 <- if (i > 1) dFreq$Fi[i - 1] else 0
  FiPlus1 <- if (i < length(dFreq$xi)) dFreq$Fi[i + 1] else 0

  li + (h * (Fi - FiMinus1) / ((Fi - FiMinus1) + (Fi - FiPlus1)))
}