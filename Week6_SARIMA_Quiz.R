x=NULL
z=NULL
n=10000

z=rnorm(n)
#x[1:15]=1

for(i in 14:n){
  x[i]<-z[i]+0.2*z[i-1]+0.3*z[i-2]+0.5*z[i-12]+0.1*z[i-13]+0.15*z[i-14]
}

y = x[15:120]
par(mfrow=c(3,1))
plot.ts(y, main='Original Series', ylab='value') 

acf(y, main='ACF of Series')
acf(y, main='PACF of Series', type='partial')
acf(y, main='ACOVF of Series', type='covariance')