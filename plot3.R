data<-read.table("C:/Users/Fang/Documents/DataScienceClass/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?")
plotdata<-data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
plotdata$Date<-as.Date(plotdata$Date, "%d/%m/%Y")
dt<-paste(plotdata$Date, plotdata$Time)
plotdata$Day<-wday(plotdata$Date,label = TRUE)
timestamp<-strftime(dt, format="%Y-%m-%d %H:%M:%S")

max_y <-max(plotdata[,7:9])

plotdata$Index<-c(1:2880)
plot(plotdata$Index, plotdata$Sub_metering_1, ylim = c(0, max_y),type = "l", col="Black", xaxt = "n", ann = F)
title(ylab = "Energy sub metering")
axis (side =1, at = seq (0, 2880, 1440), labels = c("Thu","Fri","Sat"))

# Graph metering2 and metering3 with red and blue color
lines(plotdata$Index, plotdata$Sub_metering_3, type = "l", col="Blue")
lines(plotdata$Index, plotdata$Sub_metering_2, type = "l", col="Red")

#Add legend to the graph
legend("topright", lty=c(1,1),lwd = c(2.5, 2.5), col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "C:/Users/Fang/Documents/DataScienceClass/ExploratoryDataAnalysis/Project1/plot3.png", height=480, width=480)
dev.off()