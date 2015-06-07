library(lubridate)
library(dplyr)
hpc = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
hpc$Date= dmy(hpc$Date) #transform Date to POSIXct

hpc1 <- subset(hpc, as.Date(Date) >= "2007-02-01" & as.Date(Date) <="2007-02-02") #subseting fron selected dates
hpc1$datetime <- as.POSIXct(paste(hpc1$Date, hpc1$Time))
with(hpc1, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (Kilowwats)", xlab=""))

dev.copy(png, file="Plot2.png")
dev.off()
