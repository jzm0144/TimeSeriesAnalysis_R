# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())

y = NULL
y[1] = 0

# Create a Sine wave Dataset
for(i in 2:1000){
  y[i] = sin(2*3.14*0.02*i)
}


purely_rand_process = ts(rnorm(1000))
sine_process = ts(y)
par(mfrow=c(2,3))
plot(sine_process, main='Sine Process')
hist(sine_process, main='Histogram of Sine Process')
acf(sine_process, type='covariance', main='ACF')


plot(purely_rand_process, main='Purely Random Process')
hist(purely_rand_process, main='Histogram of Random Process')
acf(purely_rand_process, type='covariance', main='ACF')