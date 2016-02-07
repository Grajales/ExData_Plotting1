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
y <- household_power_Feb_1_2_2007[,3]
plot(x_d_t, y, type ="l", xlab="Feb 2007", ylab= "Global Active Power(kilowatts)") 
#****************************
#Opening png device
png(filename = "Plot2.png", width = 480, height = 480)
plot(x_d_t, y, type ="l", xlab="Feb 1-2 2007", ylab= "Global Active Power(kilowatts)")
dev.off() #Closing png device
