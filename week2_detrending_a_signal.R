# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())

x = NULL
y = NULL
z = NULL
x[1] = 0
y[1] = 0

# Create a Random Walk Dataset and a Sine wave Dataset
for(i in 2:2000){
  x[i] = x[i-1]+rnorm(1)
  y[i] = sin(2*3.14*0.02*i)
}
print(x)
# Superimpose Sine wave Dataset on Random Walk
z = x + 10*y

# Create a multivisual plot
par(mfrow = c(3, 2))
plot(ts(x), main='Random Walk Data', xlab='time', ylab='value')
plot(ts(y), main='Sine Wave Data', xlab='time', ylab='value')


plot(ts(z), main='Pre-differencing TimeSeries', xlab='time', ylab='value')
acf(z, type='correlation', main='ACF (Before)')

#apply differencing to remove trend and make the signal stationary

dz = diff(z)
plot(ts(dz), main='Post-differencing TimeSeries', xlab='time', ylab='value')
acf(dz, type='correlation', main='ACF (After)')