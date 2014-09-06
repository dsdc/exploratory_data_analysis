plot3 <- function(){

importData <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

importData$Date <- as.Date(importData$Date, format="%d/%m/%Y")

dataDate <- importData$Date

importData <- subset(importData, importData$Date >= '2007/02/01' & importData$Date <= '2007/02/02')


datetime <- paste(importData$Date, importData$Time)

importData$dateTime <- as.POSIXct(datetime)

plot(importData$Sub_metering_1~importData$dateTime, type="l",
     ylab="Energey sub metering", xlab="", col = "black")
lines(importData$Sub_metering_2~importData$dateTime, type="l",
     ylab="Energey sub metering", xlab="", col = "red")
lines(importData$Sub_metering_3~importData$dateTime, type="l",
     ylab="Energey sub metering", xlab="", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty=c(1,1,1), 
lwd=c(2.5,2.5,2.5),col=c("black", "blue","red"))


dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
}