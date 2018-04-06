setwd("D:/Study/Coursera/4_Exploratory Data Analysis/Week 1/ExData_Plotting1")

#read csv
householdfull <- read.csv("../household_power_consumption.txt", sep = ";" ,stringsAsFactors = FALSE, na.strings = c("?"))
names(householdfull)

#We will only be using data from the dates 2007-02-01 and 2007-02-02
#subset only "1/2/2007" and "2/2/2007"
household <- subset(householdfull, Date %in% c("1/2/2007","2/2/2007") )
head(household)

#We need to plot 4 charts This needs to additional steps
       #1. Make the Date value to POSIXlt
#First we merge the Date and Time to a single variable
household$DateTime <- paste(household$Date, household$Time, sep = " ")
#Then we make it to Timestamp
household$DateTime <- strptime(household$DateTime, format =  "%d/%m/%Y %H:%M:%S")
#check the class of DateTime
class(household$DateTime)
        #2. Change Global_active_power as numeric class
household$Global_active_power <- as.numeric(household$Global_active_power)
        #3. Change sub metering readings as numeric class
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)
        #4. Change Voltage as numeric
household$Voltage <- as.numeric(household$Voltage)
        #. Change Global_reactive_power as numeric
household$Global_reactive_power <- as.numeric(household$Global_reactive_power)

#now plot the graph and save to png
png("plot4.png", width=480, height=480)
    #create a 2X2 frame for 4 plots
    par(mfrow = c(2, 2))

    
    plot(household$DateTime, household$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
    plot(household$DateTime, household$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(household$DateTime, household$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
    lines(household$DateTime, household$Sub_metering_2, type="l", col="red")
    lines(household$DateTime, household$Sub_metering_3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
    plot(household$DateTime, household$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    
dev.off()