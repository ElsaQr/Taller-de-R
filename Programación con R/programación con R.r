 ##Programación con R

###################### EXTRA ######
############################################Letters()

############################################Function()
####
function_name <- function(argumento1, argumento2) {
  cuerpo de la función
  return
}
####
#Una función es un bloque de código que sólo se ejecuta cuando se llama.
#EJEMPLO1
my_function <- function(x) {
  return (5 * x)
}

print(my_function(3))
print(my_function(5))
print(my_function(9)) 



#EJEMPLO2
 my_function1 <- function(country = "Norway") {
  paste("I am from", country)
}

my_function1("Mexico")
my_function1("China")

##############Flow control#######################################################################
 Estructuras de control
-las estructuras de control nos permiten controlar la manera en que se ejecuta nuestro código.
-Las estructuras de control establecen condicionales en nuestros código. 

Las estructuras de control más usadas en R son las siguientes.
Estructura de control 	Descripción
if, else 	Si, de otro modo
for 	Para cada uno en
while 	Mientras
break 	Interrupción
next 	Siguiente




#the for()loop###########################################################################################################################
#La estructura for nos permite ejecutar un bucle (loop), realizando una operación para cada elemento de un conjunto de datos

#for(elemento in objeto) {operacion_con_elemento}

#Syntaxis##
#for (i in lista) {
  # Código
# }

#EJEMPLO.1 # 
for (i in -5:5) print(i)

#EJEMPLO.2

for (i in 1:5) {
  print(i + 1)
}

#EJEMPLO.3 #
x<- c(1,2,3,4,5,6,7,8,9)

for(i in 1:8){
 Numeros<- x[i]+4
print (letters[Numeros])
 }

#EJEMPLO.4

for (a in seq(100)) {
  print (a)
}

#EJEMPLO.5
for (a in seq(1,100,2)) {
  print (a)
}


#EJEMPLO.6
primos = c(2,3,5,7,11,13)
for (p in seq(1, 6, 2)) {
  print (primos[p])
}

#EJEMPLO 7
cars <- list("limousine", "cabrio", "suv")
for (x in cars) {
	print (x)
}

#EJEMPLO 8
alumnos <- c("Carmen", "Adriana", "Marco", "Fabi", "Brenda")

for(i in 1:length(alumnos)) { 
  print(paste("Hola,", alumnos[i], sep = " "))
  
  }


#EJEMPLO 9
df <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

## rnorm >> X genera variables aleatorias normales en el espacio X.Entonces se pide generar
#10 variables aleatorias normales

for(i in 1:ncol(df)){
  promedio = median(df[,i])
  print(promedio)
}

#La función ncol R devuelve el número de columnas de una matriz o marco de datos
##########################################################################################################
##########################################################################################################
IF 
##########################################################################################################
##########################################################################################################

##the if () statement#######################################################################################################################
#Un if es la manera de decirle a R:

 #   SI esta condición es cierta, ENTONCES haz estas operaciones.

#El modelo para un if es:

#if(Condición) { operaciones_si_la_condición_es_TRUE}
#EJEMPLO.1
# Se cumple la condición y se muestra "verdadero"
if(4 > 3) {
  "Verdadero"
}
#EJEMPLO.2
# No se cumple la condición y no pasa nada
if(4 > 5) {
  "Verdadero"
}

#EJEMPLO.3
ciudades <- c("Madrid","Bilbao","Barcelona","Donostia","Valencia")
for (ciudad in ciudades) {
  if (nchar(ciudad) > 6) print(ciudad)
}

# IF and ELSE
promedio <- function(calificaciones) {
  mean(calificaciones)
}

promedio(c(6, 7, 8, 9, 8))

#####
promedio <- function(calificaciones) {
  media <- mean(calificaciones)
  
  if(media >= 6) {
    print("Aprobado")
  } else {
    print("Reprobado")
  }
}




##########################################################################################################
##########################################################################################################
While
##########################################################################################################
##########################################################################################################

##the while() loop########################################################################################
#La operación se realiza hasta que se se llega a cumplir un criterio previamente establecido."

#El modelo de while es:

#while(condicion) {operaciones}
#Con esto le decimos a R:MIENTRAS esta condición sea VERDADERA, haz estas operaciones.

# mientras X sea menor a cien, pero hay que interrumpir a while para que se detenga  y se usa x<-x+1 (variable de indexación) para q se detenga hasta q llegue a 100
#

x <- 0

while(x<100) {
  x<-x+1
print(x);
}

# resultado es la iteracion de x<-1+1 y luego x<-2+1 hasta llegar a 100

#EJEMPLO.1
umbral <- 5
valor <- 0

while(valor < umbral) {
  print("Todavía no.")
  valor <- valor + 1
}




#EJEMPLO.2
#En el ejemplo, el ciclo continuará produciendo números que van del 1 al 5. El ciclo se detendrá en 6 porque 6 < 6 es FALSO.
#El bucle while requiere que las variables relevantes estén listas; en este ejemplo necesitamos definir una variable de
#indexación, i, que configuramos en 1.


#EJEMPLO.1
 i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
} 




##########################################################################################################
##########################################################################################################
Repeat
##########################################################################################################
##########################################################################################################

#The repeat loop###########################################################################################################################
#Este es un bucle que se llevará a cabo el número de veces que especifiquemos, usando un break para detenerse. repeat asegura que las operaciones que contiene sean iteradas al menos en una ocasión.
#La estructura de repeat es el siguiente:
#repeat {operaciones un_break_para_detener}
#EJEMPLO.1
valor <-  0
mi_vector <- NULL

repeat{
  valor <- valor + 1
  if(valor == 5) {
    break
  }
}


#EJEMPLO.2
x<-0

 repeat{
  x<-x+5
  print(x)
  if (x==80) break
}

#EJEMPLO.3
 i <- 1
repeat{
  i <- i + 1
  print (i)
  if(i < 26) {
  break
 } 
}



# Resultado
valor
##########################################################################################################
##########################################################################################################
BREAK and NEXT
##########################################################################################################
##########################################################################################################


##break and next statements#################################################################################################################
#"break y next son palabras reservadas en R, no podemos asignarles nuevos valores y realizan una operación específica 
#cuando aparecen en nuestro código.break nos permite interrumpir un bucle, mientras que next nos deja avanzar a la siguiente
#iteración del bucle, “saltándose” la actual. Ambas funcionan para for y while."
#EJEMPLO.1 #BREAK
for(i in 1:10) {
  if(i == 3) {
    break
  }
  print(i)
}

#EJEMPLO.1 #NEXT
for(i in 1:4) {
  if(i == 3) {
    next
  }
  print(i)
}

##Documentation using ######################################################################################################################
#El símbolo # es una forma sencilla de insertar comentarios como títulos y descripciones en funciones y scripts de R

#recognizing that a bug exists#############################################################################################################

##divida su programa en funciones simples e independientes.
###Documenta sus entradas y salidas. Dentro de la función, comprueba que las entradas cumplan con tus suposiciones sobre ellas y piensa en entradas de prueba donde puedas ver de un vistazo si las salidas coinciden con tus expectativas.
####prueba qué sucede cuando intentas un vector de longitud cero, prueba valores muy grandes o muy pequeños, etc.


##Make the bug reproducible#################################################################################################################
#Antes de poder corregir un error, necesitas saber dónde están ocurriendo los problemas. Esto es mucho más fácil si sabes cómo provocar el error. Los errores que aparecen de forma impredecible son extremadamente difíciles de corregir. La buena noticia es que, en su mayoría, las computadoras son predecibles: si les das las mismas entradas, te devuelven las mismas salidas. La dificultad radica en descubrir cuáles son las entradas necesarias.

#Por ejemplo, un error común en la programación es escribir mal el nombre de una variable. Normalmente, esto resulta en un mensaje de error inmediato, pero a veces eliges accidentalmente una variable que realmente existe. Entonces, es probable que obtengas una respuesta incorrecta, y la respuesta que obtengas puede parecer aleatoria, porque depende del valor de alguna variable no relacionada.

#La clave para rastrear este tipo de problema es trabajar arduamente para que el error sea reproducible. Simplifica las cosas tanto como sea posible: inicia una nueva sesión vacía de R y ve si puedes reproducirlo. Una vez que puedas reproducir el error, eventualmente podrás localizarlo.


##identify the cause of the bug#############################################################################################################
#Si tu programa se ha detenido con un error, lee los mensajes de error. Trata de entenderlos lo mejor que puedas.

#En R, puedes obtener información adicional sobre un mensaje de error utilizando la función traceback(). Cuando ocurre un error, R guarda información sobre la pila actual de funciones activas, y traceback() imprime esta lista.

#fixing errors and testing ################################################################################################################
#
#Una vez que hayas identificado el error en tu programa, debes corregirlo. Intenta corregirlo de tal manera que no causes un problema diferente. ¡Luego, prueba lo que has hecho! Debes realizar pruebas que incluyan la forma en que sabes que reproduciría el error, así como casos límite y cualquier otra cosa que puedas pensar.



#referencias

#R para principiantes
#Juan Bosco Mendoza Vega

Ejemplos de https://r-coder.com/for-en-r/, https://rpubs.com/Miguel_Tripp/forloops, https://soka.gitlab.io/blog/post/2019-03-17-r-bucles/
