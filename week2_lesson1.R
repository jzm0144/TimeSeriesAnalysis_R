# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())

require(astsa)
require(graphics)
require(datasets)

par(mfrow=c(3,1))
# Johnson Johnson Data
data = jj
print(summary(jj))
plot(jj, main='Johnson Johnson Earning Data (Quarterly)', xlab='Years', type='o', col='red')


# Neumonia and Flu Dataset
data = flu
plot(data, main='Neuomnia and Flu Deaths/10000 (Monthly)', xlab='Months', type='o', col='red')


# Land-ocean Temperature Deviations Dataset
data = ts(scan('globtemp.dat'))
plot(data, main='Land-ocean Temperature Deviations (Quarterly)', xlab='Years', type='o', col='red')
