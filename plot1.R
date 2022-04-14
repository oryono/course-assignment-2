epc <- read.table("epc.txt", header = TRUE, sep = ";")
epc$Date <- strptime(as.character(epc$Date), "%d/%m/%Y")
epc <- subset(epc, epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02")
epc$datetime <- as.POSIXct(paste(epc$Date, epc$Time))

par(mfrow=c(1, 1))
hist(as.numeric(epc$Global_active_power), xlab = "Global Active Power", col = "red", main = "Global Active Power")


# Save to PNG
png("plot1.png", width = 480, height = 480)
par(mfrow=c(1, 1))
hist(as.numeric(epc$Global_active_power), xlab = "Global Active Power", col = "red", main = "Global Active Power")
dev.off()