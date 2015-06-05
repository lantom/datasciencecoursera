library(dplyr)

# Load data
projectdata <- read.csv2("household_power_consumption.txt", dec = ".", na.strings = "?")

# Get Feb data only
datafebr <- filter(projectdata, Date == "1/2/2007" | Date == "2/2/2007" )

# New date&time column added
datafebr$Timestamp <- paste(datafebr$Date, datafebr$Time, sep = " ")
datafebr$Timestamp <- strptime(datafebr$Timestamp, format = "%d/%m/%Y %H:%M:%S")

# Generate histogram
png(file = "plot1.png")
hist(datafebr$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")
dev.off()
