file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=F, na.strings="?")
twoday <- file[file$Date %in% c("1/2/2007","2/2/2007"),]
time <- strptime(paste(twoday$Date, twoday$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot3
Sub1 <- as.numeric(twoday$Sub_metering_1)
Sub2 <- as.numeric(twoday$Sub_metering_2)
Sub3 <- as.numeric(twoday$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(time, Sub1,type="l", xlab=" ", ylab="Energy sub metering")
lines(time, Sub2, col="red")
lines(time, Sub3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))
dev.off()
