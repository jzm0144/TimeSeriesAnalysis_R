rm(list = ls())

library(isdals)
data(bodyfat)
attach(bodyfat)
#cor( cbind(Fat, Triceps,Thigh,Midarm) )
#print(cor(bodyfat$Fat, bodyfat$Triceps))
print(cor(bodyfat))
model = lm(Fat~Thigh)
FatHat = predict(model)
print(model)

TricepsHat = predict(lm(Triceps~Thigh))
print(cor((Fat-FatHat), (Triceps-TricepsHat)))