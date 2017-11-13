## Read the data from my own directory
project1_fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset the full data to only two days of data required here
project1_data<-subset(project1_fulldata, Date==("1/2/2007")|Date==("2/2/2007"))

## Generate the histogram
hist(project1_data$Global_active_power, xlab="Global Active Power(killowatts)", main="Global Active Power", col="red")

## export the above graph as plot1.png and close the graphics device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
