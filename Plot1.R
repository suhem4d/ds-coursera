#2007-02-01;2007-02-02


#data1<-read.table("./EploratoryDataAnalysis/household_power_consumption.txt",sep=";",header=TRUE
#                  ,skip=grep("01/02/2007",readLines("./EploratoryDataAnalysis/household_power_consumption.txt")),nrows =100 )

dataCSV<-read.csv2("./EploratoryDataAnalysis/household_power_consumption.txt",sep=";",header=TRUE,dec=".")
                  
dataCSVSubset<-dataCSV[dataCSV$Date %in% c("1/2/2007","2/2/2007"),]
head(dataCSVSubset,n=5)
png(file="plot1.png")
hist(as.numeric(as.character(dataCSVSubset$Global_active_power)),xlab="Global Acive Power (kilowatts)"
     ,main = "Global Active Power",col ="red")
dev.off()
