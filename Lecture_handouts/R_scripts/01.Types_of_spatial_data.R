#
# Type of data: geostatistics
#

rm(list=ls())

# ########################################################################

Qpdf = TRUE

# ########################################################################



# ########################################################################
# Central Valley Groundwater (Geostatistics)
# ########################################################################

rm(list=setdiff(ls(), "Qpdf"))

library("maps")

library("mapdata")

if ( Qpdf ) {
  pdf('./figures/Central_Valley_Groundwater_Jan2019_Cr_obs.pdf')
} else {
  X11()
}
library(readr)
Datapoints_CentralValley_Groundwater_Jan2019 <- read_csv("./data/Central_Valley_Groundwater_data/Datapoints-CentralValley-Groundwater-Jan2019.csv",show_col_types = FALSE)
mydata <- Datapoints_CentralValley_Groundwater_Jan2019
y.coord <- mydata$Latitude
x.coord <- mydata$Longitude
z <- mydata$`Cr (ppb)`
x_min <- min(x.coord)
x_max <- max(x.coord)
y_min <- min(y.coord)
y_max <- max(y.coord)
map(xlim=c(x_min,x_max), 
    ylim=c(y_min,y_max),
    col="grey90",
    fill=TRUE,
    xlab='Longitude',
    ylab='Latitude',
    cex=2,
    cex.lab=2, 
    cex.axis=2, 
    cex.main=2, 
    cex.sub=2)
map.axes()	
points(x=c(x.coord),
       y=c(y.coord),
       pch = 19,
       col=c(z) )
dev.off()

# ########################################################################

if ( Qpdf ) {
  pdf('./figures/Central_Valley_Groundwater_Jan2019_Fe_obs.pdf')
} else {
  X11()
}
library(readr)
Datapoints_CentralValley_Groundwater_Jan2019 <- read_csv("./data/Central_Valley_Groundwater_data/Datapoints-CentralValley-Groundwater-Jan2019.csv",show_col_types = FALSE)
mydata <- Datapoints_CentralValley_Groundwater_Jan2019
y.coord <- mydata$Latitude
x.coord <- mydata$Longitude
z <- mydata$`Fe (ppb)`
x_min <- min(x.coord)
x_max <- max(x.coord)
y_min <- min(y.coord)
y_max <- max(y.coord)
map(xlim=c(x_min,x_max), 
    ylim=c(y_min,y_max),
    col="grey90",
    fill=TRUE,
    xlab='Longitude',
    ylab='Latitude',
    cex=2,
    cex.lab=2, 
    cex.axis=2, 
    cex.main=2, 
    cex.sub=2)
map.axes()	
points(x=c(x.coord),
       y=c(y.coord),
       pch = 19,
       col=c(z) )
dev.off()



# ########################################################################

if ( Qpdf ) {
  pdf('./figures/Central_Valley_Groundwater_Jan2019_U_obs.pdf')
} else {
  X11()
}
library(readr)
Datapoints_CentralValley_Groundwater_Jan2019 <- read_csv("./data/Central_Valley_Groundwater_data/Datapoints-CentralValley-Groundwater-Jan2019.csv",show_col_types = FALSE)
mydata <- Datapoints_CentralValley_Groundwater_Jan2019
y.coord <- mydata$Latitude
x.coord <- mydata$Longitude
z <- mydata$`U (ppb)`
x_min <- min(x.coord)
x_max <- max(x.coord)
y_min <- min(y.coord)
y_max <- max(y.coord)
map(xlim=c(x_min,x_max), 
    ylim=c(y_min,y_max),
    col="grey90",
    fill=TRUE,
    xlab='Longitude',
    ylab='Latitude',
    cex=2,
    cex.lab=2, 
    cex.axis=2, 
    cex.main=2, 
    cex.sub=2)
map.axes()	
points(x=c(x.coord),
       y=c(y.coord),
       pch = 19,
       col=c(z) )
dev.off()

# ########################################################################

if ( Qpdf ) {
  pdf('./figures/Central_Valley_Groundwater_Jan2019_As_obs.pdf')
} else {
  X11()
}
library(readr)
Datapoints_CentralValley_Groundwater_Jan2019 <- read_csv("./data/Central_Valley_Groundwater_data/Datapoints-CentralValley-Groundwater-Jan2019.csv",show_col_types = FALSE)
mydata <- Datapoints_CentralValley_Groundwater_Jan2019
y.coord <- mydata$Latitude
x.coord <- mydata$Longitude
z <- mydata$`As (ppb)`
x_min <- min(x.coord)
x_max <- max(x.coord)
y_min <- min(y.coord)
y_max <- max(y.coord)
map(xlim=c(x_min,x_max), 
    ylim=c(y_min,y_max),
    col="grey90",
    fill=TRUE,
    xlab='Longitude',
    ylab='Latitude',
    cex=2,
    cex.lab=2, 
    cex.axis=2, 
    cex.main=2, 
    cex.sub=2)
map.axes()	
points(x=c(x.coord),
       y=c(y.coord),
       pch = 19,
       col=c(z) )
dev.off()

# ########################################################################

pdf('./figures/Central_Valley_Groundwater_Jan2019_U_As_obs_scatter_plot.pdf')
library(readr)
Datapoints_CentralValley_Groundwater_Jan2019 <- read_csv("./data/Central_Valley_Groundwater_data/Datapoints-CentralValley-Groundwater-Jan2019.csv",show_col_types = FALSE)
mydata <- Datapoints_CentralValley_Groundwater_Jan2019
y.coord <- mydata$Latitude
x.coord <- mydata$Longitude
z <- mydata$`U (ppb)`
z <- log(z)
y <- mydata$`As (ppb)`
y <- log(y)
plot(z,y,
     pch=20,
     main="",
     xlab="U log(ppb)",
     ylab="As log(ppb)",
     cex=1.5,
     cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5,
     cex.sub=1.5)
# library(ggplot2)
# library(ggExtra)
# # Save the scatter plot in a variable
# p <- ggplot(cars, aes(z, y)) +
#   geom_point()
# # Plot the scatter plot with marginal histograms
# ggMarginal(p, type = "histogram")
dev.off()


# ########################################################################

rm(list=setdiff(ls(), "Qpdf"))

library("maps")

library("mapdata")

pdf('./figures/Central_Valley_Groundwater_Jan2019_Cr_Fe_obs.pdf')
par(mfrow=c(1,2))
library(readr)
Datapoints_CentralValley_Groundwater_Jan2019 <- read_csv("./data/Central_Valley_Groundwater_data/Datapoints-CentralValley-Groundwater-Jan2019.csv",show_col_types = FALSE)
mydata <- Datapoints_CentralValley_Groundwater_Jan2019
y.coord <- mydata$Latitude
x.coord <- mydata$Longitude
z <- mydata$`Cr (ppb)`
#z<- log(z)
x_min <- min(x.coord)
x_max <- max(x.coord)
y_min <- min(y.coord)
y_max <- max(y.coord)
map(xlim=c(x_min,x_max), 
    ylim=c(y_min,y_max),
    col="grey90",
    fill=TRUE,
    xlab='Longitude',
    ylab='Latitude',
    main = "Fe(ppb)",
    cex=2,
    cex.lab=2, 
    cex.axis=2, 
    cex.main=2, 
    cex.sub=2)
map.axes()	
points(x=c(x.coord),
       y=c(y.coord),
       main = "Cr(ppb)",
       pch = 19,
       col=c(z) )
z <- mydata$`Fe (ppb)`
#z<- log(z)
x_min <- min(x.coord)
x_max <- max(x.coord)
y_min <- min(y.coord)
y_max <- max(y.coord)
map(xlim=c(x_min,x_max), 
    ylim=c(y_min,y_max),
    col="grey90",
    fill=TRUE,
    xlab='Longitude',
    ylab='Latitude',
    cex=2,
    cex.lab=2, 
    cex.axis=2, 
    cex.main=2, 
    cex.sub=2)
map.axes()	
points(x=c(x.coord),
       y=c(y.coord),
       main = "Fe(ppb)",
       pch = 19,
       col=c(z) )
dev.off()


pdf('./figures/Central_Valley_Groundwater_Jan2019_Cr_Fe_obs_scatter_plot.pdf')
library(readr)
Datapoints_CentralValley_Groundwater_Jan2019 <- read_csv("./data/Central_Valley_Groundwater_data/Datapoints-CentralValley-Groundwater-Jan2019.csv",show_col_types = FALSE)
mydata <- Datapoints_CentralValley_Groundwater_Jan2019
y.coord <- mydata$Latitude
x.coord <- mydata$Longitude
z <- mydata$`Cr (ppb)`
z <- log(z)
y <- mydata$`Fe (ppb)`
y <- log(y)
plot(z,y,
     pch=20,
     main="",
     xlab="log(Cr)",
     ylab="log(Fe)",
     cex=1.5,
     cex.lab=1.5, 
     cex.axis=1.5, 
     cex.main=1.5, 
     cex.sub=1.5)
dev.off()












 # ########################################################################
# Swiss rainfall data (Geostatistics)
# ########################################################################

## Swiss rainfall data (SIC)

# rm(list=setdiff(ls(), "Qpdf"))
# require(geoR)
# library(grDevices)
# data(SIC)
# if ( Qpdf ) {
#   pdf('./plots/sic.100.pdf')
# } else {
#   X11()
# }
# mydata <- sic.100
# x.coord <- mydata$coords[,1]
# y.coord <- mydata$coords[,2]
# z <- mydata$data
# points(sic.100, borders=sic.borders)
# points(x=x.coord,
#        y=y.coord,
#        borders=sic.borders,
#        pch = 19, 
#        lwd=z/100)
# #mydata <- sic.367
# #m = 50
# #int <- sample.int(367,m)
# #x.coord <- mydata$coords[int,1]
# #y.coord <- mydata$coords[int,2]
# #z <- mydata$data
# #points(x=x.coord,
# #       y=y.coord,
# #       borders=sic.borders,
# #       pch = 1)
# dev.off()


rm(list=setdiff(ls(), "Qpdf"))
require(geoR)
library(grDevices)
if ( Qpdf ) {
  pdf('./figures/sic.100.pdf')
} else {
  X11()
}
# Load the data 
data(SIC) #use sic.all

# *** Code for Figure 1.11 
sic.N <- sic.100
color.map <- gray(c(1, .8, .5, 0))
sic.cutoff <- quantile(sic.N$data)
sic.factor <- cut(sic.N$data,breaks=sic.cutoff,include.lowest=TRUE,right=TRUE)
q4col <- color.map[as.numeric(sic.factor)]

par(mar=c(4.5,6,0.5,0.5))
plot(sic.borders, type="l",axes=T, xlab="x-coord",ylab="y-coord",asp=1)
points(sic.N$coord[,"V2"], sic.N$coord[,"V3"], bg=q4col, pch=21, cex=1.5)
legend(x=-10, y=310, pch=rep(21,4), pt.cex=rep(1.5,4), pt.bg=rev(color.map), legend=rev(levels(sic.factor)), bty="n",cex=2)
dev.off()




# ########################################################################
# Air pollution in Piemonte
# ########################################################################


# Create a new folder called "Piemonte_data" inside your working directory (my.dir)
# and save the data downloaded from
# https://sites.google.com/a/r-inla.org/stbook/datasets

rm(list=setdiff(ls(), "Qpdf"))
require(geoR)
library(grDevices)
if ( Qpdf ) {
  pdf('./figures/air.pollution.Piermonte.sites.pdf')
} else {
  X11()
}

my.dir <- "./data/"

# Import the data 
Piemonte_data <-read.csv(paste(my.dir,"Piemonte_data/Piemonte_data_byday.csv",sep=""))
coordinates <-read.csv(paste(my.dir,"Piemonte_data/coordinates.csv",sep=""))
borders <- read.csv(paste(my.dir,"Piemonte_data/Piemonte_borders.csv",sep=""))

# *** Code for Figure 1.14 
color.map <- gray(c(1, .8, .5, 0))
mean_pm10 <- aggregate(PM10 ~ Station.ID, data=Piemonte_data, FUN=mean, na.rm=T)
pm10.cutoff <- quantile(mean_pm10$PM10)
PM10.factor <- cut(mean_pm10$PM10,breaks=pm10.cutoff,include.lowest=TRUE,right=TRUE)
q4col <- color.map[as.numeric(PM10.factor)]

plot(borders$UTM_X, borders$UTM_Y, type="l",axes=T, xlab="",ylab="",asp=1,
     cex=2,
     cex.lab=2, 
     cex.axis=2, 
     cex.main=2, 
     cex.sub=2, 
     legend.cex=2.0)
points(coordinates[,"UTMX"], coordinates[,"UTMY"], bg=q4col, pch=21,cex=2,
       cex=2,
       cex.lab=2, 
       cex.axis=2, 
       cex.main=2, 
       cex.sub=2, 
       legend.cex=2.0)
legend(x=250, y=5149, pch=rep(21,4), pt.cex=rep(1.5,4), pt.bg=rev(color.map), legend=rev(levels(PM10.factor)), bty="n",cex=2)

dev.off()
# ***

# ########################################################################
# Soil chemistry properties
# ########################################################################

rm(list=setdiff(ls(), "Qpdf"))
require(geoR)
if ( Qpdf ) {
  pdf('./figures/soil250.pdf')
} else {
  X11()
}
data(soil250)
mydata <- soil250
y.coord <- mydata$Coluna
x.coord <- mydata$Linha
z <- mydata$pHKCl
plot(x=x.coord,
       y=y.coord,
       pch = 19,
     col=z,
     cex=2,
     cex.lab=2, 
     cex.axis=2, 
     cex.main=2, 
     cex.sub=2, 
     legend.cex=2.0)
dev.off()


# ########################################################################
# Soil chemistry properties
# ########################################################################

rm(list=setdiff(ls(), "Qpdf"))
#
library("fields")
library(gstat)
data(coalash)
#
if ( Qpdf ) {
  pdf('./figures/ashcoal.pdf')
} else {
  X11()
}
#
look <- as.image( coalash$coalash, x=coalash[,1:2]) 
image.plot( look,
            xlab="x-coord",
            ylab="y-coord",
            cex=2,
            cex.lab=2, 
            cex.axis=2, 
            cex.main=2, 
            cex.sub=2, 
            legend.cex=2.0) 
dev.off()





# ########################################################################
# Wolfcamp aquifer data
# ########################################################################
# 
# 
# data(wolfcamp)
# wolfcamp
# 
# mydata <- wolfcamp
# x.coord <- mydata$coords[,1]
# y.coord <- mydata$coords[,2]
# z <- mydata$data
# x11()
# plot(x=x.coord,
#        y=y.coord,
#        pch = 19,
#        col=z)
# 
# xx <- 35.2220
# yy <- 101.8313
# x.coord <- x.coord+xx
# y.coord <- y.coord+yy
# x11()
# plot(x=x.coord,
#      y=y.coord,
#      col=z)
# 
# 
# 
# x_min <- min(x.coord)
# x_max <- max(x.coord)
# y_min <- min(y.coord)
# y_max <- max(y.coord)
# map(xlim=c(x_min-0.5,x_max+0.5), 
#     ylim=c(y_min-0.5,y_max+0.5),
#     col="grey90",
#     fill=TRUE)



# ########################################################################
# Suicides in London
# ########################################################################

rm(list=setdiff(ls(), "Qpdf"))

library(maptools)

my.dir <- "./data/"

# Create a new folder called "London Suicides" inside your working directory (my.dir)
# and save the data downloaded from
# https://sites.google.com/a/r-inla.org/stbook/datasets

# Import the shapefile 
london.gen <- readShapePoly(paste(my.dir,"LondonSuicides_data/LDNSuicides.shp",sep=""))

# Load code for thinning map 
source(paste(my.dir,"LondonSuicides_data/naiveThinShp.R",sep=""))
london.gen.thin <- naive.thin.shp(london.gen,thin=5)

# Load the data 
load(paste(my.dir,"LondonSuicides_data/LondonSuicides.RData",sep=""))
names <- sort(london.gen$NAME)
data <- data.frame(NAME=names, y=y, E=E, x1=x1, x2=x2)
Nareas <- length(data[,1])

# *** Code for Figure 1.7 
# Compute Standard Mortality Ratio
SMR <- y/E
SMR.cutoff <- c(0.6,0.8,1,1.2,1.4,1.8)
SMR.factor <- cut(SMR,breaks=SMR.cutoff,include.lowest=TRUE)
#Deprivation index
x.cutoff <- round(quantile(x1,seq(0,1,0.2)),1)
x1.factor <- cut(x1,breaks=x.cutoff,include.lowest=TRUE)
#Fragmentation index
x2.factor <- cut(x2,breaks=x.cutoff,include.lowest=TRUE)

data <- data.frame(NAME=names,SMR=SMR.factor,x1=x1.factor, x2=x2.factor)
boroughs <- london.gen.thin
data.boroughs <- attr(boroughs, "data")
attr(boroughs, "data") <- merge(data.boroughs, data, by="NAME")

# trellis.par.set(axis.line=list(col=NA))
if ( Qpdf ) {
  pdf('./figures/LDNSuicides_dpi.pdf')
} else {
  X11()
}
spplot(obj=boroughs, zcol="x1", col.regions=gray(4.5:0.5/5),main="",par.settings=list(fontsize=list(text=20)))
dev.off()
if ( Qpdf ) {
  pdf('./figures/LDNSuicides_sfi.pdf')
} else {
  X11()
}
spplot(obj=boroughs, zcol="x2", col.regions=gray(4.5:0.5/5),main="",par.settings=list(fontsize=list(text=20)))
dev.off()
if ( Qpdf ) {
  pdf('./figures/LDNSuicides_smr.pdf')
} else {
  X11()
}
spplot(obj=boroughs, zcol="SMR", col.regions=gray(4.5:0.5/5),main="",par.settings=list(fontsize=list(text=20)))
dev.off()
#***

############



# ########################################################################
# Sudden Infant Death Syndrome (SIDS)
# ########################################################################

rm(list=setdiff(ls(), "Qpdf"))

library(spdep)

nc <- st_read(system.file("shapes/sids.shp", package="spData")[1], quiet=TRUE)
st_crs(nc) <- "+proj=longlat +datum=NAD27"
row.names(nc) <- as.character(nc$FIPSNO)

sf_use_s2(FALSE)
plot(st_geometry(nc), axes=TRUE)

text(st_coordinates(st_centroid(st_geometry(nc), of_largest_polygon=TRUE)), label=nc$FIPSNO, cex=0.5)




# rm(list=setdiff(ls(), "Qpdf"))
# require(geoR)
# data(SIC)
# if ( Qpdf ) {
#   pdf('./plots/sic.100.pdf')
# } else {
#   X11()
# }
# mydata <- sic.100
# x.coord <- mydata$coords[,1]
# y.coord <- mydata$coords[,2]
# z <- mydata$data
# points(sic.100, borders=sic.borders)
# points(x=x.coord,
#        y=y.coord,
#        borders=sic.borders,
#        pch = 19,
#        col=z)
# dev.off()

##################

rm(list=setdiff(ls(), "Qpdf"))
require("SemiPar")
library("maps")
library("mapdata")
data(scallop)
if ( Qpdf ) {
  pdf('./figures/scallop.pdf')
} else {
  X11()
}
mydata <- scallop
y.coord <- mydata[,1]
x.coord <- mydata[,2]
z <- mydata[,3]
x_min <- min(x.coord)
x_max <- max(x.coord)
y_min <- min(y.coord)
y_max <- max(y.coord)
map(xlim=c(x_min-0.5,x_max+0.5), 
    ylim=c(y_min-0.5,y_max+0.5),
    col="grey90",
    fill=TRUE)
map.axes()	
points(x=x.coord,
       y=y.coord,
       pch = 19,
       col=z)
dev.off()




# ########################################################################
# Columbus Columbus OH spatial analysis data set
# ########################################################################

#install.packages("spData")

library(spdep)
data(columbus)
columbus <- st_read(system.file("shapes/columbus.shp", 
                                package="spData")[1], 
                    quiet=TRUE
                    )
col.gal.nb <- read.gal(system.file("weights/columbus.gal", 
                                   package="spData")[1]
                       )
pdf("./figures/columbus.crime.counts.pdf")
  plot(columbus["CRIME"],
       main="",
       axes=TRUE,
       cex.main=2, #change font size of title
       cex.sub=2, #change font size of subtitle
       cex.lab=2, #change font size of axis labels
       cex.axis=2 #change font size of axis text  )
       )
dev.off()

pdf("./figures/columbus.crime.HOVAL.pdf")
plot(columbus["HOVAL"],
     main="",
     axes=TRUE,
     cex.main=2, #change font size of title
     cex.sub=2, #change font size of subtitle
     cex.lab=2, #change font size of axis labels
     cex.axis=2 #change font size of axis text  )
)
dev.off()


# ########################################################################
# North Carolina SIDS data set
# ########################################################################

library(spdep)
nc <- st_read(system.file("shapes/sids.shp", package="spData")[1], quiet=TRUE)
st_crs(nc) <- "+proj=longlat +datum=NAD27"
#row.names(nc) <- as.character(nc$SID74)
sf_use_s2(FALSE)
pdf("./figures/sids.SID74.pdf")
  plot(nc["SID74"],
       main="",
       axes=TRUE,
       cex.main=2, #change font size of title
       cex.sub=2, #change font size of subtitle
       cex.lab=2, #change font size of axis labels
       cex.axis=2 #change font size of axis text  )
       )
dev.off()
pdf("./figures/sids.NWBIR74.pdf")
plot(nc["NWBIR74"],
     main="",
     axes=TRUE,
     cex.main=2, #change font size of title
     cex.sub=2, #change font size of subtitle
     cex.lab=2, #change font size of axis labels
     cex.axis=2 #change font size of axis text  )
)
dev.off()


# ########################################################################
# Tropical rain forest trees (Barro Colorado)
# ########################################################################


# install.packages("spatstat")
# https://cran.r-project.org/web/packages/spatstat/index.html

library("spatstat")

data(bei)

pdf("./figures/bei.obs.pdf")
plot(bei$x, bei$y, 
     cex=1/5, 
     xlab="x-coord",
     ylab="y-coord",
     main="",
     pch = 19,
     cex.main=2, #change font size of title
     cex.sub=2, #change font size of subtitle
     cex.lab=2, #change font size of axis labels
     cex.axis=2 #change font size of axis text  )
)
dev.off()




# ########################################################################
# Longleaf Pines Point Pattern
# ########################################################################


library("spatstat")

data(longleaf)

pdf("./figures/longleaf.obs.pdf")
plot(longleaf$x, longleaf$y, 
     cex=longleaf$marks/40, 
     xlab="x-coord",
     ylab="y-coord",
     main="",
     cex.main=2, #change font size of title
     cex.sub=2, #change font size of subtitle
     cex.lab=2, #change font size of axis labels
     cex.axis=2 #change font size of axis text  )
     )
dev.off()

