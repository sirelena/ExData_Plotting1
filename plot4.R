# PLOT 4

library(dplyr)
dataRead <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# We will only be using data from the dates 2007-02-01 and 2007-02-02.
data_sub <- subset(dataRead, as.character(Date)== "1/2/2007"|as.character(Date)== "2/2/2007")
# Date format "1/1/2007" "00:00:00" to data object
data_sub$Date_Hour <- paste(data_sub$Date, data_sub$Time)
data_sub$Date_Hour <- strptime(data_sub$Date_Hour, format=  "%d/%m/%Y %H:%M:%S")
# Order data
plotdata <- select(data_sub, Date_Hour, 3:9)


## Open PNG device; create 'plot1.png' in my working directory
png(file = "plot4.png")
par(mfcol= c(2,2))
plot(plotdata$Date_Hour, plotdata$Global_active_power, type="l", xlab="", ylab= "Global Active Power (kilowatts)")
plot(plotdata$Date_Hour, plotdata[,6], type="l",xlab="", ylab= "Energy sub metering")
lines(plotdata$Date_Hour, plotdata[,7], col="red")
lines(plotdata$Date_Hour, plotdata[,8], col="blue")
legend("topright",legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","blue", "red"),pch= "_")
plot(plotdata$Date_Hour, plotdata$Voltage, type="l", xlab="datetime", ylab= "Voltage")
plot(plotdata$Date_Hour, plotdata$Global_reactive_power, type="l", xlab="datetime", ylab= "Global_reactive_power")


## Close the PNG file device
dev.off()








