################################################################################
######## Mario Gutiérrez Rodríguez ########
######## Instituto de Ecología UNAM #######
########      Septiembre 2023     #########
######## ENTRADA Y SALIDA DE DATOS P2######
################################################################################

getwd() #¿Dónde estamos?

setwd(dir="") # ¿Dónde queremos trabajar?

getwd() # Confirmamos

# Lista los archivos y carpetas en el directorio de trabajo:
list.files()
dir()

# 1. read.table: abre marco de datos 
# 2. load: abre cualquier objeto de R
# 3. source: abre un 'script' de R

# 4. write.table: guarda un marco de datos
# 5. save: guarda cualquier objeto de R

help(read.table)

## PRINCIPALES ARGUMENTOS:
# 1. file: El nombre del archivo a abrir - y su dirección si el archivo no está
#    en el directorio de trabajo.
# 2. header: TRUE o FALSE. TRUE si la primera fila del archivo representa 
#    los nombres de las columnas.
# 3. sep: El caracter que se usa para separar valores, más frecuentemente: "\t"
#    o ",". 

data <- read.table(file = "pinguinos.txt", header = TRUE)
data <- read.table(file = "pinguinos.txt", header = TRUE, sep = "\t")

# archivo en la computadora:
data <- read.table(file = file.choose(), header = TRUE, sep = "\t")

class(data)
names(data)

summary(data)

# Guardar tabla de datos

help(write.table)

data # datos que creamos

list.files(agrega_path) # La lista de archivos en el directorio especificado
# en *path.to.files*

write.table(x = data, file = "data.txt", row.names = FALSE, sep = "\t")

list.files() # La lista actualizada de archivos en el directorio 


# Podemos volver a abrir el archivo que creamos:
data2 <- read.table(file = "data.txt", header = TRUE, sep = "\t")

identical(data, data2)

# Guardar objetos
help(save)

save(data, file = "data.RData")

load("data.RData")
dir()

save.image(file = "Taller_R.RData")

#También podemod cargar datos de documentos de Excel
# la paquetería "readxl" facilita leer archivos *.xlsx si no se quiere transformar a *.csv
# Este ejemplo es con datos de cinéticas de crecimiento de raíz primaria de Brenda López
library("readxl")
library("ggplot2")

my_data <- read_excel("Cinetica_Col_0.xlsx")
my_data

day <- c(5, 6, 7, 8, 9, 10, 11, 12)
mean <- apply(my_data[1:8,], 2, mean) #sacar media por renglon
sd <- apply(my_data[1:8,], 2, sd) #sacar desviacion por renglon

df <- data.frame(day, mean, sd)
df

#Podemos guardar este data frame nuevo con medias y desviaciones en *.csv
write.csv(df, file="Col0_mean_sd.csv")

#graficamos con ggplot2 (paquetería que se profundizará más adelante)
ggplot(df, aes(x=day,y=mean)) + geom_point() + geom_line() + theme_bw() + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd)) + 
  labs(title = 'Col-0 MS', x = 'Days after germination (dag)', y = 'Root length (cm)')


# la gráfica sólo se muestra en la interface, ¿y si la quiero guardar?
png(filename="cinnetica_col0.png", width=480*13, height=480*10, 
    pointsize=12*1.5, res=600) 

ggplot(df, aes(x=day,y=mean)) + geom_point() + geom_line() + theme_bw() + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd)) + 
  labs(title = 'Col-0 MS', x = 'Days after germination (dag)', y = 'Root length (cm)')

dev.off() 


