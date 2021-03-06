#Prepare the data; same across all plots
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?' )
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Time <- strptime(paste(data$Time, data$Date), format = '%H:%M:%S %Y-%m-%d')
two_days <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

#Create plot 2
with(two_days, {
    png(file = 'plot2.png')
    par(mfrow = c(1,1))
    plot(Time, Global_active_power, type = 'l', 
         ylab="Global Active Power (kilowatts)", xlab = "")
    dev.off()
})



