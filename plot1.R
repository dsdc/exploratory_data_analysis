plot1 <- function(){

## load csv file into a variable
importData <- read.csv("household_power_consumption.txt", sep=";")

## define the data type of Date 
importData$Date <- as.Date(importData$Date, format="%d/%m/%Y")

dataDate <- importData$Date

## subset all data to only targeted date
importData <- subset(importData, dataDate >= '2007/02/01' &
dataDate <= '2007/02/02')

## use function to plot histogram
hist(as.numeric(as.character(importData$Global_active_power)), col="red", 
xlab="Global Active Power(kilowatts)", ylab="Frequency", 
main = "Global Active Power")

## save the result as png file
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
}