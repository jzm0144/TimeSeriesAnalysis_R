x=NULL
z=NULL
n=10000

z=rnorm(n)
x[1:13]=1

for(i in 14:n){
  x[i]<-z[i]+0.7*z[i-1]+0.6*z[i-12]+0.42*z[i-13]
}

par(mfrow=c(3,1))
plot.ts(x[12:120], main='The first 10 months of simulation SARIMA(0,0,1,0,0)_12', ylab='') 

acf(x, main='ACF of SARIMA(0,0,1,0,0,1)_12 Simulation')
acf(x, main='PACF of SARIMA(0,0,1,0,0,1)_12 Simulation', type='partial')