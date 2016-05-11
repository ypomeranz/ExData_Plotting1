#Load the Data

if (!exists("hPC")) hPC<-read.table('household_power_consumption.txt', header=TRUE, sep=";", colClasses="character")

#Produce the histogram - plot 1
select<- hPC[,1]== '1/2/2007'| hPC[,1]=='2/2/2007' 
hpcdata<-hPC[select,]
hpcdata$Global_active_power<-as.numeric(hpcdata$Global_active_power)
GlobalActivePowerKW<-hpcdata$Global_active_power
png(filename='plot1.png')
hist(GlobalActivePowerKW, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
