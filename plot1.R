#load and subset the data from 2007-02-01 to 2007-02-02
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#plot figure 1 and send into a PNG file
png(file="plot1.png", width=480, height=480)
hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off() #close file device


