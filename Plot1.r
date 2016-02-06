## Load the Data.
ElectricData <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                           sep = ";", header = T, na.strings = "?")
## Converting Date in date format
ElectricData$Date <- dmy(ElectricData$Date)
##Filter out the data from 1st Feb 2007 to 2nd Feb 2007dmy
FebDataSet <- filter(ElectricData, Date >= "2007-02-01" & Date < "2007-02-03")
## Open PNG File
png("Plot1.png")
## Plotting Histogram on Global Active Power
hist(FebDataSet$Global_active_power, col = "red", main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts")
dev.off()