# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
dev.off()

x = co2
y = lm(co2 ~ time(x))
residuals = resid(y)

par(mfrow=c(2,2))
plot(co2)
abline(y)

hist(residuals, col='red')
qqnorm(residuals)
qqline(residuals)

