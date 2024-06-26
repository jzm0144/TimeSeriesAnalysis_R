# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())
# Clear the R console by running CTRL+L or writing the below command
cat("\014")

library(forecast)
par(mfcol = c(4,1))
plot(discoveries, main='Number of Discoveries in a Year')
stripchart(discoveries, method='stack', offset=0.5, at=1.5, pch=19, main='Num of Discoveries Dotplot', xlab='Num of Discoveries in a Year', ylab='Frequency')
acf(discoveries, main='ACF')
acf(discoveries, type='partial', main='PACF')
print(auto.arima(discoveries))