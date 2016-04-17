file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=F, na.strings="?")
twoday <- file[file$Date %in% c("1/2/2007","2/2/2007"),]
time <- strptime(paste(twoday$Date, twoday$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot4
#Global Active Power
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(6,6,2,1))
power <- as.numeric(twoday$Global_active_power)
plot(time, power, type="l", xlab=" ", ylab="Global Active Power")
#Voltage
vol1 <- twoday$Voltage
plot(time, vol1, type="l", xlab="datetime", ylab="Voltage")
#Energy sub metering
Sub1 <- as.numeric(twoday$Sub_metering_1)
Sub2 <- as.numeric(twoday$Sub_metering_2)
Sub3 <- as.numeric(twoday$Sub_metering_3)
plot(time, Sub1,type="l", xlab=" ", ylab="Energy sub metering")
lines(time, Sub2, col="red")
lines(time, Sub3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))
#Global reactive power
reactive <- as.numeric(twoday$Global_reactive_power)
plot(time, reactive, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
