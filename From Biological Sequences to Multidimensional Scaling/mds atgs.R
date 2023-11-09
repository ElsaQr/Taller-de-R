##########################################################################
#ANÁLISIS DE ESCALAMIENTO MULTIDIMENSIONAL con Proteínas
##########################################################################
#El MDS es una técnica
#multivariante de interdependencia que trata de representar en un espacio geométrico de
#pocas dimensiones las proximidades existentes entre un conjunto de objetos o de
#estímulos

##########################################################################
library(BiocManager)
library(seqinr)
library(msaR)
library(bios2mds) #amap, e1071,scales, BioGenerics,parallel
library(Biostrings) # necesita  cluster, MASS, Matrix, mgcv, nlme, spatial, survival
library(readr)
########################################################################a veces puedes necesitar
#library(amap)
#library(e1071)
#library(scales)
#library(cluster)
#library(BioGenerics)  #BiocManager::install("BiocGenerics")
#library(parallel) BiocManager::install("Parallel")
#importar y hacer las matrices de diferencias 

GNRHR <- import.fasta("_outEGL3392MDS.fasta", aa.to.upper = TRUE, gap.to.dash = TRUE)
#####################################################################################################
active <- mat.dif(GNRHR , GNRHR )

#####################################################################################################
mmds(active, pc = 3, group.file = NULL)  #AQUI SALEN LOS VALORES PC
salida <-mmds(active, pc = 3, group.file = NULL)

write.csv(x = salida$coord, file = "EGL3_PC3.csv", row.names = TRUE)
write.csv(x = salida$source, file = "EGL3_socurce.csv", row.names = TRUE)

### ver los datos#############################################################################################################

scree.plot(salida$eigen.perc, lab = TRUE, title = "Scree plot of metric MDS of EGL3")
graph1scree1<-scree.plot(salida$eigen.perc, lab = TRUE, title = "Scree plot of metric MDS of EGL3")
pdf(graph1scree1)
##ver los datos de PC#############################################################################################################
mmds.2D <- mmds.2D.plot(salida, title = "Sequence EGL3")
#############################################################################################################

#sacar los clusters

cooord <- salida$coord
K <- kmeans.run(cooord, nb.clus = 3, nb.run = 1000, iter.max = 10000,memmds.2D <- mmds.2D.plot(salida, title = "Sequence EGL3")thod = "euclidean")
K

##########################GRAFICAR GGPLOT #############################################################################################################
library(ggplot2) 
library(ggrepel)

#filePC<-read.csv("MDScompletoEGL3.csv") # checar que el archivo este separado por comas si no no corre
filePC<-read.csv("MDScompletoEGL3este3.csv") # checar que el archivo este separado por comas si no no corre


#############la gráfica simple#####################################################################################################

eg=ggplot(filePC,aes(x = x, y = y, label = name)) + geom_point(aes(size=3,color = factor(gear)))
eg

##para ver todos los nombres
#svg
#svg("EGL3392mdsALLnames.svg")
eg + geom_label_repel (aes(label = name),box.padding = 0.5, max.overlaps = Inf,alpha= 0.5)
dev.off()

#para que se vean algunos nombres
svg("EGL3392mdsnamescolor.svg")
eg  +   geom_label(aes(fill= factor(gear)),colour = "white", fontface = "bold",alpha=0.9)  + theme_classic()
dev.off()
##########################GRAFICAR GGPLOT########################3D PLOT
#install.packages("scatterplot3d")
library("scatterplot3d") # load

filePC<-read.csv("MDScompletoEGL3este3.csv")
x<-PC1<-filePC$x
y<-PC2<-filePC$y
z<-PC3<-filePC$z
#svg("3DEGL3scarlettplotmds3D.svg")
#png("3DEGL3scarlettplotmds3D.png")
scatterplot3d(x,y,z) #FUNCIONO
#dev.off()

############################3d better
##########################GRAFICAR GGPLOT########################3D PLOT####
################################
library("scatterplot3d")
filePC<-read.csv("MDScompletoEGL3este3.csv")
#svg("3DEGL3mds392.svg")
filePC$pcolor[filePC$gear==1] <- "red"
filePC$pcolor[filePC$gear==2] <- "green"
filePC$pcolor[filePC$gear==3] <- "blue"


with(filePC, {
    s3d <- scatterplot3d(x, y, z,        # x y and z axis
                  color=pcolor, pch=16,
                  angle=30,        # circle color indicates no. of cylinders
                  scale.y=.75,                 # scale y axis (reduce by 25%)
                  main="EGL3",
                  xlab="PC1",
                  ylab="PC2",
                  zlab="PC3")
     s3d.coords <- s3d$xyz.convert(x, y, z)
     text(s3d.coords$x, s3d.coords$y,     # x and y coordinates
          labels=filePC$name,       # text to plot  labels=row.names(name),
          pos=4, cex=.5)                  # shrink text 50% and place to right of points)
# add the legend
legend("topleft", inset=.05,      # location and inset
    bty="n", cex=.5,              # suppress legend box, shrink text 50%
    c("1", "2", "3"), fill=c("red", "green", "blue"))
})

dev.off()

################################################################################################################################################################
################################################################################################################################################################
##########################GRAFICAR GGPLOT########################3D PLOT#### OTRO estilo SIN LA CAJA
################################
library("scatterplot3d")
filePC<-read.csv("MDScompletoEGL3este3.csv")
#svg("3DEGL3mdssincaja392.svg")
filePC$pcolor[filePC$gear==1] <- "red"
filePC$pcolor[filePC$gear==2] <- "green"
filePC$pcolor[filePC$gear==3] <- "blue"


with(filePC, {
    s3d <- scatterplot3d(x, y, z,        # x y and z axis
                  color=pcolor, pch=16,
                  #type="h",
                  box=FALSE,
                  lty.hplot=2,
                  angle=30,        # circle color indicates no. of cylinders
                  scale.y=.75,                 # scale y axis (reduce by 25%)
                  main="EGL3",
                  xlab="PC1",
                  ylab="PC2",
                  zlab="PC3")
     s3d.coords <- s3d$xyz.convert(x, y, z)
     text(s3d.coords$x, s3d.coords$y,     # x and y coordinates
          labels=filePC$name,       # text to plot  labels=row.names(name),
          pos=4, cex=.5)                  # shrink text 50% and place to right of points)
# add the legend
legend("topleft", inset=.05,      # location and inset
    bty="n", cex=.5,              # suppress legend box, shrink text 50%
    c("1", "2", "3"), fill=c("red", "green", "blue"))
})

dev.off()

##########################GRAFICAR GGPLOT########################3D PLOT#### OTRO estilo SIN LA CAJA
################################
library("scatterplot3d")
filePC<-read.csv("MDScompletoEGL3este3.csv")
#svg("3DEGL3mdssincajalineas392.svg")
filePC$pcolor[filePC$gear==1] <- "red"
filePC$pcolor[filePC$gear==2] <- "green"
filePC$pcolor[filePC$gear==3] <- "blue"


with(filePC, {
    s3d <- scatterplot3d(x, y, z,        # x y and z axis
                  color=pcolor, pch=16,
                  type="h",
                  box=FALSE,
                  lty.hplot=2,
                  angle=30,        # circle color indicates no. of cylinders
                  scale.y=.75,                 # scale y axis (reduce by 25%)
                  main="EGL3",
                  xlab="PC1",
                  ylab="PC2",
                  zlab="PC3")
     s3d.coords <- s3d$xyz.convert(x, y, z)
     text(s3d.coords$x, s3d.coords$y,     # x and y coordinates
          labels=filePC$name,       # text to plot  labels=row.names(name),
          pos=4, cex=.5)                  # shrink text 50% and place to right of points)
# add the legend
legend("topleft", inset=.05,      # location and inset
    bty="n", cex=.5,              # suppress legend box, shrink text 50%
    c("1", "2", "3"), fill=c("red", "green", "blue"))
})

dev.off()
