# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())

# Set the seed, so we can reproduce same dataset
set.seed(2024)

# Model Parameters (we will estimate them using Yule Walker's wonderful work)
sigma = 4
phi = NULL
phi[1:2] = c(1/3, 1/2)
print(phi)

# Number of Data Points to Generate
n = 10000

# Simulate AR Process
ar_process = arima.sim(n, model=list(ar = phi), sd = sigma)

print("Printing first few numbers of the generated AR2 Series")
print(ar_process[1:5])

# Find and name 2nd and 3rd Sample Autocorrelation
r = NULL
r[1:2] = acf(ar_process, plot=FALSE)$acf[2:3]
print(r)

# Matrix R
R = matrix(1,2,2) # A 2x2 matrix of 1s
# Edit R
R[1,2] = r[1]
R[2,1] = r[1]
print("R")
print(R)

# b Column Vector on the right
b = matrix(r, nrow=2, ncol=1) # b column vector with no entries
print("b")
print(b)

# Solve(R, b)  --- solves Rx=b and gives vector x = inv(R)*b
phiHat = matrix(c(solve(R, b)[1,1], solve(R, b)[2,1]), 2, 1)
print("phi")
print(phi)
print("phiHat")
print(phiHat)


# Variance Estimation
c0 = acf(ar_process, type='covariance')$acf[1]

varHat = c0*(1 - sum(phiHat * r))
print("varHat")
print(varHat)

# Let's do some Plotting
par( mfrow=c(3,1) )
plot(ar_process, main='AR2 Process')
acf(ar_process, main='ACF of AR Process')
acf(ar_process, type='partial', main='PACF of AR Process')




