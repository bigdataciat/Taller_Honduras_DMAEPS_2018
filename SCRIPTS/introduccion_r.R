
# Introduccion a r, curso de mineria de datos en agricultura
# Hugo Andreso Dorado
# 3 de julio 2018

123

# Ayuda en R

?lm

help.start()

help.search('anova')

# Manipulacion de objetos en R

n <- 5

n

nombre

nombre <- 'angela'

nombre

# Identificar y asignar la carpeta de trabajo

getwd() # Donde estamos ubicados

setwd('C:/Users/hadorado/Desktop/TALLER_EN_R_JULIO_2018')

getwd()

# Instalar paquetes

# install.packages('ggplot2')

library(ggplot2) # cargar libreria

# Tipo de objetos

# Vectores

edad <- c(26,32,18,31,29,21)
id   <- 1:6 # Lista de valores ordenada
id
sexo <- c('M','M','M','F','M','F')
peso <- c(48.3,60.1,55.4,78.2,60.1,80)

# Identificar el tipo de objeto

is(edad)
is(sexo)

# Extraer parte de un vector

sexo[4] 
peso[2:4]
edad[c(1,4)]

# Listas

list <- list(sexo,nombre,n)

list[[2]]

# Ingresar valores perdidos

altura <- c(1.60,NA,1.8,NA,1.60,1.80)
altura

# Crear data.frame

individuos <- data.frame(id,edad,peso,sexo, altura)

individuos

# Extraer partes del data.frame

individuos$peso

individuos[,5]

individuos$altura

individuos[2,]


#Cargar base de datos de Iris.

data("iris")
data_iris <- iris

summary(data_iris)
str(data_iris)
head(data_iris, 4)
tail(data_iris)


