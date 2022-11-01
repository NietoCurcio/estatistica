getKClassesByAmplitudeH <- function(k, h, currentLowerBound) {
  l <- list()

  for (i in 1:k) {
    lowerBound <- currentLowerBound
    upperBound <- currentLowerBound + h

    l[[i]] <- c(round(lowerBound, 2), round(upperBound, 2))

    currentLowerBound <- upperBound
  }

  return(l)
}

getClassesMean <- function(classes) {
  classes %>% sapply(mean, simplify = "vector")
}

getAbsoluteFrequencies <- function(classes, variableVector) {
  fi <- c()

  len <- length(classes)

  for (i in seq_len(len)) {
    lowerAndUpperBounds <- classes[[i]]

    if (i < len)
      filter <- variableVector >= lowerAndUpperBounds[1] & variableVector < lowerAndUpperBounds[2]
    else
      filter <- variableVector >= lowerAndUpperBounds[1] & variableVector <= lowerAndUpperBounds[2]

    variableVectorInClass <- length(variableVector[filter])
    fi[i] <- variableVectorInClass
  }

  return(fi)
}

getAccumlatedFrequencies <- function(Fi) {
  v <- c()
  s <- 0

  for (i in seq_along(Fi)) {
    s <- s + Fi[i]
    v[i] <- s
  }

  return(v)
}

getIntervals <- function(classes_list) {
  intervals <- c()

  len <- length(classes_list)

  for (i in seq_len(len))
    intervals[i] <- if (i < len) "|--- " else "|---|"

  return(intervals)
}

getDistDf <- function(variable_vector) {
  AT <- max(variable_vector) - min(variable_vector)
  k <- round(sqrt(length(variable_vector)))
  h <- AT / k

  classes <- getKClassesByAmplitudeH(k, h, min(variable_vector))
  xi <- getClassesMean(classes)
  Fi <- getAbsoluteFrequencies(classes, variable_vector)
  Fai <- getAccumlatedFrequencies(Fi)

  lowerBound <- classes %>% sapply(first)
  intervals <- getIntervals(classes)
  upperBound <- classes %>% sapply(last)

  distDf <- data.frame(
    lowerBound,
    intervals,
    upperBound,
    xi,
    Fi,
    Fai
  )
}