# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
dev.off()
require(graphics)
par(mfrow=c(1,1))
plot(co2, ylab = expression("Atmospheric concentration of CO"[2]),las = 1, col='red', main='Atmospheric CO2 Concentration')
co2.values = as.numeric(co2)
co2.times = as.numeric(time(co2))


SSxx = sum((co2.times - mean(co2.times)) * (co2.times - mean(co2.times)))
SSxy = sum((co2.values - mean(co2.values)) * (co2.values - mean(co2.values)))
print(co2)

slope = SSxy/SSxx

intercept = mean(co2.values) - slope*mean(co2.values)

print(slope)
print(intercept)
co2.linear.model = lm(co2 ~ time(co2) )
abline(co2.linear.model )


co2.fitted.values = slope*co2.times + intercept
co2.residuals = co2.values - co2.fitted.values

par(mfrow=c(1,3))
( c02.residuals = resid( co2.linear.model ) )
hist(co2.residuals, main= "Histogram of CO2 Residuals")
qqnorm(c02.residuals, main= "Normal Probability Plot")
qqline(c02.residuals)
plot(c02.residuals ~ time(co2), main="Residuals on Time")


par(mfrow=c(1,1))
plot(c02.residuals ~ time(co2), xlim=c(1960, 1963), main="Zoomed in Residuals on Time")




