Data <- "household_power_consumption.txt"
power <- read.table(Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(power$Global_active_power)
globalReactivePower <- as.numeric(power$Global_reactive_power)

voltage <- as.numeric(power$Voltage)

subMetering1 <- as.numeric(power$Sub_metering_1)
subMetering2 <- as.numeric(power$Sub_metering_2)
subMetering3 <- as.numeric(power$Sub_metering_3)

png("plot4.png")
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l",ylab="Global Active Power", main="", xlab="")

plot(datetime, voltage, type="l",ylab="Voltage", main="", xlab="datetime")

plot(datetime, subMetering1, type="l",ylab="Energy sub metering", main="", xlab="")

lines(datetime, subMetering2, col="red")
lines(datetime, subMetering3, col="blue")

legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(datetime, globalReactivePower, type="l",ylab="Global_reactive_power", main="", xlab="datetime")
dev.off()