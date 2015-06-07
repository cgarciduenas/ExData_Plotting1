library(lubridate)
library(dplyr)
hpc = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
hpc$Date= dmy(hpc$Date) #transform Date to POSIXct

hpc1 <- subset(hpc, as.Date(Date) >= "2007-02-01" & as.Date(Date) <="2007-02-02") #subseting fron selected dates
hpc1$datetime <- as.POSIXct(paste(hpc1$Date, hpc1$Time))

#PLOT3
with(hpc1, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering"))
with(hpc1, lines(datetime, Sub_metering_2, type="l", col="red"))
with(hpc1, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red", "blue"))

dev.copy(png, file="Plot3.png")
dev.off()
