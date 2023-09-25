################################################################################
######## Mario Gutiérrez Rodríguez ########
######## Instituto de Ecología UNAM #######
########      Septiembre 2023     #########
######## GRÁFICAS CON R BASE  ########
################################################################################

###Gráfica de barras básico
data <- c(10, 15, 7, 20)
labels <- c("A", "B", "C", "D")
barplot(data, names.arg = labels, main = "Bar Chart Básico")

###Gráfico de puntos
data <- c(10, 15, 7, 20)
labels <- c("A", "B", "C", "D")
dotchart(data, labels = labels, main = "Dot Chart Básico")

###Gráfico de pastel (no recomendado)
data <- c(30, 20, 15, 35)
labels <- c("A", "B", "C", "D")
pie(data, labels = labels, main = "Pie Chart Básico")

#Histogramas (como el del script anterior)
data <- rnorm(100)
hist(data, main = "Histograma Básico", xlab = "Valores")

#Gráfico de cajas
data <- c(10, 15, 7, 20, 25)
boxplot(data, main = "Box Plot Básico", ylab = "Values")

#Scatterplot
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 4, 5, 6)
plot(x, y, main = "Scatterplot Básico", xlab = "X", ylab = "Y")

#QQplot
data <- rnorm(100)
qqnorm(data)
qqline(data)

#Para ajustar márgenes
par(mar = c(5, 5, 2, 2))  # este es el orden: (bottom, left, top, right)
plot(1:10, main = "Márgenes ajustados")

#¿Y si quiero agregar más cosas a mi plot?
x <- 1:10
y <- x^2
plot(x, y, type = "l", main = "Adicón a Plots")
text(4, 50, "Texto")
abline(h = 50, col = "red", lty = 2)

#y para establecer ciertos parámetros...
par(cex = 1.1, col = "blue")  # establecemos tamaño del textoy color global
plot(1:10, main = "Parámetros Personalizados", pch = 19, col = "red")

#Regresamos a datos biológicos y veamos cosas más profundas
data(iris)
str(iris)
##Argunmentos para modificación de gráficos##
# type: tipo de grafico 
# pch: forma del símbolo
# cex: tamaño del símbolo
# col: color del símbolo
# bg: color del fondo del símbolo

# main: titulo principal
# xlab y ylab: títulos de los ejes
# cex.lab: tamaño del texto de los títulos de ejes
# cex.axis: tamaño del texto en los ejes
# las: orientación del texto en el eje y
# bty: cambia el tipo de recuadro al rededor de los puntos 

plot(iris$Petal.Length ~ iris$Petal.Width)

plot(iris$Petal.Length ~ iris$Petal.Width, cex=3)

plot(iris$Petal.Length ~ iris$Petal.Width, cex=2, pch=21, col="black", bg="grey")

#scatterplot
plot(iris$Petal.Length ~ iris$Petal.Width, cex=3, pch=21, col="black", bg="grey",
     main="Petal Width vs. Petals Length", xlab="Petal Width", 
     ylab="Petal Length", cex.lab=1.5, cex.axis=1.5, bty="l", las=1)

#boxplot
boxplot(iris$Sepal.Length ~ iris$Species, names=expression(italic("Iris setosa"), 
                                                           italic("Iris versicolor"), italic("Iris virginica")), 
        xlab="Sepal length (cm)", col="blue", cex.lab=1.5, cex.axis=1.5, las=1)

# podemos hacer un gráfico vacío con type="n" y luego irle agregando cosas
plot(iris$Petal.Length ~ iris$Petal.Width, type="n")

plot(iris$Petal.Length ~ iris$Petal.Width, xlab="Petal Width", 
     ylab="Petal Length", cex.lab=1.5, cex.axis=1.5, bty="l", las=1, type="n")

# points para función plot    
points(iris$Petal.Length[iris$Species=="setosa"] ~ 
         iris$Petal.Width[iris$Species=="setosa"])


points(iris$Petal.Length[iris$Species=="setosa"] ~ 
         iris$Petal.Width[iris$Species=="setosa"], pch=19, cex=1.5, col="lightblue")

points(iris$Petal.Length[iris$Species=="versicolor"] ~ 
         iris$Petal.Width[iris$Species=="versicolor"], pch=19, cex=1.5, 
       col="darkorange")

points(iris$Petal.Length[iris$Species=="virginica"] ~ 
         iris$Petal.Width[iris$Species=="virginica"], pch=19, cex=1.5, 
       col="grey50")


# lines   
lines(x=c(0, 2.5), y=rep(mean(iris$Petal.Length[iris$Species=="setosa"]), 2), 
      col="royalblue4", lwd=3)      

lines(x=c(0, 2.5), y=rep(mean(iris$Petal.Length[iris$Species=="versicolor"]), 2), 
      col="orange", lwd=3)      

lines(x=c(0, 2.5), y=rep(mean(iris$Petal.Length[iris$Species=="virginica"]), 2), 
      col="black", lwd=3)      

# agregamos etiquetas con legend
legend(x="topleft", legend=c(expression(italic("Iris setosa")), 
                             expression(italic("Iris versicolor")), expression(italic("Iris virginica"))), 
       pch=19, col=c("lightblue", "darkorange", "grey50"), cex=1.3)

legend(x=1.3, y=2.3, legend=c(expression(italic("Iris setosa")), 
                              expression(italic("Iris versicolor")), expression(italic("Iris virginica"))), 
       pch=19, col=c("lightblue", "darkorange", "grey50"), cex=1.3)


# volvemos a par para dar parámetros al gráfico
par(mar = c(5, 5, 4, 2), family="mono") # comenta esta línea y ve la diferencia en su ausencia

hist(iris$Sepal.Length, breaks=seq(0, 8, 0.5), col="gray70", border="gray40", 
     xlab="", ylab="", main="", axes=FALSE, ylim=c(0,40))

hist(iris$Petal.Length, breaks=seq(0, 8, 0.5), density=30, add=TRUE)

axis(side=1, at=seq(0, 8, 1), cex.axis=2, lwd=2, las=1)
axis(side=2, at=seq(0, 40, 5), cex.axis=1.5, cex.axis=2, lwd=2, las=1)

mtext(text="Length (cm)", side=1, line=3, cex=2)
mtext(text="Specimens", side=2, line=3.5, cex=2)

legend(x="topright", legend=c("Sepals", "Petals"), fill=c("gray70", "black"), 
       density=c(NA, 30), pt.cex=2, border=c("gray40", "black"), cex=2)

#también podemos crear páneles con par
par(mfrow=c(1,2))
plot(iris$Petal.Length ~ iris$Petal.Width, pch=19)
plot(iris$Sepal.Length, iris$Sepal.Width, pch=19, col="blue")

par(mfrow=c(2,1))
plot(iris$Petal.Length ~ iris$Petal.Width, pch=19)
plot(iris$Sepal.Length, iris$Sepal.Width, pch=19, col="red")

#con layout también se crean páneles
div <- matrix(1:3, nrow=3, ncol=1)
div

layout(mat=div)
layout.show(3)

plot(iris$Sepal.Length, iris$Sepal.Width, pch=19, cex.lab=1.5, cex.axis=1.5, 
     xlab="Sepal length (cm)", ylab="Sepal width (cm)")
plot(iris$Sepal.Length, iris$Petal.Length, pch=19, cex.lab=1.5, cex.axis=1.5, 
     xlab="Sepal length (cm)", ylab="Petal length (cm)")
plot(iris$Sepal.Length, iris$Petal.Width, pch=19, cex.lab=1.5, cex.axis=1.5, 
     xlab="Sepal length (cm)", ylab="Petal width (cm)")
plot(iris$Sepal.Length, iris$Petal.Width, pch=19, type="n", axes=F, bty="n", 
     xlab="", ylab="")


div <- matrix(1:4, nrow=2, ncol=2)
div

layout(mat=div)
layout.show(4)

plot(iris$Sepal.Length, iris$Sepal.Width, pch=19, cex.lab=1.5, cex.axis=1.5, 
     xlab="Sepal length (cm)", ylab="Sepal width (cm)")
plot(iris$Sepal.Length, iris$Petal.Length, pch=19, cex.lab=1.5, cex.axis=1.5, 
     xlab="Sepal length (cm)", ylab="Petal length (cm)")
plot(iris$Sepal.Length, iris$Petal.Width, pch=19, cex.lab=1.5, cex.axis=1.5, 
     xlab="Sepal length (cm)", ylab="Petal width (cm)")
plot(iris$Sepal.Length, iris$Petal.Width, pch=19, type="n", axes=F, bty="n", 
     xlab="", ylab="")
mtext("Sepal length", line=-3, cex=1.5)
mtext("versus", line=-5, cex=1.5)
mtext("other variables", line=-7, cex=1.5)
mtext("in Anderson's Iris", line=-9, cex=1.5)

# otra estructura de panel
div <- matrix(c(1,1,2,1), nrow=2, ncol=2)
div

layout(mat=div)
layout.show(2)

plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Petal.Length)

# y le cambiamos el tamaño
layout(mat=div, widths=c(2, 1), heights=c(1, 2))
layout.show(2)

plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Petal.Length)
