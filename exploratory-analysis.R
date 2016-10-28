pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)
summary(pollution$pm25)

# One dimensional summaries
boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)
abline(v = 12, lwd = 3)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

barplot(table(pollution$region), col = "wheat", main = "Number of counties in each region")

# Two dimensional summaries
boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow = c(2,1), mar = c(3,4,4,4))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")
?plot

with(pollution, plot(latitude, pm25, col = region))

par(mfrow = c(1,2), mar = c(5,4,2,1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))

#Plotting

#Base plot
library(datasets)
data(cars)
with(cars, plot(dist, speed))

#Lattice plot
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

#ggplot2
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)
?par

colours()
example(points)

x <- rnorm(100)
y <- rpois(100, 2)
plot(x, y, pch = 20)

quartz()
