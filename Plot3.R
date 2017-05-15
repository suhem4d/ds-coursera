dataCSV<-read.csv2("./EploratoryDataAnalysis/household_power_consumption.txt",sep=";",header=TRUE,dec=".")

dataCSVSubset<-dataCSV[dataCSV$Date %in% c("1/2/2007","2/2/2007"),]

#install.packages("lubridate")
library(lubridate)
dataCSVSubset$datetime <- paste(dataCSVSubset$Date, dataCSVSubset$Time)

dataCSVSubset$day <- strptime(dataCSVSubset$datetime, format = "%d/%m/%Y %H:%M:%S")
png(file="plot3.png")
plot(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Sub_metering_1)),xlab=""
     ,ylab="Energy sub metering",type = "l",col="black")
lines(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Sub_metering_2)),col="red")
lines(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Sub_metering_3)),col="blue")

legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1),col=c('black', 'red', 'blue'), cex=.75)
dev.off()
