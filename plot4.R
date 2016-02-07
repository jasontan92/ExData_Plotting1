library(data.table)
data<-fread("household_power_consumption.txt")
data1<-data[Sub_metering_1!="?"]
data2<-data1[Date=="1/2/2007"|Date=="2/2/2007"]
data2$Date<-data2[,.(as.Date(Date,"%d/%m/%Y"))]
data2$Time<-as.POSIXct(paste(data2$Date,data2$Time),format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

plot(x=data2$Time,y=data2$Global_active_power,ylab="Global Active Power",xlab="",type="n",cex.lab=0.75,cex.axis=0.75)
lines(x=data2$Time,y=data2$Global_active_power)

plot(x=data2$Time,y=data2$Voltage,ylab="Voltage",xlab="datetime",type="n",cex.lab=0.75,cex.axis=0.75)
lines(x=data2$Time,y=data2$Voltage)

plot(x=data2$Time,y=data2$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n",cex.lab=0.75,cex.axis=0.75)
lines(x=data2$Time,y=data2$Sub_metering_1)
lines(x=data2$Time,y=data2$Sub_metering_2,col="red")
lines(x=data2$Time,y=data2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,bty="n",col=c("black","red","blue"),cex=0.75)

plot(x=data2$Time,y=data2$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="n",cex.lab=0.75,cex.axis=0.75)
lines(x=data2$Time,y=data2$Global_reactive_power)

title("Plot 4",outer=T)
