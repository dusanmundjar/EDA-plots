
###import data
data <- read.csv("C:/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?")
data2 <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

###  new variable
dates<-data2$Date
times<-data2$Time
x <- paste(dates, times)
y<-strptime(x, "%d/%m/%Y %H:%M:%S")
data2$DTime<-y

#### first date
b<-strptime("1/2/2007","%d/%m/%Y")

###ploting device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"),antialias = "cleartype")

par(mfrow = c(2, 2))

#####plot 1
with(data2, {
plot(DTime, Global_active_power,type="l",col="black",main=" ",xlab="", ylab="Global active power",,xaxt = "n")
axis(1,at=c(0:2)*+3600*24+b, lab=c("Thu","Fri","Sat"))

})

#####plot 2
with(data2, {
  plot(DTime, Voltage,type="l",col="black",main=" ",xlab="datetime", ylab="Voltage",,xaxt = "n")
  axis(1,at=c(0:2)*+3600*24+b, lab=c("Thu","Fri","Sat"))
    })

#####plot 3
with(data2, {
  plot(DTime, Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="",xaxt = "n")
  points(DTime, Sub_metering_2,type="l",col="red",xaxt = "n")
  points(DTime, Sub_metering_3,type="l",col="blue",xaxt = "n")
  legend("topright", pch="-",col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  axis(1,at=c(0:2)*+3600*24+b, lab=c("Thu","Fri","Sat"))
  
  })

#####plot 4
with(data2, {
  plot(DTime,Global_reactive_power,type="l",col="black",main=" ",xlab="datetime", ylab="Global reactive power",xaxt = "n")
  axis(1,at=c(0:2)*+3600*24+b, lab=c("Thu","Fri","Sat"))
  
  })

##### closing device
dev.off()
