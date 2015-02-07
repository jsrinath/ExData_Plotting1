######### Read in zip file #########
data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

######### Clean data #########
# Change the format of Date variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data for the two dates of interest
data_subset <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

# Convert Date_Time variable to proper format
data_subset$Date_Time <- paste(data_subset$Date, data_subset$Time)
data_subset$Date_Time <- strptime(data_subset$Date_Time, format="%Y-%m-%d %H:%M:%S")

######### Plot 2 #########

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(6, 6, 5, 4))

plot(data_subset$Date_Time, data_subset$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
# type = "n" builds plots without points
# xaxt = NULL suppresses x axis
# xlab = "" removes the label from the x axis
# otherwise, the axis is the name of the x variable, which is date_time

lines(data_subset$Date_Time, data_subset$Global_active_power, type="S")
dev.off()