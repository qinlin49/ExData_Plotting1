## Read the data from my own directory
project1_fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset the full data to only two days of data required here
project1_data<-subset(project1_fulldata, Date==("1/2/2007")|Date==("2/2/2007"))

## Format date, and combine date and time to DateTime
Date <- as.Date(project1_data$Date, format="%d/%m/%Y")
DateTime <- paste(Date, project1_data$Time)
DateTime <- as.POSIXct(DateTime)

## Generate and export the graph as plot3.png, and close the graphics device
y1<-(project1_data$Sub_metering_1)
y2<-(project1_data$Sub_metering_2)
y3<-(project1_data$Sub_metering_3)
plot(y1~DateTime, type="l", xlab="", ylab="Energy sub metering")
lines(y2~DateTime, col='Red')
lines(y3~DateTime, col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
