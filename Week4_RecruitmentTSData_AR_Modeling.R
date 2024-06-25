# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())

# Modeling Recruitment Time Series from astsa package as an AR process
library(astsa)
data = rec
par(mfrow=c(4,1))
plot(data, main='Recruitment Time Series', col='blue', lwd=3)

# Subtract the mean from the original signal to center the mean to 0
data = data - mean(data)
plot(data, main='Recruitment Time Series (with  mean = 0)', col='blue', lwd=3)
print("Now the Signal Mean is:")
print(mean(data))
print("Now the Signal Variance is:")
print(var(data))

# Check the ACF and PACF Plots
acf(data, main="ACF Plot", type='correlation')
acf(data, main="PACF Plot", type='partial')

# From the PACF it looks like the given data is an AR2 Process, so
# Order
p = 2

# Get the Autocorrelation Values
r = NULL
r[1:p] = acf(data, plot = FALSE)$acf[2:(p+1)]
print("r")
print(r)

# Fill the Autocorrelation Values in R Matrix
R = matrix(1, p, p) # fill a pxp matrix with 1's
for (i in 1:p){
  for(j in 1:p){
    if(i != j)
      R[i, j] = r[abs(i-j)]
    }
  }

print("R")
print(R)

#b Vector
b = NULL
b = matrix(r, p, 1)
print("b")
print(b)
# Solve for Autoregression Coefficients = inverse(R) * b
print("AR Coeffecients: phiHat")
phiHat = NULL
phiHat = solve(R, b)[,1]
print(phiHat)


# Variance Estimation Using Yule-Walker Estimator
c0=acf(data, type='covariance',plot=FALSE)$acf[1]
varHat = c0 * (1 - sum(phiHat * r))
print("Variance of Estimated Model")
print(varHat)

# constant term in the model
phi0Hat=mean(data)*(1-sum(phiHat))
print("const term")
print(phi0Hat)
