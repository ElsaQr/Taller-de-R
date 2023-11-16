###############################################################################
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

####################################################################################

# revisa en qué directorio estás:
getwd() 

# ir a donde queremos estar (ojo con las diagonales / )

setwd()

install.packages("BoolNet") 

# cargar (invocar) la librería
library(BoolNet) 

# cargar la red
net <- loadNetwork("red_ejemplo.txt")

net  

# mostrar la red
plotNetworkWiring(net)

# obtener atractores

attr <- getAttractors(net)

attr  

# mostrar atractores Verde=1 Rojo=o    Buscar como quitar encimado

plotAttractors(attr, drawLegend = T, drawLabels = T)

# perturbar la red

# asumir que el gen c siempre está apagado

mut = getAttractors(net, genesOFF=c(0,0,1)) #NO
mut=fixGenes(net, "c", 0)
mut
mutatract <- getAttractors(mut)
mutatract

# mostrar atractores con la mutación

plotAttractors(mutatract,drawLegend = F)

# empezamos en (1,0,0) y preguntamos a qué atractor vamos a llegar

getPathToAttractor(net, c(1,0,0)) 

plotStateGraph(attr, piecewise=TRUE)

# nota: actualización asíncrona; fuente de ruido. repetir varias veces y ver si resultados


# coinciden con síncrono, para descartar que resultados sean artefactos del método computacional

att_asymchron = getAttractors(net, type="asynchronous") # asynchronament

plotAttractors(att_asymchron)


## Ahora veremos qué pasa con un atractor cíclico
cell_cyle <- loadNetwork("cellcycle.txt")

cell_cyle

# mostrar red
plotNetworkWiring(cell_cyle)

# obtener atractores
attrCC <- getAttractors(cell_cyle)

attrCC 

# mostrar atractores
plotAttractors(attrCC)

#AHORA LA RED DE FLORACIÓN DE ARABIDOPSIS THALIANA
net = loadNetwork("ATH_flower_cell_fate_determination.net.txt")

# obtener atractores
attr = getAttractors(net)
attr

# mostrar atractores
par(mfrow = c(1,1))
plotAttractors(attr)

# ver como depende la diagonal del ruido (p = 0.0, sin ruido)
EL = epigeneticLandscape(net, p = 0.01)

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
