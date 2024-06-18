rm(list = ls())
X = sleep

plot(X$extra ~ X$group, main='Extra Sleep in Gosset Data by Group', col='100')
attach(sleep)
extra1 = extra[group==1]
extra2 = extra[group==2]
print(mean(extra1))
print(mean(extra2))


print(t.test(extra1, extra2, paired=TRUE, alternative="two.sided"))

pairs(rock)
cov(rock)
cor(rock)

