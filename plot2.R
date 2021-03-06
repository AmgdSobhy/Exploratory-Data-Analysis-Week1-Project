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

# plot 2
dt <- strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(dt, as.numeric(a$Global_active_power), type="l",xlab="", ylab="Global Active Power (kilowatts)"); rm(dt)
dev.off()