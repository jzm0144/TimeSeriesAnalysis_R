# Simulation of AR3 Process

#
rm(list = ls())
# Set the seed, so we can reproduce same dataset
#set.seed(2024)

# Model Parameters (we will estimate them using Yule Walker's wonderful work)
sigma = 4
phi = NULL
phi[1:3] = c(1/3, 1/2, 7/100)
print("Coeffs for AR3 lags: phi1,phi2,phi3")
print(phi)

# Number of Data Points to Generate
n = 100000
print("Number of readings in the Series: N")
print(n)

# Simulate AR Process
ar3_process = arima.sim(n, model=list(ar = phi), sd = sigma)
 
print("Printing first few numbers of the generated AR3 Series")
print(ar3_process[1:7])

 
# Find and name 2nd, 3rd and 4th Sample Autocorrelation
r = NULL
r[1:3] = acf(ar3_process, plot=FALSE)$acf[2:4]
print("ACF AR3 Autocorrelation Coefficients Estimated")
print(r)

# Matrix R
R = matrix(1,3,3) # A 3x3 matrix of 1s
# Edit R
R[1,2] = r[1]
R[1,3] = r[2]
R[2,1] = r[1]
R[2,3] = r[1]
R[3,1] = r[2]
R[3,2] = r[1]
print("R")
print(R)

# b Column Vector on the right
b = matrix(r, nrow=3, ncol=1) # b column vector with no entries
print("b")
print(b)

# Solve(R, b)  --- solves Rx=b and gives vector x = inv(R)*b
phiHat = solve(R, b)
print("phi")
print(phi)
print("phiHat")
print(phiHat)

 
# Variance Estimation
c0 = acf(ar3_process, type='covariance')$acf[1]

varHat = c0*(1 - sum(phiHat * r))
print("varHat")
print(varHat)
 
# Let's do some Plotting
par( mfrow=c(3,1) )
plot(ar3_process)
acf(ar3_process)
acf(ar3_process, type='partial')




