library(Kendall)
rutaFicheros <- "~/ecoinformatica_2014_2015/producto1/"
info1<-read.csv(paste(rutaFicheros,"ndvi_robledal.csv",sep=""), sep=";", header=T)
tendencia_ndvi<-data.frame()
tendencia_aux<-data.frame(iv_malla_modi_id=NA,tau_ndvi=NA,pvalor_ndvi=NA)
pixels<-unique(info1$iv_malla_modi_id)
for(i in pixels){
  aux<-info1[info1$iv_malla_modi_id==i,]
  Kendall<-MannKendall(aux$ndvi_i)
  tendencia_aux$iv_malla_modi_id<-i
  tendencia_aux$tau_ndvi<-Kendall[[1]][1]
  tendencia_aux$pvalor_ndvi<-Kendall[[2]][1]
  tendencia_ndvi<-rbind(tendencia_ndvi,tendencia_aux)
}
head(tendencia_ndvi)

## Tendencias duración nieve Sierra Nevada:

info2<-read.csv(paste(rutaFicheros,"nieve_robledal.csv",sep=""), sep=";", header=T)
tendencia_nieve<-data.frame()
tendencia_aux_nieve<-data.frame(nie_malla_modi_id=NA,tau_nieve=NA,pvalor_nieve=NA)
pixels<-unique(info2$nie_malla_modi_id)
for(i in pixels){
  aux<-info2[info2$nie_malla_modi_id==i,]
  Kendall<-MannKendall(aux$scd)
  tendencia_aux_nieve$nie_malla_modi_id<-i
  tendencia_aux_nieve$tau_nieve<-Kendall[[1]][1]
  tendencia_aux_nieve$pvalor_nieve<-Kendall[[2]][1]
  tendencia_nieve<-rbind(tendencia_nieve,tendencia_aux_nieve)
}
head(tendencia_nieve)

library(plyr)

##Info para tener el dataframe(ndvi)
info1<-info1[,c(1,4,5)]
unique_info1<-unique(info1)
resultado1<-join(unique_info1,tendencia_ndvi, by="iv_malla_modi_id")
head(resultado1)


## dataframe de nieve
info2<-info2[,c(2,10,11)]
unique_info2<-unique(info2)
resultado2<-join(unique_info2,tendencia_nieve, by="nie_malla_modi_id")
head(resultado2)



## mapa ndvi_robledal:
library(sp)
library(rgdal)
##install.packages(c("classInt"))
library(classInt)
library(RColorBrewer)
coordinates(resultado1) =~lng+lat
proj4string(resultado1)=CRS("+init=epsg:4326")
clases <- classIntervals(resultado1$tau_ndvi, n = 5)
plotclr <- rev(brewer.pal(5, "Spectral"))
colcode <- findColours(clases, plotclr)
pdf(file="rp1.pdf",height=8, width=10)
plot(resultado1, col=colcode, pch=19, cex = .6, main = "Mapa de 
     tendencias en robledal")
legend("topright",legend=names(attr(colcode, "table")), 
       fill=attr(colcode, "palette"), bty="n")
?legend

dev.off()

## plot 
plot(resultado1, col=colcode, pch=c(17, 
                                    19)[as.numeric(resultado1$significativa)], cex = .6, main = "Mapa de 
     tendencias")
## leyenda
legend("topright", legend=names(attr(colcode, "table")), 
       fill=attr(colcode, "palette"), bty="n")


##Resultado del mapa de nieve del robledal:

coordinates(resultado2) =~lng+lat
proj4string(resultado2)=CRS("+init=epsg:4326")
clases <- classIntervals(resultado2$tau_nieve, n = 5)
plotclr <- rev(brewer.pal(5, "Spectral"))
colcode <- findColours(clases, plotclr)
pdf(file="rp1_2.pdf",height=8, width=10)
plot(resultado2, col=colcode, pch=19, cex = .6, main = "Mapa de 
     tendencias de nieve en robledal")
legend("topright",legend=names(attr(colcode, "table")), 
       fill=attr(colcode, "palette"), bty="n")
dev.off()


## plot
plot(resultado2, col=colcode, pch=c(17, 
                                    19)[as.numeric(resultado2$significativa)], cex = .6, main = "Mapa de 
     tendencias de nieve en robledal")
## leyenda
legend("topright", legend=names(attr(colcode, "table")), 
       fill=attr(colcode, "palette"), bty="n")