data_full <- read.csv("./household_power_consumption.txt",header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S", tz = "GMT")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Datetime, Global_active_power, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Datetime, Voltage, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Datetime, Sub_metering_1, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Datetime, Sub_metering_2,col='Red')
        lines(Datetime, Sub_metering_3,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Datetime, Global_reactive_power, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()