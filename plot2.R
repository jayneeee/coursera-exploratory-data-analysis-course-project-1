setwd('C://Users//jieya//OneDrive//Documents//R')
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = './R/householdElectric.zip')
unzip('./R/householdElectric.zip', exdir = './R')

files <- file('./R/household_power_consumption.txt')
dataSet <- read.table(files, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- dataSet[dataSet$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", height=480, width=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()