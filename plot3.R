library(data.table)
data<-fread("household_power_consumption.txt")
data1<-data[Sub_metering_1!="?"]
data2<-data1[Date=="1/2/2007"|Date=="2/2/2007"]
data2$Date<-data2[,.(as.Date(Date,"%d/%m/%Y"))]
data2$Time<-as.POSIXct(paste(data2$Date,data2$Time),format="%Y-%m-%d %H:%M:%S")

plot(x=data2$Time,y=data2$Sub_metering_1,ylab="Energy sub metering",xlab="",main="Plot3",type="n")
lines(x=data2$Time,y=data2$Sub_metering_1)
lines(x=data2$Time,y=data2$Sub_metering_2,col="red")
lines(x=data2$Time,y=data2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col=c("black","red","blue"))