#Read input data and clean it (subset to just the required dates, date/time conversions, numeric conversion)
setwd("C:/Users/arunaba/DataScienceCoursera/ExploratoryDataAnalysis")
library(data.table)
data<-fread("household_power_consumption.txt", na.strings=c("?", ""))
newdata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007"]
newdata$DateTime<-as.POSIXct(paste(newdata$Date, newdata$Time), format="%d/%m/%Y %H:%M:%S")
newdata$Global_active_power=as.numeric(newdata$Global_active_power)

#Draw the Plot and save it to a file
png("plot3.png")
with(newdata, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(newdata, lines(DateTime, Sub_metering_1, col="black"))
with(newdata, lines(DateTime, Sub_metering_2, col="red"))
with(newdata, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
