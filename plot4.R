plot4 <- function(){

## load the csv file into a variable
importData <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

## define the data type of Date 
importData$Date <- as.Date(importData$Date, format="%d/%m/%Y")

dataDate <- importData$Date

## subset all data to only targeted date
importData <- subset(importData, importData$Date >= '2007/02/01' & importData$Date <= '2007/02/02')

## combine the value of two columns into one column
datetime <- paste(importData$Date, importData$Time)

## use data conversion functiion to convert string to a useful data
importData$dateTime <- as.POSIXct(datetime)

## define the displaying format of the graph
par(mfrow=c(2,2), mar=c(4,3,2,1), oma=c(0,0,2,0))

## use function to plot histogram
with(importData, {
    plot(importData$Global_active_power~importData$dateTime, type="l",
     ylab="Global Active Power", xlab="", col = "black")

    plot(importData$Voltage~importData$dateTime, type="l", 
         ylab="Voltage", xlab="datetime")

    plot(importData$Sub_metering_1~importData$dateTime, type="l", 
         ylab="Energy sub metering", xlab="")
    
    lines(importData$Sub_metering_2~importData$dateTime, type="l",
     ylab="Energey sub metering", xlab="", col = "red")
    lines(importData$Sub_metering_3~importData$dateTime, type="l",
     ylab="Energey sub metering", xlab="", col = "blue")
    
    
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),

    lty=c(1,1,1), # gives the legend appropriate symbols (lines)

    lwd=c(2.5,2.5,2.5),col=c("black", "blue","red")) # gives the legend lines the correct color and width


    plot(importData$Global_reactive_power~importData$dateTime, type="l", 
         ylab="Global_rective_power",xlab="datetime")
})

## save the result as png file	 
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
}



