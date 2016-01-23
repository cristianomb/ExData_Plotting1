## Coursera - Exploratory Data Analysis - Project COurse 1 - Plot4

##Clears Global environment
rm(list = ls())

##Reads the complete data, supposing it is in the current directory
complete_table <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, dec=".")

## Subsets the table in order to extract only the corresponding values from the dates 2007-02-1 to 2007-02-02
subset_table<-subset(complete_table,complete_table$Date == ("1/2/2007") | complete_table$Date == ("2/2/2007"))

#Creates a variable that contains the corresponding  Date/Time Classes in R format
DataAndTime<-strptime(paste(subset_table$Date, subset_table$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Converts the measurements  to Numeric
subset_table$s <-as.numeric(subset_table$Global_active_power)
subset_table$Sub_metering_1<-as.numeric(subset_table$Sub_metering_1)
subset_table$Sub_metering_2<-as.numeric(subset_table$Sub_metering_2)
subset_table$Sub_metering_3<-as.numeric(subset_table$Sub_metering_3)
subset_table$Voltage<-as.numeric(subset_table$Voltage)
subset_table$Global_reactive_power<-as.numeric(subset_table$Global_reactive_power)

##Plot

##Opens a png graph device with dimentions of 480 x 480
png("plot4.png", width=480, height=480)

#Plots the four graphs on the device

##Creates 2 columns of 2 rows of graphic
par(mfrow= c(2,2))

with(subset_table, {
  # Graph 1,1
  plot(DataAndTime, Global_active_power, type="l", xlab="", ylab=" Global Active Power (kW)")
  # Graph 1,2
  plot(DataAndTime, Voltage, type = "l", ylab= "Voltage (V)", xlab = "datetime")
  # Graph 2,1
  plot(DataAndTime,Sub_metering_1, type="n", xlab="", ylab="Energy Sub Metering")
  ##Traces the line of the Sub 1
  lines(DataAndTime,Sub_metering_1, col="black", type ="l")
  ##Traces the line of the Sub 2
  lines(DataAndTime,Sub_metering_2, col="red",type="l")
  ##Traces the line of the Sub 3
  lines(DataAndTime, Sub_metering_3, col="blue",type="l")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))
  # Graph 2,2
  plot(DataAndTime, Global_reactive_power, xlab="datetime", type="l")
})

#Closes The Device
dev.off()
