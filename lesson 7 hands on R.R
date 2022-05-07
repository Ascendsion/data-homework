data(nhtemp)

first25 <- nhtemp[1:25]
last25 <- nhtemp[36:60]

View(nhtemp)

average(first25)
average(last25)

nhtemp

head(nhtemp, 25)

data("nhtemp")

?nhtemp

summary(nhtemp)

tempTdep <- t.test(first25, last25, paired = TRUE)
tempTdep

View(first25)

ls()

View(nhtemp)