# read data
power <- read.csv("household_power_consumption.txt",
                  sep = ";",
                  colClasses = c(rep("character", 2), rep("numeric", 7)),
                  na.strings = "?")
# convert Date and Time strings to proper Date / Time classes
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# subset data for dates 2007-02-01 and 2007-02-02
pow_for_plots <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

# make the plot and save it as PNG
png(filename = "plot1.png", width = 480, height = 480)
hist(pow_for_plots$Global_active_power, col = "red")
dev.off()