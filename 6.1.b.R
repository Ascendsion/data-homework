library("car")
library("caret")
library("gvlma")
library("predictmeans")

scatter.smooth(x=heights_1$AM_Height, y=heights_1$PM_Height, main="Morning by Evening Height")

lmModHeights = lm(PM_Height~AM_Height, data=heights_1)

par(mfrow=c(2,2))
plot(lmModHeights)

lmtest::bptest(lmModHeights)

car::ncvTest(lmModHeights)

gvlma(lmModHeights)

CookD(lmModHeights, group=NULL, plot=TRUE, idn=3, newwd=TRUE)

lev = hat(model.matrix(lmModHeights))
plot(lev)

heights_1[lev>.2,]

car::outlierTest(lmModHeights)

summary(influence.measures(lmModHeights))

heightsNoO <- heights_1[c(1,2,5,6,7,8,9,10,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38,39,40,41),]
lmModHeightsNoO = lm(PM_Height~AM_Height, data=heightsNoO)

summary(lmModHeights)

summary(lmModHeightsNoO)
