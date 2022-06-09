library("corpcor")
library("GPArotation")
library("psych")
library("IDPmisc")

studentSurvey1 <- studentSurvey[, 31:42]

studentSurveymatrix <- cor(studentSurvey1)
View(round(studentSurveymatrix, 2))

cortest.bartlett(studentSurvey1)
det(studentSurveymatrix)

pcModel1 <- principal(studentSurvey1, nfactors = 10, rotate = "none")
pcModel1

plot(pcModel1$values, type="b")

pcModel2 <- principal(studentSurvey1, nfactors = 2, rotate = "none")

residuals <- factor.residuals(studentSurveymatrix, pcModel2$loadings)
residuals <- as.matrix(residuals[upper.tri(residuals)])
largeResid <- abs(residuals) > .05
sum(largeResid)
sum(largeResid/nrow(residuals))

pcModel3 <- principal(studentSurvey1, nfactors = 2, rotate = "oblimin")
pcModel3

print.psych(pcModel3, cut = .3, sort=TRUE)

pcModel4 <- principal(studentSurvey1, nfactors = 2, rotate = "varimax")
print.psych(pcModel4, cut=.3, sort=TRUE)

------------------------------------------------------------------------------------------------------------
library("psych")
goodSS <- studentSurvey1[, c(1,2,4,8)]
badSS <- studentSurvey1[, c(3,5,6,7,9,10)]

studentSurvey1$Area3r <- NA
studentSurvey1$Area3r[studentSurvey1$Area3 == 1] <- 5
studentSurvey1$Area3r[studentSurvey1$Area3 == 2] <- 4
studentSurvey1$Area3r[studentSurvey1$Area3 == 3] <- 3
studentSurvey1$Area3r[studentSurvey1$Area3 == 4] <- 2
studentSurvey1$Area3r[studentSurvey1$Area3 == 5] <- 1

studentSurvey1$Area5r <- NA
studentSurvey1$Area5r[studentSurvey1$Area5 == 1] <- 5
studentSurvey1$Area5r[studentSurvey1$Area5 == 2] <- 4
studentSurvey1$Area5r[studentSurvey1$Area5 == 3] <- 3
studentSurvey1$Area5r[studentSurvey1$Area5 == 4] <- 2
studentSurvey1$Area5r[studentSurvey1$Area5 == 5] <- 1

studentSurvey1$Area6r <- NA
studentSurvey1$Area6r[studentSurvey1$Area6 == 1] <- 5
studentSurvey1$Area6r[studentSurvey1$Area6 == 2] <- 4
studentSurvey1$Area6r[studentSurvey1$Area6 == 3] <- 3
studentSurvey1$Area6r[studentSurvey1$Area6 == 4] <- 2
studentSurvey1$Area6r[studentSurvey1$Area6 == 5] <- 1

studentSurvey1$Area7r <- NA
studentSurvey1$Area7r[studentSurvey1$Area7 == 1] <- 5
studentSurvey1$Area7r[studentSurvey1$Area7 == 2] <- 4
studentSurvey1$Area7r[studentSurvey1$Area7 == 3] <- 3
studentSurvey1$Area7r[studentSurvey1$Area7 == 4] <- 2
studentSurvey1$Area7r[studentSurvey1$Area7 == 5] <- 1

studentSurvey1$Area9r <- NA
studentSurvey1$Area9r[studentSurvey1$Area9 == 1] <- 5
studentSurvey1$Area9r[studentSurvey1$Area9 == 2] <- 4
studentSurvey1$Area9r[studentSurvey1$Area9 == 3] <- 3
studentSurvey1$Area9r[studentSurvey1$Area9 == 4] <- 2
studentSurvey1$Area9r[studentSurvey1$Area9 == 5] <- 1

studentSurvey1$Area10r <- NA
studentSurvey1$Area10r[studentSurvey1$Area10 == 1] <- 5
studentSurvey1$Area10r[studentSurvey1$Area10 == 2] <- 4
studentSurvey1$Area10r[studentSurvey1$Area10 == 3] <- 3
studentSurvey1$Area10r[studentSurvey1$Area10 == 4] <- 2
studentSurvey1$Area10r[studentSurvey1$Area10 == 5] <- 1

studentSurvey2 <- studentSurvey1[, c(1,2,4,8,11,12)]

alpha(goodSS)
alpha(badSS)
alpha(studentSurvey2)
