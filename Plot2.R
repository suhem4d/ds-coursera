dataCSV<-read.csv2("./EploratoryDataAnalysis/household_power_consumption.txt",sep=";",header=TRUE,dec=".")

dataCSVSubset<-dataCSV[dataCSV$Date %in% c("1/2/2007","2/2/2007"),]

#install.packages("lubridate")
library(lubridate)

dataCSVSubset$datetime <- paste(dataCSVSubset$Date, dataCSVSubset$Time)

dataCSVSubset$day <- strptime(dataCSVSubset$datetime, format = "%d/%m/%Y %H:%M:%S")
png(file="plot2.png")
plot(dataCSVSubset$day,as.numeric(as.character(dataCSVSubset$Global_active_power)),xlab=""
     ,ylab="Global Active Power (Kilowatts)",type = "l")
dev.off()


