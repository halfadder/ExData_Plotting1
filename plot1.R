#load data, assumes household_power_consumption.txt is in working directory
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

dat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")

#convert dates and times using as.Date() and strptime()
#not necessary for this plot

#create plot1.png
png("plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()