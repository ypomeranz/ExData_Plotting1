
if (!exists("hPC")) hPC<-read.table('household_power_consumption.txt', header=TRUE, sep=";", colClasses="character")

#Create the plot
select<- hPC[,1]== '1/2/2007'| hPC[,1]=='2/2/2007' 
hpcdata<-hPC[select,]
hpcdata$Global_active_power<-as.numeric(hpcdata$Global_active_power)
hpcdata$Date<-paste(hpcdata$Date, hpcdata$Time)
hpcdata$Date<-strptime(hpcdata$Date, '%d/%m/%Y %H:%M:%S')
hpcdata<- hpcdata[,-2]
hpcdata$Sub_metering_1<as.numeric(hpcdata$Sub_metering_1)
hpcdata$Sub_metering_2<as.numeric(hpcdata$Sub_metering_2)
hpcdata$Sub_metering_3<as.numeric(hpcdata$Sub_metering_3)


png(filename='plot3.png')
plot(hpcdata$Date, hpcdata$Sub_metering_1, xlab='', ylab='Energy sub metering', type="n")
lines(hpcdata$Date, hpcdata$Sub_metering_1, col="black")
lines(hpcdata$Date, hpcdata$Sub_metering_2, col="red")
lines(hpcdata$Date, hpcdata$Sub_metering_3, col="blue")
legend('topright', lty=par("lty"), col=c('black', 'blue', 'red'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()