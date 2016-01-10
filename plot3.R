
table <- read.table("household_power_consumption.txt", header=T, sep=";")

table$Date <- as.Date(table$Date, format="%d/%m/%Y")
data <- table[(table$Date=="2007-02-01") | (table$Date=="2007-02-02"),]

data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

plot(data$timestamp,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$timestamp,data$Sub_metering_2,col="red")
lines(data$timestamp,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()