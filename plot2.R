## Coursera - Exploratory Data Analysis - Project COurse 1 - Plot2

##Clear Global environment
rm(list = ls())

##Reads the complete data, supposing it is in the current directory
complete_table <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, dec=".")

## Subsets the table in order to extract only the corresponding values from the dates 2007-02-1 to 2007-02-02
subset_table<-subset(complete_table,complete_table$Date == ("1/2/2007") | complete_table$Date == ("2/2/2007"))

#Creates a variable that contains the corresponding  Date/Time Classes in R
DataAndTime<-strptime(paste(subset_table$Date, subset_table$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Converts the Global Active Power to Numeric
subset_table$Global_active_power<-as.numeric(subset_table$Global_active_power)

##Opens a png graph device with dimentions of 480 x 480
png("plot2.png", width=480, height=480)
#Plots the histogram on the device
plot(DataAndTime,subset_table$Global_active_power,type="l",ylab=" Global Active Power (kW)", xlab="")
#Closes The Device
dev.off()
