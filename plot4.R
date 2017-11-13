## Read the data from my own directory
project1_fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset the full data to only two days of data required here
project1_data<-subset(project1_fulldata, Date==("1/2/2007")|Date==("2/2/2007"))

## Format date, and combine date and time to DateTime
Date <- as.Date(project1_data$Date, format="%d/%m/%Y")
DateTime <- paste(Date, project1_data$Time)
DateTime <- as.POSIXct(DateTime)

## Generate and export the graph as plot4.png, and close the graphics device
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(2,2,2,0))
plot(project1_data$Global_active_power~DateTime, type="l", xlab="", ylab="Global Active Power")
plot(project1_data$Voltage~DateTime, type="l", xlab="Datetime", ylab="Voltage")
plot(project1_data$Sub_metering_1~DateTime, type="l", xlab="", ylab="Energy sub metering")
lines(project1_data$Sub_metering_2~DateTime, col='Red')
lines(project1_data$Sub_metering_3~DateTime, col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.75)
plot(project1_data$Global_reactive_power~DateTime, type="l", xlab="datetime", ylab="Global_rective_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
