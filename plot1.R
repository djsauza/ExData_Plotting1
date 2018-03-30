
#Plot 1: histogram of global active power
#Assumes the downloaded text file is in the working directory

#Assign the data file to a dataframe
data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#combine the date and time columns into a single string
data$full_date <- paste(data$Date, data$Time, sep = "-")

#Convert date and time into a real date and time
data$full_date <- as.POSIXct(data$full_date, format = "%d/%m/%Y-%H:%M:%S")

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

#Generate Plot 1
hist(range.data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Save Plot 1 as png
png("plot1.png", width = 400, height = 400)
hist(range.data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()



