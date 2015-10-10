data<-read.table("C:/Users/Fang/Documents/DataScienceClass/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?")
plotdata<-data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
hist(plotdata[,3], xlab = "Global Active Power (kilowatts)", col = "red", main = "Histogram of Global Active Power", ylim =c(0,1200), xaxt = "n")
axis(side =1, at = seq (0,6,2), labels =seq (0,6,2))
dev.copy(png, file = "C:/Users/Fang/Documents/DataScienceClass/ExploratoryDataAnalysis/Project1/plot1.png", height=480, width=480)
dev.off()