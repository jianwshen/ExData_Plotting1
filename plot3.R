setwd("C:\\ExploratoryDataAnalysis") 
data <- read.table("./data/household_power_consumption.txt", header=T, sep=";")
subData <-subset(data, data$Global_active_power != "?")
plotData <- subset(subData, as.Date(subData$Date,"%d/%m/%Y") >= '2007-02-01' 
	& as.Date(subData$Date,"%d/%m/%Y") <= '2007-02-02')

x <- paste(plotData$Date, plotData$Time)
z1 <- as.character(plotData$Sub_metering_1)
z2 <- as.character(plotData$Sub_metering_2)
z3 <- as.character(plotData$Sub_metering_3)

y1 <- as.numeric(z1)
y2 <- as.numeric(z2)
y3 <- as.numeric(z3)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y1, type = "l", 
	ylim=c(0,40), col="black", xlab="", ylab="Energy sub metering")
par(new=T)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y2, type = "l", 
	ylim=c(0,40), col="red", xlab="", ylab="Energy sub metering")
par(new=T)

plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y3, type = "l", 
	ylim=c(0,40), col="blue", xlab="", ylab="Energy sub metering")
par(new=T)

legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
	c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480, units="px")
dev.off()
