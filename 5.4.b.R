#Does the average price of avocados differ between Albany, Houston, and Seattle?
#your x, or iv, will be three levels: Albany, Houston, and Seattle. Your y, or dv, will be the average price.

library(dplyr)
library(rcompanion)
library(car)

avocadoregion <- na.omit(avocados %>% filter(region %in% c("Albany", "Houston", "Seattle")))
avocadoregion$AveragePrice <- as.numeric(avocadoregion$AveragePrice)

# Normality
plotNormalHistogram(avocadoregion$AveragePrice)

#Square root it
avocadoregion$AveragePriceSQRT <- sqrt(avocadoregion$AveragePrice)
plotNormalHistogram(avocadoregion$AveragePriceSQRT)

#Cube it
avocadoregion$AveragePriceCUBE <- avocadoregion$AveragePrice ^ 3
plotNormalHistogram(avocadoregion$AveragePriceCUBE)
#Log went too far, stick with SQRT

# Homogeneity of Variance
bartlett.test(AveragePrice ~ region, data=avocadoregion)
# Does not meet the assumption for homogeneity of variance

ANOVA <- lm(AveragePrice ~ region, data=avocadoregion)
Anova(ANOVA, Type="II", white.adjust=TRUE)

# Do the Post Hocs with unequal variance
pairwise.t.test(avocadoregion$AveragePrice, avocadoregion$region, p.adjust="bonferroni", pool.sd = FALSE)

# Find means and draw conclusions
avocadoregionMeans <- avocadoregion %>% group_by(region) %>% summarize(Mean = mean(AveragePrice))
# All grades significantly differ from all other grades in the number of views they receive, with the higher grades typically getting more views. 
