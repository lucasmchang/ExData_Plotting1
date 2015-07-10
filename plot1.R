#Prepare the data; same across all plots
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?' )
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Time <- strptime(paste(data$Time, data$Date), format = '%H:%M:%S %Y-%m-%d')
two_days <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

#Create plot 1
with(two_days, {
    par("mar" = c(6,6,4,2))
    hist(Global_active_power, col = 'red', xlab="Global Active Power (kilowatts)", main = "Global Active Power", 
         cex.main = 0.9, cex.axis = 0.9, cex.lab = 0.9)
    dev.copy(png, file = 'plot1.png')
    dev.off()
})

