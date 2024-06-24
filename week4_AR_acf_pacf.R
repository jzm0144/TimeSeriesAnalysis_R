# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())

# This script allows you to examine the ACF and PACF plots of AR Processes.
# The spikes of PACF plot indicate the order of the AR process


par(mfrow=c(4,3), oma=c(0,1,1,1))
phi1 = 1.34; phi2 = -0.44;
data = arima.sim(n = 1500, list(ar = c(phi1, phi2)))
plot(data, main = paste("AR2 Process (phi1=", phi1," phi2=",phi2,")" ), col='red') 
acf(data, type='correlation', main='', col='red')
acf(data, type='partial',main='', col='red')

phi1 = 1.34; phi2 = -0.64; phi3=0.2
data = arima.sim(n = 1500, list(ar = c(phi1, phi2, phi3)))
plot(data, main = paste("AR3 Process (",phi1, phi2, phi3,')'), col='red') 
acf(data, type='correlation', main='', col='red')
acf(data, type='partial',main='', col='red')

phi1 = 1.34; phi2 = -0.54; phi3=0.1; phi4=-0.22
data = arima.sim(n = 1500, list(ar = c(phi1, phi2, phi3, phi4)))
plot(data, main = paste("AR4 Process (",phi1, phi2, phi3, phi4,')'), col='red') 
acf(data, type='correlation', main='', col='red')
acf(data, type='partial',main='', col='red')

phi1 = 1.34; phi2 = -0.54; phi3=0.1; phi4=-0.32; phi5=0.15
data = arima.sim(n = 1500, list(ar = c(phi1, phi2, phi3, phi4, phi5)))
plot(data, main = paste("AR5 Process (",phi1, phi2, phi3, phi4, phi5,')'), col='red') 
acf(data, type='correlation', main='', col='red')
acf(data, type='partial',main='', col='red')

title("ACF & PACF of AR Processes", line = -1, outer = TRUE, font.main=2, cex.main=1.7)
