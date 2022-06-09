library("ggplot2")

#Graph 1
quadPlot <- ggplot(nonlinear_1, aes(x = X1, y = Y1)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1)
quadPlot

X1sq <- nonlinear_1$X1^2

quadModel <- lm(nonlinear_1$Y1~nonlinear_1$X1+X1sq)
summary(quadModel)

#Graph 2
exMod <- lm(log(nonlinear_1$Y2)~nonlinear_1$X2)
summary(exMod)
