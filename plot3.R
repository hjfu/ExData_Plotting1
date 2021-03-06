############################
# consumer electricity data
############################
power = read.table("C:/Users/Huijing/Desktop/coursera/coursera_DE/week1/household_power_consumption.txt", sep=";",stringsAsFactor=FALSE, header=TRUE)
power$dttime =strptime(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")
power$Date = as.Date(power$Date, format="%d/%m/%Y")
power1 = subset(power, Date>="2007-02-01" & Date<="2007-02-02")
power1$Global_active_power = as.numeric(power1$Global_active_power)
power1$Weekday = as.factor(weekdays(power1$Date))

# plot 1
par(mfrow=c(1,1))

plot(power1$dttime, power1$Sub_metering_1,type="n", xlab="", ylab="Global Active Power (Kilowatts)")
attach(power1)
lines(dttime, Sub_metering_1)
lines(dttime, Sub_metering_2,col="red")
lines(dttime, Sub_metering_3,col="blue")
legend("topright",cex=0.5,pt.cex=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.copy(png, "plot3.png")
dev.off()


