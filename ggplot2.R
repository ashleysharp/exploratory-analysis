library(ggplot2)
str(mpg)
head(mpg)

qplot(displ, hwy, data = mpg, color = drv)
?qplot

qplot(displ, hwy, data = mpg, geom = c("smooth", "point"))

qplot(hwy, data = mpg, fill = drv)

f <- qplot(displ, hwy, data = mpg, facets = .~drv)
g <- qplot(hwy, data = mpg, facets = drv~., binwidth = 2)

summary(f)
summary(g)
f
g


#Axis limits
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100

plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()
g + geom_line() + ylim(-3,3) #subsets data and ignores outlier
g + geom_line() + coord_cartesian(ylim = c(-3,3))


####Swirl####

library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

?panel.lmline
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

?trellis.par.set

library(datasets)
data(airquality)
qplot(Wind, Ozone, data = airquality, geom = "smooth")
qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)

qplot(votes, rating, data = movies)

qplot(votes, rating, data = movies, smooth = "loess")
qplot(votes, rating, data = movies) + geom_smooth()
qplot(votes, rating, data = movies, panel = panel.loess)
qplot(votes, rating, data = movies) + stats_smooth("loess")


#######Swirl########

#ggplot2 plots are composed of aesthetics (attributes such as size, shape, color) 
#and geoms (points, lines, and bars), the geometric objects you see on the plot.
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, color = drv, geom = c("point", "smooth"))

#specifying the y parameter only, without an x argument, plots the values
# of the y argument in the order in which they occur in the data.
qplot(y = hwy, data = mpg, color = drv)

qplot(drv, hwy, data = mpg, geom = "boxplot")

#Now to impress you, call qplot with 5 arguments.
# The first 4 are just as you used previously, (drv, hwy, data set equal to mpg, and
# geom set equal to the string "boxplot"). Now add a fifth argument, color, equal to
# manufacturer.

qplot(drv, hwy, data = mpg, geom = "boxplot", color = manufacturer)


#####ggplot()

g <- ggplot(mpg, aes(displ, hwy))
summary(g)
g+geom_point()
g+geom_point() + geom_smooth(method = "lm")
g + geom_point() + geom_smooth(method = "lm") + facet_grid(. ~ drv)

#Modifying aesthetics
g + geom_point(color = "pink", size = 4, alpha = 1/2)
#Notice that all the arguments are constants

g + geom_point(size = 4, alpha = 1/2, aes(color = drv))
#color is now data dependent so you need to use the function aes()

g + geom_point(aes(color = drv)) + labs(title = "Swirl Rules!") + labs(x = "Displacement", y = "Hwy Mileage")

g + geom_point(aes(color = drv), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)

g + geom_point(aes(color = drv)) + theme_bw(base_family = "Times")

g + geom_line() + coord_cartesian(ylim = c(-3,3))