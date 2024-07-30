# ########################################################################
# Installing R-INLA
# ########################################################################
# https://www.r-inla.org/
# https://www.r-inla.org/download-install
# ########################################################################


## install the stable version, do 

install.packages("INLA",
                 repos=c(getOption("repos"),
                         INLA="https://inla.r-inla-download.org/R/stable"), 
                 dep=TRUE) ; 

## update the stable/testing version the package, doing

library("INLA")

inla.upgrade() # for the stable version  


## Dependency: fmesher R package  

options(repos=c(
  inlabruorg = "https://inlabru-org.r-universe.dev",
  INLA = "https://inla.r-inla-download.org/R/testing",
  CRAN = "https://cran.rstudio.com"))
install.packages("fmesher")

## Test this example 

library(INLA)

n = 100; a = 1; b = 1; tau = 100
z = rnorm(n)
eta = a + b*z

scale = exp(rnorm(n))
prec = scale*tau
y = rnorm(n, mean = eta, sd = 1/sqrt(prec))

data = list(y=y, z=z)
formula = y ~ 1+z
result = inla(formula, family = "gaussian", data = data)

summary(result)




