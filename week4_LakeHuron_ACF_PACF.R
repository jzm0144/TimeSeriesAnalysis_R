# Remove all variables from the RStudio Memory
rm(list = ls())
# Remove all visuals from the RStudio Memory
try(dev.off())
# Clear the R console by running CTRL+L or writing the below command
cat("\014")
par( mfrow=c(3,1) )
plot(LakeHuron)
acf(LakeHuron)
acf(LakeHuron, type="partial")