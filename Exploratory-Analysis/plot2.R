library(dplyr)

# Load data
projectdata <- read.csv2("household_power_consumption.txt", dec = ".", na.strings = "?")

# Get Feb data only
datafebr <- filter(projectdata, Date == "1/2/2007" | Date == "2/2/2007" )

# New date&time column added
datafebr$Timestamp <- paste(datafebr$Date, datafebr$Time, sep = " ")
datafebr$Timestamp <- strptime(datafebr$Timestamp, format = "%d/%m/%Y %H:%M:%S")

# Plot it
png(file = "plot2.png")
plot(x = datafebr$Timestamp, y = datafebr$Global_active_power, type="n", xlab = "", ylab = "Global active power (kilowatts)")
lines(x = datafebr$Timestamp, y = datafebr$Global_active_power)
dev.off()
