powerData<-read.table("household_power_consumption.txt", header = TRUE, sep=";")

subData<-powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

dateTime<-as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")

plot(dateTime, as.numeric(subData$Global_active_power), type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(dateTime, as.numeric(subData$Global_active_power), type="l")

dev.copy(png, file="plot2.png")
dev.off()
