library(lubridate)
library(dplyr)
library(grDevices)

##downloading and unzipping data if not in the working directory

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_
        consumption.zip"
zipfile <- "./household_power_consumption.zip"
textfile <- "./household_power_consumption.txt"

if (!file.exists(textfile)) {
  download.file(url, zipfile, method = "curl")
  unzip(zipfile, overwrite = TRUE )
}

##Reading data and setting dates and times

EC<-read.table(textfile,header=TRUE,sep=";",na.strings = "?")
EC<-filter(EC,Date=="1/2/2007"|Date=="2/2/2007")
EC<-mutate(EC,Date=dmy(Date),Time=hms(Time))
date<-EC$Date+EC$Time
EC<-cbind(date,EC)

##Setting png file as device and plotting histogram

png("plot1.png",width=480,height = 480)
hist(EC$Global_active_power,main="Global Active Power",
       xlab="Global Active Power (kilowatts)",col="red")
dev.off()