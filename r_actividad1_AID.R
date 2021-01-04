

install.packages("PerformanceAnalytics")
install.packages("ggplot2","psych","moments")

library("PerformanceAnalytics")
library(ggplot2)

# limpiamos el work space
rm(list=ls())

#los datos tambien estan en github
setwd("C://Users/LluisMartinez/Desktop/luis/unir/Analisis e interepretacion de datos/actividad1_new/datos_coronavirus_e_ibex")
mydataset <- read.table(file = "rowdata.csv", header = TRUE, sep = ";")

head(mydataset)

# compruevo la clase de cada atributo, para poder hacer la estadistica descriptiva que necesito
lapply(mydataset,class)

#resumen estadistico descriptivo
summary(mydataset[c("PCR_TA_echas","PCR_TA_postivas"
                    ,"casos_confirmados_PCR_TA"
                    ,"Tasa_contagios_x_cienMil"
                    ,"defunciones"
                    ,"Cierre_ibex"
                    ,"variacion_ibex")])

lapplay(mydataset[c("PCR_TA_echas","PCR_TA_postivas"
                    ,"casos_confirmados_PCR_TA"
                    ,"Tasa_contagios_x_cienMil"
                    ,"defunciones"
                    ,"Cierre_ibex"
                    ,"variacion_ibex")]
        ,sd)
  

# dibujamos un gráfico simple para tener una idea visual de las variables
par(mfrow = c( 3,3))
plot(mydataset$PCR_TA_echas , type='l', main=' PCR_TA_echas ' , xlab='semanas', ylab = '' )
plot(mydataset$PCR_TA_postivas ,type='l',  main=' PCR_TA_postivas ' , xlab='semanas', ylab = '' )
plot(mydataset$casos_confirmados_PCR_TA ,type='l',  main=' casos_confirmados_PCR_TA ' , xlab='semanas', ylab = '' )
plot(mydataset$Tasa_contagios_x_cienMil ,type='l',  main=' Tasa_contagios_x_cienMil ' , xlab='semanas', ylab = '' )
plot(mydataset$defunciones ,type='l',  main=' defunciones ' , xlab='semanas', ylab = '' )
plot(mydataset$total_casos ,type='l',  main=' total_casos ' , xlab='semanas', ylab = '' )
plot(mydataset$total_defunciones ,type='l',  main=' total_defunciones ' , xlab='semanas', ylab = '' )
plot(mydataset$Cierre_ibex ,type='l',  main=' Cierre_ibex ' , xlab='semanas', ylab = '' )
plot(mydataset$variacion_ibex ,type='l',  main=' variacion_ibex ' , xlab='semanas', ylab = '' )


# los graficos de bigotes con solo una escala no se ven bien
boxplot(mydataset[c("PCR_TA_echas","PCR_TA_postivas"
                    ,"casos_confirmados_PCR_TA"
                    ,"Tasa_contagios_x_cienMil"
                    ,"defunciones"
                    ,"Cierre_ibex"
                    ,"variacion_ibex")])

# dibujamos los graficos de bigotes independientes para apreciar la distribucion
par(mfrow = c( 1,7))
for (i in c("PCR_TA_echas","PCR_TA_postivas"
            ,"casos_confirmados_PCR_TA"
            ,"Tasa_contagios_x_cienMil"
            ,"defunciones"
            ,"Cierre_ibex"
            ,"variacion_ibex")) {
  boxplot(mydataset[c(i)], main=substr(c(i),1,10))
}

#subconjunto de datos sin fechas
d_wk<-mydataset[c("PCR_TA_echas","PCR_TA_postivas"
            ,"casos_confirmados_PCR_TA"
            ,"Tasa_contagios_x_cienMil"
            ,"defunciones"
            ,"Cierre_ibex"
            ,"variacion_ibex")]

#calulo de correlaciones
chart.Correlation(d_wk, histogram=TRUE, pch=19)



