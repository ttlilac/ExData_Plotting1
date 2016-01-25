powerData<-read.table("household_power_consumption.txt", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), header = TRUE, sep=";")

powerData<-read.table("household_power_consumption.txt", header = TRUE, sep=";")

subData<-powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

hist(as.numeric(subData$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="Red")

dev.copy(png, file="plot1.png")
dev.off()
