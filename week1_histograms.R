my_dataset = c(91,49,76,112,97,42,70, 100, 8, 112, 95, 90, 78, 62, 56, 94, 65, 58, 109, 70, 109, 91, 71, 76, 68, 62, 134, 57, 83, 66)

hist(my_dataset, xlab = 'Data Points', ylab = 'Frequency', main = 'Histogram', freq = TRUE, col='green')

lines(density(my_dataset), col='red', lwd=5)


