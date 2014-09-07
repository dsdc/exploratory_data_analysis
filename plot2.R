plot2 <- function(){

## load the csv file into a variable
importData <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

## define the data type of Date 
importData$Date <- as.Date(importData$Date, format="%d/%m/%Y")

dataDate <- importData$Date

## subset all data to only targeted date
importData <- subset(importData, importData$Date >= '2007/02/01' & 
importData$Date <= '2007/02/02')

## combine the value of two columns into one column
datetime <- paste(importData$Date, importData$Time)

## use data conversion functiion to convert string to a useful data
importData$dateTime <- as.POSIXct(datetime)

## use function to plot histogram
plot(importData$Global_active_power~importData$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## save the result as png file	 
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
}