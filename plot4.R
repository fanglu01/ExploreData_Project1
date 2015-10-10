data<-read.table("C:/Users/Fang/Documents/DataScienceClass/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?")
plotdata<-data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
plotdata$Date<-as.Date(plotdata$Date, "%d/%m/%Y")
dt<-paste(plotdata$Date, plotdata$Time)
plotdata$Day<-wday(plotdata$Date,label = TRUE)
timestamp<-strftime(dt, format="%Y-%m-%d %H:%M:%S")

# Split the output in 2x2 panel
#par(mfcol = c(2,2))

dev.copy(png, file = "C:/Users/Fang/Documents/DataScienceClass/ExploratoryDataAnalysis/Project1/plot4.png", height=480, width=480)

# Split the output in 2x2 panel
par(mfcol = c(2,2), cex = 0.6)

##--------Figure 1--------------
plot(plotdata$Global_active_power, type = "l", xaxt ="n", ann = F)
title(ylab = "Global Active Power (kilowatts)")
axis (side =1, at = seq (0, 2880, 1440), labels = c("Thu","Fri","Sat"))

##--------Figure 2--------------
max_y <-max(plotdata[,7:9])

plotdata$Index<-c(1:2880)
plot(plotdata$Index, plotdata$Sub_metering_1, bg = "White", ylim = c(0, max_y),type = "l", col="Black", xaxt = "n", ann = F)
title(ylab = "Energy sub metering")
axis (side =1, at = seq (0, 2880, 1440), labels = c("Thu","Fri","Sat"))

# Graph metering2 and metering3 with red and blue color
lines(plotdata$Index, plotdata$Sub_metering_3, type = "l", col="Blue")
lines(plotdata$Index, plotdata$Sub_metering_2, type = "l", col="Red")

#Add legend to the graphb
legend("topright", bty="n", lty=c(1,1),lwd = c(2.5, 2.5), col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##-------Figure 3---------------
plot(plotdata$Index, plotdata$Voltage, type = "l", xaxt = "n", ann = F)
title(ylab = "Voltage")
title(xlab = "datetime")
axis (side =1, at = seq (0, 2880, 1440), labels = c("Thu","Fri","Sat"))

##-------Figure 4---------------
plot(plotdata$Index, plotdata$Global_reactive_power, type = "l", xaxt = "n", ann = F)
title(ylab = "Global_reactive_power")
title(xlab = "datetime")
axis(side =1, at = seq (0, 2880, 1440), labels = c("Thu","Fri","Sat"))
axis(side =2, at =seq(0.0, 0.5, 0.1),labels = c("0.0", "0.1","0.2", "0.3","0.4", "0.5"))

dev.off()

par(mfcol = c(1,1))