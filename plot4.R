
#Loading the project file from the same directory
data_file <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
st <- paste(data_file$Date, data_file$Time)
dd <- strptime(st, "%d/%m/%Y %H:%M:%S")
data_file$Date_Time <- dd


#Choosing to format date and time together to account for time of the day in the plot

req_data <- subset(data_file, (Date_Time >= "2007-02-01") & (Date_Time <= "2007-02-03"))


png(filename = "plot4.png", width = 480, height = 480)       #As Specified in the Problem


par(mfrow = c(2,2), cex = 0.8)
plot(req_data$Date_Time, req_data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(req_data$Date_Time, req_data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(req_data$Date_Time, req_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(req_data$Date_Time, req_data$Sub_metering_2, lty = 1, lwd = 1, col = "red", type = "l")
lines(req_data$Date_Time, req_data$Sub_metering_3, lty = 1, lwd = 1, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 ") 
       , lty = c(1,1,1), lwd = c(1,1,1), bty = "n", cex = 0.9,col = c("black", "red", "blue"))
plot(req_data$Date_Time, req_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()