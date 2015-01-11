#Read input data and clean it (subset to just the required dates, date/time conversions, numeric conversion)
setwd("C:/Users/arunaba/DataScienceCoursera/ExploratoryDataAnalysis")
library(data.table)
data<-fread("household_power_consumption.txt", na.strings=c("?", ""))
newdata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007"]
newdata$DateTime<-as.POSIXct(paste(newdata$Date, newdata$Time), format="%d/%m/%Y %H:%M:%S")
newdata$Global_active_power=as.numeric(newdata$Global_active_power)
newdata$Global_reactive_power=as.numeric(newdata$Global_reactive_power)
newdata$Voltage=as.numeric(newdata$Voltage)

#Draw the plots
png("plot4.png")

par(mfrow=c(2, 2))

with(newdata, {
  plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="")
  plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_1, col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
})

dev.off()

