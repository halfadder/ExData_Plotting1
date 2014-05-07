#load data, assumes household_power_consumption.txt is in working directory
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

#subset the data frame so that only data for the listed dates is shown
dat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")

#add DateTime as new column, convert to POSIX object
dat$DateTime <- paste(dat$Date, dat$Time, sep = " ")
dat$DateTime <- strptime(dat$DateTime, "%d/%m/%Y %H:%M:%S")

#create plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) #2 x 2

#plot 1
plot(dat$DateTime, dat$Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
lines(dat$DateTime, dat$Global_active_power)

#plot 2
plot(dat$DateTime, dat$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(dat$DateTime, dat$Voltage)

#plot 3
plot(dat$DateTime, dat$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(dat$DateTime, dat$Sub_metering_1, col = "black")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       bty = "n")

#plot 4
plot(dat$DateTime, dat$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(dat$DateTime, dat$Global_reactive_power)

dev.off()