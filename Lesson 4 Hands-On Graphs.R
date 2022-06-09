library(ggplot2)

#Part1

hist(L3P1$`Power Boats (in 1000's)`)

#Part2

ggplot(L3P2, aes(Cars))+ 
  geom_bar() +
  ggtitle("Frequency of Car Brand") +
  xlab("Brand") +
  ylab("Frequency")

#Part3

ggplot(data=L3Part3) +
  geom_bar(mapping = aes(x = Car, fill=Location)) + 
  ggtitle("Brand Frequency by Region") +
  xlab("Brand") +
  ylab("Frequency") 

#Part4

ggplot(crocodiles, aes(x=BodyLength, y=HeadLength)) + geom_point()
ggplot(crocodiles, aes(x=BodyLength, y=HeadLength)) +
  geom_point(size=1, shape=23)
labs(title="Estuarine Crocodile's average measurements", x="Body Length", y = "Head Length")

#Part5

names(L6handson)[4] <- 'Heart_Attacks'
L6handson$Date <- as.character(paste(L6handson$Month, L6handson$Day, sep = " "))
L6handson$Full_Date <- as.character(paste(L6handson$Date, L6handson$Year, sep = " "))

str(L6handson)
L6handson$Full_Date <- as.numeric(L6handson$Full_Date)

ggplot(L6handson, aes(as.Date(Date, "%b-%j-%y"), Heart_Attacks)) +
  geom_line() + 
  xlab("Date of Heart Attack") + 
  ylab("Heart Attack Frequency") + 
  ggtitle("Frequency of Heart Attacks over time")



