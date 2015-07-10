#Prepare the data; same across all plots
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?' )
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Time <- strptime(paste(data$Time, data$Date), format = '%H:%M:%S %Y-%m-%d')
two_days <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

#Create plot 3
with(two_days, {
    plot(Time, pmax(two_days$Sub_metering_1, two_days$Sub_metering_2, two_days$Sub_metering_3), type = 'n',
         ylab="Energy sub metering", xlab = "",  cex.main = 0.9, cex.axis = 0.9, cex.lab = 0.9)
    points(Time, Sub_metering_1, type = 'l')
    points(Time, Sub_metering_2, type = 'l', col = 'red')
    points(Time, Sub_metering_3, type = 'l', col = 'blue')
    legend("topright" , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), col = c('black', 'red', "blue"), lty = 1, cex = 0.9)
    dev.copy(png, file = 'plot3.png')
    dev.off()
})


