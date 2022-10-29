sexo <- c("F", "F", "F", "F", "M", "F", "F", "M", "F", "M", "M", "F", "F", "M", "M", "F", "M", "M", "F", "M", "F", "M")
estado.civil <- c("Solteiro", "Solteiro", "Solteiro", "Solteiro", "Casado", "Solteiro", "Solteiro", "Separado", "Solteiro", "Solteiro", "Solteiro", "Solteiro", "Solteiro", "Casado", "Solteiro", "Solteiro", "Solteiro", "Casado", "Solteiro", "Solteiro", "Solteiro", "Solteiro")
transporte <- c("Próprio", "Coletivo", "Próprio", "Coletivo", "Coletivo", "Coletivo", "Coletivo", "Próprio", "Próprio", "Próprio", "Próprio", "Próprio", "Próprio", "Próprio", "Próprio", "Coletivo", "Coletivo", "Próprio", "Próprio", "Próprio", "Próprio", "Próprio")
info <- c("TV", "Revista", "TV", "TV", "TV", "Rádio", "TV", "Internet", "TV", "Internet", "TV", "TV", "TV", "TV", "TV", "TV", "Internet", "Internet", "Jornal", "TV", "TV", "Jornal")
peso <- c(58, 59, 55, 60, 83, 58, 70, 62, 63, 75, 66, 46, 64, 80, 62, 68, 80, 82, 55, 58, 65, 62)
altura <- c(1.6, 1.65, 1.64, 1.73, 1.76, 1.62, 1.72, 1.71, 1.63, 1.79, 1.82, 1.68, 1.69, 1.82, 1.83, 1.63, 1.71, 1.80, 1.62, 1.74, 1.55, 1.73)
disc <- c(2, 0, 0, 2, 2, 5, 0, 2, 1, 2, 2, 4, 0, 3, 2, 2, 0, 3, 2, 3, 1, 4)
idade <- c(20, 26, 18, 25, 35, 20, 29, 23, 20, 20, 20, 30, 18, 37, 25, 20, 21, 25, 24, 19, 21, 22)

data <- data.frame(
  sexo = sexo,
  estado.civil = factor(estado.civil, levels = c("Solteiro", "Casado", "Separado")),
  transporte = transporte,
  info = info,
  peso = peso,
  altura,
  disc,
  idade
)
