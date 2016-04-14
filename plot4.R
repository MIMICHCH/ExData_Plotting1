#Read the whole data set into PowerUsage
PowerUsage<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)
head(PowerUsage)

#Extract only two day's date into variable plotset
plotset<-subset(PowerUsage,Date=="1/2/2007"|Date=="2/2/2007")

#Create a new column combined with Date and Time
datetime<-strptime(paste(plotset$Date,plotset$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

#reformat columns to numeric
globalactivepower<-as.numeric(plotset$Global_active_power)
Sub_metering_1<-as.numeric(plotset$Sub_metering_1)
Sub_metering_2<-as.numeric(plotset$Sub_metering_2)
Sub_metering_3<-as.numeric(plotset$Sub_metering_3)
Voltage<-as.numeric(plotset$Voltage)
globalreactivepower<-as.numeric(plotset$Global_reactive_power)

#Open the png screen device
png("plot4.png",width=480,height=480)

#Construct the plot
par(mfrow=c(2,2))
#plot on the top left corner
plot(datetime,globalactivepower,xlab="",ylab="Global Active Power",type="l")
#plot on the top right corner
plot(datetime,Voltage,xlab="datetime",ylab="Voltage",type="l")
#plot on the bottom left corner
plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_meterng_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
#plot on the bottom right corner
plot(datetime,globalreactivepower,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()
