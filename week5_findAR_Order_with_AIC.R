rm(list = ls())
set.seed(250)
timeseries=arima.sim(list(order = c(1,1,2), ma=c(0.32,0.47), ar=0.8), n = 50)+20


par(mfrow=c(2,2))
plot(timeseries, main="Original Time Series")
acf(timeseries, main="ACF of Original Time Series")
timeseries_diff = diff(timeseries)
plot(timeseries_diff, main="First Diff of Time Series")
acf(timeseries_diff, main="ACF of Fisrt Diff")

par(mfrow=c(1,2))
acf(timeseries_diff, main="ACF of Diff TS")
acf(timeseries_diff, type='partial', main="PACF of Diff TS")

train_series=timeseries[1:40]
test_series=timeseries[41:50]

## make arima models
arimaModel_1=arima(train_series, order=c(0,1,2))
arimaModel_2=arima(train_series, order=c(1,1,0))
arimaModel_3=arima(train_series, order=c(1,1,2))

## look at the parameters
print(arimaModel_1);print(arimaModel_2);print(arimaModel_3)


# Generate Forecasts
forecast1=predict(arimaModel_1, 10)
forecast2=predict(arimaModel_2, 10)
forecast3=predict(arimaModel_3, 10)

print(mean(abs(test_series - forecast1$pred)))
print(mean(abs(test_series - forecast2$pred))) # This model is better.
print(mean(abs(test_series - forecast3$pred)))





