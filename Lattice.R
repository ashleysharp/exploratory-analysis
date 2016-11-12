library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data = airquality)

#convert month into factor
airquality <- transform(airquality, Month = factor(Month))
plot <- xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))
class(plot)
plot
