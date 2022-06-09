#Part 1
FitAll1 <- lm(IQ ~ ., data = IQ)
summary(FitAll)

step(FitAll1, direction = 'backward')

fitsome <- lm(IQ ~ Test1 + Test2 + Test4, data = IQ)
summary(fitsome)

#Which model is the best? Why? 
#Backwards elimination because you would want to remove undesirable variables to reach a superior conclusion.

#From the best model, what is the adjusted R2 value and what does it mean?
#0.9998, adjusted R^2 is a modification that is supposed to take into account the number of terms in the model.

#From the best model, how does each variable influence IQ?
#

----------------------------------------------------------------------------------------
#Part 2

FitAll2 = lm(Y ~ ., data = stepwiseRegression)
summary(FitAll2)

step(FitAll2, direction = 'backward', scope = formula(FitAll2))

fitstart = lm(Y ~ 1, data = stepwiseRegression)
summary(fitstart)

step(fitstart, direction = 'forward', scope = (formula(FitAll2)))

step(fitstart, direction = 'both', scope = formula(FitAll2))

fitsome <- lm(formula = Y ~ X2 + X4 + X6 + X10 + X11 + X12, data = stepwiseRegression)
summary(fitsome)

#Which model was the best for each type of method?
#

#How do the final models from each method compare to each other?
#

#From your chosen "best model," explain what variable(s) contribute to predicting Y and for how much variance they account.
#
