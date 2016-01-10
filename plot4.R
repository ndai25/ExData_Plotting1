  
  ##Setup
  table <- read.table("household_power_consumption.txt", header=T, sep=";")
  
  table$Date <- as.Date(table$Date, format="%d/%m/%Y")
  data <- table[(table$Date=="2007-02-01") | (table$Date=="2007-02-02"),]
  data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  
  par(mfrow=c(2,2))
  
  ##Plot 1
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  ##Plot 2
  plot(data$timestamp,data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##Plot 3
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  
  plot(data$timestamp,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(data$timestamp,data$Sub_metering_2,col="red")
  lines(data$timestamp,data$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  
  #Plot 4
  plot(data$timestamp,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("plot4.png has been saved in", getwd())