# 1 load the selected data into R, and rename the column names
files <- file("./week1data/household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(files), value = TRUE), sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings="?")

# 2 convert the date and time data into specific format
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# 3 create the plot4 figure
## create a figures file under the week1data file 
if(!file.exists('./week1data/figures')) dir.create('./week1data/figures')

## open device, plot figure, and close device
png(filename = './week1data/figures/plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(data$DateTime, data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(data$DateTime, data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()

