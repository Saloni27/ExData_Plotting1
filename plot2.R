Data <- "household_power_consumption.txt"
power <- read.table(Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(power$Global_active_power)

png("plot2.png")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()