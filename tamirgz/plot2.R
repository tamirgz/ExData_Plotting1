## get the data from the file
d = read.table("household_power_consumption.txt",
               header = TRUE,
               sep=";",
               na.strings="?",
               col.names=c("Date","Time","Global_active_power",
                           "Global_reactive_power","Voltage",
                           "Global_intensity","Sub_metering_1",
                           "Sub_metering_2","Sub_metering_3"))

## extract only required dates
data <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]
dt <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## plot the data
plot(dt,as.numeric(data$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png", width=480,height=480) 
dev.off() ## Don't forget to close the PNG device!