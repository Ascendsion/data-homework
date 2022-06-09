library(gmodels)
library(dplyr)
library(tidyr)

#Does the term of the loan influence loan status? If so, how?
#The shorter monthly loan gave a higher likelyhood of having the debt paid off. 

CrossTable(loans$term, loans$loan_status, chisq = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")

#How has the ability to own a home changed after 2009?
#The ability to own a home after 2009 has dropped.

library("gmodels")
library("tidyr")

loans$DateR <- as.Date(paste(loans$Date), "%m/%d/%Y")

loans1 <- separate(loans, DateR, c("Year", "Month", "Day"), sep="-")

loans1$YearR <- NA
loans1$YearR[loans1$Year <= 2009] <- 0
loans1$YearR[loans1$Year > 2009] <- 1

observed1 = c(3058, 18899)
expected2 = c(0.7, 0.3)
chisq.test(x=observed1, p=expected1)

loans1$RentvOwn <- NA
loans1$RentvOwn[loans1$home_ownership == "RENT"] <- 0
loans1$RentvOwn[loans1$home_ownership == "OWN"] <- 1

CrossTable(loans1$RentvOwn, loans1$YearR, fisher=TRUE, chisq = TRUE, mcnemar = TRUE, expected = TRUE, sresid=TRUE, format="SPSS") 

loans %>% group_by(home_ownership) %>% summarise(count=n())

observed2 = c(3058, 18899)
expected2 = c(0.7, 0.3)
chisq.test(x=observed, p=expected)

#The news just ran a story that only 15% of homes are fully paid for in America, and that another 10% have given up on paying it back, so the bank has "charged off" the loan. Does it seem likely that the data for this hands on came from the larger population of America?
#No, the amount of data provided comes from a couple of years and accounts for a small fraction of american home loans within the housing market. 
