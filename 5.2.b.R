library(rcompanion)
library(tidyverse)

colnames(Seattle_ParksnRec)

names(Seattle_ParksnRec)[names(Seattle_ParksnRec) == "# of trips Fall"] <- "Nu_of_trips_Fall"
names(Seattle_ParksnRec)[names(Seattle_ParksnRec) == "# of participants Fall"] <- "Nu_of_participants_Fall"
names(Seattle_ParksnRec)[names(Seattle_ParksnRec) == "# of trips per Year"] <- "Nu_of_trips_per_Year"
names(Seattle_ParksnRec)[names(Seattle_ParksnRec) == "# participants per Year"] <- "Nu_participants_per_Year"
names(Seattle_ParksnRec)[names(Seattle_ParksnRec) == "increase/decrease of prior year"] <- "increase_and_decrease_of_prior_year"
names(Seattle_ParksnRec)[names(Seattle_ParksnRec) == "Average # people per trip"] <- "Average_#_people_per_trip"


plotNormalHistogram(Seattle_ParksnRec$Nu_of_trips_Fall)
Seattle_ParksnRec$Nu_of_trips_FallSQ <- Seattle_ParksnRec$Nu_of_trips_Fall ^ 3
plotNormalHistogram(Seattle_ParksnRec$Nu_of_trips_FallSQ)

plotNormalHistogram(Seattle_ParksnRec$Nu_of_participants_Fall)

plotNormalHistogram(Seattle_ParksnRec$Nu_of_trips_per_Year)
Seattle_ParksnRec$Nu_of_trips_per_YearSQ <- Seattle_ParksnRec$Nu_of_trips_per_Year ^ 2
plotNormalHistogram(Seattle_ParksnRec$Nu_of_trips_per_YearSQ)

plotNormalHistogram(Seattle_ParksnRec$Nu_participants_per_Year)
Seattle_ParksnRec$Nu_of_trips_per_YearSQ <- Seattle_ParksnRec$Nu_participants_per_Year ^ 2
plotNormalHistogram(Seattle_ParksnRec$Nu_participants_per_YearSQ)

plotNormalHistogram(Seattle_ParksnRec$increase_and_decrease_of_prior_year)

plotNormalHistogram(Seattle_ParksnRec$Average_#_people_per_trip)
Seattle_ParksnRec$Nu_of_trips_per_YearSQ <- Seattle_ParksnRec$Average_#_people_per_trip ^ 2
plotNormalHistogram(Seattle_ParksnRec$Average_#_people_per_tripSQ)
