x = co2
y = lm(co2 ~ time(x))
residuals = resid(y)


plot(co2)
abline(y)

hist(residuals, col='red')

qqnorm(residuals)
qqline(residuals)
