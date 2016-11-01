#Swirl lesson 1 Principles of analytic graphs
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