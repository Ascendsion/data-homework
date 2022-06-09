#What is the average age of those who use each web browser type?
airbnb2 <- aggregate(age~first_browser, airbnb_test_users, mean)

#What is the total signup_flow for each device?
airbnb3 <- aggregate(signup_flow~first_device_type, airbnb_test_users, sum)

#They need the country information from this dataset included in the airbnb_test_users file.
airbnb3 <- merge(airbnb_test_users, airbnb_sample_submission, by=c("id"))

#Add additional users to the test file from this dataset.
library(readxl)
names(airbnb3)[16] <- 'country_destination'

airbnb4 <- rbind(airbnb3, airbnb_users)
