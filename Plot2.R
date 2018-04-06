setwd("D:/Study/Coursera/4_Exploratory Data Analysis/Week 1/ExData_Plotting1")

#read csv
householdfull <- read.csv("../household_power_consumption.txt", sep = ";" ,stringsAsFactors = FALSE, na.strings = c("?"))
names(householdfull)

#We will only be using data from the dates 2007-02-01 and 2007-02-02
#subset only "1/2/2007" and "2/2/2007"
household <- subset(householdfull, Date %in% c("1/2/2007","2/2/2007") )
head(household)

#We need to plot on Date time Vs Global_active_power . This needs to additional steps
       #1. Make the Date value to POSIXlt
#First we merge the Date and Time to a single variable
household$DateTime <- paste(household$Date, household$Time, sep = " ")
#Then we make it to Timestamp
household$DateTime <- strptime(household$DateTime, format =  "%d/%m/%Y %H:%M:%S")
#check the class of DateTime
class(household$DateTime)
        #2. Change Global_active_power as numeric class
household$Global_active_power <- as.numeric(household$Global_active_power)


#now plot the graph
png("plot2.png", width=480, height=480)
plot(household$DateTime, household$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",  type="s")
#save the chart to png file
dev.off()