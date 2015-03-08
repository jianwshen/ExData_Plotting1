setwd("C:\\ExploratoryDataAnalysis") 
data <- read.table("./data/household_power_consumption.txt", header=T, sep=";")
subData <-subset(data, data$Global_active_power != "?")
plotData <- subset(subData, as.Date(subData$Date,"%d/%m/%Y") >= '2007-02-01' 
	& as.Date(subData$Date,"%d/%m/%Y") <= '2007-02-02')

par(mfrow=c(2,2))

x <- paste(plotData$Date, plotData$Time)
#
#Fig-1
#
z1 <- as.character(plotData$Global_active_power)
y1 <- as.numeric(z1)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y1, 
	type = "l", xlab="", ylab="Global Active Power(kilowatts)")
#
#Fig-2
#
z2 <- as.character(plotData$Voltage)
y2 <- as.numeric(z2)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y2, type = "l", 
 xlab="", ylab="Voltage")
#
#Fig-3
#

z31 <- as.character(plotData$Sub_metering_1)
z32 <- as.character(plotData$Sub_metering_2)
z33 <- as.character(plotData$Sub_metering_3)
y31 <- as.numeric(z31)
y32 <- as.numeric(z32)
y33 <- as.numeric(z33)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y31, type = "l", 
	ylim=c(0,40), col="black", xlab="", ylab="Energy sub metering")
par(new=T)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y32, type = "l", 
	ylim=c(0,40), col="red", xlab="", ylab="Energy sub metering")
par(new=T)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y33, type = "l", 
	ylim=c(0,40), col="blue", xlab="", ylab="Energy sub metering")
par(new=T)

legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
	c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#
#Fig-4
#
z4 <- as.character(plotData$Global_reactive_power)
y4 <- as.numeric(z4)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y4, 
	type = "l", xlab="", ylab="Global Reactive Power")

dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()
