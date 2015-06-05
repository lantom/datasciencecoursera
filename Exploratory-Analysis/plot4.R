library(dplyr)

# Reading data
projectdata <- read.csv2("household_power_consumption.txt", dec = ".", na.strings = "?")

# Get only appropriate dates
datafebr <- filter(projectdata, Date == "1/2/2007" | Date == "2/2/2007" )

# Make new column with Date and Time converted to Date/time
datafebr$Timestamp <- paste(datafebr$Date, datafebr$Time, sep = " ")
datafebr$Timestamp <- strptime(datafebr$Timestamp, format = "%d/%m/%Y %H:%M:%S")

# Plot it
png(file = "plot4.png")
par(mfcol = c(2, 2))

with(datafebr, { 
  
 plot(Timestamp, Global_active_power, type="n", xlab = "", ylab = "Global active power (kilowatts)")
 lines(x = datafebr$Timestamp, y = datafebr$Global_active_power)

 plot(Timestamp, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub mettering")
 lines(Timestamp, Sub_metering_1, col = "black")
 lines(Timestamp, Sub_metering_2, col = "red")
 lines(Timestamp, Sub_metering_3, col = "blue")
 legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"),cex = .50, bty = "n")
 
 plot(datafebr$Timestamp, datafebr$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
 lines(x = datafebr$Timestamp, y=datafebr$Voltage)
 
 plot(datafebr$Timestamp, datafebr$Global_reactive_power, xlab = "datetime", ylab = "Global reactive power", type = "n")
 lines(x = datafebr$Timestamp, y=datafebr$Global_reactive_power)
 
 })

dev.off()
