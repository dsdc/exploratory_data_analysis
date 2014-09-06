plot2 <- function(){

importData <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

importData$Date <- as.Date(importData$Date, format="%d/%m/%Y")

dataDate <- importData$Date

importData <- subset(importData, importData$Date >= '2007/02/01' & 
importData$Date <= '2007/02/02')


datetime <- paste(importData$Date, importData$Time)

importData$dateTime <- as.POSIXct(datetime)

plot(importData$Global_active_power~importData$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
}