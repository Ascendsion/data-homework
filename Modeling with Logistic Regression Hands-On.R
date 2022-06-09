library("caret")
library("magrittr")
library("dplyr")
library("tidyr")
library("lmtest")
library("popbio")
library("e1071")

mylogit <- glm(Gold ~ Antimony, data=minerals, family="binomial")

probabilities <- predict(mylogit, type = "response")
minerals$Predicted <- ifelse(probabilities > .5, "pos", "neg")

minerals$PredictedR <- NA
minerals$PredictedR[minerals$Predicted=='pos'] <- 1
minerals$PredictedR[minerals$Predicted=='neg'] <- 0

minerals$PredictedR <- as.factor(minerals$PredictedR)
minerals$Gold <- as.factor(minerals$Gold)

conf_mat <- caret::confusionMatrix(minerals$PredictedR, minerals$Gold)
conf_mat

#One cell is below 5, therefore this not meet the minimum sample size for binary logistic regression.
# ~83% accurate

minerals2 <- minerals %>% 
dplyr::select_if(is.numeric)

predictors <- colnames(minerals2)

minerals2 <- minerals2 %>%
mutate(logit=log(probabilities/(1-probabilities))) %>%
gather(key= "predictors", value="predictor.value", -logit)

#graph to assess for linearity
ggplot(minerals2, aes(logit, predictor.value))+
geom_point(size=.5, alpha=.5)+
geom_smooth(method= "loess")+
theme_bw()+
facet_wrap(~predictors, scales="free_y")

#Graphing the Errors
plot(mylogit$residuals)

dwtest(mylogit, alternative="two.sided")
#D-W number is between 1 & 3;it's in an ok range and have met the assumption of independent errors through testing as well as graphing.

infl <- influence.measures(mylogit)
summary(infl)

summary("mylogit")

logi.hist.plot(minerals$Antimony,minerals$Gold, boxp=FALSE, type="hist", col="gray")

#The more antimony found, the more likely there will be gold nearby.