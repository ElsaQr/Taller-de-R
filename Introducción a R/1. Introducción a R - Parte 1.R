################################################################################
######## Mario Gutiérrez Rodríguez ########
######## Instituto de Ecología UNAM #######
########      Septiembre 2023     #########
########     INTRODUCCIÓN A R     ########
################################################################################


# Esto es un comentario

# Simbolo de asignacion <-

# Funciones basicas

# Suma
1000 + 123

# Resta
233 - 30

# Exponente
2**3
2^3

# Division
125 / 25

# Multiplicacion
5 * 9

# Notaci??n cientifica
1E-8
1e-8

# Raiz cuadrada
sqrt(8)

# Sumatoria
sum( c(1,2,3,4,5,6,7,8,9) )


# Tipos de variables

# Numericas
x <- 1
y <- 1.2
z <- 3.1416
class(x)

# Logicas
a <- TRUE
b <- FALSE
a == b
a != b
x == y
x < y
class(a)

# Caracter
ejemplo <- "abcde"
class(ejemplo)

# Vectores simbolo "c" de concatenar
vector_1 <- c(1,3,5,7)
vector_1[4]
vector_1[1:3]
vector_1[-4]

vector_2 <- c("a","b", "ab", "c", "a")
vector_2 == "a"
vector_2[vector_2 == "a"]
vector_2 != "a"
vector_2[vector_2 != "a"]

seleccion <- vector_2 != "a"
filtrado <- vector_2[seleccion]
filtrado

#Funciones pre cargadas de R
#Para numeros
abs(-1)
ceiling(3.6)
trunc(3.6)
floor(3.6)
cos(90)
sin(90)
tan(90)
exp(2)
log10(3)
log(3)
log2(3)
max(c(3, 100, 345, 78))
min(c(3, 100, 345, 78))
order(c(3, 100, 345, 78))
sort(c(3, 100, 345, 78))
prod(c(3, 100, 345, 78))
range(c(3, 100, 345, 78))
rev(c(3, 100, 345, 78))
sample(c(3, 100, 345, 78), 1)
summary(c(3, 100, 345, 78))
sum(c(3, 100, 345, 78))
var(c(3, 100, 345, 78))

#Valores preguardados
pi

y <- pi
y

# Veamos otras funciones para manejo de datos
# rnorm() general valores aleatorios con distribución normal
rnorm(100)

x <- rnorm(100)

mean(x)

sd(x)
summary(x)

# Ahora cambiemos el orden de los valores
sort(x)
sort(x, decreasing=TRUE)

# Y grafiquemos (base)
hist(x)

# R distingue entre mayúsculas y minúsculas
# Define dos variables con el mismo nomre
myVariable <- 42
myvariable <- 24

# ¿Son el mismo nombre?
print(myVariable)  
print(myvariable)  

# Con los nombres de las funciones ocurre lo mismo
myVector <- c(1, 2, 3, 4, 5)

meanValue <- Mean(myVector)  # Incorrecto
meanValue <- mean(myVector)  # Correcto

# Ocurre lo mismo con los nombres de las paqueterías
library(GGplot2)  # Incorrecto
library(ggplot2)  # Correcto

# Y con los data frames para, por ejemplo, acceder a sus columnas
myData <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35)
)

print(myData$name)  # Incorrecto
print(myData$Name)  # Correcto

# Y con los strings
string1 <- "Hola"
string2 <- "hola"

result <- string1 == string2 
print(result) 
