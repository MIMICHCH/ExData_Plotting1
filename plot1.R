#Read the whole data set into PowerUsage
PowerUsage<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)
head(PowerUsage)

#Extract only two day's date into variable plotset
plotset<-subset(PowerUsage,Date=="1/2/2007"|Date=="2/2/2007")

#reformat the global active power column to numeric
globalactivepower<-as.numeric(plotset$Global_active_power)

#Open the png screen device
png("plot1.png",width=480,height=480)

#plot the histogram
hist(globalactivepower,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")
dev.off()