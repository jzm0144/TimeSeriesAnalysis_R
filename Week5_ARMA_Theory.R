rm(list = ls())

data = arima.sim(list(order=c(1,0,1), ar=0.7, ma=0.2), n = 10000)
par(mfcol = c(3,1))
plot(data, main='ARMA Simulation Original Signal')
acf(data, type='correlation', main='ACF')
acf(data, type='partial', main='PACF')

