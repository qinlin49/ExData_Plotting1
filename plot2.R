## Read the data from my own directory
project1_fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset the full data to only two days of data required here
project1_data<-subset(project1_fulldata, Date==("1/2/2007")|Date==("2/2/2007"))

## Format date, and combine date and time to DateTime
Date <- as.Date(project1_data$Date, format="%d/%m/%Y")
DateTime <- paste(Date, project1_data$Time)
DateTime <- as.POSIXct(DateTime)

## Generate and export the graph as plot2.png, close the graphics device
plot(project1_data$Global_active_power~DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
