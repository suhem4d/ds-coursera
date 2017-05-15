

dataCSV<-read.csv2("./EploratoryDataAnalysis/household_power_consumption.txt",sep=";",header=TRUE,dec=".")

dataCSVSubset<-dataCSV[dataCSV$Date %in% c("1/2/2007","2/2/2007"),]

#install.packages("lubridate")
library(lubridate)

dataCSVSubset$datetime <- paste(dataCSVSubset$Date, dataCSVSubset$Time)
mdy_hms(dataCSVSubset$datetime,tz=Sys.timezone())


dataCSVSubset$day <- strptime(dataCSVSubset$datetime, format = "%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfrow =c(2,2))

#plot1
plot(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Global_active_power)),xlab=""
     ,ylab="Global Active Power",type = "l")

#plot2
plot(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Voltage)), xlab="datetime",ylab="Voltage",type="l")

#plot3
plot(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Sub_metering_1)),xlab=""
     ,ylab="Energy sub metering",type = "l",col="black")
lines(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Sub_metering_2)),col="red")
lines(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Sub_metering_3)),col="blue")

legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1),col=c('black', 'red', 'blue'), cex=.75)

#plot4
plot(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Global_reactive_power)), xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()
