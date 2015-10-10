data<-read.table("C:/Users/Fang/Documents/DataScienceClass/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?")
plotdata<-data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
plotdata$Date<-as.Date(plotdata$Date, "%d/%m/%Y")
dt<-paste(plotdata$Date, plotdata$Time)
plotdata$Day<-wday(plotdata$Date,label = TRUE)
timestamp<-strftime(dt, format="%Y-%m-%d %H:%M:%S")

plot(plotdata$Global_active_power, type = "l", xaxt ="n", ann = F)
title(ylab = "Global Active Power (kilowatts)")
timeline = plotdata$Day
summary(timeline)
axis (side =1, at = seq (0, 2880, 1440), labels = c("Thu","Fri","Sat"))

dev.copy(png, file = "C:/Users/Fang/Documents/DataScienceClass/ExploratoryDataAnalysis/Project1/plot2.png", height=480, width=480)
dev.off()