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
png(filename = "plot4.png")

## Saving defaults of par and setting 2 row sand columns
par_df <- par
par(mfrow = c(2,2))

## First plot...
plot(data$Date, data$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab ="")

## ...second
plot(data$Date, data$Voltage, type = "l",
     ylab = "Voltage", xlab ="datetime")

## ...third
plot(data$Date, data$Sub_metering_1, type = "n", ylab = "Energy sub metering",
     xlab = "")

lines(data$Date, data$Sub_metering_1)
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2",
                     "Sub_metering_3"), lty = c(1,1,1),
       col=c("black", "red", "blue"))

## ...and fourth
plot(data$Date, data$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power", xlab ="datetime")

## Restoring defaults.
par <- par_df

## Dev off
dev.off()