getSeparatrizPop <- function(S, k, variable_vector) {
  # quartil k 1:3, decil k 1:9, percentil k 1:99
  sorted <- variable_vector[order(variable_vector)]

  denominator <- switch(
    S,
    "quartil" = 4,
    "decil" = 10,
    "percentil" = 100
  )

  p <- k / denominator * (length(sorted) + 1)

  lp <- as.integer(p)
  Fp <- p - as.integer(p)

  sorted[lp] + Fp * (sorted[lp + 1] - sorted[lp])
}

getSeparatrizDistFreq <- function(S, k, dFreq) {
  # quartil k 1:3, decil k 1:9, percentil k 1:99

  denominator <- switch(
    S,
    "quartil" = 4,
    "decil" = 10,
    "percentil" = 100
  )

  p <- (last(dFreq$Fai) / denominator) * k

  i <- dFreq[dFreq$Fai >= p, ] %>%
    rownames %>%
    first %>%
    as.integer

  li <- dFreq$lowerBound[i]
  h <- dFreq$upperBound[i] - li
  FaiMinus1 <- if (i > 1) dFreq$Fai[i - 1] else 0
  Fi <- dFreq$Fi[i]

 li + h * (p - FaiMinus1) / Fi
}
