library(swirl)
install_from_swirl("Exploratory Data Analysis")
swirl()

boxplot()
# The "whiskers" of the box (the vertical lines extending above and below the box) relate to the
# range parameter of boxplot, which we let default to the value 1.5 used by R. The height of the
# box is the interquartile range, the difference between the 75th and 25th quantiles. In this
# case that difference is 2.8. The whiskers are drawn to be a length of range*2.8 or 1.5*2.8.
# This shows us roughly how many, if any, data points are outliers, that is, beyond this range
# of values.

abline(h = 12, lwd = 2)
# The histogram gives us a little more detailed information about our data, specifically the
# distribution of the pollution counts, or how many counties fall into each bucket of
# measurements.

rug(ppm)

barplot(reg, col = "wheat", main = "Number of Counties in Each Region")


# We use the R formula y ~ x to show that y (in this case pm25) depends on x (region). Since
# both come from the same data frame (pollution) we can specify a data argument set equal to
# pollution. By doing this, we don't have to type pollution$pm25 (or ppm) and pollution$region.
# We can just specify the formula pm25~region.

boxplot(pm25~region, data = pollution, col = "red")

# Two for the price of one! Similarly we can plot multiple histograms in one plot, though to do
# this we have to use more than one R command. First we have to set up the plot window with the
# R command par which specifies how we want to lay out the plots, say one above the other. We
# also use par to specify margins, a 4-long vector which indicates the number of lines for the
# bottom, left, top and right.

par(mfrow=c(2,1),mar=c(4,4,2,1))
hist(subset(pollution, region == "west")$pm25, col = "green")

# We'll call plot from inside the R command with() which evaluates "an R
# expression in an environment constructed from data"

with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2)


#Graphics devices

?Devices
#Now run the command 
dev.cur()
#This will show you the current plotting device, the screen.

pdf(file="myplot.pdf")
with(faithful, plot(eruptions, waiting))
title("Old Faithful Geyser data")

#Finally, when plotting to a file device, you have to close the device with the command 
dev.off()

# Although it is possible to open multiple graphics devices (screen, file, or both), when
# viewing multiple plots at once, plotting can only occur on one graphics device at a time.

##Plotting systems
#base
with(cars, plot(speed, dist))
text(mean(cars$speed), max(cars$dist), "SWIRL rules!")

#lattice
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

# Now for the last plotting system, ggplot2, which is a hybrid of the base and lattice systems.
# It automatically deals with spacing, text, titles (as Lattice does) but also allows you to
# annotate by "adding" to a plot (as Base does), so it's the best of both worlds.

qplot(displ, hwy, data = mpg)

##Base plotting system
# The core plotting and graphics engine in R is encapsulated in two packages. The first is the
# graphics package which contains plotting functions for the "base" system. The functions in
# this package include plot, hist, boxplot, barplot, etc. The second package is grDevices which
# contains all the code implementing the various graphics devices, including X11, PDF,
# PostScript, PNG, etc.

# We see that the data covers 5 months, May through September. We'll want a boxplot of ozone as
# a function of the month in which the measurements were taken so we'll use the R formula
# Ozone~Month as the first argument of boxplot. Our second argument will be airquality, the
# dataset from which the variables of the first argument are taken.  Try this now.

boxplot(Ozone~Month, data=airquality)
boxplot(Ozone~Month, data=airquality, xlab = "Month", ylab = "Ozone (ppb)", col.axis = "blue", col.lab = "red")

# The 
par()
#function is used to specify global graphics parameters that affect all plots in an R
# session. (Use 
dev.off() #or 
plot.new() 
#to reset to the defaults.) These parameters can be
# overridden when specified as arguments to specific plotting functions. These include las (the
# orientation of the axis labels on the plot), bg (background color), mar (margin size), oma
# (outer margin size), mfrow and mfcol (number of plots per row, column).
