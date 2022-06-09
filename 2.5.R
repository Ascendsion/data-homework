rr = data.frame(rivers)

head(rr)

r.histo <- ggplot(rr, aes(x = rivers))
r.histo + geom_histogram(binwidth =30) + ggtitle("Histogram of Rivers") + xlab("Length (in miles)")

r.boxp <- ggplot(rr, aes(x=" ", y = rivers))
r.boxp + geom_boxplot() + xlab(" ")

ggplot(rr, aes(sample = rivers)) + geom_qq()

summary(rr$rivers)

