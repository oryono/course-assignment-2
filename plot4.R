epc <- read.table("epc.txt", header = TRUE, sep = ";")
epc$Date <- strptime(as.character(epc$Date), "%d/%m/%Y")
epc <- subset(epc, epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02")
epc$datetime <- as.POSIXct(paste(epc$Date, epc$Time))

par(mfrow=c(2,2))
# Plot 1
plot(epc$datetime, epc$Global_active_power, type = "l", xlab = "Days", ylab = "Global Active Power")

# Plot 2
plot(epc$datetime, epc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(epc$datetime, epc$Sub_metering_1, type='n', xlab = "Days", ylab = "Energy Sub Metering")
lines(epc$datetime, epc$Sub_metering_2, col='red')
lines(epc$datetime, epc$Sub_metering_1, col='grey')
lines(epc$datetime, epc$Sub_metering_3, col='blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("grey", "red", "blue"), lty=1, cex = 0.5)

# Plot 4
plot(epc$datetime, epc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")


# Save to PNG
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Plot 1
plot(epc$datetime, epc$Global_active_power, type = "l", xlab = "Days", ylab = "Global Active Power")

# Plot 2
plot(epc$datetime, epc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(epc$datetime, epc$Sub_metering_1, type='n', xlab = "Days", ylab = "Energy Sub Metering")
lines(epc$datetime, epc$Sub_metering_2, col='red')
lines(epc$datetime, epc$Sub_metering_1, col='grey')
lines(epc$datetime, epc$Sub_metering_3, col='blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("grey", "red", "blue"), lty=1, cex = 0.5)

# Plot 4
plot(epc$datetime, epc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()