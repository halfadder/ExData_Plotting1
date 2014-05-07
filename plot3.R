#load data, assumes household_power_consumption.txt is in working directory
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

#subset the data frame so that only data for the listed dates is shown
dat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")

#add DateTime as new column, convert to POSIX object
dat$DateTime <- paste(dat$Date, dat$Time, sep = " ")
dat$DateTime <- strptime(dat$DateTime, "%d/%m/%Y %H:%M:%S")

#create plot3.png
png("plot3.png", width = 480, height = 480)
plot(dat$DateTime, dat$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(dat$DateTime, dat$Sub_metering_1, col = "black")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"))
dev.off()