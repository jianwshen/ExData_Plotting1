setwd("C:\\ExploratoryDataAnalysis") 
data <- read.table("./data/household_power_consumption.txt", header=T, sep=";")
subData <- subset(data, as.Date(data$Date,"%d/%m/%Y") >= '2007-02-01' 
	& as.Date(data$Date,"%d/%m/%Y") <= '2007-02-02')

plotData <- subset(subData, subData$Global_active_power != "?")

x <- as.character(plotData$Global_active_power)
z <- as.numeric(x)

hist(z, col="red", main="Global Active Power",
	xlab="Global Active Power(kilowatts)", ylab="Frequency", xaxt = "n", yaxt = "n",
	breaks=20)
axis(side = 1)
axis(side = 2)

dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()
