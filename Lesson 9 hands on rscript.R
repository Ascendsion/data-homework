library(dplyr)
library(ggplot2)
library(gapminder)

data(gapminder)

levels(gapminder$country)

install.packages("gapminder")

View(gapminder)

q1 <- gapminder %>% filter(country %in% c("United States", "Canada", "Mexico", "Japan", "Switzerland")) %>% 
View(q1)

q1952 <- q1 %>% filter(year %in% ("1952"))
View(q1952)

q2007 <- q1 %>% filter(year %in% ("2007"))
View(q2007)

ggplot(q1) + geom_line(aes(x = year, y = lifeExp, color=country))  + ylab("human life expectancy in years")

median <- gapminder %>% select(year,lifeExp) %>% group_by(year) %>% summarise(medlifeExp = median(lifeExp))
View(median)