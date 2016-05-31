## Downloading the data and unzipping it
if(!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
  unzip("data.zip")
}

## Reading the data and keeping only certain dates
data <- read.table("household_power_consumption.txt", header = T,
                   sep=";", na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## PNG device
png(filename = "plot1.png")

## Drawing histogram
hist(data$Global_active_power, col="red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

## Closing the device
dev.off()