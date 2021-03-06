Library(dplyr)

#Read in table
power<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#subset table to include only 2 dates 
power<-power %>% filter(Date=="1/2/2007"|Date=="2/2/2007") 

#add a DateTime column that is a POSIXlt date and time for plotting
power<-cbind(power,DateTime=strptime(paste(power$Date,power$Time), format="%d/%m/%Y %T"))

#open png device
png(filename="plot3.png")
#plot
with(power,plot(datetime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l", col="black"))
with(power,lines(x=datetime,y=Sub_metering_2,xlab="",ylab="Energy sub metering",type="l", col="red"))
with(power,lines(x=datetime,y=Sub_metering_3,xlab="",ylab="Energy sub metering",type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
#close device
dev.off()