#Libraries
library(dplyr)
#library(stringr)
library(base64)
library(ggplot2)
library(scales)
#library(tidyr)
#Setting working directory path
setwd("https://github.com/Grajales/ExData_Plotting1/exdata-data-household_power_consumption")

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
Sub_metering_1 <- household_power_Feb_1_2_2007[,7]
Sub_metering_2 <- household_power_Feb_1_2_2007[,8]
Sub_metering_3 <- household_power_Feb_1_2_2007[,9]
#**************************
#Verifying plot on the screen first
plot(x_d_t, Sub_metering_1, type ="l", xlab="Feb 2007", ylab="Energy Submetering")
lines(x_d_t, Sub_metering_2, type ="l", col = "red") 
lines(x_d_t, Sub_metering_3, type ="l", col ="blue") 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1.5,1.5,1.5), col = c("black","red","blue") )
#Opening png device
png(filename = "Plot3.png", width = 480, height = 480)
plot(x_d_t, Sub_metering_1, type ="l", xlab="Feb 1-2 2007", ylab="Energy Submetering")
lines(x_d_t, Sub_metering_2, type ="l", col = "red") 
lines(x_d_t, Sub_metering_3, type ="l", col ="blue") 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1.5,1.5,1.5), col = c("black","red","blue") )
dev.off() #Closing png device
