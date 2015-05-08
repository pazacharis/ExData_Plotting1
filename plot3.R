# Coursera - Exploratory Analysis
# Course Project 1 - Plot 3
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
png(file = "plot3.png",
    width = 480,
    height = 480
)

# submeterings
# Set a fixed limit for the y-axis
ylimit <- sort(c(range(twoDays$Sub_metering_1), 
                 range(twoDays$Sub_metering_2), 
                 range(twoDays$Sub_metering_3)), 
               decreasing = TRUE)

# Keep the largest and smallest value
ylimit <- c(tail(ylimit, n=1), ylimit[1])

# Plot for Sub_metering_1
plot(twoDays$Sub_metering_1, 
     type="l",
     ylim=ylimit, 
     ylab = "Energy sub metering",  
     xaxt="n", 
     xlab="" 
)

# Plot for Sub_metering_2
par(new = TRUE)
plot(twoDays$Sub_metering_2, 
     type="l", 
     ylim=ylimit, 
     axes = FALSE, 
     xlab = "", 
     ylab = "", 
     col="red"
)

# Plot for Sub_metering_3
par(new = TRUE)
plot(twoDays$Sub_metering_3, 
     type="l", 
     ylim=ylimit, 
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
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col=c("black","red","blue"), 
        lwd=1, lty=c(1,1,1)
)

# Close device png
dev.off()