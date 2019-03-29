Library(dplyr)

#Read in table
power<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#subset table to include only 2 dates 
power<-power %>% filter(Date=="1/2/2007"|Date=="2/2/2007") 

#add a DateTime column that is a POSIXlt date and time for plotting
power<-cbind(power,DateTime=strptime(paste(power$Date,power$Time), format="%d/%m/%Y %T"))

#open png device
png(filename="plot2.png")
#plot
with(power,plot(datetime,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
#close device
dev.off()