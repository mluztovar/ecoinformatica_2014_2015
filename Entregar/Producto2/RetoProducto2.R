rutaFicheros <- "~/ecoinformatica_2014_2015/producto2/"

info<-read.csv(paste(rutaFicheros,"robles_ecoinfo.csv",sep=""), header = T, sep = ",", dec=".")
indice<- subset(info, select=-c(x,y))

n_cluster<-3
cluster<-kmeans(indice,n_cluster, iter.max=200)
cluster[[1]]
cluster$size
resultado<-subset(info,select=c(x,y))
head(resultado)
resultado<-cbind(resultado, cluster[[1]])
head(resultado)
str(resultado)
colnames(resultado)[3]<-"cluster"

head(resultado)
#Pintamos
plot(resultado)


n_cluster <- 3
library(sp)
library(rgdal)
library(classInt)
library(RColorBrewer)
## definimos las coordenadas de los puntos
coordinates(resultado) =~x+y
## definimos el sistema de coordenadas WGS84
proj4string(resultado)=CRS("+init=epsg:23030")
## obtenemos n_cluster colores para una paleta de colores que se llama "Spectral", para cada cluster creado
plotclr <- rev(brewer.pal(n_cluster, "Spectral"))
## plot, asignando el color en función del cluster al que pertenece
plot(resultado, col=plotclr[resultado$cluster], pch=19, cex = .6, main = "Distribución del robledal en Sierra Nevada")