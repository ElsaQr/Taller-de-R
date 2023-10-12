#Retomardo la clase anterior 
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

ejemplo<-"contandoletras"
nchar(ejemplo)

fecha<-"2023-12-10"
nchar(fecha)

fechaBien<-as.Date("2023-12-10")

fechaBien1<-as.Date("2023-12-10")

#correr la siguiente
fechaBien<-as.Date("12 oct 2023")

# EJEMPLO.2 # crear una fecha as.Date() con otro formato
ResistenciaIndigena =as.Date("12/10/2023",format="%d/%m/%Y")
"2023-10-12"

# EJEMPLO.3 # cambio de formatos
ResistenciaIndigena=as.Date("2023-10-12")
as.character(ResistenciaIndigena, format="%d %b. %Y")
as.character(ResistenciaIndigena, format="%A, %d de %B de %Y")
as.character(ResistenciaIndigena, format="%d/%m/%y")
# EJEMPLO.4 # dia del sistemas
Sys.Date()




#####################################################################
#####################################################################


#cambiando de directorios
#EJEMPLO.1
getwd()# directorio donde estan
[1] "/home/elsaqr"
#EJEMPLO.2
setwd() #cambiar de directorio
setwd("/home/elsaqr/Documentos")

#dump() and source()
#dump()
##"También podemos guardar múltiples objetos de una sola vez utilizando la función dump(). Pasaremos como argumento a la función un vector de caracteres con sus nombres."
#EJEMPLO.1
 a <- seq(1,13)
 b <- seq(3,15,2)
 
dump(c("a", "b"), file = "dataprueba.R") #guardar en el archivo data.R 
rm(x, y) #para borrar x y y
#EJEMPLO.2
v<-c('adn','arn','proteina')
m <- c(1,2,3,4,5,6,NA)
dump(c("m", "v"), file = "dataprueba2.R")

}

##Podemos abrir y ejecutar scripts en R usando la función source(), dandole como argumento la ruta del archivo .R en nuestra computadora, entre comillas.
f <- seq(1,13)
g <- seq(3,15)
dump(c("f", "g"), file = "secuencias1.R")
getwd()
source(file = "secuencias1.R")
str(f) ##"con la función 'str' consultamos la estructura del objeto"
str(g)

rm(f)
rm(g)

f
g

getwd()
source("home/elsaqr/Documentos/secuencias1.R")
source("secuencias1.R")

f

g

#recuperamos los valores de f y g

#Redirecting R output
sink()
sink("solarmean.txt") #Create a file solarmean.txt for output

#EJEMPLO.1
##Retomardo la clase anterior 
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

ejemplo<-"contandoletras"
nchar(ejemplo)

fecha<-"2023-12-10"
nchar(fecha)

fechaBien<-as.Date("2023-12-10")

fechaBien1<-as.Date("2023-12-10")

#correr la siguiente
fechaBien<-as.Date("12 oct 2023")

# EJEMPLO.2 # crear una fecha as.Date() con otro formato
ResistenciaIndigena =as.Date("12/10/2023",format="%d/%m/%Y")
"2023-10-12"

# EJEMPLO.3 # cambio de formatos
ResistenciaIndigena=as.Date("2023-10-12")
as.character(ResistenciaIndigena, format="%d %b. %Y")
as.character(ResistenciaIndigena, format="%A, %d de %B de %Y")
as.character(ResistenciaIndigena, format="%d/%m/%y")
# EJEMPLO.4 # dia del sistemas
Sys.Date()




#####################################################################
#####################################################################


#cambiando de directorios
#EJEMPLO.1
getwd()# directorio donde estan
[1] "/home/elsaqr"
#EJEMPLO.2
setwd() #cambiar de directorio
setwd("/home/elsaqr/Documentos")
##################################################
dump()
###################################################

#dump()
##"También podemos guardar múltiples objetos de una sola vez utilizando la función dump(). Pasaremos como argumento a la función un vector de caracteres con sus nombres."
#EJEMPLO.1
 a <- seq(1,13)
 b <- seq(3,15,2)
 
dump(c("a", "b"), file = "dataprueba.R") #guardar en el archivo data.R 
rm(x, y) #para borrar x y y
#EJEMPLO.2
v<-c('adn','arn','proteina')
m <- c(1,2,3,4,5,6,NA)
dump(c("m", "v"), file = "dataprueba2.R")

##################################################
source()
###################################################

##Podemos abrir y ejecutar scripts en R usando la función source(), dandole como argumento la ruta del archivo .R en nuestra computadora, entre comillas.
f <- seq(1,13)
g <- seq(3,15)
dump(c("f", "g"), file = "secuencias1.R")
getwd()
source(file = "secuencias1.R")
str(f) ##"con la función 'str' consultamos la estructura del objeto"
str(g)

rm(f)
rm(g)

f
g

getwd()
source("home/elsaqr/Documentos/secuencias1.R")
source("secuencias1.R")

f

g

#recuperamos los valores de f y g
##################################################
#sink()
###################################################

#Redirecting R output
sink()
sink("archivo1.txt") #Create a file solarmean.txt for output

#EJEMPLO.1
#crear un archivo
sink("datosexperimento1.txt")

#write this text to file
"here is some text"

#close the external connection
sink() 


###EJEMPLO.2

#agregan nombre
sink("my_data.txt")

#definen el data.fram
df <- data.frame(player=c('A', 'B', 'C', 'D','E'),
                 points=c(12, 29, 24, 30, 19),
                 assists=c(5, 5, 7, 4, 10))

print(df)

#cierran 
sink()

##EJEMPLO 3
#exports the data as csv file
sink('export_dataframe.csv')
edad <- c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25)
tiempo <- c(14.21, 10.36, 11.89, 13.81, 12.03, 10.99, 12.48, 13.37, 12.29, 11.92)
sexo <- c("M","H","H","M","M","H","M","M","H","H")
misDatos <- data.frame(edad,tiempo,sexo)
print(misDatos)
sink()

##EJEMPLO 4
#agregan nombre
sink("matix.txt")
# creando una matriz
X <- matrix(1:6, nrow = 2, ncol = 3)
Y <- matrix(1:4, nrow = 2, ncol = 2)
 
# Tmultiplicar las matrices
outer(X, Y, "*")

#Cerrar 
sink()
















