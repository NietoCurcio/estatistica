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
source("distFreqClasses.R")
source("measures/centrais.R")
source("measures/separatrizes.R")
source("measures/dispersao.R")
source("measures/assimetria.R")
source("measures/curtose.R")

variable_name <- "idade"

variable <- data[[variable_name]]
variable
distFreq <- getDistDf(variable)
distFreq

getMeasuresByPop <- function(variable_name, variable_pop) {
  print(paste0("Measures population data - ", variable_name))

  centrais <- c(
    str_glue("x̄ = {getMeanPop(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("Md = {getMedianPop2(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("Mo = {getModePop(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    "",
    "",
    ""
  )

  separatrizes <- c(
    str_glue("Q1 = {getSeparatrizPop('quartil', 1, variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("Q3 = {getSeparatrizPop('quartil', 3, variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("P10 = {getSeparatrizPop('percentil', 10, variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("P90 = {getSeparatrizPop('percentil', 90, variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    "",
    ""
  )

  dispersao <- c(
    str_glue("AT = {getATPop(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("dq = {getATInterquartilicaPop(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("Dm = {getDesvioMedioPop(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("o^2 = {getVarPop(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("o = {getDesvioPadraoPop(variable_pop) %>% round(2) %>% format(nsmall = 2)}"),
    str_glue("cv = {getCoefVariacaoPop(variable_pop) %>% round(2) %>% format(nsmall = 2)}")
  )


  As <- getAssimetriaPop(variable_pop)
  simetria <- c(
    str_glue("As = {As %>% round(2) %>% format(nsmall = 2)}"),
    paste0(
      ifelse(
        As == 0,
        "Simétrica",
        ifelse(
          As < 0,
          "neg - l sk",
          "pos - r sk"
        )
      )
    ),
    "",
    "",
    "",
    ""
  )

  K <- getCurtosePop(variable_pop)
  curtose <- c(
    paste0("K = ", K %>% round(2) %>% format(nsmall = 2)),
    paste0(
      ifelse(
        K < 0.263,
        "Lepto",
        ifelse(
          K == 0.263,
          "Meso",
          "Plati"
        )
      )
    ),
    "",
    "",
    "",
    ""
  )

  data.frame(
    centrais,
    separatrizes,
    dispersao,
    simetria,
    curtose,
    row.names = NULL
  )
}

getMeasuresByDistFreq <- function(variable_name, variable_dist) {
  print(paste0("Measures sample data - ", variable_name))

  centrais <- c(
    paste0("x̄ = ", getMeanDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("Md = ", getMedianDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("Mo = ", getModeDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)),
    "",
    "",
    ""
  )

  separatrizes <- c(
    paste0("Q1 = ", getSeparatrizDistFreq("quartil", 1, variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("Q3 = ", getSeparatrizDistFreq("quartil", 3, variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("P10 = ", getSeparatrizDistFreq("percentil", 10, variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("P90 = ", getSeparatrizDistFreq("percentil", 90, variable_dist) %>% round(2) %>% format(nsmall = 2)),
    "",
    ""
  )

  dispersao <- c(
    paste0("AT = ", getATDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("dq = ", getATInterquartilicaDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("Dm = ", getDesvioMedioDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("s2 = ", getVarDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("s = ", getDesvioPadraoDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2)),
    paste0("cv = ", getCoefVariacaoDistFreq(variable_dist) %>% round(2) %>% format(nsmall = 2))
  )

  As <- getAssimetriaDistFreq(variable_dist)
  simetria <- c(
    paste0("As = ", As %>% round(2) %>% format(nsmall = 2)),
    paste0(
      ifelse(
        As == 0,
        "Simétrica",
        ifelse(
          As < 0,
          "neg - l sk",
          "pos - r sk"
        )
      )
    ),
    "",
    "",
    "",
    ""
  )

  K <- getCurtoseDistFreq(variable_dist)
  curtose <- c(
    paste0("K = ", K %>% round(2) %>% format(nsmall = 2)),
    paste0(
      ifelse(
        K < 0.263,
        "Lepto",
        ifelse(
          K == 0.263,
          "Meso",
          "Plati"
        )
      )
    ),
    "",
    "",
    "",
    ""
  )

  data.frame(
    centrais,
    separatrizes,
    dispersao,
    simetria,
    curtose,
    row.names = NULL
  )
}

getMeasuresByPop(variable_name, variable)

getMeasuresByDistFreq(variable_name, distFreq)

# Dúvidas,
# 1. o h nao precisa ser necessariamente arredondado?

# 2. a distribuição de frequencia em classe nao necessariamente implica
# que deve ser usada a formula amostral no slide de variancia o N e o n-1
# pode ser aplicado para dist. de freq. p populacional e amostral.
# Como saber quando usar qual? A tabela 1 é populacional? A tabela 10 é amostral?