library(raster)
#install.packages(c("rgdal"))
library(rgdal)

setwd("~/Ejemplo/RetosMluz")

rutaImagenes <- "~/ecoinformatica_2014_2015/RetosDesarrollo"

horas <- c("12","13","14","15")

## vector vacio para ir acumulando los vectores
valores <- c() 

for(indice in horas){
  ##imagenes <- list.files(path="../Ejemplo/RetosDesarrollo/", full.names = TRUE, pattern=paste("_",horas[indice],"..\\.jpg\\.asc$",sep=""))
  imagenes <- list.files(path=rutaImagenes, full.names = T, pattern=paste("_",indice,"..\\.jpg\\.asc$",sep=""))
  print(imagenes)  ##lo hago para ver las imagenes que ha leido hasta ahora
  ## hacemos el stack de imagenes
  stack <- stack(imagenes)
  ## calculamos las media con el mean
  media <- mean(stack)
  print(media)  ##para ver la media que llevamos para las imagenes que hemos leido
  ## "1" calculamos la media de todas las celdas (cellStats)
  mediaCeldas <- cellStats(media,stat='mean')
  print(mediaCeldas)  ##vemos la media total de todas las celdas 
  ## usamos el rbind para concatenar el vector con el valor calculado en "1"
  valores <- rbind(valores,mediaCeldas)
}

# pintar el vector valores
print(valores)  ##miro los resultados totales que he calculado antes de pintarlos en la grafica
plot(valores)