#phi1 = 0.2; phi2 = 0.3; phi3=0.1; phi3.5= 0.01; phi4 = -0.1; phi5 = -0.3; phi6=-0.2;
#par(mfrow=c(3,1))
#data.ts = arima.sim(n = 1500, list(ar = c(phi1, phi2, phi3,phi3.5, phi4, phi5, phi6)))
#plot(data.ts, 
#     main = 
#       paste("Autoregressive Process with phi1=", phi.1," phi2=",phi.2 ) ) 
#acf(data.ts, type='correlation', main='ACF Plot')
#acf(data.ts, type='partial', main="PACF Plot")

phi1 = 1.3315874; phi2 = -0.4445447;
par(mfrow=c(3,1))
data.ts = arima.sim(n = 1500, list(ar = c(phi1, phi2)))
plot(data.ts, main = paste("Autoregressive Process with phi1=", phi1," phi2=",phi2 ) ) 
acf(data.ts, type='correlation', main='ACF Plot')
acf(data.ts, type='partial', main="PACF Plot")