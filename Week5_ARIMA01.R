# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())
# Clear the R console by running CTRL+L or writing the below command
cat("\014")

library(tsdl)
library(forecast)
library(astsa)

# Create Simulated ARIMA Data with the given AR D and MA coefficients
data = arima.sim(list(order=c(3,0,2), ma=c(0.5,-0.3), ar=c(0.4, -0.2, 0.15)), n = 1000)
#data = arima.sim(list(order=c(1,2,1),ma=c(5), ar=c(0, 3, -2)), n = 10)

par(mfcol = c(3,1))
plot(data, main='ARMA Simulation Original Signal')
acf(data, type='correlation', main='ACF')
acf(data, type='partial', main='PACF')

# Generate an ARIMA model for the Data using auto.arima
# see the coefficients and stats of the model for assessment
print(auto.arima(data))