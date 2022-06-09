#Recode Activity into a new variable called JunkFood. Anything that you would consider junk food, recode as a 1. Everything else should be recoded as a zero.

Eating_Habits$JunkFood < NA
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating fruit'] <- 0
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating raw vegetables'] <- 0
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating candy, chocolate bars'] <- 1
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating potato chips, crisps'] <- 1
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating french fries'] <- 1
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating hamburgers, hot dogs or sausages'] <- 1
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating peanuts'] <- 0
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating whole wheat or rye bread'] <- 0
Eating_Habits$JunkFood[Eating_Habits$Activity=='Drinking soft drinks, cola or other drinks with sugar'] <- 1
Eating_Habits$JunkFood[Eating_Habits$Activity=='Drinking coffee'] <- 0
Eating_Habits$JunkFood[Eating_Habits$Activity=='Eating Fruit'] <- 0

#Recode Sex from text to numbers in the same variable.

Eating_Habits$Sex[Eating_Habits$Sex=='Males'] <- 0
Eating_Habits$Sex[Eating_Habits$Sex=='Females'] <- 1