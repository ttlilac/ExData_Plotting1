powerData<-read.table("household_power_consumption.txt", header = TRUE, sep=";")

subData<-powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

dateTime<-as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(2,4,2,4))
with(subData, {
  plot(dateTime, as.numeric(subData$Global_active_power), type="n", ylab="Global Active Power", xlab="")
  lines(dateTime, as.numeric(subData$Global_active_power), type="l")
  
  plot(dateTime, as.numeric(subData$Voltage), type="n", ylab="Voltage")
  lines(dateTime, as.numeric(subData$Voltage), type="l")
  
  plot(c(dateTime,dateTime,dateTime), c(as.numeric(subData$Sub_metering_1),as.numeric(subData$Sub_metering_2),as.numeric(subData$Sub_metering_3)), type="n", ylab="Energy sub metering", xlab="")
  with(subData, points(dateTime, as.numeric(subData$Sub_metering_1), type="n"))
  with(subData, points(dateTime, as.numeric(subData$Sub_metering_2), type="n"))
  with(subData, points(dateTime, as.numeric(subData$Sub_metering_3), type="n"))
  lines(dateTime, as.numeric(subData$Sub_metering_1), type="l", col="black")
  lines(dateTime, as.numeric(subData$Sub_metering_2), type="l", col="red")
  lines(dateTime, as.numeric(subData$Sub_metering_3), type="l", col="blue")
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  plot(dateTime, as.numeric(subData$Global_active_power), type="n", ylab="Global_active_power")
  lines(dateTime, as.numeric(subData$Global_active_power), type="l")
  
  })

dev.copy(png, file="plot4.png")
dev.off()
