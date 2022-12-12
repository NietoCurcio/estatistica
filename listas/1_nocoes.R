library(ggplot2)

source("measures/centrais.R")
source("measures/dispersao.R")
source("measures/assimetria.R")
source("distFreqClasses.R")

### 1.a
# seção - qualitativa nominal
# Admin. - quantitativa discreta
# Direito. - quantitativa discreta
# Red.. - quantitativa continua
# Estat. - quantitativa discreta
# Ingles. - qualitativa ordinal
# Metod. - qualitativa ordinal
# Politica - quantitativa continua
# Econ. - quantitativa continua

### 1.b

# Direito e estatística é quant. discreta, enquanto política é quant. continua.
# Direito e estatísticas tem dominio os numeors inteiros, politica tem domínio nos numeros reais

Direito <- c(9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9)
Politica <- c(9, 6.5, 9, 6, 6.5, 6.5, 9, 6, 10, 9, 10, 6.5, 6, 10, 10, 9, 10, 6, 6, 6, 6.5, 6, 9, 6.5, 9)
Estatistica <- c(9, 9, 8, 8, 9, 10, 8, 8, 9, 8, 10, 7, 7, 9, 9, 7, 8, 9, 4, 7, 7, 8, 10, 9, 9)
Redacao <- c(8.6, 7, 8, 8.6, 8, 8.5, 8.2, 7.5, 9.4, 7.9, 8.6, 8.3, 7, 8.6, 8.6, 9.5, 6.3, 7.6, 6.8, 7.5, 7.7, 8.7, 7.3, 8.5, 7)
Metodologia <- c("A", "C", "B", "C", "A", "A", "C", "C", "B", "C", "B", "B", "C", "B", "B", "A", "C", "C", "C", "B", "B", "A", "C", "A", "A")

data <- data.frame(
  Direito,
  Politica,
  Estatistica,
  Redacao,
  Metodologia
)

m <- getMeanPop(data$Direito)
me <- getMedianPop2(data$Direito)
mo <- getModePop(data$Direito)
m == me & me == mo
ggplot(data = data, aes(x = Direito)) + geom_freqpoly(binwidth = 1)

m <- getMeanPop(data$Estatistica)
me <- getMedianPop2(data$Estatistica)
mo <- getModePop(data$Estatistica)
getAssimetriaPop(data$Estatistica)
ggplot(data = data, aes(x = Estatistica)) + geom_freqpoly(binwidth = 1)

getVarAmostral(data$Direito)
getVarAmostral(data$Politica)
getVarAmostral(data$Estatistica)

### 1.c

data$Redacao

ggplot(data = data, aes(x = Redacao)) +
  geom_histogram(binwidth = 0.5, boundary = 7.3, closed = "left") +
  scale_x_continuous(breaks = seq(min(data$Redacao), max(data$Redacao), by = 0.5)) +
  scale_y_continuous(breaks = seq(0, length(data$Redacao), by = 1))


length(data$Redacao[data$Redacao >= 8.3 & data$Redacao < 8.8])

### 1.d

paste0(
  length(data$Metodologia[data$Metodologia == "A"]) / length(data$Metodologia) * 100,
  "%"
)

### 2.a

# Curso Completo - qualitativa ordinal
# Idade - quantitativa discreta
# Anos de empresa - quantitativa discreta
# Salário - quantitativa continua

Curso <- c("superior", "superior", "médio", "médio", "médio", "médio", "médio", "médio", "fundamental", "fundamental")
Idade <- c(34, 43, 31, 37, 24, 25, 27, 22, 21, 26)
AnosEmpresa <- c(5, 8, 6, 8, 3, 2, 5, 2, 3, 3)
Salario <- c(1100, 1450, 960, 960, 600, 600, 600, 450, 450, 450)

data <- data.frame(
  Curso,
  Idade,
  AnosEmpresa,
  Salario
)

### 2.b

ggplot(data = data, aes(x = Curso)) + geom_bar()

### 2.c

# Por meio de distribuição de freq em classes

distFreq <- getDistDf(data$Idade)
distFreq

### 2.d

filtered_data <- data[data$AnosEmpresa > 3, ]

getMeanPop(filtered_data$Salario)
getMedianPop2(filtered_data$Salario)
getModePop(filtered_data$Salario)

v <- getVarAmostral(filtered_data$Salario)
sqrt(v)

getAssimetriaPop(filtered_data$Salario)
# assimetria positiva, right skewed (cauda levemente à direita)

ggplot(data = filtered_data, aes(x = Salario)) + geom_freqpoly(binwidth = 100)
ggplot(data = filtered_data, aes(x = Salario)) +
  geom_histogram(binwidth = 100, boundary = 1050, closed = "left") +
  scale_x_continuous(breaks = seq(min(data$Salario), max(data$Salario), by = 100))

ggplot(data = filtered_data, aes(x = AnosEmpresa, y = Salario, color = Curso)) + geom_point()
ggplot(data = filtered_data, aes(x = AnosEmpresa, y = Salario, color = Curso)) + geom_line()

Q1 <- getSeparatrizPop("quartil", 1, data[["Salario"]])
Li <- Q1 - 1.5 * getATInterquartilicaPop(data[["Salario"]])
Mediana <- getMedianPop2(data$Salario)
Q3 <- getSeparatrizPop("quartil", 3, data[["Salario"]])
Ls <- Q3 + 1.5 * getATInterquartilicaPop(data[["Salario"]])

sort(data$Salario)
quantile(data$Salario)
summary(data$Salario)

Q1
Li
Mediana
Q3
Ls

ggplot(data = data, aes(x = Salario)) + geom_boxplot()

b <- boxplot(data$Salario)
b$stats

ggplot(data = data, aes(x = Curso, y = Salario)) + geom_boxplot()

### 3.a

# Sim, pela lei dos grandes números, quanto maior for amostra,
# maior é a representatividade da população

# ou Falso, pois depende da metolodogia de amostragem, como por exemplo se os dados
# foram amostras coletadas aleatoriamente (sem ser tendenciosa)

### 3.b

# Sim, dado que a amplitude entre uma barra ou outra pode ser diferente para cada histograma,
# caso a mesma quantidade de elementos corresponda a um intervalo na barra do histograma A e o
# mesmo ocorra com o histograma B, os histogramas terão o mesmo formato. Além disso os valores das
# variáveis podem ser diferentes, mas a amplitude entre os valores pode ser igual. Caso haja a
# necessidade das amplitudes no eixo X também serem iguais entao é Falso

v1 <- data.frame(v = c(0, 1, 2, 3, 4, 5, 6))
ggplot(data = v1, aes(x = v)) +
  geom_histogram(binwidth = 3, closed = "left", boundary = 3) +
  scale_x_continuous(breaks = seq(min(v1$v), max(v1$v), by = 3))
# 0 1 2 3 4 5 6
# 3 | 4
# 0-3-6

v2 <- data.frame(v = c(2, 4, 6, 8, 10, 12, 14))
ggplot(data = v2, aes(x = v)) +
  geom_histogram(binwidth = 6, closed = "left", boundary = 8) +
  scale_x_continuous(breaks = seq(min(v2$v), max(v2$v), by = 6))
# 2 4 6 8 10 12 14
# 3 | 4
# 2-8-14

### 3.c

# Falso, dado que o box-plot de duas variaveis diferentes é igual, isso apenas significa que
# a limite inferior, primeiro quartil, mediana, terceiro quartil e limite superior são iguais,
# as variaveis podem ser diferentes

v1 <- c(4, 3, 2, 1, 6, 5)
Q1 <- getSeparatrizPop("quartil", 1, v1)
Li <- Q1 - 1.5 * getATInterquartilicaPop(v1)
Mediana <- getMedianPop2(v1)
Q3 <- getSeparatrizPop("quartil", 3, v1)
Ls <- Q3 + 1.5 * getATInterquartilicaPop(v1)

Ls

v2 <- c(1, 2, 3, 4, 5, 6)
Q1 <- getSeparatrizPop("quartil", 1, v2)
Li <- Q1 - 1.5 * getATInterquartilicaPop(v2)
Mediana <- getMedianPop2(v2)
Q3 <- getSeparatrizPop("quartil", 3, v2)
Ls <- Q3 + 1.5 * getATInterquartilicaPop(v2)

### 4.a

transporte <- c(2, 3, 2, 1, 2, 1, 2, 1, 2, 3, 1, 1, 1, 2, 2, 3, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 3)
t <- table(transporte)
transports <- names(t)
names(t) <- NULL
t <- as.vector(t)
data <- data.frame(transporte = transports, Fi = t)

### 4.b

ggplot(data = data, aes(x = transporte, y = Fi)) + geom_col()

### 4.c

length(transporte[transporte >= 2]) / length(transporte)

# É de aproximadamente 50%

### 5.a

cicatriz <- c(15, 17, 16, 15, 17, 14, 17, 16, 16, 17, 15, 18, 14, 17, 15, 14, 15, 16, 17, 18, 18, 17, 15, 16, 14, 18, 18, 16, 15, 14)
c <- table(cicatriz)
cnames <- names(c)
names(c) <- NULL
c <- as.vector(c)
data <- data.frame(cicatrizacao = factor(as.numeric(cnames)), Fi = c)

### 5.b

length(cicatriz[cicatriz < 16]) / length(cicatriz)

### 5.c

data$velocidade <- factor(
  cut(
    as.numeric(levels(data$cicatrizacao)),
    breaks = c(0, 15, as.numeric(max(levels(data$cicatrizacao)))),
    right = TRUE,
    labels = c("Fast", "Slow")
  )
)

value <- data$Fi
group <- data$velocidade
piechart.data <- data.frame(
  value = value,
  group = group
)
ggplot(piechart.data, aes(x = "", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_brewer(palette = "Set1")

### 6.a

# variavel Faixas, que representa o intervalo com amplitude 4 em kilometros

### 6.b

# 438
# 0-4-8 - 12 - 16 - 20

### 6.c