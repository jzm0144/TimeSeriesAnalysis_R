x = NULL
x[1] = 0
for(i in 2:1000){
  x[i] = x[i-1]+rnorm(1)
}
print(x)


par(mfrow = c(2, 2))
plot(x, main='Pre-differencing Random Walk Model', xlab='time', ylab='value')
acf(x, type='correlation', main='ACF (Before)')

#apply differencing to remove trend and make the signal stationary

dx = diff(x)
plot(dx, main='Post-differencing Random Walk Model', xlab='time', ylab='value')
acf(dx, type='correlation', main='ACF (After)')