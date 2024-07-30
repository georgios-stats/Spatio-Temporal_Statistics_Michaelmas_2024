rm(list=ls())

# ###################################################################

# load R-INLA

library("INLA")

# ###################################################################

# load the data set

data(Salm)

# rename the columns to fit the notation

names(Salm) = c("z", "x", "u")

head(Salm)

# ###################################################################

# specify the prior for the log precision parameter

my.hyper <- list(theta = list(prior="pc.prec", param=c(1,0.01)))

# specify the linear predictor

formula <- z ~ log(x + 10) + x + f(u, model = "iid", hyper = my.hyper)

result <- inla(formula=formula, data=Salm, family="Poisson")

# ###################################################################


# ###################################################################
# Parametric inference
# ###################################################################

summary(result)

# ###################################################################

beta_1_pdf <- result$marginals.fixed$`log(x + 10)`
pdf("./figures/beta_1_inla_example.pdf")
plot(beta_1_pdf[,1],
     beta_1_pdf[,2],
     type="l")
dev.off()

# ###################################################################

result$summary.fixed

# ###################################################################

result$summary.hyperpar

# ###################################################################

# compute E(\sigma^2|z)

# Select the right hyperparameter marginal

tau <- result$marginals.hyperpar[[1]]

# Compute the expected value for 1/\sqrt{\tau} and 1/\sqrt{tau}^2

E = inla.emarginal(function(x) c(1/sqrt(x),(1/sqrt(x))^2), tau)

# From this we computed the posterior standard deviation as

mysd = sqrt(E[2] - E[1]^2)

# so that we obtain the posterior mean and standard deviation

print(c(mean=E[1], sd=mysd))

# ###################################################################

# produce Pr(\sigma |z )

# Select the right hyperparameter marginal 
tau <- result$marginals.hyperpar[[1]] 
# Do the transformation
my.sigma <- inla.tmarginal(function(x){1/sqrt(x)}, tau)
# plot
pdf("./figures/sig2_inla_example.pdf")
plot(my.sigma[,1],
     my.sigma[,2],
     type="l")
dev.off()


# see other functions providing operations for the marginals

?inla.marginal

# ###################################################################







# ###################################################################
# Predictive inference
# ###################################################################

## set observation 7 to NA

Salm.predict = Salm

Salm.predict[7, "z"] <- NA

# re-run the model

res.predict = inla(formula=formula, data=Salm,
                   family="Poisson",
                   control.predictor = list(compute = TRUE),
                   control.compute=list(return.marginals.predictor=TRUE),
                   control.family = list(control.link=list(model="log"))
                   )


# ###################################################################

# Produce the marginal posterior of the linear predictor 
#
# eta_7 by excluding observation 7 from the data.

# marginal posterior for the linear predictor

eta7 = res.predict$marginals.linear.predictor[[7]]

# plot

pdf("./figures/pred_distr_eta7_inla_example.pdf")
plot(eta7[,1],
     eta7[,2],
     type="l")
dev.off()

# some summary statistics

round(res.predict$summary.linear.predictor[7,], 3)

# ###################################################################

# Produce the marginal posterior of lambda_7 = exp(eta_7)

# marginal posterior for lambda_7

eta7 = res.predict$marginals.linear.predictor[[7]]

lambda7 = inla.tmarginal(function(x){exp(x)}, eta7) #, or
lambda7 = res.predict$marginals.fitted.values[[7]] #, or
lambda7 = inla.tmarginal(function(x){exp(x)},eta7)

# plot

pdf("./figures/pred_distr_lambda7_inla_example.pdf")
plot(lambda7[,1],
     lambda7[,2],
     type="l")
dev.off()


# ###################################################################

# Produce the marginal posterior Pr( z_7 | z_{-7} )

# way 1 : Numerical integration  

# library supporting trapezoid rule integration.
library(caTools)
# specify the support at which we want to compute the density
z_tick_vec = 0:100
z7_pdf = rep(0,101)
# go over the posterior marginal of the fitted value
for(j in 1:(length(lambda7[ ,1])-1)){
  z7_pdf <- z7_pdf + dpois(z_tick_vec,
                                 lambda = ((lambda7[j,1]+ lambda7[j+1,1])/2)) *
    trapz(lambda7[j:(j+1), 1], lambda7[j:(j+1), 2])
}
# plot
pdf("./figures/pred_distr_z7_inla_example.pdf")
  plot(z_tick_vec,z7_pdf, type="l")
dev.off()


# way 2 : Monte carlo integration

# set the number of samples (T)
n.samples = 3000 
# sample from the marginal latent distribution
samples_lambda = inla.rmarginal(n.samples, lambda7) 
# sample from the likelihood model 
predDist = rpois(n.samples, lambda = samples_lambda)
# plot
pdf("./figures/pred_distr_z7_MC_inla_example.pdf")
  hist(predDist)
dev.off()



