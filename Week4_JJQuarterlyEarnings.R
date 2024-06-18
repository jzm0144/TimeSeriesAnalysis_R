# Time plot for Johnson&Johnson
plot(JohnsonJohnson, main='Johnson&Johnosn earnings per share', col='blue', lwd=3)

# log-return of Johnson&Johnson
jj.log.return=diff(log(JohnsonJohnson))
jj.log.return.mean.zero=jj.log.return-mean(jj.log.return)

# Plots for log-returns
par(mfrow=c(3,1))
plot(jj.log.return.mean.zero, main='Log-return (mean zero) of Johnson&Johnosn earnings per share')
acf(jj.log.return.mean.zero, main='ACF')
pacf(jj.log.return.mean.zero, main='PACF')

# Order
p = 4

# Sample Autocorreleation Function r
r=NULL
r[1:p]=acf(jj.log.return.mean.zero, plot=F)$acf[2:(p+1)]
print("r")
print(r)

# matrix R
R=matrix(1,p,p) # matrix of dimension 4 by 4, with entries all 1's.

# define non-diagonal entires of R
for(i in 1:p){
  for(j in 1:p){
    if(i!=j)
      R[i,j]=r[abs(i-j)]
  }
}
print("R")
print(R)

# b-column vector on the right
b=matrix(r,p,1)# b- column vector with no entries
print("b")
print(b)

# phiHat coeff = R_inverse . b_acfs
phiHat=solve(R,b)[,1]
print("phiHat")
print(phiHat)

# Variance estimation using Yule-Walker Estimator
c0=acf(jj.log.return.mean.zero, type='covariance', plot=F)$acf[1]
print("c0")
print(c0)
varHat=c0*(1-sum(phiHat*r))
print("varHat")
print(varHat)

# Constant term in the model
phi0Hat=mean(jj.log.return)*(1-sum(phiHat))
print("phi0Hat")
print(phi0Hat)

