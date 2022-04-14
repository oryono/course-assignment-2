epc <- read.table("epc.txt", header = TRUE, sep = ";")
epc$Date <- strptime(as.character(epc$Date), "%d/%m/%Y")
epc <- subset(epc, epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02")
epc$datetime <- as.POSIXct(paste(epc$Date, epc$Time))

par(mfrow=c(1, 1))
plot(epc$datetime, epc$Sub_metering_1, type='n', xlab = "Days", ylab = "Energy Sub Metering")
lines(epc$datetime, epc$Sub_metering_2, col='red')
lines(epc$datetime, epc$Sub_metering_1, col='grey')
lines(epc$datetime, epc$Sub_metering_3, col='blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("grey", "red", "blue"), lty=1, cex = 0.7)


# Save to PNG
png("plot3.png", width = 480, height = 480)
par(mfrow=c(1, 1))
plot(epc$datetime, epc$Sub_metering_1, type='n', xlab = "Days", ylab = "Energy Sub Metering")
lines(epc$datetime, epc$Sub_metering_2, col='red')
lines(epc$datetime, epc$Sub_metering_1, col='grey')
lines(epc$datetime, epc$Sub_metering_3, col='blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("grey", "red", "blue"), lty=1, cex = 0.7)
dev.off()