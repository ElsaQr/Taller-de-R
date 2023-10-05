#cambiando de directorios
#EJEMPLO.1
getwd()# directorio donde estan
[1] "/home/elsaqr"
#EJEMPLO.2
setwd() #cambiar de directorio
setwd("/home/elsaqr/Documentos")

#dump() and source()
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

#Redirecting R output
sink()
sink("solarmean.txt") #Create a file solarmean.txt for output

#EJEMPLO.1
#sinks the data into connection as text file
sink("my_first_sink.txt")

#prints numbers from 1 to 20
for (i in 1:20)
print(i)
sink()

#exports the data as text file
sink('export_dataframe.txt')
airquality
sink()



