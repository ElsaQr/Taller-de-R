################################################################################
######## Mario Gutiérrez Rodríguez ########
######## Instituto de Ecología UNAM #######
########      Septiembre 2023     #########
######## HILL EQUATION - TAREA     ########
################################################################################

#¿Conoces la ecueción de Hill?
eq = function(x, b, k, n)((b*x^n)/(k^n+x^n))
eq2 = function(x, b, k, n)((b*k^n)/(k^n+x^n))

par(mfrow=c(2,1))
curve(eq(x, n = 1, b = 1, k = 0.5), from = 0, to = 1, ylim = c(0,1), xlab = "x", ylab = "y", 
      col = 'green', lwd = 3, main = 'Activation')
curve(eq(x, n = 2, b = 1, k = 0.5), from = 0, to = 1, ylim = c(0,1), xlab = "x", ylab = "y", 
      add = T, col = 'blue', lwd = 3)
curve(eq(x, n = 4, b = 1, k = 0.5), from = 0, to = 1, ylim = c(0,1), xlab = "x", ylab = "y", 
      add = T, col = 'yellow', lwd = 3)
legend('topleft', c("n=1", "n=2", "n=4"),lty=1,col=c("green","blue", "yellow"), cex = 0.7, 
       box.lty=0, bty = 'n', y.intersp = 0.3, lwd = 2)


curve(eq2(x, n = 1, b = 1, k = 0.5), from = 0, to = 1, ylim = c(0,1), xlab = "x", ylab = "y", 
      col = 'red', lwd = 2, main = 'Repression')
curve(eq2(x, n = 2, b = 1, k = 0.5), from = 0, to = 1, ylim = c(0,1), xlab = "x", ylab = "y", 
      add = T, col = 'violet', lwd = 2)
curve(eq2(x, n = 4, b = 1, k = 0.5), from = 0, to = 1, ylim = c(0,1), xlab = "x", ylab = "y", 
      add = T, col = 'pink', lwd = 2)
legend('bottomleft', c("n=1", "n=2", "n=4"),lty=1,col=c("red","violet", "pink"), cex = 0.7, 
       box.lty=0, bty = 'n', y.intersp = 0.3, lwd = 2)


########################################################################################
################### ¡TU TURNO! #########################################################
#### Replica las gráficas de activación y represión dadas por la ecuación de Hill
#### pero sin usar R base, ahora hazla utilizando la paquetería de ggplot2
#### el primer paso ya está hecho:

library(ggplot2) #continúa...





