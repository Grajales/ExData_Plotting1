#Libraries
library(dplyr)
library(base64)

#Setting working directory path
setwd("exdata-data-household_power_consumption")

#*****************************
# Reading the table and separating the string of data into columns using sep=";"
#****************************
household_power <- read.table("household_power_consumption.txt", sep=";", colClasses ="character")
household_power_Feb_1_2_2007 <- filter(household_power, household_power[,1]== "1/2/2007" | household_power[,1]== "2/2/2007" )

#*****************************
# Plotting the data on the screen first
hist(as.numeric(household_power_Feb_1_2_2007[,3]), xlab= "Global Active Power(kilowatts) ", main="Global Active Power", col="red")

#****************************
#Opening png device
png(filename = "Plot1.png", width = 480, height = 480)
hist(as.numeric(household_power_Feb_1_2_2007[,3]), xlab= "Global Active Power(kilowatts) ", main="Global Active Power", col="red")
dev.off() #Closing png device
