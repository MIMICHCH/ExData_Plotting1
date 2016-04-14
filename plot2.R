#Read the whole data set into PowerUsage
PowerUsage<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)
head(PowerUsage)

#Extract only two day's date into variable plotset
plotset<-subset(PowerUsage,Date=="1/2/2007"|Date=="2/2/2007")

#Create a new column combined with Date and Time
datetime<-strptime(paste(plotset$Date,plotset$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

#reformat the global active power column to numeric
globalactivepower<-as.numeric(plotset$Global_active_power)

#Open the png screen device
png("plot2.png",width=480,height=480)

#Construct the plot
plot(datetime,globalactivepower,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
