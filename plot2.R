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
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"),antialias = "cleartype")

##plot
plot(data2$DTime,data2$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",
     xaxt = "n",xlab="")
axis(1,at=c(0:2)*+3600*24+b, lab=c("Thu","Fri","Sat"))

###closing device
dev.off()
