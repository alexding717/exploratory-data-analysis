# The codes that I found is useful in the material of week1

# multiple historgrams
par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green") # use subset function
hist(subset(pollution, region == "west")$pm25, col = "green")

# scatterplot using color
with(pollution, plot(lattitude, pm25, color = region))
abline(h = 12, lwd = 2, lty = 2 )

## simple base graphics
# box plot
library(datasets)
airquality <- transform(airquality, Months = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = 'Ozone')
# specify the pars in the plotting functions
with(airquality, plot(Wind, Ozone, pch = "1")) # you can specify two types of point
# characters, one type is number corresponding to a symbole table, 2nd is any char you specify

## Mutiple Base Plots
par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
    plot(Temp, Ozone, main = "Ozone and Temperature")
    mtext("Ozone and Weather in New York City", outer = T)
})

# if you want to have a look at all the sympols for point
example(points)

# plot demo
y <- rnorm(100)
x <- rnorm(100)
plot(x, y, pch = 20)
title("Scatterplot")
text(-2, -2, "Label")
legend("topleft", legend = "Data", pch = 20)
fit <- lm(y ~ x)
abline(fit, lwd = 2, col = "blue")

# using points function to specify different group data
par(mfrow = c(1,1))
x <- rnorm(100)
y <- x +rnorm(100)
g <- gl(2, 50, labels = c("male", "female"))
plot(x, y, type = "n")
points(x[g == "male"], y[g == "male"], col = "green")
points(x[g == "female"], y[g == "female"], col = "blue", pch = 19)
