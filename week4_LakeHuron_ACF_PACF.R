par( mfrow=c(3,1) )
plot(LakeHuron)
acf(LakeHuron)
acf(LakeHuron, type="partial")