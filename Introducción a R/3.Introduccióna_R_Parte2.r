
#Aritmética vectorial##################################################################################################################
##En el ámbito de los vectores, se pueden llevar a cabo operaciones matemáticas que incluyen la adición, sustracción y la multiplicación 
##EJEMPLO 1. a+b, a = c(4, 0, 3), b = c(-2, 1, 5)
##RESULTADO:
a = c(4, 0, 3)
b = c(-2, 1, 5)
a+b
##[1] 2 1 8

##EJEMPLO 2.
c = c(1, 3, 5, 7)
d = c(1, 2, 4, 8)
c+d
c-d
c*5
##> c+d
##[1]  2  5  9 15
##> c-d
##[1]  0  1  1 -1
##> c+5
##[1]  6  8 10 12
##Posibles errores : longitud de objeto mayor no es múltiplo de la longitud de uno menor

###############################################################################################
# VECTORES en R
#c() se usa para crear vectores 
ine <- c(10,15,12,18)
nom <- c('sam','eli','eddy','Rod')
rare <- c(TRUE, TRUE, FALSE, NA)
dias <- as.Date(c('2010-10-02','2021-3-24','1987-6-14','2018-8-16'))

#ine: vector numérico que almacena los valores numéricos.
#nom: vector de caracteres que almacena los valores de los caracteres.
#rare: logical
#dias: vector de fecha que almacena los valores de fecha.

#Tipo de vector
typeof(ine) #para identificar que tipo de vector es se usa typeof()
#longitud de vector
length(ine) #para saber la longitud se usa length(x)
#Crear vector con nombre 
x <- c(C1='A',C2='B',C3='C')
print(x)
#crear un vector desde una lista 
li <- list('A','B','C')
v <- unlist(li)
print(v)
print(typeof(v))
print(is.vector(v))
#Vector de ceros
v <- integer(6)
print(v)
#vector con longitud especifica
v <- character(5)
print(v)
#Vector de cualquier tipo
x <- vector(mode='logical',length=4)
print(x)
print(is.vector(x))
print(typeof(x))

#Vectores de una Sequencias de números##################################################################################################################
#Existen diversas formas de generar secuencias numéricas. Para lograrlo, tienes la opción de emplea seq y rep
##EJEMPLO 1.
##la secuencia de números menores a 13 
seq(1, 13)
##RESULTADO
##> seq(1, 13)
## [1]  1  2  3  4  5  6  7  8  9 10 11 12 13
##EJEMPLO 2.
##la secuencia de números impares menores que o igual a 13 se puede obtener usando
seq(1, 13, by=2)
##> seq(1, 13, by=2)
##[1]  1  3  5  7  9 11 13
##la secuencia de números impares menores que o igual a 13 se puede obtener usando
seq(3, 15, 2)
##Secuencia de 5 hasta 15
##EJEMPLO 3. Secuencia de 5 hasta 15
seq(from = 5, to = 15)
##Secuencia de 5 hasta 15
seq(5, 15)
##Secuencia de 5 hasta 15
5:15
##EJEMPLO 4.
rep(4, 12)  # Repite el número 4, doce veces
##EJEMPLO 5.
rep(c(8, 4), c(3, 7) )# Repite el número 8, 3 veces y el número 4, 7 veces. 
##EJEMPLO 6.
rep(c(8, 4), each=6) # Repite el número 8 y 4, 6 veces
##EJERCICIO 
#Una secuencia de números menores a 30 
seq(1, 30)
#Una secuencia del 3 al 45 
3:45
#Repite el número 9 y 30, 4 veces cada uno 
rep(c(9, 30), each=4
#Valores faltantes y otros valores especiales#############################################################################################
#los valores faltantes están representados por el símbolo NA (not available). 
#Los valores imposibles (por ejemplo, dividir por cero) se representan con el símbolo NaN (not a number).
# Se pueden hacer secuencias con NAs con "NULL" que representa el objeto nulo en R: es una palabra reservada. NULL a menudo es devuelto por expresiones y funciones cuyo valor no está definido
X=NULL
X[seq(4,40,2)]<- seq(4,40,2)
#RESULTADO 
[1] NA  2 NA  4 NA  6 NA  8 NA 10 NA 12 NA 14 NA 16 NA 18 NA 20 NA 22 NA 24 NA
[26] 26 NA 28 NA 30 NA 32 NA 34 NA 36 NA 38 NA 40

#Prueba de valores faltantes
is.na(x) # devuelve VERDADERO de x falta

m <- c(1,2,3,4,5,6,NA)
is.na(m) # [1] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE

#Excluir valores faltantes de los análisis
x <- c(1,2,3,6,7,8,NA,3)
mean(x) #resultado NA
mean(x, na.rm=TRUE # resultado 4.285714    

#Vectores de caracteres#########################################################################################
#El vector de caracteres en R es un vector de tipo carácter que se utiliza para almacenar cadenas y valores NA.
#EJEMPLO.1
v<-c('adn','arn','proteina')
print(v)
#RESULTADO [1] "adn"  "arn" "proteina" 
#EJEMPLO.2
partesdeuncarro<-c('volante','llanta')
#EJEMPLO.3
z<-c('azul','verde','rojo',2,3) # juntamos caracteres con números y los números se convierten en caracteres
#EJEMPL0.4 # substraer datos de los caracteres
bebidas<-c('jugos','agua','refresco')
substr(v,1,4) #el 1 es el inicio y el 4 es el numero donde para
#RESULTADO [1] "jug" "agu" "ref"
#EJEMPL0.5 # pegar un texto los caracteres
paste(bebidas, "frias")
#RESULTADO [1] "jugos frias"    "agua frias"     "refresco frias"
#EJEMPL0.6 # pegar un texto los caracteres y poner espacios
paste(bebidas, "frias",sep="")
#RESULTADO [1] "jugosfrias"    "aguafrias"     "refrescofrias"
#EJEMPL0.7 # pegar un texto los caracteres, agregar una S y poner espacios
paste(bebidas,"s", "frias",sep="")
[1] "jugossfrias"    "aguasfrias"     "refrescosfrias"
#EJEMPL0.7 # pegar un texto los caracteres y lo hace un caracter
paste("Ximena quiere ",bebidas, collapse = " ")
[1] "Ximena quiere  jugos Ximena quiere  agua Ximena quiere  refresco"
     
#Factores#################################################################################################################################
#Un factor es una variable categórica con un número finito de valores o niveles. 
#En R los factores se utilizan habitualmente para realizar clasificaciones de los datos,
#estableciendo su pertenencia a los grupos o categorías determinados por los niveles del factor.
#Ejemplo.1
sexo <- c("M", "H", "H", "H", "M", "H", "M", "M", "H", "M")
sexo
sexo <- factor(sexo)
#RESULTADO    Levels: H M
#Ejemplo.2
sexo <- factor(sexo,levels=c("H","M"),labels=c("Hombre","Mujer"))  #Converitimos el H a hombre y M a mujer
#RESULTADO [1] Mujer  Hombre Hombre Hombre Mujer  Hombre Mujer  Mujer  Hombre Mujer Levels: Hombre Mujer
 #Ejemplo.3 #enumerar cuanto hay de cada sexo
 table(sexo)
# Hombre  Mujer 
#     5      5 

#Matrices y arreglos####################################################################################################
#"Las matrices y arrays pueden ser descritas como vectores multidimensionales. 
      Al igual que un vector, únicamente pueden contener datos de un sólo tipo,
      pero además de largo, tienen más dimensiones.", 
Las matrices son de dos dimenciones y los arrays son con más de dos dimensiones

#EJEMPLO.1  #MATRIZ SIN ESPECIFICACIONES
matrix(1:15)
#EJEMPLO.2 # Tres renglones y cinco columnas
matrix(1:12, nrow = 3, ncol = 5)
#EJEMPLO.3 # 
la_matriz <- matrix(1:9, nrow = 3, ncol = 3)
la_matriz+1 
#EJEMPLO.4 # con valroes especificos
A=matrix(nrow=3,ncol=3, c(1,2,3,4,5,6,7,8,9))
#EJEMPLO.4 # Array
> a <- array(1:24, c(3, 4, 2))
#DATAFRAMES#######################################################################################################
#"Los data frames son estructuras de datos de dos dimensiones (rectangulares) que pueden contener datos de diferentes tipos, por lo tanto, son heterogéneas"

# EJEMPLO.1  DATAFRAME
Data_Frame <- data.frame (
  entrenamiento = c("Cardio", "Natacion", "tenis"),
  Pulso = c(100, 130, 120),
  Duracion = c(60, 30, 25))
Data_Frame 

# EJEMPLO.2 names() nos permite ver los nombres de las columnas
names(Data_Frame)
# EJEMPLO.3  dimenciones, clase y largo
class(Data_Frame)
Length(Data_Frame)
dim(Data_Frame)

#Datos y tiempos##########################################################################################################
#R dispone en su paquete base de dos clases específicamente diseñadas para tratar con datos de tipo fecha/hora: Date (solo para fechas) y POSIXt (además de la fecha incluye hora y huso horario); esta última clase contiene dos subclases, POSIXct y POSIXlt
#%d 	día (numérico, de 0 a 31)
#%a 	día de la semana abreviado a tres letras
#%A 	día de la semana (nombre completo)
  	 
#%m 	mes (numérico de 0 a 12)
#%b 	mes (nombre abreviado a tres letras)
#%B 	mes (nombre completo)
  	 
#%y 	año (con dos dígitos)
#%Y 	año (con cuatro dígitos)

# EJEMPLO.1 # crear una fecha as.Date()

diademuertos=as.Date("2023-11-01")
diademuertos
class(diademuertos)

# EJEMPLO.2 # crear una fecha as.Date() con otro formato
 diademuertos=as.Date("01/11/2023",format="%d/%m/%Y")
# EJEMPLO.3 # cambio de formatos
navidad=as.Date("2023-12-25")
as.character(navidad, format="%d %b. %Y")## [1] "25 dic. 2023"
as.character(navidad, format="%A, %d de %B de %Y")## [1] "miércoles, 25 de diciembre de 2023"
as.character(navidad, format="%d/%m/%y")## [1] "25/12/23"
# EJEMPLO.4 # dia del sistemas
Sys.Date()

##Fecha y hora en la clase POSIXct-Esta clase permite manejar la hora además de la fecha
fechayhora=as.POSIXct("12/10/2023 12:20:00",format="%d/%m/%Y %H:%M:%S")
class(fechayhora)
#diferencia de horas
as.POSIXct("2013-03-10 08:32:07") - as.POSIXct("2013-03-09 23:55:26")
#Time difference of 8.611389 hours


# Referencias#
#Angelo Santana & Carmen Nieves Hernández,
#Departamento de Matemáticas, ULPGC

#Juan Bosco Mendoza Vega 
#R para principiantes
      
