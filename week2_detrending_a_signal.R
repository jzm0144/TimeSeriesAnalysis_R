x = NULL
y = NULL
z = NULL
x[1] = 0
y[1] = 0
for(i in 2:2000){
  x[i] = x[i-1]+rnorm(1)
  y[i] = sin(2*3.14*0.02*i)
}
print(x)
z = x + 10*y

par(mfrow = c(2, 2))
plot(ts(z), main='Pre-differencing TimeSeries', xlab='time', ylab='value')
acf(z, type='correlation', main='ACF (Before)')

#apply differencing to remove trend and make the signal stationary

dz = diff(z)
plot(ts(dz), main='Post-differencing TimeSeries', xlab='time', ylab='value')
acf(dz, type='correlation', main='ACF (After)')