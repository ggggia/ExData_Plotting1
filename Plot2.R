file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=F, na.strings="?")
twoday <- file[file$Date %in% c("1/2/2007","2/2/2007"),]
time <- strptime(paste(twoday$Date, twoday$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot2
power <- as.numeric(twoday$Global_active_power)
png("plot2.png", width=480, height=480)
plot(time, power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()
