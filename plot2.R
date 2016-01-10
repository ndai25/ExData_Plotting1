
table <- read.table("household_power_consumption.txt", header=T, sep=";")

table$Date <- as.Date(table$Date, format="%d/%m/%Y")
data <- table[(table$Date=="2007-02-01") | (table$Date=="2007-02-02"),]

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
