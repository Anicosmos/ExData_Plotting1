
#Loading the project file from the same directory
data_file <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")
st <- paste(data_file$Date, data_file$Time)
dd <- strptime(st, "%d/%m/%Y %H:%M:%S")
data_file$Date_Time <- dd

## Along the Timeline
req_data <- subset(data_file, (Date_Time >= "2007-02-01") & (Date_Time <= "2007-02-03"))


#Choosing to format date and time together to account for time of the day in the plot


png(filename = "plot2.png", width = 480, height = 480)       # As Specified in the Problem


plot(req_data$Date_Time, req_data$Global_active_power, type = "l", 
     main = "Global Active Power", xlab = "", ylab="Global Active Power (kilowatts)")


dev.off()

