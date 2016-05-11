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

png(file='plot4.png')
par(mfcol=c(2,2))

plot(hpcdata$Date, hpcdata$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', type="n")
lines(hpcdata$Date, hpcdata$Global_active_power)

plot(hpcdata$Date, hpcdata$Sub_metering_1, xlab='', ylab='Energy sub metering', type="n")
lines(hpcdata$Date, hpcdata$Sub_metering_1, col="black")
lines(hpcdata$Date, hpcdata$Sub_metering_2, col="red")
lines(hpcdata$Date, hpcdata$Sub_metering_3, col="blue")
legend('topright', lty=par("lty"), col=c('black', 'blue', 'red'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
plot(hpcdata$Date, hpcdata$Voltage, xlab='datetime', ylab='Voltage', type="n")
lines(hpcdata$Date, hpcdata$Voltage)
plot(hpcdata$Date, hpcdata$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type="n")
lines(hpcdata$Date, hpcdata$Global_reactive_power)
dev.off()