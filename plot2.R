#load data, assumes household_power_consumption.txt is in working directory
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

#subset the data frame so that only data for the listed dates is shown
dat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")

#add DateTime as new column, convert to POSIX object
dat$DateTime <- paste(dat$Date, dat$Time, sep = " ")
dat$DateTime <- strptime(dat$DateTime, "%d/%m/%Y %H:%M:%S")

#create plot2.png
png("plot2.png", width = 480, height = 480)
plot(dat$DateTime, dat$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(dat$DateTime, dat$Global_active_power) 
dev.off()