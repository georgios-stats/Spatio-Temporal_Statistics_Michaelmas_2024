rm(list=ls())

my.font.size = 1.5


# ########################################################################################
# ########################################################################################
# ########################################################################################
# ########################################################################################

rm(list=ls()[ls()!="my.font.size"])

mu_fun <- function(s) { return (0) }
cov_fun_exp <- function(s,t,sig2,beta) { return ( sig2*exp(-beta*abs(s-t)) ) }
cov_fun_gauss <- function(s,t,sig2,beta) { return ( sig2*exp(-beta*norm(c(s-t),type="2")**2) ) }
#cov_fun_gauss <- function(s,t,sig2,beta) { return ( sig2*exp(-beta*(s-t)**2)+(s==t)*0.0000000001 ) }
cov_fun_nugget <- function(s,t,sig2) { return ( sig2*(s==t) )  }
#
sig2_val <- 1.0 ; beta_val <- 5
#
n <- 100
s_vec <- seq(from = 0, to = 5, length = n)
mu_vec <- matrix(nrow = n, ncol = 1)
Cov_mat <- matrix(nrow = n, ncol = n)
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_gauss(s_vec[i],s_vec[j],sig2_val,beta_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec, type="l")
abline(h=0,col="red")


# ########################################################################################
# ########################################################################################
# ########################################################################################
# ########################################################################################

rm(list=ls()[ls()!="my.font.size"])
#
mu_fun <- function(s) { return (0) }
cov_fun_exp <- function(s,t,sig2,beta) { return ( sig2*exp(-beta*sum(abs(s-t))) ) }
cov_fun_gauss <- function(s,t,sig2,beta) { return ( sig2*exp(-1/beta*norm(c(s-t),type="2")) ) }
cov_fun_gauss <- function(s,t,sig2,beta) { return ( sig2*exp(-beta*(s-t)**2)+(s==t)*0.0000000001 ) }
cov_fun_nugget <- function(s,t,sig2) { return ( sig2*(s==t) )  }
#
n <- 1000
s_vec <- seq(from = 0, to = 5, length = n)
mu_vec <- matrix(nrow = n, ncol = 1)
Cov_mat <- matrix(nrow = n, ncol = n)



pdf("./figures/RMgauss_1D_1_0.5.pdf")
set.seed(19830)
sig2_val <- 1.0 ; beta_val <- 0.5
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_gauss(s_vec[i],s_vec[j],sig2_val,beta_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec,
     type="l",
     xlab = "s",
     ylab = "z",
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size)
abline(h=0,col="red")
#
dev.off()

pdf("./figures/RMgauss_1D_100_0.5.pdf")
set.seed(19830)
sig2_val <- 100.0 ; beta_val <- 0.5
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_gauss(s_vec[i],s_vec[j],sig2_val,beta_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec,
     type="l",
     xlab = "s",
     ylab = "z",
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size)
abline(h=0,col="red")
#
dev.off()

pdf("./figures/RMgauss_1D_1_5.pdf")
set.seed(19830)
sig2_val <- 1.0 ; beta_val <- 5
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_gauss(s_vec[i],s_vec[j],sig2_val,beta_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec,
     type="l",
     xlab = "s",
     ylab = "z",
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size)
abline(h=0,col="red")
#
dev.off()


pdf("./figures/RMexp_1D_1_0.5.pdf")
set.seed(19830)
sig2_val <- 1.0 ; beta_val <- 0.5
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_exp(s_vec[i],s_vec[j],sig2_val,beta_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec,
     type="l",
     xlab = "s",
     ylab = "z",
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size)
abline(h=0,col="red")
#
dev.off()

pdf("./figures/RMexp_1D_100_0.5.pdf")
set.seed(19830)
sig2_val <- 100.0 ; beta_val <- 0.5
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_exp(s_vec[i],s_vec[j],sig2_val,beta_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec,
     type="l",
     xlab = "s",
     ylab = "z",
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size)
abline(h=0,col="red")
#
dev.off()

pdf("./figures/RMexp_1D_1_5.pdf")
set.seed(19830)
sig2_val <- 1.0 ; beta_val <- 5
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_exp(s_vec[i],s_vec[j],sig2_val,beta_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec,
     type="l",
     xlab = "s",
     ylab = "z",
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size)
abline(h=0,col="red")
#
dev.off()

pdf("./figures/RMnugget_1D_1.pdf")
set.seed(19830)
sig2_val <- 1.0  
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_nugget(s_vec[i],s_vec[j],sig2_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec,
     type="l",
     xlab = "s",
     ylab = "z",
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size)
abline(h=0,col="red")
#
dev.off()

pdf("./figures/RMnugget_1D_100.pdf")
set.seed(19830)
sig2_val <- 100.0  
for (i in 1:n) {
  mu_vec[i] <- mu_fun(s_vec[i]) 
  for (j in 1:n) {
    Cov_mat[i,j] <- cov_fun_nugget(s_vec[i],s_vec[j],sig2_val)
  }
}
z_vec <- mu_vec + t(chol(Cov_mat))%*%rnorm(n, mean=0, sd=1)
#
plot(s_vec, z_vec,
     type="l",
     xlab = "s",
     ylab = "z",
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size)
abline(h=0,col="red")
#
dev.off()

# ########################################################################################
# ########################################################################################
# ########################################################################################
# ########################################################################################

# load RandomFields
## http://cran.nexr.com/web/packages/RandomFields/index.html

rm(list=ls()[ls()!="my.font.size"])

library("RandomFields")

pdf("./figures/RMgauss_1_0.5.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the gaussian model;
sig2 <- 1 ; beta <- 1 / 0.5 ;
model <- RMgauss(var = sig2, scale = beta) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()


pdf("./figures/RMgauss_100_0.5.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the gaussian model;
sig2 <- 100 ; beta <- 1 / 0.5;
model <- RMgauss(var = sig2, scale = beta) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()

pdf("./figures/RMgauss_1_5.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the gaussian model;
sig2 <- 1 ; beta <- 1 / 5 ;
model <- RMgauss(var = sig2, scale = beta) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()

pdf("./figures/RMgauss_100_5.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the gaussian model;
sig2 <- 100 ; beta <- 1 / 5 ;
model <- RMgauss(var = sig2, scale = beta) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()

pdf("./figures/RMnugget_100.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the nugget model;
sig2 <- 100 ; 
model <- RMnugget(var = sig2) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()

pdf("./figures/RMnugget_1.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the nugget model;
sig2 <- 1 ; 
model <- RMnugget(var = sig2) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()

pdf("./figures/RMexp_1_0.5.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the gaussian model;
sig2 <- 1 ; beta <- 1 / 0.5 ;
model <- RMexp(var = sig2, scale = beta) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()

pdf("./figures/RMexp_100_0.5.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the gaussian model;
sig2 <- 100 ; beta <- 1 / 0.5 ;
model <- RMexp(var = sig2, scale = beta) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()

pdf("./figures/RMexp_1_5.pdf")
set.seed(19830)
##
## first let us look at the list of implemented models
RFgetModelNames(type="positive definite") 
## our choice is the gaussian model;
sig2 <- 1 ; beta <- 1 / 5 ;
model <- RMexp(var = sig2, scale = beta) ;
## define the locations:
x.seq <- seq(from = 0, to = 5, length = 200) 
y.seq <- seq(from = 0, to = 5, length = 200)
## run
simu <- RFsimulate(model, x=x.seq, y=y.seq)
## plot
plot(simu,
     cex=my.font.size,
     cex.lab=my.font.size, 
     cex.axis=my.font.size, 
     cex.main=my.font.size, 
     cex.sub=my.font.size,
     xlab = expression('s'[1]),
     ylab = expression('s'[2]))
##
dev.off()

