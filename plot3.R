# set locale to get English names for weekdays
Sys.setlocale(category = "LC_TIME", locale = "en_US")

# read data
power <- read.csv("household_power_consumption.txt",
                  sep = ";",
                  colClasses = c(rep("character", 2), rep("numeric", 7)),
                  na.strings = "?")
# convert Date and Time strings to proper Date / Time classes
# Time needs to be POSIXct -- looks like POSIXlt doesn't work with plots
power$Time <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# subset data for dates 2007-02-01 and 2007-02-02
pow_for_plots <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

# make the plot and save it as PNG
png(filename = "plot3.png", width = 480, height = 480)
plot(Sub_metering_1 ~ Time,
     data = pow_for_plots,
     type = "l",    # draw as line
     ylab = "Energy sub metering")
lines(Sub_metering_2 ~ Time, data = pow_for_plots, col = "red")
lines(Sub_metering_3 ~ Time, data = pow_for_plots, col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,    # show lines to legend
       col = c("black", "red", "blue"))
dev.off()