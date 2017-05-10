setwd("~/")

# 1 download and unzip the zip file from the course website
if(!file.exists("./week1data")) dir.create("./week1data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./week1data/projectData.zip")
listzip <- unzip("./week1data/projectData.zip", exdir = "./week1data")

### marked the download date
### > dateDownloaded <- date()
### > dateDownloaded

# 2 load the selected data into R, and rename the column names
files <- file("./week1data/household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(files), value = TRUE), sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings="?")

# 3 create the plot1 figure
## create a figures file under the week1data file 
if(!file.exists('./week1data/figures')) dir.create('./week1data/figures')

## open device, plot figure, and close device
png(filename = './week1data/figures/plot1.png', width=480, height=480)
with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
dev.off()

