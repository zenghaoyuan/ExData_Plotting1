##My system language is chinese,so in graph it will show chinese chracters
##in graph I get instead of letters.I'm Sorry for the inconvenience
####################################################################
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")
data<-transform(data,Date=as.character(Date),Time=as.character(Time))
dataset<-data[data[,"Date"]=="1/2/2007"|data[,"Date"]=="2/2/2007",]
remove(data)
dataset$datetime<-cbind(paste(dataset$Date,dataset$Time))
dataset<-transform(dataset,datetime=as.vector(datetime))
dataset<-transform(dataset,datetime=strptime(datetime,format="%d/%m/%Y %H:%M:%S"))
png(file="plot4.png",width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))
plot(dataset$datetime,dataset$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
plot(dataset$datetime,dataset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(dataset$datetime,dataset$Sub_metering_2,col="red")
lines(dataset$datetime,dataset$Sub_metering_3,col="blue")
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dataset$datetime,dataset$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(dataset$datetime,dataset$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()