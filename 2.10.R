install.packages("Ecdat")

library(Ecdat)

head(Cigarette)

View(Cigarette)

cigarette1 <- head(Cigarette)

library("ggplot2")
library("dplyr")

ggplot(Cigarette, aes(x=state, y=packpc)) + geom_boxplot()

MedianDF <- Cigarette %>% group_by(year) %>% summarise(Median = median(packpc))

ggplot(MedianDF, aes(x=year, y=Median)) + geom_point()

ggplot(Cigarette, aes(x=avgprs, y=packpc)) + geom_point() + geom_smooth(method=lm)

cor.test(Cigarette$avgprs, Cigarette$packpc, method="pearson", use="complete.obs")

ggplot(Cigarette, aes(x=avgprs, y=packpc, color=year)) + geom_point() + geom_smooth(method=lm)

RegressionDF <- lm(packpc~avgprs, Cigarette)
summary(RegressionDF)

Inflation <- Cigarette %>% mutate(infPri = avgprs / cpi)

ggplot(Inflation, aes(x=infPri, y=packpc)) + geom_point() + geom_smooth(method=lm)

RegressionDF2 <- lm(packpc~infPri, Inflation)
summary(RegressionDF2)

Cig1985DF <- Cigarette %>% filter(year == 1985)

Cig1995DF <- Cigarette %>% filter(year == 1995)

t.test(Cig1985DF$packpc, Cig1995DF$packpc, paired=TRUE)
