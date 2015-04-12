#Plot2

######### Set working directory #########

setwd("/Users/tgjoen/coursera/explore")

#Load library

library(data.table)

#Read file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption"
download.file(url, file, method = "curl")

#unzip(file, exdir = "/Users/tgjoen/datasciencecoursera/exploratory")
unzip(file, exdir = "/Users/tgjoen/coursera/explore")


alldata <- fread("household_power_consumption.txt", na.strings = "?")



# Change format
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")


# Subset the data 
two_days <- alldata[alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02"]

# Make dataframe

two_days <- data.frame(two_days)

# Convert columns to numeric
for(i in c(3:9)) {two_days[,i] <- as.numeric(as.character(two_days[,i]))}

# Create Date_Time variable
two_days$Date_Time <- paste(two_days$Date, two_days$Time)

# Change format
two_days$Date_Time <- strptime(two_days$Date_Time, format="%Y-%m-%d %H:%M:%S")


#Make plot

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(6, 6, 5, 4))

plot(two_days$Date_Time, two_days$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)" , xlab = "")
dev.off()