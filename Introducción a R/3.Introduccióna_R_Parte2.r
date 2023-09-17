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

#Vector de patrón simple##################################################################################################################
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
##Secuencia de 5 hast 15
seq(5, 15)
##Secuencia de 5 hast 15
5:15
##EJEMPLO 4.
rep(4, 12)  # Repite el número 4, doce veces
##EJEMPLO 5.
rep(c(8, 4), c(3, 7) )# Repite el número 8, 3 veces y el número 4, 7 veces. 
##EJEMPLO 6.
rep(c(8, 4), each=6) # Repite el número 8 y 4, 6 veces
##EJERCICIO 
Una secuencia de números menores a 30   = seq(1, 13)
Una secuencia del 3 al 45 = 3:45
Repite el número 9 y 30, 4 veces cada uno = rep(c(9, 30), each=4
#Valores faltantes y otros valores especiales#############################################################################################
#Vectores de caracteres###################################################################################################################
#Factores#################################################################################################################################
#Más sobre la extracción de elementos de vectores#########################################################################################
#Matrices y arreglos######################################################################################################################
#marcos de datos##########################################################################################################################
#Datos y tiempos##########################################################################################################################
