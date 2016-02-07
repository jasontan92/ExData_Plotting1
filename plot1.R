library(data.table)
data<-fread("household_power_consumption.txt")
data1<-data[Sub_metering_1!="?"]
data2<-data1[Date=="1/2/2007"|Date=="2/2/2007"]
data2$Date<-data2[,.(as.Date(Date,"%d/%m/%Y"))]
data2$Time<-as.POSIXct(paste(data2$Date,data2$Time),format="%Y-%m-%d %H:%M:%S")


hist(as.numeric(data2$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Plot 1")