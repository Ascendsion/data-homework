For this Final Project, you will use the Cigarette data set in the Ecdat package. To do this, you first must install the Ecdat package with the command

install.packages("Ecdat")

To make this package accessible to your R session, type the command

library(Ecdat)

You should now be able to see the Cigarette data frame:

head(Cigarette)

state year   cpi      pop   packpc    income  tax    avgprs     taxs

1    AL 1985 1.076  3973000 116.4863  46014968 32.5 102.18167 33.34834

2    AR 1985 1.076  2327000 128.5346  26210736 37.0 101.47500 37.00000

3    AZ 1985 1.076  3184000 104.5226  43956936 31.0 108.57875 36.17042

4    CA 1985 1.076 26444000 100.3630 447102816 26.0 107.83734 32.10400

5    CO 1985 1.076  3209000 112.9635  49466672 31.0  94.26666 31.00000

6    CT 1985 1.076  3201000 109.2784  60063368 42.0 128.02499 51.48333
Each row provides data about a given state in a given year. This data set has the following variables:

state: the two letter abbreviation for the state.
year: the year.
cpi: consumer price index for the year.
pop: state population
packpc: average number of packs of cigarettes per capita per year
income: total state personal income.
tax: average state, federal, and average local excise taxes for fiscal year.
avgprs: average price per pack during fiscal year, including sales taxes, in cents.
taxs: average excise taxes per pack for fiscal year, including sales taxes, in cents.
Complete the project by completing the following. Remember to document your process and your results in your PowerPoint presentation.

Create a boxplot of the average number of packs per capita by state. Which states have the highest number of packs? Which have the lowest?

Find the median over all the states of the number of packs per capita for each year. Plot this median value for the years from 1985 to 1995. What can you say about cigarette usage in these years?

Create a scatter plot of price per pack vs number of packs per capita for all states and years.

Are the price and the per capita packs positively correlated, negatively correlated, or uncorrelated? Explain why your answer would be expected.

Change your scatter plot to show the points for each year in a different color. Does the relationship between the two variable change over time?

Do a linear regression for these two variables. How much variability does the line explain?

The plot above does not adjust for inflation. You can adjust the price of a pack of cigarettes for inflation by dividing the avgprs variable by the cpi variable. Create an adjusted price for each row, then re-do your scatter plot and linear regression using this adjusted price.

Create a data frame with just the rows from 1985. Create a second data frame with just the rows from 1995. Then, from each of these data frames, get a vector of the number of packs per capita. Use a paired t-test to see if the number of packs per capita in 1995 was significantly different than the number of packs per capita in 1985.

In the process of doing this project, have any questions come to mind that this data set could answer? If so, pick one and do the analysis to find the answer to your question.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  

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

