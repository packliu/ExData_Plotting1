#load and subset the data from 2007-02-01 to 2007-02-02
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#format Date and Time fields
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
subdata$datetime <- as.POSIXct(subdata$datetime)

#plot figure 2 and send into a PNG file
png(file="plot2.png", width=480, height=480)
plot(subdata$datetime, subdata$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() #close file device