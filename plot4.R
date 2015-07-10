#Prepare the data; same across all plots
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?' )
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Time <- strptime(paste(data$Time, data$Date), format = '%H:%M:%S %Y-%m-%d')
two_days <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

#Create plot 4
with(two_days, {
    par(mfrow = c(2,2), mar = c(4,4,1,2))
    
    plot(Time, Global_active_power, type = 'l', 
         ylab="Global Active Power (kilowatts)", xlab = "",  cex.main = 0.9, cex.axis = 0.9, cex.lab = 0.9)
    
    plot(Time, Voltage, type = 'l', 
         ylab="Voltage", xlab = "datetime",  cex.main = 0.9, cex.axis = 0.9, cex.lab = 0.9)
    
    plot(Time, pmax(two_days$Sub_metering_1, two_days$Sub_metering_2, two_days$Sub_metering_3), type = 'n',
         ylab="Energy sub metering", xlab = "",  cex.main = 0.9, cex.axis = 0.9, cex.lab = 0.9)
    points(Time, Sub_metering_1, type = 'l')
    points(Time, Sub_metering_2, type = 'l', col = 'red')
    points(Time, Sub_metering_3, type = 'l', col = 'blue')
    legend("topright" , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), col = c('black', 'red', "blue"), lty = 1, 
           cex = 0.9, bty = 'n')
    
    plot(Time, Global_reactive_power, type = 'l', 
         xlab = "datetime",  cex.main = 0.9, cex.axis = 0.9, cex.lab = 0.9)
    
    dev.copy(png, file = 'plot4.png')
    dev.off()
})

