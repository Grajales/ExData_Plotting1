#Libraries
library(dplyr)
#library(stringr)
library(base64)
library(ggplot2)
library(scales)
#library(tidyr)
#Setting working directory path
setwd("https://github.com/Grajales/ExData_Plotting1")

#*****************************
# Reading the table and separating the string of data into columns using sep=";"
#****************************
household_power <- read.table("household_power_consumption.txt", sep=";", colClasses ="character")
#Selecting only two days data
household_power_Feb_1_2_2007 <- filter(household_power, household_power[,1]== "1/2/2007" | household_power[,1]== "2/2/2007" )
#*****************************
# Plotting the data
#****************************
#First column date format description
x_d <- as.Date(household_power_Feb_1_2_2007[,1], "%d/%m/%Y")
#Mergin Date and time into one single column
x_d_t <- as.POSIXct(paste(x_d,household_power_Feb_1_2_2007[,2]), format="%Y-%m-%d %H:%M:%S")
y <- household_power_Feb_1_2_2007[,3]
voltage <- household_power_Feb_1_2_2007[,5]
reactive <- household_power_Feb_1_2_2007[,4]
Sub_metering_1 <- household_power_Feb_1_2_2007[,7]
Sub_metering_2 <- household_power_Feb_1_2_2007[,8]
Sub_metering_3 <- household_power_Feb_1_2_2007[,9]
#***********************************
#Ploting first on the screen
#************************************
#Dividing page into four plots
par(mfrow= c(2,2), mar=c(2,5,2,2)) # mar=c(bottom, left, top, right)
#First plot in upper left
plot(x_d_t, y, type ="l", xlab="", ylab= "Global Active Power(kilowatts)", pty="m",cex.lab=0.7, cex.axis=0.8) 

#Second plot in upper right
plot(x_d_t, voltage, type ="l", xlab="Datetime", ylab= "Voltage(V)", pty="m",cex.lab=0.7, cex.axis=0.8) 

#Third plot in lower left
plot(x_d_t, Sub_metering_1, type ="l", xlab="", ylab="Energy Submetering", pty="m",cex.lab=0.7, cex.axis=0.8) 

lines(x_d_t, Sub_metering_2, type ="l", col = "red") 
lines(x_d_t, Sub_metering_3, type ="l", col ="blue") 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1.5,1.5,1.5), col = c("black","red","blue"), cex=0.6) 
 
#Fourth plot in lower right
plot(x_d_t, reactive, type ="l", xlab ="Datetime", ylab= "Global Reactive Power", pty="m",cex.lab=0.7, cex.axis=0.6, ylim=c(0.0,0.5)) 
#****************************
#Opening png device
png(filename = "Plot4.png", width = 480, height = 480)
#Dividing page into four plots
par(mfrow= c(2,2), mar=c(2,5,2,2)) # mar=c(bottom, left, top, right)
#First plot in upper left
plot(x_d_t, y, type ="l", xlab="", ylab= "Global Active Power(kilowatts)", pty="m",cex.lab=0.7, cex.axis=0.8) 

#Second plot in upper right
plot(x_d_t, voltage, type ="l", xlab="Datetime", ylab= "Voltage(V)", pty="m",cex.lab=0.7, cex.axis=0.8) 

#Third plot in lower left
plot(x_d_t, Sub_metering_1, type ="l", xlab="", ylab="Energy Submetering", pty="m",cex.lab=0.7, cex.axis=0.8) 

lines(x_d_t, Sub_metering_2, type ="l", col = "red") 
lines(x_d_t, Sub_metering_3, type ="l", col ="blue") 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1,1), lwd=c(1.5,1.5,1.5), col = c("black","red","blue"), cex=0.7) 

#Fourth plot in lower right
plot(x_d_t, reactive, type ="l", xlab ="Datetime", ylab= "Global Reactive Power", pty="m",cex.lab=0.7, cex.axis=0.7, ylim=c(0.0,0.5)) 
dev.off() #Closing png device
