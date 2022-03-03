
#Loading the project file from the same directory
data_file <- read.csv("household_power_consumption.txt", sep = ";" ,header = TRUE, na.strings = "?")
st <- paste(data_file$Date, data_file$Time)
dd <- strptime(st, "%d/%m/%Y %H:%M:%S")
data_file$Date_Time <- dd


#Choosing to format date and time together to account for time of the day in the plot

req_data <- subset(data_file, (Date_Time >= "2007-02-01") & (Date_Time <= "2007-02-03"))


png(filename = "plot3.png", width = 480, height = 480)       #a bitmap format


plot(req_data$Date_Time, req_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering",type = "l")
lines(req_data$Date_Time, req_data$Sub_metering_2,col = "red", lty = 1, lwd = 1,type = "l")
lines(req_data$Date_Time, req_data$Sub_metering_3, col = "blue", lty = 1, lwd = 1, type = "l")

legend("topright", legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), 
       lty = c(1,1,1), lwd = c(1,1,1) , col = c("black", "red", "blue") )


dev.off()
