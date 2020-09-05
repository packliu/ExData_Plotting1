#load and subset the data from 2007-02-01 to 2007-02-02
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.strings="?")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#format Date and Time fields
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time), 
                             "%Y-%m-%d %H:%M:%S")
subdata$datetime <- as.POSIXct(subdata$datetime)

#plot figure 4 and send into a PNG file
png(file="plot4.png", width=480, height=480)
#plot graphs in 2x2 matrix
par(mfrow=c(2,2))
#topleft graph
plot(subdata$datetime, subdata$Global_active_power, type = "l", xlab="", 
     ylab="Global Active Power")
#topright graph
plot(subdata$datetime, subdata$Voltage, type = "l", xlab="datetime", 
     ylab="Voltage")
#bottomleft graph
plot(subdata$datetime, subdata$Sub_metering_1, type = "l", xlab="", 
     ylab="Energy sub metering")
lines(subdata$datetime, subdata$Sub_metering_2, col="red")
lines(subdata$datetime, subdata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#bottomright graph
plot(subdata$datetime, subdata$Global_reactive_power, type = "l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off() #close file device