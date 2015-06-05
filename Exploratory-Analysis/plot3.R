library(dplyr)

# Reading data
projectdata <- read.csv2("household_power_consumption.txt", dec = ".", na.strings = "?")

# Get only appropriate dates
datafebr <- filter(projectdata, Date == "1/2/2007" | Date == "2/2/2007" )

# Make new column with Date and Time converted to Date/time
datafebr$Timestamp <- paste(datafebr$Date, datafebr$Time, sep = " ")
datafebr$Timestamp <- strptime(datafebr$Timestamp, format = "%d/%m/%Y %H:%M:%S")

# Create plot
png(file = "plot3.png")
with(datafebr, plot(Timestamp, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub mettering"))
with(datafebr, lines(Timestamp, Sub_metering_1, col = "black"))
with(datafebr, lines(Timestamp, Sub_metering_2, col = "red"))
with(datafebr, lines(Timestamp, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"), )
dev.off()
