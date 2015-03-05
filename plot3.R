Data <- "household_power_consumption.txt"
power <- read.table(Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

globalActivePower <- as.numeric(power$Global_active_power)

subMetering1 <- as.numeric(power$Sub_metering_1)
subMetering2 <- as.numeric(power$Sub_metering_2)
subMetering3 <- as.numeric(power$Sub_metering_3)

png("plot3.png")
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", main = "", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()