# Coursera - Exploratory Analysis
# Course Project 1 - Plot 1
# Panagiotis Zacharis

filename = "household_power_consumption.txt"

# Read data - Warning: Table 2,075,259 by 9
data <- read.table(filename, 
                   header = TRUE,??
                   sep= ";",
                   na.strings = "?"
)

# Subset the required dates
twoDays <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open device png
png(file = "plot1.png",
    width = 480,
    height = 480
)

# Plot histogram
hist(twoDays$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power"
)

# Close device png
dev.off()
