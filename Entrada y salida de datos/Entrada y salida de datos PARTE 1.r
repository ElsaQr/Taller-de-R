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
x <- "TallerDeR"
y <- data.frame(a = 3L, b = "a")
 
dump(c("x", "y"), file = "data.R") #guardar en el archivo data.R 
rm(x, y) #para borrar x y y
#EJEMPLO.2
##Podemos abrir y ejecutar scripts en R usando la función source(), dandole como argumento la ruta del archivo .R en nuestra computadora, entre comillas.

source(file = "data.R")
> str(y) ##"con la función 'str' consultamos la estructura del objeto"

source("C:/Mis scripts/mi_script.R")
source("path/to/some/file.R")

#Redirecting R output
sink()
sink("solarmean.txt") #Create a file solarmean.txt for output

#EJEMPLO.1
#
sink("sink-examp.txt")
i <- 1:10
outer(i, i, "*")
sink()

#EJEMPLO.2

#exports the data as csv file
sink('export_dataframe.csv')
edad <- c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25)
tiempo <- c(14.21, 10.36, 11.89, 13.81, 12.03, 10.99, 12.48, 13.37, 12.29, 11.92)
sexo <- c("M","H","H","M","M","H","M","M","H","H")
misDatos <- data.frame(edad,tiempo,sexo)
print(misDatos)
sink()




