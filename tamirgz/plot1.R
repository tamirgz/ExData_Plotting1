## get the data from the file
d = read.table("household_power_consumption.txt",
               header = TRUE,
               sep=";",
               na.strings="?",
               col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")) ## read the database file

data <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",] ## extract only required dates
hist(as.numeric(data$Global_active_power),xlab = "Global Active Power (kilowatts)",col="red",main="Global Active Power") ## plot the histogram

dev.copy(png, file = "plot1.png", width=480,height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!