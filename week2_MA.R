rm(list = ls())
N = 10000

# Generate Noise
noise = rnorm(N)

# Introduce a Variable
ma2 = NULL

# Generate an MA2 Process
for(i in 3:N){
  ma2[i] = noise[i]+0.5*noise[i-1]+0.5*noise[i-2]
}

# Cut the first few readings
moving_average_process = ma2[3:N]
par(mfrow = c(2, 1))
plot(ts(moving_average_process), main='MA2 TimeSeries', xlab='time', ylab='value',col='red')
acf(ts(moving_average_process), type='correlation', main='ACF (Before)', col='red')

