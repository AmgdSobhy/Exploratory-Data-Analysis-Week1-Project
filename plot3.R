# check & set Working Directory
if(getwd() != "C:/Users/DELL/OneDrive/Documents/RWD/Exploratory-Data-Analysis-Week1-Project") setwd("~/RWD/Exploratory-Data-Analysis-Week1-Project")

# Download file
if(! file.exists("Electric power consumption.zip"))
{
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "Electric power consumption.zip")
}

# unzip rar file
if( ! file.exists("household_power_consumption.txt")) unzip("Electric power consumption.zip")

# Read the data
library(dplyr)
if(!exists("a")) a <- read.table("household_power_consumption.txt",sep = ";", header= TRUE, stringsAsFactors=FALSE, dec=".")
if(!identical(dim(a), as.integer(c(2880,9)))) a <- a[a$Date %in% c("1/2/2007","2/2/2007") ,]

# plot 3
dt <- strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(dt, as.numeric(a$Sub_metering_1), type="l",xlab="", ylab="Energy Sub Metering")
lines(dt, as.numeric(a$Sub_metering_2), type="l", col="red")
lines(dt, as.numeric(a$Sub_metering_3), type="l", col="blue"); rm(dt)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()