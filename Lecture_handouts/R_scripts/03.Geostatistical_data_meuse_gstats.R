library(sp)
data(meuse)
class(meuse)
names(meuse)
coordinates(meuse) = ~x+y
class(meuse)
summary(meuse)
summary(meuse)
coordinates(meuse)[1:5,]


# Plot the data

pdf("./figures/meuse-bubble-plot")
bubble(meuse, "zinc",
       #       col=c("#00ff0088", "#00ff0088"),
       col=c("blue", "blue"), 
       main = "zinc concentrations (ppm)",
       xlab='Longitude',
       ylab='Latitude',
       cex.lab=my.font.size, 
       cex.axis=my.font.size, 
       cex.main=my.font.size, 
       cex.sub=my.font.size)
dev.off()

# meuse dataset on a grid of spatial points

data(meuse.grid)
summary(meuse.grid)
class(meuse.grid)
coordinates(meuse.grid) = ~x+y
class(meuse.grid)
gridded(meuse.grid) = TRUE
class(meuse.grid)

# image of data
image(meuse.grid["dist"])
title("distance to river (red = 0)")

library(gstat)
zinc.idw = idw(zinc~1, meuse, meuse.grid)


#
# Variograms
#
my.font.size = 2

library(sp)
data(meuse)
class(meuse)
names(meuse)
coordinates(meuse) = ~x+y
class(meuse)
summary(meuse)
summary(meuse)
coordinates(meuse)[1:5,]

lzn.vgm = variogram(log(zinc)~1, meuse, meuse)
lzn.fit = fit.variogram(lzn.vgm, model = vgm(1, "Sph", 900, 1) )
lzn.fit = fit.variogram(lzn.vgm, model = vgm("Sph") )

plot(lzn.vgm, lzn.fit)

#
# Kriging
#
# mean = constant and c.f. exponential + nugget
#

# empirical variogram

lzn.vgm.const.exp = variogram(log(zinc)~1, meuse, meuse)

# parametric exponential variogram

lzn.pvgm.const.exp.fit = fit.variogram(lzn.vgm.const.exp, model = vgm("Exp") )

# predictor 

lzn.const.exp.kriged = krige(formula = log(zinc)~1, 
                             locations = meuse, 
                             newdata = meuse.grid, 
                             model = lzn.pvgm.const.exp.fit )
# plot me

pdf('./figures/logmeuse-kriging-const-exp.pdf')
spplot(lzn.const.exp.kriged["var1.pred"],
       xlab = expression(paste(s[1])) ,
       ylab = expression(paste(s[2])) ,
       cex=my.font.size,
       cex.lab=my.font.size, 
       cex.axis=my.font.size, 
       cex.main=my.font.size, 
       cex.sub=my.font.size
       )
dev.off()





#
# Kriging
#
# mean = constant and c.f. exponential + nugget
#

# empirical variogram

lzn.vgm.1st.exp = variogram(log(zinc)~ 1+x+y, meuse, meuse)

# parametric exponential variogram

lzn.pvgm.1st.exp.fit = fit.variogram(lzn.vgm.1st.exp, 
                                     model = vgm("Exp") )

# predictor 

lzn.1st.exp.kriged = krige(formula = log(zinc)~1+x+y, 
                             locations = meuse, 
                             newdata = meuse.grid, 
                             model = lzn.pvgm.1st.exp.fit )
# plot me

pdf('./figures/logmeuse-kriging-1st-exp.pdf')
spplot(lzn.1st.exp.kriged["var1.pred"],
       xlab = expression(paste(s[1])) ,
       ylab = expression(paste(s[2])) ,
       cex=my.font.size,
       cex.lab=my.font.size, 
       cex.axis=my.font.size, 
       cex.main=my.font.size, 
       cex.sub=my.font.size
)
dev.off()




#
# Kriging
#
# mean = constant and c.f. exponential + nugget
#
pdf('./figures/logmeuse-scatter-logzinc_vs_sqrt_dist.pdf')
plot( sqrt(meuse$dist), log(meuse$zinc) ,
      xlab = expression(paste(sqrt,'(dist)') ) ,
      ylab = expression(paste(log, '(zinc)') ) ,
      cex=my.font.size,
      pch = c(20),
      cex.lab=my.font.size, 
      cex.axis=my.font.size, 
      cex.main=my.font.size, 
      cex.sub=my.font.size  )
dev.off()



# empirical variogram

lzn.vgm.sqrt_dist.exp = variogram(log(zinc)~ 1+sqrt(dist), meuse, meuse)

# parametric exponential variogram

lzn.pvgm.sqrt_dist.exp.fit = fit.variogram(lzn.vgm.sqrt_dist.exp, 
                                     model = vgm("Exp") )

# predictor 

lzn.sqrt_dist.exp.kriged = krige(formula = log(zinc)~1+sqrt(dist), 
                           locations = meuse, 
                           newdata = meuse.grid, 
                           model = lzn.pvgm.sqrt_dist.exp.fit )
# plot me

pdf('./figures/logmeuse-kriging-sqrt_dist-exp.pdf')
spplot(lzn.sqrt_dist.exp.kriged["var1.pred"],
       xlab = expression(paste(s[1])) ,
       ylab = expression(paste(s[2])) ,
       cex=my.font.size,
       cex.lab=my.font.size, 
       cex.axis=my.font.size, 
       cex.main=my.font.size, 
       cex.sub=my.font.size
)
dev.off()




