setwd("C:\\ExploratoryDataAnalysis") 
data <- read.table("./data/household_power_consumption.txt", header=T, sep=";")
subData <-subset(data, data$Global_active_power != "?")
plotData <- subset(subData, as.Date(subData$Date,"%d/%m/%Y") >= '2007-02-01' 
	& as.Date(subData$Date,"%d/%m/%Y") <= '2007-02-02')

x <- paste(plotData$Date, plotData$Time)
z <- as.character(plotData$Global_active_power)
y <- as.numeric(z)
plot(strptime(x, "%d/%m/%Y %H:%M:%S"), y, type = "l", 
	xlab="", ylab="Global Active Power(kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480, units="px")
dev.off()
