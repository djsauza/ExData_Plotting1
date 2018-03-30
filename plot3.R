#Plot 3: Energy metering vs time
#Assumes the downloaded text file is in the working directory

#Assign the data file to a dataframe
data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#combine the date and time columns into a single string
data$date.time <- paste(data$Date, data$Time, sep = "-")

#Convert date and time into a real date and time
data$date.time <- as.POSIXct(data$full_date, format = "%d/%m/%Y-%H:%M:%S")

#Convert chr date into a real date
data$Date <- as.POSIXct(data$Date, format = "%d/%m/%Y")

#filter the desired dates
range.data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")


#set the data to numeric
range.data$Global_active_power <- as.numeric(range.data$Global_active_power)
range.data$Global_reactive_power <- as.numeric(range.data$Global_reactive_power)
range.data$Sub_metering_1 <- as.numeric(range.data$Sub_metering_1)
range.data$Sub_metering_2 <- as.numeric(range.data$Sub_metering_2)
range.data$Voltage <- as.numeric(range.data$Voltage)

#Generate Plot 3
plot(range.data$date.time, range.data$Sub_metering_1, type = "l", ylab = "Energy sub meeting", xlab = "") 
lines(range.data$date.time, range.data$Sub_metering_2, type = "l", col = "red") 
lines(range.data$date.time, range.data$Sub_metering_3, type = "l", col = "blue")

#Save Plot 3
png("plot3.png", width = 400, height = 400)
plot(range.data$date.time, range.data$Sub_metering_1, type = "l", ylab = "Energy sub meeting", xlab = "") 
lines(range.data$date.time, range.data$Sub_metering_2, type = "l", col = "red") 
lines(range.data$date.time, range.data$Sub_metering_3, type = "l", col = "blue")
dev.off()
