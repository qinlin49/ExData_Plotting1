#read in the original data

rawdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")


#Subset the data to the two days we are interested in
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
datasub <- subset(rawdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#plot graph 1
GlobalActivePower <- as.numeric(datasub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
