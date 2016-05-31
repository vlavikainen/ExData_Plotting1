## Downloading the data and unzipping it
if(!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
  unzip("data.zip")
}

## Reading data and keeping only certain dates
data <- read.table("household_power_consumption.txt", header = T,
                   sep=";", na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Converting to date
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")

## Dev on
png(filename = "plot2.png")

## Plotting
plot(data$Date, data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab ="")

## Dev off
dev.off()