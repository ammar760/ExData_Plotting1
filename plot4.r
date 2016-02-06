## Load the Data.
ElectricData <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                           sep = ";", header = T, na.strings = "?")
## Converting Date in date format
ElectricData$Date <- dmy(ElectricData$Date)
##Filter out the data from 1st Feb 2007 to 2nd Feb 2007
FebDataSet <- filter(ElectricData, Date >= "2007-02-01" & Date < "2007-02-03")
## Concatinate the date time
datetime <- strptime(paste(FebDataSet$Date, FebDataSet$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(FebDataSet$Global_active_power)
Voltage <- as.numeric(FebDataSet$Voltage)
GlobalReactionPower <- as.numeric(FebDataSet$Global_reactive_power)
Sub_meter1 <- as.numeric(FebDataSet$Sub_metering_1)
Sub_meter2 <- as.numeric(FebDataSet$Sub_metering_2)
Sub_meter3 <- as.numeric(FebDataSet$Sub_metering_3)
## Open PNG File
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
plot(datetime, Sub_meter1, xlab="", ylab="Energy Sub Metering", type="l", col="black")
lines(datetime, Sub_meter2, type="l", col = "red")
lines(datetime, Sub_meter3, type="l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, GlobalReactionPower, type="l", xlab = "datetime", ylab = "Global_reaction_power")
dev.off()