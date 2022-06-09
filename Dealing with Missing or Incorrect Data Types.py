import pandas as pd

Eating_Habits = pd.read_excel('C:/Users/olver/Desktop/Eating_Habits.xlsx')

#Recode Activity into a new variable. Zeros should be not eating chocolate, and 1s should be eating chocolate.
def Activity (series): 
    if series == "Eating candy, chocolate bars":
        return 1
    else: 
        return 0
Eating_Habits['ChocolateYN'] = Eating_Habits['Activity'].apply(Activity)

#Recode Frequency & Sex from text to numbers in the same variable. The value zero should be the lowest frequency.
cleanup = {"Frequency" : {"Never" : 0, "Seldom" : 1, "At least once a week" : 2, "Once a day" : 3, "More than once a day" : 4}, "Sex" : {"Females" : 0, "Males" : 1}}
Eating_Habits.replace(cleanup, inplace=True)

#Dummy code the Age group variable.
AgeDummy = pd.get_dummies(Eating_Habits['Age group'], drop_first=True)
AgeDummy

EatingHabits2 = pd.concat([Eating_Habits, AgeDummy], axis=1)
