Data <- "household_power_consumption.txt"
power <- read.table(Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

globalActivePower <- as.numeric(power$Global_active_power)

png("plot1.png")
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()