png("plot4.png",width=480,height = 480)
par(mfcol=c(2,2))
with(EC,plot(date,Global_active_power,type="l",xlab="",
             ylab="Global Active Power"))

with(EC,plot(date,Sub_metering_1,type="l",col="Black",xlab="",ylab=""))
with(EC,lines(date,Sub_metering_2,type="l",col="Blue"))
with(EC,lines(date,Sub_metering_3,type="l",col="Red"))
colors <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
title(ylab="Energy sub metering",xlab="")
legend("topright",legend=labels,col=colors,lty="solid")

with(EC,plot(date,Voltage,type="l",xlab="datetime"))

with(EC,plot(date,Global_reactive_power,type="l",xlab="datetime"))

dev.off()