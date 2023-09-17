################################################################################
######## Mario Gutiérrez Rodríguez ########
######## Instituto de Ecología UNAM #######
########      Septiembre 2023     #########
######## REDES BOOLEANAS (ARABIDOPSIS)#####
### Modificado de Dra. Dominguez-Hüttinger#
################################################################################

# Cargar librer?as
library(Rlab)
library(BoolNet)
library(BoolFilter)
library(devtools)
install_github("mar-esther23/boolnet-perturb")
library(dplyr)
library(BoolNetPerturb)

#AQUÍ VOY A PONER LA INTRO A PAQUETERÍA BOOLNET


net = loadNetwork("ATH_flower_cell_fate_determination.net.txt")

# obtener atractores
attr = getAttractors(net)
attr

# mostrar atractores
par(mfrow = c(1,1))
plotAttractors(attr)

# ver como depende la diagonal del ruido (p = 0.0, sin ruido)
EL = epigeneticLandscape(net, p = 0.01)

# ?cu?l es la probabilidad de pasar de un atractor 5
# al 3 con un valor de p = 0.01?
EL[5,3]

# tercera parte  #######################################################

# tama?os de las cuencas de atracci?n
basinsize = seq(1, 10, by=1)

for (ii in 1:length(basinsize)){
  basinsize[ii] = attr$attractors[[ii]]$basinSize
}

n <- 13 # no.variables en el modelo
basinsize_norm <- basinsize/(2^n) # normalizar tama?os de las cuencas

# anadir una diagonal (que se vea que no hay relaci?n lineal)
par(mfrow = c(1,1), din = c(1,1))
plot(diag(as.matrix(EL)), basinsize_norm, pch = 20, cex = 1, 
     xlab = "prob de permanecer en el atractor", 
     ylab = "tama?o de cuenca normalizado",cex.lab = 0.8,las=0.8)
lines(x = c(min(diag(as.matrix(EL))), max(diag(as.matrix(EL)))),
      y = c(min(basinsize_norm), max(basinsize_norm)))

# gr?fica entre tama?os de las cuencas y prob de transici?n de atractor 
# j a atractor 1, j = 1, 2, ..., 10
# efecto de las transiciones no se atribuye directamente al tama?o de las cuencas
plot(EL[,1], basinsize_norm, pch = 20, cex = 1, 
     xlab = "probabilidad de transici?n",
     ylab = "tama?o de cuenca normalizado", cex.lab = 0.8)



# parte cuatro #########################################################

# si empiezas en atractor 1 despu?s de 100 pasos cu?l es la probabilidad de
# permanecer en 1

## simular una cadena de markov, 100 pasos
P = as.matrix(EL)
Nsteps <- 100 # number of steps
pi0 = c(1,0,0,0,0,0,0,0,0,0) # distribuci?n de probabilidad inicial: x(0) =
v = vector("numeric", Nsteps) # creat un vector vac?o de tama?o (prealocar)
r = length(pi0) # tama?o para la muestra de la distribuci?n inicial 

v[1] = 1 #sample(r, 1, prob=pi0) 
# la primer entrada del vector es una muestra de 1,2 r
# la probabilidd de obtener cada uno de estos elementos est? dada por pi0

# Una sola realizaci?n de la cadena
for (i in 2:Nsteps){
  v[i] = sample(r, 1, prob=P[v[i-1],]) # muestrea el nuevo valor: 
  # selecciona el rengl?n en la matriz de probabilidades que da el vector 
  # de probabilidad de acuerdo con el estado actual
}

# mostrar cadena
matplot(v, type="l", lwd=2.5, col=3,  xlab="t", ylab="Attractor")

## ahora, vamos a iterar varias veces, para sacar el promedio de 
# las veces que cada atractor fue visitado en cada paso de tiempo,
# es decir, la probabilidad del atractor i al tiempo N, para i = 1,2,3
iterations=500

# matriz para guardar las cadenas 
V = matrix(nrow = iterations, ncol = Nsteps)
V[,1] = rep(1, iterations)

for (jj in 1:iterations){
  for (i in 2:Nsteps){
    V[jj, i] = sample(r, 1, prob=P[v[i-1],]) 
  }
}

# probabilidad de estar en atractor 1 al tiempo 75
mean(V[, 75] == 1)


plot(seq(1,100), colMeans(V[,] == 3), type = "l")