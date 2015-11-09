# This is the R script for project1 of the Course Exploratory Data Analysis on Coursera

# Load the data (the file should be under the current working directory)--------
electricData <- read.table("household_power_consumption.txt", header = T, sep = ";",
                           na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))

# Convert the column Date to the date class
electricData$Date <- as.Date(electricData$Date, "%d/%m/%Y")

# Subset the data of two days from 2007-02-01 to 2007-02-02
electricData2D <- subset(electricData, Date == "2007-02-01" | Date == "2007-02-02")

# Combine the date and time, and store to the column Time as POSIXlt class
electricData2D$Time <- strptime(paste(electricData2D$Date, electricData2D$Time), 
                                format = "%Y-%m-%d %H:%M:%S")

# plot1 ------------------------------------------------------------------------
png(file = "plot1.png")
hist(electricData2D$Global_active_power, col = "red", main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()

# plot2 ------------------------------------------------------------------------
png(file = "plot2.png")
with(electricData2D, plot(Time, Global_active_power, type = "l", xlab = "",
                          ylab = "Global Active Power (kilowatts)"))
dev.off()

# plot3 ------------------------------------------------------------------------
png(file = "plot3.png")
with(electricData2D,{
    plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "",
         ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

# plot4 ------------------------------------------------------------------------
png(file = "plot4.png")
par(mfcol = c(2,2))

# plot the graph (1, 1)
with(electricData2D, plot(Time, Global_active_power, type = "l", xlab = "",
                          ylab = "Global Active Power"))

# plot the graph(2, 1)     
with(electricData2D,{
    plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "",
         ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# plot the graph(1, 2)
with(electricData2D, plot(Time, Voltage, type = "l", xlab = "datatime", ylab = "Voltage"))

# plot the graph(2, 2)
with(electricData2D, plot(Time, Global_reactive_power, type = "l", xlab = "datatime"))

dev.off()