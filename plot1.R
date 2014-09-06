plot1 <- function(){

importData <- read.csv("household_power_consumption.txt", sep=";")

importData$Date <- as.Date(importData$Date, format="%d/%m/%Y")

dataDate <- importData$Date

importData <- subset(importData, dataDate >= '2007/02/01' &
dataDate <= '2007/02/02')

hist(as.numeric(as.character(importData$Global_active_power)), col="red", 
xlab="Global Active Power(kilowatts)", ylab="Frequency", 
main = "Global Active Power")

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
}