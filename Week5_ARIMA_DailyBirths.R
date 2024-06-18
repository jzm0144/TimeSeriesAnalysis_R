rm(list = ls())
library(tsdl)
library(forecast)
library(astsa)

# Follow this Guideline
######################
# Trend Suggest Differencing
# Variation in Variance  suggests Transformation
# Common Transformation: Log, then Differencing (also called log-return)
# ACF identifies the order of Moving Average Process (q)
# PACF identifies the order of Autoregressive Process (p)
# Akaike Information Criterion (AIC)
# Sum of Squared Errors (SSE)
# Ljung-Box Q-Statistics
# Estimation!

# ---- Data Source: TSDL Library
# ---- Description: Daily Total Female Births in California in 1959
# ---- Read the Data -----------
Data <- read.csv('femalebirths.csv')
# ---- Visualize the Data 
num_of_births = Data$Births
#Data$Date = as.Date(Data$Date, format="%m/%d/%Y")
birthday = Data$Date

par(mfcol = c(3,1))
plot(num_of_births ~ as.Date(birthday), main='Female Birth Count', type='l',xlab='Date')
hist(num_of_births, main='Histogram',xlab='Number of Births')


# Applying in the Box-Pierce Test to look for Correlation
x = Box.test(num_of_births, lag = log(length(num_of_births)))
print(x) # this will return a p < 0.05 that mean there is autocorrelation with the mentioned
# number of lags


# Now plot the differenced Data
plot.ts(diff(num_of_births), main='Differenced Series')
# Apply Box Test on Differenced Data
y = Box.test(diff(num_of_births), lag = log(length(diff(num_of_births))))
print(y)


par(mfcol = c(2,2))
acf(num_of_births, main='ACF of Data', 50)
pacf(num_of_births, main='PACF of Data', 50)
# acf and pacf of the differenced data
acf(diff(num_of_births), main='ACF of differenced data', 50)
pacf(diff(num_of_births), main='PACF of differenced data', 50)
# With this plot the differenced series looks easier to model

# Now let's try to build an ARIMA Model for the given Differnced Data
X = num_of_births
XD = diff(num_of_births)
model1 <- arima(X, order=c(0, 1, 1))
SSE1 <- sum(model1$residuals^2)
model1.test <- Box.test(model1$residuals, lag=log(length(model1$residuals)))

model2 <- arima(X, order=c(0, 1, 2))
SSE2 <- sum(model2$residuals^2)
model2.test <- Box.test(model2$residuals, lag=log(length(model2$residuals)))

model3 <- arima(X, order=c(7, 1, 1))
SSE3 <- sum(model3$residuals^2)
model3.test <- Box.test(model3$residuals, lag=log(length(model3$residuals)))

model4 <- arima(X, order=c(7, 1, 2))
SSE4 <- sum(model4$residuals^2)
model4.test <- Box.test(model4$residuals, lag=log(length(model4$residuals)))

df<-data.frame(row.names=c('AIC', 'SSE', 'p-value'), c(model1$aic, SSE1, model1.test$p.value), 
               c(model2$aic, SSE2, model2.test$p.value), c(model3$aic, SSE3, model3.test$p.value),
               c(model4$aic, SSE4, model4.test$p.value))
colnames(df)<-c('Arima(0,1,1)','Arima(0,1,2)', 'Arima(7,1,1)', 'Arima(7,1,2)')

#

print(format(df, scientific=FALSE))



# Fit a Sarima Model
# Fit a SARIMA model

sarima(X, 7,1,2,0,0,0)





