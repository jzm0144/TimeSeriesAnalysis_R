# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())
# Clear the R console by running CTRL+L or writing the below command
cat("\014")

X = diff(diff(BJsales))

# Create an ARIMA model for the given Data using the 
# AR3, D0 and M1 order
model<-arima(X, order=c(3,0,1))
print(model)

par(mfrow=c(2,2), oma=c(0,1,1,1))

#Assess the Model Residuals using visuals or Descriptive Stats
print(mean(model$residuals))
print(var(model$residuals))

plot(model$residuals, ylab='Residuals of Model', main='', col='red')
acf(model$residuals, ylab='ACF of Residuals', main='', col='red')
pacf(model$residuals, ylab = 'PACF of Residuals', main='', col='red')
qqnorm(model$residuals, ylab='Qplot (Sample Quantiles)', main='', col='red')
title("Assessing the Residuals of ARMA Model", line = -1, outer = TRUE, font.main=2, cex.main=1.7)


# If the residuals look like white noise, then the model is good and
# can be used for forecasting