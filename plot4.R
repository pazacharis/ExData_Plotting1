# Coursera - Exploratory Analysis
# Course Project 1 - Plot 4
# Panagiotis Zacharis

filename = "household_power_consumption.txt"

# Read data - Warning: Table 2,075,259 by 9
data <- read.table(filename, 
                   header = TRUE,
                   sep= ";",
                   na.strings = "?"
)

# Subset the required dates
twoDays <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open device png
png(file = "plot4.png",
    width = 480,
    height = 480
)

par(mfrow = c(2,2))
# plot at [1,1]
plot(twoDays$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xaxt="n",
     xlab=""
)

axis(1, 
     at=c(1,1440,2880),
     lab=c("Thu","Fri","Sat")
)

# plot at [1,2]
plot(twoDays$Voltage, 
     type = "l",
     ylab = "Voltage",
     xaxt="n",
     xlab="datetime"
)

axis(1, 
     at=c(1,1440,2880),
     lab=c("Thu","Fri","Sat")
)

# plot at [2,1]
# submeterings

# first plot
plot(twoDays$Sub_metering_1, 
     type="l",
     ylim=range(twoDays$Sub_metering_1),
     ylab = "Energy sub metering",
     xaxt="n",
     xlab=""
)

# second plot  EDIT: needs to have same ylim
par(new = TRUE)
plot(twoDays$Sub_metering_2, 
     type="l",
     ylim=range(twoDays$Sub_metering_1),
     axes = FALSE,
     xlab = "",
     ylab = "",
     col="red"
)

# third plot
par(new = TRUE)
plot(twoDays$Sub_metering_3,
     type="l",
     ylim=range(twoDays$Sub_metering_1), 
     axes = FALSE,
     xlab = "",
     ylab = "",
     col="blue"
)

axis(1,
     at=c(1,1440,2880),
     lab=c("Thu","Fri","Sat")
)

legend( x="topright", 
        legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
        col=c("black","red","blue"), 
        lwd=1, 
        lty=c(1,1,1)
)

# plot at [2,2]
plot(twoDays$Global_reactive_power, 
     type = "l",
     ylab = "Global_reactive_power",
     xaxt="n",
     xlab="datetime"
)

axis(1, 
     at=c(1,1440,2880),
     lab=c("Thu","Fri","Sat")
)

# Close device png
dev.off()