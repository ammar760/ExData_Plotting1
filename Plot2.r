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
## Open PNG File
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()