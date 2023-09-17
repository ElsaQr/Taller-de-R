################################################################################
######## Mario Gutiérrez Rodríguez ########
######## Instituto de Ecología UNAM #######
########      Septiembre 2023     #########
######## ESTRUCTURA DE DATOS EN R  ########
################################################################################


# R opera en estructuras de datos:
# - Vectores
# - Matrices
# - Listas
# - Data frames
# - Funciones (esto no se verá en este script)

# En la primera sección de este curso aprendimos a usar vectores y manejar su
# contenido.

################################################################################
# Matrices

# Una matriz es una estructura rectangular, que contiene datos de un solo tipo.
#
# Son usadas principalmente en operaciones matemáticas y estadística.

# Para crear una matriz usaremos la función matrix()
#
# Si usamos la función sin proporcionar el número de renglones o columnas que
# deseamos crear, por defecto hará el acomodo de los datos en una sola columna.

1:12 # esto sería un vector con una secuencia de 12 números

matrix(1:12) # así quedaría arreglado en una matriz de una sola columna

# Si especificamos el número de renglones que deseamos en la matriz, el arreglo
# será diferente.
matrix(1:12, nrow = 3)

# Notemos que los datos comienzan a llenar las columnas de
# arriba a abajo y de izquierda a derecha.

# Si le indicamos un número de columnas y renglones menor al del número de datos,
# se usarán los que cubran los espacios en la matriz y el resto se descartará
matrix(1:12, nrow = 3, ncol = 3)

# Por otro lado, si le indicamos un número de columnas y renglones que sobrepasa
# el número de datos disponibles, los datos se reciclan.
matrix(1:12, nrow = 4, ncol = 4)

# Operaciones con matrices

# Podemos aplicar operaciones matemáticas a las matrices
matriz1 <- matrix(1:12, nrow = 3)

# sumas y restas
matriz1 + 1

# multiplicación y división
matriz1 * 2

# potenciación
matriz1 ^ 3

# transposición
t(matriz1)

# operaciones entre matrices

matriz1 + matriz1

matriz1 * matriz1


################################################################################
# Listas
#
# Una lista es una colección ordenada de objetos, conocidos como componentes.
#
# ¿Cuáles son sus características?
#
# - Los componentes pueden ser de diferente tamaño y clase.
# - Las listas pueden contener vectores, matrices, cadenas de caracteres,
# data frames, funciones, etc.
#
# Para crear una lista usaremos la función list()
#
# Veamos un ejemplo:
frutas <- list(fruta = "manzana", unidades = 5,
               caracteristicas = c("roja","pequeña","dulce") )

# ¿Cómo se ve esta lista? Vamos a imprimirla en la consola
frutas

# Ahora usemos la función View()
View(frutas)

# Observemos que sus componentes se encuentran numerados, de manera que podemos
# referirnos a ellos por su posición en la lista.
#
# ¿Cómo extraemos el elemento "fruta"?
frutas[1]
frutas[[1]]

# ¿Cuál es la diferencia entre estas dos opciones?
# Vamos a revisar de qué clase es cada una de ellas
class(frutas[1])
class(frutas[[1]])

# Por qué son dos salidas diferentes? Veamos la estructura de vagones en un tren

# Ahora, vamos a explorar los elementos del componente "caracteristicas"
# Si el componente tiene múltiples elementos, usamos una segunda numeración
# para referirnos al elemento deseado

# Para extraer la primera característica de la manzana (el color):
frutas[[3]][1]

# ¿Cómo extraerías la característica que se refiere al dulzor de la fruta?

# Otra forma de extrar los componentes de una lista es usando el símbolo $ y el
# nombre del componente que deseamos extraer.

frutas$unidades
frutas$caracteristicas

# Esto es muy útil porque puede ser más fácil recordar el nombre del componente
# que su posición en la lista.

# Ahora, ¿cómo extraemos los elementos del componente característica usando $?

frutas$caracteristicas[1]

# ¿Cómo extraerías la característica que se refiere al dulzor de la fruta,
# usando $ ?


# EJERCICIO TEMA MARIO: Generemos una nueva lista:
jugadores <- list(nombre = c("Julie", "Juan", "Sofia"),
                  edad = c(22, 29, 34),
                  estatura = c(1.62, 1.75, 1.65))


# ¿Cómo podemos conocer la estatura de Sofía?
#
# ¿Cómo podemos obtener la edad de Julie y Juan al mismo tiempo?

# Como alternativa, podemos usar el nombre del componente dentro de los
# corchetes
jugadores[["edad"]][1:2]

################################################################################
# Data frames

# Un data frame es una lista de vectores de la misma longitud en una estructura
# rectangular, que R representa de forma similar a una tabla.

# ¿Cuáles son sus características?
#
# - Su información está organizada en renglones y columnas.
# - Sus vectores deben tener la misma longitud.
# - Cada columna puede contener un tipo diferente de datos.
#
# Para crear un data frame usaremos la función data.frame().
#
# Veamos un ejemplo:

clima <- data.frame(dia = c(1,2,3,4,5),
                    temperatura = c(26,25,26,27,27),
                    nublado = c(1,0,0,1,1),
                    velocidad_viento = c(5,3,2,3,6) )
clima

# ¿Cuáles son las dimensiones de mi data frame?

# dim() nos mostrará el número de filas y columnas del data frame
dim(clima)

# nrow() nos mostrará el número de filas
nrow(clima)

# ncol() nos mostrará el número de columnas
ncol(clima)

# ¿Cuál es el nombre de las columnas y renglones de mi data frame?

# rownames() nos muestra el nombre de los renglones
rownames(clima)

# colnames() nos muestra el nombre de las columnas
colnames(clima)

# Estas funciones también nos ayudan a cambiar los nombres de las columnas
# y renglones

colnames(clima)[4] <- "velocidad_viento"

rownames(clima) <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")

clima

# Otras formas de crear data frames

# Podemos crear un data frame a partir de una lista, siempre que sus
# componentes tengan la misma longitud

df_jugadores <- as.data.frame(jugadores)
df_jugadores

# Podemos importar un data frame desde un archivo usando la función read.table()
pinguinos <- read.table("pinguinos.txt")
pinguinos

# Esta función tiene diversas opciones que podemos consultar con la ayuda

help("read.table")

# ¿Cómo exporto mi data frame?
#
# Podemos usar la función write.table()
write.table(jugadores, "jugadores.txt", quote = FALSE, row.names = FALSE)

# Para ver los parámetros disponibles en esta función consultemos la ayuda
help("write.table")

# R contiene sets de datos de ejemplo.
# Podemos acceder a sets de datos en español con el paquete "datos" que podemos
# instalar desde CRAN con
# install.packages("datos")

# ¿Cómo seleccionamos elementos del data frame?
# La sintaxis para acceder a los elementos de un data frame es
# nombre_del_dataframe[renglones, columnas]

# Veamos el renglón 5 del data frame pingüinos
pinguinos[5,]

# Veamos la columna 1 del data frame pingüinos
pinguinos[,1]

# Veamos los primeros 5 renglones
pinguinos[1:5,]

# Veamos los primeros 5 renglones y sólo la primera y segunda columnas
pinguinos[1:5,1:2]

# Veamos los primeros 5 renglones y las columnas 1,3 y 7
pinguinos[1:5,c(1,3,7)]

# Veamos todo el set de datos, excepto la columna 7
pinguinos[,-7]

# También podemos seleccionar los datos usando su nombre de renglón o columna
pinguinos["1", "especie"]

# Así como en las listas, también podemos usar el símbolo $ para seleccionar una
# columna del data frame
pinguinos$isla

# Y seleccionar elementos contenidos en la columna
pinguinos$isla[1:3]

# En el data frame "clima" ¿Cómo obtendrías el valor de la temperatura del Viernes?


# Explorando los datos de un data frame
#
# Existen algunas funciones que nos ayudan a darle un vistazo a los datos

# attributes() nos muestra el nombre de las columnas y renglones, así como la
# clase de nuestro objeto
attributes(pinguinos)

# str() nos muestra la clase de cada vector que compone nuestro data frame
str(pinguinos)

# summary() nos muestra datos estadísticos de cada uno de los vectores en el
# data frame
summary(pinguinos)

# Filtrando datos de un data frame
#
# Los corchetes nos ayudan a seleccionar datos que cumplen con una condición

# Seleccionemos los datos de los pingüinos del año 2009
pinguinos[pinguinos$anio == 2009,]

# Seleccionemos los datos de los pingüinos del año 2009 y tomemos sólo el nombre
# de la especie
pinguinos[pinguinos$anio == 2009,1]

# Seleccionemos los pingüinos con un largo de pico mayor a la media
media_pico <- mean(pinguinos$largo_pico_mm)

pinguinos[pinguinos$largo_pico_mm > media_pico,]

# ¿Cómo seleccionarías a los pingüinos que viven en la isla "Dream" ?

