library(lubridate)
library(dplyr)
hpc = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
hpc$Date= dmy(hpc$Date) #transform Date to POSIXct

hpc1 <- subset(hpc, as.Date(Date) >= "2007-02-01" & as.Date(Date) <="2007-02-02") #subseting fron selected dates


#PLOT 1
hist(hpc1$Global_active_power, xlab="Global Active Power(kilowatts)", main="Global Active Power", col="red", ylim=c(0,1200))

dev.copy(png, file="Plot1.png")
dev.off()
