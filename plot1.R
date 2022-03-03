
#Loading the project file from the same directory
data_file <- read.csv("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
s <- as.Date(data_file$Date, "%d/%m/%Y")
data_file$Date <- s

req_data <- subset(data_file, (Date >= "2007-02-01") & (Date <= "2007-02-02"))


png(filename = "plot1.png", width = 480, height = 480)       

## Plotting the Histogram 
hist(req_data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.off()
