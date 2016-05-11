#Load the Data

if (!exists("hPC")) hPC<-read.table('household_power_consumption.txt', header=TRUE, sep=";", colClasses="character")

#Create the line graph
select<- hPC[,1]== '1/2/2007'| hPC[,1]=='2/2/2007' 
hpcdata<-hPC[select,]
hpcdata$Global_active_power<-as.numeric(hpcdata$Global_active_power)
#hpcdata$Date<-as.Date(hpcdata$Date, '%d/%m/%Y')
hpcdata$Date<-paste(hpcdata$Date, hpcdata$Time)
hpcdata$Date<-strptime(hpcdata$Date, '%d/%m/%Y %H:%M:%S')

png(filename='plot2.png')
plot(hpcdata$Date, hpcdata$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', type="n")
lines(hpcdata$Date, hpcdata$Global_active_power)
dev.off()