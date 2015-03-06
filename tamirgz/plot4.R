## get the data from the file
d = read.table("household_power_consumption.txt",
               header = TRUE,
               sep=";",
               na.strings="?",
               col.names=c("Date","Time","Global_active_power",
                           "Global_reactive_power","Voltage",
                           "Global_intensity","Sub_metering_1",
                           "Sub_metering_2","Sub_metering_3"))

par(mfrow=c(2,2))
## extract only required dates
data <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",] ## extract only required dates
dt <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## plot 1st graph
plot(dt,as.numeric(data$Global_active_power),type="l",xlab="",ylab="Global Active Power") ## plot the data

## plot 2nd graph
plot(dt,as.numeric(data$Voltage),xlab="datetime",ylab="Voltage",type="l")

## plot 3rd graph
plot(dt,as.numeric(data$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering") ## plot the data
lines(dt,as.numeric(data$Sub_metering_2),col="red")
lines(dt,as.numeric(data$Sub_metering_3),col="blue")
legend("topright",lty=c(1,1),border="white",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75,bty = "n")

## plot 4th graph
plot(dt,as.numeric(data$Global_reactive_power),xlab="datetime",ylab="Global_reactive_power",type="l")

## save the plot to file
dev.copy(png, file = "plot4.png", width=480,height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!