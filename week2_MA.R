# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())
N = 10000

# Generate Noise
noise = rnorm(N)

# Introduce a Variable
ma2 = NULL
ma3 = NULL
ma4 = NULL
ma5 = NULL

# Generate an MA2 Process
for(i in 3:N){
  ma2[i] = noise[i]+0.5*noise[i-1]+0.5*noise[i-2]
}

# Generate an MA3 Process
for(i in 4:N){
  ma3[i] = noise[i]+0.5*noise[i-1]+0.5*noise[i-2]+0.2*noise[i-3]
}

# Generate an MA4 Process
for(i in 5:N){
  ma4[i] = noise[i]+0.5*noise[i-1]+0.5*noise[i-2]+0.2*noise[i-3]+0.1*noise[i-4]
}

# Generate an MA5 Process
for(i in 6:N){
  ma5[i] = noise[i]+0.5*noise[i-1]+0.5*noise[i-2]+0.3*noise[i-3]+0.2*noise[i-4]+0.1*noise[i-5]
}



# make a figure with 4x2 plots in it and sides have a margin of 2
par(mfrow=c(4,2), oma=c(0,1,1,1))
# Cut the first few readings
MA2 = ma2[3:N]
MA3 = ma3[4:N]
MA4 = ma4[5:N]
MA5 = ma5[6:N]

plot(ts(MA2), main='MA2 TimeSeries', xlab='time', ylab='value',col='red')
acf(ts(MA2), type='correlation', main='ACF (Corr)', col='red')

plot(ts(MA3), main='MA3 TimeSeries', xlab='time', ylab='value',col='red')
acf(ts(MA3), type='correlation', main='ACF (Corr)', col='red')

plot(ts(MA4), main='MA4 TimeSeries', xlab='time', ylab='value',col='red')
acf(ts(MA4), type='correlation', main='ACF (Corr)', col='red')

plot(ts(MA5), main='MA5 TimeSeries', xlab='time', ylab='value',col='red')
acf(ts(MA5), type='correlation', main='ACF (Corr)', col='red')
title("Spikes of ACF show Order of MA process", line = -1, outer = TRUE, font.main=2, cex.main=1.7)

