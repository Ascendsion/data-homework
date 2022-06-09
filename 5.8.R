#It is well-known that men are more likely to have heart attacks than women. 
#How does gender (sex) influence some of the heart attack predictors like resting blood 
#pressure (trestbps) and cholesterol (chol)?

#IV: Sex
#DV: trestbps & chol

library("mvnormtest")
library("car")

str(heartAttacks$trestbps)
str(heartAttacks$chol)

keeps <- c("trestbps", "chol")
heartAttacks1 <- heartAttacks[keeps]
heartAttacks2 <- heartAttacks1[1:5000,]

heartAttacks3 <- as.matrix(heartAttacks2)

heartAttacks4 <- na.omit(heartAttacks3)

mshapiro.test(t(heartAttacks4))

leveneTest(heartAttacks$trestbps, heartAttacks$sex, data=heartAttacks)
leveneTest(heartAttacks$chol, heartAttacks$sex, data=heartAttacks)

cor.test(heartAttacks$trestbps, heartAttacks$chol, method="pearson", use="complete.obs")

MANOVA <- manova(cbind(trestbps, chol) ~ sex, data = heartAttacks)
summary(MANOVA)

summary.aov(MANOVA, test = "wilks") 
