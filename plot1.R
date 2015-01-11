#Read input data and clean it (subset to just the required dates, date/time conversions, numeric conversion)
setwd("C:/Users/arunaba/DataScienceCoursera/ExploratoryDataAnalysis")
library(data.table)
data<-fread("household_power_consumption.txt", na.strings=c("?", ""))
newdata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007"]
newdata$DateTime<-as.POSIXct(paste(newdata$Date, newdata$Time), format="%d/%m/%Y %H:%M:%S")
newdata$Global_active_power=as.numeric(newdata$Global_active_power)

#Draw the Plot and save it to a file
hist(newdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
