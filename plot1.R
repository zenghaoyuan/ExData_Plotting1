data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")
data<-transform(data,Date=as.character(Date),Time=as.character(Time))
dataset<-data[data[,"Date"]=="1/2/2007"|data[,"Date"]=="2/2/2007",]
png(file="plot1.png",width = 480, height = 480, units = "px")
hist(dataset[,"Global_active_power"],xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()