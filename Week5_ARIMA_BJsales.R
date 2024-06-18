X = diff(diff(BJsales))

model<-arima(X, order=c(3,0,1))
print(model)

par(mfrow=c(2,2))

plot(model$residuals)
acf(model$residuals)
pacf(model$residuals)
qqnorm(model$residuals)