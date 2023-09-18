 ##Programación con R
##############Flow control#######################################################################
#the for()loop###########################################################################################################################
#La estructura for nos permite ejecutar un bucle (loop), realizando una operación para cada elemento de un conjunto de datos

#for(elemento in objeto) {operacion_con_elemento}
#"I" ES UN OBJETO
#EJEMPLO.1 # "Vamos a obtener el cuadrado de cada uno de los elementos en un vector numérico del 1 al 6, que representa las caras de un dado."
dado <- 1:6

for(cara in dado) {
  dado ^ 2 
}

##the if () statement#######################################################################################################################
#Un if es la manera de decirle a R:

 #   SI esta condición es cierta, ENTONCES haz estas operaciones.

#El modelo para un if es:

#if(Condición) { operaciones_si_la_condición_es_TRUE
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
##the while() loop##########################################################################################################################
#"Este es un tipo de bucle que ocurre mientras una condición es verdadera (TRUE). La operación se realiza hasta que se se llega a cumplir un criterio previamente establecido."

#El modelo de while es:

#while(condicion) {operaciones}
#Con esto le decimos a R:MIENTRAS esta condición sea VERDADERA, haz estas operaciones.
#EJEMPLO.1
umbral <- 5
valor <- 0

while(valor < umbral) {
  print("Todavía no.")
  valor <- valor + 1
}

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

# Resultado
valor

##break and next statements#################################################################################################################
#"break y next son palabras reservadas en R, no podemos asignarles nuevos valores y realizan una operación específica cuando aparecen en nuestro código.break nos permite interrumpir un bucle, mientras que next nos deja avanzar a la siguiente iteración del bucle, “saltándose” la actual. Ambas funcionan para for y while."
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

