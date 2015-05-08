# Coursera - Exploratory Analysis
# Course Project 1 - Plot 2
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
png(file = "plot2.png",
    width = 480,
    height = 480
)

# Convert the Date variables to Date class
twoDays[,"Date"] <- as.Date(twoDays[,"Date"], "%d/%m/%Y")

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


# Close device png
dev.off()
